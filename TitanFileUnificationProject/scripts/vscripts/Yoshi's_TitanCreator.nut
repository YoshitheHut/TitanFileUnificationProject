
const DMG_COR_IMG = "../ui/menu/items/ability_images/chassis_page_core_atlas"
const DAS_COR_IMG = "../ui/menu/items/ability_images/chassis_page_core_stryder"
const SHI_COR_IMG = "../ui/menu/items/ability_images/chassis_page_core_ogre"

const DMG_COR_NAM = "#CHASSIS_ATLAS_CORE_NAME"
const DMG_COR_DES = "#CHASSIS_ATLAS_CORE_DESCRIPTION"
const DAS_COR_NAM = "#CHASSIS_STRYDER_CORE_NAME"
const DAS_COR_DES = "#CHASSIS_STRYDER_CORE_DESCRIPTION"
const SHI_COR_NAM = "#CHASSIS_OGRE_CORE_NAME"
const SHI_COR_DES = "#CHASSIS_OGRE_CORE_DESCRIPTION"

const ATLAS_IMG_IMC = "../ui/menu/loadouts/titan_chassis_atlas_imc"
const ATLAS_IMG_MCO = "../ui/menu/loadouts/titan_chassis_atlas_mcor"
const STRYDER_IMG_IMC = "../ui/menu/loadouts/titan_chassis_stryder_imc"
const STRYDER_IMG_MCO = "../ui/menu/loadouts/titan_chassis_stryder_mcor"
const OGRE_IMG_IMC = "../ui/menu/loadouts/titan_chassis_ogre_imc"
const OGRE_IMG_MCO = "../ui/menu/loadouts/titan_chassis_ogre_mcor"

//models
const LEGION_MODEL = "models/titans/heavy/titan_heavy_deadbolt.mdl"


/*
Instructions:

if using new model put const above here

Go to INSERT TITAN HERE and insert a construct function call.
If using a custom model create a new model register function call.

name = the titan name, example: "titan_atlas"
type = the titan type, example: "stryder", for this mod please use "special_stryder", "special_atlas", or "special_ogre"
unless you need it specific.
embark override is purely for _titan_embark script. use titan_ogre/titan_atlas/titan_stryder depending, please no null

Rest is pretty self-explanatory really, its in the name of the variables.

Now remember to import SET file in classes

*/


function main()
{
	Globalize( setUp )
	//Globalize( BlackMarketTitan_Construct )
}

//self notes: non-user relevant
//0 = Using _items
//1 = Overrides
//2 = _pdef related
//3 = model related
//4 = import SET

function setUp( script_int )//I shoulda had this as a bool but eh.. NO, I got idea
{
	::BlackMarketTitans <- {}
	::TitanNames <- []
	::BlackMarketTitanModels <- {}
	::TitanModels <- []

	::Titans_Enum_Placement <- 3 //Base number of titans at start

	if( script_int == 1 )
	{
		//IncludeFile( "_items" )
		printl( "BlackMarketScript is ACTIVE" ) // I would add this to the top of this func, but it'd spam console
	}
	else if ( script_int == 0 )
	{
		IncludeFile( "_items" )
		printl( "BlackMarketScript is ACTIVE in ITEMS" )
	}

	if ( script_int != 3 )// INSERT TITAN HERE
	{
		BlackMarketTitan_Construct( script_int, "titan_legion", "special_ogre", "titan_ogre", 50, "Legion", "Ultra-Heavy Ogre classed titan with slow speed and heavy armor.", OGRE_IMG_IMC, OGRE_IMG_MCO, "Core Ability: Bullet Storm", "Gives you a high-capacity, high-firerate XO-16 for it's duration", "../ui/menu/items/mod_icons/scatterfire", 30, 40, 100, 1, "chest_focus" )
	}
	else// INSERT CUSTOM MDL CONST, HATCH CONST, and RODEO HITBOX NUMBER ( weakpoint basically )
	{
		BlackMarketModel_Register( LEGION_MODEL, STRYDER_HATCH_PANEL, 53, "../ui/menu/items/mod_icons/scatterfire" )
	}

}

function BlackMarketModel_Register( identity, hatch_identity, rodeo_number, coop_img )
{
	TitanModels.append( identity )
	local TitanTable = {}
	TitanTable.id <- identity
	TitanTable.hatch <- hatch_identity
	TitanTable.ronu <- rodeo_number
	TitanTable.coim <- coop_img
	BlackMarketTitanModels[ identity ] <- TitanTable
}

function BlackMarketTitan_Construct( call_type, name, type, embark_override, unlock_level, game_name, game_desc, titan_img_imc, titan_img_mcor, core_name, core_desc, core_img, statSpeed = 50, statAccel = 50, statHealth = 50, statDash = 50, different_rodeo_ref = null )
{

	if( call_type == 0 )
	{
		BlackMarket_ITEMCALL( name, unlock_level, game_name, game_desc, titan_img_imc, titan_img_mcor, core_name, core_desc, core_img, statSpeed, statAccel, statHealth, statDash )
	}
	else if ( call_type == 1 )// call 1 if you need override variables
	{
		TitanNames.append( name )
		//printl( TitanNames[0] )
		local TitanTable = {}
		TitanTable.name <- name
		TitanTable.type <- type
		TitanTable.emov <- embark_override
		TitanTable.rodo <- different_rodeo_ref //Not needed but important in case of legion and those like him
		BlackMarketTitans[ name ] <- TitanTable
	}
	else if ( call_type == 2 ) // pdef
	{
		::Titans_Enum_Placement <- ::Titans_Enum_Placement + 1
		::titanSetFile[ name ] <- ::Titans_Enum_Placement
	}
}

main()

//_pdef -that enum is gonna be trouble - CHECK
// coop hud - eh - CHECK
//_rodeo - difficult-ish - CHECK, not that difficult
//_rodeo_shared - some slight edits
// that one xp/unlock script
//classes - unknown how to  auto import