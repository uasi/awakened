#import <Cocoa/Cocoa.h>

@interface Awakened : NSObject

- (void)start;

@end

@implementation Awakened

- (void)start {
    NSNotificationCenter *center = [[NSWorkspace sharedWorkspace] notificationCenter];
    [center addObserver:self selector:@selector(workspaceDidWake:) name:NSWorkspaceDidWakeNotification object:nil];
}

- (void)workspaceDidWake:(NSNotification *)notification {
    NSArray *ourArgs = [[NSProcessInfo processInfo] arguments];
    if (ourArgs.count < 2) return;

    NSString *launchPath = ourArgs[1];
    NSArray *theirArgs = [ourArgs subarrayWithRange:NSMakeRange(2, ourArgs.count - 2)];
    [NSTask launchedTaskWithLaunchPath:launchPath arguments:theirArgs];
}

@end

int main(int argc, char *argv[]) {
    @autoreleasepool {
        Awakened *awakened = [[Awakened alloc] init];
        [awakened start];
        CFRunLoopRun();
    }
    return 0;
}
