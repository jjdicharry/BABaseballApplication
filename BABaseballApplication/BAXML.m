//
//  BAXML.m
//  BABaseballApplication
//
//  Created by Mac on 10/3/15.
//  Copyright © 2015 MAC. All rights reserved.
//

#import "BAXML.h"

@implementation BAXML {
    NSMutableArray *mediaArray;
    NSString       *mediaString;
    NSString       *currentElement;
}

- (BAScoreboard *)parseXMLWithURL:(NSString *)urlString andScoreboard:(BAScoreboard *)scoreboard {
    NSURL          *url       = [NSURL URLWithString:urlString];
    NSData         *data      = [NSData dataWithContentsOfURL:url];
    NSXMLParser    *xmlParser = [[NSXMLParser alloc] initWithData:data];
    int            i          = 0;
    int            index      = 0;
    xmlParser.delegate        = self;
    currentElement            = @"";
    mediaArray                = [[NSMutableArray alloc] init];
    
    [xmlParser parse];
    
    for (NSString *mediaURL in mediaArray) {
        index = (int)[mediaURL rangeOfString:@"rtmp://"].location;
        
        if (index == -1) {
            i++;
            
            switch (i) {
                case 1:
                    scoreboard.highlightURL01 = mediaURL;
                    break;
                case 2:
                    scoreboard.highlightURL02 = mediaURL;
                    break;
                case 3:
                    scoreboard.highlightURL03 = mediaURL;
                    break;
                case 4:
                    scoreboard.highlightURL04 = mediaURL;
                    break;
                case 5:
                    scoreboard.highlightURL05 = mediaURL;
                    break;
                case 6:
                    scoreboard.highlightURL06 = mediaURL;
                    break;
                case 7:
                    scoreboard.highlightURL07 = mediaURL;
                    break;
                case 8:
                    scoreboard.highlightURL08 = mediaURL;
                    break;
                case 9:
                    scoreboard.highlightURL09 = mediaURL;
                    break;
                case 10:
                    scoreboard.highlightURL10 = mediaURL;
                    break;
            }
        }
    }
    
    return scoreboard;
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    if ([elementName isEqualToString:@"url"]) {
        currentElement = elementName;
        mediaString    = @"";
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    if ([currentElement isEqualToString:@"url"]) {
        mediaString = [mediaString stringByAppendingString:string];
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    if ([elementName isEqualToString:@"url"]) {
        [mediaArray addObject:mediaString];
        currentElement = @"";
    }
}


@end
