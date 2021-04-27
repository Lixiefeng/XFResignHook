//
//  LGDylibHook.m
//  LGDylibHook
//
//  Created by Aron.li on 2021/4/25.
//

#import "LGDylibHook.h"
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@implementation LGDylibHook

/**
 * 拦截注册
 */
//+ (void)load {
//    NSLog(@"LGDylib  Hook success");
//    //拦截微信注册事件
//    Method oldMethod = class_getInstanceMethod(objc_getClass("WCAccountLoginControlLogic"), @selector(onFirstViewRegister));
//    Method newMethod = class_getInstanceMethod(self, @selector(hook_onFirstViewRegister));
//    method_exchangeImplementations(oldMethod, newMethod);
//}
//
//- (void)hook_onFirstViewRegister {
//    NSLog(@"WeChat click login");
//}

/**
 * 拦截登录
 * 方式一 👉 method_exchangeImplementations
 * 会报错 👉 无法回到原有登录流程
 */
//+ (void)load {
//    NSLog(@"LGDylib Hook success");
//    //拦截微信登录事件
//    Method oldMethod = class_getInstanceMethod(objc_getClass("WCAccountMainLoginViewController"), @selector(onNext));
//    Method newMethod = class_getInstanceMethod(self, @selector(hook_onNext));
//    method_exchangeImplementations(oldMethod, newMethod);
//}
//
//- (void)hook_onNext {
//    NSLog(@"WeChat click login");
//    //获取密码
//    UITextField *textField = (UITextField *)[[self valueForKey:@"_textFieldUserPwdItem"] valueForKey:@"m_textField"];
//    NSString *pwd = [textField text];
//    NSLog(@"password: %@",pwd);
//    [self hook_onNext];
//}


/**
 * 拦截登录
 * 方式二 👉 class_addMethod
 */
//+ (void)load {
//    //拦截微信登录事件
//    Class cls = objc_getClass("WCAccountMainLoginViewController");
//    Method onNext = class_getInstanceMethod(cls, @selector(onNext));
//    //给WC添加新方法
//    class_addMethod(cls, @selector(new_onNext), new_onNext, "v@:");
//    //交换
//    method_exchangeImplementations(onNext, class_getInstanceMethod(cls, @selector(new_onNext)));
//}
//
////相当于imp
//void new_onNext(id self, SEL _cmd) {
//    //获取密码
//    UITextField *textField = (UITextField *)[[self valueForKey:@"_textFieldUserPwdItem"] valueForKey:@"m_textField"];
//    NSString *pwd = [textField text];
//    NSLog(@"password: %@",pwd);
//    [self performSelector:@selector(new_onNext)];
//}


/**
 * 拦截登录
 * 方式三 👉 class_replaceMethod
 */
//+ (void)load {
//    //拦截微信登录事件
//    Class cls = objc_getClass("WCAccountMainLoginViewController");
//    //替换
//    origin_onNext = class_replaceMethod(cls, @selector(onNext), new_onNext, "v@:");
//}
//
////原始imp
//IMP (*origin_onNext)(id self, SEL _cmd);
//
////相当于imp
//void new_onNext(id self, SEL _cmd) {
//    //获取密码
//    UITextField *textField = (UITextField *)[[self valueForKey:@"_textFieldUserPwdItem"] valueForKey:@"m_textField"];
//    NSString *pwd = [textField text];
//    NSLog(@"password: %@",pwd);
//    origin_onNext(self,_cmd);
//}


/**
 * 拦截登录
 * 方式四 👉 method_setImplementation
 */
//+ (void)load {
//    //拦截微信登录事件
//    Class cls = objc_getClass("WCAccountMainLoginViewController");
//    //获取method
//    Method onNext = class_getInstanceMethod(cls,@selector(onNext));
//    //get
//    origin_onNext = method_getImplementation(onNext);
//    //set
//    method_setImplementation(onNext, new_onNext);
//}
//
////原始imp
//IMP (*origin_onNext)(id self, SEL _cmd);
//
////相当于imp
//void new_onNext(id self, SEL _cmd) {
//    //获取密码
//    UITextField *textField = (UITextField *)[[self valueForKey:@"_textFieldUserPwdItem"] valueForKey:@"m_textField"];
//    NSString *pwd = [textField text];
//    NSLog(@"password: %@",pwd);
//    origin_onNext(self,_cmd);
//}

@end
