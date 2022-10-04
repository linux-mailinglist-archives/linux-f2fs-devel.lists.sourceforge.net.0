Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D17E15F3B0A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Oct 2022 03:41:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ofWwF-0006EO-2W;
	Tue, 04 Oct 2022 01:41:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ofWwC-0006EH-K7
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Oct 2022 01:41:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zaQf/6UFXMYNdPQXYbqDE4QYY3ct8cTskkr1WlL3vkY=; b=LaNr+CfJYVMqTLBh8VQLPDHYBm
 iGnK37ISPQXh/wmhiqUGtZrMBQIdnoRszJLkA+Nt28zvSuN76M89I47dm2NCmSlIw0/4ZHVyDyfMS
 YFcZqcj+3v6WQfKKZz1HVKJDFZjcsSBS+LQDWe59L/oTt1BXhafU4Oinx4MeyPvdCvrQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=zaQf/6UFXMYNdPQXYbqDE4QYY3ct8cTskkr1WlL3vkY=; b=g
 +9xos4PyMl2Cq6RJZqgb6j7BtO4VjaLjvdiJYRlbgBVjosmkoSFR4s0BYWgc6GOtu13hYY6h2pRX1
 HKE/eD+PPi7AHYwiD9Ua9tAuNN08c5/X+PGEDt+fio4/W/hbYxE2mMTloaco08zBYKZKymyw3Ijr9
 N0TJtwqruwKH3L9I=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ofWvy-0002zc-NX for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Oct 2022 01:41:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EB5CAB811A3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  4 Oct 2022 01:41:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51611C433D6;
 Tue,  4 Oct 2022 01:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664847668;
 bh=SViozrtHpxa4Fp3tUE+OJWXx+CBtzHe8unuMcforS/A=;
 h=From:To:Cc:Subject:Date:From;
 b=QWHXY2+cJbinaPnmP2PnDWwBv9EcIWPFtiBAOOE9c5E5xlnYcY8cm04KtryGAqdJK
 Oq76MdzgAQ+czQ8cXvY03S5zGyL92mvyZ3eKSbmZgzcUl0vHwgDsIOVLol61ilwZaH
 gUyfegfnnBTuhYmkpdUUO+aun+YAZIlXflAtz4OgJktkO4s/MtnXbzB/hKYkv35O1x
 UNENjhBt82tDgccRfziumN9/GXp/tCw72ZcmxeU/ssacQIDSzeCPZfOdfiHiAFYHd+
 6o8pPMlXRHvU0IW/64Xf7zSTSEfj1qQCGyMxbhIO9IZ5yUPB8QM7YxRw8S6T2jFMzI
 Y0fvk+ZNiq6qQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Tue,  4 Oct 2022 09:41:02 +0800
Message-Id: <20221004014102.974213-1-chao@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: inode_lock[ATOMIC_FILE] was used for protecting
 sbi->atomic_files, 
 update atomic_files variable's type to atomic_t instead of unsigned int,
 then inode_lock[ATOMIC_FILE] can be obsoleted. Signed-off-by: Chao Yu
 <chao@kernel.org>
 --- fs/f2fs/debug.c | 3 ++- fs/f2fs/f2fs.h | 11 ++++++++--- fs/f2fs/file.c
 | 4 +--- fs/f2fs/segment.c | 5 +---- 4 files changed, 12 insertions(+), 11
 deletions [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ofWvy-0002zc-NX
Subject: [f2fs-dev] [PATCH] f2fs: change to use atomic_t type form
 sbi.atomic_files
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

inode_lock[ATOMIC_FILE] was used for protecting sbi->atomic_files,
update atomic_files variable's type to atomic_t instead of unsigned
int, then inode_lock[ATOMIC_FILE] can be obsoleted.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/debug.c   |  3 ++-
 fs/f2fs/f2fs.h    | 11 ++++++++---
 fs/f2fs/file.c    |  4 +---
 fs/f2fs/segment.c |  5 +----
 4 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index 7a9dd2319155..a216dcdf6941 100644
--- a/fs/f2fs/debug.c
+++ b/fs/f2fs/debug.c
@@ -91,7 +91,7 @@ static void update_general_status(struct f2fs_sb_info *sbi)
 	si->ndirty_files = sbi->ndirty_inode[FILE_INODE];
 	si->nquota_files = sbi->nquota_files;
 	si->ndirty_all = sbi->ndirty_inode[DIRTY_META];
-	si->aw_cnt = sbi->atomic_files;
+	si->aw_cnt = atomic_read(&sbi->atomic_files);
 	si->max_aw_cnt = atomic_read(&sbi->max_aw_cnt);
 	si->nr_dio_read = get_pages(sbi, F2FS_DIO_READ);
 	si->nr_dio_write = get_pages(sbi, F2FS_DIO_WRITE);
@@ -611,6 +611,7 @@ int f2fs_build_stats(struct f2fs_sb_info *sbi)
 	atomic_set(&sbi->compr_inode, 0);
 	atomic64_set(&sbi->compr_blocks, 0);
 	atomic_set(&sbi->swapfile_inode, 0);
+	atomic_set(&sbi->atomic_files, 0);
 	atomic_set(&sbi->inplace_count, 0);
 	for (i = META_CP; i < META_MAX; i++)
 		atomic_set(&sbi->meta_count[i], 0);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index a0b2c8626a75..fba7cd5cc201 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1259,7 +1259,6 @@ enum inode_type {
 	DIR_INODE,			/* for dirty dir inode */
 	FILE_INODE,			/* for dirty regular/symlink inode */
 	DIRTY_META,			/* for all dirtied inode metadata */
-	ATOMIC_FILE,			/* for all atomic files */
 	NR_INODE_TYPE,
 };
 
@@ -1741,7 +1740,6 @@ struct f2fs_sb_info {
 	unsigned int gc_urgent_high_remaining;	/* remaining trial count for GC_URGENT_HIGH */
 
 	/* for skip statistic */
-	unsigned int atomic_files;		/* # of opened atomic file */
 	unsigned long long skipped_gc_rwsem;		/* FG_GC only */
 
 	/* threshold for gc trials on pinned files */
@@ -1773,6 +1771,7 @@ struct f2fs_sb_info {
 	atomic_t compr_inode;			/* # of compressed inodes */
 	atomic64_t compr_blocks;		/* # of compressed blocks */
 	atomic_t swapfile_inode;		/* # of swapfile inodes */
+	atomic_t atomic_files;			/* # of opened atomic file */
 	atomic_t max_aw_cnt;			/* max # of atomic writes */
 	unsigned int io_skip_bggc;		/* skip background gc for in-flight IO */
 	unsigned int other_skip_bggc;		/* skip background gc for other reasons */
@@ -3972,6 +3971,10 @@ static inline struct f2fs_stat_info *F2FS_STAT(struct f2fs_sb_info *sbi)
 		(atomic_inc(&F2FS_I_SB(inode)->swapfile_inode))
 #define stat_dec_swapfile_inode(inode)					\
 		(atomic_dec(&F2FS_I_SB(inode)->swapfile_inode))
+#define stat_inc_atomic_inode(inode)					\
+			(atomic_inc(&F2FS_I_SB(inode)->atomic_files))
+#define stat_dec_atomic_inode(inode)					\
+			(atomic_dec(&F2FS_I_SB(inode)->atomic_files))
 #define stat_inc_meta_count(sbi, blkaddr)				\
 	do {								\
 		if (blkaddr < SIT_I(sbi)->sit_base_addr)		\
@@ -3991,7 +3994,7 @@ static inline struct f2fs_stat_info *F2FS_STAT(struct f2fs_sb_info *sbi)
 		(atomic_inc(&(sbi)->inplace_count))
 #define stat_update_max_atomic_write(inode)				\
 	do {								\
-		int cur = F2FS_I_SB(inode)->atomic_files;	\
+		int cur = atomic_read(&F2FS_I_SB(inode)->atomic_files);	\
 		int max = atomic_read(&F2FS_I_SB(inode)->max_aw_cnt);	\
 		if (cur > max)						\
 			atomic_set(&F2FS_I_SB(inode)->max_aw_cnt, cur);	\
@@ -4058,6 +4061,8 @@ void f2fs_update_sit_info(struct f2fs_sb_info *sbi);
 #define stat_sub_compr_blocks(inode, blocks)		do { } while (0)
 #define stat_inc_swapfile_inode(inode)			do { } while (0)
 #define stat_dec_swapfile_inode(inode)			do { } while (0)
+#define stat_inc_atomic_inode(inode)			do { } while (0)
+#define stat_dec_atomic_inode(inode)			do { } while (0)
 #define stat_update_max_atomic_write(inode)		do { } while (0)
 #define stat_inc_meta_count(sbi, blkaddr)		do { } while (0)
 #define stat_inc_seg_type(sbi, curseg)			do { } while (0)
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index df5e7ad80096..e4b6e51086a3 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2061,9 +2061,7 @@ static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
 	}
 	f2fs_i_size_write(fi->cow_inode, isize);
 
-	spin_lock(&sbi->inode_lock[ATOMIC_FILE]);
-	sbi->atomic_files++;
-	spin_unlock(&sbi->inode_lock[ATOMIC_FILE]);
+	stat_inc_atomic_inode(inode);
 
 	set_inode_flag(inode, FI_ATOMIC_FILE);
 	set_inode_flag(fi->cow_inode, FI_COW_FILE);
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 5619f2916335..79ec215a7ec6 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -187,7 +187,6 @@ bool f2fs_need_SSR(struct f2fs_sb_info *sbi)
 
 void f2fs_abort_atomic_write(struct inode *inode, bool clean)
 {
-	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct f2fs_inode_info *fi = F2FS_I(inode);
 
 	if (!f2fs_is_atomic_file(inode))
@@ -203,9 +202,7 @@ void f2fs_abort_atomic_write(struct inode *inode, bool clean)
 	release_atomic_write_cnt(inode);
 	clear_inode_flag(inode, FI_ATOMIC_FILE);
 
-	spin_lock(&sbi->inode_lock[ATOMIC_FILE]);
-	sbi->atomic_files--;
-	spin_unlock(&sbi->inode_lock[ATOMIC_FILE]);
+	stat_dec_atomic_inode(inode);
 }
 
 static int __replace_atomic_write_block(struct inode *inode, pgoff_t index,
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
