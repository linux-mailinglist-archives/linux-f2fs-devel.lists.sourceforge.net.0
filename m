Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F64797DC2
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  7 Sep 2023 23:09:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qeMFe-0003ZF-J6;
	Thu, 07 Sep 2023 21:09:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1qeMFc-0003Z9-VV
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 Sep 2023 21:09:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yOO8sgo/XRPJnAc56wSOSmOQ0MdIgV4CsmeV+wg96nM=; b=LgmvcVxIF2bSKzOgfGydxGXdQ9
 nNbjj/G1ZO1hJSiqa+ul7NasroQh9mDHv1NOt26soLH8ysxk+gbi1+ZvdqkP9v2n+c4mdq2gFYkCM
 yQ3K2/zCwisNc/2EyFFXmOtJtA0Btemof3S21dSc2DRYGzcmwsis170G/kgPmJscpcK8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=yOO8sgo/XRPJnAc56wSOSmOQ0MdIgV4CsmeV+wg96nM=; b=K
 DJ/bRGgpB9k21rkUQKgRW0tFEY9hbMgWLmqje+5dDbSIkRfzxCEcRARZGrQMkduzWZ1ieu2Ca3h80
 Hs1qs3yOPZHfP7s6U618TTNzqtGEr74uF1lMB9Kj2VdwuGHLco5DJsLB1zoTFWIogFjBj96aea45P
 4jcYbk8bv/xWZNY8=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qeMFT-0001i7-VR for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 Sep 2023 21:09:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 1BEE5CE1997;
 Thu,  7 Sep 2023 21:09:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FB75C433C7;
 Thu,  7 Sep 2023 21:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694120940;
 bh=eqSktRiuy/QbTz225cenObSEu4zXAWGERCnQTGrRrfE=;
 h=From:To:Cc:Subject:Date:From;
 b=Ts1JfLQY21vtuMZdknT3et1azyEQcCxP+WzhR6Uu/nXTQAwaKn5xh1Iab+N5DdUse
 IfTnDoEO8+3DippRol5d+wUXhFFwOxkpks642UbFxXX4w5LzBYKOJSFic592mqOxrx
 lxd5Agseuk9t3S51wwblrNCiZyPRAzBD883Lpv4s/8IyV2iBEaYada9+R5mtIgZ65/
 kkMy60c4HWLjF+5WfMScNd22Y7eI/RvyYfkA/cjCT5SJFNAfKuLVAjBwgwGatNJm8C
 iJxYLG2GZuxTGwDTMr7m9Dh4zTSQ4QwEu6lJz+c+bivn5K+j+vOPtTpaOao6Ji/0Zy
 0o4WQWDdsBW1g==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Thu,  7 Sep 2023 14:08:58 -0700
Message-ID: <20230907210859.3698691-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Let's allocate the extent_cache tree without dynamic
 conditions
 to avoid a missing condition causing a panic as below. # create a file w/
 a compressed flag # disable the compression # panic while updating
 extent_cache
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qeMFT-0001i7-VR
Subject: [f2fs-dev] [PATCH] f2fs: split initial and dynamic conditions for
 extent_cache
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, stable@vger.kernel.org,
 syzbot+d342e330a37b48c094b7@syzkaller.appspotmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Let's allocate the extent_cache tree without dynamic conditions to avoid a
missing condition causing a panic as below.

 # create a file w/ a compressed flag
 # disable the compression
 # panic while updating extent_cache

F2FS-fs (dm-64): Swapfile: last extent is not aligned to section
F2FS-fs (dm-64): Swapfile (3) is not align to section: 1) creat(), 2) ioctl(F2FS_IOC_SET_PIN_FILE), 3) fallocate(2097152 * N)
Adding 124996k swap on ./swap-file.  Priority:0 extents:2 across:17179494468k
==================================================================
BUG: KASAN: null-ptr-deref in instrument_atomic_read_write out/common/include/linux/instrumented.h:101 [inline]
BUG: KASAN: null-ptr-deref in atomic_try_cmpxchg_acquire out/common/include/asm-generic/atomic-instrumented.h:705 [inline]
BUG: KASAN: null-ptr-deref in queued_write_lock out/common/include/asm-generic/qrwlock.h:92 [inline]
BUG: KASAN: null-ptr-deref in __raw_write_lock out/common/include/linux/rwlock_api_smp.h:211 [inline]
BUG: KASAN: null-ptr-deref in _raw_write_lock+0x5a/0x110 out/common/kernel/locking/spinlock.c:295
Write of size 4 at addr 0000000000000030 by task syz-executor154/3327

CPU: 0 PID: 3327 Comm: syz-executor154 Tainted: G           O      5.10.185 #1
Hardware name: emulation qemu-x86/qemu-x86, BIOS 2023.01-21885-gb3cc1cd24d 01/01/2023
Call Trace:
 __dump_stack out/common/lib/dump_stack.c:77 [inline]
 dump_stack_lvl+0x17e/0x1c4 out/common/lib/dump_stack.c:118
 __kasan_report+0x16c/0x260 out/common/mm/kasan/report.c:415
 kasan_report+0x51/0x70 out/common/mm/kasan/report.c:428
 kasan_check_range+0x2f3/0x340 out/common/mm/kasan/generic.c:186
 __kasan_check_write+0x14/0x20 out/common/mm/kasan/shadow.c:37
 instrument_atomic_read_write out/common/include/linux/instrumented.h:101 [inline]
 atomic_try_cmpxchg_acquire out/common/include/asm-generic/atomic-instrumented.h:705 [inline]
 queued_write_lock out/common/include/asm-generic/qrwlock.h:92 [inline]
 __raw_write_lock out/common/include/linux/rwlock_api_smp.h:211 [inline]
 _raw_write_lock+0x5a/0x110 out/common/kernel/locking/spinlock.c:295
 __drop_extent_tree+0xdf/0x2f0 out/common/fs/f2fs/extent_cache.c:1155
 f2fs_drop_extent_tree+0x17/0x30 out/common/fs/f2fs/extent_cache.c:1172
 f2fs_insert_range out/common/fs/f2fs/file.c:1600 [inline]
 f2fs_fallocate+0x19fd/0x1f40 out/common/fs/f2fs/file.c:1764
 vfs_fallocate+0x514/0x9b0 out/common/fs/open.c:310
 ksys_fallocate out/common/fs/open.c:333 [inline]
 __do_sys_fallocate out/common/fs/open.c:341 [inline]
 __se_sys_fallocate out/common/fs/open.c:339 [inline]
 __x64_sys_fallocate+0xb8/0x100 out/common/fs/open.c:339
 do_syscall_64+0x35/0x50 out/common/arch/x86/entry/common.c:46

Cc: stable@vger.kernel.org
Fixes: 72840cccc0a1 ("f2fs: allocate the extent_cache by default")
Reported-by: syzbot+d342e330a37b48c094b7@syzkaller.appspotmail.com
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/extent_cache.c | 53 +++++++++++++++++-------------------------
 1 file changed, 21 insertions(+), 32 deletions(-)

diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
index 0e2d49140c07..ad8dfac73bd4 100644
--- a/fs/f2fs/extent_cache.c
+++ b/fs/f2fs/extent_cache.c
@@ -74,40 +74,14 @@ static void __set_extent_info(struct extent_info *ei,
 	}
 }
 
-static bool __may_read_extent_tree(struct inode *inode)
-{
-	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
-
-	if (!test_opt(sbi, READ_EXTENT_CACHE))
-		return false;
-	if (is_inode_flag_set(inode, FI_NO_EXTENT))
-		return false;
-	if (is_inode_flag_set(inode, FI_COMPRESSED_FILE) &&
-			 !f2fs_sb_has_readonly(sbi))
-		return false;
-	return S_ISREG(inode->i_mode);
-}
-
-static bool __may_age_extent_tree(struct inode *inode)
-{
-	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
-
-	if (!test_opt(sbi, AGE_EXTENT_CACHE))
-		return false;
-	if (is_inode_flag_set(inode, FI_COMPRESSED_FILE))
-		return false;
-	if (file_is_cold(inode))
-		return false;
-
-	return S_ISREG(inode->i_mode) || S_ISDIR(inode->i_mode);
-}
-
 static bool __init_may_extent_tree(struct inode *inode, enum extent_type type)
 {
 	if (type == EX_READ)
-		return __may_read_extent_tree(inode);
-	else if (type == EX_BLOCK_AGE)
-		return __may_age_extent_tree(inode);
+		return test_opt(F2FS_I_SB(inode), READ_EXTENT_CACHE) &&
+			S_ISREG(inode->i_mode);
+	if (type == EX_BLOCK_AGE)
+		return test_opt(F2FS_I_SB(inode), AGE_EXTENT_CACHE) &&
+			(S_ISREG(inode->i_mode) || S_ISDIR(inode->i_mode));
 	return false;
 }
 
@@ -120,7 +94,22 @@ static bool __may_extent_tree(struct inode *inode, enum extent_type type)
 	if (list_empty(&F2FS_I_SB(inode)->s_list))
 		return false;
 
-	return __init_may_extent_tree(inode, type);
+	if (!__init_may_extent_tree(inode, type))
+		return false;
+
+	if (type == EX_READ) {
+		if (is_inode_flag_set(inode, FI_NO_EXTENT))
+			return false;
+		if (is_inode_flag_set(inode, FI_COMPRESSED_FILE) &&
+				 !f2fs_sb_has_readonly(F2FS_I_SB(inode)))
+			return false;
+	} else if (type == EX_BLOCK_AGE) {
+		if (is_inode_flag_set(inode, FI_COMPRESSED_FILE))
+			return false;
+		if (file_is_cold(inode))
+			return false;
+	}
+	return true;
 }
 
 static void __try_update_largest_extent(struct extent_tree *et,
-- 
2.42.0.283.g2d96d420d3-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
