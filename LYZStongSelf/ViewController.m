//
//  ViewController.m
//  LYZStongSelf
//
//  Created by 刘耀宗 on 2021/6/19.
//

#import "ViewController.h"
#import "Nav1ViewController.h"
#import "LYZStongSelf-Swift.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];

}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //swift
//    TestSwiftViewController *vc = [[TestSwiftViewController alloc] init];
    //oc
    Nav1ViewController *vc = [[Nav1ViewController alloc] init];
    UINavigationController *navc = [[UINavigationController alloc] initWithRootViewController:vc];
    [self presentViewController:navc animated:YES completion:nil];
}


@end
