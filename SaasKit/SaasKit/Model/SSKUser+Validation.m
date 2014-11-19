//
//  SSKUser+Validation.m
//  SaasKit
//
//  Created by Patryk Kaczmarek on 19.11.2014.
//  Copyright (c) 2014 Netguru.co. All rights reserved.
//

#import "SSKUser+Validation.h"
#import "NSString+SSKAdditions.h"

#import "SSKDefines.h"
#import "SSKMacros.h"

@implementation SSKUser (Validation)

- (BOOL)loginValidationWithError:(SSKError *__autoreleasing*)error {
    
    if ([self.password isEmpty]) {
        *error = [SSKError errorWithCode:SSKErrorPasswordEmpty];
        return NO;
    }
    
    switch (self.loginMethod) {
        case SSKLoginUsingEmail:
            if ([self.email isEmpty]) {
                *error = [SSKError errorWithCode:SSKErrorEmailEmpty];
                return NO;
            } else if (![self.email hasValidEmailSyntax]) {
                *error = [SSKError errorWithCode:SSKErrorEmailSyntaxError];
                return NO;
            }
            break;
            
        case SSKLoginUsingUsername:
            if ([self.username isEmpty]) {
                *error = [SSKError errorWithCode:SSKErrorUsernameEmpty];
                return NO;
            }
            break;
    }
    return YES;
}

- (BOOL)remindPasswordValidationWithError:(SSKError *__autoreleasing *)error {
    
    if ([self.password isEmpty]) {
        *error = [SSKError errorWithCode:SSKErrorPasswordEmpty];
        return NO;
    }
    return YES;
}

@end