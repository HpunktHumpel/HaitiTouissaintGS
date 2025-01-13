--==========================================================================================================================
-- TRAIT
--==========================================================================================================================
-- Types
-------------------------------------
INSERT INTO Types
		(Type,								Kind)
VALUES	('TRAIT_LEADER_LEU_LOUVERTURE',		'KIND_TRAIT');

-------------------------------------
-- LeaderTraits
-------------------------------------
INSERT INTO LeaderTraits	
		(LeaderType,					TraitType)
VALUES	('LEADER_LEU_LOUVERTURE',		'TRAIT_LEADER_LEU_LOUVERTURE');		

-------------------------------------
-- Traits			
-------------------------------------
INSERT INTO Traits				
		(TraitType,											Name,											Description)
VALUES	('TRAIT_LEADER_LEU_LOUVERTURE',						'LOC_TRAIT_LEADER_LEU_LOUVERTURE_NAME',			'LOC_TRAIT_LEADER_LEU_LOUVERTURE_DESCRIPTION');		
		
-------------------------------------
-- TraitModifiers		
-------------------------------------
INSERT INTO TraitModifiers
		(TraitType,							ModifierId)
VALUES	('TRAIT_LEADER_LEU_LOUVERTURE',		'LEU_LOUVERTURE_ABOLITION_BONUS');

-------------------------------------	
-- Modifiers
-------------------------------------	
INSERT INTO Modifiers	
		(ModifierId,							ModifierType,													OwnerRequirementSetId)
VALUES	('LEU_LOUVERTURE_ABOLITION_BONUS',		'MODIFIER_PLAYER_CITIES_ADJUST_PROJECT_PRODUCTION',				'PLAYER_HAS_DARK_AGE');


-------------------------------------	
-- ModifierArguments		
-------------------------------------		
INSERT INTO ModifierArguments		
		(ModifierId,								Name,						Value)
VALUES	('LEU_LOUVERTURE_ABOLITION_BONUS',			'ProjectType',				'PROJECT_LEU_ABOLITION'),
		('LEU_LOUVERTURE_ABOLITION_BONUS',			'Amount',					50);

-------------------------------------
-- ModifierArguments
-------------------------------------

-------------------------------------
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
