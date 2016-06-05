//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (NSArray *)arrayBySortingArrayAscending:(NSArray *)array {
    NSSortDescriptor *sortAsc = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    return [array sortedArrayUsingDescriptors:@[sortAsc]];
}

- (NSArray *)arrayBySortingArrayDescending:(NSArray *)array {
    NSSortDescriptor *sortDesc = [NSSortDescriptor sortDescriptorWithKey:nil ascending:NO];
    return [array sortedArrayUsingDescriptors:@[sortDesc]];
}

- (NSArray *)arrayBySwappingFirstObjectWithLastObjectInArray:(NSArray *)array {
    NSMutableArray *mutableArray = [array mutableCopy];
    id lastObject = [mutableArray lastObject];
    id firstObject = [mutableArray firstObject];
    
    [mutableArray replaceObjectAtIndex:0 withObject:lastObject];
    [mutableArray replaceObjectAtIndex:array.count-1 withObject:firstObject];
    
    return mutableArray;
}

- (NSArray *)arrayByReversingArray:(NSArray *)array {
    return [[array reverseObjectEnumerator] allObjects];
}

- (NSString *)stringInBasicLeetFromString:(NSString *)string {
    NSMutableString *mutableString = [string mutableCopy];
    NSDictionary *characters = @{
                                 @"a" : @"4",
                                 @"s" : @"5",
                                 @"i" : @"1",
                                 @"l" : @"1",
                                 @"e" : @"3",
                                 @"t" : @"7",
                                 };
    
    NSArray *leetKeys = [characters allKeys];
    for (NSUInteger i = 0; i < characters.count; i++) {
        [mutableString replaceOccurrencesOfString:leetKeys[i] withString:characters[leetKeys[i]] options:NSCaseInsensitiveSearch range:NSMakeRange(0, string.length)];
    }
    
    return mutableString;
}

- (NSArray *)splitArrayIntoNegativesAndPositives:(NSArray *)array {
    NSMutableArray *posArray = [NSMutableArray array];
    NSMutableArray *negArray = [NSMutableArray array];
    NSMutableArray *combinedArray = [NSMutableArray array];
    
    for (NSNumber *number in array) {
        if ([number integerValue] < 0) {
            [negArray addObject:number];
        } else {
            [posArray addObject:number];
        }
    }
    
    [combinedArray addObject:negArray];
    [combinedArray addObject:posArray];
    
    return combinedArray;
}

- (NSArray *)namesOfHobbitsInDictionary:(NSDictionary *)dictionary {
    NSMutableArray *hobbits = [NSMutableArray array];
    
    for (NSString *key in dictionary) {
        if ([[dictionary objectForKey:key] isEqualToString:@"hobbit"]) {
            [hobbits addObject:key];
        }
    }
    
    return hobbits;
}

- (NSArray *)stringsBeginningWithAInArray:(NSArray *)array {
    NSMutableArray *arrayOfA = [NSMutableArray array];
    
    for (NSString *string in array) {
        if ([[string lowercaseString] characterAtIndex:0] == 'a') {
            [arrayOfA addObject:string];
        }
    }
    
    return arrayOfA;
}

- (NSInteger)sumOfIntegersInArray:(NSArray *)array {
    NSUInteger total = 0;
    
    for (NSUInteger i = 0; i < array.count; i++) {
        total += [[array objectAtIndex:i] integerValue];
    }
    
    return total;
}

- (NSArray *)arrayByPluralizingStringsInArray:(NSArray *)array {
    NSMutableArray *plurals = [NSMutableArray array];
    NSDictionary *dictionary = @{ @"hand"   : @"hands",
                                  @"foot"   : @"feet",
                                  @"knee"   : @"knees",
                                  @"table"  : @"tables",
                                  @"box"    : @"boxes",
                                  @"ox"     : @"oxen",
                                  @"axle"   : @"axles",
                                  @"radius" : @"radii",
                                  @"trivium": @"trivia"
                                };
    
    for (NSUInteger i = 0; i < array.count; i++) {
        NSArray *keys = [dictionary allKeys];
        if ([keys containsObject:array[i]]) {
            [plurals addObject:dictionary[array[i]]];
        }
    }
    return plurals;
}

- (NSDictionary *)countsOfWordsInString:(NSString *)string {
    NSMutableDictionary *dictionary = [NSMutableDictionary new];
    NSMutableString *mutableString = [[string lowercaseString] mutableCopy];
    NSArray *array = [NSArray array];
    NSArray *toRemove = @[@".", @",", @"-", @";"];
    
    for (NSString *punctuation in toRemove) {
        [mutableString replaceOccurrencesOfString:punctuation withString:@""
                                          options:NSCaseInsensitiveSearch
                                            range:NSMakeRange(0, mutableString.length)];
        array = [mutableString componentsSeparatedByString:@" "];
    }
    
    for (NSString *string in array) {
        if (dictionary[string]) {
            NSInteger value = [dictionary[string] integerValue];
            value++;
            
            NSNumber *numberValue = @(value);
            dictionary[string] = numberValue;
        } else {
            dictionary[string] = @(1);
        }
    }
    
    return dictionary;
}

- (NSDictionary *)songsGroupedByArtistFromArray:(NSArray *)array {
    NSMutableArray *mutableArray = [NSMutableArray new];
    NSMutableDictionary *musicLibrary = [NSMutableDictionary new];
    NSArray *artistSongs = @[];
    NSArray *alphabeticalArray = @[];
    
    NSSortDescriptor *sortAsc = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    alphabeticalArray = [array sortedArrayUsingDescriptors:@[sortAsc]];
    
    for (NSString *str in alphabeticalArray) {
        artistSongs = [str componentsSeparatedByString:@" – "];
        [mutableArray addObjectsFromArray:artistSongs];
    }
    
    for (NSUInteger i = 0; i < mutableArray.count; i+=2) {
        if (musicLibrary[mutableArray[i]]) {
            [musicLibrary[mutableArray[i]] addObject:mutableArray[i]];
        } else {
            musicLibrary[mutableArray[i]] = [@[mutableArray[i]] mutableCopy];
        }
    }
    
    return musicLibrary;
}

@end
