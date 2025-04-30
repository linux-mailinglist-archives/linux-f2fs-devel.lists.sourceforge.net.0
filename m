Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D2206AA4128
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 30 Apr 2025 04:48:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WNrQsTVm0a91hyu9BVGYIgdNd5KsCDcrLf6N/zKYCsw=; b=POBWIHBGbZHOMY1kRIDmQc7u1y
	sTupX8zdsTu61aN8zal09Ps3jChht7phkK/1FoavcMhlVBSuSYTClQ7z9cKJyUYAtFfrfeJrjTqVl
	Tj6x656eLdV3B+LDA08ihHnWqEUkcgDr4l9XEVEpbPoycCx9B0weRubGIVeGZ3rCNsLw=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u9xUm-0007pB-Oe;
	Wed, 30 Apr 2025 02:48:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1u9xUU-0007or-9i
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 30 Apr 2025 02:48:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fmFV5Ehc/bzK7gewmE9hzT2x2f7B9AmgkkivCTxDsjU=; b=LUUsmO3YMSqiEHlm5Ul0KZno86
 CPCLXlM9E+m3MsCGSNQAhat8xxEpYT9Ih9JuiroRQExnIR1VKmYFIOZvgt++CEAHiORR/A82QyfQN
 tUVw47/rk3Ffo4MPSufbo0gI1bviGxQqKpvhC5brvcgmdANoYr6UzP0ejtkLW3lzdnEE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=fmFV5Ehc/bzK7gewmE9hzT2x2f7B9AmgkkivCTxDsjU=; b=T
 LocpPpZa5UxIwGhf+LaUpGRVXIp5f+hR8i1PwBHR528/4fyzxp9WVlLAL9w8kILJyAvZeLtYnPmMe
 Bx/V2mgzVQPIItTJ0ufgqcwUX1rugkj2Tn4ORwPyzGVpgz+B0U3ns/t+ABLZOvUT3/1DnxaWnu2o/
 bMNBNK+kpU6x4VmM=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u9xUE-0006eV-Du for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 30 Apr 2025 02:48:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0E64368469;
 Wed, 30 Apr 2025 02:47:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A8FDC4CEE3;
 Wed, 30 Apr 2025 02:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745981264;
 bh=gB8TAfuLxAG4wGF7EWMpCAyhqDp8zUiaMWtFctDP+0c=;
 h=From:To:Cc:Subject:Date:From;
 b=XLYm9qei+IO6/5Algq5QOx+NGqO07aIh8bF+DNlegqWxufhX2Vou3lQ+lzDi3tbzQ
 q6cYjaZnodBXNBs5TpMu2MoE4aiQVNfKFrIOepgKAM8IoYEUyP/GEA98cdIqtR477t
 yrcBFkV4bArcNwqTUiQt2O41xbV3e6QGLR7Ubl7pQjMtb1NoO2tKNR/7ndTVfR0tcU
 qFa9gz1flnF/PJVN62EnQ85h+pi5yHqLEopcA/G1XI6YY85njnOfebLbqN6jQpU0kw
 HvFFLEVMT1K0eHdCJN0Rft0VSsXwZbtBp6xUXP4prZ+Q6wYAhwaKZ66GP6RGP00Pwm
 CvD0n7mIjAEJw==
To: Zorro Lang <zlang@kernel.org>,
	fstests@vger.kernel.org
Date: Wed, 30 Apr 2025 10:47:31 +0800
Message-ID: <20250430024731.2722027-1-chao@kernel.org>
X-Mailer: git-send-email 2.49.0.901.g37484f566f-goog
MIME-Version: 1.0
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This is a regression testcase to check whether we will handle
 database inode dirty status correctly: 1. make sure disk quota is enabled
 2. create a regular file, and write data into the file 3. start [...] 
 Content analysis details:   (-0.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u9xUE-0006eV-Du
Subject: [f2fs-dev] [PATCH] f2fs/013: test to check potential corruption on
 atomic_write file
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
1. make sure disk quota is enabled
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
 tests/f2fs/013     | 73 ++++++++++++++++++++++++++++++++++++++++++++++
 tests/f2fs/013.out |  2 ++
 2 files changed, 75 insertions(+)
 create mode 100755 tests/f2fs/013
 create mode 100644 tests/f2fs/013.out

diff --git a/tests/f2fs/013 b/tests/f2fs/013
new file mode 100755
index 00000000..3db8448c
--- /dev/null
+++ b/tests/f2fs/013
@@ -0,0 +1,73 @@
+#! /bin/bash
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (c) 2025 Chao Yu.  All Rights Reserved.
+#
+# FS QA Test No. f2fs/013
+#
+# This is a regression testcase to check whether we will handle database
+# inode dirty status correctly:
+# 1. make sure disk quota is enabled
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
+newsize=`stat $dbfile -c %s`
+if [ "$newsize" != "8192" ]; then
+	_fail "filesize is inconsistent:"$newsize
+fi
+rm $dbfile
+sync
+
+echo "Silence is golden"
+
+status=0
+exit
diff --git a/tests/f2fs/013.out b/tests/f2fs/013.out
new file mode 100644
index 00000000..3e66423b
--- /dev/null
+++ b/tests/f2fs/013.out
@@ -0,0 +1,2 @@
+QA output created by 013
+Silence is golden
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
