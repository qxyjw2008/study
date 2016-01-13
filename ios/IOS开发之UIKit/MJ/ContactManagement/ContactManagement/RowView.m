//
//  RowView.m
//  ContactManagement
//
//  Created by Benjamin on 12/30/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

#import "RowView.h"

@implementation RowView

+ (id)rowViewWithIcon:(NSString *)iconName textContent:(NSString *)name {
    
    RowView *rowView = [[NSBundle mainBundle] loadNibNamed:@"RowView" owner:nil options:nil][0];
    
    [rowView.rowAvatar setImage:[UIImage imageNamed:iconName] forState:UIControlStateNormal];
    
    rowView.rowLabel.text = name;
    
    return rowView;
}

@end
