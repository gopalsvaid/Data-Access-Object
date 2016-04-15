//
//  SecondViewController.h
//  DaoTest
//
//  Created by Gopal.Vaid on 15/04/16.
//  Copyright © 2016 Gopal.Vaid. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DaoClass.h"

@interface SecondViewController : UIViewController

@property(nonatomic,strong) DaoClass *dataobject;
@property(nonatomic,weak)IBOutlet UILabel *lblName;
@property(nonatomic,weak)IBOutlet UILabel *lblDesc;

@end
