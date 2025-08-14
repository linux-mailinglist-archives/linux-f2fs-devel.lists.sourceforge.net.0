Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AB666B26029
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 14 Aug 2025 11:07:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qO6hcVItgYXYQAtF0w/NBlL6jMxeMMRBqEGvMMmYnC8=; b=jgDNkpBbFZrzzjdYYE2LYR1f+n
	ifpDjvrYHnjszsBu6bSbFMjznZwVtHrZi9c4z8sWAivsmy54f1wkjDb0VlkHxDuRHPontEWHAkKfw
	k2xQdQmwhfzWJKwT0bL6xTrTW9H35WrcxfL7GtajAIcuegCtnPCmiLHHvVhxVLxQB5E0=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1umTvo-0002sF-0C;
	Thu, 14 Aug 2025 09:07:32 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1umTvm-0002s7-Iw
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 14 Aug 2025 09:07:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8AJJBgq+fqy3k/Q4M+n0S3Lv3pPx+cYXGePK6FA9Ass=; b=Os5mINbYJ8h3kgfjmPc24i7SA9
 H6MtMUdklYah9GMMLFK1G6H6vJZwi3NxR6RLne25eJbWStixiL3il+jzLilTu7vz6r5qjqlBGIbI7
 GNgzsjkvUe1AgUfDA4n3cs3fh/Y9VWCdFvC+gbW8DIeeVBD9vbH8lHndfrk/EhAyWdFA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8AJJBgq+fqy3k/Q4M+n0S3Lv3pPx+cYXGePK6FA9Ass=; b=PPtpX5T7t5wFlnQU0efgCMwS+K
 OpTKxHXcMd+ru2UlTMSKmv7jE7CpPHmEAzVfv3bjQeAWqNhIot/9/XRgU4of+zDktwRvprSkbGEJk
 Bk+pNezAirtEml1AnrR6uU7m0LbaLqggX5NDRtRI4+sCV4dWsEKIyonG+Su8SEHql7WY=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1umTvm-0000dq-5T for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 14 Aug 2025 09:07:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7547CA56145
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 14 Aug 2025 09:07:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B16AC4CEF6;
 Thu, 14 Aug 2025 09:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755162444;
 bh=BMt14Ouhem/YVIZtdH4icYSRSHB9L6eLuI2xQCZ3bPQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FXOKoYgIvwHM0hePoesX3MwJcQ2y0mMGYJIhJiTpbMvdv3Ppy6L1WL5xQLv3lBnf3
 vHRIwH8GLEi/2Nr+VAA2wVR2sOi6DswaUQ44vJZSTOU4XcgDWcUQ0X7yqpEwVWDGPT
 uxQMGXg1Lj1uJsVUBqjNuZIcIDnxYHJYitRd2eAashFSelIa1xZb/Yl+mW3dTQEO0O
 PuthbekUty5qLbKoUd0c98MmR9vpHEFyud65jc5PN2+QdmhivIQIpgy15oXliq1iOd
 0rLow11T5kgs9oDstzI15JlhhxwEk+4C6131M3bkIAbw2gg1ZEMYGCDNpr4c1rEyjF
 BpQk4bpDlAbaw==
To: Zorro Lang <zlang@kernel.org>,
	fstests@vger.kernel.org
Date: Thu, 14 Aug 2025 17:07:11 +0800
Message-ID: <20250814090712.2119455-2-chao@kernel.org>
X-Mailer: git-send-email 2.51.0.rc0.215.g125493bb4a-goog
In-Reply-To: <20250814090712.2119455-1-chao@kernel.org>
References: <20250814090712.2119455-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This is a regression test: 1. create a file 2. write file
 to create a direct node at special offset 3. use inject.f2fs to inject nid
 of direct node w/ ino of the inode 4. check whether f2fs kernel mod [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1umTvm-0000dq-5T
Subject: [f2fs-dev] [PATCH v2 2/3] f2fs/019: do sanity check on mapping table
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
1. create a file
2. write file to create a direct node at special offset
3. use inject.f2fs to inject nid of direct node w/ ino of the inode
4. check whether f2fs kernel module will detect and report such
   corruption in the fil

Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Chao Yu <chao@kernel.org>
---
v2:
- use _require_scratch_nocheck instead of _require_scratch
- use $XFS_IO_PROG instead of xfs_io
- add comments for why exporting MKFS_OPTIONS=""
 tests/f2fs/019     | 42 ++++++++++++++++++++++++++++++++++++++++++
 tests/f2fs/019.out |  2 ++
 2 files changed, 44 insertions(+)
 create mode 100755 tests/f2fs/019
 create mode 100644 tests/f2fs/019.out

diff --git a/tests/f2fs/019 b/tests/f2fs/019
new file mode 100755
index 00000000..2307bd96
--- /dev/null
+++ b/tests/f2fs/019
@@ -0,0 +1,42 @@
+#! /bin/bash
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (c) 2025 Chao Yu.  All Rights Reserved.
+#
+# FS QA Test No. f2fs/019
+#
+# This is a regression test:
+# 1. create a file
+# 2. write file to create a direct node at special offset
+# 3. use inject.f2fs to inject nid of direct node w/ ino of the inode
+# 4. check whether f2fs kernel module will detect and report such
+#    corruption in the file
+#
+. ./common/preamble
+_begin_fstest auto quick rw
+
+_fixed_by_kernel_commit 77de19b6867f \
+	"f2fs: fix to avoid out-of-boundary access in dnode page"
+
+_require_scratch_nocheck
+_require_command "$F2FS_INJECT_PROG" inject.f2fs
+
+# remove all mkfs options to avoid layout change of on-disk inode
+export MKFS_OPTIONS=""
+
+testfile=$SCRATCH_MNT/testfile
+
+_scratch_mkfs >> $seqres.full
+_scratch_mount
+
+$XFS_IO_PROG -f -c "pwrite 3738M 1M" -c "fsync" $testfile >> $seqres.full
+
+_scratch_unmount
+
+$F2FS_INJECT_PROG --node --mb addr --nid 5 --idx 937 --val 4 $SCRATCH_DEV >> $seqres.full
+
+_scratch_mount
+$XFS_IO_PROG -c "pread 3700M 40M" $testfile
+_scratch_unmount
+
+status=0
+exit
diff --git a/tests/f2fs/019.out b/tests/f2fs/019.out
new file mode 100644
index 00000000..2f7469e2
--- /dev/null
+++ b/tests/f2fs/019.out
@@ -0,0 +1,2 @@
+QA output created by 019
+pread: Structure needs cleaning
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
