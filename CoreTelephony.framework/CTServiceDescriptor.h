//
//     Generated by class-dump 3.5 (64 bit).
//
//  Copyright (C) 1997-2019 Steve Nygard.
//

#import <objc/NSObject.h>

#import <CoreTelephony/NSCopying-Protocol.h>
#import <CoreTelephony/NSSecureCoding-Protocol.h>

@class NSNumber, NSString;

@interface CTServiceDescriptor : NSObject <NSCopying, NSSecureCoding>
{
    NSString *_identifier;
    long long _domain;
    NSNumber *_instance;
}

+ (_Bool)supportsSecureCoding;
+ (id)descriptorWithSubscriptionContext:(id)arg1;
+ (id)telephonyDescriptorWithInstance:(id)arg1;
@property(retain, nonatomic) NSNumber *instance; // @synthesize instance=_instance;
@property(nonatomic) long long domain; // @synthesize domain=_domain;
- (void).cxx_destruct;
- (id)initWithCoder:(id)arg1;
- (void)encodeWithCoder:(id)arg1;
- (id)copyWithZone:(struct _NSZone *)arg1;
- (_Bool)isEqual:(id)arg1;
- (id)description;
@property(readonly, nonatomic) NSString *identifier; // @synthesize identifier=_identifier;
- (id)initWithDomain:(long long)arg1 instance:(id)arg2;

@end

