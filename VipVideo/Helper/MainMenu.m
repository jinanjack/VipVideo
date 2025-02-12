//
//  MainMenu.m
//  VipVideo
//
//  Created by LiHongli on 2017/10/20.
//  Copyright © 2017年 SV. All rights reserved.
//

#import "MainMenu.h"
#import "VipURLManager.h"

@implementation MainMenu

-(id) init {
    // the title will be ignore
    self = [super initWithTitle:@"Main Menu"];
    if(self){
        // NSMenu.menuBarVisible = YES;
        [self createStatusBarItems];
    }
    return self;
}

- (void)createStatusBarItems{
    //添加vip解析列表
    NSMenuItem * apiListItem = [[NSMenuItem alloc] initWithTitle:@"VIP" action:Nil keyEquivalent:@""];
    [self addItem:apiListItem];
    NSMenu *apiListMenu = [[NSMenu alloc] initWithTitle:@"VIP"];
    [[VipURLManager sharedInstance] configurationVipMenu:apiListMenu];
    [self setSubmenu:apiListMenu forItem:apiListItem];

    // 展示窗口
    _showItem = [[VipURLManager sharedInstance] configurationShowMenuItem:self];
    
    // 新建按钮
    self.creatNewItem = [[VipURLManager sharedInstance] configurationCreateMenuItem:self];
    
    [[VipURLManager sharedInstance] configurationAddCustomVipsMenuItem:self];
    [[VipURLManager sharedInstance] configurationGoBackMenuItem:self];
    [[VipURLManager sharedInstance] configurationGoForwardMenuItem:self];

    // this title will be ignore too
    //        NSMenu *appMenu = [[NSMenu alloc] initWithTitle:@"application"];
    
    //        self.creatNewItem  = [[NSMenuItem alloc] initWithTitle:@"新建" action:Nil keyEquivalent:new];
    //        [appMenu addItem:self.creatNewItem];
    
    //        [appMenu addItem:[NSMenuItem separatorItem]];
    
    //        [self setSubmenu:appMenu forItem:appItem];
    
    [[VipURLManager sharedInstance] configurationChangeUpMenuItem:self];
    [[VipURLManager sharedInstance] configurationChangeNextMenuItem:self];

    [[VipURLManager sharedInstance] configurationOpenSafariItem:self];
    [[VipURLManager sharedInstance] configurationCopyMenuItem:self];
    [[VipURLManager sharedInstance] configurationNativePlayMenuItem:self];

    // 退出按钮
    self.quitItem = [[VipURLManager sharedInstance] configurationQuitMenuItem:self];
}

+ (void)configuMainMenu:(NSMenu *)menu{
    
    NSMenuItem * managerItem = [[NSMenuItem alloc] initWithTitle:@"Action" action:Nil keyEquivalent:@""];
    NSMenu *manager = [[NSMenu alloc] initWithTitle:@"Action"];
    [menu setSubmenu:manager forItem:managerItem];

    [[VipURLManager sharedInstance] configurationAddCustomVipsMenuItem:manager];
    [[VipURLManager sharedInstance] configurationGoBackMenuItem:manager];
    [[VipURLManager sharedInstance] configurationShowMenuItem:manager];
    [[VipURLManager sharedInstance] configurationCreateMenuItem:manager];
    [[VipURLManager sharedInstance] configurationChangeUpMenuItem:manager];
    [[VipURLManager sharedInstance] configurationChangeNextMenuItem:manager];

    NSMenuItem * apiListItem = [[NSMenuItem alloc] initWithTitle:@"VIP" action:Nil keyEquivalent:@""];
    NSMenu *apiListMenu = [[NSMenu alloc] initWithTitle:@"VIP"];
    [[VipURLManager sharedInstance] configurationVipMenu:apiListMenu];
    [menu setSubmenu:apiListMenu forItem:apiListItem];

    if (menu.itemArray.count > 2) {
        [menu insertItem:apiListItem atIndex:2];
        [menu insertItem:managerItem atIndex:2];
    }
}



@end
