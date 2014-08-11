//
//  ViewController.m
//  ToothpastesIHaveLovedAndAdored
//
//  Created by Efrén Reyes Torres on 8/11/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "AdoredToothpasteViewController.h"
#import "ToothPastesTableTableViewController.h"

@interface AdoredToothpasteViewController ()<UITableViewDelegate, UITableViewDataSource>
@property NSMutableArray *adoredToothpastes;
@property (strong, nonatomic) IBOutlet UITableView *toothPastesTableView;
@end

@implementation AdoredToothpasteViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self load];
    if (self.adoredToothpastes == nil) {
        self.adoredToothpastes = [NSMutableArray new];
    }
}

-(IBAction)unwindFromToothpasteViewController:(UIStoryboardSegue*)segue {
    NSLog(@"Fuck Yeah!");
    ToothPastesTableTableViewController *tvc = segue.sourceViewController;
    NSIndexPath *indexPath;

    NSString *toothpaste = [tvc adoredToothpaste];
    [self.adoredToothpastes addObject:toothpaste];
    indexPath = [NSIndexPath indexPathForRow:self.adoredToothpastes.count-1 inSection:0];
    [self.toothPastesTableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    [self save];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    cell.textLabel.text = [self.adoredToothpastes objectAtIndex:indexPath.row];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.adoredToothpastes.count;
}

-(NSURL *)documentsDirectory {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *directories = [fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask];
    return directories.firstObject;
}

-(void)save {
    NSLog(@"Saving...");
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSURL *plist = [[self documentsDirectory] URLByAppendingPathComponent:@"pastes.plist"];

    [self.adoredToothpastes writeToURL:plist atomically:YES];
    [defaults setObject:[NSDate date] forKey:@"LastSaved"];
    [defaults synchronize];
}

-(void)load {
    NSURL *plist = [[self documentsDirectory] URLByAppendingPathComponent:@"pastes.plist"];
    self.adoredToothpastes = [NSMutableArray arrayWithContentsOfURL:plist];
}
@end
