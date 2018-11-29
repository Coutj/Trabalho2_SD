/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0xfbc00daa */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/juan/Documents/SD_trabalho2/Trabalho2_SD/Calculadora/Multiplicador.vhd";
extern char *IEEE_P_1242562249;
extern char *IEEE_P_2592010699;

char *ieee_p_1242562249_sub_1006216973935617061_1035706684(char *, char *, char *, char *, int );
char *ieee_p_1242562249_sub_1701011461141717515_1035706684(char *, char *, char *, char *, char *, char *);
char *ieee_p_1242562249_sub_2177518728674633585_1035706684(char *, char *, char *, char *, char *, char *);


static void work_a_1723026100_3745244343_p_0(char *t0)
{
    char t1[16];
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;

LAB0:    xsi_set_current_line(51, ng0);

LAB3:    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 6248U);
    t4 = (t0 + 1192U);
    t5 = *((char **)t4);
    t4 = (t0 + 6264U);
    t6 = ieee_p_1242562249_sub_2177518728674633585_1035706684(IEEE_P_1242562249, t1, t3, t2, t5, t4);
    t7 = (t0 + 3912);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    memcpy(t11, t6, 8U);
    xsi_driver_first_trans_fast(t7);

LAB2:    t12 = (t0 + 3800);
    *((int *)t12) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_1723026100_3745244343_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(52, ng0);

LAB3:    t1 = (t0 + 1672U);
    t2 = *((char **)t1);
    t1 = (t0 + 3976);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 8U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 3816);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_1723026100_3745244343_p_2(char *t0)
{
    char t17[16];
    char t28[16];
    char *t1;
    char *t2;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    char *t8;
    char *t10;
    unsigned char t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    unsigned char t16;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;

LAB0:    xsi_set_current_line(57, ng0);
    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t1 = (t0 + 6372);
    t4 = ((IEEE_P_2592010699) + 4000);
    t5 = xsi_vhdl_lessthanEqual(t4, t2, 8U, t1, 4U);
    if (t5 != 0)
        goto LAB2;

LAB4:    t7 = (t0 + 1512U);
    t8 = *((char **)t7);
    t7 = (t0 + 6376);
    t10 = ((IEEE_P_2592010699) + 4000);
    t11 = xsi_vhdl_greaterEqual(t10, t8, 8U, t7, 4U);
    if (t11 == 1)
        goto LAB7;

LAB8:    t6 = (unsigned char)0;

LAB9:    if (t6 != 0)
        goto LAB5;

LAB6:    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t1 = (t0 + 6385);
    t4 = ((IEEE_P_2592010699) + 4000);
    t6 = xsi_vhdl_greaterEqual(t4, t2, 8U, t1, 5U);
    if (t6 == 1)
        goto LAB12;

LAB13:    t5 = (unsigned char)0;

LAB14:    if (t5 != 0)
        goto LAB10;

LAB11:    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t1 = (t0 + 6395);
    t4 = ((IEEE_P_2592010699) + 4000);
    t6 = xsi_vhdl_greaterEqual(t4, t2, 8U, t1, 5U);
    if (t6 == 1)
        goto LAB17;

LAB18:    t5 = (unsigned char)0;

LAB19:    if (t5 != 0)
        goto LAB15;

LAB16:    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t1 = (t0 + 6406);
    t4 = ((IEEE_P_2592010699) + 4000);
    t6 = xsi_vhdl_greaterEqual(t4, t2, 8U, t1, 6U);
    if (t6 == 1)
        goto LAB22;

LAB23:    t5 = (unsigned char)0;

LAB24:    if (t5 != 0)
        goto LAB20;

LAB21:    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t1 = (t0 + 6418);
    t4 = ((IEEE_P_2592010699) + 4000);
    t6 = xsi_vhdl_greaterEqual(t4, t2, 8U, t1, 6U);
    if (t6 == 1)
        goto LAB27;

LAB28:    t5 = (unsigned char)0;

LAB29:    if (t5 != 0)
        goto LAB25;

LAB26:    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t1 = (t0 + 6430);
    t4 = ((IEEE_P_2592010699) + 4000);
    t6 = xsi_vhdl_greaterEqual(t4, t2, 8U, t1, 6U);
    if (t6 == 1)
        goto LAB32;

LAB33:    t5 = (unsigned char)0;

LAB34:    if (t5 != 0)
        goto LAB30;

LAB31:    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t1 = (t0 + 6443);
    t4 = ((IEEE_P_2592010699) + 4000);
    t6 = xsi_vhdl_greaterEqual(t4, t2, 8U, t1, 7U);
    if (t6 == 1)
        goto LAB37;

LAB38:    t5 = (unsigned char)0;

LAB39:    if (t5 != 0)
        goto LAB35;

LAB36:    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t1 = (t0 + 6457);
    t4 = ((IEEE_P_2592010699) + 4000);
    t6 = xsi_vhdl_greaterEqual(t4, t2, 8U, t1, 8U);
    if (t6 == 1)
        goto LAB42;

LAB43:    t5 = (unsigned char)0;

LAB44:    if (t5 != 0)
        goto LAB40;

LAB41:
LAB3:    t1 = (t0 + 3832);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    goto LAB3;

LAB5:    xsi_set_current_line(63, ng0);
    t18 = (t0 + 1512U);
    t19 = *((char **)t18);
    t18 = (t0 + 6296U);
    t20 = (t0 + 1832U);
    t21 = *((char **)t20);
    t20 = (t0 + 6312U);
    t22 = ieee_p_1242562249_sub_1701011461141717515_1035706684(IEEE_P_1242562249, t17, t19, t18, t21, t20);
    t23 = (t0 + 4040);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    t26 = (t25 + 56U);
    t27 = *((char **)t26);
    memcpy(t27, t22, 8U);
    xsi_driver_first_trans_fast(t23);
    goto LAB3;

LAB7:    t12 = (t0 + 1512U);
    t13 = *((char **)t12);
    t12 = (t0 + 6380);
    t15 = ((IEEE_P_2592010699) + 4000);
    t16 = xsi_vhdl_lessthanEqual(t15, t13, 8U, t12, 5U);
    t6 = t16;
    goto LAB9;

LAB10:    xsi_set_current_line(67, ng0);
    t12 = (t0 + 1512U);
    t13 = *((char **)t12);
    t12 = (t0 + 6296U);
    t14 = (t0 + 1832U);
    t15 = *((char **)t14);
    t14 = (t0 + 6312U);
    t18 = ieee_p_1242562249_sub_1006216973935617061_1035706684(IEEE_P_1242562249, t28, t15, t14, 2);
    t19 = ieee_p_1242562249_sub_1701011461141717515_1035706684(IEEE_P_1242562249, t17, t13, t12, t18, t28);
    t20 = (t0 + 4040);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    memcpy(t24, t19, 8U);
    xsi_driver_first_trans_fast(t20);
    goto LAB3;

LAB12:    t7 = (t0 + 1512U);
    t8 = *((char **)t7);
    t7 = (t0 + 6390);
    t10 = ((IEEE_P_2592010699) + 4000);
    t11 = xsi_vhdl_lessthanEqual(t10, t8, 8U, t7, 5U);
    t5 = t11;
    goto LAB14;

LAB15:    xsi_set_current_line(71, ng0);
    t12 = (t0 + 1512U);
    t13 = *((char **)t12);
    t12 = (t0 + 6296U);
    t14 = (t0 + 1832U);
    t15 = *((char **)t14);
    t14 = (t0 + 6312U);
    t18 = ieee_p_1242562249_sub_1006216973935617061_1035706684(IEEE_P_1242562249, t28, t15, t14, 3);
    t19 = ieee_p_1242562249_sub_1701011461141717515_1035706684(IEEE_P_1242562249, t17, t13, t12, t18, t28);
    t20 = (t0 + 4040);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    memcpy(t24, t19, 8U);
    xsi_driver_first_trans_fast(t20);
    goto LAB3;

LAB17:    t7 = (t0 + 1512U);
    t8 = *((char **)t7);
    t7 = (t0 + 6400);
    t10 = ((IEEE_P_2592010699) + 4000);
    t11 = xsi_vhdl_lessthanEqual(t10, t8, 8U, t7, 6U);
    t5 = t11;
    goto LAB19;

LAB20:    xsi_set_current_line(75, ng0);
    t12 = (t0 + 1512U);
    t13 = *((char **)t12);
    t12 = (t0 + 6296U);
    t14 = (t0 + 1832U);
    t15 = *((char **)t14);
    t14 = (t0 + 6312U);
    t18 = ieee_p_1242562249_sub_1006216973935617061_1035706684(IEEE_P_1242562249, t28, t15, t14, 4);
    t19 = ieee_p_1242562249_sub_1701011461141717515_1035706684(IEEE_P_1242562249, t17, t13, t12, t18, t28);
    t20 = (t0 + 4040);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    memcpy(t24, t19, 8U);
    xsi_driver_first_trans_fast(t20);
    goto LAB3;

LAB22:    t7 = (t0 + 1512U);
    t8 = *((char **)t7);
    t7 = (t0 + 6412);
    t10 = ((IEEE_P_2592010699) + 4000);
    t11 = xsi_vhdl_lessthanEqual(t10, t8, 8U, t7, 6U);
    t5 = t11;
    goto LAB24;

LAB25:    xsi_set_current_line(79, ng0);
    t12 = (t0 + 1512U);
    t13 = *((char **)t12);
    t12 = (t0 + 6296U);
    t14 = (t0 + 1832U);
    t15 = *((char **)t14);
    t14 = (t0 + 6312U);
    t18 = ieee_p_1242562249_sub_1006216973935617061_1035706684(IEEE_P_1242562249, t28, t15, t14, 5);
    t19 = ieee_p_1242562249_sub_1701011461141717515_1035706684(IEEE_P_1242562249, t17, t13, t12, t18, t28);
    t20 = (t0 + 4040);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    memcpy(t24, t19, 8U);
    xsi_driver_first_trans_fast(t20);
    goto LAB3;

LAB27:    t7 = (t0 + 1512U);
    t8 = *((char **)t7);
    t7 = (t0 + 6424);
    t10 = ((IEEE_P_2592010699) + 4000);
    t11 = xsi_vhdl_lessthanEqual(t10, t8, 8U, t7, 6U);
    t5 = t11;
    goto LAB29;

LAB30:    xsi_set_current_line(83, ng0);
    t12 = (t0 + 1512U);
    t13 = *((char **)t12);
    t12 = (t0 + 6296U);
    t14 = (t0 + 1832U);
    t15 = *((char **)t14);
    t14 = (t0 + 6312U);
    t18 = ieee_p_1242562249_sub_1006216973935617061_1035706684(IEEE_P_1242562249, t28, t15, t14, 6);
    t19 = ieee_p_1242562249_sub_1701011461141717515_1035706684(IEEE_P_1242562249, t17, t13, t12, t18, t28);
    t20 = (t0 + 4040);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    memcpy(t24, t19, 8U);
    xsi_driver_first_trans_fast(t20);
    goto LAB3;

LAB32:    t7 = (t0 + 1512U);
    t8 = *((char **)t7);
    t7 = (t0 + 6436);
    t10 = ((IEEE_P_2592010699) + 4000);
    t11 = xsi_vhdl_lessthanEqual(t10, t8, 8U, t7, 7U);
    t5 = t11;
    goto LAB34;

LAB35:    xsi_set_current_line(87, ng0);
    t12 = (t0 + 1512U);
    t13 = *((char **)t12);
    t12 = (t0 + 6296U);
    t14 = (t0 + 1832U);
    t15 = *((char **)t14);
    t14 = (t0 + 6312U);
    t18 = ieee_p_1242562249_sub_1006216973935617061_1035706684(IEEE_P_1242562249, t28, t15, t14, 7);
    t19 = ieee_p_1242562249_sub_1701011461141717515_1035706684(IEEE_P_1242562249, t17, t13, t12, t18, t28);
    t20 = (t0 + 4040);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    memcpy(t24, t19, 8U);
    xsi_driver_first_trans_fast(t20);
    goto LAB3;

LAB37:    t7 = (t0 + 1512U);
    t8 = *((char **)t7);
    t7 = (t0 + 6450);
    t10 = ((IEEE_P_2592010699) + 4000);
    t11 = xsi_vhdl_lessthanEqual(t10, t8, 8U, t7, 7U);
    t5 = t11;
    goto LAB39;

LAB40:    xsi_set_current_line(91, ng0);
    t12 = (t0 + 1512U);
    t13 = *((char **)t12);
    t12 = (t0 + 6296U);
    t14 = (t0 + 1832U);
    t15 = *((char **)t14);
    t14 = (t0 + 6312U);
    t18 = ieee_p_1242562249_sub_1006216973935617061_1035706684(IEEE_P_1242562249, t28, t15, t14, 8);
    t19 = ieee_p_1242562249_sub_1701011461141717515_1035706684(IEEE_P_1242562249, t17, t13, t12, t18, t28);
    t20 = (t0 + 4040);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    memcpy(t24, t19, 8U);
    xsi_driver_first_trans_fast(t20);
    goto LAB3;

LAB42:    t7 = (t0 + 1512U);
    t8 = *((char **)t7);
    t7 = (t0 + 6465);
    t10 = ((IEEE_P_2592010699) + 4000);
    t11 = xsi_vhdl_lessthanEqual(t10, t8, 8U, t7, 8U);
    t5 = t11;
    goto LAB44;

}


extern void work_a_1723026100_3745244343_init()
{
	static char *pe[] = {(void *)work_a_1723026100_3745244343_p_0,(void *)work_a_1723026100_3745244343_p_1,(void *)work_a_1723026100_3745244343_p_2};
	xsi_register_didat("work_a_1723026100_3745244343", "isim/Multiplicador_isim_beh.exe.sim/work/a_1723026100_3745244343.didat");
	xsi_register_executes(pe);
}
