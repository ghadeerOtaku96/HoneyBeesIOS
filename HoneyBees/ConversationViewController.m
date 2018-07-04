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
@property (strong ,nonatomic) NSMutableArray<Conversation *> *conversationsArray;
@end

@implementation ConversationViewController


// TODO: handle the date as messanger!
// TODO: round image and presence and connect it with real data
// TODO: move detail label up
// TODO: disable selecting cell
// TODO: in tableview : remove lines betoween empty cells
// TODO: add images to assets

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSArray* array = [ServicesManager sharedInstance].conversationsManagerService.conversations;
    self.conversationsArray = [NSMutableArray arrayWithArray:array];
 
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didAddConversation:) name:kConversationsManagerDidAddConversation object:nil];

   
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
    
    Conversation * conversation = (Conversation *)  [self.conversationsArray objectAtIndex:indexPath.row];
    
    if ([conversation.peer isKindOfClass:[Contact class]]) {
        Contact * aContact = (Contact *)conversation.peer;
        cell.NameLabel.text = aContact.fullName ;
    }
    else if ([conversation.peer isKindOfClass:[Room class]]) {
         cell.NameLabel.text = conversation.peer.displayName;
    }
   
    cell.StatusLabel.text = conversation.lastMessage.body;
    cell.DateLabel.text = [NSString stringWithFormat:@"%@",conversation.lastUpdateDate];
    
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
