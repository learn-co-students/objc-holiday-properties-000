//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (NSArray *)holidaysInSeason:(NSString *)season {
    NSDictionary *holidays = [NSDictionary dictionary];
    holidays = self.database[season];
    return holidays.allKeys;
}

- (NSArray *)suppliesInHoliday:(NSString *)holiday
                      inSeason:(NSString *)season {
    NSArray *supplies = [NSArray array];
    supplies = self.database[season][holiday];
    return supplies;
}

- (BOOL)holiday:(NSString* )holiday
     isInSeason:(NSString *)season {
    NSDictionary *holidaysDictionary = self.database[season];
    NSArray *holidays = holidaysDictionary.allKeys;
    if ([holidays containsObject:holiday]){
        return YES;
    }
    return NO;
}

- (BOOL)supply:(NSString *)supply
   isInHoliday:(NSString *)holiday
      inSeason:(NSString *)season {
    NSArray *supplies = self.database[season][holiday];
    if ([supplies containsObject:supply]){
        return YES;
    }
    return NO;
}

- (void)addHoliday:(NSString *)holiday
          toSeason:(NSString *)season {
    self.database[season][holiday] = [NSMutableArray array];
    // no return
}

- (void)addSupply:(NSString *)supply
        toHoliday:(NSString *)holiday
         inSeason:(NSString *)season {
    NSMutableArray *supplies = [NSMutableArray array];
    [supplies addObject:supply];
    self.database[season][holiday] = supplies;
    // no return
}

@end
