//
//  ViewController.m
//  ContactManagement
//
//  Created by Benjamin on 12/30/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

#import "ViewController.h"
#import "RowView.h"

#define mainViewWidth self.view.frame.size.width
#define contactHeight 50
#define space 1
#define animateDuration 0.4
#define iconHeight 30
#define textTag 2
#define deleteBtnWidth 50
#define deleteBtnHeight 30

@interface ViewController () {
    
    UIView *lastView;
    NSArray *_textArray;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _removeBtn.enabled = NO;
    _textArray = @[@"此山是我开", @"此树是我栽", @"要想过此路", @"留下买路财"];
    [self actionUseNum:[NSNumber numberWithInt:1],
                        [NSNumber numberWithInt:2],
                        [NSNumber numberWithInt:3],
                        [NSNumber numberWithInt:4], nil];
//    [self printFormat:@"这是%d%d", 2, 3];
//    [self aMethod:@"传入两个参数一个是整数: %d,另外一个是字符串: %@", 12, @"哈哈"];
}

- (NSArray *)actionUseNum: (id)actionNum, ... {
    NSMutableArray *argsArray = [[NSMutableArray alloc] init];
    va_list params; //定义一个指向个数可变的参数列表指针
    id arg;
    if (actionNum) {
        va_start(params, actionNum); //得到第一个可变参数地址
        // 将第一个参数添加到array，要根据情况来使用下面两句把第一个参数加入array，有的情况不用加入。
        // 例如第一个参数是sql语句，后面的参数是sql ？ 用的变量，那就要删除下面的两句。
        id prev = actionNum;
        [argsArray addObject:prev];
        while ((arg = va_arg(params, id))) {
            if (arg) {
                [argsArray addObject:arg];
            }
        }
        va_end(params);
        for (NSNumber *num in argsArray) {
            NSLog(@"%d", [num intValue]);
        }
    }
    return argsArray;
}

- (void)aMethod:(NSString *)a, ... {
    va_list ap;
    va_start(ap, a);

    NSString *str = [[NSString alloc] initWithFormat:a arguments:ap];
    NSLog(@"%@", str);
    
    va_end(ap);
}

- (void)printFormat:(NSString *)format, ... {
    va_list v1;
    va_start(v1, format);
    
    NSString *str = [[NSString alloc] initWithFormat:format arguments:v1];
    
    va_end(v1);
    printf("%s", [str UTF8String]);
}

- (IBAction)add:(UIBarButtonItem *)sender {
    lastView = [self.view.subviews lastObject];
    BOOL isFirst = [self.view.subviews count] == 3;
    CGFloat originY = isFirst ? (20 + contactHeight + space) : (lastView.frame.origin.y + lastView.frame.size.height + space);
    // 创建一行
    UIView *view = [self createOneRow];
    view.frame = CGRectMake(mainViewWidth, originY, mainViewWidth, contactHeight);
    [self.view addSubview:view];
    
    [UIView animateWithDuration: animateDuration animations:^{
//        CGRect tempFrame = view.frame;
//        tempFrame.origin.x = 0;
//        view.frame = tempFrame;
        view.frame = CGRectMake(0, originY, mainViewWidth, contactHeight);
        view.alpha = 1;
    } completion:^(BOOL finished) {
        _removeBtn.enabled = YES;
    }];
    
}

#pragma mark 创建单独一行，并且创建头像和文字
//- (UIView *)createOneRow {
//    UIView *view = [[UIView alloc] init];
//    view.backgroundColor = [UIColor redColor];
//    view.alpha = 0;
//    
//    CGFloat iconOriginY = (contactHeight-iconHeight)/2;
//    UIButton *icon = [UIButton buttonWithType:UIButtonTypeCustom];
//    icon.frame = CGRectMake(15, iconOriginY, iconHeight, iconHeight);
//    int imageIndex = arc4random_uniform(20) + 1;
//    NSString *iconImageName = [NSString stringWithFormat: @"biaoqing_%03d.png", imageIndex];
//    UIImage *iconImage = [UIImage imageNamed: iconImageName];
//    [icon setImage:iconImage forState:UIControlStateNormal];
//    [icon addTarget:self action:@selector(iconClick:) forControlEvents:UIControlEventTouchUpInside];
//    [view addSubview:icon];
//    
//    UILabel *label = [[UILabel alloc] initWithFrame: CGRectMake(30+iconHeight, iconOriginY, self.view.frame.size.width - 2*(30+iconHeight), iconHeight)];
//    label.textAlignment = NSTextAlignmentCenter;
//    int nameIndex = arc4random_uniform((int)_textArray.count);
//    label.text = _textArray[nameIndex];
//    label.tag = textTag;
//    [view addSubview:label];
//    
//    UIButton *deleteBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    CGFloat deleteBtnOriginY = (view.frame.size.height - deleteBtnHeight)/2;
//    deleteBtn.frame = CGRectMake(mainViewWidth-15-deleteBtnWidth, deleteBtnOriginY, deleteBtnWidth, deleteBtnHeight);
//    deleteBtn.backgroundColor = [UIColor greenColor];
//    [deleteBtn setTitle:@"删除" forState:UIControlStateNormal];
//    [deleteBtn addTarget:self action:@selector(deleteBtnCLicked:) forControlEvents:UIControlEventTouchUpInside];
//    [view addSubview:deleteBtn];
//    
//    return view;
//}

- (UIView *)createOneRow {
//    NSArray *viewArray = [[NSBundle mainBundle] loadNibNamed: @"RowView" owner:self options:nil];
//    UIView *view = viewArray[0];
//    
//    UIButton *avatar = (UIButton *)[view viewWithTag: 1];
//    int imageIndex = arc4random_uniform(20) + 1;
//    NSString *iconImageName = [NSString stringWithFormat:@"biaoqing_%03d.png", imageIndex];
//    [avatar setImage: [UIImage imageNamed: iconImageName] forState:UIControlStateNormal];
//    [avatar addTarget: self action:@selector(iconClick:) forControlEvents:UIControlEventTouchUpInside];
//    
//    UILabel *text = (UILabel *)[view viewWithTag: 2];
//    int textIndex = arc4random_uniform((int)_textArray.count);
//    text.text = _textArray[textIndex];
    
//    UIButton *deleteBtn = (UIButton *)[view viewWithTag: 3];
//    [deleteBtn addTarget: self action:@selector(deleteBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    int imageIndex = arc4random_uniform(20) + 1;
    NSString *iconImageName = [NSString stringWithFormat:@"biaoqing_%03d.png", imageIndex];
    int textIndex = arc4random_uniform((int)_textArray.count);
    NSString *textContent = _textArray[textIndex];
    RowView *rowView = [RowView rowViewWithIcon:iconImageName textContent:textContent];
    [rowView.rowDeleteBtn addTarget:self action:@selector(deleteBtnClicked:aa:) forControlEvents:UIControlEventTouchUpInside];
    return rowView;
}

#pragma mark 点击头像打印文本框的内容
- (void)iconClick:(UIButton *)sender {
    UILabel *label = (UILabel *)[[sender superview] viewWithTag: textTag];
    NSLog(@"名字是: %@", label.text);
}

- (void)deleteBtnClicked:(UIButton *)sender aa:(NSString *)aa {
    NSLog(@"%@", aa);
    [UIView animateWithDuration: animateDuration animations:^{
        CGRect tempFrame = sender.superview.frame;
        tempFrame.origin.x = mainViewWidth;
        sender.superview.frame = tempFrame;
        sender.alpha = 0;
    } completion:^(BOOL finished) {
        int startIndex = (int)[self.view.subviews indexOfObject:sender.superview];
        [[sender superview] removeFromSuperview];
        NSLog(@"移除出父控件，准备上移");
        
        [UIView animateWithDuration: animateDuration animations:^{
            for (int i = startIndex; i < self.view.subviews.count; i++) {
                UIView *eachView = self.view.subviews[i];
                CGRect temp = eachView.frame;
                temp.origin.y -= (contactHeight + 1);
                eachView.frame = temp;
            }
        }];
        
        _removeBtn.enabled = [self.view.subviews count] != 3;
    }];
}

- (IBAction)remove:(id)sender {
    lastView = [self.view.subviews lastObject];
    [UIView animateWithDuration: animateDuration animations:^{
        CGRect tempFrame = lastView.frame;
        tempFrame.origin.x = mainViewWidth;
        lastView.frame = tempFrame;
        lastView.alpha = 0;
    } completion:^(BOOL finished) {
        [lastView removeFromSuperview];
        _removeBtn.enabled = [self.view.subviews count] != 3;
    }];
    
}

@end
