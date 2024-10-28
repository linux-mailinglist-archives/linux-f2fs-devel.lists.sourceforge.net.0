Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 776189B3324
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Oct 2024 15:18:22 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t5QZU-0002RL-L5;
	Mon, 28 Oct 2024 14:18:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1t5QZT-0002RE-65
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Oct 2024 14:18:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/qdHaSu2Q3IWe/vCCVSe9o0+LuvCt4tScu8rZk8X6eE=; b=lf/JrBw1cs7BxQlK3h0ktIksi4
 S/43gQggjiX13A3AzfJpdmYvMmSsCBdbwaz/RAi+SuItD41GDr4Jux9ae4sJ7Vcq/ybeOes/gVbyZ
 uZHl6Nz92jrGwSo7mfSkJ8SEaqHKUAX8SzXdtKJCetx2XO8fpKK6IM0gKn9SegrfItCI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=/qdHaSu2Q3IWe/vCCVSe9o0+LuvCt4tScu8rZk8X6eE=; b=N
 q3Q3BBz+zd8XUT2ru4HCgyrjxSMh7Vpl8KV9wtfdGQva7GsxLpEePtEmsItyNpS2un9e4q4TL8sr5
 astW/O54NaF2hRsClHiqdV0OSbHeu+/VVXDnLeFU+hvqJC5ioV7CAxLqrqVumHWLuSn08abCpjCV/
 h4BDcZKaukLJqqpE=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t5QZS-00009F-DC for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Oct 2024 14:18:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7CC05A42591;
 Mon, 28 Oct 2024 14:16:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 921EAC4CEC3;
 Mon, 28 Oct 2024 14:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730125087;
 bh=jvqQdl9HZD/pH/4UAiAhbo9OsbYYJlAiRgfGwYEGkx4=;
 h=From:To:Cc:Subject:Date:From;
 b=PudvG3o2Xqd1/ze1jfS/MLnDdG1eCIMwWmKr8otq6bRjpgbayf+plQn48t0RzS4gr
 kFjAyX1WZjekmUHivtqfmaLN/gKoA2AMzNq/y4HyNxXOAAFJlxgni4REUdOu9/m/Bu
 eFkslIoO5Ysagg8PNqjT7XiKl5MHzUNic/i2Dg+fQh9QNaLurdu+YFh2H3UQwZeXZ+
 Bs/7esRkNfuGZ0LC/Jhxt26TO3siqBZiahaaKGCPIlHL1Atu5CPQJbTPfO4oiHv4SH
 HcVjzvyHNG8+WIQ2qi+YWcZL+00lDA3cmr++h1GEzZMcVN2ANXP1h1gX4bX/Fe2CDP
 O6CelV1XQbbFw==
To: Zorro Lang <zlang@redhat.com>
Date: Mon, 28 Oct 2024 22:17:59 +0800
Message-Id: <20241028141800.1788356-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This is a regression test to check whether f2fs handles dirty
 data correctly when checkpoint is disabled, if lfs mode is on, it will trigger
 OPU for all overwritten data, this will cost free segments, [...] 
 Content analysis details:   (-0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t5QZS-00009F-DC
Subject: [f2fs-dev] [PATCH v3 1/2] f2fs/006: add testcase to check
 out-of-space case
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
of free segments in f2fs' allocation function. If kernel config
CONFIG_F2FS_CHECK_FS is on, it will cause system panic, otherwise,
dd may encounter I/O error.

Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Chao Yu <chao@kernel.org>
---
v3:
- explain more about behavior on kernel w/ different config
- use _filter_scratch to filter $SCRATCH_MNT
 tests/f2fs/006     | 42 ++++++++++++++++++++++++++++++++++++++++++
 tests/f2fs/006.out |  6 ++++++
 2 files changed, 48 insertions(+)
 create mode 100755 tests/f2fs/006
 create mode 100644 tests/f2fs/006.out

diff --git a/tests/f2fs/006 b/tests/f2fs/006
new file mode 100755
index 00000000..f9560b2b
--- /dev/null
+++ b/tests/f2fs/006
@@ -0,0 +1,42 @@
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
+# of free segments in f2fs' allocation function. If kernel config
+# CONFIG_F2FS_CHECK_FS is on, it will cause system panic, otherwise,
+# dd may encounter I/O error.
+#
+. ./common/preamble
+_begin_fstest auto quick
+
+_fixed_by_kernel_commit xxxxxxxxxxxx \
+	"f2fs: fix to account dirty data in __get_secs_required()"
+
+# Import common functions.
+. ./common/filter
+
+_require_scratch
+_scratch_mkfs_sized $((1024*1024*100)) >> $seqres.full
+
+# use mode=lfs to let f2fs always triggers OPU
+_scratch_mount -o mode=lfs,checkpoint=disable:10%,noinline_dentry >> $seqres.full
+
+testfile=$SCRATCH_MNT/testfile
+
+dd if=/dev/zero of=$testfile bs=1M count=50 2>/dev/null
+
+# it may run out of free space of f2fs and hang kernel
+dd if=/dev/zero of=$testfile bs=1M count=50 conv=notrunc conv=fsync
+dd if=/dev/zero of=$testfile bs=1M count=50 conv=notrunc conv=fsync 2>&1 | _filter_scratch
+
+_scratch_remount checkpoint=enable
+
+status=0
+exit
diff --git a/tests/f2fs/006.out b/tests/f2fs/006.out
new file mode 100644
index 00000000..2dc9efda
--- /dev/null
+++ b/tests/f2fs/006.out
@@ -0,0 +1,6 @@
+QA output created by 006
+50+0 records in
+50+0 records out
+dd: error writing 'SCRATCH_MNT/testfile': No space left on device
+3+0 records in
+2+0 records out
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
