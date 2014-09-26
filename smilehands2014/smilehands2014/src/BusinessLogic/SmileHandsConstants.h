//
//  SmileHandsConstants.h
//  SmileHands2014
//
//  Created by suwan on 2014. 9. 21..
//  Copyright (c) 2014년 smilehands. All rights reserved.
//

//API
#ifdef DEBUG

#define SMILE_HANDS_BASE_URL_STRING     @"http://sicamp201402.cafe24.com/"

#else

#define SMILE_HANDS_BASE_URL_STRING     @"http://sicamp201402.cafe24.com/"

#endif


//Utils
#ifdef DEBUG
#define DLog( s, ... ) NSLog( @"%@    <%@:(%d)> ", [NSString stringWithFormat:(s), ##__VA_ARGS__], [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__  )
#else
#define NSLog( s, ... )
#define DLog( s, ... )
#endif

#define LocalString(x) NSLocalizedStringFromTable(x, @"SmileHandsLocal", @"")

#define RGBColor(r,g,b) [UIColor colorWithRed:(r/255.0) green:(g/255.0) blue:(b/255.0) alpha:1.0f]
#define RGBAColor(r,g,b,a) [UIColor colorWithRed:(r/255.0) green:(g/255.0) blue:(b/255.0) alpha:a]

#define kSHNotificationFavoriteEvent @"SHNotificationFavoriteEvent"

