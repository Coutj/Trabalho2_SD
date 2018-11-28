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
static const char *ng0 = "/home/juan/Documents/SD_trabalho2/Trabalho2_SD/Calculadora/Soma4Alg.vhd";
extern char *IEEE_P_1242562249;
extern char *IEEE_P_2592010699;

char *ieee_p_1242562249_sub_1701011461141717515_1035706684(char *, char *, char *, char *, char *, char *);


static void work_a_2956913922_1539827104_p_0(char *t0)
{
    char t1[16];
    char t2[16];
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
    char *t13;
    char *t14;
    char *t15;
    char *t16;

LAB0:    xsi_set_current_line(52, ng0);

LAB3:    t3 = (t0 + 1192U);
    t4 = *((char **)t3);
    t3 = (t0 + 5832U);
    t5 = (t0 + 1352U);
    t6 = *((char **)t5);
    t5 = (t0 + 5832U);
    t7 = ieee_p_1242562249_sub_1701011461141717515_1035706684(IEEE_P_1242562249, t2, t4, t3, t6, t5);
    t8 = (t0 + 1032U);
    t9 = *((char **)t8);
    t8 = (t0 + 5816U);
    t10 = ieee_p_1242562249_sub_1701011461141717515_1035706684(IEEE_P_1242562249, t1, t7, t2, t9, t8);
    t11 = (t0 + 3648);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t10, 5U);
    xsi_driver_first_trans_fast(t11);

LAB2:    t16 = (t0 + 3552);
    *((int *)t16) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_2956913922_1539827104_p_1(char *t0)
{
    char t6[16];
    char t11[16];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    unsigned char t5;
    char *t7;
    char *t8;
    char *t9;
    char *t12;
    char *t13;
    int t14;
    unsigned int t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    unsigned int t21;
    unsigned int t22;

LAB0:    xsi_set_current_line(61, ng0);
    t1 = (t0 + 1832U);
    t2 = *((char **)t1);
    t1 = (t0 + 5910);
    t4 = ((IEEE_P_2592010699) + 4000);
    t5 = xsi_vhdl_greaterEqual(t4, t2, 5U, t1, 5U);
    if (t5 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(67, ng0);
    t1 = (t0 + 1832U);
    t2 = *((char **)t1);
    t1 = (t0 + 3712);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 5U);
    xsi_driver_first_trans_fast_port(t1);

LAB3:    t1 = (t0 + 3568);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(63, ng0);
    t7 = (t0 + 1832U);
    t8 = *((char **)t7);
    t7 = (t0 + 5864U);
    t9 = (t0 + 5915);
    t12 = (t11 + 0U);
    t13 = (t12 + 0U);
    *((int *)t13) = 0;
    t13 = (t12 + 4U);
    *((int *)t13) = 3;
    t13 = (t12 + 8U);
    *((int *)t13) = 1;
    t14 = (3 - 0);
    t15 = (t14 * 1);
    t15 = (t15 + 1);
    t13 = (t12 + 12U);
    *((unsigned int *)t13) = t15;
    t13 = ieee_p_1242562249_sub_1701011461141717515_1035706684(IEEE_P_1242562249, t6, t8, t7, t9, t11);
    t16 = (t0 + 3712);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    memcpy(t20, t13, 5U);
    xsi_driver_first_trans_fast_port(t16);
    xsi_set_current_line(64, ng0);
    t1 = (t0 + 1832U);
    t2 = *((char **)t1);
    t14 = (4 - 4);
    t15 = (t14 * -1);
    t21 = (1U * t15);
    t22 = (0 + t21);
    t1 = (t2 + t22);
    t5 = *((unsigned char *)t1);
    t3 = (t0 + 3776);
    t4 = (t3 + 56U);
    t7 = *((char **)t4);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = t5;
    xsi_driver_first_trans_fast_port(t3);
    goto LAB3;

}


extern void work_a_2956913922_1539827104_init()
{
	static char *pe[] = {(void *)work_a_2956913922_1539827104_p_0,(void *)work_a_2956913922_1539827104_p_1};
	xsi_register_didat("work_a_2956913922_1539827104", "isim/Soma4Alg_isim_beh.exe.sim/work/a_2956913922_1539827104.didat");
	xsi_register_executes(pe);
}
