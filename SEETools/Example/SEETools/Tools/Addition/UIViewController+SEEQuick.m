//
//  UIViewController+SEEQuick.m
//  美团外卖
//
//  Created by 景彦铭 on 2016/10/12.
//  Copyright © 2016年 景彦铭. All rights reserved.
//

#import "UIViewController+SEEQuick.h"
#import <objc/runtime.h>

//#define APPSTOREID @"1036152564"

@implementation UIViewController (SEEQuick)

+ (void)load {
    
#ifdef APPSTOREID
    Method m1 = class_getInstanceMethod([self class], @selector(viewDidAppear:));
    Method m2 = class_getInstanceMethod([self class], @selector(see_versionUpdate:));
    method_exchangeImplementations(m1, m2);
#endif
    
    
}
- (void)addSubViewController:(UIViewController *)vc view:(UIView *)view {
    if(view){
        [view addSubview:vc.view];
    }
    else{
        [self.view addSubview:vc.view];
    }
    [self addChildViewController:vc];
    [vc didMoveToParentViewController:self];
}

//#ifdef APPSTOREID
//- (void)see_versionUpdate:(BOOL)animation {
//    [self see_versionUpdate:animation];
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            [self see_checkVersion];
//        });
//    });
//}
//
//- (void)see_checkVersion {
//    //获取当前版本号
//    NSDictionary * infoDict = [[NSBundle mainBundle] infoDictionary];
//    NSString * versionString = infoDict[@"CFBundleShortVersionString"];
//    //获取网络版本号
//    NSData *response = [NSURLConnection sendSynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://itunes.apple.com/cn/lookup?id=%@",APPSTOREID]]] returningResponse:nil error:nil];
//    if (response == nil) {
//        //没有网络
//        return;
//    }
//    NSError * error;
//    NSDictionary * appStoreInfoDict = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingAllowFragments error:&error];
//    if (error) { //失败
//        return;
//    }
//    NSArray * arr = appStoreInfoDict[@"results"];
//    if (arr.count < 1) {
//        NSLog(@"获取不到 appStore 数据，请检查appStoreID");
//        return;
//    }
//    NSDictionary * dict = arr[0];
//    NSString * appStoreVersion = dict[@"version"];
//    //比较版本号
//    versionString = [versionString stringByReplacingOccurrencesOfString:@"." withString:@""];
//    if (versionString.length==2) {
//        versionString  = [versionString stringByAppendingString:@"0"];
//    }else if (versionString.length==1){
//        versionString  = [versionString stringByAppendingString:@"00"];
//    }
//    appStoreVersion = [appStoreVersion stringByReplacingOccurrencesOfString:@"." withString:@""];
//    if (appStoreVersion.length==2) {
//        appStoreVersion  = [appStoreVersion stringByAppendingString:@"0"];
//    }else if (appStoreVersion.length==1){
//        appStoreVersion  = [appStoreVersion stringByAppendingString:@"00"];
//    }
//    if (versionString.floatValue < appStoreVersion.floatValue) {
//        [self see_exit];
//    }
//    
//}
//
//- (void)see_exit {
//    UIAlertController * alertC = [UIAlertController alertControllerWithTitle:@"提示" message:@"检测到新版本，旧版本即将停止服务，请尽快更新！" preferredStyle:UIAlertControllerStyleAlert];
//    UIAlertAction * cancel = [UIAlertAction actionWithTitle:@"退出" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
//        exit(0);
//    }];
//    UIAlertAction * update = [UIAlertAction actionWithTitle:@"立即更新" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://itunes.apple.com/cn/app/id%@?mt=8",APPSTOREID]];
//        [[UIApplication sharedApplication] openURL:url];
//        exit(0);
//    }];
//    [alertC addAction:cancel];
//    [alertC addAction:update];
//    
//    [self presentViewController:alertC animated:YES completion:nil];
//    
//}
//#endif

//- (void)shareWithTitle:(NSString *)title description:(NSString *)desc thumImage:(NSString *)thumImage url:(NSString *)url {
//    [UMSocialUIManager showShareMenuViewInWindowWithPlatformSelectionBlock:^(UMSocialPlatformType platformType, NSDictionary *userInfo) {
//        [self css_shareWebPageToPlatformType:platformType title:title description:desc thumImage:thumImage url:url];
//    }];
//}
//
//- (void)css_shareWebPageToPlatformType:(UMSocialPlatformType)platformType title:(NSString *)title description:(NSString *)description thumImage:(id)thumImage url:(NSString *)url
//{
//    //    [UMSocialGlobal shareInstance].isUsingHttpsWhenShareContent = YES;
//    //创建分享消息对象
//    [CSSHUDManager showWithStatus:@"请稍候"];
//    [[SDWebImageManager sharedManager]loadImageWithURL:[NSURL URLWithString:thumImage] options:SDWebImageHighPriority progress:nil completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, SDImageCacheType cacheType, BOOL finished, NSURL * _Nullable imageURL) {
//        UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
//        [CSSHUDManager dismiss];
//        //创建网页内容对象
//        UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:title descr:description thumImage:image];
//        //设置网页地址
//        shareObject.webpageUrl = [url stringByReplacingOccurrencesOfString:@"inApp=1" withString:@"inApp=0"];;
//        
//        //分享消息对象设置分享内容对象
//        messageObject.shareObject = shareObject;
//        
//        NSInteger platform = 0;
//        
//        switch (platformType) {
//            case 0:
//                platform = 2;
//                break;
//            case 1:
//            case 2:
//            case 3:
//                platform = 3;
//                break;
//            case 4:
//            case 5:
//            case 6:
//                platform = 1;
//                break;
//            default:
//                break;
//        }
//        
//        //调用分享接口
//        [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:self completion:^(id data, NSError *error) {
//            if (error) {
//                [CSSHUDManager showErrorWithStatus:@"分享失败，请重试"];
//            }else{
//                [[CSSHTTPManager sharedManager]shareWithPlatform:platform url:url complete:^{
//                    
//                } failure:^{
//                    
//                }];
//            }
//        }];
//    }];
//}

- (void)see_pickImageEdit:(BOOL)edit {
    UIImagePickerController * imageC = [[UIImagePickerController alloc]init];
    imageC.allowsEditing = edit;
    imageC.navigationBar.translucent = NO;
    [imageC.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    imageC.delegate = self;
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        imageC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:imageC animated:YES completion:nil];
    }else {
//        [CSSHUDManager showInfoWithStatus:@"相册不可用"];
    }
}

- (void)see_cameraEdit:(BOOL)edit {
    UIImagePickerController * imageC = [[UIImagePickerController alloc]init];
    imageC.navigationBar.translucent = NO;
    imageC.allowsEditing = edit;
    [imageC.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    imageC.delegate = self;
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        imageC.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:imageC animated:YES completion:nil];
    }else {
//        [CSSHUDManager showInfoWithStatus:@"相机不可用"];
    }
}


- (void)see_getImageEdit:(BOOL)edit {
    UIAlertController * alertC = [UIAlertController alertControllerWithTitle:@"提示" message:@"选择照片" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction * camera = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self see_cameraEdit:edit];
    }];
    UIAlertAction * album = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self see_pickImageEdit:edit];
    }];
    UIAlertAction * cancel = [UIAlertAction actionWithTitle:@" 取消" style:UIAlertActionStyleDestructive handler:nil];
    
    [alertC addAction:camera];
    [alertC addAction:album];
    [alertC addAction:cancel];
    [self presentViewController:alertC animated:YES completion:nil];
    
}



@end
