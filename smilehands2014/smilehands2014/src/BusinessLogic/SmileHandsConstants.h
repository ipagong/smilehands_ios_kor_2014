//
//  SmileHandsConstants.h
//  SmileHands2014
//
//  Created by suwan on 2014. 9. 21..
//  Copyright (c) 2014년 smilehands. All rights reserved.
//

//API
#ifdef DEBUG

#define SMILE_HANDS_BASE_URL_STRING     @"http://www.smilehands.co.kr"

#else

#define SMILE_HANDS_BASE_URL_STRING     @"http://www.smilehands.co.kr"

#endif


//Utils
#ifdef DEBUG
#define DLog( s, ... ) NSLog( @"%@    <%@:(%d)> ", [NSString stringWithFormat:(s), ##__VA_ARGS__], [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__  )
#else
#define NSLog( s, ... )
#define DLog( s, ... )
#endif