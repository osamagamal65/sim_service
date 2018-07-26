#import "SimServicePlugin.h"
#import <sim_service/sim_service-Swift.h>

@implementation SimServicePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftSimServicePlugin registerWithRegistrar:registrar];
}
@end
