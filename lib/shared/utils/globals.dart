//
//  repopix
//  globals
//
//  Created by Ngonidzashe Mangudya on 03/05/2024.
//  Copyright (c) 2024 Codecraft Solutions. All rights reserved.
//

import '../../injection.dart';
import '../services/notifications.dart';
import '../services/secure_storage.dart';
import '../services/storage.dart';

SecureStorageService get $secureStorage => getIt<SecureStorageService>();
StorageService get $storage => getIt<StorageService>();
PushNotifications get $notifications => getIt<PushNotifications>();
