--==========================================================================================================================
-- CONFIG DATA
--==========================================================================================================================
-- Players

INSERT INTO Players	
		(Domain,							CivilizationType,				Portrait,									PortraitBackground,					LeaderType,					LeaderName,							 LeaderIcon,						LeaderAbilityName,							LeaderAbilityDescription,						LeaderAbilityIcon,				CivilizationName,					CivilizationIcon,						CivilizationAbilityName,								CivilizationAbilityDescription,								CivilizationAbilityIcon)
VALUES	('Players:Expansion1_Players',		'CIVILIZATION_LEU_HAITI',		'LEADER_LEU_LOUVERTURE_NEUTRAL.dds',		'LEADER_HOJO_BACKGROUND',	'LEADER_LEU_LOUVERTURE',		'LOC_LEADER_LEU_LOUVERTURE_NAME',	 'ICON_LEADER_LEU_LOUVERTURE',		'LOC_TRAIT_LEADER_LEU_LOUVERTURE_NAME',		'LOC_TRAIT_LEADER_LEU_LOUVERTURE_DESCRIPTION',	'ICON_LEADER_LEU_LOUVERTURE',		'LOC_CIVILIZATION_LEU_HAITI_NAME',	'ICON_CIVILIZATION_LEU_HAITI_LOUVERTURE',			'LOC_TRAIT_CIVILIZATION_LEU_HAITI_NAME',	'LOC_TRAIT_CIVILIZATION_LEU_HAITI_DESCRIPTION',	'ICON_CIVILIZATION_LEU_HAITI');	

INSERT INTO PlayerItems	
		(Domain,							CivilizationType,				LeaderType,					Type,							Icon,									Name,									Description,									  SortIndex)
VALUES	('Players:Expansion1_Players',		'CIVILIZATION_LEU_HAITI',		'LEADER_LEU_LOUVERTURE',	'DISTRICT_LEU_CITADELLE',		'ICON_DISTRICT_LEU_CITADELLE',		'LOC_DISTRICT_LEU_CITADELLE_NAME',	'LOC_DISTRICT_LEU_CITADELLE_DESCRIPTION',		  20);	

INSERT INTO PlayerItems	
		(Domain,							CivilizationType,				LeaderType,					Type,							Icon,									Name,									  Description,									  SortIndex)
VALUES	('Players:Expansion1_Players',		'CIVILIZATION_LEU_HAITI',		'LEADER_LEU_LOUVERTURE',	'UNIT_LEU_MAWON',				'ICON_UNIT_LEU_MAWON',				'LOC_UNIT_LEU_MAWON_NAME',			 'LOC_UNIT_LEU_MAWON_DESCRIPTION',			  10);		
--==========================================================================================================================
--==========================================================================================================================
