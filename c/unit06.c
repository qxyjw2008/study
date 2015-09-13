//
//  unit06.c
//  hello
//
//  Created by Benjamin on 9/13/15.
//  Copyright (c) 2015 leandev. All rights reserved.
//

#include <stdio.h>

int getSum(int x, int y) {
    return x + y;
}

void printMaxMinAndSum(int a[], int length) {
    int max=0;
    int min=a[0];
    int sum = 0;
    printf("数组中得数据为：");
    for (int i=0; i<length; i++) {
        if (a[i] > max)
            max = a[i];
        if (a[i] < min)
            min = a[i];
        sum += a[i];
        printf("%d\t", a[i]);
    }
    printf("\n数组中得最大值为：%d\n数组中得最小值为：%d\n数组中的元素的和的值为：%d\n", max, min, sum);
}

/**
 *  计算阶乘
 *
 *  @param n <#n description#>
 *
 *  @return <#return value description#>
 */
int jiecheng(int n) {
    if (n==1) {
        return 1;
    }
    return n*jiecheng(n-1);
}

int subValue(int x, int y) {
    return x - y;
}

int mulValue(int x, int y) {
    return x * y;
}

int divValue(int x, int y) {
    return x / y;
}

//Advance-c unit02 函数
int main(void) {
    int sum = getSum(2,3);
    printf("COOKBOOK-1------------>\n求和结果为:%d\n\n", sum);
    
    int a[10] = {4, 70, 10, 45, 52, 54, 97, 42, 43, 81};
    printf("COOKBOOK-2------------>\n");
    printMaxMinAndSum(a, 10);
    printf("\n");
    
    int n = 5;
    int result = jiecheng(n);
    printf("COOKBOOK-3------------>\n%d阶乘的结果为: %d\n", n, result);
    printf("\n");
    
    printf("EXERCISE-3------------>\n");
    int x = 21;
    int y = 14;
    printf("%d和%d的差为: %d, 商为: %d, 积为: %d\n", x, y, subValue(x, y), divValue(x,y), mulValue(x, y));
    printf("\n");
    return 0;
}