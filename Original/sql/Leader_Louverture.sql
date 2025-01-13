--==========================================================================================================================
-- LEADER
--==========================================================================================================================
-- Types
-------------------------------------
INSERT INTO Types
		(Type,						Kind)
VALUES	('LEADER_LEU_LOUVERTURE',	'KIND_LEADER');
-------------------------------------
-- CivilizationLeaders
-------------------------------------		
INSERT INTO CivilizationLeaders	
		(CivilizationType,				LeaderType,						CapitalName)
VALUES	('CIVILIZATION_LEU_HAITI',		'LEADER_LEU_LOUVERTURE',		'LOC_CITY_NAME_LEU_HAITI_01');	

-------------------------------------
-- LoadingInfo
-------------------------------------	
INSERT INTO LoadingInfo	
		(LeaderType,					ForegroundImage,						PlayDawnOfManAudio,		BackgroundImage)
VALUES	('LEADER_LEU_LOUVERTURE',		'LEADER_LEU_LOUVERTURE_NEUTRAL.dds',	0,						'LEADER_HOJO_BACKGROUND');	

--==========================================================================================================================
-- COLOURS
--==========================================================================================================================
-- PlayerColors
-------------------------------------	
INSERT INTO PlayerColors	
		(Type,						Usage,			PrimaryColor, 									SecondaryColor,										TextColor)
VALUES	('LEADER_LEU_LOUVERTURE',	'Unique',		'COLOR_PLAYER_LEU_LOUVERTURE_BACKGROUND',		'COLOR_PLAYER_LEU_LOUVERTURE_FOREGROUND', 	'COLOR_PLAYER_WHITE_TEXT');	

INSERT INTO Colors 
		(Type, 										Color)
VALUES	('COLOR_PLAYER_LEU_LOUVERTURE_BACKGROUND', 	'34,9,100,255'),
		('COLOR_PLAYER_LEU_LOUVERTURE_FOREGROUND', 	'212,66,65,255');		

--==========================================================================================================================
-- LEADERS
--==========================================================================================================================
-- Leaders
-------------------------------------	
INSERT INTO Leaders	
		(LeaderType,				Name,								InheritFrom,		SceneLayers)
VALUES	('LEADER_LEU_LOUVERTURE',	'LOC_LEADER_LEU_LOUVERTURE_NAME',	'LEADER_DEFAULT',	4);		

-------------------------------------
-- LeaderQuotes
-------------------------------------
INSERT INTO LeaderQuotes	
		(LeaderType,				Quote)
VALUES	('LEADER_LEU_LOUVERTURE',		'LOC_PEDIA_LEADERS_PAGE_LEADER_LEU_LOUVERTURE_QUOTE');		

-------------------------------------
-- FavoredReligions
-------------------------------------
INSERT INTO FavoredReligions	
		(LeaderType,					ReligionType)
VALUES	('LEADER_LEU_LOUVERTURE',		'RELIGION_CATHOLICISM');	

--CREATE TRIGGER Leu_Louverture_HR
--AFTER INSERT ON Religions WHEN 'RELIGION_VOODOO' = NEW.ReligionType
--BEGIN
--	DELETE FROM FavoredReligions
--	WHERE LeaderType = 'LEADER_LEU_LOUVERTURE';

--   INSERT OR REPLACE INTO FavoredReligions
--		    (LeaderType,				ReligionType)
--  VALUES   ('LEADER_ANT_TAIZU',		'RELIGION_VOODOO');
--END;
--==========================================================================================================================
--==========================================================================================================================
