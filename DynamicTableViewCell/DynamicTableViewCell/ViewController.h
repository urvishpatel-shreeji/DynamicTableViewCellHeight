//
//  ViewController.h
//  DynamicTableViewCell
//
//  Created by Urvish Patel on 16/10/16.
//  Copyright © 2016 Urvish Patel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    IBOutlet UITableView *tblViewDynamicCell;
    NSMutableArray *aryContent;
    
}
@end

