Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BD189937FC4
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 20 Jul 2024 09:46:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sV4nA-0008AK-A5;
	Sat, 20 Jul 2024 07:46:08 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sV4n9-0008AE-Gm
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 20 Jul 2024 07:46:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5nG8c0WOZMALIqxOeOHWFyQXcKtTO6EMH0VbnkzETYo=; b=Rsj6HYDYhuXqPIwxVDu89yeixh
 5Oj4uwwnjqP3xx3naVa+sI30HL2GJt/LgyqJVNNCp/gR0ssTb5awT0Gwe00BcF/S5S9L4V+k9PtZA
 wgCJxngFmjc7Nwm1hohGbEglfQkrjnlfU09qc/1kw9CQtJTRU+vcimAaX2E/y8qLkwSs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=5nG8c0WOZMALIqxOeOHWFyQXcKtTO6EMH0VbnkzETYo=; b=d
 bAk5RD43jQubu2l0j34uY3Z4d8ysOWh4jR7ADolRGrbXFGG+mP2gtWzVnKYuzjttQA2uUm6reQiy/
 mz5TI9ygHAADpPv1Pgu5XqTdkMlKe1J/BVLqwf6EpIQzIWdWQpvFhOl4/wakoD2O2lQRK5dMwawBZ
 PNGWUs6uowUIa31E=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sV4n4-0007sg-3E for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 20 Jul 2024 07:46:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 1C64FCE1C9A;
 Sat, 20 Jul 2024 07:45:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D466BC2BD10;
 Sat, 20 Jul 2024 07:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721461550;
 bh=dCyD68OyC/gKP1RXCzAdoiPNMWoVuTKpjEPYoboihqk=;
 h=From:To:Cc:Subject:Date:From;
 b=R75o2qibEPvmIH7ju9BCmTzUqerYB8T5URb4lNIfCVfGepQ+fKVOQNwTBTD6XNRTe
 7VrPXWssg+/tK6+4zmeYOM5o+wjORKr1cX284PJdC/rFXdciSKoD8IFls7qszVIEHA
 fGoMu7OjCXqv0FsPn5bJE6/JeVLKklySr2ZR07Y5RgEfh7FxzoxrDkxmosnJhlafT4
 Ck7TVIycsi2ISID2MJf38U0cth04yRHV+Ip4xayGlzsBGZUjEnhLSF+TqsYBu4Pls1
 762HEbr+3lnRPlFS7vhbw7QSkJDp6dgdKxRnbuIoyHJ7fpiPGH801M04/bUf8VRqfV
 eAvYlTzf0XK7A==
From: Chao Yu <chao@kernel.org>
To: Zorro Lang <zlang@redhat.com>
Date: Sat, 20 Jul 2024 15:45:40 +0800
Message-Id: <20240720074540.3303154-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Test that we will simulate sqlite atomic write logic w/ below
 steps: 1. create a regular file, and initialize it w/ 0xff data 2. start
 transaction (via F2FS_IOC_START_ATOMIC_WRITE) on it 3. write tran [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in sa-trusted.bondedsender.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [145.40.73.55 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sV4n4-0007sg-3E
Subject: [f2fs-dev] [PATCH v2] f2fs: test for race condition in between
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

Test that we will simulate sqlite atomic write logic w/ below steps:
1. create a regular file, and initialize it w/ 0xff data
2. start transaction (via F2FS_IOC_START_ATOMIC_WRITE) on it
3. write transaction data
4. trigger direct read/write IO to check whether it fails or not
5. commit and end the transaction (via F2FS_IOC_COMMIT_ATOMIC_WRITE)
This is a regression test to check handling of race condition in
between atomic_write and direct IO.

Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Daeho Jeong <daehojeong@google.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
v2:
- add kill&wait in _clean() to avoid umount failure
- some cleanups
- use exported helpler
 tests/f2fs/004     | 48 ++++++++++++++++++++++++++++++++++++++++++++++
 tests/f2fs/004.out |  3 +++
 2 files changed, 51 insertions(+)
 create mode 100755 tests/f2fs/004
 create mode 100644 tests/f2fs/004.out

diff --git a/tests/f2fs/004 b/tests/f2fs/004
new file mode 100755
index 00000000..d71e99ea
--- /dev/null
+++ b/tests/f2fs/004
@@ -0,0 +1,48 @@
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
+_cleanup()
+{
+	kill -9 $atomic_write_pid > /dev/null 2>&1
+	wait > /dev/null 2>&1
+}
+
+_require_scratch
+_require_odirect
+_scratch_mkfs >> $seqres.full
+_scratch_mount >> $seqres.full
+
+dbfile=$SCRATCH_MNT/dbfile
+
+# start atomic_write on dbfile & write data to dbfile
+touch $dbfile
+$F2FS_IO_PROG write 1 0 32 zero atomic_commit $dbfile 3000 >> $seqres.full &
+atomic_write_pid=$!
+
+# simulate concurrent direct read/write IO
+$XFS_IO_PROG -d -c "pread 0 128k" $dbfile
+$XFS_IO_PROG -d -c "pwrite 0 128k" $dbfile
+
+# wait for atomic_write commit completion
+sleep 5
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
