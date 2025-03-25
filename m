Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF79A6EB9E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Mar 2025 09:35:01 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1twzkO-0005LW-6a;
	Tue, 25 Mar 2025 08:34:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1twzkM-0005LN-Bf
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Mar 2025 08:34:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ODyywFDy2HhP1vzb1LlS60vyckEo6n5FGeNiJp3rQ0o=; b=McHrQkX8U6JL/IOMDZ+Be1ID3B
 qW0k5Bk9GgLfl0QThbaqrjRw45In6AfwMccdepu2wZw6nSWcMYQjcECi+suDWJnF1pVIeE4MelteV
 30YSjgi0yhlaRrNYTobS0f58OJyPALUzsiYI4StXBAjr/e1Dv+wih3U4JdYSFpYXJRk4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ODyywFDy2HhP1vzb1LlS60vyckEo6n5FGeNiJp3rQ0o=; b=m
 r43IQA9b0OiEO4us6dG/EPC/Izkm8FH2/UoqZpnIu6kPRWGbOGeyXirtdMKN8B/BGzRebobkQJsie
 SCO9n5KcdNfO+IGdVy64Ur13BZ+MuYIMd9a7SBmRGc3RW4QLtrjDZ6xsE+bt3Ini4EYmwsRdWrsoC
 OuMzBZb7JWixUb1g=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1twzkA-00052t-UE for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Mar 2025 08:34:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2395B6111E;
 Tue, 25 Mar 2025 08:34:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87848C4CEE8;
 Tue, 25 Mar 2025 08:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742891676;
 bh=nRM4bXUyptdAglnpX3FP5KP7iBLUkiyRSBRlxNjz6Ck=;
 h=From:To:Cc:Subject:Date:From;
 b=IVCQqPYBdTKoKizVykV6g9EoNfQgIZw1OlMj+UoUSHEMysSVK/3CkxFqMp1Cz0HIm
 FXAP+36gSghKQFLUy1XKN/jc9lTiwmqjCdCcmklwVUnZkPG8flyq1IoO3cgMzKe+bH
 VFMlb70pe/Lln8shaKUGF7FuqZqyYGrGywRYk+2zndeqCC75SV2qsYIG/wm2rYuzAV
 pMe23W2FrscUZxpgzv20fzM0aAZoKWr21ASExCJVOFgYXgu/f1ZNBgwfAk+hC2+t+0
 XqYYTYWL0O2vOnJM9oxV6yNENu0+JkbXkHqsuUUqAFepriPFpbTV0IVZjtHKwqQemz
 YOdv4AgdDydQA==
To: Zorro Lang <zlang@kernel.org>,
	fstests@vger.kernel.org
Date: Tue, 25 Mar 2025 16:34:28 +0800
Message-ID: <20250325083428.3301950-1-chao@kernel.org>
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This is a regression testcase to check whether we will handle
 database inode dirty status correctly: 1. create a regular file, and write
 data into the file 2. start transaction on the file (via F2FS_I [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1twzkA-00052t-UE
Subject: [f2fs-dev] [PATCH v2] f2fs/010: test dirty status handling on
 database file
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
v2:
- fix to unset atomic_write_pid to avoid killing process w/ dummy pid value
 tests/f2fs/010     | 69 ++++++++++++++++++++++++++++++++++++++++++++++
 tests/f2fs/010.out |  2 ++
 2 files changed, 71 insertions(+)
 create mode 100755 tests/f2fs/010
 create mode 100644 tests/f2fs/010.out

diff --git a/tests/f2fs/010 b/tests/f2fs/010
new file mode 100755
index 00000000..50e37817
--- /dev/null
+++ b/tests/f2fs/010
@@ -0,0 +1,69 @@
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
+	[ -n "$atomic_write_pid" ] && kill -9 $atomic_write_pid
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
+unset atomic_write_pid
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
