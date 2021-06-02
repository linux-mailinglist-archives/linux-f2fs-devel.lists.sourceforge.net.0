Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6F039931F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Jun 2021 21:03:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1loW8y-0003A4-0P; Wed, 02 Jun 2021 19:03:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1loW8w-00039d-Lz
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 02 Jun 2021 19:03:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=484xfVfzWBN7vhWJywNperMvbQ9X349GhPoLaj7dJ+g=; b=ci2IkuGifnGr8+M+W+wbjhVlna
 rgO3+Zqk6+HzdMMQoxmQQGJEsChuzKBi6Q1hRf9Rflh4ArAA9A5p6bbhR1t2BxA+eN1BgX2EnEDV7
 vBhsV6RFhFwFwyIZzZEDn1dERNJ5W72G32C5iNCuGIlBL2UckBiIGB6PqoMDO8TgiLs8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=484xfVfzWBN7vhWJywNperMvbQ9X349GhPoLaj7dJ+g=; b=Ikw/7tOTI4OpKX4z/0vMCNRW5R
 hWo55Hj9v7EiX2TAqLJpsuSfob/O0N4XaM9EVNVQJBamEU2rsT8ZKwM11ZCa3Hr0SZu3jK7+/+bv/
 IR3ZsgsbGr5olEi9+BgZTilnhgrqjTor0mrU5fIToBTU50ydWVOaJfhxfBv2hWPpYXwQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1loW8s-0003iL-AM
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 02 Jun 2021 19:03:06 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8E155613E7;
 Wed,  2 Jun 2021 19:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622660577;
 bh=lajGP6QzgBhYP9J6PHuzTJjJCvfkqE4Ga+mXgAeu7oY=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=Q0OLqLuC+xKRjrfsHU/tuLp0RKYhdMj1F3dTebp17sQmXrGOs3un3CkBsRRtDsxzx
 4Ri5heUNuBrd9gp4Atn0xZMz4zcElHC9jfEPxKFgK88QGcbX3jcpjZnl0XmJafiTsx
 75f/HD6ldah1JMZ0V2Ybw9Yvw9EM7BhJlEvvfzCef23LuPMt9j1z+cbYYN6uxwpxMD
 zm2AUYYW2rYLzb71YqIyMwLP+74qS7cI7ASLeXuF9YD03yDaP2ERnSf+8uVtlHiD9j
 INXJEMLu0txKwXtGk62N3EJptrDwwMj9QxiUazBquVKYQB59IJ16ibLuh3RYZkQ92n
 98ZOKBgPITNWg==
Date: Wed, 2 Jun 2021 12:02:56 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Message-ID: <YLfV4EPW5Yw6wP+v@google.com>
References: <20210521190217.2484099-1-jaegeuk@kernel.org>
 <20210521190217.2484099-2-jaegeuk@kernel.org>
 <YK5UOfzwdZni7c5W@google.com> <YK5edM0igwfd47LV@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YK5edM0igwfd47LV@google.com>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1loW8s-0003iL-AM
Subject: Re: [f2fs-dev] [PATCH 2/2 v4] f2fs: support RO feature
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Given RO feature in superblock, we don't need to check provisioning/reserve
spaces and SSA area.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---

Change log from v3:
 - add feature sysfs entries

 fs/f2fs/f2fs.h    |  3 +++
 fs/f2fs/segment.c |  4 ++++
 fs/f2fs/super.c   | 37 +++++++++++++++++++++++++++++++------
 fs/f2fs/sysfs.c   |  8 ++++++++
 4 files changed, 46 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index eaf57b5f3c4b..8903c43091f8 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -168,6 +168,7 @@ struct f2fs_mount_info {
 #define F2FS_FEATURE_SB_CHKSUM		0x0800
 #define F2FS_FEATURE_CASEFOLD		0x1000
 #define F2FS_FEATURE_COMPRESSION	0x2000
+#define F2FS_FEATURE_RO			0x4000
 
 #define __F2FS_HAS_FEATURE(raw_super, mask)				\
 	((raw_super->feature & cpu_to_le32(mask)) != 0)
@@ -940,6 +941,7 @@ static inline void set_new_dnode(struct dnode_of_data *dn, struct inode *inode,
 #define	NR_CURSEG_DATA_TYPE	(3)
 #define NR_CURSEG_NODE_TYPE	(3)
 #define NR_CURSEG_INMEM_TYPE	(2)
+#define NR_CURSEG_RO_TYPE	(2)
 #define NR_CURSEG_PERSIST_TYPE	(NR_CURSEG_DATA_TYPE + NR_CURSEG_NODE_TYPE)
 #define NR_CURSEG_TYPE		(NR_CURSEG_INMEM_TYPE + NR_CURSEG_PERSIST_TYPE)
 
@@ -4128,6 +4130,7 @@ F2FS_FEATURE_FUNCS(verity, VERITY);
 F2FS_FEATURE_FUNCS(sb_chksum, SB_CHKSUM);
 F2FS_FEATURE_FUNCS(casefold, CASEFOLD);
 F2FS_FEATURE_FUNCS(compression, COMPRESSION);
+F2FS_FEATURE_FUNCS(readonly, RO);
 
 #ifdef CONFIG_BLK_DEV_ZONED
 static inline bool f2fs_blkz_is_seq(struct f2fs_sb_info *sbi, int devi,
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 380ef34e1a59..376c33ab71e2 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -4683,6 +4683,10 @@ static int sanity_check_curseg(struct f2fs_sb_info *sbi)
 		struct seg_entry *se = get_seg_entry(sbi, curseg->segno);
 		unsigned int blkofs = curseg->next_blkoff;
 
+		if (F2FS_HAS_FEATURE(sbi, F2FS_FEATURE_RO) &&
+			i != CURSEG_HOT_DATA && i != CURSEG_HOT_NODE)
+			continue;
+
 		sanity_check_seg_type(sbi, curseg->seg_type);
 
 		if (f2fs_test_bit(blkofs, se->cur_valid_map))
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 2fa59c674cd9..fb490383c767 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -555,7 +555,7 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 	int ret;
 
 	if (!options)
-		return 0;
+		goto default_check;
 
 	while ((p = strsep(&options, ",")) != NULL) {
 		int token;
@@ -1090,6 +1090,7 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 			return -EINVAL;
 		}
 	}
+default_check:
 #ifdef CONFIG_QUOTA
 	if (f2fs_check_quota_options(sbi))
 		return -EINVAL;
@@ -1162,6 +1163,11 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 	 */
 	if (F2FS_OPTION(sbi).active_logs != NR_CURSEG_TYPE)
 		F2FS_OPTION(sbi).whint_mode = WHINT_MODE_OFF;
+
+	if (F2FS_HAS_FEATURE(sbi, F2FS_FEATURE_RO) && !f2fs_readonly(sbi->sb)) {
+		f2fs_err(sbi, "Allow to mount readonly mode only");
+		return -EROFS;
+	}
 	return 0;
 }
 
@@ -1819,7 +1825,11 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
 static void default_options(struct f2fs_sb_info *sbi)
 {
 	/* init some FS parameters */
-	F2FS_OPTION(sbi).active_logs = NR_CURSEG_PERSIST_TYPE;
+	if (F2FS_HAS_FEATURE(sbi, F2FS_FEATURE_RO))
+		F2FS_OPTION(sbi).active_logs = NR_CURSEG_RO_TYPE;
+	else
+		F2FS_OPTION(sbi).active_logs = NR_CURSEG_PERSIST_TYPE;
+
 	F2FS_OPTION(sbi).inline_xattr_size = DEFAULT_INLINE_XATTR_ADDRS;
 	F2FS_OPTION(sbi).whint_mode = WHINT_MODE_OFF;
 	F2FS_OPTION(sbi).alloc_mode = ALLOC_MODE_DEFAULT;
@@ -2001,6 +2011,11 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 	if (f2fs_readonly(sb) && (*flags & SB_RDONLY))
 		goto skip;
 
+	if (F2FS_HAS_FEATURE(sbi, F2FS_FEATURE_RO) && !(*flags & SB_RDONLY)) {
+		err = -EROFS;
+		goto restore_opts;
+	}
+
 #ifdef CONFIG_QUOTA
 	if (!f2fs_readonly(sb) && (*flags & SB_RDONLY)) {
 		err = dquot_suspend(sb, -1);
@@ -3134,14 +3149,15 @@ int f2fs_sanity_check_ckpt(struct f2fs_sb_info *sbi)
 	ovp_segments = le32_to_cpu(ckpt->overprov_segment_count);
 	reserved_segments = le32_to_cpu(ckpt->rsvd_segment_count);
 
-	if (unlikely(fsmeta < F2FS_MIN_META_SEGMENTS ||
+	if (!F2FS_HAS_FEATURE(sbi, F2FS_FEATURE_RO) &&
+			unlikely(fsmeta < F2FS_MIN_META_SEGMENTS ||
 			ovp_segments == 0 || reserved_segments == 0)) {
 		f2fs_err(sbi, "Wrong layout: check mkfs.f2fs version");
 		return 1;
 	}
-
 	user_block_count = le64_to_cpu(ckpt->user_block_count);
-	segment_count_main = le32_to_cpu(raw_super->segment_count_main);
+	segment_count_main = le32_to_cpu(raw_super->segment_count_main) +
+			(F2FS_HAS_FEATURE(sbi, F2FS_FEATURE_RO) ? 1 : 0);
 	log_blocks_per_seg = le32_to_cpu(raw_super->log_blocks_per_seg);
 	if (!user_block_count || user_block_count >=
 			segment_count_main << log_blocks_per_seg) {
@@ -3172,6 +3188,10 @@ int f2fs_sanity_check_ckpt(struct f2fs_sb_info *sbi)
 		if (le32_to_cpu(ckpt->cur_node_segno[i]) >= main_segs ||
 			le16_to_cpu(ckpt->cur_node_blkoff[i]) >= blocks_per_seg)
 			return 1;
+
+		if (F2FS_HAS_FEATURE(sbi, F2FS_FEATURE_RO))
+			goto check_data;
+
 		for (j = i + 1; j < NR_CURSEG_NODE_TYPE; j++) {
 			if (le32_to_cpu(ckpt->cur_node_segno[i]) ==
 				le32_to_cpu(ckpt->cur_node_segno[j])) {
@@ -3182,10 +3202,15 @@ int f2fs_sanity_check_ckpt(struct f2fs_sb_info *sbi)
 			}
 		}
 	}
+check_data:
 	for (i = 0; i < NR_CURSEG_DATA_TYPE; i++) {
 		if (le32_to_cpu(ckpt->cur_data_segno[i]) >= main_segs ||
 			le16_to_cpu(ckpt->cur_data_blkoff[i]) >= blocks_per_seg)
 			return 1;
+
+		if (F2FS_HAS_FEATURE(sbi, F2FS_FEATURE_RO))
+			goto skip_cross;
+
 		for (j = i + 1; j < NR_CURSEG_DATA_TYPE; j++) {
 			if (le32_to_cpu(ckpt->cur_data_segno[i]) ==
 				le32_to_cpu(ckpt->cur_data_segno[j])) {
@@ -3207,7 +3232,7 @@ int f2fs_sanity_check_ckpt(struct f2fs_sb_info *sbi)
 			}
 		}
 	}
-
+skip_cross:
 	sit_bitmap_size = le32_to_cpu(ckpt->sit_ver_bitmap_bytesize);
 	nat_bitmap_size = le32_to_cpu(ckpt->nat_ver_bitmap_bytesize);
 
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 09e3f258eb52..62fbe4f20dd6 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -158,6 +158,9 @@ static ssize_t features_show(struct f2fs_attr *a,
 	if (f2fs_sb_has_casefold(sbi))
 		len += scnprintf(buf + len, PAGE_SIZE - len, "%s%s",
 				len ? ", " : "", "casefold");
+	if (f2fs_sb_has_readonly(sbi))
+		len += scnprintf(buf + len, PAGE_SIZE - len, "%s%s",
+				len ? ", " : "", "readonly");
 	if (f2fs_sb_has_compression(sbi))
 		len += scnprintf(buf + len, PAGE_SIZE - len, "%s%s",
 				len ? ", " : "", "compression");
@@ -578,6 +581,7 @@ enum feat_id {
 	FEAT_SB_CHECKSUM,
 	FEAT_CASEFOLD,
 	FEAT_COMPRESSION,
+	FEAT_RO,
 	FEAT_TEST_DUMMY_ENCRYPTION_V2,
 };
 
@@ -599,6 +603,7 @@ static ssize_t f2fs_feature_show(struct f2fs_attr *a,
 	case FEAT_SB_CHECKSUM:
 	case FEAT_CASEFOLD:
 	case FEAT_COMPRESSION:
+	case FEAT_RO:
 	case FEAT_TEST_DUMMY_ENCRYPTION_V2:
 		return sprintf(buf, "supported\n");
 	}
@@ -723,12 +728,14 @@ F2FS_FEATURE_RO_ATTR(sb_checksum, FEAT_SB_CHECKSUM);
 #ifdef CONFIG_UNICODE
 F2FS_FEATURE_RO_ATTR(casefold, FEAT_CASEFOLD);
 #endif
+F2FS_FEATURE_RO_ATTR(readonly, FEAT_RO);
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 F2FS_FEATURE_RO_ATTR(compression, FEAT_COMPRESSION);
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, compr_written_block, compr_written_block);
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, compr_saved_block, compr_saved_block);
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, compr_new_inode, compr_new_inode);
 #endif
+
 /* For ATGC */
 F2FS_RW_ATTR(ATGC_INFO, atgc_management, atgc_candidate_ratio, candidate_ratio);
 F2FS_RW_ATTR(ATGC_INFO, atgc_management, atgc_candidate_count, max_candidate_count);
@@ -834,6 +841,7 @@ static struct attribute *f2fs_feat_attrs[] = {
 #ifdef CONFIG_UNICODE
 	ATTR_LIST(casefold),
 #endif
+	ATTR_LIST(readonly),
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 	ATTR_LIST(compression),
 #endif
-- 
2.32.0.rc0.204.g9fa02ecfa5-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
