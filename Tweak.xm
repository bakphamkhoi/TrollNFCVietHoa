#import <UIKit/UIKit.h>

static NSDictionary<NSString *, NSString *> *VNMap;

static inline NSString *VNTranslate(NSString *src) {
    if (!src || src.length == 0) return src;
    NSString *v = VNMap[src];
    return v ? v : src;
}

%ctor {
    @autoreleasepool {
        VNMap = @{
            @"Add": @"Thêm",
            @"Delete": @"Xóa",
            @"Remove": @"Xóa",
            @"Save": @"Lưu",
            @"Cancel": @"Hủy",
            @"Done": @"Xong",
            @"Edit": @"Sửa",
            @"Clear": @"Xóa",
            @"Close": @"Đóng",
            @"Settings": @"Cài đặt",
            @"About": @"Giới thiệu",
            @"Records": @"Bản ghi",
            @"History": @"Lịch sử",
            @"Tools": @"Công cụ",
            @"Info": @"Thông tin",
            @"Help": @"Trợ giúp",
            @"Ready": @"Sẵn sàng",
            @"Error": @"Lỗi",
            @"Success": @"Thành công",
            @"Failed": @"Thất bại",
            @"Loading": @"Đang tải",
            @"Empty": @"Trống",
            @"Warning": @"Cảnh báo",
            @"Confirm": @"Xác nhận",
            @"OK": @"OK",
            @"Yes": @"Có",
            @"No": @"Không",
        };
    }
}

%hook UILabel
- (void)setText:(NSString *)text {
    %orig(VNTranslate(text));
}
%end

%hook UIButton
- (void)setTitle:(NSString *)title forState:(UIControlState)state {
    %orig(VNTranslate(title), state);
}
%end

%hook UIBarButtonItem
- (void)setTitle:(NSString *)title {
    %orig(VNTranslate(title));
}
%end

%hook UIAlertController
- (void)setTitle:(NSString *)title {
    %orig(VNTranslate(title));
}
- (void)setMessage:(NSString *)message {
    %orig(VNTranslate(message));
}
%end

%hook NSBundle
- (NSString *)localizedStringForKey:(NSString *)key
                              value:(NSString *)value
                              table:(NSString *)tableName {
    NSString *v = VNMap[key];
    if (v) return v;
    return %orig;
}
%end
