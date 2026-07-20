


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
//5 will be add to table

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
		if( IsValid( MasterTitanTable ) )
		{

			local loop_max = MasterTitanTable.len()
			for( local E = 0; E < loop_max ; E++ )
			{
				local titan = MasterTitanTable[ E ]

				local setfile = titan.setfile
				local type = titan.titan_type
				local embark_override = titan.embark_override

				local unl_lv = titan.unlock_level
				local printed_name = titan.print_name
				local printed_desc = titan.print_desc
				local titan_img_imc = titan.titan_img_imc
				local titan_img_mcor = titan.titan_img_mcor
				local core_print_name = titan.core_name
				local core_print_desc = titan.core_desc
				local core_img = titan.core_img
				
				local stat_speed = titan.stat_speed
				local stat_accel = titan.stat_accel
				local stat_health = titan.stat_health
				local stat_boost_count = titan.stat_boost_count

				local new_rodeo_ref = titan.rodeo_ref_override

				BlackMarketTitan_Construct( script_int, setfile, type, embark_override, unl_lv, printed_name, printed_desc, titan_img_imc, titan_img_mcor, core_print_name, core_print_desc, core_img, stat_speed, stat_accel, stat_health, stat_boost_count, new_rodeo_ref )
			}
		}
		return
		
	}
	else// INSERT CUSTOM MDL CONST, HATCH CONST, and RODEO HITBOX NUMBER ( weakpoint basically )
	{
		if( IsValid( MasterTitanTable ) )
		{
			local loop_max = MasterTitanTable.len()
			for( local E = 0; E < loop_max; E++ )
			{
				local titan = MasterTitanTable[ E ]

				local model_name = titan.titan_model
				local hatch_name = titan.hatch_model
				local rodeo_hitbox = titan.rodeo_hitbox_number
				local coop_img = titan.coop_img

				BlackMarketModel_Register( model_name, hatch_name, rodeo_hitbox, coop_img )
			}
		}
		return
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

//mp_titanweapon_fusion_core - core override funcs
//class_titan - weapon overrides, they are in place mostly from Titan-Transfer but I must improve
//_rodeo_shared - some slight edits
// that one xp/unlock script
//classes - unknown how to  auto import

//Saving these here because they'll be used a lot
/*
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
*/