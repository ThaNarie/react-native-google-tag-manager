
#if __has_include("RCTBridgeModule.h")
#import "RCTBridgeModule.h"
#else
#import <React/RCTBridgeModule.h>
#endif

@interface RNGoogleTagManager : NSObject <RCTBridgeModule> {
    bool isConfigured;
}
@end
  
