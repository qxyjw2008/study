//
//  Unit03.c
//  hello
//
//  Created by Benjamin on 9/10/15.
//  Copyright (c) 2015 leandev. All rights reserved.
//

#include <stdio.h>
#include <stdbool.h>

/**
 *  check the num is even or odd
 *  基数&1==1 偶数&1==0
 *  @return <#return value description#>
 */
int checkEvenOrOdd(int num) {
    int a = num;
    int result = a & 1;
    return result;
}

/**
 *  返回num指定位置locate的值
 *
 *  @param num    <#num description#>
 *  @param locate <#locate description#>
 *
 *  @return <#return value description#>
 */
int getSpecifiedValue(int num, int locate) {
    return num >> locate & 1;
}

/**
 *  将num第locate位清0
 *
 *  @param num    <#num description#>
 *  @param locate <#locate description#>
 *
 *  @return <#return value description#>
 */
int clean0(int num, int locate) {
    return num & ~(1 << locate);
}

/**
 *  将num第locate位变为1
 *
 *  @param num    <#num description#>
 *  @param locate <#locate description#>
 *
 *  @return <#return value description#>
 */
int clean1(int num, int locate) {
    return num | (1 << locate);
}

void leftMove(int num, int locate) {
    printf("%d\n", num << locate | num >> (16-locate));
}

/**
 *  判断一个数是不是2的幂次方
 *
 *  @param num <#num description#>
 *
 *  @return <#return value description#>
 */
int test1(int num) {
    return ((num & (num-1)) == 0 ) && (num!=0);
}

/**
 *  交换x和y
 *
 *  @param x <#x description#>
 *  @param y <#y description#>
 */
void swap(int x, int y) {
    x ^= y;
    y ^= x;
    x ^= y;
}

/**
 *  设置x的第y位=1
 *
 *  @param x <#x description#>
 *  @param y <#y description#>
 *  @return
 */
int test2(int x, int y) {
    return x | (1 << y);
}

/**
 *  得到x第y位的值
 *
 *  @param x <#x description#>
 *  @param y <#y description#>
 *
 *  @return <#return value description#>
 */
int test3(int x, int y) {
    return (x >> y) & 1;
}

int main(void) {
    int num = -2;
    int locate = 2;
//    int test1 = checkEvenOrOdd(num);
//    int test2 = getSpecifiedValue(num, locate);
//    leftMove(num, locate);
    /*int test4 = test1(num);
    if(test4 == 1) {
        printf("真\n");
    } else {
        printf("假\n");
    }*/
    int test5 = test2(3,2);
    int test6 = test3(12,2);
    printf("%d\n", test6);
    return 0;
}
