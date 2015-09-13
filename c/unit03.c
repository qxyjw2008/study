//
//  unit03.c
//  hello
//
//  Created by Benjamin on 9/10/15.
//  Copyright (c) 2015 leandev. All rights reserved.
//

#include <stdio.h>

//execise第6题
void reverseNum(int n, int specifiedLocate) {
    int i = (n >> specifiedLocate) & 1;
    printf("%d的第%d位是: %d\n", n, specifiedLocate, i);
    int result = (i==1?n&(~(1<<specifiedLocate)):n|(1<<specifiedLocate));
    printf("%d的第%d位翻转后的结果是: %d\n", n, specifiedLocate, result);
}

int getMaxValue() {
    int a[3];
    printf("请输入三个整数: ");
    for (int i=0; i<3; i++) {
        scanf("%d", &a[i]);
    }
    int max = 0;
    if (a[0] > a[1]) {
        max = a[0];
    } else {
        max = a[1];
    }
    if (max < a[2]) {
        max = a[2];
    }
    return max;
}

int main(void) {
//    reverseNum(6,2);
    int result = getMaxValue();
    printf("%d\n", result);
    return 0;
}