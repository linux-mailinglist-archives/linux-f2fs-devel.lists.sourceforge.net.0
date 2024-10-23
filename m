Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F929AC144
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 23 Oct 2024 10:16:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t3WXU-0005cn-4F;
	Wed, 23 Oct 2024 08:16:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1t3WXS-0005cf-VM
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 23 Oct 2024 08:16:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rCNYRvlYkvY5vRL4YRY/vbYLlk4ggqUHF9qx9xsQjrc=; b=NFqVvttS/HV5xcn++FIjfKwmmX
 twmYq+ti8mjI/hBSyiu4pyH6S9QkOc3xmpGixy087QA79PCZnn2V5v/JZET94aN6AO7kfAB3VZAPc
 xdnfAo2qJ2dqPAbkaEj7NPzJDM01GtGGnan2fqXPSLL2wVUak4gXCIDYOayYdjUhZc38=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=rCNYRvlYkvY5vRL4YRY/vbYLlk4ggqUHF9qx9xsQjrc=; b=b
 qMjB46oN6/RbgzAn/OCkkxRqw6odmw312313DnKWcnajw2PKCnT7cocqvGfE8uGNEySo87CGGriHZ
 rOe87ZLBwbVCO0i2/35JRD193tSJ+3/uFq46jUVQGljyNYRCdc09WkQvvv4UhvGit/9XcCyKC3EaT
 42zbKfMazP2hX1sE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t3WXR-0003cK-NM for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 23 Oct 2024 08:16:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B88B05C5E6F;
 Wed, 23 Oct 2024 08:16:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BC91C4CEC6;
 Wed, 23 Oct 2024 08:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729671372;
 bh=KH/gWcSQ5ANQNjmXmGKqkINjKdTgHSCalEu+VVxzM4U=;
 h=From:To:Cc:Subject:Date:From;
 b=eJBPCmufUaeUA2pqPon5iP/uBjut/5s5logH6swRmeABCtLh+2XNyR0kmB+tTMK4B
 a2hij41IONX97f5t1YyI6A2/ajXMV5sNDZ/UVxkNmiU33IRBm/F+Sd6lhXSNx0b37R
 e51lTXe9zebFAkt1W6amt8GgQje95Ndbg4Zv0NLjg8W79pwbAbhXCwojYfuaokqnCX
 i/L5QUg152mBhdsgmjHXz0GSRvHR8IX+N96Xp2tWHwRGAaOZUr0QGae/lDYEXEUr5v
 dT/+5KyOAr0isPrsbfXtirFa1Z0gopD8u5iBTSthmCF8cY6SudLjL/O40m/wnYHTFj
 N20hTvUV2Wrqg==
To: Zorro Lang <zlang@redhat.com>
Date: Wed, 23 Oct 2024 16:16:01 +0800
Message-Id: <20241023081602.3806579-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -5.5 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This is a regression test to check whether f2fs handles dirty
 data correctly when checkpoint is disabled, if lfs mode is on, it will trigger
 OPU for all overwritten data, this will cost free segments, [...] 
 Content analysis details:   (-5.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t3WXR-0003cK-NM
Subject: [f2fs-dev] [PATCH v2 1/2] f2fs/006: add testcase to check
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
of free segments in f2fs' allocation function, resulting in
panic.

Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Chao Yu <chao@kernel.org>
---
v2:
- add _fixed_by_kernel_commit()
- use _scratch_mkfs_sized() rather than formating size-specified
loop device
- code cleanup
 tests/f2fs/006     | 38 ++++++++++++++++++++++++++++++++++++++
 tests/f2fs/006.out |  6 ++++++
 2 files changed, 44 insertions(+)
 create mode 100755 tests/f2fs/006
 create mode 100644 tests/f2fs/006.out

diff --git a/tests/f2fs/006 b/tests/f2fs/006
new file mode 100755
index 00000000..63d00018
--- /dev/null
+++ b/tests/f2fs/006
@@ -0,0 +1,38 @@
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
+_fixed_by_kernel_commit xxxxxxxxxxxx \
+	"f2fs: fix to account dirty data in __get_secs_required()"
+
+testfile=$SCRATCH_MNT/testfile
+
+_require_scratch
+_scratch_mkfs_sized $((1024*1024*100)) >> $seqres.full
+
+# use mode=lfs to let f2fs always triggers OPU
+_scratch_mount -o mode=lfs,checkpoint=disable:10%,noinline_dentry >> $seqres.full
+
+dd if=/dev/zero of=$testfile bs=1M count=50 2>/dev/null
+
+# it may run out of free space of f2fs and hang kernel
+dd if=/dev/zero of=$testfile bs=1M count=50 conv=notrunc conv=fsync
+dd if=/dev/zero of=$testfile bs=1M count=50 conv=notrunc conv=fsync
+
+_scratch_remount checkpoint=enable
+
+status=0
+exit
diff --git a/tests/f2fs/006.out b/tests/f2fs/006.out
new file mode 100644
index 00000000..0d7b3910
--- /dev/null
+++ b/tests/f2fs/006.out
@@ -0,0 +1,6 @@
+QA output created by 006
+50+0 records in
+50+0 records out
+dd: error writing '/mnt/scratch_f2fs/testfile': No space left on device
+3+0 records in
+2+0 records out
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
