//
//     Generated by class-dump 3.5 (64 bit).
//
//  Copyright (C) 1997-2019 Steve Nygard.
//

#import <CoreTelephony/NSObject-Protocol.h>

@class CTServiceDescriptor, CTSweetgumCapabilities;

@protocol CoreTelephonyClientCarrierServicesDelegate <NSObject>

@optional
- (void)sweetgumDataPlanMetricsChanged:(CTServiceDescriptor *)arg1;
- (void)sweetgumAppsChanged:(CTServiceDescriptor *)arg1;
- (void)sweetgumPlansChanged:(CTServiceDescriptor *)arg1;
- (void)sweetgumUsageChanged:(CTServiceDescriptor *)arg1;
- (void)sweetgumUserConsentInfoChanged:(CTServiceDescriptor *)arg1;
- (void)sweetgumCapabilitiesChanged:(CTSweetgumCapabilities *)arg1 serviceDescriptor:(CTServiceDescriptor *)arg2;
@end

