--==========================================================================================================================
-- DISTRICTS
--==========================================================================================================================
-- Types
-------------------------------------	
INSERT INTO Types	
		(Type,								Kind)
VALUES	('DISTRICT_LEU_CITADELLE',			'KIND_DISTRICT'),
		('TRAIT_DISTRICT_LEU_CITADELLE',	'KIND_TRAIT'),
		('PROJECT_LEU_ABOLITION',			'KIND_PROJECT');

-------------------------------------
-- Traits			
-------------------------------------				
INSERT INTO Traits				
		(TraitType,								Name,									Description)
VALUES	('TRAIT_DISTRICT_LEU_CITADELLE',		'LOC_DISTRICT_LEU_CITADELLE_NAME',		'LOC_DISTRICT_LEU_CITADELLE_DESCRIPTION');

-------------------------------------
-- CivilizationTraits
-------------------------------------	
INSERT INTO CivilizationTraits	
		(TraitType,									CivilizationType)
VALUES	('TRAIT_DISTRICT_LEU_CITADELLE',			'CIVILIZATION_LEU_HAITI');

---------------------------------------
-- MomentIllustrations
---------------------------------------
INSERT INTO MomentIllustrations
		(MomentIllustrationType,					MomentDataType,				GameDataType,				Texture)
VALUES	('MOMENT_ILLUSTRATION_UNIQUE_DISTRICT',		'MOMENT_DATA_DISTRICT',		'DISTRICT_LEU_CITADELLE',	'HM_LEU_CITADELLE.dds');


------------------------------------------------------------------------------------
-- Districts
-----------------------------------------------------------------------------------
INSERT INTO Districts
			(DistrictType,					Name,									Description,									TraitType,							Cost,		PrereqTech,		PlunderType,		PlunderAmount,		AdvisorType,		CostProgressionModel,		CostProgressionParam1,		RequiresPlacement,		RequiresPopulation,		NoAdjacentCity,		InternalOnly,		ZOC,		CaptureRemovesBuildings,		CaptureRemovesCityDefenses,		MilitaryDomain,		TravelTime,		CityStrengthModifier,	Housing,	OnePerCity,		HitPoints,	Maintenance,	Appeal,	Aqueduct)
SELECT		'DISTRICT_LEU_CITADELLE',		'LOC_DISTRICT_LEU_CITADELLE_NAME',		'LOC_DISTRICT_LEU_CITADELLE_DESCRIPTION',		'TRAIT_DISTRICT_LEU_CITADELLE',		Cost/2,		PrereqTech,		PlunderType,		PlunderAmount,		AdvisorType,		CostProgressionModel,		CostProgressionParam1,		RequiresPlacement,		RequiresPopulation,		0,					InternalOnly,		ZOC,		CaptureRemovesBuildings,		CaptureRemovesCityDefenses,		MilitaryDomain,		TravelTime,		CityStrengthModifier,	Housing,	OnePerCity,		HitPoints,	Maintenance,	0,		Aqueduct
FROM Districts WHERE DistrictType = 'DISTRICT_ENCAMPMENT';

-----------------------------------------------------------------------------------
-- DistrictReplaces
-----------------------------------------------------------------------------------
INSERT INTO DistrictReplaces
			(CivUniqueDistrictType,				ReplacesDistrictType)
VALUES		('DISTRICT_LEU_CITADELLE',			'DISTRICT_ENCAMPMENT');


-----------------------------------------------------------------------------------
-- District_GreatPersonPoints
-----------------------------------------------------------------------------------
INSERT INTO District_GreatPersonPoints
			(DistrictType,				GreatPersonClassType,				PointsPerTurn)
VALUES		('DISTRICT_LEU_CITADELLE',	'GREAT_PERSON_CLASS_GENERAL',		1);
		
-----------------------------------------------------------------------------------
-- District_TradeRouteYields
-----------------------------------------------------------------------------------
INSERT INTO District_TradeRouteYields
			(DistrictType,				YieldType,			YieldChangeAsOrigin,	YieldChangeAsDomesticDestination,	YieldChangeAsInternationalDestination)
SELECT		'DISTRICT_LEU_CITADELLE',	YieldType,			YieldChangeAsOrigin,	YieldChangeAsDomesticDestination,	YieldChangeAsInternationalDestination
FROM District_TradeRouteYields WHERE DistrictType = 'DISTRICT_ENCAMPMENT';

-----------------------------------------------------------------------------------
-- District_Adjacencies
-----------------------------------------------------------------------------------
INSERT INTO District_Adjacencies
			(DistrictType,						YieldChangeId)
VALUES 		('DISTRICT_LEU_CITADELLE',			'Citadelle_Coast_Faith'),
			('DISTRICT_LEU_CITADELLE',			'Citadelle_Harbor_Faith'),
			('DISTRICT_LEU_CITADELLE',			'Citadelle_Plantation_Faith'),
			('DISTRICT_LEU_CITADELLE',			'Government_Culture');

-----------------------------------------------------------------------------------
-- District_ValidTerrains
-----------------------------------------------------------------------------------
INSERT INTO District_ValidTerrains
			(DistrictType,						TerrainType)
VALUES		('DISTRICT_LEU_CITADELLE',			'TERRAIN_GRASS_HILLS'),
			('DISTRICT_LEU_CITADELLE',			'TERRAIN_PLAINS_HILLS'),
			('DISTRICT_LEU_CITADELLE',			'TERRAIN_DESERT_HILLS'),
			('DISTRICT_LEU_CITADELLE',			'TERRAIN_TUNDRA_HILLS'),
			('DISTRICT_LEU_CITADELLE',			'TERRAIN_SNOW_HILLS');
			

-----------------------------------------------------------------------------------
-- Adjacency_YieldChanges
-----------------------------------------------------------------------------------
INSERT INTO Adjacency_YieldChanges
		(ID,							Description,							YieldType,			YieldChange,		TilesRequired,		AdjacentTerrain,		AdjacentResourceClass,		AdjacentDistrict)			
VALUES	('Citadelle_Coast_Faith',		'LOC_DISTRICT_CITADELLE_COAST_FAITH',	'YIELD_CULTURE',		1,					1,					'TERRAIN_COAST',		'NO_RESOURCECLASS',			null),
		('Citadelle_Harbor_Faith',		'LOC_DISTRICT_CITADELLE_HARBOUR_FAITH',	'YIELD_CULTURE',		1,					1,					null,					'NO_RESOURCECLASS',			'DISTRICT_HARBOR'),
		('Citadelle_Plantation_Faith',	'LOC_DISTRICT_CITADELLE_LUXURY_FAITH',	'YIELD_CULTURE',		1,					1,					null,					'RESOURCECLASS_LUXURY',		null);
		
-----------------------------------------------------------------------------------
-- District_CitizenYieldChanges
-----------------------------------------------------------------------------------
INSERT INTO District_CitizenYieldChanges
			(DistrictType,						YieldType,				YieldChange)
VALUES 		('DISTRICT_LEU_CITADELLE',			'YIELD_CULTURE',		1),
			('DISTRICT_LEU_CITADELLE',			'YIELD_PRODUCTION',		1);

-----------------------------------------------------------------------------------
-- DistrictModifiers
-----------------------------------------------------------------------------------


-----------------------------------------------------------------------------------
-- Projects
-----------------------------------------------------------------------------------
INSERT INTO Projects
		(ProjectType,					Name,								ShortName,									Description,								Cost,		CostProgressionModel,				CostProgressionParam1,		PrereqDistrict,				AdvisorType)
VALUES	('PROJECT_LEU_ABOLITION',		'LOC_PROJECT_LEU_ABOLITION_NAME',	'LOC_PROJECT_LEU_ABOLITION_SHORTNAME',		'LOC_PROJECT_LEU_ABOLITION_DESCRIPTION',	50,		'COST_PROGRESSION_GAME_PROGRESS',	1500,						'DISTRICT_LEU_CITADELLE',	'ADVISOR_RELIGIOUS');

--INSERT INTO Projects_XP1
--		(ProjectType,				IdentityPerCitizenChange)
--VALUES	('PROJECT_LEU_ABOLITION',	1);
-----------------------------------------------------------------------------------
-- Project_YieldConversions
-----------------------------------------------------------------------------------
INSERT INTO Project_YieldConversions
		(ProjectType,					YieldType,			PercentOfProductionRate)
VALUES	('PROJECT_LEU_ABOLITION',		'YIELD_CULTURE',	20);

--==========================================================================================================================
-- Modifiers
--==========================================================================================================================
-- Modifiers
-------------------------------------

-------------------------------------
-- ModifierArguments
-------------------------------------

--==========================================================================================================================
-- Requirements
--==========================================================================================================================
-- RequirementSets
-------------------------------------

-------------------------------------
-- RequirementSetRequirements
-------------------------------------

-------------------------------------
-- Requirements
-------------------------------------

-------------------------------------
-- RequirementArguments
-------------------------------------

--==========================================================================================================================
--==========================================================================================================================
