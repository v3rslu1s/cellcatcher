//
//     Generated by class-dump 3.5 (64 bit).
//
//  Copyright (C) 1997-2019 Steve Nygard.
//

#import <objc/NSObject.h>

#import <CoreTelephony/NSCopying-Protocol.h>
#import <CoreTelephony/NSSecureCoding-Protocol.h>

@class NSArray, NSData, NSNumber;

@interface CTPNRRequestType : NSObject <NSCopying, NSSecureCoding>
{
    NSData *_pushToken;
    NSNumber *_attemptCount;
    NSArray *_pnrReqList;
}

+ (_Bool)supportsSecureCoding;
@property(retain, nonatomic) NSArray *pnrReqList; // @synthesize pnrReqList=_pnrReqList;
@property(retain, nonatomic) NSNumber *attemptCount; // @synthesize attemptCount=_attemptCount;
@property(retain, nonatomic) NSData *pushToken; // @synthesize pushToken=_pushToken;
- (void).cxx_destruct;
- (id)initWithCoder:(id)arg1;
- (void)encodeWithCoder:(id)arg1;
- (id)copyWithZone:(struct _NSZone *)arg1;
- (_Bool)isEqual:(id)arg1;
- (_Bool)isEqualToCTPNRRequestType:(id)arg1;
- (id)init;
- (id)description;

@end

