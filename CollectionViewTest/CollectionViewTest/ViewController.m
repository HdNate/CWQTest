//
//  ViewController.m
//  CollectionViewTest
//
//  Created by 陈武琦 on 16/8/12.
//  Copyright © 2016年 陈武琦. All rights reserved.
//

#define kScreenW [[UIScreen mainScreen] bounds].size.width
#define kScreenH [[UIScreen mainScreen] bounds].size.height
#import "ViewController.h"
#import "FlowLayoutCell.h"
#import "CWQFlowLayout.h"
static NSString * const cellID = @"FlowLayoutCellID";
@interface ViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CWQFlowLayout *layout = ({
        CWQFlowLayout *layout = [[CWQFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(180, 180);
        // 设置为水平滚动
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        // 设置内边距
        CGFloat insetGap = (kScreenW - layout.itemSize.width) * 0.5;
        layout.sectionInset = UIEdgeInsetsMake(0, insetGap, 0, insetGap);
        layout;
    });
    
    UICollectionView *collectionView = ({
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 200) collectionViewLayout:layout];
        collectionView.dataSource = self;
        collectionView.delegate = self;
        [collectionView registerNib:[UINib nibWithNibName:@"FlowLayoutCell" bundle:nil] forCellWithReuseIdentifier:cellID];
        collectionView.center = self.view.center;
        collectionView.backgroundColor = [UIColor brownColor];
        collectionView.showsHorizontalScrollIndicator = NO;
        collectionView;
    });
    [self.view addSubview:collectionView];
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return 20;
    
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    FlowLayoutCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    if (!cell) {
        cell = [[FlowLayoutCell alloc] init];
    }
    cell.photoView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld",indexPath.item + 1]];
    return cell;


}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
