//
//  ConversationViewController.h
//  HoneyBees
//
//  Created by Ghadeer Abualrub on 7/1/18.
//  Copyright © 2018 Ghadeer Abualrub. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Rainbow/Rainbow.h>
#import "CustomTableViewCell.h"
@interface ConversationViewController : UIViewController

// the name of the properity must be small , plz change this
@property (strong, nonatomic) IBOutlet UITableView *ConversationsTable;

@end
