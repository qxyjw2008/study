//
//  unit04.c
//  hello
//
//  Created by Benjamin on 9/10/15.
//  Copyright (c) 2015 leandev. All rights reserved.
//

#include <stdio.h>
#include <string.h>

void calculatePai() {
    double pai = 0.0;
    int fenmu = 1;
    double fenzi = 1.0;
    for(;fenzi<100000;fenzi+=2) {
        pai += fenmu/fenzi;
        fenmu = -fenmu;
    }
    printf("result is %lf\n", 4 * pai);
}

void login() {
    int i=0;
    char pass[100] = "wheet123";
    char scanfPass[100];
    do {
        printf(i==0?"请输入密码: ":"密码输出错误，请重新输入: ");
        gets(scanfPass);
        ++i;
        printf("strcmp: %d", strcmp(pass, scanfPass));
    }while (strcmp(pass, scanfPass)!=0);
    printf("密码输入正确，恭喜您!");
}

void addAll() {
    int sum = 0;
    int x;
    do {
        printf("请输入整数: ");
        scanf("%d", &x);
        sum += x;
    }while(x != 0);
    printf("程序结束!和为: %d\n", sum);
}

void calculateMonthDay() {
    int year;
    int month;
    int day = 31;
    
    printf("请输入年月(YYYY-MM):");
    scanf("%d-%d", &year, &month);
    
    switch (month) {
        case 2:
            if ((year%4==0 && year%100!=0) || year%400==0)
                day = 29;
            else
                day = 28;
            break;
        
        case 4:
        case 6:
        case 9:
        case 11:
            day = 30;
            break;
    }
    
    printf("%d年%d月有%d天\n", year, month, day);
}

void loop() {
    for (int i=0,count=0; i<100; i++) {
        if (i%2==0) {
            printf("%d\t",i);
            count++;
        }
        if (count%7==0)
            printf("\n");
    }
    printf("\n");
}

void getSum() {
    int num;
    int sum = 0;
    printf("请输入10个整数，以空格隔开: ");
    for (int i=0; i<10; i++) {
        scanf("%d", &num);
        sum += num;
    }
    printf("这10个整数的和为: %d\n", sum);
}

void calculateShuixianhua() {
    for (int i=100; i<1000; i++) {
        int gewei=i%10;
        int shiwei=(i/10)%10;
        int baiwei=(i/100);
        if (gewei*gewei*gewei + shiwei*shiwei*shiwei + baiwei*baiwei*baiwei == i) {
            printf("水仙花数是: %d\n",i);
        }
    }
}

void checkSushu() {
    for (int i=2; i<100; i++) {
        for (int j=2; j<i; j++) {
            if (i%j!=0) {
                printf("素数:%d\n", i);
                break;
            }
        }
    }
}

int main(void) {
    checkSushu();
    return 0;
}