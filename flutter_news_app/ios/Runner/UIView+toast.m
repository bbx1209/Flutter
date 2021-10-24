//
//  UIView+toast.m
//  Runner
//
//  Created by buxiangbo on 2021/10/18.
//

#import "UIView+toast.h"
#import "MBProgressHUD.h"

@implementation UIView (toast)

- (void)showText:(NSString *)text {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    hud.label.text = text;
    [hud hideAnimated:YES afterDelay:2];
}
@end
