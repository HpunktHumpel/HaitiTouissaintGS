--==========================================================================================================================
-- LEADER
--==========================================================================================================================
-- Types
-------------------------------------
INSERT INTO Types
		(Type,				Kind)
VALUES	('BELIEF_LEU_LOA',	'KIND_BELIEF');

-------------------------------------
-- Beliefs
-------------------------------------		
INSERT INTO Beliefs	
		(BeliefType,			Name,							Description,						BeliefClassType)
VALUES	('BELIEF_LEU_LOA',		'LOC_BELIEF_LEU_LOA_NAME',		'LOC_BELIEF_LEU_LOA_DESCRIPTION',	'BELIEF_CLASS_FOLLOWER');

-------------------------------------	
-- BeliefModifiers
-------------------------------------	
INSERT INTO BeliefModifiers	
		(BeliefType,				ModifierId)
VALUES	('BELIEF_LEU_LOA',			'LEU_LOA_FOLLOWER_CULTURE');	

-------------------------------------	
-- Modifiers
-------------------------------------	
INSERT INTO Modifiers	
		(ModifierId,							ModifierType,													SubjectRequirementSetId)
VALUES	('LEU_LOA_PROJECT_BONUS',				'MODIFIER_PLAYER_CITIES_ADJUST_PROJECT_PRODUCTION',				'LEU_LOA_CITY_HAS_SHRINE'),
		('LEU_LOA_FOLLOWER_CULTURE',			'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',							'CITY_FOLLOWS_RELIGION_REQUIREMENTS'),
		('LEU_LOA_FOLLOWER_CULTURE_MODIFIER',	'MODIFIER_FOLLOWER_YIELD_MODIFIER',								null);


-------------------------------------	
-- ModifierArguments		
-------------------------------------		
INSERT INTO ModifierArguments		
		(ModifierId,							Name,						Value)
VALUES	('LEU_LOA_FOLLOWER_CULTURE',			'ModiiferId',				'LEU_LOA_FOLLOWER_CULTURE_MODIFIER'),
		('LEU_LOA_FOLLOWER_CULTURE_MODIFIER',	'YieldType',				'YIELD_CULTURE'),
		('LEU_LOA_FOLLOWER_CULTURE_MODIFIER',	'Amount',					2);

-------------------------------------	
-- Requirements
-------------------------------------	

-------------------------------------	
-- RequirementArguments
-------------------------------------	

-------------------------------------	
-- RequirementSets
-------------------------------------	
INSERT INTO RequirementSets
		(RequirementSetId,				RequirementSetType)
VALUES	('LEU_LOA_CITY_HAS_SHRINE',		'REQUIREMENTSET_TEST_ALL');
-------------------------------------	
-- RequirementSetRequirements
-------------------------------------
INSERT INTO RequirementSetRequirements
		(RequirementSetId,				RequirementId)
VALUES	('LEU_LOA_CITY_HAS_SHRINE',		'REQUIRES_CITY_HAS_SHRINE');

--==========================================================================================================================
--==========================================================================================================================
