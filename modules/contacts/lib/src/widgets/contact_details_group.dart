// Copyright 2017 The Fuchsia Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

/// A container for a group of ContactDetailsRow meant for the ContactDetails
/// view.
class ContactDetailsGroup extends StatelessWidget {
  /// Child content
  final Widget child;

  /// Icon representing this group
  final IconData icon;

  /// Constructor
  ContactDetailsGroup({
    Key key,
    @required this.child,
    @required this.icon,
  })
      : super(key: key) {
    assert(child != null);
    assert(icon != null);
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.only(top: 16.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 4.0,
            ),
            child: new Icon(
              icon,
              color: Colors.grey[500],
            ),
          ),
          child,
        ],
      ),
    );
  }
}
