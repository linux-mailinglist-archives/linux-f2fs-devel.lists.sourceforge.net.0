Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 193C5BA6C14
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 28 Sep 2025 10:53:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-Id:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aPGMCgAUvelzUJfSs5q5HblWPgLD9KZoCAZO5o8Lh3k=; b=RRpPy+1Z2CARlXaYLoBdUeT0EE
	vfFKB37zyaGCBScfttSd0hLIjhQRGeb60z06iq9fNctXEp/PFnRT6D75G0W9eH306iIzFYSVD8iDp
	FChVDxnh6avKJ9jQXAiJ5gk42UOLcRkUfiNlyZc63+fsEgckSyCUVsJY6TDZrgUh4/8M=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v2n9Z-0005VG-7D;
	Sun, 28 Sep 2025 08:53:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1v2n9Y-0005V4-0e
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 28 Sep 2025 08:53:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4WEeRdJ3Yx+iBn3NFAO7GzOSBIBfuBwWvLQ02WMlqKc=; b=LYJg8oZsthH513NoIeJU+jkbJ2
 9Tuw9Ugb967+hpDOE6lWDKnLGJIvfsH2oQyZANv05uTI2t3y8llngQPBRtWObiqST6Hb+/43mJQ8R
 P3+8imenQLauR2+nI5SY5YRIUAJkaKKh91QhSLoF0ezvPdAnx0QTKVcY0LFWyYL+9mrs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4WEeRdJ3Yx+iBn3NFAO7GzOSBIBfuBwWvLQ02WMlqKc=; b=TRZL0GBL6n/u0QwZbf2dmCufrH
 8YDwx+FtmsgKTM9o/PPxuwAz9il7Tia6PiyhN1r5FsSHIpTXwgNDvvNlLKyyB+UsNGjDCPRU9E27K
 PzySu2ADBtP6eziZJ2h6ZMypFq95DWe+ArBq3KVczSIucVMGb9FvnrF1sUa5cbyBtDZc=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v2n9Y-0004Zz-A5 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 28 Sep 2025 08:53:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 950D560010
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 28 Sep 2025 08:53:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 433CDC116B1;
 Sun, 28 Sep 2025 08:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759049582;
 bh=Ba3s8CZ9Sh7orNoDoBFCVy6+HFnC2PXzqvsdQw7kHSE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jc/aRr25flDU00t8YIcZZnzKyeXVnl1knO3csJW9eXK3KO7SaDYzaJbsLDi3Rhvmq
 QCLBeVIPvrlrJ2HmG/ZwtBlyV5HDmVI7ygLdgjbzyXDsyoUdSMVqZDPSFpUQObAAzB
 I5zL7YawFv9YsPadNPpJZqr5lrOD/951X4W4jAPNzErLoG6hSixnTWjZ1TFKmdzmOo
 aNXxuq5qYoKZRlHezBCk2sYiIwvhRWsnAmSNe2hAho81mc4CoNBGgaB6wHBV7CtyLz
 42t8O3Qq6Km2TXiYUddDYwjZPKrpFWB6U4O9UQWddKSxy3wym+R0wZCF6QrsC+LFI3
 EkwfewwKF0AOw==
To: Zorro Lang <zlang@kernel.org>,
	fstests@vger.kernel.org
Date: Sun, 28 Sep 2025 16:34:42 +0800
Message-Id: <20250928083442.7955-2-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20250928083442.7955-1-chao@kernel.org>
References: <20250928083442.7955-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This is a regression test: 1. create foo & bar 2. write 8M
 data to foo 3. use inject.f2fs to inject i_nid[0] of foo w/ ino of bar 4.
 fpunch in foo w/ specified range If we haven't applied kernel patch ("f2fs:
 fix to do sanity check on node footer for non inode dnode"), f2fs may missed
 to do sanity check on corrupted dnode, result in panic or deadloop in step
 4). Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v2n9Y-0004Zz-A5
Subject: [f2fs-dev] [PATCH v2 2/2] f2fs/022: do sanity check on footer of
 non inode dnode
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This is a regression test:
1. create foo & bar
2. write 8M data to foo
3. use inject.f2fs to inject i_nid[0] of foo w/ ino of bar
4. fpunch in foo w/ specified range

If we haven't applied kernel patch ("f2fs: fix to do sanity check on
node footer for non inode dnode"), f2fs may missed to do sanity check
on corrupted dnode, result in panic or deadloop in step 4).

Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Chao Yu <chao@kernel.org>
---
v2:
- remove "_require_kernel_config CONFIG_F2FS_CHECK_FS"
- update comments a bit
 tests/f2fs/022     | 54 ++++++++++++++++++++++++++++++++++++++++++++++
 tests/f2fs/022.out |  2 ++
 2 files changed, 56 insertions(+)
 create mode 100755 tests/f2fs/022
 create mode 100644 tests/f2fs/022.out

diff --git a/tests/f2fs/022 b/tests/f2fs/022
new file mode 100755
index 00000000..ed3b4f2b
--- /dev/null
+++ b/tests/f2fs/022
@@ -0,0 +1,54 @@
+#! /bin/bash
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (c) 2025 Chao Yu.  All Rights Reserved.
+#
+# FS QA Test No. f2fs/022
+#
+# This is a regression test:
+# 1. create foo & bar
+# 2. write 8M data to foo
+# 3. use inject.f2fs to inject i_nid[0] of foo w/ ino of bar
+# 4. fpunch in foo w/ specified range
+#
+. ./common/preamble
+_begin_fstest auto quick rw
+
+. ./common/attr
+
+_fixed_by_kernel_commit xxxxxxxxxxxx \
+	"f2fs: fix to do sanity check on node footer for non inode dnode"
+
+_require_scratch_nocheck
+_require_command "$F2FS_INJECT_PROG" inject.f2fs
+
+# remove all mkfs options to avoid layout change of on-disk inode
+export MKFS_OPTIONS=""
+
+foo_path=$SCARTCH_MNT/foo
+bar_path=$SCARTCH_MNT/bar
+
+_scratch_mkfs >> $seqres.full
+_scratch_mount
+
+touch $foo_path
+touch $bar_path
+$XFS_IO_PROG $foo_path -c "pwrite 0 8M"
+sync
+foo_ino=`stat -c '%i' $foo_path`
+bar_ino=`stat -c '%i' $bar_path`
+_scratch_unmount
+
+# inject foo inode to replace i_nid[0] w/ to bar ino
+$F2FS_INJECT_PROG --node --mb i_nid --nid $foo_ino --idx 0 --val $bar_ino $SCRATCH_DEV >> $seqres.full || _fail "failed to inject"
+
+_scratch_mount
+
+# if CONFIG_F2FS_CHECK_FS is enabled, it will trigger a kernel panic,
+# otherwise, it will enter a deadloop.
+$XFS_IO_PROG $foo_path -c "fpunch 6984k 4k"
+_scratch_unmount
+
+echo "Silence is golden"
+
+status=0
+exit
diff --git a/tests/f2fs/022.out b/tests/f2fs/022.out
new file mode 100644
index 00000000..394c6a7c
--- /dev/null
+++ b/tests/f2fs/022.out
@@ -0,0 +1,2 @@
+QA output created by 022
+Silence is golden
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
