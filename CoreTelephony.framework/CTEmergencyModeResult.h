//
//     Generated by class-dump 3.5 (64 bit).
//
//  Copyright (C) 1997-2019 Steve Nygard.
//

#import <objc/NSObject.h>

#import <CoreTelephony/NSCopying-Protocol.h>
#import <CoreTelephony/NSSecureCoding-Protocol.h>

@class CTEmergencyMode, CTXPCServiceSubscriptionContext;

@interface CTEmergencyModeResult : NSObject <NSCopying, NSSecureCoding>
{
    CTEmergencyMode *_mode;
    CTXPCServiceSubscriptionContext *_context;
}

+ (_Bool)supportsSecureCoding;
@property(readonly, nonatomic) CTXPCServiceSubscriptionContext *context; // @synthesize context=_context;
@property(readonly, nonatomic) CTEmergencyMode *mode; // @synthesize mode=_mode;
- (void).cxx_destruct;
- (id)initWithCoder:(id)arg1;
- (void)encodeWithCoder:(id)arg1;
- (id)copyWithZone:(struct _NSZone *)arg1;
- (id)description;
- (id)initWithMode:(id)arg1 andContext:(id)arg2;

@end

