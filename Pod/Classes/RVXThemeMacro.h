//
//  RVXThemeMacro.h
//  REVOCS
//
//  Created by mtmta on 2014/07/14.
//  Copyright (c) 2014年 NeetHouse. All rights reserved.
//

#import "RVXMacro.h"


#ifdef _RVX_DEBUG

    #define RVX_THEME_BINDING(_themeClass, _themeKeyPath) ( \
        (1 ? 0 : (void)(((_themeClass *)nil)._themeKeyPath)), \
        [[_themeClass rvx_sharedTheme] rvx_bindingForKeyPath:@#_themeKeyPath] \
    )

#else

    #define RVX_THEME_BINDING(_themeClass, _themeKeyPath) \
        [[_themeClass rvx_sharedTheme] rvx_bindingForKeyPath:@#_themeKeyPath]

#endif
