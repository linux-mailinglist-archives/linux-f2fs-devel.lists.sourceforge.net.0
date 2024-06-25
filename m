Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B52E9169C6
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Jun 2024 16:02:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sM6ky-0000ez-5b;
	Tue, 25 Jun 2024 14:02:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sM6kw-0000et-Bs
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Jun 2024 14:02:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UI6SRPMhpq83+LVj7HjgyImNSKqGo7GC194OmZd0ZRw=; b=U3xD8MQMcr+k/QZ+n/x644ZPNV
 6TvL29fOaceAPn+DH4kDVljwzPMkhHwP76eM7VsOv9BCmzg/hmyFD41nGfWT6NCPsumczeugBtl+S
 /q0cPfKd8UkonAzhvwqUVEbhUQAamV6L2Sz3Fv0Nlj/Fj3/p1eU8AwyyZVPNWCUdxsh8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=UI6SRPMhpq83+LVj7HjgyImNSKqGo7GC194OmZd0ZRw=; b=K
 uzhx5T2qfMnN33tuvNwStgv6L3HnJO3W2Hl0ulm1WEy/K0Uwop3ImOZufRRmxyS3U/spTWxb8penM
 8iXJxHnnsd4B4VGLx2JCVHz/tnZB3gmv5RTgcRulwGmUJYUMUIidl4/8uDRdn515sx/58lk2BrVLp
 jJolyduk6Kq6+Ogw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sM6kw-0004B6-SQ for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Jun 2024 14:02:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BD16461454;
 Tue, 25 Jun 2024 14:02:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F4177C32781;
 Tue, 25 Jun 2024 14:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719324160;
 bh=5UjL4GyZrjz619WsFq1WHy8mcigCmMBJuw6biomyaJU=;
 h=From:To:Cc:Subject:Date:From;
 b=RrpH7IF5FEgP1IJSfWRQ9+74A11Jaz23GSmjPswh4v3g/J1K6SXfboqD8BLAGoZob
 CWwufwqM3CylgWg2sAajvlO0GI44G+r52edV+mPu3G5rdMu8iaFv5zXiNBnk2sYwD+
 MJr5mPgVccNYjszsTtmxv8/AwySfLMUAxrINmyeLbqDX+cBhT3Ly3ZhJUMrolvx2XP
 I6E6kUhncJbMlRyONW2Dx0GNUgRf/HfPJG/iL62DIlRYLjeQCPlAnb8TRzw/nXYMYo
 vIhcZNQQ8xz5IF57XsHctiNv4d0PIo/7hZzgjn8qdQDSyZAXo/HdBK6sJiQpJIdZ1h
 B2ENuIT4NgaCQ==
From: Chao Yu <chao@kernel.org>
To: Zorro Lang <zlang@redhat.com>
Date: Tue, 25 Jun 2024 22:02:33 +0800
Message-Id: <20240625140233.3907012-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In this patch, we simulate race case in between sqlite atomic
 write and direct IO w/ below steps: 1. create a regular file, and initialize
 it w/ 0xff data 2. start transaction (via F2FS_IOC_START_ATOM [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sM6kw-0004B6-SQ
Subject: [f2fs-dev] [PATCH] f2fs: test for race condition in between
 atomic_write and dio
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Daeho Jeong <daehojeong@google.com>,
 fstests@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

In this patch, we simulate race case in between sqlite atomic write
and direct IO w/ below steps:
1. create a regular file, and initialize it w/ 0xff data
2. start transaction (via F2FS_IOC_START_ATOMIC_WRITE) on it
3. write transaction data
4. trigger direct read/write IO on it to check whether it fails or not
5. commit and end the transaction (via F2FS_IOC_COMMIT_ATOMIC_WRITE)
This is a regression test to check handling of race condition in
between atomic_write and direct IO.

Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Daeho Jeong <daehojeong@google.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 tests/f2fs/004     | 45 +++++++++++++++++++++++++++++++++++++++++++++
 tests/f2fs/004.out |  3 +++
 2 files changed, 48 insertions(+)
 create mode 100755 tests/f2fs/004
 create mode 100644 tests/f2fs/004.out

diff --git a/tests/f2fs/004 b/tests/f2fs/004
new file mode 100755
index 00000000..26862cb5
--- /dev/null
+++ b/tests/f2fs/004
@@ -0,0 +1,45 @@
+#! /bin/bash
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (c) 2024 Oppo.  All Rights Reserved.
+#
+# FS QA Test No. f2fs/004
+#
+# Test that we will simulate race case in between sqlite atomic write
+# and direct IO w/ below steps:
+# 1. create a regular file, and initialize it w/ 0xff data
+# 2. start transaction (via F2FS_IOC_START_ATOMIC_WRITE) on it
+# 3. write transaction data
+# 4. trigger direct read/write IO to check whether it fails or not
+# 5. commit and end the transaction (via F2FS_IOC_COMMIT_ATOMIC_WRITE)
+# This is a regression test to check handling of race condition in
+# between atomic_write and direct IO.
+#
+. ./common/preamble
+_begin_fstest auto quick
+
+. ./common/filter
+
+_supported_fs f2fs
+_require_scratch
+_require_xfs_io_command "pwrite"
+
+_scratch_mkfs >> $seqres.full
+_scratch_mount >> $seqres.full
+
+dbfile=$SCRATCH_MNT/dbfile
+
+# start atomic_write on dbfile & write data to dbfile
+touch $dbfile
+$F2FS_IO_PROG write 1 0 32 zero atomic_commit $dbfile 3000 >> $seqres.full &
+
+# simulate concurrent direct read/write IO
+$XFS_IO_PROG -d -c "pread 0 128k" $dbfile
+$XFS_IO_PROG -d -c "pwrite 0 128k" $dbfile
+
+# wait for atomic_write commit completion
+sleep 5
+
+_scratch_unmount
+
+status=0
+exit
diff --git a/tests/f2fs/004.out b/tests/f2fs/004.out
new file mode 100644
index 00000000..3af79541
--- /dev/null
+++ b/tests/f2fs/004.out
@@ -0,0 +1,3 @@
+QA output created by 004
+pread: Operation not supported
+pwrite: Operation not supported
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
