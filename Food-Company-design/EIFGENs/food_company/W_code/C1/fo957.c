/*
 * Code for class FOOD
 */

#include "eif_eiffel.h"
#include "../E1/estructure.h"


#ifdef __cplusplus
extern "C" {
#endif

extern EIF_TYPED_VALUE F957_7083(EIF_REFERENCE);
extern EIF_TYPED_VALUE F957_7084(EIF_REFERENCE);
extern void F957_7085(EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE);
extern void EIF_Minit957(void);

#ifdef __cplusplus
}
#endif


#ifdef __cplusplus
extern "C" {
#endif


#ifdef __cplusplus
}
#endif


#ifdef __cplusplus
extern "C" {
#endif

/* {FOOD}.food_name */
EIF_TYPED_VALUE F957_7083 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_REF;
	r.it_r = *(EIF_REFERENCE *)(Current + RTWA(4957,Dtype(Current)));
	return r;
}


/* {FOOD}.expire_date */
EIF_TYPED_VALUE F957_7084 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_REF;
	r.it_r = *(EIF_REFERENCE *)(Current + RTWA(4958,Dtype(Current)));
	return r;
}


/* {FOOD}.make */
void F957_7085 (EIF_REFERENCE Current, EIF_TYPED_VALUE arg1x, EIF_TYPED_VALUE arg2x)
{
	GTCX
	char *l_feature_name = "make";
	RTEX;
#define arg1 arg1x.it_r
#define arg2 arg2x.it_r
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	
	RTLI(3);
	RTLR(0,arg1);
	RTLR(1,arg2);
	RTLR(2,Current);
	RTLIU(3);
	RTLU (SK_VOID, NULL);
	RTLU(SK_REF,&arg1);
	RTLU(SK_REF,&arg2);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 956, Current, 0, 2, 13237);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(956, Current, 13237);
	RTCC(arg1, 956, l_feature_name, 1, eif_new_type(222, 0x01), 0x01);
	RTCC(arg2, 956, l_feature_name, 2, eif_new_type(982, 0x01), 0x01);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAA(Current, dtype, 4957, 0xF80000DE, 0); /* food_name */
	RTAR(Current, arg1);
	*(EIF_REFERENCE *)(Current + RTWA(4957, dtype)) = (EIF_REFERENCE) RTCCL(arg1);
	RTHOOK(2);
	RTDBGAA(Current, dtype, 4958, 0xF80003D6, 0); /* expire_date */
	RTAR(Current, arg2);
	*(EIF_REFERENCE *)(Current + RTWA(4958, dtype)) = (EIF_REFERENCE) RTCCL(arg2);
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(3);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(4);
	RTEE;
#undef arg2
#undef arg1
}

void EIF_Minit957 (void)
{
	GTCX
}


#ifdef __cplusplus
}
#endif
