%hook UILabel

- (void)setText:(NSString *)text {
    if ([text isEqualToString:@"Settings"]) {
        text = @"Cài đặt";
    }
    %orig(text);
}

%end
