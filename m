Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F4E38CDD9
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 May 2021 21:02:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lkAQ9-0003OC-9T; Fri, 21 May 2021 19:02:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <jaegeuk@kernel.org>) id 1lkAQ7-0003O5-St
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 May 2021 19:02:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=G144qf9Ro9/94i+CjMqScI6v4Ok+4gIxxZ4KuL/yVGk=; b=FBW0DR7D8RMnS7g4g+HMx4iyvA
 HFCgEjLtZTP1++8tdiSfT6sfPI9Xur39RqPALRzWjCxsDNb3ydiYJVtg9qavnQ2MOJrB6mzfBkCVy
 wqjwu2GcI+wJICZkhzoF58W5kYF7hoPUraE39LjKb1UbnRriivyBFnvjM0fKZatThzuQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=G144qf9Ro9/94i+CjMqScI6v4Ok+4gIxxZ4KuL/yVGk=; b=NG3/mlvwYcUpXcyogv3BEfx1Go
 vBjDxjFO0osfWJB8ieA6PgYebq3QE1N1LldSFITx59pmqqBoa5TQs7nhCbU2viGKNvEzJz++gQOqB
 6Qe8V3ckstUdmca0X8v93byUcul1wzxTfu0TXgQzKoiHmOi895HOeb7bavOGp40eBJ14=;
Received: from [198.145.29.99] (helo=mail.kernel.org)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lkAPt-0006KO-R1
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 May 2021 19:02:51 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id ED6FE613AE;
 Fri, 21 May 2021 19:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621623745;
 bh=9dAAYfGKlNm1d/kBz0TkpkWwC4KouaitkPn8vJ/1a6Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Xt5vcR/DDiR1T1LcTgnw5qeu+MizIbc/PNjevzEC6oIny+YrIjO4cJvD7fNr7tr8W
 wIPRURguKitlWE2VUmV2gl3XnVjAUEzrataJSmrraPhoI64QOKf2yCuvP8cK/EZNxR
 dt0JPWjLns7EikxKTL7/NNf9cExiEDpZjdlcYdLUXKrajRNmfPowt+AkcM1a4ULb19
 KG3DSRRyt5hhlJjwdtHDWPhEGhYxE+I4I2Oi2VzoZ/UGRO9E2LHWYRZrYkILfi2SW2
 ykEsPO+/e0SsJ+/LWaLQSm4TjEqNUk+jqQuW+uGhEKZ1Qt97RLAG91F/UShxLBefFt
 r8+LC3UQOfQjw==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 21 May 2021 12:02:17 -0700
Message-Id: <20210521190217.2484099-2-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.31.1.818.g46aad6cb9e-goog
In-Reply-To: <20210521190217.2484099-1-jaegeuk@kernel.org>
References: <20210521190217.2484099-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: 0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 1.0 RDNS_NONE Delivered to internal network by a host with no rDNS
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lkAPt-0006KO-R1
Subject: [f2fs-dev] [PATCH 2/2] f2fs: support RO feature
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

Given RO feature in superblock, we don't need to check provisioning/reserve
spaces and SSA area.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/f2fs.h    |  2 ++
 fs/f2fs/segment.c |  3 +++
 fs/f2fs/super.c   | 35 +++++++++++++++++++++++++++++++----
 3 files changed, 36 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index c0bead0df66a..2c6913261586 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -168,6 +168,7 @@ struct f2fs_mount_info {
 #define F2FS_FEATURE_SB_CHKSUM		0x0800
 #define F2FS_FEATURE_CASEFOLD		0x1000
 #define F2FS_FEATURE_COMPRESSION	0x2000
+#define F2FS_FEATURE_RO			0x4000
 
 #define __F2FS_HAS_FEATURE(raw_super, mask)				\
 	((raw_super->feature & cpu_to_le32(mask)) != 0)
@@ -939,6 +940,7 @@ static inline void set_new_dnode(struct dnode_of_data *dn, struct inode *inode,
 #define	NR_CURSEG_DATA_TYPE	(3)
 #define NR_CURSEG_NODE_TYPE	(3)
 #define NR_CURSEG_INMEM_TYPE	(2)
+#define NR_CURSEG_RO_TYPE	(2)
 #define NR_CURSEG_PERSIST_TYPE	(NR_CURSEG_DATA_TYPE + NR_CURSEG_NODE_TYPE)
 #define NR_CURSEG_TYPE		(NR_CURSEG_INMEM_TYPE + NR_CURSEG_PERSIST_TYPE)
 
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 8668df7870d0..67cec8f858a2 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -4674,6 +4674,9 @@ static int sanity_check_curseg(struct f2fs_sb_info *sbi)
 {
 	int i;
 
+	if (__F2FS_HAS_FEATURE(sbi->raw_super, F2FS_FEATURE_RO))
+		return 0;
+
 	/*
 	 * In LFS/SSR curseg, .next_blkoff should point to an unused blkaddr;
 	 * In LFS curseg, all blkaddr after .next_blkoff should be unused.
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index b29de80ab60e..312bfab54693 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1819,7 +1819,11 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
 static void default_options(struct f2fs_sb_info *sbi)
 {
 	/* init some FS parameters */
-	F2FS_OPTION(sbi).active_logs = NR_CURSEG_PERSIST_TYPE;
+	if (__F2FS_HAS_FEATURE(sbi->raw_super, F2FS_FEATURE_RO))
+		F2FS_OPTION(sbi).active_logs = NR_CURSEG_RO_TYPE;
+	else
+		F2FS_OPTION(sbi).active_logs = NR_CURSEG_PERSIST_TYPE;
+
 	F2FS_OPTION(sbi).inline_xattr_size = DEFAULT_INLINE_XATTR_ADDRS;
 	F2FS_OPTION(sbi).whint_mode = WHINT_MODE_OFF;
 	F2FS_OPTION(sbi).alloc_mode = ALLOC_MODE_DEFAULT;
@@ -1994,6 +1998,11 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 	err = parse_options(sb, data, true);
 	if (err)
 		goto restore_opts;
+
+	if (__F2FS_HAS_FEATURE(sbi->raw_super, F2FS_FEATURE_RO) &&
+					!(*flags & SB_RDONLY))
+		goto restore_opts;
+
 	checkpoint_changed =
 			disable_checkpoint != test_opt(sbi, DISABLE_CHECKPOINT);
 
@@ -3137,16 +3146,18 @@ int f2fs_sanity_check_ckpt(struct f2fs_sb_info *sbi)
 	ovp_segments = le32_to_cpu(ckpt->overprov_segment_count);
 	reserved_segments = le32_to_cpu(ckpt->rsvd_segment_count);
 
+	if (__F2FS_HAS_FEATURE(sbi->raw_super, F2FS_FEATURE_RO))
+		goto no_reserved;
 	if (unlikely(fsmeta < F2FS_MIN_META_SEGMENTS ||
 			ovp_segments == 0 || reserved_segments == 0)) {
 		f2fs_err(sbi, "Wrong layout: check mkfs.f2fs version");
 		return 1;
 	}
-
+no_reserved:
 	user_block_count = le64_to_cpu(ckpt->user_block_count);
 	segment_count_main = le32_to_cpu(raw_super->segment_count_main);
 	log_blocks_per_seg = le32_to_cpu(raw_super->log_blocks_per_seg);
-	if (!user_block_count || user_block_count >=
+	if (!user_block_count || user_block_count >
 			segment_count_main << log_blocks_per_seg) {
 		f2fs_err(sbi, "Wrong user_block_count: %u",
 			 user_block_count);
@@ -3175,6 +3186,10 @@ int f2fs_sanity_check_ckpt(struct f2fs_sb_info *sbi)
 		if (le32_to_cpu(ckpt->cur_node_segno[i]) >= main_segs ||
 			le16_to_cpu(ckpt->cur_node_blkoff[i]) >= blocks_per_seg)
 			return 1;
+
+		if (__F2FS_HAS_FEATURE(sbi->raw_super, F2FS_FEATURE_RO))
+			goto check_data;
+
 		for (j = i + 1; j < NR_CURSEG_NODE_TYPE; j++) {
 			if (le32_to_cpu(ckpt->cur_node_segno[i]) ==
 				le32_to_cpu(ckpt->cur_node_segno[j])) {
@@ -3185,10 +3200,15 @@ int f2fs_sanity_check_ckpt(struct f2fs_sb_info *sbi)
 			}
 		}
 	}
+check_data:
 	for (i = 0; i < NR_CURSEG_DATA_TYPE; i++) {
 		if (le32_to_cpu(ckpt->cur_data_segno[i]) >= main_segs ||
 			le16_to_cpu(ckpt->cur_data_blkoff[i]) >= blocks_per_seg)
 			return 1;
+
+		if (__F2FS_HAS_FEATURE(sbi->raw_super, F2FS_FEATURE_RO))
+			goto skip_cross;
+
 		for (j = i + 1; j < NR_CURSEG_DATA_TYPE; j++) {
 			if (le32_to_cpu(ckpt->cur_data_segno[i]) ==
 				le32_to_cpu(ckpt->cur_data_segno[j])) {
@@ -3210,7 +3230,7 @@ int f2fs_sanity_check_ckpt(struct f2fs_sb_info *sbi)
 			}
 		}
 	}
-
+skip_cross:
 	sit_bitmap_size = le32_to_cpu(ckpt->sit_ver_bitmap_bytesize);
 	nat_bitmap_size = le32_to_cpu(ckpt->nat_ver_bitmap_bytesize);
 
@@ -3703,6 +3723,13 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 	if (err)
 		goto free_options;
 
+	if (__F2FS_HAS_FEATURE(sbi->raw_super, F2FS_FEATURE_RO) &&
+					!f2fs_readonly(sbi->sb)) {
+		f2fs_info(sbi, "Allow to mount readonly mode only");
+		err = -EINVAL;
+		goto free_options;
+	}
+
 	sb->s_maxbytes = max_file_blocks(NULL) <<
 				le32_to_cpu(raw_super->log_blocksize);
 	sb->s_max_links = F2FS_LINK_MAX;
-- 
2.31.1.818.g46aad6cb9e-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
