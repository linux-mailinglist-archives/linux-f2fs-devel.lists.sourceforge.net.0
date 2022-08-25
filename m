Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4590E5A0929
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Aug 2022 08:51:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oR6hv-0008I8-UP;
	Thu, 25 Aug 2022 06:51:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1oR6hg-0008Hj-Ro
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Aug 2022 06:51:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UYgLwAWXaiUeP8E4/kif9SEZ3Rp0d8ImApQxhvNnk4U=; b=cUzoxhmmfxRp3Lnw3CTCulp/HD
 s8XUrbjF4gJb64VcFocgT9eUYFyVH9xPdcD91A6Q+Bw5u2p5zgLW3TEsLlPUoOpU6SC2Kw0ElLOuR
 Vs6bmFn0s3rXknKxHKSCyI8Xd/Mp5McemH9AZ4jm+9Mkbgjjfy/DyFoWJLhSwU1RwXeA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=UYgLwAWXaiUeP8E4/kif9SEZ3Rp0d8ImApQxhvNnk4U=; b=A
 7ypd6n0ePDfjn4uRVDkVD7bx0TwuKX6TyW4By/2JrmMEaxoGPOMqfa6uXcrKXlWzOw/kMtDm3re8V
 8eGCj4IkoiRJUEmIbBGSa4zikFJW6nlc9gg5qA8r+bMNZNZ7UbYUcom7rh4nYaWbked87835EHl4T
 SJP+of3qUFPhF9xE=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oR6hI-0006C4-DO for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Aug 2022 06:50:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 59704B8275B;
 Thu, 25 Aug 2022 06:50:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0DD0C433C1;
 Thu, 25 Aug 2022 06:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661410224;
 bh=DrccC7ylO4/DdFvmZTVW+Z5UzGv6H0Hfddj9XoE84jQ=;
 h=From:To:Cc:Subject:Date:From;
 b=vMYz/2zaFP9uEgMNuOEPMkRu9PguAD1D1rxxyHprSe/VPrNk1xtZgGrAPzMNRdrda
 l4ryTTwabGVYVi0Hr40Npc6nZsbAT9xdeiORi6fcX8CLRttQNni1uAtqN5aKZL9Cig
 MLZl9h25w8489NEKe04mS2pEkScpm5w7a5fWrfG8eQyCiR235g/31KazkDf2mkiafG
 Buxl3Auj2pwjd/gD6PK2WO8JjvCpVMGU2hf2hymT6IQRQfv/562BI0OXuYXpypSfqV
 SDWhFRLpy2oxAQ97CdvgWUeyRI4m4qhfRW/HWw+19xTUFfdINsEovZP5ZWzOxhCp60
 3OncKen3d5krA==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Thu, 25 Aug 2022 14:50:14 +0800
Message-Id: <20220825065014.1842769-1-chao@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Chao Yu <chao.yu@oppo.com> In order to check count of
 opened swapfile inodes. Signed-off-by: Chao Yu <chao.yu@oppo.com> ---
 fs/f2fs/data.c
 | 2 ++ fs/f2fs/debug.c | 3 +++ fs/f2fs/f2fs.h | 9 ++++++++- 3 files changed,
 13 insertions(+), 1 deletion(-) 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oR6hI-0006C4-DO
Subject: [f2fs-dev] [PATCH] f2fs: account swapfile inodes
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

From: Chao Yu <chao.yu@oppo.com>

In order to check count of opened swapfile inodes.

Signed-off-by: Chao Yu <chao.yu@oppo.com>
---
 fs/f2fs/data.c  | 2 ++
 fs/f2fs/debug.c | 3 +++
 fs/f2fs/f2fs.h  | 9 ++++++++-
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 0869fbbb5516..66f34cd559c6 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3970,6 +3970,7 @@ static int f2fs_swap_activate(struct swap_info_struct *sis, struct file *file,
 	if (ret < 0)
 		return ret;
 
+	stat_inc_swapfile_inode(inode);
 	set_inode_flag(inode, FI_PIN_FILE);
 	f2fs_update_time(F2FS_I_SB(inode), REQ_TIME);
 	return ret;
@@ -3979,6 +3980,7 @@ static void f2fs_swap_deactivate(struct file *file)
 {
 	struct inode *inode = file_inode(file);
 
+	stat_dec_swapfile_inode(inode);
 	clear_inode_flag(inode, FI_PIN_FILE);
 }
 #else
diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index c01471573977..88231d393b7c 100644
--- a/fs/f2fs/debug.c
+++ b/fs/f2fs/debug.c
@@ -135,6 +135,7 @@ static void update_general_status(struct f2fs_sb_info *sbi)
 	si->inline_inode = atomic_read(&sbi->inline_inode);
 	si->inline_dir = atomic_read(&sbi->inline_dir);
 	si->compr_inode = atomic_read(&sbi->compr_inode);
+	si->swapfile_inode = atomic_read(&sbi->swapfile_inode);
 	si->compr_blocks = atomic64_read(&sbi->compr_blocks);
 	si->append = sbi->im[APPEND_INO].ino_num;
 	si->update = sbi->im[UPDATE_INO].ino_num;
@@ -385,6 +386,8 @@ static int stat_show(struct seq_file *s, void *v)
 			   si->inline_dir);
 		seq_printf(s, "  - Compressed Inode: %u, Blocks: %llu\n",
 			   si->compr_inode, si->compr_blocks);
+		seq_printf(s, "  - Swapfile Inode: %u\n",
+			   si->swapfile_inode);
 		seq_printf(s, "  - Orphan/Append/Update Inode: %u, %u, %u\n",
 			   si->orphans, si->append, si->update);
 		seq_printf(s, "\nMain area: %d segs, %d secs %d zones\n",
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 088c3d1574b8..408d8034ed74 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1765,6 +1765,7 @@ struct f2fs_sb_info {
 	atomic_t inline_dir;			/* # of inline_dentry inodes */
 	atomic_t compr_inode;			/* # of compressed inodes */
 	atomic64_t compr_blocks;		/* # of compressed blocks */
+	atomic_t swapfile_inode;		/* # of swapfile inodes */
 	atomic_t max_aw_cnt;			/* max # of atomic writes */
 	unsigned int io_skip_bggc;		/* skip background gc for in-flight IO */
 	unsigned int other_skip_bggc;		/* skip background gc for other reasons */
@@ -3863,7 +3864,7 @@ struct f2fs_stat_info {
 	int nr_issued_ckpt, nr_total_ckpt, nr_queued_ckpt;
 	unsigned int cur_ckpt_time, peak_ckpt_time;
 	int inline_xattr, inline_inode, inline_dir, append, update, orphans;
-	int compr_inode;
+	int compr_inode, swapfile_inode;
 	unsigned long long compr_blocks;
 	int aw_cnt, max_aw_cnt;
 	unsigned int valid_count, valid_node_count, valid_inode_count, discard_blks;
@@ -3952,6 +3953,10 @@ static inline struct f2fs_stat_info *F2FS_STAT(struct f2fs_sb_info *sbi)
 		(atomic64_add(blocks, &F2FS_I_SB(inode)->compr_blocks))
 #define stat_sub_compr_blocks(inode, blocks)				\
 		(atomic64_sub(blocks, &F2FS_I_SB(inode)->compr_blocks))
+#define stat_inc_swapfile_inode(inode)					\
+		(atomic_inc(&F2FS_I_SB(inode)->swapfile_inode))
+#define stat_dec_swapfile_inode(inode)					\
+		(atomic_dec(&F2FS_I_SB(inode)->swapfile_inode))
 #define stat_inc_meta_count(sbi, blkaddr)				\
 	do {								\
 		if (blkaddr < SIT_I(sbi)->sit_base_addr)		\
@@ -4036,6 +4041,8 @@ void f2fs_update_sit_info(struct f2fs_sb_info *sbi);
 #define stat_dec_compr_inode(inode)			do { } while (0)
 #define stat_add_compr_blocks(inode, blocks)		do { } while (0)
 #define stat_sub_compr_blocks(inode, blocks)		do { } while (0)
+#define stat_inc_swapfile_inode(inode)			do { } while (0)
+#define stat_dec_swapfile_inode(inode)			do { } while (0)
 #define stat_update_max_atomic_write(inode)		do { } while (0)
 #define stat_inc_meta_count(sbi, blkaddr)		do { } while (0)
 #define stat_inc_seg_type(sbi, curseg)			do { } while (0)
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
