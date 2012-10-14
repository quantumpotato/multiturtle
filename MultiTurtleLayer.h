//
//  MultiTurtleLayer.h
//  MultiTurtle
//
//  Created by X3N0 on 10/14/12.
//
//

#import "CCLayer.h"
#import "MTGameController.h"

@interface MultiTurtleLayer : CCLayer {
    NSTimer *_timer;
}

@property (strong, nonatomic) MTGameController *gc;
@property (strong, nonatomic) CCLabelTTF *scoreLabel;

+ (CCScene *)scene;

@end
