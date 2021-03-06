///
/// Copyright (c) 2016 Dropbox, Inc. All rights reserved.
///
/// Auto-generated by Stone, do not modify.
///

#import "DBFILESDeletedMetadata.h"
#import "DBFILESFileMetadata.h"
#import "DBFILESFolderMetadata.h"
#import "DBFILESMetadata.h"
#import "DBStoneSerializers.h"
#import "DBStoneValidators.h"

#pragma mark - API Object

@implementation DBFILESMetadata

#pragma mark - Constructors

- (instancetype)initWithName:(NSString *)name
                   pathLower:(NSString *)pathLower
                 pathDisplay:(NSString *)pathDisplay
        parentSharedFolderId:(NSString *)parentSharedFolderId {
  [DBStoneValidators
   nullableValidator:[DBStoneValidators stringValidator:nil maxLength:nil pattern:@"[-_0-9a-zA-Z:]+"]](
      parentSharedFolderId);

  self = [super init];
  if (self) {
    _name = name;
    _pathLower = pathLower;
    _pathDisplay = pathDisplay;
    _parentSharedFolderId = parentSharedFolderId;
  }
  return self;
}

- (instancetype)initWithName:(NSString *)name {
  return [self initWithName:name pathLower:nil pathDisplay:nil parentSharedFolderId:nil];
}

#pragma mark - Serialization methods

+ (NSDictionary *)serialize:(id)instance {
  return [DBFILESMetadataSerializer serialize:instance];
}

+ (id)deserialize:(NSDictionary *)dict {
  return [DBFILESMetadataSerializer deserialize:dict];
}

#pragma mark - Description method

- (NSString *)description {
  return [[DBFILESMetadataSerializer serialize:self] description];
}

@end

#pragma mark - Serializer Object

@implementation DBFILESMetadataSerializer

+ (NSDictionary *)serialize:(DBFILESMetadata *)valueObj {
  NSMutableDictionary *jsonDict = [[NSMutableDictionary alloc] init];

  jsonDict[@"name"] = valueObj.name;
  if (valueObj.pathLower) {
    jsonDict[@"path_lower"] = valueObj.pathLower;
  }
  if (valueObj.pathDisplay) {
    jsonDict[@"path_display"] = valueObj.pathDisplay;
  }
  if (valueObj.parentSharedFolderId) {
    jsonDict[@"parent_shared_folder_id"] = valueObj.parentSharedFolderId;
  }

  if ([valueObj isKindOfClass:[DBFILESFileMetadata class]]) {
    NSDictionary *subTypeFields = [DBFILESFileMetadataSerializer serialize:(DBFILESFileMetadata *)valueObj];
    for (NSString *key in subTypeFields) {
      jsonDict[key] = subTypeFields[key];
    }
    jsonDict[@".tag"] = @"file";
  } else if ([valueObj isKindOfClass:[DBFILESFolderMetadata class]]) {
    NSDictionary *subTypeFields = [DBFILESFolderMetadataSerializer serialize:(DBFILESFolderMetadata *)valueObj];
    for (NSString *key in subTypeFields) {
      jsonDict[key] = subTypeFields[key];
    }
    jsonDict[@".tag"] = @"folder";
  } else if ([valueObj isKindOfClass:[DBFILESDeletedMetadata class]]) {
    NSDictionary *subTypeFields = [DBFILESDeletedMetadataSerializer serialize:(DBFILESDeletedMetadata *)valueObj];
    for (NSString *key in subTypeFields) {
      jsonDict[key] = subTypeFields[key];
    }
    jsonDict[@".tag"] = @"deleted";
  }

  return jsonDict;
}

+ (DBFILESMetadata *)deserialize:(NSDictionary *)valueDict {
  if ([valueDict[@".tag"] isEqualToString:@"file"]) {
    return [DBFILESFileMetadataSerializer deserialize:valueDict];
  }
  if ([valueDict[@".tag"] isEqualToString:@"folder"]) {
    return [DBFILESFolderMetadataSerializer deserialize:valueDict];
  }
  if ([valueDict[@".tag"] isEqualToString:@"deleted"]) {
    return [DBFILESDeletedMetadataSerializer deserialize:valueDict];
  }

  @throw([NSException
      exceptionWithName:@"InvalidTag"
                 reason:[NSString stringWithFormat:@"Tag has an invalid value: \"%@\".", valueDict[@".tag"]]
               userInfo:nil]);
}

@end
