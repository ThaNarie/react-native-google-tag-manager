#import "RNGoogleTagManager.h"
#import <FirebaseCore/FirebaseCore.h>
#import <FirebaseAnalytics/FirebaseAnalytics/FIRAnalytics.h>
#import <React/RCTLog.h>
#import <React/RCTConvert.h>

@implementation RNGoogleTagManager

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}
RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(initialiseFirebase) {
    if (isConfigured) {
        RCTLog(@"Firebase is already initialised. You cannot reinit firebase once it is initialised.");
    } else {
        [FIRApp configure];
        isConfigured = true;
        RCTLog(@"Firebase initialised.");
    }
}

RCT_EXPORT_METHOD(logEvent:(NSDictionary *)event) {
    NSString *name = event[@"name"];
    NSDictionary *data = event[@"data"];

    [FIRAnalytics logEventWithName:name parameters:data];
}

@end
