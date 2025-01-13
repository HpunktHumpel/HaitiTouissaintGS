--==========================================================================================================================
-- ICONS
--==========================================================================================================================
-- IconTextureAtlases
	
INSERT INTO IconTextureAtlases	
		(Name,										IconSize,	IconsPerRow,	IconsPerColumn,		Filename)
VALUES  ('ICON_ATLAS_LEU_ABOLITION',					256,		1,				1,				'LEU_ABOLITION_Icon_256'),
		('ICON_ATLAS_LEU_ABOLITION',					80,			1,				1,				'LEU_ABOLITION_Icon_80'),
		('ICON_ATLAS_LEU_ABOLITION',					70,			1,				1,				'LEU_ABOLITION_Icon_70'),
		('ICON_ATLAS_LEU_ABOLITION',					50,			1,				1,				'LEU_ABOLITION_Icon_50'),
		('ICON_ATLAS_LEU_ABOLITION',					38,			1,				1,				'LEU_ABOLITION_Icon_38'),
		('ICON_ATLAS_LEU_ABOLITION',					32,			1,				1,				'LEU_ABOLITION_Icon_32'),
		('ICON_ATLAS_LEU_ABOLITION',					30,			1,				1,				'LEU_ABOLITION_Icon_30'),
		('ICON_ATLAS_LEU_CITADELLE',					256,		1,				1,				'Icon_LEU_CITADELLE_256'),
		('ICON_ATLAS_LEU_CITADELLE',					128,		1,				1,				'Icon_LEU_CITADELLE_128'),
		('ICON_ATLAS_LEU_CITADELLE',					80,			1,				1,				'Icon_LEU_CITADELLE_80'),
		('ICON_ATLAS_LEU_CITADELLE',					50,			1,				1,				'Icon_LEU_CITADELLE_50'),
		('ICON_ATLAS_LEU_CITADELLE',					38,			1,				1,				'Icon_LEU_CITADELLE_38'),
		('ICON_ATLAS_LEU_CITADELLE',					32,			1,				1,				'Icon_LEU_CITADELLE_32'),
		('ICON_ATLAS_LEU_HAITI',						256,	 	1,				1,				'Icon_LEU_HAITI_256.dds'),
		('ICON_ATLAS_LEU_HAITI',						80,	 		1,				1,				'Icon_LEU_HAITI_80.dds'),
		('ICON_ATLAS_LEU_HAITI',						64,	 		1,				1,				'Icon_LEU_HAITI_64.dds'),
		('ICON_ATLAS_LEU_HAITI',						50,	 		1,				1,				'Icon_LEU_HAITI_50.dds'),
		('ICON_ATLAS_LEU_HAITI',						48,	 		1,				1,				'Icon_LEU_HAITI_48.dds'),
		('ICON_ATLAS_LEU_HAITI',						44,	 		1,				1,				'Icon_LEU_HAITI_44.dds'),
		('ICON_ATLAS_LEU_HAITI',						45,	 		1,				1,				'Icon_LEU_LOUVERTURE_Civ_45.dds'),
		('ICON_ATLAS_LEU_HAITI',						36,	 		1,				1,				'Icon_LEU_HAITI_36.dds'),
		('ICON_ATLAS_LEU_HAITI',						30,	 		1,				1,				'Icon_LEU_HAITI_30.dds'),
		('ICON_ATLAS_LEU_HAITI',						22,	 		1,				1,				'Icon_LEU_HAITI_22.dds'),
		('ICON_ATLAS_LEU_MAWON',						256,	 	1,				1,				'Icon_LEU_MAWON_Flag_256.dds'),
		('ICON_ATLAS_LEU_MAWON',						80,	 		1,				1,				'Icon_LEU_MAWON_Flag_80.dds'),
		('ICON_ATLAS_LEU_MAWON',						50,	 		1,				1,				'Icon_LEU_MAWON_Flag_50.dds'),
		('ICON_ATLAS_LEU_MAWON',						38,	 		1,				1,				'Icon_LEU_MAWON_Flag_38.dds'),
		('ICON_ATLAS_LEU_MAWON',						32,	 		1,				1,				'Icon_LEU_MAWON_Flag_32.dds'),
		('ICON_ATLAS_LEU_MAWON',						22,	 		1,				1,				'Icon_LEU_MAWON_Flag_22.dds'),
		('ICON_ATLAS_LEU_MAWON_PORTRAIT',				256,	 	1,				1,				'Icon_LEU_MAWON_Portrait_256.dds'),
		('ICON_ATLAS_LEU_MAWON_PORTRAIT',				200,	 	1,				1,				'Icon_LEU_MAWON_Portrait_200.dds'),
		('ICON_ATLAS_LEU_MAWON_PORTRAIT',				95,	 		1,				1,				'Icon_LEU_MAWON_Portrait_95.dds'),
		('ICON_ATLAS_LEU_MAWON_PORTRAIT',				70,	 		1,				1,				'Icon_LEU_MAWON_Portrait_70.dds'),
		('ICON_ATLAS_LEU_MAWON_PORTRAIT',				50,	 		1,				1,				'Icon_LEU_MAWON_Portrait_50.dds'),
		('ICON_ATLAS_LEU_MAWON_PORTRAIT',				38,	 		1,				1,				'Icon_LEU_MAWON_Portrait_38.dds'),
		('ICON_ATLAS_LEU_HAITI_LOUVERTURE',				45,	 		1,				1,				'Icon_LEU_LOUVERTURE_Civ_45.dds'),
		('ICON_ATLAS_LEU_LOUVERTURE',					256,	 	1,				1,				'Icon_LEU_LOUVERTURE_256.dds'),
		('ICON_ATLAS_LEU_LOUVERTURE',					80,	 		1,				1,				'Icon_LEU_LOUVERTURE_80.dds'),
		('ICON_ATLAS_LEU_LOUVERTURE',					64,	 		1,				1,				'Icon_LEU_LOUVERTURE_64.dds'),
		('ICON_ATLAS_LEU_LOUVERTURE',					55,	 		1,				1,				'Icon_LEU_LOUVERTURE_55.dds'),
		('ICON_ATLAS_LEU_LOUVERTURE',					50,	 		1,				1,				'Icon_LEU_LOUVERTURE_50.dds'),
		('ICON_ATLAS_LEU_LOUVERTURE',					45,	 		1,				1,				'Icon_LEU_LOUVERTURE_45.dds');

-- IconDefinitions
	
INSERT INTO IconDefinitions	
		(Name,														Atlas, 											'Index')
VALUES  ('ICON_BELIEF_LEU_LOA',										'ICON_ATLAS_BELIEFS_PATHEON',					23),
		('ICON_PROJECT_LEU_ABOLITION',								'ICON_ATLAS_LEU_ABOLITION',						0),
		('ICON_DISTRICT_LEU_CITADELLE',								'ICON_ATLAS_LEU_CITADELLE',						0),
		('ICON_CIVILIZATION_LEU_HAITI',								'ICON_ATLAS_LEU_HAITI',							0),
		('ICON_CIVILIZATION_LEU_HAITI_LOUVERTURE',					'ICON_ATLAS_LEU_HAITI_LOUVERTURE',				0),
		('ICON_LEADER_LEU_LOUVERTURE',								'ICON_ATLAS_LEU_LOUVERTURE',					0),
		('ICON_UNIT_LEU_MAWON',										'ICON_ATLAS_LEU_MAWON',							0),
		('ICON_UNIT_LEU_MAWON_BLACK',								'ICON_ATLAS_LEU_MAWON',							0),
		('ICON_UNIT_LEU_MAWON_WHITE',								'ICON_ATLAS_LEU_MAWON',							0),
		('ICON_UNIT_LEU_MAWON_PORTRAIT',							'ICON_ATLAS_LEU_MAWON_PORTRAIT',				0),
		('ICON_ETHNICITY_AFRICAN_UNIT_LEU_MAWON_PORTRAIT',			'ICON_ATLAS_LEU_MAWON_PORTRAIT',				0),
		('ICON_ETHNICITY_SOUTHAM_UNIT_LEU_MAWON_PORTRAIT',			'ICON_ATLAS_LEU_MAWON_PORTRAIT',				0),
		('ICON_ETHNICITY_MEDIT_UNIT_LEU_MAWON_PORTRAIT',			'ICON_ATLAS_LEU_MAWON_PORTRAIT',				0),
		('ICON_ETHNICITY_ASIAN_UNIT_LEU_MAWON_PORTRAIT',			'ICON_ATLAS_LEU_MAWON_PORTRAIT',				0);
--==========================================================================================================================
--==========================================================================================================================