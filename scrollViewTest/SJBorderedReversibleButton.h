//
//  SJReversibleButton.h
//  scrollViewTest
//
//  Created by Shunji Li on 7/2/14.
//  Copyright (c) 2014 shunjili. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum : NSUInteger {
    MOReverseButtonStyleFilled,
    MOReverseButtonStyleHollow,
} MOReverseButtonStyle;
@interface SJBorderedReversibleButton : UIButton

@property (nonatomic, readonly, assign) MOReverseButtonStyle style;
@property (nonatomic, strong) NSString *title;

-(id)initWithFrame:(CGRect)frame style:(MOReverseButtonStyle) style;
@end
