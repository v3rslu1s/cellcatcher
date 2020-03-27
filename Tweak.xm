// CLPLteCellTowerLocation
// CLPCellNeighborsGroup
// CLPCdmaCellTowerLocation

#import "CoreTelephony/CTTelephonyNetworkInfo.h"
#import "CoreTelephony/CTCarrier.h"
#include <iostream>
@interface CoreTelephonyClient : NSObject
@end

@interface CoreTelephonyClientMux : NSObject 
@end 

// #import "CoreTelephony/CTCall.h"
// #import "CoreTelephony/CTCallCenter.h"
// #include <CoreTelephony/CoreTelephony.h>

#import <Foundation/Foundation.h>
#include "CoreTelephony/CoreTelephony.h"

#include <substrate.h>
#import "substrate.h"

struct CTResult result;

// %hook NeighborCellsList 
// -(void)updateWithData:(id)arg1 logCode:(int)arg2 {
// 	%log;
// 	%orig;
// }
// %end

// %hook MeasuredNeighborCells
// -(void)updateWithData:(id)arg1 logCode:(int)arg2{
// 	%log;
// 	%orig;
// }
// %end

// %hook FieldTestModel
// -(void)startMonitor{
// 	%log; 
// 	%orig;
// }
// -(void)updateWithData:(id)arg1{
// 	NSLog(@"arg1: %@", arg1);
// 	%log; 
// 	%orig;
// }
// %end 

%hook CoreTelephonyClient

- (void)getSignalStrengthInfo:(id)arg1 completion:(id)arg2{
	%log;
	%orig;
	// NSLog(@"getSignalStrengthInfo"); 
	// NSLog(@"arg1: %@", arg1);
	// NSLog(@"arg2:%@", arg2);
}

- (id)init {
	NSLog(@"init");
	return %orig; 
}
- (id)initWithQueue:(struct dispatch_queue_s *)arg1 multiplexer:(id)arg2{
	NSLog(@"initWithQueue arg2");
	return %orig; 
}
- (id)initWithQueue:(struct dispatch_queue_s *)arg1 {
	NSLog(@"initWithQueue");
	return %orig; 
	}
%end
 
void ConnectionCallback(CTServerConnectionRef connection, CFStringRef string, CFDictionaryRef dictionary, void *data) {
	
	NSLog(@"ConnectionCallback"); 
}

CFMachPortRef t1; 
CFMachPortRef networkMonitorMachPort; 


%ctor {  
	NSLog(@"Tweak injected");  
	// CTTelephonyNetworkInfo *networkInfo = [CTTelephonyNetworkInfo new];
	// NSLog(@"Network Info: %@", networkInfo );
	// NSLog(@"cachedCellIds: %@", [networkInfo getFirstCellId]);

	CTTelephonyNetworkInfo* info = [[CTTelephonyNetworkInfo alloc] init];
	CTCarrier* carrier = info.subscriberCellularProvider;
	// NSString *mobileCountryCode = carrier.mobileCountryCode;
	// NSString *carrierName = carrier.carrierName;
	// NSString *isoCountryCode = carrier.isoCountryCode;
	NSString *mobileNetworkCode = carrier.mobileNetworkCode; 
	NSLog(@"Networkcode: %@", mobileNetworkCode);
	
	NSMutableDictionary *_serviceSubscriberCellularProviders = MSHookIvar<NSMutableDictionary *>(info, "_serviceSubscriberCellularProviders");
    NSMutableDictionary *_cachedCurrentRadioAccessTechnology = MSHookIvar<NSMutableDictionary *>(info, "_cachedCurrentRadioAccessTechnology");
    NSMutableDictionary *_cachedSignalStrength = MSHookIvar<NSMutableDictionary *>(info, "_cachedSignalStrength");
    NSMutableDictionary *_cachedCellIds = MSHookIvar<NSMutableDictionary *>(info, "_cachedCellIds");
	NSLog(@"_serviceSubscriberCellularProviders: %@", _serviceSubscriberCellularProviders);
	NSLog(@"_cachedCurrentRadioAccessTechnology: %@", _cachedCurrentRadioAccessTechnology);
	NSLog(@"serviceSubscriberCellularProviders: %@", info.subscriberCellularProvider);
	NSLog(@"_cachedSignalStrength: %@", _cachedSignalStrength);
	NSLog(@"_cachedCellIds: %@", _cachedCellIds);


	CoreTelephonyClient *_client = MSHookIvar<CoreTelephonyClient *>(info, "_client");	
	CoreTelephonyClientMux *_mux = MSHookIvar<CoreTelephonyClientMux *>(_client, "_mux");	
	NSLog(@"_client: %@", _client);
	NSLog(@"_mux: %@", _mux);

	//int cellcount;
	CTServerConnectionRef conn;
	conn = _CTServerConnectionCreate(kCFAllocatorDefault, ConnectionCallback, &t1);
	NSLog(@"conn: %@", conn);

	// =======================================================================
	CFStringRef logChannel = CFSTR("com.apple.BasebandStateReport.LogChannel");
	// CFStringRef _uVar1 = CFStringCreateWithFormat(0,0,@"com.apple.BasebandStateReport.LogChannel");
	// uVar1 = (unsigned char)_uVar1;
	NSLog(@"logChannel CFStringRef: %@", logChannel);

	_CTServerConnectionNetworkMonitorCreateLogChannel(conn,logChannel,&networkMonitorMachPort);
	NSLog(@"networkMonitorMachPort: %@", networkMonitorMachPort);
	// =======================================================================
	
	
	// NSString *imei;
    // _CTServerConnectionCopyMobileIdentity(&result, conn, &imei);

	// NSLog(@"Imei: %@", imei);

	// _CTServerConnectionCellMonitorStart(&t1, conn);
	// NSLog(@"t1: %@", t1);

	// _CTServerConnectionCellMonitorGetCellCount(&t1, conn,&cellcount);
   	// NSLog(@"cellcount:%d",cellcount);

	// CFMutableDictionaryRef equipmentInfo = nil;
	// // CTServerConnectionRef connection, CFMutableDictionaryRef *equipmentInfo, NSInteger *unknown);
	// _CTServerConnectionCopyMobileEquipmentInfo(conn, &equipmentInfo, NULL);
	// NSLog(@"equipmentInfo: %@", equipmentInfo);
	// //kCTMobileEquipmentInfoIMEI
 

	// void* handle = dlopen("/System/Library/Frameworks/CoreTelephony.framework/CoreTelephony" , RTLD_LAZY);
	// if(!handle)
	// 	return;
	
	
	
	// void *libHandle = dlopen("/System/Library/Frameworks/CoreTelephony.framework/CoreTelephony", RTLD_LAZY);
	// int (*CTGetSignalStrength)();
	// CTGetSignalStrength = dlsym(libHandle,"CTGetSignalStrength");
	// if( CTGetSignalStrength == NULL) NSLog(@"Could not find CTGetSignalStrength");
	// int result = CTGetSignalStrength();
	// dlclose(libHandle);
	// NSLog(@"Strenght2: %d", result);
 
 

	long int raw = 0; 
	long int graded = 0; 
	long int bars = 0; 
	CTIndicatorsGetSignalStrength(&raw, &graded, &bars);
	NSLog(@"raw: %li graded %li bars %li", raw, graded, bars);


	


	 

	//(CTServerConnectionRef conncetion, CFStringRef notification, CTServerConnectionNotificationCallback);
	

	 
	// _CTServerConnectionRegisterForNotification(conn,kCTCellMonitorUpdateNotification,&callback);

	// CTTelephonyCenterAddObserver(CTTelephonyCenterGetDefault(), NULL, &callBack, NULL, NULL, CFNotificationSuspensionBehaviorHold);


	 
 
	// CFNotificationCenterRef ct = CTTelephonyCenterGetDefault();
 	// CTTelephonyCenterAddObserver(ct, NULL, callback, NULL, NULL, CFNotificationSuspensionBehaviorHold);

 
	// _CTServerConnectionRegisterForNotification(conn,kCTCellMonitorUpdateNotification(),&callback);
 
// void _CTServerConnectionRegisterForNotification(CTServerConnectionRef conncetion, CFStringRef notification, CTServerConnectionNotificationCallback);

	// CFNotificationCenterRef ct = CTTelephonyCenterGetDefault();
	// NSLog(@"sbtest Default connectdion: %@", ct);

	// NSLog(@"conn=%@", conn);
	// __CTServerConnection * connection = (__CTServerConnection*)conn;
	// NSLog(@"connection=%@", connection);


	// printf("CallCatcher connection 0x%X", *(int*)connection);
	// NSLog(@"connection port: %@", connection->port);

	// NSLog(@"sbtest connection: %i", *(int*)&conn);
	

	// NSLog(@"sbtest GETTING COUNT");
	// int count = 0;
	// _CTServerConnectionCellMonitorGetCellCount(NULL, conn, &count);
	// NSLog(@"sbtest count: %d", count);

	// mach_port_t port  = CTServerConnectionGetPort(conn);
	// // // CFMachPortRef port = CFMachPortCreateWithPort(kCFAllocatorDefault, CTServerConnectionGetPort(conn), NULL, NULL, NULL);
	// NSLog(@"sbtest Port: %u", port); 

	// Crash 
	// 
	// NSLog(@"port: %u", port);

	// Crash
	// NSLog(@"connection->port: %@", conn->port);

	// // Redefined mach_port_t too CFMachPortRef
	// CFMachPortRef port  = _CTServerConnectionGetPort(conn);
	

	
	// NSLog(@"port: %u",port);		
	// CFMachPortRef mach_port = CFMachPortCreateWithPort(kCFAllocatorDefault,port,NULL,NULL, NULL);	
	// NSLog(@"mach_port=%x",CFMachPortGetPort(mach_port));	
	// CFRunLoopSourceRef source = CFMachPortCreateRunLoopSource(kCFAllocatorDefault, mach_port, 0);
	// CFRunLoopAddSource([[NSRunLoop currentRunLoop] getCFRunLoop], source, kCFRunLoopCommonModes);
	// _CTServerConnectionCellMonitorStart(&mach_port, conn);	
 
	// int count = 0;
	// // CFMachPortRef *port, CTServerConnectionRef connection, int *cellInfoCount
	// _CTServerConnectionCellMonitorGetCellCount(NULL, ct, &count);

	// CFNotificationCenterRef
	// CTServerConnectionRef

	// __CellInfo cellInfo = MSHookIvar<__CellInfo>(ct, "__CellInfo");
	// NSLog(@"CellInfo: %@", ct->CellInfo);
	// CellInfo
}
