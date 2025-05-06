Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE62AAB9B9
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 May 2025 09:02:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sqbD4+qylgb/kYabxYwtxRZFmElKxb4rV0ubqyxFouo=; b=H+l3PlbMS+2Nigjm+DxyAR+UGh
	jxIaEEUaotbyfG+CI7w6gGu78IF9UPJyPbjXIau9i6cepKLPoKU5ytmom5wnAGx1Ib5NTJnygN/XD
	OmAQE7JYTxRs+wA6LYWPDI9BAV18B8ardMszi5k1o32omXxLGXJNqINA7NYn+PXKQRto=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uCCK8-0005bg-NS;
	Tue, 06 May 2025 07:02:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uCCK7-0005ba-MT
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 May 2025 07:02:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jf/n7mpLELm1Cb+5SQhQL3YbFVSnUAw/uxKHiwzo1m8=; b=c2RwJyU0poiPF7akHPRgIOGMiF
 XttV/g80f/Cyu3RBH4U9YJvAQ9jXxPpbniQ0YFi6Gwa1ddUxudPjDN9qtjHbg49W6xpUuLPJvN+es
 1dYGxzjA5zmJcX/a8sk9FAyPNt8RkJHrowPDQyQkly8SZc9xZrK+8vtThK3HhfySlXbY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=jf/n7mpLELm1Cb+5SQhQL3YbFVSnUAw/uxKHiwzo1m8=; b=F
 d7+Tn15mwl4Cc4Pk5PuNGT6xGRAweYErhyACZ7/ARiEaRMlz2XcFmngq56wWDFG6dDX7N0cwOQ7RF
 V69mUbEcrPvee0gQ/xS7qVVjDH5RJy43QFA+cBIlSs7RMDu6h8SoV/+4RjQ7gU/TRQ3AVUTDBN8P6
 +KcE4BNvFSSbU02w=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uCCJp-0002tB-D9 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 May 2025 07:02:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9E8F35C553D;
 Tue,  6 May 2025 06:59:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E2B6C4CEE4;
 Tue,  6 May 2025 07:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746514935;
 bh=qLFnbXR/iFLSg5koyjksWLF9V77rH3lQL7HHAgYNTqg=;
 h=From:To:Cc:Subject:Date:From;
 b=T2I8bjbgS2SimKD1pEzTHw9Fwxzd3I72ickAPGmVubUAzTPatFn4Rud5y4nS2R7hM
 u8OHfbbgdFAdIiPf8OvNNJQuti1bRiW7DFGNx5euj/YRwIWg+6cnULe6kHeAQofiBx
 hJJqmLMkGpl2byAjSqoYo9oBEdNqAlHuZdjq59wauKu1Ipxtkl8pUD/Iqz8NYBNZml
 xLeiaFtSwshjvg1cyQmHdAMIudVoRUGSR1aJAi1f1WGilPX7KmjywgOrbCWcdWGTZC
 C2XjCaxMsAeDkfHXT7M2Pq6P+v6xqMXclOm4tkiUAaPRhf9ayDK/LJc5wMAFnxEKNi
 9KpJVFYUe57rQ==
To: Zorro Lang <zlang@kernel.org>,
	fstests@vger.kernel.org
Date: Tue,  6 May 2025 15:02:10 +0800
Message-ID: <20250506070210.539539-1-chao@kernel.org>
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
MIME-Version: 1.0
X-Spam-Score: -6.6 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This is a regression testcase to check whether we will handle
 database inode dirty status correctly: 1. mount f2fs image w/ timeout fault
 injection option 2. create a regular file, and write data into [...] 
 Content analysis details:   (-6.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uCCJp-0002tB-D9
Subject: [f2fs-dev] [PATCH v2] f2fs/013: test to check potential corruption
 on atomic_write file
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
Cc: jaegeuk@kernel.org, Daeho Jeong <daehojeong@google.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This is a regression testcase to check whether we will handle database
inode dirty status correctly:
1. mount f2fs image w/ timeout fault injection option
2. create a regular file, and write data into the file
3. start transaction on the file (via F2FS_IOC_START_ATOMIC_WRITE)
4. write transaction data to the file
5. commit and end the transaction (via F2FS_IOC_COMMIT_ATOMIC_WRITE)
6. meanwhile loop call fsync in parallel
Before f098aeba04c9 ("f2fs: fix to avoid atomicity corruption of atomic
file"), database file may become corrupted after atomic write while
there is concurrent dirty inode flush in background.

Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Daeho Jeong <daehojeong@google.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
v2:
- fix description of test steps
- add missing "_require_kernel_config CONFIG_F2FS_FAULT_INJECTION"
- add missing "_require_command "$F2FS_IO_PROG" f2fs_io"
- put correct filesize in the golden output
 tests/f2fs/013     | 71 ++++++++++++++++++++++++++++++++++++++++++++++
 tests/f2fs/013.out |  2 ++
 2 files changed, 73 insertions(+)
 create mode 100755 tests/f2fs/013
 create mode 100644 tests/f2fs/013.out

diff --git a/tests/f2fs/013 b/tests/f2fs/013
new file mode 100755
index 00000000..4cf56840
--- /dev/null
+++ b/tests/f2fs/013
@@ -0,0 +1,71 @@
+#! /bin/bash
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (c) 2025 Chao Yu.  All Rights Reserved.
+#
+# FS QA Test No. f2fs/013
+#
+# This is a regression testcase to check whether we will handle database
+# inode dirty status correctly:
+# 1. mount f2fs image w/ timeout fault injection option
+# 2. create a regular file, and write data into the file
+# 3. start transaction on the file (via F2FS_IOC_START_ATOMIC_WRITE)
+# 4. write transaction data to the file
+# 5. commit and end the transaction (via F2FS_IOC_COMMIT_ATOMIC_WRITE)
+# 6. meanwhile loop call fsync in parallel
+# Before f098aeba04c9 ("f2fs: fix to avoid atomicity corruption of atomic
+# file"), database file may become corrupted after atomic write while
+# there is concurrent dirty inode flush in background.
+#
+. ./common/preamble
+_begin_fstest auto quick
+_require_kernel_config CONFIG_F2FS_FAULT_INJECTION
+_require_command "$F2FS_IO_PROG" f2fs_io
+
+_cleanup()
+{
+	[ -n "$atomic_write_pid" ] && kill -9 $atomic_write_pid
+	wait
+	cd /
+	rm -r -f $tmp.*
+}
+
+_fixed_by_kernel_commit f098aeba04c9 \
+	"f2fs: fix to avoid atomicity corruption of atomic file"
+
+_require_scratch
+
+_scratch_mkfs >> $seqres.full
+# note that it relis on FAULT_TIMEOUT fault injection support in f2fs
+_scratch_mount "-o fault_injection=1,fault_type=4194304" >> $seqres.full
+
+dbfile=$SCRATCH_MNT/file.db
+
+# initialize database file
+$XFS_IO_PROG -c "pwrite 0 4k" -c "fsync" -f $dbfile >> $seqres.full
+
+# sync filesystem to clear dirty inode
+sync
+
+# start atomic_write on src.db database file and commit transaction
+$F2FS_IO_PROG write 1 0 2 zero atomic_commit $dbfile >> $seqres.full &
+atomic_write_pid=$!
+
+# call fsync to flush dirty inode of database file in parallel
+for ((j=0;j<1000;j++)) do
+	$F2FS_IO_PROG fsync $dbfile >> $seqres.full
+done
+
+wait $atomic_write_pid
+unset atomic_write_pid
+
+# flush dirty data and drop cache
+sync
+echo 3 > /proc/sys/vm/drop_caches
+
+stat $dbfile -c %s
+
+rm $dbfile
+sync
+
+status=0
+exit
diff --git a/tests/f2fs/013.out b/tests/f2fs/013.out
new file mode 100644
index 00000000..d9271f75
--- /dev/null
+++ b/tests/f2fs/013.out
@@ -0,0 +1,2 @@
+QA output created by 013
+8192
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
