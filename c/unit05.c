//
//  unit05.c
//  hello
//
//  Created by Benjamin on 9/11/15.
//  Copyright (c) 2015 leandev. All rights reserved.
//

#include <stdio.h>
#include <time.h>
#include <stdlib.h>
#include <stdbool.h>

void getRandNumMaxValue() {
    int max = 0;
    int arr[10];
    srand((unsigned)time(NULL));
    for (int i=0; i<10; i++) {
        arr[i] = rand()%100;
        if (arr[i]>max)
            max = arr[i];
    }
    printf("数组中得数据为：");
    for (int i=0; i<(sizeof(arr)/sizeof(arr[0])); i++) {
        printf("%d ", arr[i]);
    }
    printf("\n最大值是：%d\n", max);
}

void getRandAllValue() {
    int max = 0;
    int min = 100;
    double average = 0.0;
    int sum = 0;
    int arr[10];
    srand((unsigned)time(NULL));
    for (int i=0; i<10; i++) {
        arr[i] = rand()%100;
        if (arr[i]>max)
            max = arr[i];
        if (arr[i]<min)
            min = arr[i];
        sum += arr[i];
    }
    average = sum/10;
    printf("数组中得数据为：");
    for (int i=0; i<(sizeof(arr)/sizeof(arr[0])); i++) {
        printf("%d ", arr[i]);
    }
    printf("\n最大值是：%d\n最小值是：%d\n平均值是：%.0lf\n和是：%d\n", max, min, average, sum);
}

void calculateGrade() {
    int count = 0;
    int rowSum = 0;
    int result[10][6] ;
    srand((unsigned)time(NULL));
    printf("No.\tC\toc\tFou\tUI\tTo\n");
    for (int i=0; i<10; i++) {
        result[i][0] = i;
        for (int j=1; j<5; j++) {
            result[i][j] = rand() % 101;
        }
        rowSum = 0;
        for (int j=0; j<5; j++) {
            rowSum += result[i][j];
            printf("%d\t", result[i][j]);
        }
        printf("%d\n", rowSum);
    }
    printf("总计：\t");
    for (int i=1; i<5; i++) {
        count = 0;
        for (int j=0; j<10; j++) {
            count += result[j][i];
        }
        printf("%d\t", count);
    }
    printf("\n");
}

void saolei() {
    //区域数
    int num;
    printf("请输入扫雷区域长度: ");
    scanf("%d", &num);
    //定义扫雷二维数组
    int square[num][num];
    srand((unsigned)time(NULL));
    //注入循环值，雷出现的概率为33%，雷的数目大概为num*num/3
    for (int i=0; i<num; i++) {
        for (int j=0; j<num; j++) {
            if (rand()%3==0) {
                square[i][j] = -1;
                continue;
            }
            square[i][j] = 0;
        }
    }
    
    //计算每个格子周围雷的数目，并改变值
    for (int i=0; i<num; i++) {
        for (int j=0; j<num; j++) {
            int sum = 0;
            if (square[i][j]==-1)
                goto print;
            if (i>0 && j>0 && square[i-1][j-1]==-1)
                sum++;
            if (i>0 && square[i-1][j]==-1)
                sum++;
            if (i>0 && j < num-1 && square[i-1][j+1]==-1)
                sum++;
            if (j<num-1 && square[i][j+1]==-1)
                sum++;
            if (i<num-1 && j<num-1 && square[i+1][j+1])
                sum++;
            if (i<num-1 && square[i+1][j]==-1)
                sum++;
            if (i<num-1 && j>0 && square[i+1][j-1]==-1)
                sum++;
            if (j>0 && square[i][j-1]==-1)
                sum++;
            square[i][j] = sum;
            print:
            printf("%d\t", square[i][j]);
        }
        printf("\n");
    }
    printf("扫雷到此结束!\n");
}

void moveElement() {
    int a[10] = {1,2,3,4,5,6,7,8,9,0};
    for (int i=9; i>0; i--) {
        a[i] ^= a[0];
        a[0] ^= a[i];
        a[i] ^= a[0];
    }
    for (int i=0; i<10; i++) {
        printf("%d\t", a[i]);
    }
    printf("\n");
}

int checkSame() {
    long num;
    printf("请输入一个整数: ");
    scanf("%ld", &num);
    int length = 0;
    long a = num;
    while(a) {
        length++;
        a /= 10;
    }
    
    int sum[length];
    for (int i=0; i<length; i++) {
        sum[i] = num % 10;
        num /= 10;
        for (int j=0; j<i; j++) {
            if (sum[i] == sum[j]) {
                printf("该数字存在重复!\n");
                return 0;
            }
        }
    }
    printf("没有重复\n");
    return 0;
}

void pukepai() {
    //要发牌的个数
    int num;
    //花色字符组
    char huase[4] = {'S', 'H', 'D', 'C'};
    //牌数字组
    char pai[13] = {'A', '2', '3', '4', '5', '6', '7', '8', '9', 'T', 'J', 'Q', 'K'};
    printf("输入要发牌的个数: ");
    scanf("%d", &num);
    //不重复的花色数组
    char huaseOld[num];
    //不重复的牌数组
    char paiOld[num];
    srand((unsigned)time(NULL));
    
    for (int i=0; i<num; i++) {
        bool flag = true;
        //生成随机数
        int a = rand()%4;
        int b = rand()%13;
        for (int j=0; j<i; j++) {
            if (huase[a]==huaseOld[j] && pai[b]==paiOld[j]) {
                i--;
                flag = false;
                break;
            }
        }
        //定义标量，如果标量为false，则表明该次为重复次，不予加进数组。
        if (flag) {
            huaseOld[i] = huase[a];
            paiOld[i] = pai[b];
            printf("%c%c\t", huaseOld[i], paiOld[i]);
        }
    }
    printf("\n");
}

void shufa() {
    char *gushi[4][6] = {{"守","法","朝","朝","忧","闷"},
                        {"强","梁","夜","夜","欢","歌"},
                        {"修","桥","补","路","瞎","眼"},
                        {"杀","人","放","火","儿","多"}};
    for (int i=0; i<6; i++) {
        for (int j=3; j>=0; j--) {
            printf("%s", gushi[j][i]);
        }
        printf("\n");
    }
    
}

int saoleiGaoji() {
    //区域数
    int num;
    printf("请输入扫雷区域长度: ");
    scanf("%d", &num);
    //定义扫雷二维数组
    int square[num][num];
    bool selected[num][num];
    int numWithoutLei = 0;
    srand((unsigned)time(NULL));
    //注入循环值，雷出现的概率为33%，雷的数目大概为num*num/3
    for (int i=0; i<num; i++) {
        for (int j=0; j<num; j++) {
            if (rand()%3==0) {
                square[i][j] = -1;
                continue;
            }
            square[i][j] = 0;
            numWithoutLei++;
        }
    }
    
    //计算每个格子周围雷的数目，并改变值
    for (int i=0; i<num; i++) {
        for (int j=0; j<num; j++) {
            int sum = 0;
            if (square[i][j]==-1)
                continue;
            if (i>0 && j>0 && square[i-1][j-1]==-1)
                sum++;
            if (i>0 && square[i-1][j]==-1)
                sum++;
            if (i>0 && j < num-1 && square[i-1][j+1]==-1)
                sum++;
            if (j<num-1 && square[i][j+1]==-1)
                sum++;
            if (i<num-1 && j<num-1 && square[i+1][j+1])
                sum++;
            if (i<num-1 && square[i+1][j]==-1)
                sum++;
            if (i<num-1 && j>0 && square[i+1][j-1]==-1)
                sum++;
            if (j>0 && square[i][j-1]==-1)
                sum++;
            square[i][j] = sum;
        }
    }
    
    //test for square
    for (int i=0; i<num; i++) {
        for (int j=0; j<num; j++) {
            printf("%d\t", square[i][j]);
        }
        printf("\n");
    }
    
    for (int i=0; i<num; i++) {
        for (int j=0; j<num; j++) {
            printf("@\t");
            selected[i][j] = false;
        }
        printf("\n");
    }
    
    while (1) {
        int row,col;
        printf("请扫雷(m,n): ");
        scanf("%d,%d", &row, &col);
        selected[row][col] = true;
        
        //打印地图
        for (int i=0; i<num; i++) {
            for (int j=0; j<num; j++) {
                if (selected[i][j] == true) {
                    if (square[i][j]==-1) {
                        printf("*\t");
                    } else if (square[i][j]==0) {
                        printf("#\t");
                    } else {
                        printf("%d\t", square[i][j]);
                    }
                } else {
                    printf("@\t");
                }
            }
            printf("\n");
        }
        
        //踩雷退出
        if (square[row][col]==-1) {
            printf("炸了\n");
            return 0;
        }
        
        //所有雷都被发现退出
        int count = 0;
        for (int i=0; i<num; i++) {
            for (int j=0; j<num; j++) {
                if (selected[i][j] == true) {
                    count ++;
                }
            }
        }
        if (count == numWithoutLei) {
            printf("你赢了!\n");
            return 0;
        }
    }
    return 0;
}

//Advance-c unit01数组
int main(void) {
    yuesefu();
    return 0;
}