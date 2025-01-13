--==========================================================================================================================
--<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
include("Civ6Common.lua")
include("AdjacencyBonusSupport.lua")
--==========================================================================================================================
--<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
--==========================================================================================================================
--print("Haiti Functions Loaded")
--==========================================================================================================================
-- Variables
--==========================================================================================================================

local iCivTrait = "TRAIT_CIVILIZATION_LEU_HAITI"
-- Early Policies from Eras
local iNumEraPolicies = 4
local iNumHeroicEraPolicies = 4
-- Faith from Era Score
local iNumFaith = 10 
local iNumFaithDark = 15 
-- Charges to 1 Era Score
local iProject = "PROJECT_LEU_ABOLITION"
local iNumChargesRequired = 1
-- Louverture's Loyalty Reducer
local iLeaderTrait = "TRAIT_LEADER_LEU_LOUVERTURE"
local iRadius = 20
local iLoyaltyperUnit = -5
-- Louverture's Envoys
local iNumBuildersRequired = 2
-- Louverture's Builder on Pillage

--==========================================================================================================================
--==========================================================================================================================
--<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
--==========================================================================================================================
--==========================================================================================================================
--<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
--==========================================================================================================================
--==========================================================================================================================
--<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
--==========================================================================================================================
--==========================================================================================================================
--<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
--==========================================================================================================================
--==========================================================================================================================
--<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
--==========================================================================================================================
--==========================================================================================================================
--<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
--==========================================================================================================================
--==========================================================================================================================
--<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
--==========================================================================================================================
--==========================================================================================================================
--<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
--==========================================================================================================================
--==========================================================================================================================
--<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
--==========================================================================================================================
--==========================================================================================================================
--<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
--==========================================================================================================================
--==========================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================
-- UTILS
----------------------------------------------------------------------------------------------------------------------------
--Chrisy's Valid Trait getter
function C15_GetValidTraitPlayersNew(sTrait)
    local tValid = {}
    for k, v in ipairs(PlayerManager.GetWasEverAliveIDs()) do
        local leaderType = PlayerConfigurations[v]:GetLeaderTypeName()
        for trait in GameInfo.LeaderTraits() do
            if trait.LeaderType == leaderType and trait.TraitType == sTrait then 
                tValid[v] = true 
            end;
        end
        if not tValid[v] then
            local civType = PlayerConfigurations[v]:GetCivilizationTypeName()
            for trait in GameInfo.CivilizationTraits() do
                if trait.CivilizationType == civType and trait.TraitType == sTrait then 
                    tValid[v] = true 
                end;
            end
        end
    end
    return tValid
end
----------------------------------------------------------------------------------------------------------------------------
-- Suk 's Get Random
function GetRandom(iLower, iUpper, sReason)
    return Game.GetRandNum((iUpper + 1) - iLower, sReason) + iLower
end

----------------------------------------------------------------------------------------------------------------------------
GameEra = nil
GameEraName = nil
function Leu_Haiti_Era_Found(currentEra, currentEraName)
	GameEra = currentEra
	GameEraName0 = string.gsub("" .. currentEraName .. "", "LOC_", "")
	GameEraName = string.gsub("" .. GameEraName0 .. "", "_NAME", "")
	--print(GameEra)
	--print(GameEraName)
end
LuaEvents.Leu_Haiti_Era_Found.Add(Leu_Haiti_Era_Found)

Age = nil
Age_EraScore = nil
function Leu_Haiti_GetAge(iCurrentEraScore, AgeType)
	Age = AgeType
	Age_EraScore = iCurrentEraScore
end
LuaEvents.Leu_Haiti_GetAge.Add(Leu_Haiti_GetAge)

--==========================================================================================================================
-- CORE FUNCTIONS
--==========================================================================================================================
--Era Score from Builder Charges on Project
----------------------------------------------
local tValidCiv = C15_GetValidTraitPlayersNew(iCivTrait)
local tValidLeader = C15_GetValidTraitPlayersNew(iLeaderTrait)

local unitBuilderID		 = GameInfo.Units["UNIT_BUILDER"].Index		
local projectAbolitionID = GameInfo.Projects["" .. iProject .. ""].Index

function Leu_Haiti_CityProjectCompleted(playerID, cityID, projectID, buildingID, locX, locY, bCanceled)
	if bCanceled then return end
	--print("Project not cancelled")
	local player = Players[playerID]
	local playerConfig = PlayerConfigurations[playerID]
	local city = player:GetCities():FindID(cityID)
	if (not city) then return end
	--HAITI
	if not tValidCiv[playerID] then return end
	--print("Project by Haiti")
	if projectID ~= projectAbolitionID then return end	 
	print("Project is Abolition")
	unitcount = 0
	totalEraScore = 0
	totalCharges = 0
	for _, unit in player:GetUnits():Members() do
		if unit:GetType() == unitBuilderID then
			---
			--print("Builder")
			local unitX = unit:GetX()
			local unitY = unit:GetY()
			local plot = Map.GetPlot(unitX, unitY)
			local owner = WorldBuilder.CityManager():GetPlotOwner(plot);
			if owner ~= nil then
			if owner.CityID == cityID then
				---
				unitcount = unitcount + 1
				LuaEvents.Leu_AbolitionProjectCompleted(playerID, unit)
				--print("Builder found on the city")
			end
			end
		end
	end
	-------------------------
	-- Louverture's Ability
	-------------------------
	
		if tValidLeader[playerID] then
			player:GetCulture():SetCivicCompletedThisTurn(true)
			--Leu_Haiti_Louverture_Minus_Loyalty(player, unitcount, locX, locY)
			--local iEnvoys = math.floor(unitcount/iNumBuildersRequired)
			--player:GetInfluence():GiveFreeTokenToPlayer(iEnvoys)
		end

	-------------------------
	if totalCharges > 0 then
		totalEraScore = math.floor(totalCharges/iNumChargesRequired)
	end
	if totalEraScore > 0 then
		Game.ChangePlayerEraScore(playerID, totalEraScore)
		if Game.GetLocalPlayer() == playerID then
			LuaEvents.Custom_StatusMessage(Locale.Lookup("LOC_STATUS_HAITI_ABOLITION", unitcount, totalEraScore), 6, ReportingStatusTypes.DEFAULT)
		end
	end		
end
Events.CityProjectCompleted.Add(Leu_Haiti_CityProjectCompleted)

function Leu_Haiti_Louverture_Minus_Loyalty(iPlayer, unitcount, locX, locY)
	iPlayer:GetCulture():SetCivicCompletedThisTurn(true)
	--print("GettingCloseCity")
	if unitcount == 0 then return end
	for dx = (iRadius * -1), iRadius do
		for dy = (iRadius * -1), iRadius do
			local cPlot = Map.GetPlotXYWithRangeCheck(locX, locY, dx, dy, iRadius);
			--print("Checking a Plot")
			if cPlot == nil then --print("Plot is NIL") 
			end
			if cPlot ~= nil then 
				--print("Plot is not NIL")
				if cPlot:GetDistrictType() == GameInfo.Districts["DISTRICT_CITY_CENTER"].Index then
					--print("Found a City Plot!")
					if not cPlot:GetOwner() == iPlayer then
						--print("The owner is evil")
						iCity=Cities.GetCityInPlot(cPlot:GetX(), cPlot:GetY());
						iLoyaltyBurst = unitcount * iLoyaltyperUnit
						iCity:ChangeLoyalty(iLoyaltyBurst)
						--print("Reduced foreign city loyalty by" .. iLoyaltyBurst .. "")
						Game.AddWorldViewText(playerID, Locale.Lookup("[COLOR_FLOAT_MILITARY]{1_Num} LoyaLty[ENDCOLOR]", iLoyaltyBurst), iCity:GetX(), iCity:GetY(), 0)
					end
				end
			end
		end
	end
end

function Leu_Haiti_AbolitionUnitFound(playerID, unit, unitCharges)
	--print("We are Here")
	--print(unitCharges)
	local player = Players[playerID]
	local unitX = unit:GetX()
	local unitY = unit:GetY()
	player:GetUnits():Destroy(unit)
	Game.AddWorldViewText(player, Locale.Lookup("LOC_FLOAT_HAITI_ERA_SCORE", unitCharges), unitX, unitY, 0)
	--Game.ChangePlayerEraScore(playerID, iEraScore)
	totalCharges = totalCharges + unitCharges
end
LuaEvents.Leu_Haiti_AbolitionUnitFound.Add(Leu_Haiti_AbolitionUnitFound)


---------------------------------------------
--Random Policy unlock on new Era
----------------------------------------------
-- preparing the Policy and Era table
----------------------------------------------
tCivicEras = {}
for row in GameInfo.Civics() do
	local iCivicType = row.CivicType
	local iEraType = row.EraType
	tCivicEras[iCivicType] = iEraType	
end

tTechEras = {}
for row in GameInfo.Technologies() do
	local iTechType = row.TechnologyType
	local iEraType = row.EraType
	tTechEras[iTechType] = iEraType	
end

tPolicyEras = {}
tNumPolicies = 0
for row in GameInfo.Policies() do
	if row.PrereqCivic then
		tNumPolicies = tNumPolicies + 1
		local iPrereq = row.PrereqCivic
		local iType = row.PolicyType
		tPolicyEras[tNumPolicies] = {iPolicyType = iType, iPolicyEraType = tCivicEras[iPrereq]}
	end
	if row.PrereqTech then
		tNumPolicies = tNumPolicies + 1
		local iPrereq = row.PrereqTech
		local iType = row.PolicyType
		tPolicyEras[tNumPolicies] = {iPolicyType = iType, iPolicyEraType = tTechEras[iPrereq]}
	end
end
print("Total Policies checked for Eras = " .. tNumPolicies .. "")

function OnTurnActivatedEraCheck(iPlayer, bIsFirstTime)
	if not bIsFirstTime then return end
	local player = Players[iPlayer]
	-- Check if its our required player
	if not tValidCiv[iPlayer] then return end
	--
	LuaEvents.Leu_Haiti_GetEra()
	if GameEra == nil then return end
	--
	loadEra = Game.GetProperty(iPlayer .. "Era")
	Game.SetProperty(iPlayer .. "Era", GameEra)
	if loadEra == nil then return end
	if GameEra == 0 then return end
	if GameEra == loadEra then return end
	--print("The Player has entered a new ERA")
	LuaEvents.Leu_Haiti_GetAge_PRE(player)
	isHeroicEra = false
	if Age == "AGE_HEROIC" then
		--print("The Player has entered a HEROIC ERA")
		isHeroicEra = true
	end
	--local EraType = GameInfo.Eras[currentEra].EraType
	--
	-- Getting the valid Policies
	local tPolicies = {}
	local NumValidPolicies = 0
	--print("Era Name = " .. GameEraName .. "")
	iPolicyCheck = 0
	while iPolicyCheck < tNumPolicies do
		iPolicyCheck = iPolicyCheck + 1
		PolicyType = tPolicyEras[iPolicyCheck].iPolicyType
		PolicyEra = tPolicyEras[iPolicyCheck].iPolicyEraType
		if PolicyEra == GameEraName then
			print("The following policy is on the right era")
			if not player:GetCulture():IsPolicyUnlocked(GameInfo.Policies[PolicyType].Index) then
				print("" .. PolicyType .. " is valid and unearned!")
				NumValidPolicies = NumValidPolicies + 1
				tPolicies[NumValidPolicies] = PolicyType
			end
		end
	end
	
	
	--for row in GameInfo.Leu_PolicyEras() do
	--	if row.EraType == GameEraName then
	--		if not player:GetCulture():IsPolicyUnlocked(GameInfo.Policies[row.PolicyType].Index) then
	--			--print("Found a valid policy:" .. row.PolicyType .. "")
	--			NumValidPolicies = NumValidPolicies + 1
	--			tPolicies[NumValidPolicies] = row.PolicyType				
	--		end
	--	end
	--end


	--
	if NumValidPolicies == 0 then return end
	if isHeroicEra == true then totalPolicies = iNumEraPolicies + iNumHeroicEraPolicies else totalPolicies =iNumEraPolicies end
	iCurrentPolicies = 0
	while iCurrentPolicies < totalPolicies do
	---	
		local iPolicy = nil
		local iRandPersis = -1
		while iPolicy == nil do 
			--print (NumValidPolicies)
			if NumValidPolicies == 1 then iRand = 1 else
			iRand = GetRandom(1, NumValidPolicies) end
			--print (iRand)
			iPolicy = tPolicies[iRand]
			--print (iPolicy)
			--print("Adding " .. iPolicy .. " to Haiti")
			iRandPersis = iRand
		end
		if not player:GetCulture():IsPolicyUnlocked(GameInfo.Policies[iPolicy].Index) then
			player:GetCulture():UnlockPolicy(GameInfo.Policies[iPolicy].Index)
			iCurrentPolicies = iCurrentPolicies + 1
			--print("Granted a free policy (" .. iCurrentPolicies .. ")")
		end
	--
	end
	if iCurrentPolicies == 0 then return end
	if Game.GetLocalPlayer() == iPlayer then
		LuaEvents.Custom_StatusMessage(Locale.Lookup("LOC_STATUS_HAITI_TRAIT", iCurrentPolicies), 6, ReportingStatusTypes.DEFAULT)
	end
end

Events.PlayerTurnActivated.Add(OnTurnActivatedEraCheck)
---------------------------------------------
--Faith on Dark Age Era Score
----------------------------------------------
function OnTurnActivatedEraScoreCheck(iPlayer, bIsFirstTime)
	if not bIsFirstTime then return end
	local player = Players[iPlayer]
	-- Check if its our required player
	local playerConfig = PlayerConfigurations[iPlayer]
	local civType = playerConfig:GetCivilizationTypeName()
	if not tValidCiv[iPlayer] then return end
	--
	LuaEvents.Leu_Haiti_GetAge_PRE(player)
	--print("Current Era Score: " .. Age_EraScore .. "")
	--print("Current Age type: " .. Age .. "")
	--
	loadEraScore = Game.GetProperty(iPlayer .. "EraScore")
	if loadEraScore == nil then loadEraScore = 0 end
	--print(loadEraScore)
	Game.SetProperty(iPlayer .. "EraScore", Age_EraScore)
	iTotalFaith = iNumFaith
	if Age == "AGE_DARK" then iTotalFaith = iNumFaith + iNumFaithDark end
	if Age_EraScore == loadEraScore then return end
	ScoreDifference = Age_EraScore - loadEraScore
	FaithBonus = ScoreDifference * iTotalFaith
	player:GetReligion():ChangeFaithBalance(FaithBonus)
	--print(FaithBonus .. " Faith Granted" .. "")
	if Game.GetLocalPlayer() == iPlayer then
		--print("showing status message")
		if Age == "AGE_DARK" then
			LuaEvents.Custom_StatusMessage(Locale.Lookup("LOC_STATUS_HAITI_ERA_FAITH_DARK_AGE", FaithBonus), 6, ReportingStatusTypes.DEFAULT)
		else
			LuaEvents.Custom_StatusMessage(Locale.Lookup("LOC_STATUS_HAITI_ERA_FAITH", FaithBonus), 6, ReportingStatusTypes.DEFAULT)
		end
	end
end

Events.PlayerTurnActivated.Add(OnTurnActivatedEraScoreCheck)

---------------------------------------------------
-- Builders on Pillage
---------------------------------------------------
function Haiti_OnPillage(UnitOwner, UnitId, ImprovementType, BuildingType)
	--print("Tile Pillaged")
	local player = Players[UnitOwner];
	if not tValidLeader[UnitOwner] then return end
	--print("Tile Pillaged by Louverture")
	local unit = player:GetUnits():FindID(UnitId);
	local unitX = unit:GetX()
	local unitY = unit:GetY()
	iValidResources = {}
	NumValidResources = 0
	for row in GameInfo.Resources() do
		if  row.ResourceClassType == "RESOURCECLASS_LUXURY" then
			--print(row.ResourceType)
			NumValidResources = NumValidResources + 1
			iValidResources[NumValidResources] = row.ResourceType
		end
	end
	local plot = Map.GetPlot(unitX, unitY)
	local plotResource = plot:GetResourceType()		
	for k, NumValidResources in ipairs(iValidResources) do
		local ResourceCheck = iValidResources[k]
		--print("Checking:" .. ResourceCheck .. "") 
		if plotResource == GameInfo.Resources[ResourceCheck].Index then
			--print("Luxury Found")
			UnitManager.InitUnit(player, "UNIT_BUILDER", unitX, unitY);
			Game.AddWorldViewText(player, Locale.Lookup("LOC_FLOAT_HAITI_FREE_BUILDER"), unitX, unitY, 0)
			return
		end
	end		
end

GameEvents.OnPillage.Add(Haiti_OnPillage)
--==========================================================================================================================
--==========================================================================================================================