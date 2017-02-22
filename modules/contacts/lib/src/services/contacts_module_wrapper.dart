// Copyright 2017 The Fuchsia Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'dart:convert';
import 'package:application.services/service_provider.fidl.dart';
import 'package:apps.ledger.services.public/ledger.fidl.dart';
import 'package:apps.modular.services.story/link.fidl.dart';
import 'package:apps.modular.services.story/module.fidl.dart';
import 'package:apps.modular.services.story/story.fidl.dart';
import 'package:lib.fidl.dart/bindings.dart';

void _log(String msg) {
  print('[Contact Service Module] $msg');
}

dynamic _handleResponse(String description) {
  return (Status status) {
    if (status != Status.ok) {
      _log("$description: $status");
    }
  };
}

/// Module wrapper around the contacts service since background agents are
/// still under development
///
/// This allows us to connect to ledger and pass our service to other modules
class ContactsModuleWrapper extends Module {

  final LedgerProxy _ledger = new LedgerProxy();
  final StoryProxy _story = new StoryProxy();
  final PageProxy _page = new PageProxy();

  @override
  void initialize(
    InterfaceHandle<Story> storyHandle,
    InterfaceHandle<Link> linkHandle,
    InterfaceHandle<ServiceProvider> incomingServices,
    InterfaceRequest<ServiceProvider> outgoingServices,
  ) {

    // Connect to the story
    _story.ctrl.bind(storyHandle);

    // Connect to the ledger that the story connects to
    _story.getLedger(_ledger.ctrl.request(), _handleResponse('getLedger'));

    // Connect to root page of ledger
    _ledger.getRootPage(_page.ctrl.request(),  _handleResponse("getRootPage"));

  }

}
