//
//  RowView.h
//  ContactManagement
//
//  Created by Benjamin on 12/30/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RowView : UIView

@property (weak, nonatomic) IBOutlet UILabel *rowLabel;

@property (weak, nonatomic) IBOutlet UIButton *rowAvatar;
@property (weak, nonatomic) IBOutlet UIButton *rowDeleteBtn;

+ (id)rowViewWithIcon:(NSString *)iconName textContent:(NSString *)name;

@end
