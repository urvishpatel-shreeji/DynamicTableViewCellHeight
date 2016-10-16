//
//  ViewController.m
//  DynamicTableViewCell
//
//  Created by Urvish Patel on 16/10/16.
//  Copyright © 2016 Urvish Patel. All rights reserved.
//

#import "ViewController.h"
#import "ContentTableViewCell.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    aryContent = [NSMutableArray new];
    [aryContent addObject:@"In your UITableViewCell subclass, add constraints so that the subviews of the cell have their edges pinned to the edges of the cell's contentView (most importantly to the top AND bottom edges). NOTE: don't pin subviews to the cell itself; only to the cell's contentView! Let the intrinsic content size of these subviews drive the height of the table view cell's content view by making sure the content compression resistance and content hugging constraints in the vertical dimension for each subview are not being overridden by higher-priority constraints you have added. (Huh? Click here.)"];
    [aryContent addObject:@"Remember, the idea is to have the cell's subviews connected vertically to the cell's content view so that they can exert pressure and make the content view expand to fit them. Using an example cell with a few subviews, here is a visual illustration of what some (not all!) of your constraints would need to look like:"];
    [aryContent addObject:@"Urvish"];
    [aryContent addObject:@"You can imagine that as more text is added to the multi-line body label in the example cell above, it will need to grow vertically to fit the text, which will effectively force the cell to grow in height. (Of course, you need to get the constraints right in order for this to work correctly!)"];
    [aryContent addObject:@"Getting your constraints right is definitely the hardest and most important part of getting dynamic cell heights working with Auto Layout. If you make a mistake here, it could prevent everything else from working -- so take your time! I recommend setting up your constraints in code because you know exactly which constraints are being added where, and it's a lot easier to debug when things go wrong. Adding constraints in code is just as easy as and significantly more powerful than Interface Builder when you leverage one of the fantastic open source APIs available -- here is the one I design, maintain, and use exclusively: https://github.com/smileyborg/PureLayout"];
    [aryContent addObject:@"If you're adding constraints in code, you should do this once from within the updateConstraints method of your UITableViewCell subclass. Note that updateConstraints may be called more than once, so to avoid adding the same constraints more than once, make sure to wrap your constraint-adding code within updateConstraints in a check for a boolean property such as didSetupConstraints (which you set to YES after you run your constraint-adding code once). On the other hand, if you have code that updates existing constraints (such as adjusting the constant property on some constraints), place this in updateConstraints but outside of the check for didSetupConstraints so it can run every time the method is called."];
    [aryContent addObject:@"For every unique set of constraints in the cell, use a unique cell reuse identifier. In other words, if your cells have more than one unique layout, each unique layout should receive its own reuse identifier. (A good hint that you need to use a new reuse identifier is when your cell variant has a different number of subviews, or the subviews are arranged in a distinct fashion.)"];
    [aryContent addObject:@"For example, if you were displaying an email message in each cell, you might have 4 unique layouts: messages with just a subject, messages with a subject and a body, messages with a subject and a photo attachment, and messages with a subject, body, and photo attachment. Each layout has completely different constraints required to achieve it, so once the cell is initialized and the constraints are added for one of these cell types, the cell should get a unique reuse identifier specific to that cell type. This means when you dequeue a cell for reuse, the constraints have already been added and are ready to go for that cell type."];
    
    
    
    tblViewDynamicCell.rowHeight = UITableViewAutomaticDimension;
    tblViewDynamicCell.estimatedRowHeight = 44.0;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView Datasource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return aryContent.count;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ContentTableViewCell *cell =(ContentTableViewCell*) [tblViewDynamicCell dequeueReusableCellWithIdentifier:@"reusebleCell"];
    if (cell == nil)
    {
        cell = [[ContentTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reusebleCell"];
    }
    cell.lblContent.text  = [aryContent objectAtIndex:indexPath.row];
    
    return  cell;
}
@end
