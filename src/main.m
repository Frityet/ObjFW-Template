#import <ObjFW/ObjFW.h>

@interface Application : OFObject<OFApplicationDelegate> @end

@implementation Application

- (void)applicationDidFinishLaunching: (OFNotification *)notification
{
    OFLog(@"Hello, world!");
    [OFApplication terminate];
}

@end

#if defined(OF_WINDOWS)
int WINAPI WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nCmdShow)
{
    int argc;
    LPWSTR *argv = CommandLineToArgvW(GetCommandLineW(), &argc);
    return OFApplicationMain(&argc, &argv, [[Application alloc] init]);
}
#else
int main(int argc, char *argv[])
{
    return OFApplicationMain(&argc, &argv, [[Application alloc] init]);
}
#endif
