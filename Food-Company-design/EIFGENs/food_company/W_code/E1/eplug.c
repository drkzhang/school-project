/*
 * Generated by ISE 16.05.9.8969 GPL Edition - win64
 */

#include "eif_eiffel.h"
#include "eif_project.h"
#include "egc_include.h"

#ifdef __cplusplus
extern "C" {
#endif
extern void F1_23();
extern EIF_REFERENCE F1_14();
extern void F221_6247();
extern void F223_6401();
extern void F228_6470();
extern void F229_6610();
extern void F296_3568();
extern void F249_6128();
extern void F52_1192();
extern EIF_REFERENCE F52_1179();
extern EIF_BOOLEAN F52_1191();
extern EIF_BOOLEAN F52_1196();
extern void F52_1201();
extern void F52_1202();
extern void F52_1203();
extern void F45_1105();
extern EIF_TYPED_VALUE F45_1106();

long *eif_area_table = (long *)0;
long *eif_lower_table = (long *)0;


extern void egc_init_plug (void); 
void egc_init_plug (void)
{
	egc_prof_enabled = (EIF_INTEGER) 0;
	egc_correct_mismatch = (void (*)(EIF_REFERENCE)) F1_23;
	egc_twin = (EIF_TYPED_VALUE (*)(EIF_REFERENCE)) F1_14;
	egc_strmake = (void (*)(EIF_REFERENCE, EIF_TYPED_VALUE)) F221_6247;
	egc_str32make = (void (*)(EIF_REFERENCE, EIF_TYPED_VALUE)) F228_6470;
	egc_arrmake = (void (*)(EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) F296_3568;
	egc_strset = (void (*)(EIF_REFERENCE, EIF_TYPED_VALUE)) F223_6401;
	egc_str32set = (void (*)(EIF_REFERENCE, EIF_TYPED_VALUE)) F229_6610;
	egc_routdisp_wb = (void (*)(EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE, EIF_TYPED_VALUE, EIF_TYPED_VALUE, EIF_TYPED_VALUE, EIF_TYPED_VALUE, EIF_TYPED_VALUE, EIF_TYPED_VALUE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) F249_6128;
	egc_is_scoop_capable = 0;
	egc_set_exception_data = (void (*)(EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE, EIF_TYPED_VALUE, EIF_TYPED_VALUE, EIF_TYPED_VALUE, EIF_TYPED_VALUE, EIF_TYPED_VALUE, EIF_TYPED_VALUE, EIF_TYPED_VALUE, EIF_TYPED_VALUE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) F52_1192;
	egc_set_last_exception = (void (*)(EIF_REFERENCE, EIF_TYPED_VALUE)) F52_1191;
	egc_last_exception = (EIF_TYPED_VALUE (*)(EIF_REFERENCE)) F52_1179;
	egc_is_code_ignored = (EIF_TYPED_VALUE (*)(EIF_REFERENCE, EIF_TYPED_VALUE)) F52_1196;
	egc_once_raise = (void (*)(EIF_REFERENCE, EIF_TYPED_VALUE)) F52_1201;
	egc_init_exception_manager = (void (*)(EIF_REFERENCE)) F52_1202;
	egc_free_preallocated_trace = (void (*)(EIF_REFERENCE)) F52_1203;

	egc_str_dtype = 222;

	egc_str32_dtype = 228;
	egc_arr_dtype = 295;
	egc_tup_dtype = 176;
	egc_disp_rout_id = 2678;
	egc_copy_rout_id = 18;
	egc_is_equal_rout_id = 11;

	egc_sp_char = 0x01F7;
	egc_sp_wchar = 0x01DB;
	egc_sp_bool = 0x020F;
	egc_sp_uint8 = 0x01B7;
	egc_sp_uint16 = 0x026C;
	egc_sp_uint32 = 0x031A;
	egc_sp_uint64 = 0x0181;
	egc_sp_int8 = 0x02D4;
	egc_sp_int16 = 0x02F7;
	egc_sp_int32 = 0x013C;
	egc_sp_int64 = 0x0336;
	egc_sp_real32 = 0x02B1;
	egc_sp_real64 = 0x028E;
	egc_sp_pointer = 0x0385;
	egc_sp_ref = 0x012D;

	egc_uint8_dtype = 199;
	egc_uint16_dtype = 205;
	egc_uint32_dtype = 202;
	egc_uint64_dtype = 214;
	egc_int8_dtype = 178;
	egc_int16_dtype = 211;
	egc_int32_dtype = 208;
	egc_int64_dtype = 190;
	egc_bool_dtype = 193;
	egc_real32_dtype = 181;
	egc_char_dtype = 187;
	egc_wchar_dtype = 184;
	egc_real64_dtype = 196;
	egc_point_dtype = 217;

	egc_exception_dtype = 63;
	egc_except_emnger_dtype = 51;

	egc_ce_type = egc_ce_type_init;

	egc_ce_exp_type = egc_ce_exp_type_init;
	egc_fsystem = egc_fsystem_init;
	egc_system_mod_init = egc_system_mod_init_init;
	egc_partab = egc_partab_init;
	egc_partab_size = egc_partab_size_init;
	egc_foption = egc_foption_init;
	egc_frozen = egc_frozen_init;
	egc_fpatidtab = egc_fpatidtab_init;
	egc_address_table = egc_address_table_init;
	egc_fpattern = egc_fpattern_init;

	egc_einit = egc_einit_init;
	egc_tabinit = egc_tabinit_init;
	egc_forg_table = egc_forg_table_init;

	egc_system_name = "priority_queue_adt_soln";
	egc_system_location = "C:\\Users\\ct_ji\\Desktop\\FALL2016\\EECS3311\\report1\\food_company\\EIFGENs\\food_company\\W_code";
	egc_compiler_tag = 38;
	egc_project_version = 1475186566;
	egc_has_old_special_semantic = 0;
	egc_has_ieee_semantic = 1;
	scount = 987;

	egc_rcount = 1;
	egc_ridx = 0;
	egc_rlist = (char**) eif_malloc (sizeof(char*)*egc_rcount);
	egc_rcdt = (int32 *) eif_malloc (sizeof(int32)*egc_rcount);
	egc_rcrid = (int32 *) eif_malloc (sizeof(int32)*egc_rcount);
	egc_rcarg = (int32 *) eif_malloc (sizeof(int32)*egc_rcount);
	egc_rlist[0] = "START.make";
	egc_rcdt[0] = 0;
	egc_rcrid[0] = 4968;
	egc_rcarg[0] = 0;
	
	
	egc_platform_level = 0x00000D00;
	egc_rt_extension_dt = 44;
	egc_rt_extension_notify = (void (*)(EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) F45_1105;
	egc_rt_extension_notify_argument = (EIF_TYPED_VALUE (*)(EIF_REFERENCE, EIF_TYPED_VALUE)) F45_1106;
}

void egc_rcdt_init (void)
{
	if (egc_rcdt[0] == 0) {
		egc_rcdt[0] = 957; /* START */
	}
}

#ifdef __cplusplus
}
#endif
