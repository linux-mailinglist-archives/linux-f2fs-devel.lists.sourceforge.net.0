Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4383D6430D4
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  5 Dec 2022 19:55:15 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p2GcT-0007A5-Vs;
	Mon, 05 Dec 2022 18:55:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1p2GcJ-00079i-Q8
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 05 Dec 2022 18:55:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=S+ftk/33ak27DCJeAb7bFFnQxlJ+JQ5N6OYVqUQ/seU=; b=DJA/cmOVfIEcRCku9Ki/ROOFkZ
 lrjyYYHH03KHq2NROijT8y6WH2ZbT/yRmnhw3LgpwSicnB7Q4TpZoJKLAz1sn1YbpnxufRPc/TfqV
 9d1I3MV5Z5YOILaquek7LYxv1hEeUSa71uvADTK8ufMmbHyghtrSxxaoPr7pmmHVn1tA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=S+ftk/33ak27DCJeAb7bFFnQxlJ+JQ5N6OYVqUQ/seU=; b=k
 rixUkO/Tqcz7cEjzA/OFmAqe/GWIDPt2YpRQGgV13bdUztjqAEhJ3sG5kPOibzIzlMAHL2j7/LWA8
 Rx0oFvaiUB9MJkX7wZDulz48a3VIF8OUuOsKH4FTHC+2FziPxriWp93nELHktypK3u2TiMrifVPPf
 mWwLTFexKF7qz71U=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p2GcD-00076k-Qt for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 05 Dec 2022 18:55:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 70886612FA
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  5 Dec 2022 18:54:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9807C433D6;
 Mon,  5 Dec 2022 18:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670266489;
 bh=437LbcUfnuo/BgLD2e3LaAiMFiUyT2NdfywCgO5SUQs=;
 h=From:To:Cc:Subject:Date:From;
 b=cI/goZ3A7Tzy6BdhQQRpTHIYhI2d92B1t/MiFVRHE/wtRMdX+sKSaCHGfwVBCCKGB
 iSejFMdEMy1AdBdR1O6WQti2IOAvXi/YhugtZ8bmSgw22SyOGqsN/njKqe7aTC9eJP
 r4V7mMQKshBmbVRai/0KJMU1W1j0cbypJlQ2jnWQUZUn+62A/qXtVAKcGi6XUoSJ2Y
 9jdbIBfDprimvW07uhmHGJq4Rb57dJrkmwKmhEAi7ukRM7uKiCMex0PZHtvAeHAIk/
 rKkUV7oEkfHyMHmoYjJaqO+Nnc7w6oDXJyGl0ceQiGyysK5xIhaO1g60qxhysmjA7x
 csQoVJk2vYSVg==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Mon,  5 Dec 2022 10:54:28 -0800
Message-Id: <20221205185433.3479699-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.39.0.rc0.267.gcb52ba06e7-goog
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Let's descrbie it's read extent cache. Signed-off-by: Jaegeuk
 Kim <jaegeuk@kernel.org> --- fs/f2fs/extent_cache.c | 4 ++-- fs/f2fs/f2fs.h
 | 10 +++++----- fs/f2fs/inode.c | 2 +- fs/f2fs/node.c | 2 +- fs/f2fs/node.h
 | 2 +- fs/f2fs/segment.c [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p2GcD-00076k-Qt
Subject: [f2fs-dev] [PATCH 1/6] f2fs: specify extent cache for read
 explicitly
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Let's descrbie it's read extent cache.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/extent_cache.c |  4 ++--
 fs/f2fs/f2fs.h         | 10 +++++-----
 fs/f2fs/inode.c        |  2 +-
 fs/f2fs/node.c         |  2 +-
 fs/f2fs/node.h         |  2 +-
 fs/f2fs/segment.c      |  4 ++--
 fs/f2fs/super.c        | 16 ++++++++--------
 7 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
index 932c070173b9..8cd87aee0292 100644
--- a/fs/f2fs/extent_cache.c
+++ b/fs/f2fs/extent_cache.c
@@ -383,7 +383,7 @@ static void __f2fs_init_extent_tree(struct inode *inode, struct page *ipage)
 	if (!i_ext || !i_ext->len)
 		return;
 
-	get_extent_info(&ei, i_ext);
+	get_read_extent_info(&ei, i_ext);
 
 	write_lock(&et->lock);
 	if (atomic_read(&et->node_cnt))
@@ -710,7 +710,7 @@ unsigned int f2fs_shrink_extent_tree(struct f2fs_sb_info *sbi, int nr_shrink)
 	unsigned int node_cnt = 0, tree_cnt = 0;
 	int remained;
 
-	if (!test_opt(sbi, EXTENT_CACHE))
+	if (!test_opt(sbi, READ_EXTENT_CACHE))
 		return 0;
 
 	if (!atomic_read(&sbi->total_zombie_tree))
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index eb8c27c4e5fc..1c39f8145b61 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -92,7 +92,7 @@ extern const char *f2fs_fault_name[FAULT_MAX];
 #define F2FS_MOUNT_FLUSH_MERGE		0x00000400
 #define F2FS_MOUNT_NOBARRIER		0x00000800
 #define F2FS_MOUNT_FASTBOOT		0x00001000
-#define F2FS_MOUNT_EXTENT_CACHE		0x00002000
+#define F2FS_MOUNT_READ_EXTENT_CACHE	0x00002000
 #define F2FS_MOUNT_DATA_FLUSH		0x00008000
 #define F2FS_MOUNT_FAULT_INJECTION	0x00010000
 #define F2FS_MOUNT_USRQUOTA		0x00080000
@@ -600,7 +600,7 @@ enum {
 #define F2FS_MIN_EXTENT_LEN	64	/* minimum extent length */
 
 /* number of extent info in extent cache we try to shrink */
-#define EXTENT_CACHE_SHRINK_NUMBER	128
+#define READ_EXTENT_CACHE_SHRINK_NUMBER	128
 
 #define RECOVERY_MAX_RA_BLOCKS		BIO_MAX_VECS
 #define RECOVERY_MIN_RA_BLOCKS		1
@@ -830,7 +830,7 @@ struct f2fs_inode_info {
 	loff_t original_i_size;		/* original i_size before atomic write */
 };
 
-static inline void get_extent_info(struct extent_info *ext,
+static inline void get_read_extent_info(struct extent_info *ext,
 					struct f2fs_extent *i_ext)
 {
 	ext->fofs = le32_to_cpu(i_ext->fofs);
@@ -838,7 +838,7 @@ static inline void get_extent_info(struct extent_info *ext,
 	ext->len = le32_to_cpu(i_ext->len);
 }
 
-static inline void set_raw_extent(struct extent_info *ext,
+static inline void set_raw_read_extent(struct extent_info *ext,
 					struct f2fs_extent *i_ext)
 {
 	i_ext->fofs = cpu_to_le32(ext->fofs);
@@ -4407,7 +4407,7 @@ static inline bool f2fs_may_extent_tree(struct inode *inode)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 
-	if (!test_opt(sbi, EXTENT_CACHE) ||
+	if (!test_opt(sbi, READ_EXTENT_CACHE) ||
 			is_inode_flag_set(inode, FI_NO_EXTENT) ||
 			(is_inode_flag_set(inode, FI_COMPRESSED_FILE) &&
 			 !f2fs_sb_has_readonly(sbi)))
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 577f109b4e1d..2c705c60019b 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -629,7 +629,7 @@ void f2fs_update_inode(struct inode *inode, struct page *node_page)
 
 	if (et) {
 		read_lock(&et->lock);
-		set_raw_extent(&et->largest, &ri->i_ext);
+		set_raw_read_extent(&et->largest, &ri->i_ext);
 		read_unlock(&et->lock);
 	} else {
 		memset(&ri->i_ext, 0, sizeof(ri->i_ext));
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index b9ee5a1176a0..84b147966080 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -85,7 +85,7 @@ bool f2fs_available_free_memory(struct f2fs_sb_info *sbi, int type)
 						sizeof(struct ino_entry);
 		mem_size >>= PAGE_SHIFT;
 		res = mem_size < ((avail_ram * nm_i->ram_thresh / 100) >> 1);
-	} else if (type == EXTENT_CACHE) {
+	} else if (type == READ_EXTENT_CACHE) {
 		mem_size = (atomic_read(&sbi->total_ext_tree) *
 				sizeof(struct extent_tree) +
 				atomic_read(&sbi->total_ext_node) *
diff --git a/fs/f2fs/node.h b/fs/f2fs/node.h
index 3c09cae058b0..0aa48704c77a 100644
--- a/fs/f2fs/node.h
+++ b/fs/f2fs/node.h
@@ -146,7 +146,7 @@ enum mem_type {
 	NAT_ENTRIES,	/* indicates the cached nat entry */
 	DIRTY_DENTS,	/* indicates dirty dentry pages */
 	INO_ENTRIES,	/* indicates inode entries */
-	EXTENT_CACHE,	/* indicates extent cache */
+	READ_EXTENT_CACHE,	/* indicates read extent cache */
 	DISCARD_CACHE,	/* indicates memory of cached discard cmds */
 	COMPRESS_PAGE,	/* indicates memory of cached compressed pages */
 	BASE_CHECK,	/* check kernel status */
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 9486ca49ecb1..51de358bc452 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -449,8 +449,8 @@ void f2fs_balance_fs_bg(struct f2fs_sb_info *sbi, bool from_bg)
 		return;
 
 	/* try to shrink extent cache when there is no enough memory */
-	if (!f2fs_available_free_memory(sbi, EXTENT_CACHE))
-		f2fs_shrink_extent_tree(sbi, EXTENT_CACHE_SHRINK_NUMBER);
+	if (!f2fs_available_free_memory(sbi, READ_EXTENT_CACHE))
+		f2fs_shrink_extent_tree(sbi, READ_EXTENT_CACHE_SHRINK_NUMBER);
 
 	/* check the # of cached NAT entries */
 	if (!f2fs_available_free_memory(sbi, NAT_ENTRIES))
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 79bf1faf4161..10bd03bbefec 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -814,10 +814,10 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 			set_opt(sbi, FASTBOOT);
 			break;
 		case Opt_extent_cache:
-			set_opt(sbi, EXTENT_CACHE);
+			set_opt(sbi, READ_EXTENT_CACHE);
 			break;
 		case Opt_noextent_cache:
-			clear_opt(sbi, EXTENT_CACHE);
+			clear_opt(sbi, READ_EXTENT_CACHE);
 			break;
 		case Opt_noinline_data:
 			clear_opt(sbi, INLINE_DATA);
@@ -1954,10 +1954,10 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
 		seq_puts(seq, ",barrier");
 	if (test_opt(sbi, FASTBOOT))
 		seq_puts(seq, ",fastboot");
-	if (test_opt(sbi, EXTENT_CACHE))
-		seq_puts(seq, ",extent_cache");
+	if (test_opt(sbi, READ_EXTENT_CACHE))
+		seq_puts(seq, ",read_extent_cache");
 	else
-		seq_puts(seq, ",noextent_cache");
+		seq_puts(seq, ",no_read_extent_cache");
 	if (test_opt(sbi, DATA_FLUSH))
 		seq_puts(seq, ",data_flush");
 
@@ -2076,7 +2076,7 @@ static void default_options(struct f2fs_sb_info *sbi)
 	set_opt(sbi, INLINE_XATTR);
 	set_opt(sbi, INLINE_DATA);
 	set_opt(sbi, INLINE_DENTRY);
-	set_opt(sbi, EXTENT_CACHE);
+	set_opt(sbi, READ_EXTENT_CACHE);
 	set_opt(sbi, NOHEAP);
 	clear_opt(sbi, DISABLE_CHECKPOINT);
 	set_opt(sbi, MERGE_CHECKPOINT);
@@ -2218,7 +2218,7 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 	bool need_restart_ckpt = false, need_stop_ckpt = false;
 	bool need_restart_flush = false, need_stop_flush = false;
 	bool need_restart_discard = false, need_stop_discard = false;
-	bool no_extent_cache = !test_opt(sbi, EXTENT_CACHE);
+	bool no_read_extent_cache = !test_opt(sbi, READ_EXTENT_CACHE);
 	bool enable_checkpoint = !test_opt(sbi, DISABLE_CHECKPOINT);
 	bool no_io_align = !F2FS_IO_ALIGNED(sbi);
 	bool no_atgc = !test_opt(sbi, ATGC);
@@ -2308,7 +2308,7 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 	}
 
 	/* disallow enable/disable extent_cache dynamically */
-	if (no_extent_cache == !!test_opt(sbi, EXTENT_CACHE)) {
+	if (no_read_extent_cache == !!test_opt(sbi, READ_EXTENT_CACHE)) {
 		err = -EINVAL;
 		f2fs_warn(sbi, "switch extent_cache option is not allowed");
 		goto restore_opts;
-- 
2.39.0.rc0.267.gcb52ba06e7-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
