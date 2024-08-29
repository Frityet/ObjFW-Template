#import <ObjFW/ObjFW.h>

#include "common.h"

#pragma clang assume_nonnull begin

@interface Application : OFObject<OFApplicationDelegate> @end

@implementation Application

- (void)applicationDidFinishLaunching: (OFNotification *)notification
{

    [OFStdOut writeLine: @"Hello, World!"];
    [OFStdOut writeFormat: @"ObjFW version: %@\n", OFSystemInfo.ObjFWVersion];
    [OFStdOut writeFormat: @"Clang version: %s\n", __clang_version__];
    [OFStdOut writeFormat: @"OS: %@\n", OFSystemInfo.operatingSystemName];


    [OFApplication terminate];
}

@end

#if defined(OF_WINDOWS)
int WINAPI WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nCmdShow)
{
    extern int __argc;
    extern char *nonnil *__argv;
    return OFApplicationMain(&__argc, &__argv, [[Application alloc] init]);
}
#else
int main(int argc, char *nonnil argv[])
{
    return OFApplicationMain(&argc, &argv, [[Application alloc] init]);
}
#endif

#pragma clang assume_nonnull end
