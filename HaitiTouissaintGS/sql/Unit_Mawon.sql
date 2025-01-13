--==========================================================================================================================
-- UNITS
--==========================================================================================================================
-- Types
-------------------------------------	
INSERT INTO Types	
		(Type,									Kind)
VALUES	('TRAIT_UNIT_LEU_MAWON',				'KIND_TRAIT'),
		('UNIT_LEU_MAWON',						'KIND_UNIT');

---------------------------------------
-- MomentIllustrations
---------------------------------------
INSERT INTO MomentIllustrations
		(MomentIllustrationType,					MomentDataType,				GameDataType,			Texture)
VALUES	('MOMENT_ILLUSTRATION_UNIQUE_UNIT',			'MOMENT_DATA_UNIT',			'UNIT_LEU_MAWON',		'HM_LEU_MAWON.dds');

-------------------------------------			
-- Traits			
-------------------------------------				
INSERT INTO Traits				
		(TraitType,						Name,							Description)
VALUES	('TRAIT_UNIT_LEU_MAWON',		'LOC_UNIT_LEU_MAWON_NAME',		'LOC_UNIT_LEU_MAWON_DESCRIPTION');

-------------------------------------
-- CivilizationTraits
-------------------------------------	
INSERT INTO CivilizationTraits	
		(TraitType,							CivilizationType)
VALUES	('TRAIT_UNIT_LEU_MAWON',			'CIVILIZATION_LEU_HAITI');

-------------------------------------	
-- Units
-------------------------------------	
INSERT INTO Units	
		(UnitType,				Name,						Description,						PrereqCivic,			TraitType,					BaseMoves,		BaseSightRange,		Combat,		Domain,			FormationClass,					Cost,	CanCapture,		PromotionClass,				CanTrain,		PurchaseYield,		Maintenance,	ZoneOfControl,	AdvisorType)
VALUES  ('UNIT_LEU_MAWON',		'LOC_UNIT_LEU_MAWON_NAME',	'LOC_UNIT_LEU_MAWON_DESCRIPTION',	'CIVIC_COLONIALISM',	'TRAIT_UNIT_LEU_MAWON',		2,				2,					65,			'DOMAIN_LAND',	'FORMATION_CLASS_LAND_COMBAT',	300,	1,				'PROMOTION_CLASS_MELEE',	1,				'YIELD_FAITH',		4,				1,				'ADVISOR_CONQUEST');

-------------------------------------	
-- UnitReplaces
-------------------------------------	

-------------------------------------	
-- UnitUpgrades
-------------------------------------	
--INSERT INTO UnitUpgrades	
--		(Unit,					UpgradeUnit)
--VALUES  ('UNIT_LEU_MAWON',		'UNIT_INFANTRY');

INSERT INTO UnitUpgrades
		(Unit,					UpgradeUnit)
VALUES	('UNIT_LEU_MAWON',		'UNIT_INFANTRY');
-------------------------------------	
-- UnitAIInfos
-------------------------------------	
INSERT INTO UnitAIInfos	
		(UnitType,				AiType)
SELECT  'UNIT_LEU_MAWON',		AiType
FROM UnitAIInfos WHERE UnitType = 'UNIT_INFANTRY'; 

-------------------------------------	
-- Tags
-------------------------------------		
INSERT INTO Tags	
		(Tag,					Vocabulary)
VALUES	('CLASS_LEU_MAWON',		'ABILITY_CLASS');	

-------------------------------------	
-- TypeTags
-------------------------------------	
INSERT INTO TypeTags	
		(Type,					Tag)
SELECT  'UNIT_LEU_MAWON',		Tag
FROM TypeTags WHERE Type = 'UNIT_MUSKETMAN';

INSERT INTO TypeTags	
		(Type,				Tag)
VALUES	('UNIT_LEU_MAWON',	'CLASS_LEU_MAWON'),
		('UNIT_LEU_MAWON',	'CLASS_CAPTURE_WORKER');	

--==========================================================================================================================
-- UNITS: ABILITIES
--==========================================================================================================================
-- Types
-------------------------------------		
INSERT INTO Types	
		(Type,									Kind)
VALUES	('ABILITY_LEU_MAWON_DARK_AGE_BONUS',					'KIND_ABILITY');	

-------------------------------------	
-- TypeTags
-------------------------------------	
INSERT INTO TypeTags	
		(Type,									Tag)
VALUES	('ABILITY_LEU_MAWON_DARK_AGE_BONUS',					'CLASS_LEU_MAWON');	

-------------------------------------	
-- UnitAbilities
-------------------------------------	
INSERT INTO UnitAbilities	
		(UnitAbilityType,						Name,											Description)
VALUES	('ABILITY_LEU_MAWON_DARK_AGE_BONUS',	'LOC_ABILITY_LEU_MAWON_DARK_AGE_BONUS_NAME',	'LOC_ABILITY_LEU_MAWON_DARK_AGE_BONUS_DESCRIPTION');	

-------------------------------------	
-- UnitAbilityModifiers
-------------------------------------	
INSERT INTO UnitAbilityModifiers	
		(UnitAbilityType,						ModifierId)
VALUES	('ABILITY_LEU_MAWON_DARK_AGE_BONUS',					'LEU_MAWON_DARK_AGE_BONUS');	

-------------------------------------	
-- Modifiers
-------------------------------------	
INSERT INTO Modifiers	
		(ModifierId,							ModifierType,										OwnerRequirementSetId)
VALUES	('LEU_MAWON_DARK_AGE_BONUS',			'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',				'PLAYER_HAS_DARK_AGE');
-------------------------------------
-- ModifierStringS
-------------------------------------
INSERT INTO ModifierStrings
		(ModifierId, Context, Text)
VALUES ('LEU_MAWON_DARK_AGE_BONUS',				'Preview',		'LOC_ABILITY_LEU_MAWON_DARK_AGE_BONUS_TEXT');
		
-------------------------------------	
-- ModifierArguments		
-------------------------------------		
INSERT INTO ModifierArguments		
		(ModifierId,						Name,						Value)
VALUES	('LEU_MAWON_DARK_AGE_BONUS',				'Amount',					10);

-------------------------------------	
-- Requirements
-------------------------------------	

-------------------------------------	
-- RequirementArguments
-------------------------------------	

-------------------------------------	
-- RequirementSets
-------------------------------------	

-------------------------------------	
-- RequirementSetRequirements
-------------------------------------	

--==========================================================================================================================
--==========================================================================================================================
