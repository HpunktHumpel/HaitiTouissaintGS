LuaEvents = ExposedMembers.LuaEvents
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
include("Civ6Common.lua")
--==========================================================================================================================
--<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
--==========================================================================================================================

--==========================================================================================================================
-- Variables
--==========================================================================================================================

local debug = false

--==========================================================================================================================
--<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
--==========================================================================================================================

if (debug) then print("Haiti UI functions loaded (Debug mode enabled)")
else print("Haiti UI functions loaded")
end


--==========================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================
--==========================================================================================================================
-- CORE FUNCTIONS
--==========================================================================================================================
-- GLOBALS
----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

--Leu_Haiti_AbolitionProjectCompleted
function Leu_Haiti_AbolitionProjectCompleted(playerID, unit)
  if (debug) then print("Leu_Haiti_AbolitionProjectCompleted") end
	local unitCharges = unit:GetBuildCharges()
	if (debug) then print(" - Found unit with Builder Charges: " .. unitCharges .. "") end
	LuaEvents.Leu_Haiti_AbolitionUnitFound(playerID, unit, unitCharges)
end
LuaEvents.Leu_AbolitionProjectCompleted.Add(Leu_Haiti_AbolitionProjectCompleted)


function Leu_Haiti_GetEra()
  if (debug) then print("Leu_Haiti_GetEra") end
	local currentEra:number = Game.GetEras():GetCurrentEra();
	local currentEraName:string = GameInfo.Eras[currentEra].Name
	LuaEvents.Leu_Haiti_Era_Found(currentEra, currentEraName)
end
LuaEvents.Leu_Haiti_GetEra.Add(Leu_Haiti_GetEra)


function Leu_Haiti_GetAge_PRE(localPlayer)
  if (debug) then print("Leu_Haiti_GetAge_PRE") end
	--print("Aight lads, here we go")
	AgeType = nil
	local eraTable:table = Game.GetEras();
  if (debug) then print(" - Current Score: " .. Game.GetEras():GetPlayerCurrentScore(localPlayer) .. "") end
	if eraTable:HasHeroicGoldenAge(localPlayer) then
		AgeType = "AGE_HEROIC"
	elseif eraTable:HasGoldenAge(localPlayer) then
		AgeType = "AGE_GOLDEN"
	elseif eraTable:HasDarkAge(localPlayer) then
		AgeType = "AGE_DARK"
	else
		AgeType = "AGE_NORMAL"
	end
	iCurrentEraScore = Game.GetEras():GetPlayerCurrentScore(localPlayer);
	LuaEvents.Leu_Haiti_GetAge(iCurrentEraScore, AgeType)
end
LuaEvents.Leu_Haiti_GetAge_PRE.Add(Leu_Haiti_GetAge_PRE)

--==========================================================================================================================
--==========================================================================================================================
