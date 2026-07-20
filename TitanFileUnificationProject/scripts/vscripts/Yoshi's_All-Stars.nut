::MasterTitanTable <- {} // For Modded Titans

function main()
{
	printl( "STAAAARRRRSSSS" )
}
main()

function MasterTitanCreation( titan_array_name, setfile, type, emb_ove, unl_lv, p_name, p_desc, t_img_imc, t_img_mcor, c_name, c_desc, c_img, s_s, s_a, s_h, s_b, ref_rodeo, titan_mdl, hatch_mdl, rodeo_num, coop_img )
{
	local modded_titan_table = {}
	
	modded_titan_table.setfile <- setfile//a
	modded_titan_table.type <- type //b
	modded_titan_table.embark_override <- emb_ove //c

	modded_titan_table.unlock_level <- unl_lv //d
	modded_titan_table.print_name <- p_name // e
	modded_titan_table.print_desc <- p_desc // f
	modded_titan_table.titan_img_imc <- t_img_imc // g
	modded_titan_table.titan_img_mcor <- t_img_mcor // h

	modded_titan_table.core_name <- c_name // i
	modded_titan_table.core_desc <- c_desc // j
	modded_titan_table.core_img <- c_img // k

	modded_titan_table.stat_speed <- s_s // l
	modded_titan_table.stat_accel <- s_a // m
	modded_titan_table.stat_health <- s_h // n
	modded_titan_table.stat_boost_count <- s_b // o

	modded_titan_table.rodeo_ref_override <- ref_rodeo // p

	modded_titan_table.titan_model <- titan_mdl // q
	modded_titan_table.hatch_model <- hatch_mdl // r
	modded_titan_table.rodeo_hitbox_number <- rodeo_num // s
	modded_titan_table.coop_img <- coop_img // t

	MasterTitanTable.titan_array_name <- modded_titan_table

	printt( MasterTitanTable.titan_array_name )
}
//holy shit i almost had the entire alphabet [ u v w x y z ]