//
//  ViewController.h
//  DaoTest
//
//  Created by Gopal.Vaid on 15/04/16.
//  Copyright © 2016 Gopal.Vaid. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,weak)IBOutlet UITableView *table_View;

@end

