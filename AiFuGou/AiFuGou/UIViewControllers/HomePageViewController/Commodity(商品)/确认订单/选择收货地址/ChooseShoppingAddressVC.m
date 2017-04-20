//
//  ChooseShoppingAddressVC.m
//  AiFuGou
//
//  Created by Michael on 16/6/15.
//  Copyright © 2016年 jumper. All rights reserved.
//
#import "Masonry.h"
#import "ChooseShoppingAddressVC.h"
#import "ChooseShoppingAddressCustomCell.h"
#import "ChooseShoppingAddressModel.h"
#import "AddShoppingAddressVC.h"
@interface ChooseShoppingAddressVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign) NSInteger   selectedRow;

@end

@implementation ChooseShoppingAddressVC


- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = KHexColor(@"#ebebeb");
    self.title = @"选择收货地址";
    self.dataArray = [[NSMutableArray alloc] initWithObjects:@"武汉", @"深圳",@"ni",@"ma",@"de",nil];
    

    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.rowHeight = 80;
    self.tableView.backgroundColor = KHexColor(@"#ebebeb");
    self.tableView.showsVerticalScrollIndicator = NO;
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.view addSubview:_tableView];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.equalTo(self.view);
    }];
    
    [self setRightItemImage:@"address_add"];
    [self requestData];
    
    _selectedRow = 3;
}
- (void)requestData
{
    NSDictionary * dic = @{@"appKey":@"00001",
                           @"v":@"1.0",
                           @"format": @"json",
                           @"method":@"rop.address.get",
                           @"customerid":@"2941",
                          };
    [OMURLConnection requestAFNJSon:dic method:RequestUrl view:self.view version:@"" completeBlock:^(NSData *data, id responseObject) {
        
        
        
        NSDictionary *content = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];//这里是把数据转化为字典了
        
        if ([[content objectForKey:@"result"] integerValue] == 1)
        {
        
            NSArray *dataArr = [[content objectForKey:@"data"] objectForKey:@"info"];
            for (int i = 0; i<dataArr.count; i++) {
                
                ChooseShoppingAddressModel *model = [[ChooseShoppingAddressModel alloc] initWithDictionary:dataArr[i]];
                [_dataArray addObject:model];
            }
            
           
            NSLog(@"self.dataArray = %@",self.dataArray);
        }
        
        
              [_tableView reloadData];
    } errorBlock:^(NSError *error) {
        
    }];
    
   


}
- (void)rightImageClick
{
    AddShoppingAddressVC *vc = [AddShoppingAddressVC new];
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark ------------------------------------------------------  popoverActionsEnd--------------------------
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"ChooseShoppingAddressCustomCell";
    ChooseShoppingAddressCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[ChooseShoppingAddressCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    //cell.chooseModel = self.dataArray[indexPath.row];
    cell.nameLabel.text = self.dataArray[indexPath.row];
    __weak ChooseShoppingAddressCustomCell *safeCell = cell;
    [safeCell setSetDefaultAddressBlock:^{

        _selectedRow = indexPath.row;
        ChooseShoppingAddressModel *model = self.dataArray[indexPath.row];
        
        NSLog(@"%ld--------%ld",indexPath.row,_selectedRow);
        [_tableView reloadData];
      
        
        
    }];
    NSString *statusString = nil;

    if (indexPath.row == _selectedRow)
    {
        [cell.chooseButton setImage:[UIImage imageNamed:@"address_xuanzhong"] forState:UIControlStateNormal];
        statusString = @"0";
        
    }
    else
    {
        [cell.chooseButton setImage:[UIImage imageNamed:@"address_meixuanzhong"] forState:UIControlStateNormal];
        statusString = @"1";
    }

    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    AddShoppingAddressVC *vc = [AddShoppingAddressVC new];
    ChooseShoppingAddressModel *model = self.dataArray[indexPath.row];
    
    vc.titleString = @"修改收货地址";
    vc.statusString = model.status;
    vc.nameString = model.name;
    vc.phoneString = model.phone;
    vc.streetString = model.street;
    vc.id = model.id;
    [self.navigationController pushViewController:vc animated:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *sectionView = [UIView new];
    sectionView.backgroundColor = KHexColor(@"#ebebeb");
    
    
    return sectionView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return  0.01;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //删除
    ChooseShoppingAddressModel *model = self.dataArray[indexPath.row];
    NSDictionary *dic = @{@"appKey":@"00001",
            @"v":@"1.0",
            @"format": @"json",
            @"method":@"rop.deleteaddress.get",
            @"customerid":@"2941",
            @"id":model.id};
    
    [OMURLConnection requestAFNJSon:dic method:RequestUrl view:self.view version:@"" completeBlock:^(NSData *data, id responseObject) {
        
        
        NSDictionary *content = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];//这里是把数据转化为字典了
        
        NSLog(@" ==+ %@",[content objectForKey:@"result"]);
        if ([[content objectForKey:@"result"] integerValue] == 1) {
            
            k_yjHUD(@"删除成功", self.view);
            [self.dataArray removeObjectAtIndex:indexPath.row];
            [self.tableView reloadData];
        }
        
    } errorBlock:^(NSError *error) {
        
    }];

}
@end
