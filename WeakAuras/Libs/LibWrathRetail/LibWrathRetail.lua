local classInfo = {
    [1] = { className = "Warrior", classFile = "WARRIOR", classID = 1 },
    [2] = { className = "Paladin", classFile = "PALADIN", classID = 2 },
    [3] = { className = "Hunter", classFile = "HUNTER", classID = 3 },
    [4] = { className = "Rogue", classFile = "ROGUE", classID = 4 },
    [5] = { className = "Priest", classFile = "PRIEST", classID = 5 },
    [6] = { className = "Death Knight", classFile = "DEATHKNIGHT", classID = 6 },
    [7] = { className = "Shaman", classFile = "SHAMAN", classID = 7 },
    [8] = { className = "Mage", classFile = "MAGE", classID = 8 },
    [9] = { className = "Warlock", classFile = "WARLOCK", classID = 9 },
    [11] = { className = "Druid", classFile = "DRUID", classID = 11 },
}

local raceInfo = {
    [1] = { raceName = "Human", clientFileString = "Human", raceID = 1 },
    [2] = { raceName = "Orc", clientFileString = "Orc", raceID = 2 },
    [3] = { raceName = "Dwarf", clientFileString = "Dwarf", raceID = 3 },
    [4] = { raceName = "Night Elf", clientFileString = "NightElf", raceID = 4 },
    [5] = { raceName = "Undead", clientFileString = "Scourge", raceID = 5 },
    [6] = { raceName = "Tauren", clientFileString = "Tauren", raceID = 6 },
    [7] = { raceName = "Gnome", clientFileString = "Gnome", raceID = 7 },
    [8] = { raceName = "Troll", clientFileString = "Troll", raceID = 8 },
    [9] = { raceName = "Goblin", clientFileString = "Goblin", raceID = 9 },
    [10] = { raceName = "Blood Elf", clientFileString = "BloodElf", raceID = 10 },
    [11] = { raceName = "Draenei", clientFileString = "Draenei", raceID = 11 },
    [12] = { raceName = "Fel Orc", clientFileString = "FelOrc", raceID = 12 },
    [13] = { raceName = "Naga", clientFileString = "Naga_", raceID = 13 },
    [14] = { raceName = "Broken", clientFileString = "Broken", raceID = 14 },
    [15] = { raceName = "Skeleton", clientFileString = "Skeleton", raceID = 15 },
    [16] = { raceName = "Vrykul", clientFileString = "Vrykul", raceID = 16 },
    [17] = { raceName = "Tuskarr", clientFileString = "Tuskarr", raceID = 17 },
    [18] = { raceName = "Forest Troll", clientFileString = "ForestTroll", raceID = 18 },
    [19] = { raceName = "Taunka", clientFileString = "Taunka", raceID = 19 },
    [20] = { raceName = "Northrend Skeleton", clientFileString = "NorthrendSkeleton", raceID = 20 },
    [21] = { raceName = "Ice Troll", clientFileString = "IceTroll", raceID = 21 },
}

C_CreatureInfo = {};

function C_CreatureInfo.GetClassInfo(classID)
    return classInfo[classID]
end

function C_CreatureInfo.GetRaceInfo(raceID)
    return raceInfo[raceID]
end

for k, v in pairs(RAID_CLASS_COLORS) do
    RAID_CLASS_COLORS[k].colorStr = CreateColor(v.r, v.g, v.b):GenerateHexColor()
end

SPECIALIZATION = "APE_SPECIALIZATION"

local schoolStringTable = {
	-- Single Schools
	[SCHOOL_MASK_PHYSICAL]						= STRING_SCHOOL_PHYSICAL,
	[SCHOOL_MASK_HOLY]							= STRING_SCHOOL_HOLY,
	[SCHOOL_MASK_FIRE]							= STRING_SCHOOL_FIRE,
	[SCHOOL_MASK_NATURE]						= STRING_SCHOOL_NATURE,
	[SCHOOL_MASK_FROST]							= STRING_SCHOOL_FROST,
	[SCHOOL_MASK_SHADOW]						= STRING_SCHOOL_SHADOW,
	[SCHOOL_MASK_ARCANE]						= STRING_SCHOOL_ARCANE,
	-- Physical and a Magical
	[SCHOOL_MASK_PHYSICAL + SCHOOL_MASK_FIRE]	= STRING_SCHOOL_FLAMESTRIKE,
	[SCHOOL_MASK_PHYSICAL + SCHOOL_MASK_FROST]	= STRING_SCHOOL_FROSTSTRIKE,
	[SCHOOL_MASK_PHYSICAL + SCHOOL_MASK_ARCANE]	= STRING_SCHOOL_SPELLSTRIKE,
	[SCHOOL_MASK_PHYSICAL + SCHOOL_MASK_NATURE]	= STRING_SCHOOL_STORMSTRIKE,
	[SCHOOL_MASK_PHYSICAL + SCHOOL_MASK_SHADOW]	= STRING_SCHOOL_SHADOWSTRIKE,
	[SCHOOL_MASK_PHYSICAL + SCHOOL_MASK_HOLY]	= STRING_SCHOOL_HOLYSTRIKE,
	-- Two Magical Schools
	[SCHOOL_MASK_FIRE + SCHOOL_MASK_FROST]		= STRING_SCHOOL_FROSTFIRE,
	[SCHOOL_MASK_FIRE + SCHOOL_MASK_ARCANE]		= STRING_SCHOOL_SPELLFIRE,
	[SCHOOL_MASK_FIRE + SCHOOL_MASK_NATURE]		= STRING_SCHOOL_FIRESTORM,
	[SCHOOL_MASK_FIRE + SCHOOL_MASK_SHADOW]		= STRING_SCHOOL_SHADOWFLAME,
	[SCHOOL_MASK_FIRE + SCHOOL_MASK_HOLY]		= STRING_SCHOOL_HOLYFIRE,
	[SCHOOL_MASK_FROST + SCHOOL_MASK_ARCANE]	= STRING_SCHOOL_SPELLFROST,
	[SCHOOL_MASK_FROST + SCHOOL_MASK_NATURE]	= STRING_SCHOOL_FROSTSTORM,
	[SCHOOL_MASK_FROST + SCHOOL_MASK_SHADOW]	= STRING_SCHOOL_SHADOWFROST,
	[SCHOOL_MASK_FROST + SCHOOL_MASK_HOLY]		= STRING_SCHOOL_HOLYFROST,
	[SCHOOL_MASK_ARCANE + SCHOOL_MASK_NATURE]	= STRING_SCHOOL_SPELLSTORM,
	[SCHOOL_MASK_ARCANE + SCHOOL_MASK_SHADOW]	= STRING_SCHOOL_SPELLSHADOW,
	[SCHOOL_MASK_ARCANE + SCHOOL_MASK_HOLY]		= STRING_SCHOOL_DIVINE,
	[SCHOOL_MASK_NATURE + SCHOOL_MASK_SHADOW]	= STRING_SCHOOL_SHADOWSTORM,
	[SCHOOL_MASK_NATURE + SCHOOL_MASK_HOLY]		= STRING_SCHOOL_HOLYSTORM,
	[SCHOOL_MASK_SHADOW + SCHOOL_MASK_HOLY]		= STRING_SCHOOL_SHADOWLIGHT,
	-- Three or more schools
	[SCHOOL_MASK_FIRE + SCHOOL_MASK_FROST + SCHOOL_MASK_NATURE]																						= STRING_SCHOOL_ELEMENTAL,
	[SCHOOL_MASK_FIRE + SCHOOL_MASK_FROST + SCHOOL_MASK_ARCANE + SCHOOL_MASK_NATURE + SCHOOL_MASK_SHADOW]											= STRING_SCHOOL_CHROMATIC,
	[SCHOOL_MASK_FIRE + SCHOOL_MASK_FROST + SCHOOL_MASK_ARCANE + SCHOOL_MASK_NATURE + SCHOOL_MASK_SHADOW + SCHOOL_MASK_HOLY]						= STRING_SCHOOL_MAGIC,
	[SCHOOL_MASK_PHYSICAL + SCHOOL_MASK_FIRE + SCHOOL_MASK_FROST + SCHOOL_MASK_ARCANE + SCHOOL_MASK_NATURE + SCHOOL_MASK_SHADOW + SCHOOL_MASK_HOLY]	= STRING_SCHOOL_CHAOS,
};

function GetSchoolString(schoolMask)
    print("GetSchoolString("..schoolMask..")")
    return schoolStringTable[schoolMask]
end

local difficultyTable = {
    [1] = { name = "Normal", groupType = "party" },
    [2] = { name = "Heroic", groupType = "party"  },
    [3] = { name = "10 Player", groupType = "raid" },
    [4] = { name = "25 Player", groupType = "raid" },
    [5] = { name = "10 Player Raid (Heroic)", groupType = "raid" },
    [6] = { name = "25 Player Raid (Heroic)", groupType = "raid" },
}

function GetDifficultyInfo(difficultyID)
    print("GetDifficultyInfo("..difficultyID..")")
    return difficultyTable[difficultyID]
end

function GetItemSubClassInfo(classID, subClassID)
    print("GetItemSubClassInfo("..classID..", "..subClassID..")")
    return "APE_SUBCLASS", false
end
