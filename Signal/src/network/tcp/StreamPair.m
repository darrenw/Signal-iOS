//
//  Copyright (c) 2017 Open Whisper Systems. All rights reserved.
//

#import "StreamPair.h"

@implementation StreamPair
@synthesize inputStream, outputStream;

+(StreamPair*) streamPairWithInput:(NSInputStream*)input andOutput:(NSOutputStream*)output {
    ows_require(input != nil);
    ows_require(output != nil);

    StreamPair* r = [StreamPair new];
    r->inputStream = input;
    r->outputStream = output;
    
    [r->inputStream setProperty:NSStreamNetworkServiceTypeVoIP forKey:NSStreamNetworkServiceType];
    [r->outputStream setProperty:NSStreamNetworkServiceTypeVoIP forKey:NSStreamNetworkServiceType];
    return r;
}

@end
