//
//  ViewController.m
//  AttributedStringDemo
//
//  Created by Matt Sencenbaugh on 10/8/14.
//  Copyright (c) 2014 Sencedev. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong)UITextView *textView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated
{
    //Irrelevant to demo, just setting up a textview (which is set to be not editable for simplicity)
    [self setupTextView];
    
    
    //DEMO CODE - Building an nsattributed string to show a bold section
    NSMutableAttributedString *fullAttributedString = [[NSMutableAttributedString alloc] initWithString:@"Congratulations!!! You've just managed to get a..."];
    
    //Bold attributed string
    NSString *achievementString = @"New High Score!";
    NSMutableAttributedString *boldAttributedString = [[NSMutableAttributedString alloc] initWithString:achievementString];
    [boldAttributedString addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:14.0f] range:NSMakeRange(0, [boldAttributedString length])];
    
    //Append to initial string before setting into textview
    [fullAttributedString appendAttributedString:boldAttributedString];
    
    //Set attributed
    self.textView.attributedText = fullAttributedString;
}

-(void)setupTextView
{
    self.textView = [[UITextView alloc] init];
    self.textView.translatesAutoresizingMaskIntoConstraints = NO;
    self.textView.editable = NO;
    [self.view addSubview:self.textView];
    
    NSDictionary *views = @{@"textView":self.textView};
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[textView]|" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-50-[textView]|" options:0 metrics:nil views:views]];
}

@end
