Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E196A7162C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 Mar 2025 13:04:15 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1txPUM-000593-TU;
	Wed, 26 Mar 2025 12:04:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1txPUL-00058r-92
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Mar 2025 12:04:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RyR9/2IeTRBF8cUIRHU9qvMDFiDLnY/lyJTazMVtPlg=; b=UhFu8EynQ19uF1KF0qLGpvZrzr
 d13ZrJ5nuABjZb+gg5BSVcNzUCoeyfMr5uE4wQ1X2uh/rxG/kD3jdhro9AV08Lb8L6wJInFABiME8
 lxzy+M4ZHUfdER4irNBNS9ZvARbDs+9/OamqvJ6e+rua7NepfasUZkHP0ws4P+moyK24=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=RyR9/2IeTRBF8cUIRHU9qvMDFiDLnY/lyJTazMVtPlg=; b=Q
 tAhM60YdsLcgUhrq1cE8jsP41RQ9sZtHOiZCS0ezRC6NxQ5D9qsPjr3xo7YBJJUpYk8tt2CfL+RN9
 ryLNzh9QcnLqdUcVtNTfWLPvXNqGbVzEz6TkVUb/23kpdCPmMUG2uTtPPiJzMaoHhU3VarcF/llvz
 QI6eEG63Ui/pt3mA=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1txPUJ-0007NX-RW for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Mar 2025 12:04:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4086B6112F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 26 Mar 2025 12:03:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84C04C4CEE2;
 Wed, 26 Mar 2025 12:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742990631;
 bh=Y+epb3NLQIDPGyb4Dk0u1R+/gTlL8sesV7u4E5OVk6s=;
 h=From:To:Cc:Subject:Date:From;
 b=Cf3Y4PfAO6mQHZ1bcqtJMgZcj6lh+bwCtSFD6EXxixYXhzaqcr9NSxPmFGSOvbXWB
 SLDEH/64xuO90UU+eSxf6ALJtJFEjbEo7OBTXIrl2uyGbc7n5s4/CgC8+aew7j65F/
 4/e7V5wvwwr75q5U4l9qFtiEDa9stunuOmymB2D79HjlwBRII0VRvaxeLxwbNGbwup
 0q7SeurlbgXNtt5l7u9WdK9BzA0K/z+Eq+CuUNRnn/Lw/Q+xdy1ouxH4kDv777INlA
 RjZewIatkuD3F0MSi8wpd0mKHQOBPwnX5Fp+VctscIH8qYHOHCqi8gL16GpMc/Gw9O
 gqW8JK+gNsDNA==
To: Zorro Lang <zlang@kernel.org>,
	fstests@vger.kernel.org
Date: Wed, 26 Mar 2025 20:03:41 +0800
Message-ID: <20250326120341.3641535-1-chao@kernel.org>
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This is a regression testcase to check whether we will handle
 out-of-space case correctly during fallocate() on pinned file once we disable
 checkpoint. Testcase: 1. mount f2fs w/ checkpoint=disable option 2. create
 fragmented file data 3. set flag w/ pinned flag 4. fallocate space for pinned
 file, expects panic due to running out of space. 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in sa-accredit.habeas.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1txPUJ-0007NX-RW
Subject: [f2fs-dev] [PATCH] f2fs/011: test to check out-of-space issue
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

This is a regression testcase to check whether we will handle
out-of-space case correctly during fallocate() on pinned file
once we disable checkpoint.

Testcase:
1. mount f2fs w/ checkpoint=disable option
2. create fragmented file data
3. set flag w/ pinned flag
4. fallocate space for pinned file, expects panic due to running
out of space.

We should apply commit 48ea8b200414 ("f2fs: fix to avoid panic
once fallocation fails for pinfile") to avoid system panic.
Note that it only fix the issue for regular block device, problem
still exist for zoned block device.

Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 tests/f2fs/011     | 58 ++++++++++++++++++++++++++++++++++++++++++++++
 tests/f2fs/011.out |  2 ++
 2 files changed, 60 insertions(+)
 create mode 100755 tests/f2fs/011
 create mode 100644 tests/f2fs/011.out

diff --git a/tests/f2fs/011 b/tests/f2fs/011
new file mode 100755
index 00000000..1ece8fd0
--- /dev/null
+++ b/tests/f2fs/011
@@ -0,0 +1,58 @@
+#! /bin/bash
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (c) 2025 Chao Yu.  All Rights Reserved.
+#
+# FS QA Test No. f2fs/012
+#
+# This is a regression testcase to check whether we will handle
+# out-of-space case correctly during fallocate() on pinned file
+# once we disable checkpoint.
+# 1. mount f2fs w/ checkpoint=disable option
+# 2. create fragmented file data
+# 3. set flag w/ pinned flag
+# 4. fallocate space for pinned file, expects panic due to running
+# out of space
+# We should apply commit 48ea8b200414 ("f2fs: fix to avoid panic
+# once fallocation fails for pinfile") to avoid system panic.
+# Note that it only fix the issue for regular block device, problem
+# still exist for zoned block device.
+#
+. ./common/preamble
+_begin_fstest auto quick
+
+_cleanup()
+{
+	cd /
+	rm -r -f $tmp.*
+}
+
+_fixed_by_kernel_commit 48ea8b200414 \
+       "f2fs: fix to avoid panic once fallocation fails for pinfile"
+
+_require_scratch
+_require_command "$F2FS_IO_PROG" f2fs_io
+
+_scratch_mkfs_sized $((1*1024*1024*1024)) >> $seqres.full
+_scratch_mount -o checkpoint=disable:10%
+
+pinfile=$SCRATCH_MNT/file
+
+# simulate fragment status in f2fs
+for ((i=0;i<256;i++)) do
+       dd if=/dev/zero of=$SCRATCH_MNT/$i bs=1M count=1 >>$seqres.full 2>&1
+done
+sync
+
+for ((i=0;i<256;i+=2)) do
+       rm $SCRATCH_MNT/$i >> $seqres.full 2>&1
+done
+sync
+
+touch $pinfile
+$F2FS_IO_PROG pinfile set $pinfile >> $seqres.full
+fallocate -l $((3*256*1024*1024)) $pinfile >> $seqres.full 2>&1
+
+echo "Silence is golden"
+
+status=0
+exit
diff --git a/tests/f2fs/011.out b/tests/f2fs/011.out
new file mode 100644
index 00000000..62e02519
--- /dev/null
+++ b/tests/f2fs/011.out
@@ -0,0 +1,2 @@
+QA output created by 011
+Silence is golden
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
