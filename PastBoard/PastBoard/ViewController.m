//
//  ViewController.m
//  PastBoard
//
//  Created by Balance on 2017/1/16.
//  Copyright © 2017年 Balance. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)paste:(id)sender {
    //获取系统剪切板
   UIPasteboard *pasteBoard = [UIPasteboard generalPasteboard];
    
    if ([pasteBoard hasURLs]){
        self.textField.text = pasteBoard.URL.description;//剪切板网页
        return;
    }
    
    //获取剪切板的文本 有URL 就有文本
    if ([pasteBoard hasStrings]) {
        self.textField.text = pasteBoard.string;//剪切板文字
        return;
    }

}



@end
