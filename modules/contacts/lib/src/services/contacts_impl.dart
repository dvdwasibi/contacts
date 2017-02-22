// Copyright 2017 The Fuchsia Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:apps.contacts.services/contacts.fidl.dart' as cs;

class ContactsImpl extends cs.Contacts {

  // @TODO connect to ledger
  @override
  Future<Null> put(cs.Contact contact) {

  }
}
