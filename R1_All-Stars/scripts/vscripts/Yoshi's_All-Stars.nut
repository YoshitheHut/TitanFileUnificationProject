// For Modded Titans
//const LEGION_MODEL = "models/titans/heavy/titan_heavy_deadbolt.mdl"
const BASE_TITAN_COUNT = 4 //Adds 3 for titans and 1 to make a valid array placement
function main()
{
	::MasterModdedTitans <- []
	::Titans_Enum_Placement <- 3
	Globalize( MasterTitanCreation )
	printl( "STAAAARRRRSSSS" )
	
}

function MasterTitanCreation( file, type, emb_ove, unl_lv, p_name, p_desc, t_img_imc, t_img_mcor, c_name, c_desc, c_img, s_s, s_a, s_h, s_b, ref_rodeo, titan_mdl, hatch_mdl, rodeo_num, coop_img )
{
	//local modded_titan_table = {}

	printl( file )

	local titan_array_name = {}
	
	titan_array_name.setfile <- file//a
	titan_array_name.titan_type <- type //b
	titan_array_name.embark_override <- emb_ove //c

	titan_array_name.unlock_level <- unl_lv //d
	titan_array_name.print_name <- p_name // e
	titan_array_name.print_desc <- p_desc // f
	titan_array_name.titan_img_imc <- t_img_imc // g
	titan_array_name.titan_img_mcor <- t_img_mcor // h

	titan_array_name.core_name <- c_name // i
	titan_array_name.core_desc <- c_desc // j
	titan_array_name.core_img <- c_img // k

	titan_array_name.stat_speed <- s_s // l
	titan_array_name.stat_accel <- s_a // m
	titan_array_name.stat_health <- s_h // n
	titan_array_name.stat_boost_count <- s_b // o

	titan_array_name.rodeo_ref_override <- ref_rodeo // p

	titan_array_name.titan_model <- titan_mdl // q
	titan_array_name.hatch_model <- hatch_mdl // r
	titan_array_name.rodeo_hitbox_number <- rodeo_num // s
	titan_array_name.coop_img <- coop_img // t

	MasterModdedTitans.append(titan_array_name)
	//MasterTitanTable.titan_array_name <- titan_array_name

	printt( titan_array_name )
	//setUp( 2 )
	//setUp( 0 )
	::Titans_Enum_Placement <- ::Titans_Enum_Placement + 1
	printl(::Titans_Enum_Placement)
	
	add_setfile_persistance( file, ::Titans_Enum_Placement )
	CreateBlackMarketModdedItems( Titans_Enum_Placement - BASE_TITAN_COUNT )
}
//holy shit i almost had the entire alphabet [ u v w x y z ]

function titan_dash_mathematics( requested_dashes )
{
	local dash_maxima = 100

	local dash_drain = dash_maxima / requested_dashes

	return dash_drain
}

main()

/*

"class_list"
{
	import "some set file.set"
	import "some other set file.set"
}

seems to turn into

"class_list"
{
	"titan_whatever"
	{
		some stuff and things
	},
	"titan_other_whatever"
	{
		some other stuff and things
	}
}

*/