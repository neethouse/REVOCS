//
//  RVXMacro.h
//  REVOCS
//
//  Created by mtmta on 2014/04/20.
//  Copyright (c) 2014年 NeetHouse. All rights reserved.
//

#if !defined(_RVX_DEBUG) && !defined(_RVX_RELEASE)
    #ifdef DEBUG
        #define _RVX_DEBUG
    #else
        #define _RVX_RELEASE
    #endif
#endif


#pragma mark -


#define _RVX_BIND(_dest, _destKeyPath) \
    (_dest).rvx_bindings[@#_destKeyPath]

#ifdef _RVX_DEBUG

    #define RVX_BIND(_dest, _destKeyPath) \
        (1 ? 0 : (void)((_dest)._destKeyPath)), \
        _RVX_BIND(_dest, _destKeyPath)

#else

    #define RVX_BIND(_dest, _destKeyPath) \
        _RVX_BIND(_dest, _destKeyPath)

#endif
