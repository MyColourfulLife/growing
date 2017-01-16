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
        self.textField.text = pasteBoard.string;//剪切板网页
        return;
    }
    
    //获取剪切板的文本 有URL 就有文本
    if ([pasteBoard hasStrings]) {
        self.textField.text = pasteBoard.string;//剪切板文字
        return;
    }

}

/**
 选择文字
 通过文本框的代理更好，这里简单通过按钮控制
 @param sender 按钮
 */
- (IBAction)chooseAll:(id)sender {
    
    //获取当前的选择
   UITextRange *textRange = self.textField.selectedTextRange;
    //创建结束点
    UITextPosition *endPostion  = [self.textField positionFromPosition:textRange.start offset:self.textField.text.length ];
    //创建新的选择区域
    UITextRange *newTextRange = [self.textField textRangeFromPosition:textRange.start toPosition:endPostion];
    //选择全部
    [self.textField setSelectedTextRange:newTextRange];
    
}


@end
