//
//  ActionRequestHandler.m
//  Converter
//
//  Created by Ye Myat Min on 10/6/14.
//  Copyright (c) 2014 Nex Co., Ltd. All rights reserved.
//

#import "ActionRequestHandler.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface ActionRequestHandler ()

@property (nonatomic, strong) NSExtensionContext *extensionContext;

@end

@implementation ActionRequestHandler

- (void)beginRequestWithExtensionContext:(NSExtensionContext *)context {
    self.extensionContext = context;
    
    __block BOOL found = NO;
    
    // Find the item containing the results from the JavaScript preprocessing.
    [context.inputItems enumerateObjectsUsingBlock:^(NSExtensionItem* item, NSUInteger idx, BOOL *stop) {
        [item.attachments enumerateObjectsUsingBlock:^(NSItemProvider* itemProvider, NSUInteger idx, BOOL *stop) {
            if ([itemProvider hasItemConformingToTypeIdentifier:(NSString *)kUTTypePropertyList]) {
                [itemProvider loadItemForTypeIdentifier:(NSString *)kUTTypePropertyList options:nil completionHandler:^(NSDictionary *dictionary, NSError *error) {
                    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    }];
                }];
                found = YES;
            }
            *stop = found;
        }];
        *stop = found;
    }];
    
    if (!found) {
        [self doneWithResults:nil];
    }
}

- (void)doneWithResults:(NSDictionary *)resultsForJavaScriptFinalize {
    // Don't hold on to this after we finished with it.
    [self.extensionContext completeRequestReturningItems:nil completionHandler:nil];
    self.extensionContext = nil;
}

@end
