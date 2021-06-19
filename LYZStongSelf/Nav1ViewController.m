//
//  Nav1ViewController.m
//  LYZStongSelf
//
//  Created by 刘耀宗 on 2021/6/19.
//

#import "Nav1ViewController.h"
#import "Nav2ViewController.h"
@interface Nav1ViewController ()
@property (nonatomic, copy) void (^testBlock)(void);
@end

@implementation Nav1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    @Strongify,@Weakify主要是在block中使用.
//    因为block一般都在对象内部声明.. 如果在block内部使用了当前对象的属性,就会造成循环引用(block拥有当前对象的地址,而当前对象拥有block的地址),而引起内存泄露,block和当前对象都无法释放.
//
//    @weakify(self) 将当前对象声明为weak.. 这样block内部引用当前对象,就不会造成引用计数+1可以破解循环引用
//
//    @strongify(self) 相当于声明一个局部的strong对象,等于当前对象.可以保证block调用的时候,内部的对象不会释放
    
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    __weak typeof(self) weakself = self;
    __block  NSInteger index = 0;
    self.testBlock = ^{
        index ++;
        //相当于声明一个局部的strong对象,等于当前对象.可以保证block调用的时候,内部的对象不会释放
        __strong typeof(self) strongself = weakself;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [strongself test];
        });

    };
    NSLog(@"index = %ld",index);
}

-(void)test {
    NSLog(@"strongself生效了-----");
}

//模拟__strong 的使用场景.dissmiss 之后 block 内部延迟 2 秒.  如果不适用__strong. self = nil.  加上了之后才会方法调用成功
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.navigationController dismissViewControllerAnimated:false completion:nil];
    
    if (self.testBlock) {
        self.testBlock();
    }

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
