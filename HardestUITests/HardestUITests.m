#import <XCTest/XCTest.h>
@interface HardestUITests : XCTestCase
@end
@implementation HardestUITests
- (void)setUp {
    [super setUp];
    self.continueAfterFailure = NO;
    [[[XCUIApplication alloc] init] launch];
}
- (void)tearDown {
    [super tearDown];
}
- (void)testExample {
}
@end
