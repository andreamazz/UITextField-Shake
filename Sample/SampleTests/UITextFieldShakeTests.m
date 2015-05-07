#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import <FBSnapshotTestCase/FBSnapshotTestCase.h>
#import <Expecta+Snapshots/EXPMatchers+FBSnapshotTest.h>
#import <OCMock/OCMock.h>

#import "UITextField+Shake.h"

@interface UITextField (Mock)

- (void)_shake:(int)times direction:(int)direction currentTimes:(int)current withDelta:(CGFloat)delta andSpeed:(NSTimeInterval)interval shakeDirection:(ShakeDirection)shakeDirection completion:(void(^)())handler;

@end

SpecBegin(UITextFieldShakeTests)

__block UITextField *subject;

describe(@"shake:withDelta:", ^{
    it(@"should eventually call _shake:direction:currentTimes:withDelta:andSpeed:shakeDirection:completion:", ^{
        subject = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
        id mock = OCMPartialMock(subject);
        OCMExpect([mock _shake:10 direction:1 currentTimes:0 withDelta:5 andSpeed:0.03 shakeDirection:ShakeDirectionHorizontal completion:nil]);
        [mock shake:10 withDelta:5];
        OCMVerifyAll(mock);
    });
});

describe(@"shake:withDelta:completion:", ^{
    it(@"should eventually call _shake:direction:currentTimes:withDelta:andSpeed:shakeDirection:completion:", ^{
        subject = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
        id mock = OCMPartialMock(subject);
        OCMExpect([mock _shake:10 direction:1 currentTimes:0 withDelta:5 andSpeed:0.03 shakeDirection:ShakeDirectionHorizontal completion:nil]);
        [mock shake:10 withDelta:5 completion:nil];
        OCMVerify(mock);
    });

    it(@"should call the completion block", ^{
        subject = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
        __block int meaningOfLife = 0;
        [subject shake:10 withDelta:5 completion:^{
            meaningOfLife = 42;
        }];
        expect(meaningOfLife).after(1).to.equal(42);
    });
});

describe(@"shake:withDelta:andSpeed:", ^{
    it(@"should eventually call _shake:direction:currentTimes:withDelta:andSpeed:shakeDirection:completion:", ^{
        subject = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
        id mock = OCMPartialMock(subject);
        OCMExpect([mock _shake:10 direction:1 currentTimes:0 withDelta:5 andSpeed:1 shakeDirection:ShakeDirectionHorizontal completion:nil]);
        [mock shake:10 withDelta:5 andSpeed:1];
        OCMVerify(mock);
    });
});

describe(@"shake:withDelta:speed:completion:", ^{
    it(@"should eventually call _shake:direction:currentTimes:withDelta:andSpeed:shakeDirection:completion:", ^{
        subject = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
        id mock = OCMPartialMock(subject);
        OCMExpect([mock _shake:10 direction:1 currentTimes:0 withDelta:5 andSpeed:1 shakeDirection:ShakeDirectionHorizontal completion:nil]);
        [mock shake:10 withDelta:5 speed:1 completion:nil];
        OCMVerify(mock);
    });

    it(@"should call the completion block", ^{
        subject = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
        __block int meaningOfLife = 0;
        [subject shake:10 withDelta:5 speed:1 completion:^{
            meaningOfLife = 42;
        }];
        expect(meaningOfLife).after(1).to.equal(42);
    });
});

describe(@"shake:withDelta:andSpeed:shakeDirection:", ^{
    it(@"should eventually call _shake:direction:currentTimes:withDelta:andSpeed:shakeDirection:completion:", ^{
        subject = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
        id mock = OCMPartialMock(subject);
        OCMExpect([mock _shake:10 direction:1 currentTimes:0 withDelta:5 andSpeed:1 shakeDirection:ShakeDirectionVertical completion:nil]);
        [mock shake:10 withDelta:5 andSpeed:1 shakeDirection:ShakeDirectionVertical];
        OCMVerify(mock);
    });
});

describe(@"shake:withDelta:andSpeed:shakeDirection:completion:", ^{
    it(@"should eventually call _shake:direction:currentTimes:withDelta:andSpeed:shakeDirection:completion:", ^{
        subject = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
        id mock = OCMPartialMock(subject);
        OCMExpect([mock _shake:10 direction:1 currentTimes:0 withDelta:5 andSpeed:1 shakeDirection:ShakeDirectionVertical completion:nil]);
        [mock shake:10 withDelta:5 andSpeed:1 shakeDirection:ShakeDirectionVertical completion:nil];
        OCMVerify(mock);
    });

    it(@"should call the completion block", ^{
        subject = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
        __block int meaningOfLife = 0;
        [subject shake:10 withDelta:5 andSpeed:1 shakeDirection:ShakeDirectionVertical completion:^{
            meaningOfLife = 42;
        }];
        expect(meaningOfLife).after(1).to.equal(42);
    });
});

SpecEnd
