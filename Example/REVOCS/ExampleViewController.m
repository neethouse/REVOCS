//
//  ExampleViewController.m
//  REVOCS
//
//  Created by mtmta on 2014/04/06.
//  Copyright (c) 2014年 NeetHouse. All rights reserved.
//

#import "ExampleViewController.h"
#import <REVOCS/REVOCS.h>

#import "MyTheme.h"
#import "CustomView.h"


@interface ExampleViewController ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *detailTextLabels;
@property (weak, nonatomic) IBOutlet CustomView *customView;
@property (weak, nonatomic) IBOutlet UIButton *toggleButton;

@end


@implementation ExampleViewController {
    
    RVXSelectorNotifier *_selectorThemeNotifier;
    
    RVXBlockNotifier *_blockThemeNotifier;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // bind MyTheme.backgroundColor to self.view.backgroundColor
    RVX_BIND(self.view, backgroundColor) = RVX_THEME_BINDING(MyTheme, backgroundColor);

    // bind with convenience macro
    RVX_BIND(_titleLabel, textColor) = MyThemeBinding(foregroundColor);
    
    for (UILabel *label in _detailTextLabels) {
        
        // bind with filter
        RVX_BIND(label, textColor) = [RVX_THEME_BINDING(MyTheme, backgroundColor) filter:^id(UIColor *color) {
            // filtered value to label.textColor will set
            return [color colorWithAlphaComponent:0.9];
        }];
        
        // bind with convenience filter
        RVX_BIND(label.layer, backgroundColor) = RVX_THEME_BINDING(MyTheme, foregroundColor).CGColorFilter;
    }
    
    // bind MyTheme object itself
    RVX_BIND(_customView, theme) = RVX_THEME_BINDING(MyTheme, rvx_self);
    
    // block will called when a MyTheme.rvx_self is changed.
    _blockThemeNotifier = [RVXBlockNotifier.alloc initWithBinding:RVX_THEME_BINDING(MyTheme, rvx_self) block:^(MyTheme *theme) {
        [_toggleButton setTitleColor:theme.buttonTitleColor forState:UIControlStateNormal];
    }];
    
    [_blockThemeNotifier notify];
    
    // -setNeedsStatusBarAppearanceUpdate will called when a MyTheme.rvx_self is changed.
    _selectorThemeNotifier = [RVXSelectorNotifier.alloc initWithBinding:RVX_THEME_BINDING(MyTheme, rvx_self)
                                                                 object:self
                                                               selector:@selector(setNeedsStatusBarAppearanceUpdate)];
}

- (IBAction)toggleTheme:(id)sender {
    [MyTheme toggle];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    
    if ([MyTheme rvx_sharedTheme].type == kMyThemeTypeDark) {
        return UIStatusBarStyleLightContent;
    }
    
    return UIStatusBarStyleDefault;
}

@end
