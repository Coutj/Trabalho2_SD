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
extern char *IEEE_P_3620187407;

unsigned char ieee_p_3620187407_sub_1306455576397931277_3965413181(char *, char *, char *, char *, char *);
char *ieee_p_3620187407_sub_1496620905533649268_3965413181(char *, char *, char *, char *, char *, char *);
char *ieee_p_3620187407_sub_16272557775307340295_3965413181(char *, char *, char *, char *, unsigned char );


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
    unsigned char t10;
    char *t11;
    unsigned int t12;
    unsigned int t13;
    unsigned char t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;

LAB0:    xsi_set_current_line(52, ng0);

LAB3:    t3 = (t0 + 1192U);
    t4 = *((char **)t3);
    t3 = (t0 + 5824U);
    t5 = (t0 + 1352U);
    t6 = *((char **)t5);
    t5 = (t0 + 5824U);
    t7 = ieee_p_3620187407_sub_1496620905533649268_3965413181(IEEE_P_3620187407, t2, t4, t3, t6, t5);
    t8 = (t0 + 1032U);
    t9 = *((char **)t8);
    t10 = *((unsigned char *)t9);
    t8 = ieee_p_3620187407_sub_16272557775307340295_3965413181(IEEE_P_3620187407, t1, t7, t2, t10);
    t11 = (t1 + 12U);
    t12 = *((unsigned int *)t11);
    t13 = (1U * t12);
    t14 = (5U != t13);
    if (t14 == 1)
        goto LAB5;

LAB6:    t15 = (t0 + 3632);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    memcpy(t19, t8, 5U);
    xsi_driver_first_trans_fast(t15);

LAB2:    t20 = (t0 + 3552);
    *((int *)t20) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(5U, t13, 0);
    goto LAB6;

}

static void work_a_2956913922_1539827104_p_1(char *t0)
{
    char t6[16];
    char t12[16];
    char t16[16];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t7;
    char *t8;
    int t9;
    unsigned int t10;
    unsigned char t11;
    char *t13;
    char *t14;
    char *t17;
    char *t18;
    int t19;
    char *t20;
    unsigned int t21;
    unsigned char t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    unsigned int t28;

LAB0:    t1 = (t0 + 3232U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(59, ng0);
    t2 = (t0 + 1832U);
    t3 = *((char **)t2);
    t2 = (t0 + 5856U);
    t4 = (t0 + 5902);
    t7 = (t6 + 0U);
    t8 = (t7 + 0U);
    *((int *)t8) = 0;
    t8 = (t7 + 4U);
    *((int *)t8) = 3;
    t8 = (t7 + 8U);
    *((int *)t8) = 1;
    t9 = (3 - 0);
    t10 = (t9 * 1);
    t10 = (t10 + 1);
    t8 = (t7 + 12U);
    *((unsigned int *)t8) = t10;
    t11 = ieee_p_3620187407_sub_1306455576397931277_3965413181(IEEE_P_3620187407, t3, t2, t4, t6);
    if (t11 != 0)
        goto LAB4;

LAB6:    xsi_set_current_line(65, ng0);
    t2 = (t0 + 1832U);
    t3 = *((char **)t2);
    t2 = (t0 + 3696);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t7 = (t5 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t3, 5U);
    xsi_driver_first_trans_fast_port(t2);

LAB5:    goto LAB2;

LAB4:    xsi_set_current_line(61, ng0);
    t8 = (t0 + 1832U);
    t13 = *((char **)t8);
    t8 = (t0 + 5856U);
    t14 = (t0 + 5906);
    t17 = (t16 + 0U);
    t18 = (t17 + 0U);
    *((int *)t18) = 0;
    t18 = (t17 + 4U);
    *((int *)t18) = 3;
    t18 = (t17 + 8U);
    *((int *)t18) = 1;
    t19 = (3 - 0);
    t10 = (t19 * 1);
    t10 = (t10 + 1);
    t18 = (t17 + 12U);
    *((unsigned int *)t18) = t10;
    t18 = ieee_p_3620187407_sub_1496620905533649268_3965413181(IEEE_P_3620187407, t12, t13, t8, t14, t16);
    t20 = (t12 + 12U);
    t10 = *((unsigned int *)t20);
    t21 = (1U * t10);
    t22 = (5U != t21);
    if (t22 == 1)
        goto LAB7;

LAB8:    t23 = (t0 + 3696);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    t26 = (t25 + 56U);
    t27 = *((char **)t26);
    memcpy(t27, t18, 5U);
    xsi_driver_first_trans_fast_port(t23);
    xsi_set_current_line(62, ng0);
    t2 = (t0 + 1832U);
    t3 = *((char **)t2);
    t9 = (4 - 4);
    t10 = (t9 * -1);
    t21 = (1U * t10);
    t28 = (0 + t21);
    t2 = (t3 + t28);
    t11 = *((unsigned char *)t2);
    t4 = (t0 + 3760);
    t5 = (t4 + 56U);
    t7 = *((char **)t5);
    t8 = (t7 + 56U);
    t13 = *((char **)t8);
    *((unsigned char *)t13) = t11;
    xsi_driver_first_trans_fast_port(t4);
    goto LAB5;

LAB7:    xsi_size_not_matching(5U, t21, 0);
    goto LAB8;

LAB1:    return;
}


extern void work_a_2956913922_1539827104_init()
{
	static char *pe[] = {(void *)work_a_2956913922_1539827104_p_0,(void *)work_a_2956913922_1539827104_p_1};
	xsi_register_didat("work_a_2956913922_1539827104", "isim/Soma4Alg_isim_beh.exe.sim/work/a_2956913922_1539827104.didat");
	xsi_register_executes(pe);
}
