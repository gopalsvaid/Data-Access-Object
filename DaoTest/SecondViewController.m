//
//  SecondViewController.m
//  DaoTest
//
//  Created by Gopal.Vaid on 15/04/16.
//  Copyright © 2016 Gopal.Vaid. All rights reserved.
//

#import "SecondViewController.h"
#import "AppDelegate.h"

@interface SecondViewController ()

@end

@implementation SecondViewController
@synthesize lblDesc,lblName,dataobject;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    lblName.text = dataobject.categoryName;
    lblDesc.text = dataobject.categoryDescription;
    
    [lblDesc sizeToFit];
    
}

-(void)layoutSubviews{
    [lblDesc sizeToFit];

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
