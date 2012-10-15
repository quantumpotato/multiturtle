//
//  MultiTurtleLayer.h
//  MultiTurtle
//
//  Created by X3N0 on 10/14/12.
//
//

#import "CCLayer.h"
#import "MTGameController.h"

@interface MultiTurtleLayer : CCLayer

@property (strong, nonatomic) MTGameController *gc;
@property (strong, nonatomic) CCLabelTTF *scoreLabel;
@property (strong, nonatomic) NSTimer *timer;

+ (CCScene *)scene;

@end
