Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D29C7130BC
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 27 May 2023 01:55:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q2hH3-00039i-MG;
	Fri, 26 May 2023 23:55:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1q2hGe-00039N-JN
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 May 2023 23:54:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8OnaExSFP4AVfLpvHbpMIlFZoQbWNm/5J9fgGalZmME=; b=SWLj0HIzre0lVd0XH01JSKYnDb
 E63bEXHoWeetLHlv3McCp1Og+/cnXMIV8Tc82AKgTyOgLi3xQtKkGYOSKewcYtUloDQMSEkCZH6Fn
 WvphPVx38uvHWx68LoJ8M/Zf1wSQp3i0o+MzJu3QPv3D4ED5jiKS0NcExP3yYYpqxvNU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8OnaExSFP4AVfLpvHbpMIlFZoQbWNm/5J9fgGalZmME=; b=B6iPC0JnJ4Cmkk4JetkrhEwxy2
 HiCcXkdfZwFc2hd9mrlajFBRwnUNsCD90qFD8K5RBPJRcni92sPqne3AorMd22cno1KDWugfHn5c5
 nUQs6XJgPDQaqnNxOEwnVuNkoWbZg/5enU2aZ/jbG4zg4LfxPdmjkPKXXO4VM7sgBaJU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q2hGb-003i5R-JJ for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 May 2023 23:54:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E84F365485
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 26 May 2023 23:54:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DE45C433D2;
 Fri, 26 May 2023 23:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685145275;
 bh=tK3snaDL19hLOHDBFDkGvQGSEMcnHq+wXMO45KkfLuk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ORSQJ3eqcRdNU2DO803b4Siy9mhJGZd4wwFQxUi+rDEGRRGPqCjRK72hCqzhir7pj
 LyXOBin2IQDrmg8cxTc2Qsevn996ZFYwx96d4fN/1wVs51yOEcytYPuPXbh+NUTFVu
 5ugdsyjqXoZIU6FICsinYLhDYPxiJFSKZIsxCjYGs7QAD6+JTBdIJNvwq+PRiBj4Ii
 tt70lgzJVFiSn5VrU826RxdzJoAR3ahgturU5Eod+mIY74+r8V1+Kt/WXi6fIzJsCH
 8EWa6HWbAoU/uOWmLlV4hbrPNB2yehBTE/JHI57ro+WfLytxZie5GDfx2KNomDQtly
 Xw6TfkBwb6QTQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Sat, 27 May 2023 07:54:23 +0800
Message-Id: <20230526235423.3591350-2-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230526235423.3591350-1-chao@kernel.org>
References: <20230526235423.3591350-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  During formatting device,
 node/data block and filesystem metatdata
 related to same inode were updated in separated functions, e.g. for root
 inode: - f2fs_write_root_inode() updates root inode's block [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q2hGb-003i5R-JJ
Subject: [f2fs-dev] [PATCH v3 4/4] mkfs.f2fs: refactor format flow for
 cleanup
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

During formatting device, node/data block and filesystem metatdata related
to same inode were updated in separated functions, e.g. for root inode:
- f2fs_write_root_inode() updates root inode's block
- f2fs_write_check_point_pack updates its nat/sit journal, summary block

Result in:
- there are some redundant codes in between f2fs_write_check_point_pack()
and functions in f2fs_create_root_dir().
- readability is bad due to filesystem meta and data/node updates in
separated places.
- bad scalability if we want to add more default inode.

So that, this patch introduces below functions:
- update_sit_journal
- update_nat_jounral
- update_summary_entry

Then use them to update inode related metadata into cache in below
functions:
- f2fs_write_root_inode
- f2fs_add_default_dentry_root
- f2fs_write_qf_inode
- f2fs_write_default_quota
- f2fs_write_lpf_inode
- f2fs_write_lpf_inode

Finally, f2fs_write_check_point_pack() can write back cached metadata
into CP area directly.

Signed-off-by: Chao Yu <chao@kernel.org>
---
v3:
- remove trailing whitespace
 include/f2fs_fs.h  | 235 ++++++++++++------------
 mkfs/f2fs_format.c | 447 ++++++++++++++++++++++-----------------------
 2 files changed, 336 insertions(+), 346 deletions(-)

diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 05d27ba..e441749 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -494,119 +494,6 @@ typedef struct {
 #define ALIGN_DOWN(addrs, size)	(((addrs) / (size)) * (size))
 #define ALIGN_UP(addrs, size)	ALIGN_DOWN(((addrs) + (size) - 1), (size))
 
-struct f2fs_configuration {
-	uint32_t conf_reserved_sections;
-	uint32_t reserved_segments;
-	uint32_t new_reserved_segments;
-	int sparse_mode;
-	int zoned_mode;
-	int zoned_model;
-	size_t zone_blocks;
-	double overprovision;
-	double new_overprovision;
-	uint32_t cur_seg[6];
-	uint32_t segs_per_sec;
-	uint32_t secs_per_zone;
-	uint32_t segs_per_zone;
-	uint32_t start_sector;
-	uint32_t total_segments;
-	uint32_t sector_size;
-	uint64_t device_size;
-	uint64_t total_sectors;
-	uint64_t wanted_total_sectors;
-	uint64_t wanted_sector_size;
-	uint64_t target_sectors;
-	uint32_t sectors_per_blk;
-	uint32_t blks_per_seg;
-	__u8 init_version[VERSION_LEN + 1];
-	__u8 sb_version[VERSION_LEN + 1];
-	__u8 version[VERSION_LEN + 1];
-	char *vol_label;
-	char *vol_uuid;
-	uint16_t s_encoding;
-	uint16_t s_encoding_flags;
-	int heap;
-	int32_t kd;
-	int32_t dump_fd;
-	struct device_info devices[MAX_DEVICES];
-	int ndevs;
-	char *extension_list[2];
-	const char *rootdev_name;
-	int dbg_lv;
-	int show_dentry;
-	int trim;
-	int trimmed;
-	int func;
-	void *private;
-	int dry_run;
-	int no_kernel_check;
-	int fix_on;
-	int force;
-	int defset;
-	int bug_on;
-	int force_stop;
-	int abnormal_stop;
-	int fs_errors;
-	int bug_nat_bits;
-	bool quota_fixed;
-	int alloc_failed;
-	int auto_fix;
-	int layout;
-	int show_file_map;
-	u64 show_file_map_max_offset;
-	int quota_fix;
-	int preen_mode;
-	int ro;
-	int preserve_limits;		/* preserve quota limits */
-	int large_nat_bitmap;
-	int fix_chksum;			/* fix old cp.chksum position */
-	__le32 feature;			/* defined features */
-	unsigned int quota_bits;	/* quota bits */
-	time_t fixed_time;
-
-	/* mkfs parameters */
-	int fake_seed;
-	uint32_t next_free_nid;
-	uint32_t quota_inum;
-	uint32_t quota_dnum;
-	uint32_t lpf_inum;
-	uint32_t lpf_dnum;
-	uint32_t lpf_ino;
-	uint32_t root_uid;
-	uint32_t root_gid;
-
-	/* defragmentation parameters */
-	int defrag_shrink;
-	uint64_t defrag_start;
-	uint64_t defrag_len;
-	uint64_t defrag_target;
-
-	/* sload parameters */
-	char *from_dir;
-	char *mount_point;
-	char *target_out_dir;
-	char *fs_config_file;
-#ifdef HAVE_LIBSELINUX
-	struct selinux_opt seopt_file[8];
-	int nr_opt;
-#endif
-	int preserve_perms;
-
-	/* resize parameters */
-	int safe_resize;
-
-	/* precomputed fs UUID checksum for seeding other checksums */
-	uint32_t chksum_seed;
-
-	/* cache parameters */
-	dev_cache_config_t cache_config;
-
-	/* compression support for sload.f2fs */
-	compress_config_t compress;
-
-	block_t curseg_offset[6];
-};
-
 #ifdef CONFIG_64BIT
 #define BITS_PER_LONG	64
 #else
@@ -721,6 +608,12 @@ enum {
 	NO_CHECK_TYPE
 };
 
+enum {
+	CURSEG_RO_HOT_DATA,
+	CURSEG_RO_HOT_NODE,
+	NR_RO_CURSEG_TYPE,
+};
+
 #define F2FS_MIN_SEGMENTS	9 /* SB + 2 (CP + SIT + NAT) + SSA + MAIN */
 
 /*
@@ -749,7 +642,7 @@ enum {
 #define F2FS_META_INO(sbi)	(sbi->meta_ino_num)
 
 #define F2FS_MAX_QUOTAS		3
-#define QUOTA_DATA(i)		(2)
+#define QUOTA_DATA		2
 #define QUOTA_INO(sb,t)	(le32_to_cpu((sb)->qf_ino[t]))
 
 /*
@@ -1471,6 +1364,120 @@ enum {
 	SSR
 };
 
+#define MAX_CACHE_SUMS			8
+
+struct f2fs_configuration {
+	uint32_t conf_reserved_sections;
+	uint32_t reserved_segments;
+	uint32_t new_reserved_segments;
+	int sparse_mode;
+	int zoned_mode;
+	int zoned_model;
+	size_t zone_blocks;
+	double overprovision;
+	double new_overprovision;
+	uint32_t cur_seg[NR_CURSEG_TYPE];
+	uint32_t segs_per_sec;
+	uint32_t secs_per_zone;
+	uint32_t segs_per_zone;
+	uint32_t start_sector;
+	uint32_t total_segments;
+	uint32_t sector_size;
+	uint64_t device_size;
+	uint64_t total_sectors;
+	uint64_t wanted_total_sectors;
+	uint64_t wanted_sector_size;
+	uint64_t target_sectors;
+	uint32_t sectors_per_blk;
+	uint32_t blks_per_seg;
+	__u8 init_version[VERSION_LEN + 1];
+	__u8 sb_version[VERSION_LEN + 1];
+	__u8 version[VERSION_LEN + 1];
+	char *vol_label;
+	char *vol_uuid;
+	uint16_t s_encoding;
+	uint16_t s_encoding_flags;
+	int heap;
+	int32_t kd;
+	int32_t dump_fd;
+	struct device_info devices[MAX_DEVICES];
+	int ndevs;
+	char *extension_list[2];
+	const char *rootdev_name;
+	int dbg_lv;
+	int show_dentry;
+	int trim;
+	int trimmed;
+	int func;
+	void *private;
+	int dry_run;
+	int no_kernel_check;
+	int fix_on;
+	int force;
+	int defset;
+	int bug_on;
+	int force_stop;
+	int abnormal_stop;
+	int fs_errors;
+	int bug_nat_bits;
+	bool quota_fixed;
+	int alloc_failed;
+	int auto_fix;
+	int layout;
+	int show_file_map;
+	u64 show_file_map_max_offset;
+	int quota_fix;
+	int preen_mode;
+	int ro;
+	int preserve_limits;		/* preserve quota limits */
+	int large_nat_bitmap;
+	int fix_chksum;			/* fix old cp.chksum position */
+	__le32 feature;			/* defined features */
+	unsigned int quota_bits;	/* quota bits */
+	time_t fixed_time;
+
+	/* mkfs parameters */
+	int fake_seed;
+	uint32_t next_free_nid;
+	uint32_t lpf_ino;
+	uint32_t root_uid;
+	uint32_t root_gid;
+
+	/* defragmentation parameters */
+	int defrag_shrink;
+	uint64_t defrag_start;
+	uint64_t defrag_len;
+	uint64_t defrag_target;
+
+	/* sload parameters */
+	char *from_dir;
+	char *mount_point;
+	char *target_out_dir;
+	char *fs_config_file;
+#ifdef HAVE_LIBSELINUX
+	struct selinux_opt seopt_file[8];
+	int nr_opt;
+#endif
+	int preserve_perms;
+
+	/* resize parameters */
+	int safe_resize;
+
+	/* precomputed fs UUID checksum for seeding other checksums */
+	uint32_t chksum_seed;
+
+	/* cache parameters */
+	dev_cache_config_t cache_config;
+
+	/* compression support for sload.f2fs */
+	compress_config_t compress;
+
+	block_t curseg_offset[NR_CURSEG_TYPE];
+	struct f2fs_journal sit_jnl;
+	struct f2fs_journal nat_jnl;
+	struct f2fs_summary sum[NR_CURSEG_TYPE][MAX_CACHE_SUMS];
+};
+
 extern int utf8_to_utf16(char *, const char *, size_t, size_t);
 extern int utf16_to_utf8(char *, const char *, size_t, size_t);
 extern int log_base_2(uint32_t);
diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
index 2ca5f48..1027164 100644
--- a/mkfs/f2fs_format.c
+++ b/mkfs/f2fs_format.c
@@ -14,6 +14,7 @@
 #include <string.h>
 #include <unistd.h>
 #include <f2fs_fs.h>
+#include <assert.h>
 
 #ifdef HAVE_SYS_STAT_H
 #include <sys/stat.h>
@@ -687,7 +688,7 @@ static int f2fs_init_nat_area(void)
 
 static int f2fs_write_check_point_pack(void)
 {
-	struct f2fs_summary_block *sum = NULL;
+	struct f2fs_summary_block *sum;
 	struct f2fs_journal *journal;
 	uint32_t blk_size_bytes;
 	uint32_t nat_bits_bytes, nat_bits_blocks;
@@ -698,8 +699,7 @@ static int f2fs_write_check_point_pack(void)
 	char *cp_payload = NULL;
 	char *sum_compact, *sum_compact_p;
 	struct f2fs_summary *sum_entry;
-	enum quota_type qtype;
-	int off;
+	unsigned short vblocks;
 	int ret = -1;
 
 	cp = calloc(F2FS_BLKSIZE, 1);
@@ -750,10 +750,10 @@ static int f2fs_write_check_point_pack(void)
 		set_cp(cur_data_segno[i], 0xffffffff);
 	}
 
-	set_cp(cur_node_blkoff[0], 1 + c.quota_inum + c.lpf_inum);
-	set_cp(cur_data_blkoff[0], 1 + c.quota_dnum + c.lpf_dnum);
-	set_cp(valid_block_count, 2 + c.quota_inum + c.quota_dnum +
-			c.lpf_inum + c.lpf_dnum);
+	set_cp(cur_node_blkoff[0], c.curseg_offset[CURSEG_HOT_NODE]);
+	set_cp(cur_data_blkoff[0], c.curseg_offset[CURSEG_HOT_DATA]);
+	set_cp(valid_block_count, c.curseg_offset[CURSEG_HOT_NODE] +
+					c.curseg_offset[CURSEG_HOT_DATA]);
 	set_cp(rsvd_segment_count, c.reserved_segments);
 
 	/*
@@ -824,8 +824,8 @@ static int f2fs_write_check_point_pack(void)
 
 	set_cp(ckpt_flags, flags);
 	set_cp(cp_pack_start_sum, 1 + get_sb(cp_payload));
-	set_cp(valid_node_count, 1 + c.quota_inum + c.lpf_inum);
-	set_cp(valid_inode_count, 1 + c.quota_inum + c.lpf_inum);
+	set_cp(valid_node_count, c.curseg_offset[CURSEG_HOT_NODE]);
+	set_cp(valid_inode_count, c.curseg_offset[CURSEG_HOT_NODE]);
 	set_cp(next_free_nid, c.next_free_nid);
 	set_cp(sit_ver_bitmap_bytesize, ((get_sb(segment_count_sit) / 2) <<
 			get_sb(log_blocks_per_seg)) / 8);
@@ -883,126 +883,58 @@ static int f2fs_write_check_point_pack(void)
 	 * | cold data summary |
 	 * +-------------------+
 	*/
-	memset(sum, 0, sizeof(struct f2fs_summary_block));
-	SET_SUM_TYPE((&sum->footer), SUM_TYPE_DATA);
-
-	journal = &sum->journal;
-	journal->n_nats = cpu_to_le16(1 + c.quota_inum + c.lpf_inum);
-	journal->nat_j.entries[0].nid = sb->root_ino;
-	journal->nat_j.entries[0].ne.version = 0;
-	journal->nat_j.entries[0].ne.ino = sb->root_ino;
-	journal->nat_j.entries[0].ne.block_addr = cpu_to_le32(
-			get_sb(main_blkaddr) +
-			get_cp(cur_node_segno[0]) * c.blks_per_seg);
-
-	for (qtype = 0, i = 1; qtype < F2FS_MAX_QUOTAS; qtype++) {
-		if (!((1 << qtype) & c.quota_bits))
-			continue;
-		journal->nat_j.entries[i].nid = sb->qf_ino[qtype];
-		journal->nat_j.entries[i].ne.version = 0;
-		journal->nat_j.entries[i].ne.ino = sb->qf_ino[qtype];
-		journal->nat_j.entries[i].ne.block_addr = cpu_to_le32(
-				get_sb(main_blkaddr) +
-				get_cp(cur_node_segno[0]) *
-				c.blks_per_seg + i);
-		i++;
-	}
-
-	if (c.lpf_inum) {
-		journal->nat_j.entries[i].nid = cpu_to_le32(c.lpf_ino);
-		journal->nat_j.entries[i].ne.version = 0;
-		journal->nat_j.entries[i].ne.ino = cpu_to_le32(c.lpf_ino);
-		journal->nat_j.entries[i].ne.block_addr = cpu_to_le32(
-				get_sb(main_blkaddr) +
-				get_cp(cur_node_segno[0]) *
-				c.blks_per_seg + i);
-	}
 
+	/* nat_sjournal */
+	journal = &c.nat_jnl;
 	memcpy(sum_compact_p, &journal->n_nats, SUM_JOURNAL_SIZE);
 	sum_compact_p += SUM_JOURNAL_SIZE;
 
-	memset(sum, 0, sizeof(struct f2fs_summary_block));
-
-	/* inode sit for root */
-	if (c.feature & cpu_to_le32(F2FS_FEATURE_RO))
-		journal->n_sits = cpu_to_le16(2);
-	else
-		journal->n_sits = cpu_to_le16(6);
-
-	journal->sit_j.entries[0].segno = cp->cur_node_segno[0];
-	journal->sit_j.entries[0].se.vblocks =
-				cpu_to_le16((CURSEG_HOT_NODE << 10) |
-						(1 + c.quota_inum + c.lpf_inum));
-	f2fs_set_bit(0, (char *)journal->sit_j.entries[0].se.valid_map);
-	for (i = 1; i <= c.quota_inum; i++)
-		f2fs_set_bit(i, (char *)journal->sit_j.entries[0].se.valid_map);
-	if (c.lpf_inum)
-		f2fs_set_bit(i, (char *)journal->sit_j.entries[0].se.valid_map);
+	/* sit_journal */
+	journal = &c.sit_jnl;
 
 	if (c.feature & cpu_to_le32(F2FS_FEATURE_RO)) {
-		/* data sit for root */
-		journal->sit_j.entries[1].segno = cp->cur_data_segno[0];
-		journal->sit_j.entries[1].se.vblocks =
-					cpu_to_le16((CURSEG_HOT_DATA << 10) |
-							(1 + c.quota_dnum + c.lpf_dnum));
-		f2fs_set_bit(0, (char *)journal->sit_j.entries[1].se.valid_map);
-		for (i = 1; i <= c.quota_dnum; i++)
-			f2fs_set_bit(i, (char *)journal->sit_j.entries[1].se.valid_map);
-		if (c.lpf_dnum)
-			f2fs_set_bit(i, (char *)journal->sit_j.entries[1].se.valid_map);
+		i = CURSEG_RO_HOT_DATA;
+		vblocks = le16_to_cpu(journal->sit_j.entries[i].se.vblocks);
+		journal->sit_j.entries[i].segno = cp->cur_data_segno[0];
+		journal->sit_j.entries[i].se.vblocks =
+				cpu_to_le16(vblocks | (CURSEG_HOT_DATA << 10));
+
+		i = CURSEG_RO_HOT_NODE;
+		vblocks = le16_to_cpu(journal->sit_j.entries[i].se.vblocks);
+		journal->sit_j.entries[i].segno = cp->cur_node_segno[0];
+		journal->sit_j.entries[i].se.vblocks |=
+				cpu_to_le16(vblocks | (CURSEG_HOT_NODE << 10));
+
+		journal->n_sits = cpu_to_le16(2);
 	} else {
-		journal->sit_j.entries[1].segno = cp->cur_node_segno[1];
-		journal->sit_j.entries[1].se.vblocks =
-					cpu_to_le16((CURSEG_WARM_NODE << 10));
-		journal->sit_j.entries[2].segno = cp->cur_node_segno[2];
-		journal->sit_j.entries[2].se.vblocks =
-					cpu_to_le16((CURSEG_COLD_NODE << 10));
-
-		/* data sit for root */
-		journal->sit_j.entries[3].segno = cp->cur_data_segno[0];
-		journal->sit_j.entries[3].se.vblocks =
-					cpu_to_le16((CURSEG_HOT_DATA << 10) |
-							(1 + c.quota_dnum + c.lpf_dnum));
-		f2fs_set_bit(0, (char *)journal->sit_j.entries[3].se.valid_map);
-		for (i = 1; i <= c.quota_dnum; i++)
-			f2fs_set_bit(i, (char *)journal->sit_j.entries[3].se.valid_map);
-		if (c.lpf_dnum)
-			f2fs_set_bit(i, (char *)journal->sit_j.entries[3].se.valid_map);
-
-		journal->sit_j.entries[4].segno = cp->cur_data_segno[1];
-		journal->sit_j.entries[4].se.vblocks =
-					cpu_to_le16((CURSEG_WARM_DATA << 10));
-		journal->sit_j.entries[5].segno = cp->cur_data_segno[2];
-		journal->sit_j.entries[5].se.vblocks =
-					cpu_to_le16((CURSEG_COLD_DATA << 10));
+		for (i = CURSEG_HOT_DATA; i < NR_CURSEG_TYPE; i++) {
+			if (i < NR_CURSEG_DATA_TYPE)
+				journal->sit_j.entries[i].segno =
+					cp->cur_data_segno[i];
+
+			else
+				journal->sit_j.entries[i].segno =
+					cp->cur_node_segno[i - NR_CURSEG_DATA_TYPE];
+
+			vblocks =
+				le16_to_cpu(journal->sit_j.entries[i].se.vblocks);
+			journal->sit_j.entries[i].se.vblocks =
+						cpu_to_le16(vblocks | (i << 10));
+		}
+
+		journal->n_sits = cpu_to_le16(6);
 	}
 
 	memcpy(sum_compact_p, &journal->n_sits, SUM_JOURNAL_SIZE);
 	sum_compact_p += SUM_JOURNAL_SIZE;
 
 	/* hot data summary */
-	sum_entry = (struct f2fs_summary *)sum_compact_p;
-	sum_entry->nid = sb->root_ino;
-	sum_entry->ofs_in_node = 0;
-
-	off = 1;
-	for (qtype = 0; qtype < F2FS_MAX_QUOTAS; qtype++) {
-		int j;
-
-		if (!((1 << qtype) & c.quota_bits))
-			continue;
-
-		for (j = 0; j < QUOTA_DATA(qtype); j++) {
-			(sum_entry + off + j)->nid = sb->qf_ino[qtype];
-			(sum_entry + off + j)->ofs_in_node = cpu_to_le16(j);
-		}
-		off += QUOTA_DATA(qtype);
-	}
+	memset(sum, 0, sizeof(struct f2fs_summary_block));
+	SET_SUM_TYPE((&sum->footer), SUM_TYPE_DATA);
 
-	if (c.lpf_dnum) {
-		(sum_entry + off)->nid = cpu_to_le32(c.lpf_ino);
-		(sum_entry + off)->ofs_in_node = 0;
-	}
+	sum_entry = (struct f2fs_summary *)sum_compact_p;
+	memcpy(sum_entry, c.sum[CURSEG_HOT_DATA],
+			sizeof(struct f2fs_summary) * MAX_CACHE_SUMS);
 
 	/* warm data summary, nothing to do */
 	/* cold data summary, nothing to do */
@@ -1018,21 +950,8 @@ static int f2fs_write_check_point_pack(void)
 	/* Prepare and write Segment summary for HOT_NODE */
 	memset(sum, 0, sizeof(struct f2fs_summary_block));
 	SET_SUM_TYPE((&sum->footer), SUM_TYPE_NODE);
-
-	sum->entries[0].nid = sb->root_ino;
-	sum->entries[0].ofs_in_node = 0;
-	for (qtype = i = 0; qtype < F2FS_MAX_QUOTAS; qtype++) {
-		if (!((1 << qtype) & c.quota_bits))
-			continue;
-		sum->entries[1 + i].nid = sb->qf_ino[qtype];
-		sum->entries[1 + i].ofs_in_node = 0;
-		i++;
-	}
-	if (c.lpf_inum) {
-		i++;
-		sum->entries[i].nid = cpu_to_le32(c.lpf_ino);
-		sum->entries[i].ofs_in_node = 0;
-	}
+	memcpy(sum->entries, c.sum[CURSEG_HOT_NODE],
+			sizeof(struct f2fs_summary) * MAX_CACHE_SUMS);
 
 	cp_seg_blk++;
 	DBG(1, "\tWriting Segment summary for HOT_NODE, at offset 0x%08"PRIx64"\n",
@@ -1198,7 +1117,8 @@ static int f2fs_discard_obsolete_dnode(void)
 	offset += c.cur_seg[CURSEG_WARM_NODE] * c.blks_per_seg;
 
 	last_inode_pos = start_inode_pos +
-		c.cur_seg[CURSEG_HOT_NODE] * c.blks_per_seg + c.quota_inum + c.lpf_inum;
+		c.cur_seg[CURSEG_HOT_NODE] * c.blks_per_seg +
+		c.curseg_offset[CURSEG_COLD_NODE] - 1;
 
 	do {
 		if (offset < get_sb(main_blkaddr) || offset >= end_blkaddr)
@@ -1230,19 +1150,124 @@ static int f2fs_discard_obsolete_dnode(void)
 }
 #endif
 
-static block_t alloc_next_free_block(int curseg_type, int blkcnt)
+static block_t alloc_next_free_block(int curseg_type)
 {
 	block_t blkaddr;
 
 	blkaddr = get_sb(main_blkaddr) +
-		c.cur_seg[curseg_type] * c.blks_per_seg +
-		c.curseg_offset[curseg_type];
+			c.cur_seg[curseg_type] * c.blks_per_seg +
+			c.curseg_offset[curseg_type];
 
-	c.curseg_offset[curseg_type] += blkcnt;
+	c.curseg_offset[curseg_type]++;
 
 	return blkaddr;
 }
 
+void update_sit_journal(int curseg_type)
+{
+	struct f2fs_journal *sit_jnl = &c.sit_jnl;
+	unsigned short vblocks;
+	int idx = curseg_type;
+
+	if (c.feature & cpu_to_le32(F2FS_FEATURE_RO)) {
+		if (curseg_type < NR_CURSEG_DATA_TYPE)
+			idx = CURSEG_RO_HOT_DATA;
+		else
+			idx = CURSEG_RO_HOT_NODE;
+	}
+
+	f2fs_set_bit(c.curseg_offset[curseg_type] - 1,
+		(char *)sit_jnl->sit_j.entries[idx].se.valid_map);
+
+	vblocks = le16_to_cpu(sit_jnl->sit_j.entries[idx].se.vblocks);
+	sit_jnl->sit_j.entries[idx].se.vblocks = cpu_to_le16(vblocks + 1);
+}
+
+void update_nat_journal(nid_t nid, block_t blkaddr)
+{
+	struct f2fs_journal *nat_jnl = &c.nat_jnl;
+	unsigned short n_nats = le16_to_cpu(nat_jnl->n_nats);
+
+	nat_jnl->nat_j.entries[n_nats].nid = cpu_to_le32(nid);
+	nat_jnl->nat_j.entries[n_nats].ne.version = 0;
+	nat_jnl->nat_j.entries[n_nats].ne.ino = cpu_to_le32(nid);
+	nat_jnl->nat_j.entries[n_nats].ne.block_addr = cpu_to_le32(blkaddr);
+	nat_jnl->n_nats = cpu_to_le16(n_nats + 1);
+}
+
+void update_summary_entry(int curseg_type, nid_t nid,
+					unsigned short ofs_in_node)
+{
+	struct f2fs_summary *sum;
+	unsigned int curofs = c.curseg_offset[curseg_type] - 1;
+
+	assert(curofs < MAX_CACHE_SUMS);
+
+	sum = c.sum[curseg_type] + curofs;
+	sum->nid = cpu_to_le32(nid);
+	sum->ofs_in_node = cpu_to_le16(ofs_in_node);
+}
+
+static block_t f2fs_add_default_dentry_root(void)
+{
+	struct f2fs_dentry_block *dent_blk = NULL;
+	block_t data_blkaddr;
+
+	dent_blk = calloc(F2FS_BLKSIZE, 1);
+	if(dent_blk == NULL) {
+		MSG(1, "\tError: Calloc Failed for dent_blk!!!\n");
+		return 0;
+	}
+
+	dent_blk->dentry[0].hash_code = 0;
+	dent_blk->dentry[0].ino = sb->root_ino;
+	dent_blk->dentry[0].name_len = cpu_to_le16(1);
+	dent_blk->dentry[0].file_type = F2FS_FT_DIR;
+	memcpy(dent_blk->filename[0], ".", 1);
+
+	dent_blk->dentry[1].hash_code = 0;
+	dent_blk->dentry[1].ino = sb->root_ino;
+	dent_blk->dentry[1].name_len = cpu_to_le16(2);
+	dent_blk->dentry[1].file_type = F2FS_FT_DIR;
+	memcpy(dent_blk->filename[1], "..", 2);
+
+	/* bitmap for . and .. */
+	test_and_set_bit_le(0, dent_blk->dentry_bitmap);
+	test_and_set_bit_le(1, dent_blk->dentry_bitmap);
+
+	if (c.lpf_ino) {
+		int len = strlen(LPF);
+		f2fs_hash_t hash = f2fs_dentry_hash(0, 0, (unsigned char *)LPF, len);
+
+		dent_blk->dentry[2].hash_code = cpu_to_le32(hash);
+		dent_blk->dentry[2].ino = cpu_to_le32(c.lpf_ino);
+		dent_blk->dentry[2].name_len = cpu_to_le16(len);
+		dent_blk->dentry[2].file_type = F2FS_FT_DIR;
+		memcpy(dent_blk->filename[2], LPF, F2FS_SLOT_LEN);
+
+		memcpy(dent_blk->filename[3], &LPF[F2FS_SLOT_LEN],
+				len - F2FS_SLOT_LEN);
+
+		test_and_set_bit_le(2, dent_blk->dentry_bitmap);
+		test_and_set_bit_le(3, dent_blk->dentry_bitmap);
+	}
+
+	data_blkaddr = alloc_next_free_block(CURSEG_HOT_DATA);
+
+	DBG(1, "\tWriting default dentry root, at offset 0x%x\n", data_blkaddr);
+	if (dev_write_block(dent_blk, data_blkaddr)) {
+		MSG(1, "\tError: While writing the dentry_blk to disk!!!\n");
+		free(dent_blk);
+		return 0;
+	}
+
+	update_sit_journal(CURSEG_HOT_DATA);
+	update_summary_entry(CURSEG_HOT_DATA, le32_to_cpu(sb->root_ino), 0);
+
+	free(dent_blk);
+	return data_blkaddr;
+}
+
 static int f2fs_write_root_inode(void)
 {
 	struct f2fs_node *raw_node = NULL;
@@ -1261,11 +1286,17 @@ static int f2fs_write_root_inode(void)
 	if (c.lpf_ino)
 		raw_node->i.i_links = cpu_to_le32(3);
 
-	data_blkaddr = alloc_next_free_block(CURSEG_HOT_DATA, 1);
+	data_blkaddr = f2fs_add_default_dentry_root();
+	if (data_blkaddr == 0) {
+		MSG(1, "\tError: Failed to add default dentries for root!!!\n");
+		free(raw_node);
+		return -1;
+	}
+
 	raw_node->i.i_addr[get_extra_isize(raw_node)] =
 				cpu_to_le32(data_blkaddr);
 
-	node_blkaddr = alloc_next_free_block(CURSEG_HOT_NODE, 1);
+	node_blkaddr = alloc_next_free_block(CURSEG_HOT_NODE);
 	raw_node->footer.next_blkaddr = cpu_to_le32(node_blkaddr + 1);
 
 	DBG(1, "\tWriting root inode (hot node), offset 0x%x\n", node_blkaddr);
@@ -1275,22 +1306,27 @@ static int f2fs_write_root_inode(void)
 		return -1;
 	}
 
+	update_nat_journal(le32_to_cpu(sb->root_ino), node_blkaddr);
+	update_sit_journal(CURSEG_HOT_NODE);
+	update_summary_entry(CURSEG_HOT_NODE, le32_to_cpu(sb->root_ino), 0);
+
 	free(raw_node);
 	return 0;
 }
 
-static int f2fs_write_default_quota(int qtype, unsigned int blkaddr,
-						__le32 raw_id)
+static int f2fs_write_default_quota(int qtype, __le32 raw_id)
 {
 	char *filebuf = calloc(F2FS_BLKSIZE, 2);
 	int file_magics[] = INITQMAGICS;
 	struct v2_disk_dqheader ddqheader;
 	struct v2_disk_dqinfo ddqinfo;
 	struct v2r1_disk_dqblk dqblk;
+	block_t blkaddr;
+	int i;
 
 	if (filebuf == NULL) {
 		MSG(1, "\tError: Calloc Failed for filebuf!!!\n");
-		return -1;
+		return 0;
 	}
 
 	/* Write basic quota header */
@@ -1337,17 +1373,25 @@ static int f2fs_write_default_quota(int qtype, unsigned int blkaddr,
 	memcpy(filebuf + 5136, &dqblk, sizeof(struct v2r1_disk_dqblk));
 
 	/* Write two blocks */
-	if (dev_write_block(filebuf, blkaddr) ||
-	    dev_write_block(filebuf + F2FS_BLKSIZE, blkaddr + 1)) {
-		MSG(1, "\tError: While writing the quota_blk to disk!!!\n");
-		free(filebuf);
-		return -1;
+	for (i = 0; i < QUOTA_DATA; i++) {
+		blkaddr = alloc_next_free_block(CURSEG_HOT_DATA);
+
+		if (dev_write_block(filebuf + i * F2FS_BLKSIZE, blkaddr)) {
+			MSG(1, "\tError: While writing the quota_blk to disk!!!\n");
+			free(filebuf);
+			return 0;
+		}
+
+		update_sit_journal(CURSEG_HOT_DATA);
+		update_summary_entry(CURSEG_HOT_DATA,
+					le32_to_cpu(sb->qf_ino[qtype]), i);
 	}
+
 	DBG(1, "\tWriting quota data, at offset %08x, %08x\n",
-					blkaddr, blkaddr + 1);
+					blkaddr - 1, blkaddr);
+
 	free(filebuf);
-	c.quota_dnum += QUOTA_DATA(qtype);
-	return 0;
+	return blkaddr - 1;
 }
 
 static int f2fs_write_qf_inode(int qtype, int offset)
@@ -1367,14 +1411,12 @@ static int f2fs_write_qf_inode(int qtype, int offset)
 			le32_to_cpu(sb->qf_ino[qtype]), mkfs_time, 0x8180);
 
 	raw_node->i.i_size = cpu_to_le64(1024 * 6);
-	raw_node->i.i_blocks = cpu_to_le64(1 + QUOTA_DATA(qtype));
+	raw_node->i.i_blocks = cpu_to_le64(1 + QUOTA_DATA);
 	raw_node->i.i_flags = F2FS_NOATIME_FL | F2FS_IMMUTABLE_FL;
 
-	node_blkaddr = alloc_next_free_block(CURSEG_HOT_NODE, 1);
+	node_blkaddr = alloc_next_free_block(CURSEG_HOT_NODE);
 	raw_node->footer.next_blkaddr = cpu_to_le32(node_blkaddr + 1);
 
-	data_blkaddr = alloc_next_free_block(CURSEG_HOT_DATA, QUOTA_DATA(i));
-
 	if (qtype == 0)
 		raw_id = raw_node->i.i_uid;
 	else if (qtype == 1)
@@ -1385,12 +1427,13 @@ static int f2fs_write_qf_inode(int qtype, int offset)
 		ASSERT(0);
 
 	/* write two blocks */
-	if (f2fs_write_default_quota(qtype, data_blkaddr, raw_id)) {
+	data_blkaddr = f2fs_write_default_quota(qtype, raw_id);
+	if (data_blkaddr == 0) {
 		free(raw_node);
 		return -1;
 	}
 
-	for (i = 0; i < QUOTA_DATA(qtype); i++)
+	for (i = 0; i < QUOTA_DATA; i++)
 		raw_node->i.i_addr[get_extra_isize(raw_node) + i] =
 					cpu_to_le32(data_blkaddr + i);
 
@@ -1401,8 +1444,11 @@ static int f2fs_write_qf_inode(int qtype, int offset)
 		return -1;
 	}
 
+	update_nat_journal(le32_to_cpu(sb->qf_ino[qtype]), node_blkaddr);
+	update_sit_journal(CURSEG_HOT_NODE);
+	update_summary_entry(CURSEG_HOT_NODE, le32_to_cpu(sb->qf_ino[qtype]), 0);
+
 	free(raw_node);
-	c.quota_inum++;
 	return 0;
 }
 
@@ -1442,7 +1488,7 @@ static int f2fs_update_nat_default(void)
 static block_t f2fs_add_default_dentry_lpf(void)
 {
 	struct f2fs_dentry_block *dent_blk;
-	uint64_t data_blk_offset;
+	block_t data_blkaddr;
 
 	dent_blk = calloc(F2FS_BLKSIZE, 1);
 	if (dent_blk == NULL) {
@@ -1465,21 +1511,21 @@ static block_t f2fs_add_default_dentry_lpf(void)
 	test_and_set_bit_le(0, dent_blk->dentry_bitmap);
 	test_and_set_bit_le(1, dent_blk->dentry_bitmap);
 
-	data_blk_offset = get_sb(main_blkaddr);
-	data_blk_offset += c.cur_seg[CURSEG_HOT_DATA] * c.blks_per_seg +
-		1 + c.quota_dnum;
+	data_blkaddr = alloc_next_free_block(CURSEG_HOT_DATA);
 
-	DBG(1, "\tWriting default dentry lost+found, at offset 0x%08"PRIx64"\n",
-			data_blk_offset);
-	if (dev_write_block(dent_blk, data_blk_offset)) {
+	DBG(1, "\tWriting default dentry lost+found, at offset 0x%x\n",
+							data_blkaddr);
+	if (dev_write_block(dent_blk, data_blkaddr)) {
 		MSG(1, "\tError While writing the dentry_blk to disk!!!\n");
 		free(dent_blk);
 		return 0;
 	}
 
+	update_sit_journal(CURSEG_HOT_DATA);
+	update_summary_entry(CURSEG_HOT_DATA, c.lpf_ino, 0);
+
 	free(dent_blk);
-	c.lpf_dnum++;
-	return data_blk_offset;
+	return data_blkaddr;
 }
 
 static int f2fs_write_lpf_inode(void)
@@ -1503,7 +1549,7 @@ static int f2fs_write_lpf_inode(void)
 	raw_node->i.i_namelen = le32_to_cpu(strlen(LPF));
 	memcpy(raw_node->i.i_name, LPF, strlen(LPF));
 
-	node_blkaddr = alloc_next_free_block(CURSEG_HOT_NODE, 1);
+	node_blkaddr = alloc_next_free_block(CURSEG_HOT_NODE);
 	raw_node->footer.next_blkaddr = cpu_to_le32(node_blkaddr + 1);
 
 	data_blkaddr = f2fs_add_default_dentry_lpf();
@@ -1522,72 +1568,15 @@ static int f2fs_write_lpf_inode(void)
 		goto exit;
 	}
 
-	c.lpf_inum++;
+	update_nat_journal(c.lpf_ino, node_blkaddr);
+	update_sit_journal(CURSEG_HOT_NODE);
+	update_summary_entry(CURSEG_HOT_NODE, c.lpf_ino, 0);
+
 exit:
 	free(raw_node);
 	return err;
 }
 
-static int f2fs_add_default_dentry_root(void)
-{
-	struct f2fs_dentry_block *dent_blk = NULL;
-	uint64_t data_blk_offset = 0;
-
-	dent_blk = calloc(F2FS_BLKSIZE, 1);
-	if(dent_blk == NULL) {
-		MSG(1, "\tError: Calloc Failed for dent_blk!!!\n");
-		return -1;
-	}
-
-	dent_blk->dentry[0].hash_code = 0;
-	dent_blk->dentry[0].ino = sb->root_ino;
-	dent_blk->dentry[0].name_len = cpu_to_le16(1);
-	dent_blk->dentry[0].file_type = F2FS_FT_DIR;
-	memcpy(dent_blk->filename[0], ".", 1);
-
-	dent_blk->dentry[1].hash_code = 0;
-	dent_blk->dentry[1].ino = sb->root_ino;
-	dent_blk->dentry[1].name_len = cpu_to_le16(2);
-	dent_blk->dentry[1].file_type = F2FS_FT_DIR;
-	memcpy(dent_blk->filename[1], "..", 2);
-
-	/* bitmap for . and .. */
-	test_and_set_bit_le(0, dent_blk->dentry_bitmap);
-	test_and_set_bit_le(1, dent_blk->dentry_bitmap);
-
-	if (c.lpf_ino) {
-		int len = strlen(LPF);
-		f2fs_hash_t hash = f2fs_dentry_hash(0, 0, (unsigned char *)LPF, len);
-
-		dent_blk->dentry[2].hash_code = cpu_to_le32(hash);
-		dent_blk->dentry[2].ino = cpu_to_le32(c.lpf_ino);
-		dent_blk->dentry[2].name_len = cpu_to_le16(len);
-		dent_blk->dentry[2].file_type = F2FS_FT_DIR;
-		memcpy(dent_blk->filename[2], LPF, F2FS_SLOT_LEN);
-
-		memcpy(dent_blk->filename[3], &LPF[F2FS_SLOT_LEN],
-				len - F2FS_SLOT_LEN);
-
-		test_and_set_bit_le(2, dent_blk->dentry_bitmap);
-		test_and_set_bit_le(3, dent_blk->dentry_bitmap);
-	}
-
-	data_blk_offset = get_sb(main_blkaddr);
-	data_blk_offset += c.cur_seg[CURSEG_HOT_DATA] *
-				c.blks_per_seg;
-
-	DBG(1, "\tWriting default dentry root, at offset 0x%08"PRIx64"\n",
-				data_blk_offset);
-	if (dev_write_block(dent_blk, data_blk_offset)) {
-		MSG(1, "\tError: While writing the dentry_blk to disk!!!\n");
-		free(dent_blk);
-		return -1;
-	}
-
-	free(dent_blk);
-	return 0;
-}
-
 static int f2fs_create_root_dir(void)
 {
 	enum quota_type qtype;
@@ -1630,12 +1619,6 @@ static int f2fs_create_root_dir(void)
 		MSG(1, "\tError: Failed to update NAT for root!!!\n");
 		goto exit;
 	}
-
-	err = f2fs_add_default_dentry_root();
-	if (err < 0) {
-		MSG(1, "\tError: Failed to add default dentries for root!!!\n");
-		goto exit;
-	}
 exit:
 	if (err)
 		MSG(1, "\tError: Could not create the root directory!!!\n");
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
