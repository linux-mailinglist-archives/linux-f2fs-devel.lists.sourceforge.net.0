Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E01B3A303AF
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Feb 2025 07:37:25 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1thjtU-0005bi-Rw;
	Tue, 11 Feb 2025 06:37:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1thjtT-0005bZ-4P
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Feb 2025 06:37:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pNDXhF5FNklOXI0ktLcp3mnOw5yoFiXiia46J5BqihQ=; b=Fm+LE8AP41AwsFtusU6yFi4iNr
 ETkQ0E6xzL0xQeUHIiOzUeq/w/Dmiob3y0/1+R/6LiSB7mDP2KUWvvq+de9xZUCkEZfS8PQPIgk3t
 27M4JkZ4PRS4rs/HNTbcvi+RCNdgYAj6gnfTZblSEVSXKwqjg6zq/NivjDnonwC0BYXo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=pNDXhF5FNklOXI0ktLcp3mnOw5yoFiXiia46J5BqihQ=; b=X
 NJC5qC7nFOgQSsZNR9nBBpjDEtbl0KREBRlKGT3Ff7zBjnyABzQKxpnK7OB3R5VTLlO2WG61m59e+
 5nGswVgtA/e8i8tm0jSGCzkpt6mDlpRST1i043lnH1VoCcqcgVy3vwiLk2Pp7nNUTX+bf5y2BbPaD
 u3KrZi1AULR8rTKw=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1thjtR-0006FE-Lg for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Feb 2025 06:37:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5F4E5A400E4;
 Tue, 11 Feb 2025 06:35:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAE3CC4CEDD;
 Tue, 11 Feb 2025 06:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739255827;
 bh=2yiMq0kic3NrnbeSa2ncweARleUMsxv2MZfLUAhekBg=;
 h=From:To:Cc:Subject:Date:From;
 b=RPf78K2q9HUuMOvKHKYTYMZJZdjnBS6vsvOPMVUBAIJyjzkerItYnNHWGIHGehp0t
 DuHptmwQCwGdWvyWZk1C1hReI98IYHFXxKEkFMlRAw8ZEL86X1NSidX59sou2OWptE
 nU+FTOC2/hSG0lFgFlbqiX3ZeF/fMrcv23k763ar3NTcHhRb4osPRZ7kGntG7dzvgF
 G+7VcDaen4CkYphc73WVcwqbaL2HDlf8qwHUITwq2fyKVtcrFow4vZpF1awrvK3U+Z
 Zm7tAUJf4spebyJw0Z03mypGy/2H1it+VlGrqIChHo9AQOElXdq6adr2dv6+Pq/GX7
 UfJ73yRjneO7Q==
To: jaegeuk@kernel.org
Date: Tue, 11 Feb 2025 14:36:57 +0800
Message-ID: <20250211063657.405289-1-chao@kernel.org>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
MIME-Version: 1.0
X-Spam-Score: -3.9 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: syzbot reports a f2fs bug as below: [ cut here ] kernel BUG
 at fs/f2fs/segment.c:2746! CPU: 0 UID: 0 PID: 5323 Comm: syz.0.0 Not tainted
 6.13.0-rc2-syzkaller-00018-g7cb1b4663150 #0 RIP: 0010:get_new_segment fs/f2
 [...] Content analysis details:   (-3.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-trusted.bondedsender.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1thjtR-0006FE-Lg
Subject: [f2fs-dev] [PATCH] f2fs: fix to avoid panic once fallocation fails
 for pinfile
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
Cc: syzbot+15669ec8c35ddf6c3d43@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

syzbot reports a f2fs bug as below:

------------[ cut here ]------------
kernel BUG at fs/f2fs/segment.c:2746!
CPU: 0 UID: 0 PID: 5323 Comm: syz.0.0 Not tainted 6.13.0-rc2-syzkaller-00018-g7cb1b4663150 #0
RIP: 0010:get_new_segment fs/f2fs/segment.c:2746 [inline]
RIP: 0010:new_curseg+0x1f52/0x1f70 fs/f2fs/segment.c:2876
Call Trace:
 <TASK>
 __allocate_new_segment+0x1ce/0x940 fs/f2fs/segment.c:3210
 f2fs_allocate_new_section fs/f2fs/segment.c:3224 [inline]
 f2fs_allocate_pinning_section+0xfa/0x4e0 fs/f2fs/segment.c:3238
 f2fs_expand_inode_data+0x696/0xca0 fs/f2fs/file.c:1830
 f2fs_fallocate+0x537/0xa10 fs/f2fs/file.c:1940
 vfs_fallocate+0x569/0x6e0 fs/open.c:327
 do_vfs_ioctl+0x258c/0x2e40 fs/ioctl.c:885
 __do_sys_ioctl fs/ioctl.c:904 [inline]
 __se_sys_ioctl+0x80/0x170 fs/ioctl.c:892
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Concurrent pinfile allocation may run out of free section, result in
panic in get_new_segment(), let's expand pin_sem lock coverage to
include f2fs_gc(), so that we can make sure to reclaim enough free
space for following allocation.

In addition, do below changes to enhance error path handling:
- call f2fs_bug_on() only in non-pinfile allocation path in
get_new_segment().
- call reset_curseg_fields() to reset all fields of curseg in
new_curseg()

Fixes: f5a53edcf01e ("f2fs: support aligned pinned file")
Reported-by: syzbot+15669ec8c35ddf6c3d43@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/linux-f2fs-devel/675cd64e.050a0220.37aaf.00bb.GAE@google.com
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/file.c    |  8 +++++---
 fs/f2fs/segment.c | 20 ++++++++++----------
 2 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 2f93a27d2f45..4c563edbf5c6 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1834,18 +1834,20 @@ static int f2fs_expand_inode_data(struct inode *inode, loff_t offset,
 
 		map.m_len = sec_blks;
 next_alloc:
+		f2fs_down_write(&sbi->pin_sem);
+
 		if (has_not_enough_free_secs(sbi, 0, f2fs_sb_has_blkzoned(sbi) ?
 			ZONED_PIN_SEC_REQUIRED_COUNT :
 			GET_SEC_FROM_SEG(sbi, overprovision_segments(sbi)))) {
 			f2fs_down_write(&sbi->gc_lock);
 			stat_inc_gc_call_count(sbi, FOREGROUND);
 			err = f2fs_gc(sbi, &gc_control);
-			if (err && err != -ENODATA)
+			if (err && err != -ENODATA) {
+				f2fs_up_write(&sbi->pin_sem);
 				goto out_err;
+			}
 		}
 
-		f2fs_down_write(&sbi->pin_sem);
-
 		err = f2fs_allocate_pinning_section(sbi);
 		if (err) {
 			f2fs_up_write(&sbi->pin_sem);
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index c282e8a0a2ec..6ebe25eafafa 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2806,7 +2806,7 @@ static int get_new_segment(struct f2fs_sb_info *sbi,
 							MAIN_SECS(sbi));
 		if (secno >= MAIN_SECS(sbi)) {
 			ret = -ENOSPC;
-			f2fs_bug_on(sbi, 1);
+			f2fs_bug_on(sbi, !pinning);
 			goto out_unlock;
 		}
 	}
@@ -2848,7 +2848,7 @@ static int get_new_segment(struct f2fs_sb_info *sbi,
 out_unlock:
 	spin_unlock(&free_i->segmap_lock);
 
-	if (ret == -ENOSPC)
+	if (ret == -ENOSPC && !pinning)
 		f2fs_stop_checkpoint(sbi, false, STOP_CP_REASON_NO_SEGMENT);
 	return ret;
 }
@@ -2921,6 +2921,13 @@ static unsigned int __get_next_segno(struct f2fs_sb_info *sbi, int type)
 	return curseg->segno;
 }
 
+static void reset_curseg_fields(struct curseg_info *curseg)
+{
+	curseg->inited = false;
+	curseg->segno = NULL_SEGNO;
+	curseg->next_segno = 0;
+}
+
 /*
  * Allocate a current working segment.
  * This function always allocates a free segment in LFS manner.
@@ -2939,7 +2946,7 @@ static int new_curseg(struct f2fs_sb_info *sbi, int type, bool new_sec)
 	ret = get_new_segment(sbi, &segno, new_sec, pinning);
 	if (ret) {
 		if (ret == -ENOSPC)
-			curseg->segno = NULL_SEGNO;
+			reset_curseg_fields(curseg);
 		return ret;
 	}
 
@@ -3710,13 +3717,6 @@ static void f2fs_randomize_chunk(struct f2fs_sb_info *sbi,
 		get_random_u32_inclusive(1, sbi->max_fragment_hole);
 }
 
-static void reset_curseg_fields(struct curseg_info *curseg)
-{
-	curseg->inited = false;
-	curseg->segno = NULL_SEGNO;
-	curseg->next_segno = 0;
-}
-
 int f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
 		block_t old_blkaddr, block_t *new_blkaddr,
 		struct f2fs_summary *sum, int type,
-- 
2.48.1.502.g6dc24dfdaf-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
