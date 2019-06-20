Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CA34DCC0
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 20 Jun 2019 23:38:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1he4la-0007ba-V3; Thu, 20 Jun 2019 21:38:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1he4lW-0007b0-7w
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 20 Jun 2019 21:38:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2qd6p1GAMXDjK3H5Cl0U9tsFTZZ1/F6xWuCXeOoSkl4=; b=UNAf1ptTPTQYnV9ICk+/HSFue4
 8j11jm2DkgEcO2KT8FVXnDESPRAJHk2c9qx0i9Ytk9HHGtrx+dxFqL4bms85SY+3nHUXK0Icc3CNo
 isUYNzy/69oZyoGrR7jeF8DP5v2sswdLPSvNm8V+s2vCZZROn4r95ZQXECobjIs01asc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=2qd6p1GAMXDjK3H5Cl0U9tsFTZZ1/F6xWuCXeOoSkl4=; b=B
 hX0LiO+SjD6B5maV7Om421vVjYeD1ucBlUkbD2LWksLPYbzGiORTPAAa89LdjuehVX0KUOYXL8o93
 XFZkBpHMrkSLlfmx/Gsn/W0hxpEXhpOVqzC896Oly/EEeS9tUqoI1la/fafgE6p6TlxtFzmF4+wWV
 yZDNwQlcY8RH/R3Y=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1he4lW-006aPK-L4
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 20 Jun 2019 21:38:44 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C455220657;
 Thu, 20 Jun 2019 21:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561066717;
 bh=yEG3vC7ixbuXelNYA7seRr/QNRJr1EicOmlE5fCxzFQ=;
 h=From:To:Cc:Subject:Date:From;
 b=c4ZCFhbiDByOiTH43+vW/ggstzPGjebtsiDTS//cWSPMyRgzEjX9xlmMJdeEiS9Lu
 gtiaqFtR7dfrk5bT/3EKMtTLAvaHwsTH7NVDkKgNWjcVo3W/b8GS0TrG4A5as/1qtv
 xLE9QjGXP85PvgRlL1lFrR+X5jz5TGpDcBXm+xrU=
From: Eric Biggers <ebiggers@kernel.org>
To: fstests@vger.kernel.org
Date: Thu, 20 Jun 2019 14:36:06 -0700
Message-Id: <20190620213614.113685-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
MIME-Version: 1.0
X-Spam-Score: 0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.6 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1he4lW-006aPK-L4
Subject: [f2fs-dev] [RFC PATCH v2 0/8] xfstests: add fs-verity tests
X-BeenThere: linux-f2fs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-f2fs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=linux-f2fs-devel>
List-Post: <mailto:linux-f2fs-devel@lists.sourceforge.net>
List-Help: <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=subscribe>
Cc: "Theodore Y . Ts'o" <tytso@mit.edu>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, Victor Hsieh <victorhsieh@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Add tests for fs-verity, a new feature for read-only file-based
authenticity protection.  fs-verity will be supported by ext4 and f2fs,
and perhaps by other filesystems later.  Running these tests requires:

- A kernel with the fs-verity patches applied and configured with
  CONFIG_FS_VERITY.  Specifically, this version of the xfstests patchset
  is compatible with version 5 of the kernel patchset, which can be
  retrieved from tag "fsverity_2019-06-20" of
  https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git

- The fsverity utility program from
  https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/fsverity-utils.git

- e2fsprogs v1.45.2 or later for ext4 tests, or f2fs-tools v1.11.0 or
  later for f2fs tests.

Example with kvm-xfstests:

	$ kvm-xfstests -c ext4,f2fs -g verity

For more information about fs-verity, see the file
Documentation/filesystems/fsverity.rst from the kernel patchset.

This version of the xfstests patchset can also be retrieved from tag
"fsverity_2019-06-20" of
https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/xfstests-dev.git

Changed since v1 (Dec. 2018):

  - Updated all tests to use the new fs-verity kernel API.

  - Many cleanups, additional checks in the tests, and other improvements.

  - Addressed review comments from Eryu Guan.

  - Added a test for the built-in signature verification feature.

  - Removed the fs-verity descriptor validation test, since the on-disk
    format of this part was greatly simplified and made fs-specific.

Eric Biggers (8):
  common/filter: add _filter_xfs_io_fiemap()
  common/verity: add common functions for testing fs-verity
  generic: test general behavior of verity files
  generic: test access controls on the fs-verity ioctls
  generic: test corrupting verity files
  generic: test that fs-verity is using the correct measurement values
  generic: test using fs-verity and fscrypt simultaneously
  generic: test the fs-verity built-in signature verification support

 common/config         |   2 +
 common/filter         |  24 +++++
 common/verity         | 200 ++++++++++++++++++++++++++++++++++++++++++
 tests/generic/900     | 190 +++++++++++++++++++++++++++++++++++++++
 tests/generic/900.out |  71 +++++++++++++++
 tests/generic/901     |  73 +++++++++++++++
 tests/generic/901.out |  14 +++
 tests/generic/902     | 154 ++++++++++++++++++++++++++++++++
 tests/generic/902.out |  91 +++++++++++++++++++
 tests/generic/903     | 112 +++++++++++++++++++++++
 tests/generic/903.out |   5 ++
 tests/generic/904     |  80 +++++++++++++++++
 tests/generic/904.out |  12 +++
 tests/generic/905     | 141 +++++++++++++++++++++++++++++
 tests/generic/905.out |  34 +++++++
 tests/generic/group   |   6 ++
 16 files changed, 1209 insertions(+)
 create mode 100644 common/verity
 create mode 100755 tests/generic/900
 create mode 100644 tests/generic/900.out
 create mode 100755 tests/generic/901
 create mode 100644 tests/generic/901.out
 create mode 100755 tests/generic/902
 create mode 100644 tests/generic/902.out
 create mode 100755 tests/generic/903
 create mode 100644 tests/generic/903.out
 create mode 100755 tests/generic/904
 create mode 100644 tests/generic/904.out
 create mode 100755 tests/generic/905
 create mode 100644 tests/generic/905.out

-- 
2.22.0.410.gd8fdbe21b5-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
