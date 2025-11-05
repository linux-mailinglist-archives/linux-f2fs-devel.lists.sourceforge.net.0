Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0D4C34188
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 05 Nov 2025 07:50:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5x2j7/Lb1xcmrqmjoy8+DQC4ZFCuu6glh9EWg0YmDJA=; b=Zi8Q8g5kWJDxd99TOG42ychdk7
	+yJ8Vkk/85UyS+tsHEhgT1fKps5EahHTTSh5bslXG1LCMWsNJgHNpYuJX0FpN4UMhyADBzX6CSAD0
	pLEyAQ1laZZnlu2D1/LK5SHNN8PEBy7SUzvEBI4i6Ca0hr+xeDFFVU3GddNtwqhx1TV0=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vGXLr-0000tY-TT;
	Wed, 05 Nov 2025 06:50:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vGXLq-0000tQ-GN
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Nov 2025 06:50:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aXFUveTZ2md1F41Q6u/UY0UukU0pheB7klJYZSf2L4g=; b=RhrFnGEAtO6w4Vcrs2L1vAhN8r
 A0GCn5PyIdjkNS4nMptdGmv6ZV8oBlNrP/jp59B04s3NCeWpRRbT15rVOg3pAtBLnRpNb+QYGPkSn
 Rk/cSx+8ozXAqHbw3OGNRMPKjb6VanvIs83Sod4BuI6zxUGIKJjgP6DKh2YdXPWJpiO8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aXFUveTZ2md1F41Q6u/UY0UukU0pheB7klJYZSf2L4g=; b=AlZJbc/YqJBqLy5Oq6DrB/61Lo
 V7SoPzEpdgrv+zP8VnqYZE/KW8DlF/ubu2mTGydPIpt67UcvSoJHXDHzPFzZPhRqQ8O6P94f35y7M
 enDkOSjDNFrOO2IGI7s0q52Ksk+h8V/G6xou1BxEtxD15GQgIj1IDXHuwN2GECiPV1As=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vGXLq-0006iR-0Y for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Nov 2025 06:50:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B58214473B
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  5 Nov 2025 06:50:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D8E9C116B1;
 Wed,  5 Nov 2025 06:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762325432;
 bh=NaK4PXfltxCANI2HClt3ILDvtjo1EaevjW47jUDeLsk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=b+1oKU3d+/yxXpoB9UvL9E3obpa54VqjQF72OvWc00+js1KygAmCU1Q+EF6GnIJk7
 j5d9OB9wGryaoPybwEm4hS00hi5s3aKBIbWipAJq24NlvKguiyALHniNyDhlnaPZfA
 yfCuw6TkX85c5iBE9QwnBRP6foRlhqL56j6avr1XtiVZfGfCJ9uzNeVHXb9HzmtJ5P
 I1+8UGSWK2uSCZYMSNimHrYOlG5+JVfsbONu6GcyMu/r6c9Eu9eVtoMtGSwsvE0GNu
 k2+Ggx43GhnDtQjXDCtq5bINL7VVFE+z11Ac0GXJdF0CWEeFZ/cRHunUqfKBPjC1XA
 Crdmu5qeg7rdQ==
To: jaegeuk@kernel.org
Date: Wed,  5 Nov 2025 14:50:23 +0800
Message-ID: <20251105065023.3656975-2-chao@kernel.org>
X-Mailer: git-send-email 2.51.2.1006.ga50a493c49-goog
In-Reply-To: <20251105065023.3656975-1-chao@kernel.org>
References: <20251105065023.3656975-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: mkfs.f2fs -f /dev/vdd mount /dev/vdd /mnt/f2fs touch
 /mnt/f2fs/foo
 sync # avoid CP_UMOUNT_FLAG in last f2fs_checkpoint.ckpt_flags touch
 /mnt/f2fs/bar
 f2fs_io fsync /mnt/f2fs/bar f2fs_io shutdown 2 /mn [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vGXLq-0006iR-0Y
Subject: [f2fs-dev] [PATCH 2/2] f2fs: fix to detect recoverable inode during
 dryrun of find_fsync_dnodes()
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
Cc: stable@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

mkfs.f2fs -f /dev/vdd
mount /dev/vdd /mnt/f2fs
touch /mnt/f2fs/foo
sync		# avoid CP_UMOUNT_FLAG in last f2fs_checkpoint.ckpt_flags
touch /mnt/f2fs/bar
f2fs_io fsync /mnt/f2fs/bar
f2fs_io shutdown 2 /mnt/f2fs
umount /mnt/f2fs
blockdev --setro /dev/vdd
mount /dev/vdd /mnt/f2fs
mount: /mnt/f2fs: WARNING: source write-protected, mounted read-only.

For the case if we create and fsync a new inode before sudden power-cut,
without norecovery or disable_roll_forward mount option, the following
mount will succeed w/o recovering last fsynced inode.

The problem here is that we only check inode_list list after
find_fsync_dnodes() in f2fs_recover_fsync_data() to find out whether
there is recoverable data in the iamge, but there is a missed case, if
last fsynced inode is not existing in last checkpoint, then, we will
fail to get its inode due to nat of inode node is not existing in last
checkpoint, so the inode won't be linked in inode_list.

Let's detect such case in dyrun mode to fix this issue.

After this change, mount will fail as expected below:
mount: /mnt/f2fs: cannot mount /dev/vdd read-only.
       dmesg(1) may have more information after failed mount system call.
demsg:
F2FS-fs (vdd): Need to recover fsync data, but write access unavailable, please try mount w/ disable_roll_forward or norecovery

Cc: stable@kernel.org
Fixes: 6781eabba1bd ("f2fs: give -EINVAL for norecovery and rw mount")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/recovery.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index 215e442db72c..d7faebaa3c6b 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -399,7 +399,7 @@ static int sanity_check_node_chain(struct f2fs_sb_info *sbi, block_t blkaddr,
 }
 
 static int find_fsync_dnodes(struct f2fs_sb_info *sbi, struct list_head *head,
-				bool check_only)
+				bool check_only, bool *new_inode)
 {
 	struct curseg_info *curseg;
 	block_t blkaddr, blkaddr_fast;
@@ -447,16 +447,19 @@ static int find_fsync_dnodes(struct f2fs_sb_info *sbi, struct list_head *head,
 				quota_inode = true;
 			}
 
-			/*
-			 * CP | dnode(F) | inode(DF)
-			 * For this case, we should not give up now.
-			 */
 			entry = add_fsync_inode(sbi, head, ino_of_node(folio),
 								quota_inode);
 			if (IS_ERR(entry)) {
 				err = PTR_ERR(entry);
-				if (err == -ENOENT)
+				/*
+				 * CP | dnode(F) | inode(DF)
+				 * For this case, we should not give up now.
+				 */
+				if (err == -ENOENT) {
+					if (check_only)
+						*new_inode = true;
 					goto next;
+				}
 				f2fs_folio_put(folio, true);
 				break;
 			}
@@ -875,6 +878,7 @@ int f2fs_recover_fsync_data(struct f2fs_sb_info *sbi, bool check_only)
 	int ret = 0;
 	unsigned long s_flags = sbi->sb->s_flags;
 	bool need_writecp = false;
+	bool new_inode = false;
 
 	f2fs_notice(sbi, "f2fs_recover_fsync_data: recovery fsync data, "
 					"check_only: %d", check_only);
@@ -890,8 +894,8 @@ int f2fs_recover_fsync_data(struct f2fs_sb_info *sbi, bool check_only)
 	f2fs_down_write(&sbi->cp_global_sem);
 
 	/* step #1: find fsynced inode numbers */
-	err = find_fsync_dnodes(sbi, &inode_list, check_only);
-	if (err || list_empty(&inode_list))
+	err = find_fsync_dnodes(sbi, &inode_list, check_only, &new_inode);
+	if (err < 0 || (list_empty(&inode_list) && (!check_only || !new_inode)))
 		goto skip;
 
 	if (check_only) {
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
