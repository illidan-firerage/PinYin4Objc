//
//  NSString+FRPinYinUtils.m
//  PinYin4ObjcExample
//
//  Created by Aidian on 15/9/7.
//  Copyright (c) 2015年 kimziv. All rights reserved.
//

#import "NSString+FRPinYinUtils.h"
#import "PinYin4Objc.h"

@implementation NSString (FRPinYinUtils)

#pragma mark -
#pragma mark - Private Methods

- (NSString *)pinYinStringWithCaseType:(CaseType)caseType seperater:(NSString *)seperater
{
    HanyuPinyinOutputFormat *outputFormat=[[HanyuPinyinOutputFormat alloc] init];
    [outputFormat setToneType:ToneTypeWithoutTone];
    [outputFormat setVCharType:VCharTypeWithV];
    [outputFormat setCaseType:caseType];
    NSString *outputPinyin=[PinyinHelper toHanyuPinyinStringWithNSString:self withHanyuPinyinOutputFormat:outputFormat withNSString:seperater];
    return outputPinyin;
}

- (NSString *)defaultSeperater
{
    return @" ";
}

#pragma mark -
#pragma mark - Member Methods

- (NSString *)pinYinString
{
    return [self pinYinStringWithCaseType:CaseTypeLowercase seperater:[self defaultSeperater]];
}

- (NSString *)uppercasePinYinString
{
    NSString *pinYinString = [self pinYinStringWithCaseType:CaseTypeUppercase seperater:[self defaultSeperater]];
    return [pinYinString uppercaseString];
}

- (NSString *)lowercasePinYinString
{
    NSString *pinYinString = [self pinYinStringWithCaseType:CaseTypeLowercase seperater:[self defaultSeperater]];
    return [pinYinString lowercaseString];
}

@end
