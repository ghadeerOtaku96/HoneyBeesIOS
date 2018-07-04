//
//  ConversationViewController.m
//  HoneyBees
//
//  Created by Ghadeer Abualrub on 7/1/18.
//  Copyright © 2018 Ghadeer Abualrub. All rights reserved.
//

#import "ConversationViewController.h"
#import "CustomTableViewCell.h"
@interface ConversationViewController ()<UITableViewDelegate , UITableViewDataSource>

@end

@implementation ConversationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //NSArray* array = [ServicesManager sharedInstance].conversationsManagerService.conversations;
    //self.conversationsArray=[NSMutableArray arrayWithArray:array];
   // [[ServicesManager sharedInstance].contactsManagerService requestAddressBookAccess];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didAddConversation:) name:kConversationsManagerDidAddConversation object:nil];

    self.ConversationsTable.delegate = self;
    self.ConversationsTable.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
}


-(void)didAddConversation:(NSNotification*)notification{
    
    //NSArray* array =  [ServicesManager sharedInstance].conversationsManagerService.conversations;
    //self.conversationsArray = [NSMutableArray arrayWithArray:array];
    Conversation * conversation = (Conversation *)notification.object;
    [self.conversationsArray addObject:conversation];
    NSLog(@"test1%@",conversation.lastMessage.body);
    NSLog(@"test2 %lu",(unsigned long)self.conversationsArray.count);
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"test2 %lu",(unsigned long)self.conversationsArray.count);
    return self.conversationsArray.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.ConversationsTable deselectRowAtIndexPath:indexPath animated:YES];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    CustomTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"convcell"];
    if(!cell){
        [tableView registerNib:[UINib nibWithNibName:@"CustomTableViewCell" bundle:nil] forCellReuseIdentifier:@"convcell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"convcell"];
    }
    
    //Conversation * conversation = (Conversation *)  [self.conversationsArray objectAtIndex:indexPath.row];
    
    cell.NameLabel.text = @"Alaa";
    cell.textLabel.text = @"ghadeer";
    cell.StatusLabel.text = @"hello";
    cell.DateLabel.text =@"31/06/18";
//    cell.NameLabel.text = conversation.peer.displayName;
//    cell.StatusLabel.text = conversation.lastMessage.body;
//    cell.DateLabel.text = (NSString*)conversation.lastUpdateDate;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        cell.imageView.layer.cornerRadius = cell.imageView.frame.size.width/2;
        cell.imageView.clipsToBounds = YES;
        
        
    });
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
