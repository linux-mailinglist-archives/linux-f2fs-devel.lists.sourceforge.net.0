Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A13E7F3958
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Nov 2023 23:39:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r5ZPG-0005dk-3L;
	Tue, 21 Nov 2023 22:39:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1r5ZPE-0005dd-Cu
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Nov 2023 22:39:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xvGMzjc4utdrIKc0TPq3ACSXu/1S9AWiz790knsYmbo=; b=aqh6lkrMPmdYbDRPLp3E3TIlwd
 QPMhBjbdzJ8OpWjbuZToOYflW/Da7ozbcuBFj+FKwtI3b4mKQo1GRGnAGV+bhu6YklHoyO3kwVB5d
 63LYnnViA7Kl/0rPT4kuEtn1nhhiiB6jJEAnAjPG/uG8RjFjaGrsV1uW4LD7kOlTWGKk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=xvGMzjc4utdrIKc0TPq3ACSXu/1S9AWiz790knsYmbo=; b=b
 PSQ4Fvrnv2I4jiQr2G4sGd+kSPQrxIwMB6aX0XX2kjEDatPHWLXmYdXx8x5YCJ5fRnAD/pyiecezS
 +XV3gMhOQGOzFLeGbVjccYKvdD24WU6Nn7g+N8uNVof+ktP00q0PAEZNxKGfw3PkuzQUvgXTErygt
 LIf5+EFOgF6l3PvU=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r5ZPC-0006YC-MA for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Nov 2023 22:39:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 5C6E3B82446;
 Tue, 21 Nov 2023 22:39:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FCD6C433C7;
 Tue, 21 Nov 2023 22:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700606375;
 bh=F7T9ozkx5kq3xFIaUUxDQId3Ryj4a172IH01F7bLlaA=;
 h=From:To:Cc:Subject:Date:From;
 b=lhpw0ES8jbh5enMJozW9b9tfugeonU6dStP/RBqgzl6iW4a2QYjdVbrLamfcFe6ZM
 n1AfA68K0vk7gYwZ4DVK6cBs7YgncKMSPbJ+48E0DKjGJqloppllX1aI+hvM/Psard
 eDLY8DTaFPpYB9LOnb7BLfW1Vg4TtTE6T0qOXFK5HxayRph8zgZdsSjJDbpm2Nxf6M
 /3PxIQ67MLlFu+4GEn38Idncz6/l1K7ljSl0Sxk4XHP6cAmkWnYkb2EZLVl1cwsVl6
 l9kRe3IvMRhHJs+1bmn/WtqDcXNBF/F6sqM8CAzZXNi164XKNgq4l/o5Z3w6emAgVB
 00EsoXKMJbGUw==
From: Eric Biggers <ebiggers@kernel.org>
To: fstests@vger.kernel.org
Date: Tue, 21 Nov 2023 14:39:05 -0800
Message-ID: <20231121223909.4617-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This series adds a test that verifies the on-disk format of
 encrypted files that use a crypto data unit size that differs from the
 filesystem
 block size. This tests the functionality that was introduc [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.68.75 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1r5ZPC-0006YC-MA
Subject: [f2fs-dev] [PATCH v2 0/4] xfstests: test custom crypto data unit
 size
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
Cc: linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
 Daniel Rosenberg <drosen@google.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This series adds a test that verifies the on-disk format of encrypted
files that use a crypto data unit size that differs from the filesystem
block size.  This tests the functionality that was introduced in Linux
6.7 by kernel commit 5b1188847180 ("fscrypt: support crypto data unit
size less than filesystem block size").

This depends on the xfsprogs patch
"xfs_io/encrypt: support specifying crypto data unit size"
(https://lore.kernel.org/r/20231013062639.141468-1-ebiggers@kernel.org)
which adds the '-s' option to the set_encpolicy command of xfs_io.

As usual, the test skips itself when any prerequisite isn't met.

I've tested the new test on both ext4 and f2fs.

Changed in v2:
- Updated the cover letter, commit message, and a comment to reflect
  that the kernel commit that added this feature was merged in 6.7.
- Rebased onto latest for-next branch of xfstests.

Eric Biggers (4):
  fscrypt-crypt-util: rename block to data unit
  common/rc: fix _require_xfs_io_command with digits in argument
  common/encrypt: support custom data unit size
  generic: add test for custom crypto data unit size

 common/encrypt           | 42 +++++++++++++-----
 common/rc                |  2 +-
 src/fscrypt-crypt-util.c | 93 ++++++++++++++++++++--------------------
 tests/f2fs/002           |  6 +--
 tests/generic/900        | 29 +++++++++++++
 tests/generic/900.out    | 11 +++++
 6 files changed, 123 insertions(+), 60 deletions(-)
 create mode 100755 tests/generic/900
 create mode 100644 tests/generic/900.out


base-commit: b9e1a88f8198ac02f3b82fe3b127d4e14f4a97b7
-- 
2.42.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
