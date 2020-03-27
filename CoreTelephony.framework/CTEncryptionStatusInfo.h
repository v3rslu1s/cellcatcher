//
//     Generated by class-dump 3.5 (64 bit).
//
//  Copyright (C) 1997-2019 Steve Nygard.
//

#import <objc/NSObject.h>

#import <CoreTelephony/NSCopying-Protocol.h>
#import <CoreTelephony/NSSecureCoding-Protocol.h>

@interface CTEncryptionStatusInfo : NSObject <NSCopying, NSSecureCoding>
{
    long long _status;
}

+ (_Bool)supportsSecureCoding;
@property(nonatomic) long long status; // @synthesize status=_status;
- (id)initWithCoder:(id)arg1;
- (void)encodeWithCoder:(id)arg1;
- (id)copyWithZone:(struct _NSZone *)arg1;
- (_Bool)isEqual:(id)arg1;
- (id)initWithStatus:(long long)arg1;

@end

