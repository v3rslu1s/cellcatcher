//
//     Generated by class-dump 3.5 (64 bit).
//
//  Copyright (C) 1997-2019 Steve Nygard.
//

#import <objc/NSObject.h>

#import <CoreTelephony/NSCopying-Protocol.h>
#import <CoreTelephony/NSSecureCoding-Protocol.h>

@class NSNumber, NSString;

@interface CTDataConnectionStatus : NSObject <NSCopying, NSSecureCoding>
{
    _Bool _suspended;
    _Bool _publicNetAllowed;
    unsigned int _wirelessTechnologyMask;
    int _state;
    int _ipFamily;
    int _contextType;
    NSNumber *_pdp;
    NSString *_interfaceName;
    NSString *_apnName;
}

+ (_Bool)supportsSecureCoding;
@property(nonatomic) int contextType; // @synthesize contextType=_contextType;
@property(nonatomic) _Bool publicNetAllowed; // @synthesize publicNetAllowed=_publicNetAllowed;
@property(nonatomic) _Bool suspended; // @synthesize suspended=_suspended;
@property(nonatomic) int ipFamily; // @synthesize ipFamily=_ipFamily;
@property(nonatomic) int state; // @synthesize state=_state;
@property(nonatomic) unsigned int wirelessTechnologyMask; // @synthesize wirelessTechnologyMask=_wirelessTechnologyMask;
@property(retain, nonatomic) NSString *apnName; // @synthesize apnName=_apnName;
@property(retain, nonatomic) NSString *interfaceName; // @synthesize interfaceName=_interfaceName;
@property(retain, nonatomic) NSNumber *pdp; // @synthesize pdp=_pdp;
- (void).cxx_destruct;
- (id)initWithCoder:(id)arg1;
- (void)encodeWithCoder:(id)arg1;
- (id)copyWithZone:(struct _NSZone *)arg1;
- (id)description;

@end

