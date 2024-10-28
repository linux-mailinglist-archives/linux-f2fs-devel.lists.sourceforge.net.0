Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3D99B331F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Oct 2024 15:17:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t5QYY-0002PD-6z;
	Mon, 28 Oct 2024 14:17:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1t5QYW-0002P6-TW
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Oct 2024 14:17:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8+oFGDTdY46VOGkB6NnVepcMrs9XAgxKZd6rW+Jix0E=; b=nBYKCbhwcErEJr/R3PzwuGzniM
 x7mCip+e0/hjZWGaYsC2Lm/IBy8Qkhf1L+6WsZyzLAs38NMMSqMDKb+dFz8kcLexFEQS7aBBUZhwD
 gGfxiy0OTbwtRsqzYL5plbyugg8pmDLlLufuk9z9QG9DIW5pskrvbo8ABToFq+JLui1Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=8+oFGDTdY46VOGkB6NnVepcMrs9XAgxKZd6rW+Jix0E=; b=H
 zXjBNjYokkZSXQlVh519rX1+hcZTrk4+S+/IwRC4pjnH+ZfgoRPKNgSbRn6MBFBwSLiTAiwNKl3+Z
 ZllR1EY7D8sJoJGCBLX/csMNo5W76dnEiKoqdn57YtjeRRSVCkVceyIemRsenAY/ijzfZUH+oL2gp
 6Ixb9cUnr0XpkrBg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t5QYW-0008UQ-7w for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Oct 2024 14:17:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D1D255C473A;
 Mon, 28 Oct 2024 14:16:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36BFAC4CEC3;
 Mon, 28 Oct 2024 14:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730125030;
 bh=13NmpUuvQKu+mf37Nk9SCTUSkhBhhJMc0Dxpa9mrkDs=;
 h=From:To:Cc:Subject:Date:From;
 b=Rcjv5EbuumUE/S8e5ufISL4s5iOVmqP8klqvecKdUIfTqUfO+nvLZ2/Luf4fl5UEL
 zazobn3iz6wUdQon5k8NelBnVYXzo/WIHsrzneQE7M/udrt7iuNaip5ZMhM+pyEuvC
 FwECn7Yhl+0tx2yoMWWb/nKHzJ9r11JR8zPO934d3mie1dMYdwE5XhsK1CXGzWBElM
 yYX5QHedl/WDLoCuGugBWU2foO8vLg3/2X5jdsFEd2fbSNij07ZAZAxCH4pWaQukB7
 ZVX3mT/OaIHQmlnQuNQLkXEHpeyF0jcThhvLuR8OxvDFdEkNuNjeMq7ydLSADYFqIw
 IcXXKAgmDVTrQ==
To: Zorro Lang <zlang@redhat.com>
Date: Mon, 28 Oct 2024 22:17:00 +0800
Message-Id: <20241028141700.1786745-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -5.6 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch introduce a regression test to check whether f2fs
 handles dirty inode correctly when checkpoint is disabled in a corner case,
 it may hang umount before the bug is fixed. Cc: Qi Han <hanqi@vivo.com>
 Signed-off-by:
 Chao Yu <chao@kernel.org> --- v2: - add _fixed_by_kernel_commit() - use
 _scratch_mkfs_sized()
 rather than formating size-specified loop device - code cleanup [...] 
 Content analysis details:   (-5.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t5QYW-0008UQ-7w
Subject: [f2fs-dev] [PATCH v2] f2fs/005: add testcase to check checkpoint
 disabling functionality
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
Cc: Qi Han <hanqi@vivo.com>, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch introduce a regression test to check whether f2fs handles
dirty inode correctly when checkpoint is disabled in a corner case,
it may hang umount before the bug is fixed.

Cc: Qi Han <hanqi@vivo.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
v2:
- add _fixed_by_kernel_commit()
- use _scratch_mkfs_sized() rather than formating size-specified
loop device
- code cleanup
 tests/f2fs/005     | 47 ++++++++++++++++++++++++++++++++++++++++++++++
 tests/f2fs/005.out |  2 ++
 2 files changed, 49 insertions(+)
 create mode 100755 tests/f2fs/005
 create mode 100644 tests/f2fs/005.out

diff --git a/tests/f2fs/005 b/tests/f2fs/005
new file mode 100755
index 00000000..a817d51a
--- /dev/null
+++ b/tests/f2fs/005
@@ -0,0 +1,47 @@
+#! /bin/bash
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (c) 2024 Oppo.  All Rights Reserved.
+#
+# FS QA Test No. f2fs/005
+#
+# This is a regression test to check whether f2fs handles dirty
+# inode correctly when checkpoint is disabled, it may hang umount
+# before the bug is fixed.
+#
+. ./common/preamble
+_begin_fstest auto quick
+
+_fixed_by_kernel_commit xxxxxxxxxxxx \
+	"f2fs: fix f2fs_bug_on when uninstalling filesystem call f2fs_evict_inode."
+
+_require_scratch
+_scratch_mkfs_sized $((1024*1024*50)) >> $seqres.full
+
+# use mode=lfs to let f2fs always triggers OPU
+_scratch_mount -o mode=lfs,checkpoint=disable:10%,noinline_dentry >> $seqres.full
+
+testfile=$SCRATCH_MNT/testfile
+tmpfile=$SCRATCH_MNT/tmpfile
+tmpdir=$SCRATCH_MNT/tmpdir
+
+dd if=/dev/zero of=$testfile bs=1M count=5 2>/dev/null
+mkdir $tmpdir
+touch $tmpfile
+sync
+
+# it dirties tmpdir inode by updating ctime,
+# but it doesn't moving the inode to gdirty_list.
+mv $tmpfile $tmpdir
+
+# it runs out of free segment
+dd if=/dev/zero of=$testfile bs=1M count=5 conv=notrunc conv=fsync 2>/dev/null
+
+_scratch_mount -o remount,checkpoint=enable
+
+# it may hang umount if tmpdir is still dirty during evict()
+_scratch_unmount
+
+echo "Silence is golden"
+
+status=0
+exit
diff --git a/tests/f2fs/005.out b/tests/f2fs/005.out
new file mode 100644
index 00000000..a5027f12
--- /dev/null
+++ b/tests/f2fs/005.out
@@ -0,0 +1,2 @@
+QA output created by 005
+Silence is golden
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
