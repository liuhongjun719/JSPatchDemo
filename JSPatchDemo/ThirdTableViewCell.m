//
//  ThirdTableViewCell.m
//  JSPatchDemo
//
//  Created by 123456 on 17/1/19.
//  Copyright © 2017年 123456. All rights reserved.
//

#import "ThirdTableViewCell.h"
#import "Masonry.h"

@interface ThirdTableViewCell ()
@property (nonatomic, strong) UIImageView *leftImage;
@property (nonatomic, strong) UILabel *title;
@end

@implementation ThirdTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createUI];
    }
    return self;
}

- (void)createUI {
    _leftImage = [[UIImageView alloc] init];
    [self addSubview:_leftImage];
    
    _title = [[UILabel alloc] init];
    [self addSubview:_title];
}
- (void)layoutSubviews {
    [_leftImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(50);
        make.centerY.equalTo(self.mas_centerY);
        make.left.mas_equalTo(10);
    }];
    
    [_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_leftImage.mas_right).offset(10);
        make.height.mas_equalTo(20);
        make.right.equalTo(self).offset(-10);
        make.centerY.equalTo(self.mas_centerY);
    }];
    [self layoutIfNeeded];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
