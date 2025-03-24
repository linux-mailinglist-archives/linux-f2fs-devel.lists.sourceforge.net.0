Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F1876A6DA35
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Mar 2025 13:39:13 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1twh57-0006e7-AR;
	Mon, 24 Mar 2025 12:39:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1twh56-0006dv-08
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Mar 2025 12:39:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=z1fOjO3F8FEA2gET/CuC6GZNwGEJZSGMzsIJwBHu4R8=; b=DNK87Pwgd4Ju/01J7sVpG4an53
 3FiVMDAoK7vi4/4Yl5H3ygCbz2zh0vjF2wl6QQbdymA/8KVVVrTcMR9ImJzFBAxZYsMN8c4Pa0/3Y
 zMmZRXibpd7bXmkHjtmxTCEGHzdFbRBplQFM5wMS/Ks78Awqxl2GCEBXuVBE1p31L/uU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=z1fOjO3F8FEA2gET/CuC6GZNwGEJZSGMzsIJwBHu4R8=; b=c
 6HmHjXipqY0HsvC1odQcdOBtnd2dsDRrIh07VXjd8ePoIxw2VXV/19fT2QsAWmZi/mUYESOgyewzw
 61o0vqB/Th/sRpcIvqNl3MzPtmVenRCPub/go4GpDxSjQIj9X0SI1UcyYMe/luhUbbyysLyevWiAD
 jvTI4S/BNvYzoXY8=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1twh4v-0001aN-V9 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Mar 2025 12:39:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3CFDEA493F5;
 Mon, 24 Mar 2025 12:33:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86C76C4CEDD;
 Mon, 24 Mar 2025 12:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742819928;
 bh=PIKk/rQU2Xe6f/2Nwfdobvb7T1ZWBBTYT7hjOleiHjk=;
 h=From:To:Cc:Subject:Date:From;
 b=YM+6io1y4nGde/qJd+8lje7cxVVn7n3oG3GdKjjsXEBbXJRzG9G59bLkxQt6UMNmG
 Go/pyCEcSaVrC6q2Y29o4bQ8D39JwmLFlFBf+zyOjCst18CNPh3W0oJl9yOHSMT+o1
 nW+ihfGoWh52hNca1u0S8qcenPQ2UXcqP+4+YC+QQlDGolcnsRq7R3Z4byE0BQaWsh
 czvbMZXSIqYXL03lNpBOqXLBaox8AKmO4OGlisZpyeAOiIZz2nagLfIGyDTIvPS8Ml
 RCl7fhK60b9AP2XTdDNAu2+dJUZcVv+TQv7LkjOslCQm6pT863MBO31X8IzCuL7Ygr
 viCUVQQW+58IQ==
To: Zorro Lang <zlang@kernel.org>,
	fstests@vger.kernel.org
Date: Mon, 24 Mar 2025 20:38:36 +0800
Message-ID: <20250324123836.3098377-1-chao@kernel.org>
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This is a regression testcase to check whether we will handle
 database inode dirty status correctly: 1. create a regular file, and write
 data into the file 2. start transaction on the file (via F2FS_I [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1twh4v-0001aN-V9
Subject: [f2fs-dev] [PATCH] f2fs/010: test dirty status handling on database
 file
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
1. create a regular file, and write data into the file
2. start transaction on the file (via F2FS_IOC_START_ATOMIC_WRITE)
3. write transaction data to the file
4. rename the file
5. commit and end the transaction (via F2FS_IOC_COMMIT_ATOMIC_WRITE)
6. drop caches in order to call f2fs_evict_inode()
It expects kernel panic will gone after we apply commit 03511e936916
("f2fs: fix inconsistent dirty state of atomic file").

Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Daeho Jeong <daehojeong@google.com>
Cc: Jianan Huang <huangjianan@xiaomi.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 tests/f2fs/010     | 68 ++++++++++++++++++++++++++++++++++++++++++++++
 tests/f2fs/010.out |  2 ++
 2 files changed, 70 insertions(+)
 create mode 100755 tests/f2fs/010
 create mode 100644 tests/f2fs/010.out

diff --git a/tests/f2fs/010 b/tests/f2fs/010
new file mode 100755
index 00000000..360c09b9
--- /dev/null
+++ b/tests/f2fs/010
@@ -0,0 +1,68 @@
+#! /bin/bash
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (c) 2025 Chao Yu.  All Rights Reserved.
+#
+# FS QA Test No. f2fs/010
+#
+# This is a regression testcase to check whether we will handle database
+# inode dirty status correctly:
+# 1. create a regular file, and write data into the file
+# 2. start transaction on the file (via F2FS_IOC_START_ATOMIC_WRITE)
+# 3. write transaction data to the file
+# 4. rename the file
+# 5. commit and end the transaction (via F2FS_IOC_COMMIT_ATOMIC_WRITE)
+# 6. drop caches in order to call f2fs_evict_inode()
+# It expects kernel panic will gone after we apply commit 03511e936916
+# ("f2fs: fix inconsistent dirty state of atomic file").
+#
+. ./common/preamble
+_begin_fstest auto quick
+
+_cleanup()
+{
+	kill -9 $atomic_write_pid > /dev/null 2>&1
+	wait
+	cd /
+	rm -r -f $tmp.*
+}
+
+_fixed_by_kernel_commit 03511e936916 \
+	"f2fs: fix inconsistent dirty state of atomic file"
+
+_require_scratch
+_require_command "$F2FS_IO_PROG" f2fs_io
+
+_scratch_mkfs >> $seqres.full
+_scratch_mount >> $seqres.full
+
+src_db=$SCRATCH_MNT/src.db
+dst_db=$SCRATCH_MNT/dst.db
+
+# initialize database file
+$XFS_IO_PROG -c "pwrite 0 4k" -c "fsync" -f $src_db >> $seqres.full
+
+# sync filesystem to clear dirty inode
+sync
+
+# start atomic_write on src.db database file and commit transaction after 3000ms
+$F2FS_IO_PROG write 1 0 0 zero atomic_commit $src_db 3000 >> $seqres.full &
+atomic_write_pid=$!
+
+# wait a moment to let atomic write starts
+sleep 1
+
+# it will dirty inode when updating i_pino
+mv $src_db $dst_db
+
+# wait for atomic_write commit completion
+sleep 4
+
+# drop caches in order to call f2fs_evict_inode()
+echo 3 > /proc/sys/vm/drop_caches
+
+wait $atomic_write_pid
+
+echo "Silence is golden"
+
+status=0
+exit
diff --git a/tests/f2fs/010.out b/tests/f2fs/010.out
new file mode 100644
index 00000000..1d83a8d6
--- /dev/null
+++ b/tests/f2fs/010.out
@@ -0,0 +1,2 @@
+QA output created by 010
+Silence is golden
-- 
2.48.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
