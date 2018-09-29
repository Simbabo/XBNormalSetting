//
//  UIView+Frame.m
//  XBNormalSetting
//
//  Created by 许鑫博 on 2018/9/28.
//  Copyright © 2018年 XXB. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)
-(void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

-(CGFloat)x
{
    return self.frame.origin.x;
}


-(void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

-(CGFloat)y
{
    return self.frame.origin.y;
}

-(void)setW:(CGFloat)w
{
    CGRect frame = self.frame;
    frame.size.width = w;
    self.frame = frame;
}
-(CGFloat)w
{
    return self.frame.size.width;
}

-(void)setH:(CGFloat)h
{
    CGRect frame = self.frame;
    frame.size.height = h;
    self.frame = frame;
}
-(CGFloat)h
{
    return self.frame.size.height;
}

-(void)setCx:(CGFloat)cx
{
    CGPoint center = self.center;
    center.x = cx;
    self.center = center;
}

-(CGFloat)cx
{
    return self.center.x;
}

-(void)setCy:(CGFloat)cy
{
    CGPoint center = self.center;
    center.y = cy;
    self.center = center;
}

-(CGFloat)cy
{
    return self.center.y;
}
@end
