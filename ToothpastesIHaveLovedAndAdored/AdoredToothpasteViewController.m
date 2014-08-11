//
//  ViewController.m
//  ToothpastesIHaveLovedAndAdored
//
//  Created by Efrén Reyes Torres on 8/11/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "AdoredToothpasteViewController.h"

@interface AdoredToothpasteViewController ()<UITableViewDelegate, UITableViewDataSource>
@property NSArray *adoredToothpastes;
@end

@implementation AdoredToothpasteViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    cell.textLabel.text = [self.adoredToothpastes objectAtIndex:indexPath.row];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.adoredToothpastes.count;
}

@end
