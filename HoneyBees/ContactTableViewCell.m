//
//  ContactTableViewCell.m
//  HoneyBees
//
//  Created by Ghadeer Abualrub on 6/24/18.
//  Copyright © 2018 Ghadeer Abualrub. All rights reserved.
//

#import "ContactTableViewCell.h"
#import <QuartzCore/QuartzCore.h>
@implementation ContactTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.OnlineActivity.layer.cornerRadius = self.OnlineActivity.frame.size.width/2;
    self.OnlineActivity.clipsToBounds = YES;
    self.OnlineActivity.layer.borderColor = [UIColor whiteColor].CGColor;
    self.OnlineActivity.layer.borderWidth = 3 ;
    

//    self.imageView.layer.opaque = false;
//    self.imageView.layer.cornerRadius = self.imageView.frame.size.width/2;
//    self.imageView.layer.masksToBounds = true;
//    


    

}
- (IBAction)showContactDetails:(UIButton *)sender {
    NSLog(@"GHADEER");
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
