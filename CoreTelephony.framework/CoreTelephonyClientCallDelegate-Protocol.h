//
//     Generated by class-dump 3.5 (64 bit).
//
//  Copyright (C) 1997-2019 Steve Nygard.
//

#import <CoreTelephony/NSObject-Protocol.h>

@class CTCallCapabilities, CTXPCServiceSubscriptionContext;

@protocol CoreTelephonyClientCallDelegate <NSObject>

@optional
- (void)callCapabilitiesChanged:(CTXPCServiceSubscriptionContext *)arg1 capabilities:(CTCallCapabilities *)arg2;
@end

