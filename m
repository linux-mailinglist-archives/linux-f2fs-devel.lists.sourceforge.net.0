Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 55AF05C2F7
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  1 Jul 2019 20:27:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hi11Z-0006Dr-R3; Mon, 01 Jul 2019 18:27:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hi11Y-0006Dd-M6
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Jul 2019 18:27:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OsO/Wd1q5bcU4b3B0wvGd6tXl08BFDvVgWtVJKsxAAI=; b=KnCMMyatCH1vwc0ZZ8dLyE5yfb
 On/wIs1UlCVOGW/NMrIVF9cLqNbTPzj/6i7juwHgHHLeMidLOjTzuIZWEapOSblZ5rwZalw5XWsZy
 43IXZf1byXzUOtvh0Wcfxgw5Tprz+Wu+dCMq99q5snp/mX7sUvSnDFNQSYxsgnyNFH3Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=OsO/Wd1q5bcU4b3B0wvGd6tXl08BFDvVgWtVJKsxAAI=; b=L
 1K3e+4Bw0Au/qvmJ1+v8V3vOieBwLW8BBdf42yO/RLcUn2FS6wslZxs7ePz+lwyjG3UrZxroxvxWk
 FFKV2S5QgrJZo/UGRZifJ5Le+FMciqFc+LFleGh0sDJLsoRJK9jeVZVH1NqMw2GWaz5cB7bjgiGjy
 Bej2UCMAaj0JDgHI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hi11c-003hhR-HB
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Jul 2019 18:27:37 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8133E2146F;
 Mon,  1 Jul 2019 18:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1562005647;
 bh=n9HcezWaSPlpcASpI2bH07EeRES7gEyf5lL/IOSWc8E=;
 h=From:To:Cc:Subject:Date:From;
 b=g1Qo0ee2j38/uPs7qrsS9ErwaCGySuFiLPsChKtm4i6DxU+to9SFsNegQrvFhJ5zL
 EznJeRRngWVGRYa6ULrkomHuYjRC6RtjAHjNCgjDJ+kilosq+APZ1ymZPJyItH2CVP
 41gLjnyCZL65dqUwPD0A/jBNGuy6iNLyt6zFAfNU=
From: Eric Biggers <ebiggers@kernel.org>
To: fstests@vger.kernel.org
Date: Mon,  1 Jul 2019 11:25:39 -0700
Message-Id: <20190701182547.165856-1-ebiggers@kernel.org>
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
X-Headers-End: 1hi11c-003hhR-HB
Subject: [f2fs-dev] [RFC PATCH v3 0/8] xfstests: add fs-verity tests
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
  is compatible with version 6 of the kernel patchset, which can be
  retrieved from tag "fsverity_2019-07-01" of
  https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git

- The fsverity utility program from
  https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/fsverity-utils.git
  It needs to be commit 2151209ce1da or later.

- e2fsprogs v1.45.2 or later for ext4 tests, or f2fs-tools v1.11.0 or
  later for f2fs tests.

Example with kvm-xfstests:

	$ kvm-xfstests -c ext4,f2fs -g verity

For more information about fs-verity, see the file
Documentation/filesystems/fsverity.rst from the kernel patchset.

This version of the xfstests patchset can also be retrieved from tag
"fsverity_2019-07-01" of
https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/xfstests-dev.git

Changed since v2 (Jun. 2019):

  - Updated the signature verification test (generic/905) to match the
    latest kernel and fsverity-utils changes.

  - Added _fsv_sign() utility function.

  - Correctly skip the fs-verity tests on ext3-style filesystems.

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
 common/verity         | 215 ++++++++++++++++++++++++++++++++++++++++++
 tests/generic/900     | 190 +++++++++++++++++++++++++++++++++++++
 tests/generic/900.out |  71 ++++++++++++++
 tests/generic/901     |  73 ++++++++++++++
 tests/generic/901.out |  14 +++
 tests/generic/902     | 154 ++++++++++++++++++++++++++++++
 tests/generic/902.out |  91 ++++++++++++++++++
 tests/generic/903     | 112 ++++++++++++++++++++++
 tests/generic/903.out |   5 +
 tests/generic/904     |  80 ++++++++++++++++
 tests/generic/904.out |  12 +++
 tests/generic/905     | 150 +++++++++++++++++++++++++++++
 tests/generic/905.out |  42 +++++++++
 tests/generic/group   |   6 ++
 16 files changed, 1241 insertions(+)
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
