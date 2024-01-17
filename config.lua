Config = {}
Config.OrangeTrees = {
	'p_tree_orange_01',
}
Config.Items = {    
    {name = "nothing", label = "nothing", chance = 3, amount = 1},
    {name = "orange", label = "orange", chance = 10, amount = 1},
}

Config.MainSprite = 486881925 -- Job Blip sprite
Config.DeliverySprite = -570710357 -- Point Sprite
Config.ShowBlips = true -- Show Point blips
Config.GatherPromptKey = 0x760A9C6F

Config.MainJob = {
    {job =1, x=2067.68,y=-842.75,z=41.81}, -- Orange Delivbery
}

Config.FinishJob = {
    {x=-220.30,y=637.63,z=112.20},
    {x=1404.12,y=-1311.23,z=76.66},
    {x=-1825.72,y=-440.92,z=158.68},
    {x=2974.84,y=1423.77,z=43.48},
	
}

Config.Cartmodel = 'wagon02x'
Config.Cart1 = {x=2065.14,y=-830.19,z=41.70,h=-70.68} -- Cart spawn point
Config.StartWorking1 = "Take the delivery to destination." -- Start Working Message
Config.Cash1 = math.random(10, 25) -- or remove math.random(10, 25) and change to 20 ect

--------------------------------------------------------------------------------

local vehicle_propsets = {
   

    ["cart01"] = {
        "pg_re_checkpoint02x_food",
        "pg_re_moonshineCampgroupCart01x",
        "pg_teamster_cart01_breakables",
        "pg_teamster_cart01_gen",
        "pg_teamster_cart01_perishables",
        "pg_teamster_cart01_tnt",
        "pg_veh_cart01_1",
        "pg_veh_cart01_2",
        "pg_veh_cart01_3",
    },

    ["cart02"] = {
        "pg_mission_caravanCart02x",
        "pg_teamster_cart02_breakables",
        "pg_teamster_cart02_gen",
        "pg_teamster_cart02_perishables",
        "pg_teamster_cart02_tnt",
    },

    ["cart03"] = {
        "pg_delivery_Coal02x",
        "pg_mp_moonshinebiz_supplies01x_cart03",
        "pg_teamster_cart03_breakables",
        "pg_teamster_cart03_gen",
        "pg_teamster_cart03_perishables",
        "pg_teamster_cart03_tnt",
        "pg_veh_cart03_1",
        "pg_veh_cart03_2",
        "pg_veh_cart03_barrels01x",
    },

    ["cart04"] = {
        "pg_mission_caravanCart04x",
        "pg_teamster_cart04_breakables",
        "pg_teamster_cart04_gen",
        "pg_teamster_cart04_perishables",
        "pg_teamster_cart04_tnt",
        "pg_veh_cart04_1",
        "pg_veh_cart04_2",
    },

    ["cart06"] = {
        "pg_teamster_cart06_breakables",
        "pg_teamster_cart06_gen",
        "pg_teamster_cart06_perishables",
        "pg_teamster_cart06_tnt",
        "pg_veh_cart06_1",
        "pg_veh_cart06_2",
    },

    ["cart07"] = {
        "pg_teamster_cart07_breakables",
        "pg_teamster_cart07_gen",
        "pg_teamster_cart07_perishables",
        "pg_teamster_cart07_tnt",
        "pg_veh_cart07_1",
        "pg_veh_cart07_2",
    },

    ["cart08"] = {
        "pg_teamster_cart08_breakables",
        "pg_teamster_cart08_gen",
        "pg_teamster_cart08_perishables",
        "pg_teamster_cart08_tnt",
        "pg_veh_cart08_1",
        "pg_veh_cart08_2",
    },

    ["coach2"] = {
        "pg_mission_mary3_01x",
        "pg_re_coachrobbery01x",
        "pg_veh_coach2_1",
        "pg_veh_coach2_bootA",
    },

    ["ArmySupplyWagon"] = {
        "pg_rc_monroe1_01x",
    },

    ["chuckwagon000x"] = {
        "pg_re_fleeingfamily01x",
        "pg_teamster_chuckwagon000x_breakables",
        "pg_teamster_chuckwagon000x_gen",
        "pg_teamster_chuckwagon000x_perishables",
        "pg_teamster_chuckwagon000x_tnt",
        "pg_veh_chuckwagon000x_1",
        "pg_veh_chuckwagon000x_2",
        "pg_veh_chuckwagon000x_3",
        "pg_veh_chuckwagon000x_2a",
        "pg_veh_chuckwagon000x_3a",
        "pg_veh_chuckwagon000x_4",
        "pg_veh_chuckwagon000x_orange_1",
        "pg_vehload_cotton01",
        "pg_vehload_crates01",
        "pg_vehload_haybale01",
        "pg_vehload_livestock01",
        "pg_vehload_lumber01",
        "pg_vehload_sacks01",
        "pg_vl_blacksmith01",
        "pg_vl_butcher01",
        "pg_vl_craftsman01",
        "pg_vl_delivery01",
        "pg_vl_farmer01",
        "pg_vl_farmer02",
        "pg_vl_ferrier01",
        "pg_vl_fisherman01",
        "pg_vl_hunter01",
        "pg_vl_movingFamily01",
        "pg_vl_rancher01",
        "pg_vl_rancher02",
        "pg_vl_rancher03",
        "pg_vl_rancher04",
        "pg_vl_rancher05",
        "pg_vl_tradesman01",
        "pg_vl_tradesman02",
        "pg_vl_tradesman03",
        "pg_vl_tradesman04",
        "pg_vl_travellingFamily01",
        "pg_vl_travellingLabour01",
    },

    ["supplywagon"] = {
        "pg_mission_cornwall1_01x",
        "pg_mp_moonshinebiz_supplies02x_supwag",
        "pg_teamster_supplywagon_breakables",
        "pg_teamster_supplywagon_gen",
        "pg_teamster_supplywagon_perishables",
        "pg_teamster_supplywagon_tnt",
        "pg_delivery_Cotton01x",
    },

    ["supplywagon2"] = {
        "pg_mission_mud4_strauswag01x",
        "pg_mission_mud4_strauswag02x",
    },

    ["logwagon"] = {
        "pg_veh_logwagon_1",
    },

    ["logwagon2"] = {
        "pg_veh_logwagon2_1",
    },

    ["coal_wagon"] = {
        "pg_delivery_Coal01x",
    },

    ["chuckwagon002x"] = {
        "pg_rc_exconfederates1_01x",
        "pg_teamster_chuckwagon002x_breakables",
        "pg_teamster_chuckwagon002x_gen",
        "pg_teamster_chuckwagon002x_perishables",
        "pg_teamster_chuckwagon002x_tnt",
        "pg_veh_chuckwagon002x_1",
        "pg_veh_chuckwagon002x_2",
        "pg_veh_chuckwagon002x_3",
        "pg_vl_blacksmith01",
        "pg_vl_butcher01",
        "pg_vl_craftsman01",
        "pg_vl_delivery01",
        "pg_vl_farmer01",
        "pg_vl_farmer02",
        "pg_vl_ferrier01",
        "pg_vl_fisherman01",
        "pg_vl_hunter01",
        "pg_vl_movingFamily01",
        "pg_vl_rancher01",
        "pg_vl_rancher02",
        "pg_vl_rancher03",
        "pg_vl_rancher04",
        "pg_vl_rancher05",
        "pg_vl_tradesman01",
        "pg_vl_tradesman02",
        "pg_vl_tradesman03",
        "pg_vl_tradesman04",
        "pg_vl_travellingFamily01",
        "pg_vl_travellingLabour01",
    },
   
    ["stagecoach001x"] = {
        "pg_veh_stagecoach001x_1",
        "pg_veh_stagecoach001x_2",
    },

    ["stagecoach002x"] = {
        "pg_veh_stagecoach002x_1",
        "pg_veh_stagecoach002x_2",
        "pg_veh_stagecoach002x_bootA",
    },

    ["stagecoach003x"] = {
        "pg_veh_stagecoach003x_bootA",
    },

    ["stagecoach004x"] = {
        "pg_mission_utp2_coachLockbox",
        "pg_teamster_armourwag_breakables",
        "pg_teamster_armourwag_gen",
        "pg_teamster_armourwag_perishables",
        "pg_teamster_armourwag_tnt",
    },

    ["stagecoach005x"] = {
        "pg_veh_stagecoach005x_1",
        "pg_veh_stagecoach005x_2",
    },

    ["stagecoach006x"] = {
        "pg_veh_stagecoach006x_1",
        "pg_veh_stagecoach006x_2",
    },

    ["trolley01x"] = {
        "pg_veh_trolley01x_1",
    },

    ["TugBoat2"] = {
        "pg_veh_tugboat2_1",
    },

    ["wagon02x"] = {
        "pg_gunforhire01x",
        "pg_vehload_cotton01",
        "pg_gunforhire02x",
        "pg_gunforhire03x",
        "Pg_Mis_Mud1_Wagon02x",
        "Pg_Mis_Mud1_Wagon02x_NoLooseProps",
        "pg_mission_ammoDeal",
        "pg_mission_caravanWagon02x",
        "pg_mission_marston7_lumber01x",
        "pg_mission_marston7_lumber02x",
        "pg_mission_marston7_lumber03x_doneloading",
        "pg_mission_mud1_wagon03x",
        "pg_mission_tntwagon01x",
        "pg_mission_trainrob3_start01x",
        "pg_mission_weaponsDeal",
        "pg_mission_winter1_4thwagon01x",
        "pg_rc_BeauAndPene101x",
        "pg_rc_beauandpene201x",
        "pg_rc_forgiven601x",
        "pg_rc_nativewagoncornwall01x",
        "pg_rc_saddiesupplies00x",
        "pg_rc_saddiesupplies01x",
        "pg_re_armsdeal01x",
        "pg_re_odriscollwagon01x",
        "pg_re_supplydelivery_gsmith01x",
        "pg_re_supplyDelivery01x",
        "pg_re_trainholdup01x",
        "pg_sp_MarstonsWagon02x",
        "pg_teamster_wagon02x_breakables",
        "pg_teamster_wagon02x_gen",
        "pg_teamster_wagon02x_gen02",
        "pg_teamster_wagon02x_perishables",
        "pg_teamster_wagon02x_tnt",
        "pg_wagon02xClimbtest01x",
        "pg_mission_trainRob4_Wagon02x_dynamite",
        "pg_veh_wagon02x_1",
        "pg_veh_wagon02x_2",
        "pg_veh_wagon02x_3",
        "pg_vl_blacksmith01",
        "pg_vl_butcher01",
        "pg_vl_craftsman01",
        "pg_vl_delivery01",
        "pg_vl_farmer01",
        "pg_vl_farmer02",
        "pg_vl_ferrier01",
        "pg_vl_fisherman01",
        "pg_vl_hunter01",
        "pg_vl_movingFamily01",
        "pg_vl_rancher01",
        "pg_vl_rancher02",
        "pg_vl_rancher03",
        "pg_vl_rancher04",
        "pg_vl_rancher05",
        "pg_vl_tradesman01",
        "pg_vl_tradesman02",
        "pg_vl_tradesman03",
        "pg_vl_tradesman04",
        "pg_vl_travellingFamily01",
        "pg_vl_travellingLabour01",
    },

    ["wagon04x"] = {
        "pg_gunforhire01x",
        "pg_gunforhire02x",
        "pg_gunforhire03x",
        "pg_mission_caravanWagon04x",
        "pg_mission_mud1_jackwagon01x",
        "pg_mission_mud1_wagon01x",
        "pg_mission_mud1_wagon02x",
        "pg_mission_winter1_keiranWag01x",
        "pg_mission_winter1_wag04_01x",
        "pg_teamster_wagon04x_breakables",
        "pg_teamster_wagon04x_gen",
        "pg_teamster_wagon04x_gen02",
        "pg_teamster_wagon04x_perishables",
        "pg_teamster_wagon04x_tnt",
        "pg_veh_wagon04x_1",
        "pg_veh_wagon04x_2",
        "pg_veh_wagon04x_3",
        "pg_vl_blacksmith01",
        "pg_vl_butcher01",
        "pg_vl_craftsman01",
        "pg_vl_delivery01",
        "pg_vl_farmer01",
        "pg_vl_farmer02",
        "pg_vl_ferrier01",
        "pg_vl_fisherman01",
        "pg_vl_hunter01",
        "pg_vl_movingFamily01",
        "pg_vl_rancher01",
        "pg_vl_rancher02",
        "pg_vl_rancher03",
        "pg_vl_rancher04",
        "pg_vl_rancher05",
        "pg_vl_tradesman01",
        "pg_vl_tradesman02",
        "pg_vl_tradesman03",
        "pg_vl_tradesman04",
        "pg_vl_travellingFamily01",
        "pg_vl_travellingLabour01",
        "pg_veh_germFam_wagon04x_01",
    },

    ["wagon05x"] = {
        "pg_delivery_CKToil01x",
        "pg_delivery_Orange01x",
        "pg_gunforhire01x",
        "pg_gunforhire02x",
        "pg_gunforhire03x",
        "pg_ls_soldier2_01x",
        "pg_mission_bra1_wagon",
        "pg_mission_brt1_jump01x",
        "pg_mission_brt1_tomansion01x",
        "pg_mission_brt2",
        "pg_mission_BRT2_escape01x",
        "pg_mission_brt3",
        "pg_mission_caravanWagon05x",
        "pg_mission_moonshineSupplies",
        "pg_rc_ridethelightning01x",
        "pg_re_checkpoint01x",
        "pg_re_savagewagon01x",
        "pg_teamster_wagon05x_breakables",
        "pg_teamster_wagon05x_gen",
        "pg_teamster_wagon05x_perishables",
        "pg_teamster_wagon05x_tnt",
        "pg_veh_wagon05x_1",
        "pg_veh_wagon05x_2",
        "pg_veh_wagon05x_3",
        "pg_veh_wagon05x_4",
        "pg_veh_wagon05x_5",
        "pg_veh_wagon05x_cotton",
    },

    ["wagon06x"] = {
        "pg_teamster_wagon06x_breakables",
        "pg_teamster_wagon06x_gen",
        "pg_teamster_wagon06x_perishables",
        "pg_teamster_wagon06x_tnt",
        "pg_veh_wagon06x_1",
        "pg_veh_wagon06x_2",
        "pg_veh_wagon06x_3",
    },

    ["wagonDairy01x"] = {
        "pg_delivery_dairy01x",
    },

    ["utilliwag"] = {
        "pg_cs_marston101x",
        "pg_mission_marston1_supplies01x",
        "pg_mission_marston1_supplies02x",
        "pg_mission_marston2_postoffice01x",
        "pg_mission_native2_01x",
        "pg_rc_dinoLady01x",
        "pg_teamster_utilitywag_breakables",
        "pg_teamster_utilitywag_gen",
        "pg_teamster_utilitywag_perishables",
        "pg_teamster_utilitywag_tnt",
        "pg_veh_utilliwag_1",
        "pg_veh_utilliwag_2",
        "pg_veh_utilliwag_3",
        "pg_veh_utilliwag_orange_1",
    },

    ["gatchuck"] = {
        "pg_mission_native2_01x",
        "pg_teamster_payroll01x_gat",
    },

    ["wagon05x_2"] = {
        "pg_teamster_wagon05x_gen",
    },

    ["Huntercart01"] = {
        "pg_mp005_huntingWagonTarp01",
    },
}
