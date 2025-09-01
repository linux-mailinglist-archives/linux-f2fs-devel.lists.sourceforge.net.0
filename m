Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 21841B3D684
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  1 Sep 2025 04:04:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YoTAfQfTtHa8OwdWp6JE8jT86Oio6B5rYWgFBIsxouw=; b=diZwkmg+fyTQUJeoi4oAu3actY
	84SQ7Sv2xtVmd1mF331WdTryPn3zHphsDvKuUaVEwqGj5cb3spjuJifzPwP26HQeHuKe2SIZ109ve
	X6wNdYBGETrMZv9C5oKYAcq71YbL4o5PQ9HYa9GRPiLu3Hvlz+ITNymXu4FEaOoC5goI=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1usttj-0002iD-AM;
	Mon, 01 Sep 2025 02:03:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ustti-0002i6-3L
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 01 Sep 2025 02:03:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0tf2AOG8h9+PguPubUlZ5ran6QLtp2335yBUKXD0W4k=; b=CTmQ8i9j+1388dOHqFd2aLwFLu
 hDaEPvwZhIQuosDCOMJbGIkltfGDToUAEBjGOrtrBGtW9Da051XDabM9lgdWidyRKUTZf9sj2jTrU
 z4514vYvLKUDZjFjqqiqjD0Yo0omkaneNVWkgZDzx/ZUm6Q+UuMe1I3GrYkFzFOdwbho=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0tf2AOG8h9+PguPubUlZ5ran6QLtp2335yBUKXD0W4k=; b=ezqk23ImEhtpU7NgKP2tAjOq53
 RwDlAt4rdkY/kMK5S0pYDSJxpgB8sZUA+VVk2JQUtr9uDWbwcacz1VW77iBHDelHkbD9FHlOd78UF
 eRwJnmv/Ye1D0KzkmrnBU/JkuNrRyVpQs1sQlyKDRndnJO0HJ7Rwzq8EMwe3RFKC9afI=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ustth-0004ry-K8 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 01 Sep 2025 02:03:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 15B3B601E5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  1 Sep 2025 02:03:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FFBEC4CEF6;
 Mon,  1 Sep 2025 02:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756692222;
 bh=PTR9olxR+6Cv0v/ngn9kPVgymR2ombpHO6ievh61MH4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YGddBssWWAimjHdH4jnAkHd72XGEkdSP/98dCqxbUjV9+0btGK2cldnWqbI2qenl2
 EZBaJSR5dR4A4DUkucubgWfSiQy4Goq/upg161vULmG4gRaBwXpXl1KadvFpakg2Zv
 oZqzAMxyfJhFynkR3+VEsVdlCRsXUfb8JdTLK9K5eqaNBAd6a1Lg+9LBGz709ySj4i
 i2YTiOSGP3vZ4HbSTN119oZBSgnHNw9dmilA2cYj2nZfmWzGa+k2F5oqIszijozus5
 TMPmuJjmXbkeuWOuaxrT2hAB0zCFKR6mCbbQcASKQf5Stp48qZXmnNXE+KDzRx60wm
 qI3XwJDZFIFAQ==
To: Zorro Lang <zlang@kernel.org>,
	fstests@vger.kernel.org
Date: Mon,  1 Sep 2025 10:03:31 +0800
Message-ID: <20250901020331.2171502-2-chao@kernel.org>
X-Mailer: git-send-email 2.51.0.338.gd7d06c2dae-goog
In-Reply-To: <20250901020331.2171502-1-chao@kernel.org>
References: <20250901020331.2171502-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This is a regression test: 1. create foo & bar 2. write 8M
 data to foo 3. use inject.f2fs to inject i_nid[0] of foo w/ ino of bar 4.
 fpunch in foo w/ specified range If we haven't applied kernel patch ("f2fs:
 fix to do sanity check on node footer for non inode dnode"), f2fs may missed
 to do sanity check on corrupted dnode, result in panic in step 4). 
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
X-Headers-End: 1ustth-0004ry-K8
Subject: [f2fs-dev] [PATCH 2/2] f2fs/022: do sanity check on footer of non
 inode dnode
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
1. create foo & bar
2. write 8M data to foo
3. use inject.f2fs to inject i_nid[0] of foo w/ ino of bar
4. fpunch in foo w/ specified range

If we haven't applied kernel patch ("f2fs: fix to do sanity check on
node footer for non inode dnode"), f2fs may missed to do sanity check
on corrupted dnode, result in panic in step 4).

Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 tests/f2fs/022     | 52 ++++++++++++++++++++++++++++++++++++++++++++++
 tests/f2fs/022.out |  2 ++
 2 files changed, 54 insertions(+)
 create mode 100755 tests/f2fs/022
 create mode 100644 tests/f2fs/022.out

diff --git a/tests/f2fs/022 b/tests/f2fs/022
new file mode 100755
index 00000000..a5e19a71
--- /dev/null
+++ b/tests/f2fs/022
@@ -0,0 +1,52 @@
+#! /bin/bash
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (c) 2025 Chao Yu.  All Rights Reserved.
+#
+# FS QA Test No. f2fs/022
+#
+# This is a regression test:
+# 1. create foo & bar
+# 2. write 8M data to foo
+# 3. use inject.f2fs to inject i_nid[0] of foo w/ ino of bar
+# 4. fpunch in foo w/ specified range
+#
+. ./common/preamble
+_begin_fstest auto quick rw
+
+. ./common/attr
+
+_fixed_by_kernel_commit xxxxxxxxxxxx \
+	"f2fs: fix to do sanity check on node footer for non inode dnode"
+
+_require_scratch_nocheck
+_require_command "$F2FS_INJECT_PROG" inject.f2fs
+_require_xfs_io_command "fpunch"
+_require_kernel_config CONFIG_F2FS_CHECK_FS
+
+# remove all mkfs options to avoid layout change of on-disk inode
+export MKFS_OPTIONS=""
+
+foo_path=$SCRATCH_MNT/foo
+bar_path=$SCRATCH_MNT/bar
+
+_scratch_mkfs >> $seqres.full
+_scratch_mount
+
+touch $foo_path
+touch $bar_path
+$XFS_IO_PROG $foo_path -c "pwrite 0 8M" >> $seqres.full
+sync
+foo_ino=`stat -c '%i' $foo_path`
+bar_ino=`stat -c '%i' $bar_path`
+_scratch_unmount
+
+# inject foo inode to replace i_nid[0] w/ to bar ino
+$F2FS_INJECT_PROG --node --mb i_nid --nid $foo_ino --idx 0 --val $bar_ino $SCRATCH_DEV >> $seqres.full || _fail "failed to inject"
+
+_scratch_mount
+# expect to trigger panic
+$XFS_IO_PROG $foo_path -c "fpunch 6984k 4k"
+_scratch_unmount
+
+status=0
+exit
diff --git a/tests/f2fs/022.out b/tests/f2fs/022.out
new file mode 100644
index 00000000..5307e3d7
--- /dev/null
+++ b/tests/f2fs/022.out
@@ -0,0 +1,2 @@
+QA output created by 022
+fallocate: Structure needs cleaning
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
