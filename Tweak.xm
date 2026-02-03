#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

%hook UILabel

- (void)setText:(NSString *)text {
    if ([text isKindOfClass:[NSString class]]) {

        if ([text isEqualToString:@"Settings"]) {
            %orig(@"Cài đặt");
            return;
        }

        if ([text isEqualToString:@"Cancel"]) {
            %orig(@"Huỷ");
            return;
        }

        if ([text isEqualToString:@"OK"]) {
            %orig(@"Đồng ý");
            return;
        }
    }

    %orig(text);
}

%end
