Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8BA99DC6E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 15 Oct 2024 04:51:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t0Xer-0001LT-4j;
	Tue, 15 Oct 2024 02:51:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1t0Xeq-0001LN-KA
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Oct 2024 02:51:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=F9vvfiRhFIKosxiwU/M/GsNupjwEdFIKnkbfgTGBwC4=; b=Guo4R3Goce6Aq8UQxfjSfDqksu
 uuPANbRvtYmg3tYQxU/BMEwRHVkfO1AXumiGg94ZG1g9DPfgK8ViQyeMJhRLsC36z2OUoSQE4dYTe
 MebvkL+6mWdkHU/3nMzVF7rSY/j+EnfRGg0wfObMKEKWQjte+Zw5y4L8ZbaqHZ+VitrQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=F9vvfiRhFIKosxiwU/M/GsNupjwEdFIKnkbfgTGBwC4=; b=h
 ioZWU/j7BtpKhYaaKwpv/lIVdZ1G4HSEfjPSQ2zTsUQxFWoOedvEm+w/cOtc0WKdbpDV1mngS0DYY
 MIfSxOIpY6qaEvbLdnjdHhwGag1N51A4nJneqqHz42Wk2tKIjmXh+MgLxL8FSHgmieJIT8ZzYuSMf
 ZFsPEgfQaKkgcP3Y=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t0Xep-0005Xe-Ss for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Oct 2024 02:51:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 49A9DA401B5;
 Tue, 15 Oct 2024 02:51:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7875AC4CEC3;
 Tue, 15 Oct 2024 02:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728960689;
 bh=Tk/AWN8N3hXZ7c5itZX1115sbx+Ry+VXv7ESB2Mj4wc=;
 h=From:To:Cc:Subject:Date:From;
 b=NuIsZsQiZCXwAyDb3AbPU44TCnAKmuX3wW86P4efeHQpjgjV9o6LAKfzNuUjE4F7z
 /EO9uSYMD2ux0xpQmNv1QmMiMsFJlX9pvtoVRiVXriler7UlH8WYUnW5IPycUnTb+q
 sgjehBdMNK4qoejxuNi/UvNTraagbbzsPxqviKtp4L+hELS08nEa4HNSEKlYIDnLtp
 BMrgUgMftgUccpBlWkA8ejjzLxDQJ2UMo1L0uDI5D3ynEsFXpk9408bR/axSPY45R7
 n9kZAd/Ff6FbUPlweBBgytjejQRN/rrSk5W+NYgEksLVbcLxgxRZjJUYGvfxmTpmRY
 tN7HOOqxUqvnQ==
To: Zorro Lang <zlang@redhat.com>
Date: Tue, 15 Oct 2024 10:51:05 +0800
Message-Id: <20241015025106.3203676-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This is a regression test to check whether f2fs handles dirty
 data correctly when checkpoint is disabled, if lfs mode is on, it will trigger
 OPU for all overwritten data, this will cost free segments, [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t0Xep-0005Xe-Ss
Subject: [f2fs-dev] [PATCH 1/2] f2fs/006: add testcase to check out-of-space
 case
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This is a regression test to check whether f2fs handles dirty
data correctly when checkpoint is disabled, if lfs mode is on,
it will trigger OPU for all overwritten data, this will cost
free segments, so f2fs must account overwritten data as OPU
data when calculating free space, otherwise, it may run out
of free segments in f2fs' allocation function, resulting in
panic.

Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 tests/f2fs/006     | 52 ++++++++++++++++++++++++++++++++++++++++++++++
 tests/f2fs/006.out |  6 ++++++
 2 files changed, 58 insertions(+)
 create mode 100755 tests/f2fs/006
 create mode 100644 tests/f2fs/006.out

diff --git a/tests/f2fs/006 b/tests/f2fs/006
new file mode 100755
index 00000000..b359ef8f
--- /dev/null
+++ b/tests/f2fs/006
@@ -0,0 +1,52 @@
+#! /bin/bash
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (c) 2024 Oppo.  All Rights Reserved.
+#
+# FS QA Test No. f2fs/006
+#
+# This is a regression test to check whether f2fs handles dirty
+# data correctly when checkpoint is disabled, if lfs mode is on,
+# it will trigger OPU for all overwritten data, this will cost
+# free segments, so f2fs must account overwritten data as OPU
+# data when calculating free space, otherwise, it may run out
+# of free segments in f2fs' allocation function, resulting in
+# panic.
+#
+. ./common/preamble
+_begin_fstest auto quick
+
+_cleanup()
+{
+	rm -f $img
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
+
+mkdir $mnt
+dd if=/dev/zero of=$img bs=1M count=100 2>/dev/null
+$MKFS_F2FS_PROG -f $img >/dev/null 2>&1
+sync
+
+# use mode=lfs to let f2fs always triggers OPU
+mount -t $FSTYP -o loop,mode=lfs,checkpoint=disable:10%,noinline_dentry $img $mnt
+
+dd if=/dev/zero of=$testfile bs=1M count=50 2>/dev/null
+
+# it may run out of free space of f2fs and hang kernel
+dd if=/dev/zero of=$testfile bs=1M count=50 conv=notrunc conv=fsync
+dd if=/dev/zero of=$testfile bs=1M count=50 conv=notrunc conv=fsync
+
+mount -o remount,checkpoint=enable $mnt
+umount $mnt
+
+status=0
+exit
diff --git a/tests/f2fs/006.out b/tests/f2fs/006.out
new file mode 100644
index 00000000..a2c7ba48
--- /dev/null
+++ b/tests/f2fs/006.out
@@ -0,0 +1,6 @@
+QA output created by 006
+50+0 records in
+50+0 records out
+dd: error writing '/mnt/scratch_f2fs/f2fs.mnt/testfile': No space left on device
+3+0 records in
+2+0 records out
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
