//
//  CustomView.m
//  REVOCS
//
//  Created by mtmta on 2014/04/06.
//  Copyright (c) 2014年 NeetHouse. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    CGContextRef c = UIGraphicsGetCurrentContext();
    
    [_theme.foregroundColor setFill];

    CGPathRef path = [self createPath];
    
    CGContextAddPath(c, path);
    CGContextFillPath(c);
    
    CGPathRelease(path);
}

- (CGPathRef)createPath {
    
    CGPoint points[] = {{77.599,64.423},{80.918,46.492},{100,42.958},{80.918,39.425},{77.599,21.493},{74.499,38.236},{57.564,35.1},{50,0},{42.435,35.1},{25.502,38.236},{22.401,21.493},{19.082,39.425},{0,42.958},{19.082,46.492},{22.401,64.423},{25.502,47.681},{41.554,50.654},{50,130.646},{58.446,50.654},{74.499,47.681}};
    
    CGMutablePathRef basePath = CGPathCreateMutable();
    
    CGPathAddLines(basePath, NULL, points, sizeof(points)/sizeof(points[0]));

    CGRect baseBounds = CGPathGetBoundingBox(basePath);
    
    CGAffineTransform transform = CGAffineTransformMakeScale(self.bounds.size.width / baseBounds.size.width,
                                                             self.bounds.size.height / baseBounds.size.height);
    
    CGPathRef path = CGPathCreateCopyByTransformingPath(basePath, &transform);
    
    CGPathRelease(basePath);
    
    return path;
}

- (void)setTheme:(MyTheme *)theme {
    _theme = theme;
    
    [self setNeedsDisplay];
}

@end
