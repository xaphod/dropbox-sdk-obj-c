///
/// Copyright (c) 2016 Dropbox, Inc. All rights reserved.
///
/// Auto-generated by Stone, do not modify.
///

#import "DBStoneSerializers.h"
#import "DBStoneValidators.h"
#import "DBTEAMCOMMONGroupManagementType.h"

#pragma mark - API Object

@implementation DBTEAMCOMMONGroupManagementType

#pragma mark - Constructors

- (instancetype)initWithCompanyManaged {
  self = [super init];
  if (self) {
    _tag = DBTEAMCOMMONGroupManagementTypeCompanyManaged;
  }
  return self;
}

- (instancetype)initWithUserManaged {
  self = [super init];
  if (self) {
    _tag = DBTEAMCOMMONGroupManagementTypeUserManaged;
  }
  return self;
}

- (instancetype)initWithOther {
  self = [super init];
  if (self) {
    _tag = DBTEAMCOMMONGroupManagementTypeOther;
  }
  return self;
}

#pragma mark - Instance field accessors

#pragma mark - Tag state methods

- (BOOL)isCompanyManaged {
  return _tag == DBTEAMCOMMONGroupManagementTypeCompanyManaged;
}

- (BOOL)isUserManaged {
  return _tag == DBTEAMCOMMONGroupManagementTypeUserManaged;
}

- (BOOL)isOther {
  return _tag == DBTEAMCOMMONGroupManagementTypeOther;
}

- (NSString *)tagName {
  switch (_tag) {
  case DBTEAMCOMMONGroupManagementTypeCompanyManaged:
    return @"DBTEAMCOMMONGroupManagementTypeCompanyManaged";
  case DBTEAMCOMMONGroupManagementTypeUserManaged:
    return @"DBTEAMCOMMONGroupManagementTypeUserManaged";
  case DBTEAMCOMMONGroupManagementTypeOther:
    return @"DBTEAMCOMMONGroupManagementTypeOther";
  }

  @throw([NSException exceptionWithName:@"InvalidTag" reason:@"Tag has an unknown value." userInfo:nil]);
}

#pragma mark - Serialization methods

+ (NSDictionary *)serialize:(id)instance {
  return [DBTEAMCOMMONGroupManagementTypeSerializer serialize:instance];
}

+ (id)deserialize:(NSDictionary *)dict {
  return [DBTEAMCOMMONGroupManagementTypeSerializer deserialize:dict];
}

#pragma mark - Description method

- (NSString *)description {
  return [[DBTEAMCOMMONGroupManagementTypeSerializer serialize:self] description];
}

@end

#pragma mark - Serializer Object

@implementation DBTEAMCOMMONGroupManagementTypeSerializer

+ (NSDictionary *)serialize:(DBTEAMCOMMONGroupManagementType *)valueObj {
  NSMutableDictionary *jsonDict = [[NSMutableDictionary alloc] init];

  if ([valueObj isCompanyManaged]) {
    jsonDict[@".tag"] = @"company_managed";
  } else if ([valueObj isUserManaged]) {
    jsonDict[@".tag"] = @"user_managed";
  } else if ([valueObj isOther]) {
    jsonDict[@".tag"] = @"other";
  } else {
    @throw([NSException exceptionWithName:@"InvalidTag"
                                   reason:@"Object not properly initialized. Tag has an unknown value."
                                 userInfo:nil]);
  }

  return jsonDict;
}

+ (DBTEAMCOMMONGroupManagementType *)deserialize:(NSDictionary *)valueDict {
  NSString *tag = valueDict[@".tag"];

  if ([tag isEqualToString:@"company_managed"]) {
    return [[DBTEAMCOMMONGroupManagementType alloc] initWithCompanyManaged];
  } else if ([tag isEqualToString:@"user_managed"]) {
    return [[DBTEAMCOMMONGroupManagementType alloc] initWithUserManaged];
  } else if ([tag isEqualToString:@"other"]) {
    return [[DBTEAMCOMMONGroupManagementType alloc] initWithOther];
  }

  @throw([NSException
      exceptionWithName:@"InvalidTag"
                 reason:[NSString stringWithFormat:@"Tag has an invalid value: \"%@\".", valueDict[@".tag"]]
               userInfo:nil]);
}

@end
