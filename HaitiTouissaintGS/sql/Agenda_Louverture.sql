--==========================================================================================================================
-- AGENDA
--==========================================================================================================================
-- Types
-------------------------------------
INSERT INTO Types	
		(Type,										Kind)
VALUES	('TRAIT_AGENDA_LEU_LOUVERTURE',				'KIND_TRAIT');	

-------------------------------------
-- HistoricalAgendas
-------------------------------------
INSERT INTO HistoricalAgendas	
		(LeaderType,					AgendaType)
VALUES	('LEADER_LEU_LOUVERTURE',		'AGENDA_LEU_LOUVERTURE');		


-------------------------------------			
-- Agendas			
-------------------------------------				
INSERT INTO Agendas				
		(AgendaType,						Name,									Description)
VALUES	('AGENDA_LEU_LOUVERTURE',			'LOC_AGENDA_LEU_LOUVERTURE_NAME',	'LOC_AGENDA_LEU_LOUVERTURE_DESCRIPTION');	
			
-------------------------------------
-- Traits			
-------------------------------------				
INSERT INTO Traits				
		(TraitType,								Name,									Description)
VALUES	('TRAIT_AGENDA_LEU_LOUVERTURE',			'LOC_PLACEHOLDER',						'LOC_PLACEHOLDER');	
			
-------------------------------------
-- AgendaTraits			
-------------------------------------				
INSERT INTO AgendaTraits				
		(AgendaType,						TraitType)
VALUES	('AGENDA_LEU_LOUVERTURE',			'TRAIT_AGENDA_LEU_LOUVERTURE');		

-------------------------------------
-- Preferred and Excluded Agendas			
-------------------------------------				
INSERT INTO AgendaPreferredLeaders				
		(AgendaType,						LeaderType,					PercentageChance)
VALUES	('AGENDA_CITY_STATE_PROTECTOR',		'LEADER_LEU_LOUVERTURE',		50),
		('AGENDA_IDEOLOGUE',				'LEADER_LEU_LOUVERTURE',		50),
		('AGENDA_SYMPATHIZER',				'LEADER_LEU_LOUVERTURE',		60);

INSERT INTO ExclusiveAgendas
		(AgendaOne,						AgendaTwo)
VALUES	('AGENDA_LEU_LOUVERTURE',		'AGENDA_EXPLOITATIVE'),
		('AGENDA_LEU_LOUVERTURE',		'AGENDA_MONEY_GRUBBER'),
		('AGENDA_LEU_LOUVERTURE',		'AGENDA_DARWINIST');
		
-------------------------------------
-- TraitModifiers		
-------------------------------------
INSERT INTO TraitModifiers			
		(TraitType,							ModifierId)
VALUES	('TRAIT_AGENDA_LEU_LOUVERTURE',		'LEU_LOUVERTURE_LIKES_PROMISES'),
		('TRAIT_AGENDA_LEU_LOUVERTURE',		'LEU_LOUVERTURE_HATES_BUILDER_OWNERS');
--==========================================================================================================================
--==========================================================================================================================
-- Likes those that don't break promises
-------------------------------------
INSERT INTO Modifiers	
		(ModifierId,							ModifierType,									OwnerRequirementSetId,		SubjectRequirementSetId)
VALUES	('LEU_LOUVERTURE_LIKES_PROMISES',		'MODIFIER_PLAYER_DIPLOMACY_KEPT_PROMISE',		'ON_TURN_STARTED',			null);

INSERT INTO ModifierArguments
		(ModifierId,								Name,						Value)
VALUES	('LEU_LOUVERTURE_LIKES_PROMISES',			'InitialValue',					4),
		('LEU_LOUVERTURE_LIKES_PROMISES',			'IncrementValue',				0),
		('LEU_LOUVERTURE_LIKES_PROMISES',			'ModifierPerKeptPromise',		4),
		('LEU_LOUVERTURE_LIKES_PROMISES',			'ReductionValue',				1),
		('LEU_LOUVERTURE_LIKES_PROMISES',			'ReductionTurns',				50),
		('LEU_LOUVERTURE_LIKES_PROMISES',			'SimpleModifierDescription',	'LOC_DIPLO_MODIFIER_LEU_LOUVERTURE_POSITIVE'),
		('LEU_LOUVERTURE_LIKES_PROMISES',			'StatementKey',					'LOC_DIPLO_KUDO_LEADER_LEU_LOUVERTURE_REASON_ANY');		
		
INSERT INTO ModifierStrings
		(ModifierId,								Context,						Text)
VALUES	('LEU_LOUVERTURE_LIKES_PROMISES',			'Sample',						'LOC_TOOLTIP_SAMPLE_DIPLOMACY_ALL');

--==========================================================================================================================
--==========================================================================================================================
-- Dislikes Builder Owners
-------------------------------------
INSERT INTO Modifiers	
		(ModifierId,								ModifierType,										OwnerRequirementSetId,		SubjectRequirementSetId)
VALUES	('LEU_LOUVERTURE_HATES_BUILDER_OWNERS',		'MODIFIER_PLAYER_DIPLOMACY_SIMPLE_MODIFIER',		'ON_TURN_STARTED',			'LEU_LOUVERTURE_HAS_4_BUILDERS');

INSERT INTO ModifierArguments
		(ModifierId,									Name,							Value)
VALUES	('LEU_LOUVERTURE_HATES_BUILDER_OWNERS',			'InitialValue',					-12),
		('LEU_LOUVERTURE_HATES_BUILDER_OWNERS',			'HiddenAgenda',					0),
		('LEU_LOUVERTURE_HATES_BUILDER_OWNERS',			'SimpleModifierDescription',	'LOC_DIPLO_MODIFIER_LEU_LOUVERTURE_POSITIVE'),
		('LEU_LOUVERTURE_HATES_BUILDER_OWNERS',			'StatementKey',					'LOC_DIPLO_WARNING_LEADER_LEU_LOUVERTURE_REASON_ANY');
		

INSERT INTO ModifierStrings
		(ModifierId,								Context,				Text)
VALUES	('LEU_LOUVERTURE_HATES_BUILDER_OWNERS',		'Sample',				'LOC_TOOLTIP_SAMPLE_DIPLOMACY_ALL');

INSERT INTO RequirementSets
		(RequirementSetId,						RequirementSetType)
VALUES	('LEU_LOUVERTURE_HAS_4_BUILDERS',		'REQUIREMENTSET_TEST_ALL');

INSERT INTO RequirementSetRequirements
		(RequirementSetId,						RequirementId)
VALUES	('LEU_LOUVERTURE_HAS_4_BUILDERS',		'REQUIRES_MAJOR_CIV_OPPONENT'),
		('LEU_LOUVERTURE_HAS_4_BUILDERS',		'REQUIRES_MET_10_TURNS_AGO'),
		('LEU_LOUVERTURE_HAS_4_BUILDERS',		'LEU_HAITI_REQUIRES_4_BUILDERS');

INSERT INTO Requirements
		(RequirementId,						RequirementType,							ProgressWeight)
VALUES	('LEU_HAITI_REQUIRES_4_BUILDERS',	'REQUIREMENT_COLLECTION_COUNT_ATLEAST',		1);

INSERT INTO RequirementArguments
		(RequirementId,						Name,							Value)
VALUES	('LEU_HAITI_REQUIRES_4_BUILDERS',	'CollectionType',				'COLLECTION_PLAYER_UNITS'),
		('LEU_HAITI_REQUIRES_4_BUILDERS',	'Count',						3),
		('LEU_HAITI_REQUIRES_4_BUILDERS',	'RequirementSetId',				'REQUIREMENT_UNIT_IS_BUILDER');
--==========================================================================================================================
-- LEADERS: AI
--==========================================================================================================================
-- AiListTypes
	
INSERT INTO AiListTypes	
		(ListType)
VALUES	('LEU_LOUVERTURE_Alliances'),
		('LEU_LOUVERTURE_Beliefs'),
		('LEU_LOUVERTURE_Buildings'),
		('LEU_LOUVERTURE_Commemorations'),
		('LEU_LOUVERTURE_Diplo'),
		('LEU_LOUVERTURE_Districts'),
		('LEU_LOUVERTURE_Governments'),
		('LEU_LOUVERTURE_Improvements'),
		('LEU_LOUVERTURE_PlotSettling'),
		('LEU_LOUVERTURE_Projects'),
		('LEU_LOUVERTURE_PseudoYields'),
		('LEU_LOUVERTURE_Strategies'),
		('LEU_LOUVERTURE_UnitClasses'),
		('LEU_LOUVERTURE_Units'),
		('LEU_LOUVERTURE_Yields');

-- AiLists
	
INSERT INTO AiLists	
		(ListType,							LeaderType,							System)
VALUES	('LEU_LOUVERTURE_Alliances',		'TRAIT_AGENDA_LEU_LOUVERTURE',		'Alliances'),
		('LEU_LOUVERTURE_Beliefs',			'TRAIT_AGENDA_LEU_LOUVERTURE',		'Beliefs'),
		('LEU_LOUVERTURE_Buildings',		'TRAIT_AGENDA_LEU_LOUVERTURE',		'Buildings'),
		('LEU_LOUVERTURE_Commemorations',	'TRAIT_AGENDA_LEU_LOUVERTURE',		'Commemorations'),
		('LEU_LOUVERTURE_Diplo',			'TRAIT_AGENDA_LEU_LOUVERTURE',		'DiplomaticActions'),
		('LEU_LOUVERTURE_Districts',		'TRAIT_AGENDA_LEU_LOUVERTURE',		'Districts'),
		('LEU_LOUVERTURE_Governments',		'TRAIT_AGENDA_LEU_LOUVERTURE',		'Governments'),
		('LEU_LOUVERTURE_Improvements',		'TRAIT_AGENDA_LEU_LOUVERTURE',		'Improvements'),
		('LEU_LOUVERTURE_PlotSettling',		'TRAIT_AGENDA_LEU_LOUVERTURE',		'PlotEvaluations'),
		('LEU_LOUVERTURE_Projects',			'TRAIT_AGENDA_LEU_LOUVERTURE',		'Projects'),
		('LEU_LOUVERTURE_PseudoYields',		'TRAIT_AGENDA_LEU_LOUVERTURE',		'PseudoYields'),
		('LEU_LOUVERTURE_Strategies',		'TRAIT_AGENDA_LEU_LOUVERTURE',		'Strategies'),
		('LEU_LOUVERTURE_UnitClasses',		'TRAIT_AGENDA_LEU_LOUVERTURE',		'UnitPromotionClasses'),
		('LEU_LOUVERTURE_Units',			'TRAIT_AGENDA_LEU_LOUVERTURE',		'Units'),
		('LEU_LOUVERTURE_Yields',			'TRAIT_AGENDA_LEU_LOUVERTURE',		'Yields');
		
-- AiFavoredItems
	
INSERT INTO AiFavoredItems		
		(ListType,								Favored,	Value,				Item,									StringVal)
VALUES	('LEU_LOUVERTURE_Alliances',			1,			30,					'ALLIANCE_MILITARY',					null),
		('LEU_LOUVERTURE_Beliefs',				1,			30,					'BELIEF_JUST_WAR',						null),
		('LEU_LOUVERTURE_Buildings',			1,			30,					'BUILDING_GOV_WIDE',					null),
		('LEU_LOUVERTURE_Buildings',			1,			30,					'BUILDING_GOV_FAITH',					null),
		('LEU_LOUVERTURE_Commemorations',		1,			30,					'COMMEMORATION_INFRASTRUCTURE',			null),
		-- Diplo: DiplomaticActions
		('LEU_LOUVERTURE_Diplo',				1,			30,					'DIPLOACTION_DENOUNCE',					null),
		('LEU_LOUVERTURE_Diplo',				1,			30,					'DIPLOACTION_DECLARE_LIBERATION_WAR',	null),
		('LEU_LOUVERTURE_Diplo',				1,			30,					'DIPLOACTION_DECLARE_RECONQUEST_WAR',	null),
		--
		('LEU_LOUVERTURE_Districts',			1,			30,					'DISTRICT_LEU_CITADELLE',				null),
		('LEU_LOUVERTURE_Governments',			1,			30,					'GOVERNMENT_CLASSICAL_REPUBLIC',		null),
		('LEU_LOUVERTURE_Governments',			1,			30,					'GOVERNMENT_DEMOCRACY',					null),
		-- PlotSettling: PlotEvalConditions
		('LEU_LOUVERTURE_PlotSettling',			1,			30,					'Coastal',								null),
		('LEU_LOUVERTURE_PlotSettling',			1,			30,					'CulturalPressure',						null),		
		--
		('LEU_LOUVERTURE_Projects',				1,			30,					'PROJECT_LEU_ABOLITION',				null),
		('LEU_LOUVERTURE_PseudoYields',			1,			30,					'PSEUDOYIELD_GPP_GENERAL',				null),
		('LEU_LOUVERTURE_PseudoYields',			1,			30,					'PSEUDOYIELD_DIPLOMATIC_BONUS',			null),
		('LEU_LOUVERTURE_PseudoYields',			1,			30,					'PSEUDOYIELD_CITY_DEFENSES',			null),
		('LEU_LOUVERTURE_PseudoYields',			1,			-10,				'PSEUDOYIELD_GOLDENAGE_POINT',			null),
		-- Victory Strategies for some reason work negatively
		('LEU_LOUVERTURE_Strategies',			1,			10,					'STRATEGY_DARKAGE',						null),
		('LEU_LOUVERTURE_Strategies',			1,			-30,				'VICTORY_STRATEGY_MILITARY_VICTORY',	null),
		('LEU_LOUVERTURE_UnitClasses',			1,			30,					'PROMOTION_CLASS_SIEGE',				null),
		('LEU_LOUVERTURE_UnitClasses',			1,			30,					'PROMOTION_CLASS_MELEE',				null),
		('LEU_LOUVERTURE_Units',				1,			30,					'UNIT_MAWON',							null),
		('LEU_LOUVERTURE_Units',				1,			30,					'UNIT_BUILDER',							null),
		('LEU_LOUVERTURE_Yields',				1,			30,					'YIELD_FAITH',							null);

--==========================================================================================================================
--==========================================================================================================================
