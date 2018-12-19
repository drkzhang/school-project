/*
 * Code for class CONTACT
 */

#include "eif_eiffel.h"
#include "../E1/estructure.h"


#ifdef __cplusplus
extern "C" {
#endif

extern EIF_TYPED_VALUE F955_7069(EIF_REFERENCE);
extern EIF_TYPED_VALUE F955_7070(EIF_REFERENCE);
extern EIF_TYPED_VALUE F955_7071(EIF_REFERENCE);
extern EIF_TYPED_VALUE F955_7072(EIF_REFERENCE);
extern void F955_7073(EIF_REFERENCE, EIF_TYPED_VALUE);
extern void F955_7074(EIF_REFERENCE, EIF_TYPED_VALUE);
extern void F955_7075(EIF_REFERENCE, EIF_TYPED_VALUE);
extern void F955_7076(EIF_REFERENCE, EIF_TYPED_VALUE);
extern void EIF_Minit955(void);

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

/* {CONTACT}.customer_contact */
EIF_TYPED_VALUE F955_7069 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_REF;
	r.it_r = *(EIF_REFERENCE *)(Current + RTWA(4943,Dtype(Current)));
	return r;
}


/* {CONTACT}.producer_contact */
EIF_TYPED_VALUE F955_7070 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_REF;
	r.it_r = *(EIF_REFERENCE *)(Current + RTWA(4944,Dtype(Current)));
	return r;
}


/* {CONTACT}.address */
EIF_TYPED_VALUE F955_7071 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_REF;
	r.it_r = *(EIF_REFERENCE *)(Current + RTWA(4945,Dtype(Current)));
	return r;
}


/* {CONTACT}.emptystring */
RTOID (F955_7072)


EIF_TYPED_VALUE F955_7072 (EIF_REFERENCE Current)
{
	GTCX
	RTOTC (F955_7072,13225,RTMS_EX_H("",0,0));
}

/* {CONTACT}.make */
void F955_7073 (EIF_REFERENCE Current, EIF_TYPED_VALUE arg1x)
{
	GTCX
	char *l_feature_name = "make";
	RTEX;
#define arg1 arg1x.it_r
	EIF_TYPED_VALUE up1x = {{0}, SK_POINTER};
#define up1 up1x.it_p
	EIF_REFERENCE tr1 = NULL;
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	
	RTLI(3);
	RTLR(0,arg1);
	RTLR(1,Current);
	RTLR(2,tr1);
	RTLIU(3);
	RTLU (SK_VOID, NULL);
	RTLU(SK_REF,&arg1);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 954, Current, 0, 1, 13225);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(954, Current, 13225);
	RTCC(arg1, 954, l_feature_name, 1, eif_new_type(953, 0x01), 0x01);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAA(Current, dtype, 4943, 0xF80003B9, 0); /* customer_contact */
	*(EIF_REFERENCE *)(Current + RTWA(4943, dtype)) = (EIF_REFERENCE) NULL;
	RTHOOK(2);
	RTDBGAA(Current, dtype, 4944, 0xF80003BB, 0); /* producer_contact */
	*(EIF_REFERENCE *)(Current + RTWA(4944, dtype)) = (EIF_REFERENCE) NULL;
	RTHOOK(3);
	RTDBGAA(Current, dtype, 4945, 0xF80000DE, 0); /* address */
	tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(4946, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
	RTAR(Current, tr1);
	*(EIF_REFERENCE *)(Current + RTWA(4945, dtype)) = (EIF_REFERENCE) RTCCL(tr1);
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(4);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(3);
	RTEE;
#undef up1
#undef arg1
}

/* {CONTACT}.set_customer */
void F955_7074 (EIF_REFERENCE Current, EIF_TYPED_VALUE arg1x)
{
	GTCX
	char *l_feature_name = "set_customer";
	RTEX;
#define arg1 arg1x.it_r
	RTSN;
	RTDA;
	RTLD;
	
	
	RTLI(2);
	RTLR(0,arg1);
	RTLR(1,Current);
	RTLIU(2);
	RTLU (SK_VOID, NULL);
	RTLU(SK_REF,&arg1);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 954, Current, 0, 1, 13226);
	RTSA(Dtype(Current));
	RTSC;
	RTME(Dtype(Current), 0);
	RTGC;
	RTDBGEAA(954, Current, 13226);
	RTCC(arg1, 954, l_feature_name, 1, eif_new_type(953, 0x01), 0x01);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAA(Current, Dtype(Current), 4943, 0xF80003B9, 0); /* customer_contact */
	RTAR(Current, arg1);
	*(EIF_REFERENCE *)(Current + RTWA(4943, Dtype(Current))) = (EIF_REFERENCE) RTCCL(arg1);
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(2);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(3);
	RTEE;
#undef arg1
}

/* {CONTACT}.set_producer */
void F955_7075 (EIF_REFERENCE Current, EIF_TYPED_VALUE arg1x)
{
	GTCX
	char *l_feature_name = "set_producer";
	RTEX;
#define arg1 arg1x.it_r
	RTSN;
	RTDA;
	RTLD;
	
	
	RTLI(2);
	RTLR(0,arg1);
	RTLR(1,Current);
	RTLIU(2);
	RTLU (SK_VOID, NULL);
	RTLU(SK_REF,&arg1);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 954, Current, 0, 1, 13227);
	RTSA(Dtype(Current));
	RTSC;
	RTME(Dtype(Current), 0);
	RTGC;
	RTDBGEAA(954, Current, 13227);
	RTCC(arg1, 954, l_feature_name, 1, eif_new_type(955, 0x01), 0x01);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAA(Current, Dtype(Current), 4944, 0xF80003BB, 0); /* producer_contact */
	RTAR(Current, arg1);
	*(EIF_REFERENCE *)(Current + RTWA(4944, Dtype(Current))) = (EIF_REFERENCE) RTCCL(arg1);
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(2);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(3);
	RTEE;
#undef arg1
}

/* {CONTACT}.set_address */
void F955_7076 (EIF_REFERENCE Current, EIF_TYPED_VALUE arg1x)
{
	GTCX
	char *l_feature_name = "set_address";
	RTEX;
#define arg1 arg1x.it_r
	RTSN;
	RTDA;
	RTLD;
	
	
	RTLI(2);
	RTLR(0,arg1);
	RTLR(1,Current);
	RTLIU(2);
	RTLU (SK_VOID, NULL);
	RTLU(SK_REF,&arg1);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 954, Current, 0, 1, 13228);
	RTSA(Dtype(Current));
	RTSC;
	RTME(Dtype(Current), 0);
	RTGC;
	RTDBGEAA(954, Current, 13228);
	RTCC(arg1, 954, l_feature_name, 1, eif_new_type(222, 0x01), 0x01);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAA(Current, Dtype(Current), 4945, 0xF80000DE, 0); /* address */
	RTAR(Current, arg1);
	*(EIF_REFERENCE *)(Current + RTWA(4945, Dtype(Current))) = (EIF_REFERENCE) RTCCL(arg1);
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(2);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(3);
	RTEE;
#undef arg1
}

void EIF_Minit955 (void)
{
	GTCX
	RTOTS (7072,F955_7072)
}


#ifdef __cplusplus
}
#endif
