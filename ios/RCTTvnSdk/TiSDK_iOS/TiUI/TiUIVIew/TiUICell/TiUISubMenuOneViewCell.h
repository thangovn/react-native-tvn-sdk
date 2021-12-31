//
//  TiUISubMenuOneViewCell.h
//  TiSDKDemo
//
//  Created by iMacA1002 on 2019/12/4.
//  Copyright © 2020 Tillusory Tech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TiConfig.h"

@interface TiUISubMenuOneViewCell : UICollectionViewCell

@property(nonatomic,strong)TIMenuMode *subMod;

- (void)setCellTypeBorderIsShow:(BOOL)show;

@end
