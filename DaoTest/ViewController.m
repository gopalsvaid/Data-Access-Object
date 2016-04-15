//
//  ViewController.m
//  DaoTest
//
//  Created by Gopal.Vaid on 15/04/16.
//  Copyright © 2016 Gopal.Vaid. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "SecondViewController.h"

#define app ((AppDelegate *)[UIApplication sharedApplication].delegate)

@interface ViewController ()
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear: animated];
    
    NSLog(@"%@",app.objdata.daoArray);
    if (app.objdata.daoArray.count == 0){
    
    // API call
    
    //Init the NSURLSession with a configuration
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    
    //Create an URLRequest
    NSURL *url = [NSURL URLWithString:@"http://merchantapi.hiteshi.com/api/Consumer/GetCategory"];
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    
    //Create POST Params and add it to HTTPBody
    [urlRequest setHTTPMethod:@"POST"];
    
     //Create task
    NSURLSessionDataTask *dataTask = [defaultSession dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        //Handle your response here
        @try{
            
            if(data.length > 0)
            {
                //success
                NSError *e=nil;
                NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data options: 0 error: &e];
                
                if(result){
                    
                    if ([[result valueForKey:@"Success"] isEqualToString:@"0"]) {
                        
                        NSLog(@"Fail response :%@",[result valueForKey:@"Message"]);
                        
                    }else if([[result valueForKey:@"Success"] isEqualToString:@"1"]){
                        
                        NSLog(@"Success response :%@",[result valueForKey:@"Categories"]);
                        
                        for (NSDictionary *dic in [result valueForKey:@"Categories"]) {
                            NSLog(@"print");
                            [app.objdata.daoArray addObject:[app.objdata initWithCategory:[dic valueForKey:@"Category_Name"] withDescription:[dic valueForKey:@"Category_Description"] withImageURL:[dic valueForKey:@"Image_Path"] withRemainingItemCount:[dic valueForKey:@"Status"] withcategoryID:[dic valueForKey:@"Category_Id"]]];
                             NSLog(@"Array :%@",app.objdata.daoArray);
                        }
                         NSLog(@"Array response:%@",app.objdata.daoArray);
                        
                        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
                        NSString *documentsDirectory = [paths objectAtIndex:0];
                        documentsDirectory = [documentsDirectory stringByAppendingPathComponent:@""];
                        NSString *filePath = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat: @"USER_LOGGEDIN"]];
                        
                        NSMutableData *data = [[NSMutableData alloc] init];
                        NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
                        DaoClass *objToSave = app.objdata;
                        [objToSave encodeWithCoder:archiver];
                        [archiver finishEncoding];
                        [data writeToFile:filePath atomically:YES];
                        
                        [self.table_View reloadData];
                    }
                }
            }
            
        } @catch (NSException *exception) {
            NSLog(@"Error: %@",[exception description]);
        }
    }];
    
    [dataTask resume];
    
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [app.objdata.daoArray count];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString * resuseIdentifier = @"Cell";
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:resuseIdentifier];
    
    if(cell == nil){
    
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:resuseIdentifier];
    }
    
    DaoClass * dataObject = [app.objdata.daoArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = dataObject.categoryName;
    cell.detailTextLabel.text = dataObject.categoryDescription;
    [cell.detailTextLabel sizeToFit];
    cell.detailTextLabel.numberOfLines = 4;

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    SecondViewController *objSecondViewController = [storyboard instantiateViewControllerWithIdentifier:@"SecondViewController"];
    objSecondViewController.dataobject = [app.objdata.daoArray objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:objSecondViewController animated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
