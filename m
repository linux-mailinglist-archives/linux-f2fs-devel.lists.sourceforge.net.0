Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CB450AB54
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Apr 2022 00:19:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nhf8k-0005Gx-LT; Thu, 21 Apr 2022 22:19:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bart.vanassche@gmail.com>) id 1nhf8i-0005GX-Nq
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Apr 2022 22:19:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Easz9hMCaK0YA+YVF+m3F7zcMsk7scem80Mtnjzs758=; b=LbySR1n4dUzZ28e0zby6y4Mt5q
 JRpEzpKwGRbg52H7kqTMkh9pvfPEJcjaYVfATCedgTAYC8weKAkTuxVwQkEy2OILBDcHGqCnhru+G
 S2i/ETMdviUCKEV6B5wllnbflEek4gX1looVBvcyOCWPu0VO/GqE9uNugPQFw2qSDPGU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Easz9hMCaK0YA+YVF+m3F7zcMsk7scem80Mtnjzs758=; b=EV21RCekspArU+LuG8zqQm67ck
 kb/HIdh8/Ion8DFdahVgOSpQBb7nquDTx7nNWdhUMr3A/VRFH/ptec6TxlXZEMgPpzDgLD4mcn90m
 TsKc2vR9HfTDNSvwJeBP2ha/jGnQ3h8tuSZwG2CR2FWDze66c43DE1dUT9ox+K9Bj1jg=;
Received: from mail-pf1-f174.google.com ([209.85.210.174])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nhf8h-0002uM-OU
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Apr 2022 22:19:05 +0000
Received: by mail-pf1-f174.google.com with SMTP id x1so6263726pfj.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 21 Apr 2022 15:19:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Easz9hMCaK0YA+YVF+m3F7zcMsk7scem80Mtnjzs758=;
 b=qur844TleQSie3Gdznu8E5PrNGbdCHsiaGPE/MuLUpWlGMaGSfy/3sgyrgcr7jjKcF
 FjIPSftUkwUCgsbM+XRrD/4PWUQJspk6aBTD/BMHJmgIxqvC951jYRNC9s2PRu6/P60M
 g55zTJPJGmQyPFcsuTGJSqdUzFI3Onfphgvga6XooxQWkjh8B5MqJX4Q05hCUFuG4HDT
 KPF94oK1xNkrxFuDOFXHGoPwORIX4NLEJ9ebvaHA9WnfEOn94/tC5CkCRlDbLGcROk+O
 1Ww5llHlogeD6PAXWgyyy1nOJAhFZWc4riu5xLezBcWs6QaAkkTKUcOKWyuLee8lGyvK
 eLiQ==
X-Gm-Message-State: AOAM530EugcYAvSDhVBmIQGn1HkWUqxilr4QFyntcuAqXEusEAFj6m/I
 kkOslZOdM/868xcFmyZHbFzN8hRnTuRJmA==
X-Google-Smtp-Source: ABdhPJz4Z19hy51ij+hLDRCchdodHXNXC/eWDLLwPmCr9tvey6YRde9wMbYfOuIs1hq9fLzUt5+1gg==
X-Received: by 2002:a65:568b:0:b0:378:86b8:9426 with SMTP id
 v11-20020a65568b000000b0037886b89426mr1314868pgs.70.1650579537944; 
 Thu, 21 Apr 2022 15:18:57 -0700 (PDT)
Received: from bvanassche-linux.mtv.corp.google.com
 ([2620:15c:211:201:a034:31d8:ca4e:1f35])
 by smtp.gmail.com with ESMTPSA id
 hi21-20020a17090b30d500b001cd4989ff4csm3794876pjb.19.2022.04.21.15.18.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 15:18:57 -0700 (PDT)
From: Bart Van Assche <bvanassche@acm.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Date: Thu, 21 Apr 2022 15:18:11 -0700
Message-Id: <20220421221836.3935616-7-bvanassche@acm.org>
X-Mailer: git-send-email 2.36.0.rc2.479.g8af0fa9b8e-goog
In-Reply-To: <20220421221836.3935616-1-bvanassche@acm.org>
References: <20220421221836.3935616-1-bvanassche@acm.org>
MIME-Version: 1.0
X-Spam-Score: 0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Many format strings use one of the PRI* macros. These macros
 are compatible with the uint types but not with the u_int types. Hence this
 patch that switches from the u_int to the uint types. Signed-off-by: Bart
 Van Assche <bvanassche@acm.org> --- fsck/fsck.c | 4 +- fsck/mount.c | 44
 ++++++++-------- fsck/resize.c | 28 +++++----- include/f2fs_fs.h | 110
 +++++++++++++++++++ [...] 
 Content analysis details:   (0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.174 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [bart.vanassche[at]gmail.com]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.174 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
X-Headers-End: 1nhf8h-0002uM-OU
Subject: [f2fs-dev] [PATCH 06/31] Switch from the u_int to the uint types
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
Cc: Bart Van Assche <bvanassche@acm.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Many format strings use one of the PRI* macros. These macros are compatible
with the uint types but not with the u_int types. Hence this patch
that switches from the u_int to the uint types.

Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 fsck/fsck.c              |   4 +-
 fsck/mount.c             |  44 ++++++++--------
 fsck/resize.c            |  28 +++++-----
 include/f2fs_fs.h        | 110 +++++++++++++++++++--------------------
 include/quota.h          |  16 +++---
 lib/libf2fs.c            |  22 ++++----
 lib/libf2fs_io.c         |   4 +-
 lib/libf2fs_zoned.c      |  16 +++---
 mkfs/f2fs_format.c       |  80 ++++++++++++++--------------
 mkfs/f2fs_format_main.c  |   2 +-
 mkfs/f2fs_format_utils.c |   2 +-
 mkfs/f2fs_format_utils.h |   2 +-
 tools/f2fs_io/f2fs_io.h  |   8 +--
 13 files changed, 167 insertions(+), 171 deletions(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index ddcede32b4cb..798779cfaf8a 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -2312,7 +2312,7 @@ static void fix_checkpoint(struct f2fs_sb_info *sbi)
 	block_t cp_blocks;
 	u32 i;
 	int ret;
-	u_int32_t crc = 0;
+	uint32_t crc = 0;
 
 	/* should call from fsck */
 	ASSERT(c.func == FSCK);
@@ -2438,7 +2438,7 @@ static int check_curseg_write_pointer(struct f2fs_sb_info *sbi, int type)
 	struct f2fs_fsck *fsck = F2FS_FSCK(sbi);
 	struct blk_zone blkz;
 	block_t cs_block, wp_block, zone_last_vblock;
-	u_int64_t cs_sector, wp_sector;
+	uint64_t cs_sector, wp_sector;
 	int i, ret;
 	unsigned int zone_segno;
 	int log_sectors_per_block = sbi->log_blocksize - SECTOR_SHIFT;
diff --git a/fsck/mount.c b/fsck/mount.c
index c928a1516597..f15260e02cab 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -31,7 +31,7 @@
 #define ACL_OTHER		(0x20)
 #endif
 
-static int get_device_idx(struct f2fs_sb_info *sbi, u_int32_t segno)
+static int get_device_idx(struct f2fs_sb_info *sbi, uint32_t segno)
 {
 	block_t seg_start_blkaddr;
 	int i;
@@ -48,7 +48,7 @@ static int get_device_idx(struct f2fs_sb_info *sbi, u_int32_t segno)
 #ifdef HAVE_LINUX_BLKZONED_H
 
 static int get_zone_idx_from_dev(struct f2fs_sb_info *sbi,
-					u_int32_t segno, u_int32_t dev_idx)
+					uint32_t segno, uint32_t dev_idx)
 {
 	block_t seg_start_blkaddr = START_BLOCK(sbi, segno);
 
@@ -365,7 +365,7 @@ void print_node_info(struct f2fs_sb_info *sbi,
 	}
 }
 
-static void DISP_label(u_int16_t *name)
+static void DISP_label(uint16_t *name)
 {
 	char buffer[MAX_VOLUME_NAME];
 
@@ -674,7 +674,7 @@ out:
 void update_superblock(struct f2fs_super_block *sb, int sb_mask)
 {
 	int addr, ret;
-	u_int8_t *buf;
+	uint8_t *buf;
 	u32 old_crc, new_crc;
 
 	buf = calloc(BLOCK_SZ, 1);
@@ -1498,7 +1498,7 @@ static int f2fs_late_init_nid_bitmap(struct f2fs_sb_info *sbi)
 u32 update_nat_bits_flags(struct f2fs_super_block *sb,
 				struct f2fs_checkpoint *cp, u32 flags)
 {
-	u_int32_t nat_bits_bytes, nat_bits_blocks;
+	uint32_t nat_bits_bytes, nat_bits_blocks;
 
 	nat_bits_bytes = get_sb(segment_count_nat) << 5;
 	nat_bits_blocks = F2FS_BYTES_TO_BLK((nat_bits_bytes << 1) + 8 +
@@ -1517,14 +1517,14 @@ void write_nat_bits(struct f2fs_sb_info *sbi,
 	struct f2fs_super_block *sb, struct f2fs_checkpoint *cp, int set)
 {
 	struct f2fs_nm_info *nm_i = NM_I(sbi);
-	u_int32_t nat_blocks = get_sb(segment_count_nat) <<
+	uint32_t nat_blocks = get_sb(segment_count_nat) <<
 				(get_sb(log_blocks_per_seg) - 1);
-	u_int32_t nat_bits_bytes = nat_blocks >> 3;
-	u_int32_t nat_bits_blocks = F2FS_BYTES_TO_BLK((nat_bits_bytes << 1) +
+	uint32_t nat_bits_bytes = nat_blocks >> 3;
+	uint32_t nat_bits_blocks = F2FS_BYTES_TO_BLK((nat_bits_bytes << 1) +
 					8 + F2FS_BLKSIZE - 1);
 	unsigned char *nat_bits, *full_nat_bits, *empty_nat_bits;
 	struct f2fs_nat_block *nat_block;
-	u_int32_t i, j;
+	uint32_t i, j;
 	block_t blkaddr;
 	int ret;
 
@@ -1590,15 +1590,15 @@ static int check_nat_bits(struct f2fs_sb_info *sbi,
 	struct f2fs_super_block *sb, struct f2fs_checkpoint *cp)
 {
 	struct f2fs_nm_info *nm_i = NM_I(sbi);
-	u_int32_t nat_blocks = get_sb(segment_count_nat) <<
+	uint32_t nat_blocks = get_sb(segment_count_nat) <<
 				(get_sb(log_blocks_per_seg) - 1);
-	u_int32_t nat_bits_bytes = nat_blocks >> 3;
-	u_int32_t nat_bits_blocks = F2FS_BYTES_TO_BLK((nat_bits_bytes << 1) +
+	uint32_t nat_bits_bytes = nat_blocks >> 3;
+	uint32_t nat_bits_blocks = F2FS_BYTES_TO_BLK((nat_bits_bytes << 1) +
 					8 + F2FS_BLKSIZE - 1);
 	unsigned char *nat_bits, *full_nat_bits, *empty_nat_bits;
 	struct curseg_info *curseg = CURSEG_I(sbi, CURSEG_HOT_DATA);
 	struct f2fs_journal *journal = &curseg->sum_blk->journal;
-	u_int32_t i, j;
+	uint32_t i, j;
 	block_t blkaddr;
 	int err = 0;
 
@@ -1628,8 +1628,8 @@ static int check_nat_bits(struct f2fs_sb_info *sbi,
 	}
 
 	for (i = 0; i < nat_blocks; i++) {
-		u_int32_t start_nid = i * NAT_ENTRY_PER_BLOCK;
-		u_int32_t valid = 0;
+		uint32_t start_nid = i * NAT_ENTRY_PER_BLOCK;
+		uint32_t valid = 0;
 		int empty = test_bit_le(i, empty_nat_bits);
 		int full = test_bit_le(i, full_nat_bits);
 
@@ -2702,7 +2702,7 @@ void set_section_type(struct f2fs_sb_info *sbi, unsigned int segno, int type)
 static bool write_pointer_at_zone_start(struct f2fs_sb_info *sbi,
 					unsigned int zone_segno)
 {
-	u_int64_t sector;
+	uint64_t sector;
 	struct blk_zone blkz;
 	block_t block = START_BLOCK(sbi, zone_segno);
 	int log_sectors_per_block = sbi->log_blocksize - SECTOR_SHIFT;
@@ -3011,7 +3011,7 @@ void write_checkpoint(struct f2fs_sb_info *sbi)
 	unsigned long long cp_blk_no;
 	u32 flags = CP_UMOUNT_FLAG;
 	int i, ret;
-	u_int32_t crc = 0;
+	uint32_t crc = 0;
 
 	if (is_set_ckpt_flags(cp, CP_ORPHAN_PRESENT_FLAG)) {
 		orphan_blks = __start_sum_addr(sbi) - 1;
@@ -3242,7 +3242,7 @@ void build_nat_area_bitmap(struct f2fs_sb_info *sbi)
 
 static int check_sector_size(struct f2fs_super_block *sb)
 {
-	u_int32_t log_sectorsize, log_sectors_per_block;
+	uint32_t log_sectorsize, log_sectors_per_block;
 
 	log_sectorsize = log_base_2(c.sector_size);
 	log_sectors_per_block = log_base_2(c.sectors_per_blk);
@@ -3679,10 +3679,10 @@ void f2fs_do_umount(struct f2fs_sb_info *sbi)
 int f2fs_sparse_initialize_meta(struct f2fs_sb_info *sbi)
 {
 	struct f2fs_super_block *sb = sbi->raw_super;
-	u_int32_t sit_seg_count, sit_size;
-	u_int32_t nat_seg_count, nat_size;
-	u_int64_t sit_seg_addr, nat_seg_addr, payload_addr;
-	u_int32_t seg_size = 1 << get_sb(log_blocks_per_seg);
+	uint32_t sit_seg_count, sit_size;
+	uint32_t nat_seg_count, nat_size;
+	uint64_t sit_seg_addr, nat_seg_addr, payload_addr;
+	uint32_t seg_size = 1 << get_sb(log_blocks_per_seg);
 	int ret;
 
 	if (!c.sparse_mode)
diff --git a/fsck/resize.c b/fsck/resize.c
index 78d578ec2cc1..f1b770123428 100644
--- a/fsck/resize.c
+++ b/fsck/resize.c
@@ -11,27 +11,27 @@
 
 static int get_new_sb(struct f2fs_super_block *sb)
 {
-	u_int32_t zone_size_bytes;
-	u_int64_t zone_align_start_offset;
-	u_int32_t blocks_for_sit, blocks_for_nat, blocks_for_ssa;
-	u_int32_t sit_segments, nat_segments, diff, total_meta_segments;
-	u_int32_t total_valid_blks_available;
-	u_int32_t sit_bitmap_size, max_sit_bitmap_size;
-	u_int32_t max_nat_bitmap_size, max_nat_segments;
-	u_int32_t segment_size_bytes = 1 << (get_sb(log_blocksize) +
+	uint32_t zone_size_bytes;
+	uint64_t zone_align_start_offset;
+	uint32_t blocks_for_sit, blocks_for_nat, blocks_for_ssa;
+	uint32_t sit_segments, nat_segments, diff, total_meta_segments;
+	uint32_t total_valid_blks_available;
+	uint32_t sit_bitmap_size, max_sit_bitmap_size;
+	uint32_t max_nat_bitmap_size, max_nat_segments;
+	uint32_t segment_size_bytes = 1 << (get_sb(log_blocksize) +
 					get_sb(log_blocks_per_seg));
-	u_int32_t blks_per_seg = 1 << get_sb(log_blocks_per_seg);
-	u_int32_t segs_per_zone = get_sb(segs_per_sec) * get_sb(secs_per_zone);
+	uint32_t blks_per_seg = 1 << get_sb(log_blocks_per_seg);
+	uint32_t segs_per_zone = get_sb(segs_per_sec) * get_sb(secs_per_zone);
 
 	set_sb(block_count, c.target_sectors >>
 				get_sb(log_sectors_per_block));
 
 	zone_size_bytes = segment_size_bytes * segs_per_zone;
 	zone_align_start_offset =
-		((u_int64_t) c.start_sector * DEFAULT_SECTOR_SIZE +
+		((uint64_t) c.start_sector * DEFAULT_SECTOR_SIZE +
 		2 * F2FS_BLKSIZE + zone_size_bytes - 1) /
 		zone_size_bytes * zone_size_bytes -
-		(u_int64_t) c.start_sector * DEFAULT_SECTOR_SIZE;
+		(uint64_t) c.start_sector * DEFAULT_SECTOR_SIZE;
 
 	set_sb(segment_count, (c.target_sectors * c.sector_size -
 				zone_align_start_offset) / segment_size_bytes /
@@ -76,7 +76,7 @@ static int get_new_sb(struct f2fs_super_block *sb)
 		/* use cp_payload if free space of f2fs_checkpoint is not enough */
 		if (max_sit_bitmap_size + max_nat_bitmap_size >
 						MAX_BITMAP_SIZE_IN_CKPT) {
-			u_int32_t diff =  max_sit_bitmap_size +
+			uint32_t diff =  max_sit_bitmap_size +
 						max_nat_bitmap_size -
 						MAX_BITMAP_SIZE_IN_CKPT;
 			set_sb(cp_payload, F2FS_BLK_ALIGN(diff));
@@ -457,7 +457,7 @@ static void rebuild_checkpoint(struct f2fs_sb_info *sbi,
 	block_t new_cp_blks = 1 + get_newsb(cp_payload);
 	block_t orphan_blks = 0;
 	block_t new_cp_blk_no, old_cp_blk_no;
-	u_int32_t crc = 0;
+	uint32_t crc = 0;
 	u32 flags;
 	void *buf;
 	int i, ret;
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 412130f5b5ab..1e38d93ff40d 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -70,20 +70,16 @@
 
 #ifdef ANDROID_WINDOWS_HOST
 #undef HAVE_LINUX_TYPES_H
-typedef uint64_t u_int64_t;
-typedef uint32_t u_int32_t;
-typedef uint16_t u_int16_t;
-typedef uint8_t u_int8_t;
 #endif
 
 /* codes from kernel's f2fs.h, GPL-v2.0 */
 #define MIN_COMPRESS_LOG_SIZE	2
 #define MAX_COMPRESS_LOG_SIZE	8
 
-typedef u_int64_t	u64;
-typedef u_int32_t	u32;
-typedef u_int16_t	u16;
-typedef u_int8_t	u8;
+typedef uint64_t	u64;
+typedef uint32_t	u32;
+typedef uint16_t	u16;
+typedef uint8_t		u8;
 typedef u32		block_t;
 typedef u32		nid_t;
 #ifndef bool
@@ -378,16 +374,16 @@ enum default_set {
 struct device_info {
 	char *path;
 	int32_t fd;
-	u_int32_t sector_size;
-	u_int64_t total_sectors;	/* got by get_device_info */
-	u_int64_t start_blkaddr;
-	u_int64_t end_blkaddr;
-	u_int32_t total_segments;
+	uint32_t sector_size;
+	uint64_t total_sectors;	/* got by get_device_info */
+	uint64_t start_blkaddr;
+	uint64_t end_blkaddr;
+	uint32_t total_segments;
 
 	/* to handle zone block devices */
 	int zoned_model;
-	u_int32_t nr_zones;
-	u_int32_t nr_rnd_zones;
+	uint32_t nr_zones;
+	uint32_t nr_rnd_zones;
 	size_t zone_blocks;
 	size_t *zone_cap_blocks;
 };
@@ -444,36 +440,36 @@ typedef struct {
 #define ALIGN_UP(addrs, size)	ALIGN_DOWN(((addrs) + (size) - 1), (size))
 
 struct f2fs_configuration {
-	u_int32_t reserved_segments;
-	u_int32_t new_reserved_segments;
+	uint32_t reserved_segments;
+	uint32_t new_reserved_segments;
 	int sparse_mode;
 	int zoned_mode;
 	int zoned_model;
 	size_t zone_blocks;
 	double overprovision;
 	double new_overprovision;
-	u_int32_t cur_seg[6];
-	u_int32_t segs_per_sec;
-	u_int32_t secs_per_zone;
-	u_int32_t segs_per_zone;
-	u_int32_t start_sector;
-	u_int32_t total_segments;
-	u_int32_t sector_size;
-	u_int64_t device_size;
-	u_int64_t total_sectors;
-	u_int64_t wanted_total_sectors;
-	u_int64_t wanted_sector_size;
-	u_int64_t target_sectors;
-	u_int64_t max_size;
-	u_int32_t sectors_per_blk;
-	u_int32_t blks_per_seg;
+	uint32_t cur_seg[6];
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
+	uint64_t max_size;
+	uint32_t sectors_per_blk;
+	uint32_t blks_per_seg;
 	__u8 init_version[VERSION_LEN + 1];
 	__u8 sb_version[VERSION_LEN + 1];
 	__u8 version[VERSION_LEN + 1];
 	char *vol_label;
 	char *vol_uuid;
-	u_int16_t s_encoding;
-	u_int16_t s_encoding_flags;
+	uint16_t s_encoding;
+	uint16_t s_encoding_flags;
 	int heap;
 	int32_t kd;
 	int32_t dump_fd;
@@ -512,20 +508,20 @@ struct f2fs_configuration {
 
 	/* mkfs parameters */
 	int fake_seed;
-	u_int32_t next_free_nid;
-	u_int32_t quota_inum;
-	u_int32_t quota_dnum;
-	u_int32_t lpf_inum;
-	u_int32_t lpf_dnum;
-	u_int32_t lpf_ino;
-	u_int32_t root_uid;
-	u_int32_t root_gid;
+	uint32_t next_free_nid;
+	uint32_t quota_inum;
+	uint32_t quota_dnum;
+	uint32_t lpf_inum;
+	uint32_t lpf_dnum;
+	uint32_t lpf_ino;
+	uint32_t root_uid;
+	uint32_t root_gid;
 
 	/* defragmentation parameters */
 	int defrag_shrink;
-	u_int64_t defrag_start;
-	u_int64_t defrag_len;
-	u_int64_t defrag_target;
+	uint64_t defrag_start;
+	uint64_t defrag_len;
+	uint64_t defrag_target;
 
 	/* sload parameters */
 	char *from_dir;
@@ -542,7 +538,7 @@ struct f2fs_configuration {
 	int safe_resize;
 
 	/* precomputed fs UUID checksum for seeding other checksums */
-	u_int32_t chksum_seed;
+	uint32_t chksum_seed;
 
 	/* cache parameters */
 	dev_cache_config_t cache_config;
@@ -1318,9 +1314,9 @@ enum {
 	SSR
 };
 
-extern int utf8_to_utf16(u_int16_t *, const char *, size_t, size_t);
-extern int utf16_to_utf8(char *, const u_int16_t *, size_t, size_t);
-extern int log_base_2(u_int32_t);
+extern int utf8_to_utf16(uint16_t *, const char *, size_t, size_t);
+extern int utf16_to_utf8(char *, const uint16_t *, size_t, size_t);
+extern int log_base_2(uint32_t);
 extern unsigned int addrs_per_inode(struct f2fs_inode *);
 extern unsigned int addrs_per_block(struct f2fs_inode *);
 extern unsigned int f2fs_max_file_offset(struct f2fs_inode *);
@@ -1338,8 +1334,8 @@ extern int f2fs_clear_bit(unsigned int, char *);
 extern u64 find_next_bit_le(const u8 *, u64, u64);
 extern u64 find_next_zero_bit_le(const u8 *, u64, u64);
 
-extern u_int32_t f2fs_cal_crc32(u_int32_t, void *, int);
-extern int f2fs_crc_valid(u_int32_t blk_crc, void *buf, int len);
+extern uint32_t f2fs_cal_crc32(uint32_t, void *, int);
+extern int f2fs_crc_valid(uint32_t blk_crc, void *buf, int len);
 
 extern void f2fs_init_configuration(void);
 extern int f2fs_devs_are_umounted(void);
@@ -1496,7 +1492,7 @@ blk_zone_cond_str(struct blk_zone *blkz)
 
 extern int f2fs_get_zoned_model(int);
 extern int f2fs_get_zone_blocks(int);
-extern int f2fs_report_zone(int, u_int64_t, void *);
+extern int f2fs_report_zone(int, uint64_t, void *);
 typedef int (report_zones_cb_t)(int i, void *, void *);
 extern int f2fs_report_zones(int, report_zones_cb_t *, void *);
 extern int f2fs_check_zones(int);
@@ -1513,7 +1509,7 @@ static inline double get_best_overprovision(struct f2fs_super_block *sb)
 {
 	double reserved, ovp, candidate, end, diff, space;
 	double max_ovp = 0, max_space = 0;
-	u_int32_t usable_main_segs = f2fs_get_usable_segments(sb);
+	uint32_t usable_main_segs = f2fs_get_usable_segments(sb);
 
 	if (get_sb(segment_count_main) < 256) {
 		candidate = 10;
@@ -1540,12 +1536,12 @@ static inline double get_best_overprovision(struct f2fs_super_block *sb)
 
 static inline __le64 get_cp_crc(struct f2fs_checkpoint *cp)
 {
-	u_int64_t cp_ver = get_cp(checkpoint_ver);
+	uint64_t cp_ver = get_cp(checkpoint_ver);
 	size_t crc_offset = get_cp(checksum_offset);
-	u_int32_t crc = le32_to_cpu(*(__le32 *)((unsigned char *)cp +
+	uint32_t crc = le32_to_cpu(*(__le32 *)((unsigned char *)cp +
 							crc_offset));
 
-	cp_ver |= ((u_int64_t)crc << 32);
+	cp_ver |= ((uint64_t)crc << 32);
 	return cpu_to_le64(cp_ver);
 }
 
@@ -1692,7 +1688,7 @@ static inline int parse_feature(struct feature *table, const char *features)
 }
 
 static inline int parse_root_owner(char *ids,
-			u_int32_t *root_uid, u_int32_t *root_gid)
+			uint32_t *root_uid, uint32_t *root_gid)
 {
 	char *uid = ids;
 	char *gid = NULL;
diff --git a/include/quota.h b/include/quota.h
index f578621fa2b4..627a86f6421f 100644
--- a/include/quota.h
+++ b/include/quota.h
@@ -46,18 +46,18 @@ enum quota_type {
 
 #pragma pack(push, 1)
 struct v2_disk_dqheader {
-	u_int32_t dqh_magic;	/* Magic number identifying file */
-	u_int32_t dqh_version;	/* File version */
+	uint32_t dqh_magic;	/* Magic number identifying file */
+	uint32_t dqh_version;	/* File version */
 } __attribute__ ((packed));
 
 /* Header with type and version specific information */
 struct v2_disk_dqinfo {
-	u_int32_t dqi_bgrace;	/* Time before block soft limit becomes hard limit */
-	u_int32_t dqi_igrace;	/* Time before inode soft limit becomes hard limit */
-	u_int32_t dqi_flags;	/* Flags for quotafile (DQF_*) */
-	u_int32_t dqi_blocks;	/* Number of blocks in file */
-	u_int32_t dqi_free_blk;	/* Number of first free block in the list */
-	u_int32_t dqi_free_entry;	/* Number of block with at least one free entry */
+	uint32_t dqi_bgrace;	/* Time before block soft limit becomes hard limit */
+	uint32_t dqi_igrace;	/* Time before inode soft limit becomes hard limit */
+	uint32_t dqi_flags;	/* Flags for quotafile (DQF_*) */
+	uint32_t dqi_blocks;	/* Number of blocks in file */
+	uint32_t dqi_free_blk;	/* Number of first free block in the list */
+	uint32_t dqi_free_entry;	/* Number of block with at least one free entry */
 } __attribute__ ((packed));
 
 struct v2r1_disk_dqblk {
diff --git a/lib/libf2fs.c b/lib/libf2fs.c
index 94fb91d46d28..b0a892772de1 100644
--- a/lib/libf2fs.c
+++ b/lib/libf2fs.c
@@ -104,7 +104,7 @@ static const char *utf8_to_wchar(const char *input, wchar_t *wc,
 	return NULL;
 }
 
-static u_int16_t *wchar_to_utf16(u_int16_t *output, wchar_t wc, size_t outsize)
+static uint16_t *wchar_to_utf16(uint16_t *output, wchar_t wc, size_t outsize)
 {
 	if (wc <= 0xffff) {
 		if (outsize == 0)
@@ -120,11 +120,11 @@ static u_int16_t *wchar_to_utf16(u_int16_t *output, wchar_t wc, size_t outsize)
 	return output + 2;
 }
 
-int utf8_to_utf16(u_int16_t *output, const char *input, size_t outsize,
+int utf8_to_utf16(uint16_t *output, const char *input, size_t outsize,
 		size_t insize)
 {
 	const char *inp = input;
-	u_int16_t *outp = output;
+	uint16_t *outp = output;
 	wchar_t wc;
 
 	while ((size_t)(inp - input) < insize && *inp) {
@@ -143,7 +143,7 @@ int utf8_to_utf16(u_int16_t *output, const char *input, size_t outsize,
 	return 0;
 }
 
-static const u_int16_t *utf16_to_wchar(const u_int16_t *input, wchar_t *wc,
+static const uint16_t *utf16_to_wchar(const uint16_t *input, wchar_t *wc,
 		size_t insize)
 {
 	if ((le16_to_cpu(input[0]) & 0xfc00) == 0xd800) {
@@ -206,10 +206,10 @@ static char *wchar_to_utf8(char *output, wchar_t wc, size_t outsize)
 	return output;
 }
 
-int utf16_to_utf8(char *output, const u_int16_t *input, size_t outsize,
+int utf16_to_utf8(char *output, const uint16_t *input, size_t outsize,
 		size_t insize)
 {
-	const u_int16_t *inp = input;
+	const uint16_t *inp = input;
 	char *outp = output;
 	wchar_t wc;
 
@@ -229,7 +229,7 @@ int utf16_to_utf8(char *output, const u_int16_t *input, size_t outsize,
 	return 0;
 }
 
-int log_base_2(u_int32_t num)
+int log_base_2(uint32_t num)
 {
 	int ret = 0;
 	if (num <= 0 || (num & (num - 1)) != 0)
@@ -530,7 +530,7 @@ unsigned int f2fs_max_file_offset(struct f2fs_inode *i)
  */
 #define CRCPOLY_LE 0xedb88320
 
-u_int32_t f2fs_cal_crc32(u_int32_t crc, void *buf, int len)
+uint32_t f2fs_cal_crc32(uint32_t crc, void *buf, int len)
 {
 	int i;
 	unsigned char *p = (unsigned char *)buf;
@@ -542,9 +542,9 @@ u_int32_t f2fs_cal_crc32(u_int32_t crc, void *buf, int len)
 	return crc;
 }
 
-int f2fs_crc_valid(u_int32_t blk_crc, void *buf, int len)
+int f2fs_crc_valid(uint32_t blk_crc, void *buf, int len)
 {
-	u_int32_t cal_crc = 0;
+	uint32_t cal_crc = 0;
 
 	cal_crc = f2fs_cal_crc32(F2FS_SUPER_MAGIC, buf, len);
 
@@ -1197,7 +1197,7 @@ int f2fs_get_f2fs_info(void)
 		c.devices[0].total_sectors = c.total_sectors;
 	}
 	if (c.total_sectors * c.sector_size >
-		(u_int64_t)F2FS_MAX_SEGMENT * 2 * 1024 * 1024) {
+		(uint64_t)F2FS_MAX_SEGMENT * 2 * 1024 * 1024) {
 		MSG(0, "\tError: F2FS can support 16TB at most!!!\n");
 		return -1;
 	}
diff --git a/lib/libf2fs_io.c b/lib/libf2fs_io.c
index 320ee6c431f0..b985e6f37a0a 100644
--- a/lib/libf2fs_io.c
+++ b/lib/libf2fs_io.c
@@ -43,7 +43,7 @@ struct f2fs_configuration c;
 #include <sparse/sparse.h>
 struct sparse_file *f2fs_sparse_file;
 static char **blocks;
-u_int64_t blocks_count;
+uint64_t blocks_count;
 static char *zeroed_block;
 #endif
 
@@ -661,7 +661,7 @@ int f2fs_init_sparse_file(void)
 			return -1;
 
 		c.device_size = sparse_file_len(f2fs_sparse_file, 0, 0);
-		c.device_size &= (~((u_int64_t)(F2FS_BLKSIZE - 1)));
+		c.device_size &= (~((uint64_t)(F2FS_BLKSIZE - 1)));
 	}
 
 	if (sparse_file_block_size(f2fs_sparse_file) != F2FS_BLKSIZE) {
diff --git a/lib/libf2fs_zoned.c b/lib/libf2fs_zoned.c
index ce73b9af66ec..c408a4991fa1 100644
--- a/lib/libf2fs_zoned.c
+++ b/lib/libf2fs_zoned.c
@@ -192,7 +192,7 @@ int f2fs_get_zone_blocks(int i)
 	return 0;
 }
 
-int f2fs_report_zone(int i, u_int64_t sector, void *blkzone)
+int f2fs_report_zone(int i, uint64_t sector, void *blkzone)
 {
 	struct blk_zone *blkz = (struct blk_zone *)blkzone;
 	struct blk_zone_report *rep;
@@ -227,9 +227,9 @@ int f2fs_report_zones(int j, report_zones_cb_t *report_zones_cb, void *opaque)
 	struct blk_zone_report *rep;
 	struct blk_zone *blkz;
 	unsigned int i, n = 0;
-	u_int64_t total_sectors = (dev->total_sectors * c.sector_size)
+	uint64_t total_sectors = (dev->total_sectors * c.sector_size)
 		>> SECTOR_SHIFT;
-	u_int64_t sector = 0;
+	uint64_t sector = 0;
 	int ret = -1;
 
 	rep = malloc(F2FS_REPORT_ZONES_BUFSZ);
@@ -280,8 +280,8 @@ int f2fs_check_zones(int j)
 	struct blk_zone_report *rep;
 	struct blk_zone *blkz;
 	unsigned int i, n = 0;
-	u_int64_t total_sectors;
-	u_int64_t sector;
+	uint64_t total_sectors;
+	uint64_t sector;
 	int last_is_conv = 1;
 	int ret = -1;
 
@@ -433,8 +433,8 @@ int f2fs_reset_zones(int j)
 	struct blk_zone_report *rep;
 	struct blk_zone *blkz;
 	struct blk_zone_range range;
-	u_int64_t total_sectors;
-	u_int64_t sector;
+	uint64_t total_sectors;
+	uint64_t sector;
 	unsigned int i;
 	int ret = -1;
 
@@ -522,7 +522,7 @@ uint32_t f2fs_get_usable_segments(struct f2fs_super_block *sb)
 
 #else
 
-int f2fs_report_zone(int i, u_int64_t UNUSED(sector), void *UNUSED(blkzone))
+int f2fs_report_zone(int i, uint64_t UNUSED(sector), void *UNUSED(blkzone))
 {
 	ERR_MSG("%d: Unsupported zoned block device\n", i);
 	return -1;
diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
index d237d1a8c12e..8bd33ac003c5 100644
--- a/mkfs/f2fs_format.c
+++ b/mkfs/f2fs_format.c
@@ -199,18 +199,18 @@ static void verify_cur_segs(void)
 
 static int f2fs_prepare_super_block(void)
 {
-	u_int32_t blk_size_bytes;
-	u_int32_t log_sectorsize, log_sectors_per_block;
-	u_int32_t log_blocksize, log_blks_per_seg;
-	u_int32_t segment_size_bytes, zone_size_bytes;
-	u_int32_t sit_segments, nat_segments;
-	u_int32_t blocks_for_sit, blocks_for_nat, blocks_for_ssa;
-	u_int32_t total_valid_blks_available;
-	u_int64_t zone_align_start_offset, diff;
-	u_int64_t total_meta_zones, total_meta_segments;
-	u_int32_t sit_bitmap_size, max_sit_bitmap_size;
-	u_int32_t max_nat_bitmap_size, max_nat_segments;
-	u_int32_t total_zones, avail_zones;
+	uint32_t blk_size_bytes;
+	uint32_t log_sectorsize, log_sectors_per_block;
+	uint32_t log_blocksize, log_blks_per_seg;
+	uint32_t segment_size_bytes, zone_size_bytes;
+	uint32_t sit_segments, nat_segments;
+	uint32_t blocks_for_sit, blocks_for_nat, blocks_for_ssa;
+	uint32_t total_valid_blks_available;
+	uint64_t zone_align_start_offset, diff;
+	uint64_t total_meta_zones, total_meta_segments;
+	uint32_t sit_bitmap_size, max_sit_bitmap_size;
+	uint32_t max_nat_bitmap_size, max_nat_segments;
+	uint32_t total_zones, avail_zones;
 	enum quota_type qtype;
 	int i;
 
@@ -243,10 +243,10 @@ static int f2fs_prepare_super_block(void)
 	set_sb(block_count, c.total_sectors >> log_sectors_per_block);
 
 	zone_align_start_offset =
-		((u_int64_t) c.start_sector * DEFAULT_SECTOR_SIZE +
+		((uint64_t) c.start_sector * DEFAULT_SECTOR_SIZE +
 		2 * F2FS_BLKSIZE + zone_size_bytes - 1) /
 		zone_size_bytes * zone_size_bytes -
-		(u_int64_t) c.start_sector * DEFAULT_SECTOR_SIZE;
+		(uint64_t) c.start_sector * DEFAULT_SECTOR_SIZE;
 
 	if (c.feature & cpu_to_le32(F2FS_FEATURE_RO))
 		zone_align_start_offset = 8192;
@@ -363,7 +363,7 @@ static int f2fs_prepare_super_block(void)
 		/* use cp_payload if free space of f2fs_checkpoint is not enough */
 		if (max_sit_bitmap_size + max_nat_bitmap_size >
 						MAX_BITMAP_SIZE_IN_CKPT) {
-			u_int32_t diff =  max_sit_bitmap_size +
+			uint32_t diff =  max_sit_bitmap_size +
 						max_nat_bitmap_size -
 						MAX_BITMAP_SIZE_IN_CKPT;
 			set_sb(cp_payload, F2FS_BLK_ALIGN(diff));
@@ -606,15 +606,15 @@ static int f2fs_prepare_super_block(void)
 
 static int f2fs_init_sit_area(void)
 {
-	u_int32_t blk_size, seg_size;
-	u_int32_t index = 0;
-	u_int64_t sit_seg_addr = 0;
-	u_int8_t *zero_buf = NULL;
+	uint32_t blk_size, seg_size;
+	uint32_t index = 0;
+	uint64_t sit_seg_addr = 0;
+	uint8_t *zero_buf = NULL;
 
 	blk_size = 1 << get_sb(log_blocksize);
 	seg_size = (1 << get_sb(log_blocks_per_seg)) * blk_size;
 
-	zero_buf = calloc(sizeof(u_int8_t), seg_size);
+	zero_buf = calloc(sizeof(uint8_t), seg_size);
 	if(zero_buf == NULL) {
 		MSG(1, "\tError: Calloc Failed for sit_zero_buf!!!\n");
 		return -1;
@@ -640,15 +640,15 @@ static int f2fs_init_sit_area(void)
 
 static int f2fs_init_nat_area(void)
 {
-	u_int32_t blk_size, seg_size;
-	u_int32_t index = 0;
-	u_int64_t nat_seg_addr = 0;
-	u_int8_t *nat_buf = NULL;
+	uint32_t blk_size, seg_size;
+	uint32_t index = 0;
+	uint64_t nat_seg_addr = 0;
+	uint8_t *nat_buf = NULL;
 
 	blk_size = 1 << get_sb(log_blocksize);
 	seg_size = (1 << get_sb(log_blocks_per_seg)) * blk_size;
 
-	nat_buf = calloc(sizeof(u_int8_t), seg_size);
+	nat_buf = calloc(sizeof(uint8_t), seg_size);
 	if (nat_buf == NULL) {
 		MSG(1, "\tError: Calloc Failed for nat_zero_blk!!!\n");
 		return -1;
@@ -676,11 +676,11 @@ static int f2fs_write_check_point_pack(void)
 {
 	struct f2fs_summary_block *sum = NULL;
 	struct f2fs_journal *journal;
-	u_int32_t blk_size_bytes;
-	u_int32_t nat_bits_bytes, nat_bits_blocks;
+	uint32_t blk_size_bytes;
+	uint32_t nat_bits_bytes, nat_bits_blocks;
 	unsigned char *nat_bits = NULL, *empty_nat_bits;
-	u_int64_t cp_seg_blk = 0;
-	u_int32_t crc = 0, flags;
+	uint64_t cp_seg_blk = 0;
+	uint32_t crc = 0, flags;
 	unsigned int i;
 	char *cp_payload = NULL;
 	char *sum_compact, *sum_compact_p;
@@ -1114,7 +1114,7 @@ free_cp:
 static int f2fs_write_super_block(void)
 {
 	int index;
-	u_int8_t *zero_buff;
+	uint8_t *zero_buff;
 
 	zero_buff = calloc(F2FS_BLKSIZE, 1);
 	if (zero_buff == NULL) {
@@ -1141,11 +1141,11 @@ static int f2fs_write_super_block(void)
 static int f2fs_discard_obsolete_dnode(void)
 {
 	struct f2fs_node *raw_node;
-	u_int64_t next_blkaddr = 0, offset;
+	uint64_t next_blkaddr = 0, offset;
 	u64 end_blkaddr = (get_sb(segment_count_main) <<
 			get_sb(log_blocks_per_seg)) + get_sb(main_blkaddr);
-	u_int64_t start_inode_pos = get_sb(main_blkaddr);
-	u_int64_t last_inode_pos;
+	uint64_t start_inode_pos = get_sb(main_blkaddr);
+	uint64_t last_inode_pos;
 
 	if (c.zoned_mode || c.feature & cpu_to_le32(F2FS_FEATURE_RO))
 		return 0;
@@ -1196,8 +1196,8 @@ static int f2fs_discard_obsolete_dnode(void)
 static int f2fs_write_root_inode(void)
 {
 	struct f2fs_node *raw_node = NULL;
-	u_int64_t blk_size_bytes, data_blk_nor;
-	u_int64_t main_area_node_seg_blk_offset = 0;
+	uint64_t blk_size_bytes, data_blk_nor;
+	uint64_t main_area_node_seg_blk_offset = 0;
 
 	raw_node = calloc(F2FS_BLKSIZE, 1);
 	if (raw_node == NULL) {
@@ -1356,8 +1356,8 @@ static int f2fs_write_default_quota(int qtype, unsigned int blkaddr,
 static int f2fs_write_qf_inode(int qtype, int offset)
 {
 	struct f2fs_node *raw_node = NULL;
-	u_int64_t data_blk_nor;
-	u_int64_t main_area_node_seg_blk_offset = 0;
+	uint64_t data_blk_nor;
+	uint64_t main_area_node_seg_blk_offset = 0;
 	__le32 raw_id;
 	int i;
 
@@ -1419,7 +1419,7 @@ static int f2fs_write_qf_inode(int qtype, int offset)
 static int f2fs_update_nat_root(void)
 {
 	struct f2fs_nat_block *nat_blk = NULL;
-	u_int64_t nat_seg_blk_offset = 0;
+	uint64_t nat_seg_blk_offset = 0;
 	enum quota_type qtype;
 	int i;
 
@@ -1515,7 +1515,7 @@ static block_t f2fs_add_default_dentry_lpf(void)
 static int f2fs_write_lpf_inode(void)
 {
 	struct f2fs_node *raw_node;
-	u_int64_t blk_size_bytes, main_area_node_seg_blk_offset;
+	uint64_t blk_size_bytes, main_area_node_seg_blk_offset;
 	block_t data_blk_nor;
 	int err = 0;
 
@@ -1609,7 +1609,7 @@ exit:
 static int f2fs_add_default_dentry_root(void)
 {
 	struct f2fs_dentry_block *dent_blk = NULL;
-	u_int64_t data_blk_offset = 0;
+	uint64_t data_blk_offset = 0;
 
 	dent_blk = calloc(F2FS_BLKSIZE, 1);
 	if(dent_blk == NULL) {
diff --git a/mkfs/f2fs_format_main.c b/mkfs/f2fs_format_main.c
index 797e90a948f5..d05d4e2cb4e5 100644
--- a/mkfs/f2fs_format_main.c
+++ b/mkfs/f2fs_format_main.c
@@ -253,7 +253,7 @@ static void f2fs_parse_options(int argc, char *argv[])
 			break;
 		case 'S':
 			c.device_size = atoll(optarg);
-			c.device_size &= (~((u_int64_t)(F2FS_BLKSIZE - 1)));
+			c.device_size &= (~((uint64_t)(F2FS_BLKSIZE - 1)));
 			c.sparse_mode = 1;
 			break;
 		case 'z':
diff --git a/mkfs/f2fs_format_utils.c b/mkfs/f2fs_format_utils.c
index f2d55adb7e4b..e84311ae1287 100644
--- a/mkfs/f2fs_format_utils.c
+++ b/mkfs/f2fs_format_utils.c
@@ -52,7 +52,7 @@ static int trim_device(int i)
 	unsigned long long range[2];
 	struct stat *stat_buf;
 	struct device_info *dev = c.devices + i;
-	u_int64_t bytes = dev->total_sectors * dev->sector_size;
+	uint64_t bytes = dev->total_sectors * dev->sector_size;
 	int fd = dev->fd;
 
 	stat_buf = malloc(sizeof(struct stat));
diff --git a/mkfs/f2fs_format_utils.h b/mkfs/f2fs_format_utils.h
index 274db7bff5db..807e7c327601 100644
--- a/mkfs/f2fs_format_utils.h
+++ b/mkfs/f2fs_format_utils.h
@@ -12,6 +12,6 @@
 
 extern struct f2fs_configuration c;
 
-int f2fs_trim_device(int, u_int64_t);
+int f2fs_trim_device(int, uint64_t);
 int f2fs_trim_devices(void);
 int f2fs_format_device(void);
diff --git a/tools/f2fs_io/f2fs_io.h b/tools/f2fs_io/f2fs_io.h
index cdaf00f421fe..bd8db0b724e5 100644
--- a/tools/f2fs_io/f2fs_io.h
+++ b/tools/f2fs_io/f2fs_io.h
@@ -30,10 +30,10 @@
 # define UNUSED(x) x
 #endif
 
-typedef u_int64_t	u64;
-typedef u_int32_t	u32;
-typedef u_int16_t	u16;
-typedef u_int8_t	u8;
+typedef uint64_t	u64;
+typedef uint32_t	u32;
+typedef uint16_t	u16;
+typedef uint8_t		u8;
 
 #ifndef HAVE_LINUX_TYPES_H
 typedef u8	__u8;


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
