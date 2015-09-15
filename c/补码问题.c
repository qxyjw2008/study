
//
//  01.c
//  hello
//
//  Created by Benjamin on 9/7/15.
//  Copyright (c) 2015 leandev. All rights reserved.
//
#include <stdio.h>
#include <limits.h>

/**
 *  说明越界后如何计算的问题。
 */
void yuejie() {
    //char num = -127 二进制表示为1111 1111
    //转为unsigned后，取值范围0-255，所以要把num进行取反+1的补码操作，即
    //~num+1 = 1000 0001这个数如果不指定符号，在机器看来可以使-1也可以是129
    //所以指定了unsigned后，机器就把他看做129来计算，也就能得出num+1=130
    unsigned char num = -127;
    printf("unsigned num的结果：%d\n", num+1);  //130
    printf("char的取值从%d到%d\n", CHAR_MIN, CHAR_MAX);  //-128 127
    printf("unsigned char的取值从%d到%d\n", 0, UCHAR_MAX);   //255
    
    //127的二进制为0111 1111
    //127+1后为 1000 0000，如果不指定符号，这个数在机器看来可以使128也可以是-128
    //因为指定了char是有符号的，所以是-128
    char num2 = 127;
    char yueJieNum2 = num2+1;
    printf("char越界后值为：%d\n", yueJieNum2);   //-128
}

int main(){
    yuejie();
    return 0;
}