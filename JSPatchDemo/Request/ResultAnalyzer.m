

//
//  ResultAnalyzer.m
//  斯迪尔
//
//  Created by Gloria on 14-7-4.
//  Copyright (c) 2014年 Steel. All rights reserved.
//

#import "ResultAnalyzer.h"
#import "ModelItem.h"
#import "RequestHeader.h"
#import <MJExtension.h>


@implementation ResultAnalyzer

+(ResponseObject *)analyseResult:(NSDictionary *)dictionary interfaceType:(NSInteger)interfaceType
{
    ResponseObject *responseObject = [[ResponseObject alloc] init];
    switch (interfaceType) {
        case TopicOrderSourceUrl_interface://直播
        {
            
            responseObject.info = [ModelItem mj_objectArrayWithKeyValuesArray:dictionary[@"info"]];
            responseObject.data = responseObject;
//            NSLog(@"oooooooooo-----:%@", dictionary[@"info"]);
        }
            break;


        default:
        {
            [responseObject setValuesForKeysWithDictionary:dictionary];
            return responseObject;
        }
            break;
    }
    
    return responseObject;
}

@end
