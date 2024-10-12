Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B9E99B2E3
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 12 Oct 2024 12:15:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1szZ9g-0003bV-3z;
	Sat, 12 Oct 2024 10:15:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1szZ9e-0003bP-N8
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 12 Oct 2024 10:15:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jgGj4r4W/yh23dfQEriacMi/uNNP+CTkrP7BeJ/x0aA=; b=jk9c0nuYSS1hfCfm5wn23tmync
 KhazfFq+q6YOTf4F9nAS/G/19ARhbswN+OZI+vr97vn8/otPNQrF4OtpVSaF8FoNsfMp6ozzZ7VVB
 TjFqoibwajR9Ex/g7Qk3pvgQccgdQh37IAjBMOz/Oq0QxFBbXXm9reQUdwE+Fs0uLpgs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=jgGj4r4W/yh23dfQEriacMi/uNNP+CTkrP7BeJ/x0aA=; b=j
 y9z+kt6CNX3ZrPNM3v0JZ3TwSdEGyRgNGKcOiQ192wF6P8PcWT7jSqAa6JyENJy2/3FiGrEIJygwY
 sMqW4TQfAQsS80RlxwOEw+++7kmHBQylpaEmr0ozlMAOzsUDVD6PWtbkU3BRx0H0sokIaNDh0SPsJ
 LJR2HPh0Mp7DkcBE=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1szZ9d-0006qE-6b for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 12 Oct 2024 10:15:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id AA66CA4013E;
 Sat, 12 Oct 2024 10:15:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB425C4CEC6;
 Sat, 12 Oct 2024 10:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728728110;
 bh=OdH4TBBkFTCEwViZ350PE+nPM3XleI6+E0e5t7R/34g=;
 h=From:To:Cc:Subject:Date:From;
 b=Vl8I4Bq59AlmRmq43BJsY5HjQa/0hbbAFkAIW9fImqm+VtBwFj6ErqkoeFEZWNpmI
 7jlL9OaSLd2JpgYjNsRseJRc72HkE+lZqgab+/n4jWDk0o7uaH+PXtcY1L0LAHLeqq
 r47DLy7FGWaOjbP+0Be+VjpzLi8o4neH0oGxr0eD4rxgzkCs9O8wgKvdSXAKG1ZmJ3
 XYvoflqStZEniEdgFxm60aHIwxLgVbaXQbnRDQeQgu21k19PlLFQJlDQ7DC6oTyWoC
 bIqgwH5sZkg893nZJCx3s0drHxCrvcERGWbpsKN+BkO+74BwtSz2oJyEJUXET/UNqg
 +FUduMyuN/Y5g==
To: Zorro Lang <zlang@redhat.com>
Date: Sat, 12 Oct 2024 18:15:01 +0800
Message-Id: <20241012101501.377899-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch introduce a regression test to check whether f2fs
 handles dirty inode correctly when checkpoint is disabled in a corner case,
 it may hang umount before the bug is fixed. Cc: Qi Han <hanqi@vivo.com>
 Signed-off-by: Chao Yu <chao@kernel.org> --- tests/f2fs/005 | 59
 ++++++++++++++++++++++++++++++++++++++++++++++
 tests/f2fs/005.out | 1 + 2 files changed, 60 insertions(+) c [...] 
 Content analysis details:   (-0.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1szZ9d-0006qE-6b
Subject: [f2fs-dev] [PATCH] f2fs/005: add testcase to check checkpoint
 disabling functionality
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
Cc: Qi Han <hanqi@vivo.com>, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch introduce a regression test to check whether f2fs handles
dirty inode correctly when checkpoint is disabled in a corner case,
it may hang umount before the bug is fixed.

Cc: Qi Han <hanqi@vivo.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 tests/f2fs/005     | 59 ++++++++++++++++++++++++++++++++++++++++++++++
 tests/f2fs/005.out |  1 +
 2 files changed, 60 insertions(+)
 create mode 100755 tests/f2fs/005
 create mode 100644 tests/f2fs/005.out

diff --git a/tests/f2fs/005 b/tests/f2fs/005
new file mode 100755
index 00000000..4faf1bb9
--- /dev/null
+++ b/tests/f2fs/005
@@ -0,0 +1,59 @@
+#! /bin/bash
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (c) 2024 Oppo.  All Rights Reserved.
+#
+# FS QA Test No. f2fs/005
+#
+# This is a regression test to check whether f2fs handles dirty
+# inode correctly when checkpoint is disabled, it may hang umount
+# before the bug is fixed.
+#
+. ./common/preamble
+_begin_fstest auto quick
+
+_cleanup()
+{
+	rm -f $img
+	rmdir $mnt
+	_scratch_unmount >> $seqres.full
+	cd /
+	rm -r -f $tmp.*
+}
+
+_require_scratch
+_scratch_mkfs >> $seqres.full
+_scratch_mount >> $seqres.full
+
+img=$SCRATCH_MNT/f2fs.img
+mnt=$SCRATCH_MNT/f2fs.mnt
+testfile=$mnt/testfile
+tmpfile=$mnt/tmpfile
+tmpdir=$mnt/tmpdir
+
+mkdir $mnt
+dd if=/dev/zero of=$img bs=1M count=50 2>/dev/null
+$MKFS_F2FS_PROG -f $img >/dev/null 2>&1
+sync
+
+# use mode=lfs to let f2fs always triggers OPU
+mount -t $FSTYP -o loop,mode=lfs,checkpoint=disable:10%,noinline_dentry $img $mnt
+
+dd if=/dev/zero of=$testfile bs=1M count=5 2>/dev/null
+mkdir $tmpdir
+touch $tmpfile
+sync
+
+# it dirties tmpdir inode by updating ctime,
+# but it doesn't moving the inode to gdirty_list.
+mv $tmpfile $tmpdir
+
+# it runs out of free segment
+dd if=/dev/zero of=$testfile bs=1M count=5 conv=notrunc conv=fsync 2>/dev/null
+
+mount -o remount,checkpoint=enable $mnt
+
+# it may hang umount if tmpdir is still dirty during evict()
+umount $mnt
+
+status=0
+exit
diff --git a/tests/f2fs/005.out b/tests/f2fs/005.out
new file mode 100644
index 00000000..caa3c880
--- /dev/null
+++ b/tests/f2fs/005.out
@@ -0,0 +1 @@
+QA output created by 005
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
