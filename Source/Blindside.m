#import "Blindside.h"
#import "BSInjectorImpl.h"

@implementation Blindside

+ (id<BSInjector>)injectorWithModule:(id<BSModule>)module {
    return [Blindside injectorWithModules:[NSArray arrayWithObject:module]];
}

+ (id<BSInjector>)injectorWithModules:(NSArray *)modules {
    BSInjectorImpl *injector = [[BSInjectorImpl alloc] init];
    for (id<BSModule> module in modules) {
        [module configure:injector];
    }
    [injector bind:@"injector" toInstance:injector];
    return injector;
}

@end
