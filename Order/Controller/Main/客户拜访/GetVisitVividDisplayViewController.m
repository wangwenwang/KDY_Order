//
//  GetVisitVividDisplayViewController.m
//  Order
//
//  Created by wenwang wang on 2018/11/29.
//  Copyright © 2018年 凯东源. All rights reserved.
//

#import "GetVisitVividDisplayViewController.h"
#import "GetVisitEnterShopService.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import "Tools.h"
#import "LM_alert.h"
#import <MBProgressHUD.h>
#import "UIImage+Compress.h"
#import "KBShowStepViewController.h"
#import "ACMediaFrame.h"
#import "UIView+ACMediaExt.h"

@interface GetVisitVividDisplayViewController ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate, GetVisitEnterShopServiceDelegate>
{
    ACSelectMediaView *_mediaView;
}

// 网络层
@property (strong, nonatomic) GetVisitEnterShopService *service;

// 生动化陈列下拉值
@property (weak, nonatomic) IBOutlet UILabel *VividDisplayCbx;

// 照片容器
@property (weak, nonatomic) IBOutlet UIView *PictureContainerView;

// 确认
@property (weak, nonatomic) IBOutlet UIButton *confirmBtn;

// textView的placeholder
@property (weak, nonatomic) IBOutlet UILabel *placeholderLabel;

@property (weak, nonatomic) IBOutlet UITextView *VividDisplayText;

// 生动化陈列
@property (strong, nonatomic) NSArray *CBXS;

// 照片数组
@property (strong, nonatomic) NSArray *imageArr;

// 容器高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollContainerViewHeight;

// 类型高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *CbxsViewHeight;

// 照片高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *PictureContainerViewHeight;

// 备注高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *RemarkViewHeight;

@end

@implementation GetVisitVividDisplayViewController

- (instancetype)init {
    
    if(self = [super init]) {
        
        _service = [[GetVisitEnterShopService alloc] init];
        _service.delegate = self;
    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"生动化陈列";
    
    [self initUI];
    
    [_service VividDisplayCBX];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}

- (void)updateViewConstraints {
    
    [super updateViewConstraints];
    
    _scrollContainerViewHeight.constant = _CbxsViewHeight.constant + _PictureContainerViewHeight.constant + _RemarkViewHeight.constant;
}

- (void)initUI {
    
    _VividDisplayCbx.text = @"";
    
    _confirmBtn.layer.cornerRadius = 20;
    _confirmBtn.layer.shadowOffset =  CGSizeMake(0, 3);
    _confirmBtn.layer.shadowOpacity = 0.5;
    _confirmBtn.layer.shadowColor =  [UIColor redColor].CGColor;
    
    ACSelectMediaView *mediaView = [[ACSelectMediaView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 120)];
    mediaView.type = ACMediaTypeAll;
    mediaView.maxImageSelected = 9;
    mediaView.naviBarBgColor = [UIColor blueColor];
    mediaView.rowImageCount = 3;
    mediaView.lineSpacing = 20;
    mediaView.interitemSpacing = 20;
    mediaView.sectionInset = UIEdgeInsetsMake(20, 20, 20, 20);
    _mediaView = mediaView;
    [_PictureContainerView addSubview:mediaView];
    
    [mediaView observeViewHeight:^(CGFloat mediaHeight) {
        mediaHeight = ([UIScreen mainScreen] .bounds.size.width - mediaView.sectionInset.left * 2 - mediaView.sectionInset.left * 2) / mediaView.rowImageCount + mediaView.sectionInset.top + mediaView.sectionInset.bottom;
    }];
    
    __weak __typeof(self)weakSelf = self;
    [_mediaView observeSelectedMediaArray:^(NSArray<ACMediaModel *> *list) {
        weakSelf.imageArr = list;
        NSInteger lineCount = 0;
        if(list.count == 9) {
            lineCount = (list.count - 1) / 3 + 1;
        }else {
            lineCount = list.count / 3 + 1;
        }
        _PictureContainerViewHeight.constant = lineCount * 120 + 40;
        [self updateViewConstraints];
    }];
}


#pragma mark - 手势

- (IBAction)CBXOnclick {
    
    [self.view endEditing:YES];
    [LM_alert showLMAlertViewWithTitle:@"选择生动化陈列" message:@"" cancleButtonTitle:@"取消" okButtonTitle:nil otherButtonTitleArray:_CBXS clickHandle:^(NSInteger index) {
        
        if(index >= 1) {
            
            _VividDisplayCbx.text = _CBXS[index - 1];
        }
    }];
}


#pragma mark - 事件

// 确认
- (IBAction)saveAndNext {
    
    if([_VividDisplayCbx.text isEqualToString:@""]) {
        
        [Tools showAlert:self.view andTitle:@"请选择生成化陈列类型"];
        return;
    }
    
    CGFloat maxLenth = 80 * 1000;
    CGFloat maxWidthAndHeight = 568 * 2;
    NSMutableArray *imageM = [[NSMutableArray alloc] init];
    
    for (ACMediaModel *m in _imageArr) {
        
        if(m.uploadType != nil) {
            UIImage *image = [UIImage imageWithData:m.uploadType];
            NSData *data = [image compressImage:image andMaxLength:maxLenth andMaxWidthAndHeight:maxWidthAndHeight];
            if(data != nil) {
                image = [UIImage imageWithData:data];
            }
            [imageM addObject:image];
        }
    }
    
    NSString *image1 = @"";
    NSString *image2 = @"";
    NSString *image3 = @"";
    NSString *image4 = @"";
    NSString *image5 = @"";
    NSString *image6 = @"";
    NSString *image7 = @"";
    NSString *image8 = @"";
    NSString *image9 = @"";
    if(imageM.count >= 1) {
        
        image1 = [Tools changeImageToString:imageM[0]];
    }
    if(imageM.count >= 2) {
        
        image2 = [Tools changeImageToString:imageM[1]];
    }
    if(imageM.count >= 3) {
        
        image3= [Tools changeImageToString:imageM[2]];
    }
    if(imageM.count >= 4) {
        
        image4 = [Tools changeImageToString:imageM[3]];
    }
    if(imageM.count >= 5) {
        
        image5 = [Tools changeImageToString:imageM[4]];
    }
    if(imageM.count >= 6) {
        
        image6 = [Tools changeImageToString:imageM[5]];
    }
    if(imageM.count >= 7) {
        
        image7 = [Tools changeImageToString:imageM[6]];
    }
    if(imageM.count >= 8) {
        
        image8 = [Tools changeImageToString:imageM[7]];
    }
    if(imageM.count >= 9) {
        
        image9 = [Tools changeImageToString:imageM[8]];
    }
    
    
    if(
       image1 != nil &&
       image2 != nil &&
       image3 != nil &&
       image4 != nil &&
       image5 != nil &&
       image6 != nil &&
       image7 != nil &&
       image8 != nil &&
       image9 != nil
       ) {
        
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        [_service GetVisitVividDisplay:_pvItemM.vISITIDX andStrVividDisplayCbx:@"" andStrVividDisplayText:_VividDisplayText.text andPictureFile1:image1 andPictureFile2:image2 andPictureFile3:image3 andPictureFile4:image4 andPictureFile5:image5 andPictureFile6:image6 andPictureFile7:image7 andPictureFile8:image8 andPictureFile9:image9];
    } else {
        
        [Tools showAlert:self.view andTitle:@"照片不能为空"];
    }
}


#pragma mark - 键盘回收

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString*)text {
    
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    
    if (![text isEqualToString:@""]) {
        _placeholderLabel.hidden = YES;
    }
    
    if ([text isEqualToString:@""] && range.location == 0 && range.length == 1) {
        _placeholderLabel.hidden = NO;
    }
    
    return YES;
}


#pragma mark - GetVisitEnterShopServiceDelegate

- (void)successOfGetVisitVividDisplay:(NSString *)msg {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [Tools showAlert:self.view andTitle:msg];
    
    KBShowStepViewController *vc = [[KBShowStepViewController alloc] init];
    vc.pvItemM = _pvItemM;
    vc.isShowConfirmBtn = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)failureOfGetVisitVividDisplay:(NSString *)msg {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [Tools showAlert:self.view andTitle:msg];
}

- (void)successOfVividDisplayCBX:(NSString *)msg andCBX:(NSArray *)CBX {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];

    NSMutableArray *arrM = [[NSMutableArray alloc] init];
    for (NSDictionary *dict in CBX) {
        
        [arrM addObject:dict[@"ITEM_NAME"]];
    }
    _CBXS = [arrM copy];
}

- (void)failureOfVividDisplayCBX:(NSString *)msg {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [Tools showAlert:self.view andTitle:msg];
}

@end
