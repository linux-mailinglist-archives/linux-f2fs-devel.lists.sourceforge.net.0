Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5684FC1115C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 27 Oct 2025 20:33:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=o9dCb7BDfgJXBXBKzMgQurD1LyyxjeTYf6ncpclw82o=; b=iLV0M9MgQDBTlR9GyOASWXekyZ
	ccNEXDPcjX+CEeQM7cJo9eR/DhgkYMoaxspgsa+y8X5ags/d4cN2OEOWNSAQi9HLtzO6i2EWWznA/
	vuwNBNU7eVO67gG10/A+plNMSRTZVngVnrZPkiM/uERWTFjn7buJgJK2PJ6mKyW6EK+w=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vDSy8-00011P-Kv;
	Mon, 27 Oct 2025 19:33:28 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1vDSy7-00011I-1U
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Oct 2025 19:33:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lyWBKb2yoIkgrJJnWPjOXQXuOlsGIe2mgRFoQvJyvnM=; b=TKbp5yK2/yr22ARdw0KseFtjJ5
 QSinGfGVmvqtE7HyvGkx7r2sc6eHG60r5wO6XkannSdXadYi8+R1PDcOVD2NgOAXv6x+Cofoup/ch
 YVBWpJDHbEl1/xO+zmzc+aXVek476BYm/0nYRWFUh9JbLBWRMpXskyva4EJw4QM+rUNE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=lyWBKb2yoIkgrJJnWPjOXQXuOlsGIe2mgRFoQvJyvnM=; b=h
 Wv0Ulb7aXMtR2dstjy1UkMW3r366aAMNof6GOwc4xqfm75dsZrIi0Hh8wDOJm01DpdsN1+FVOLAxJ
 2uQMp0Zuzg2PTxO24nxRxqOy4qecNat8C5CGh2i9nXUT2CilknNQZQYQr2uM8YFmWNuvNw1dCCBUj
 fG9HiCyy33i/gBgQ=;
Received: from mail-pl1-f169.google.com ([209.85.214.169])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vDSy5-00010i-QG for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Oct 2025 19:33:26 +0000
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-2907948c1d2so53092325ad.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 27 Oct 2025 12:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761593595; x=1762198395; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lyWBKb2yoIkgrJJnWPjOXQXuOlsGIe2mgRFoQvJyvnM=;
 b=hV52wh2LIcuXeubfEXjZ0m5ctRtFTRpB2ZsGCRQ7siyUvKlwApeqHLoMmUOCgG6F++
 DvIkcg9lneuC+FEsYpEfRvSmWuut1s1yU5euMQrg4gcpNObbf4QQrdwrqFIUkKOWYjvj
 Oes0nrwYnIrmj06iNQmqjA1/zZorTA0xFNLj1vDQfYexr7MkrQ4VY4Z6WNLqMhPxHyz2
 IJ+zO61FyrCbJj5sxqoJ+XZXFp7BXzaAXERm4tCfm8bGCVPOK7qnzbFGiYwicrz8P1Bb
 mLckU/G3vW7WlXm6U45MON573GHguWBsBZX8p/lrPTzgqy/9qHdBTByDmDds2X2gVXdE
 7HnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761593595; x=1762198395;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lyWBKb2yoIkgrJJnWPjOXQXuOlsGIe2mgRFoQvJyvnM=;
 b=YAnFi7M1bYWvWc3kWR2DXpOlSDEW6egSlyM3qfSNqmxinp5tc+Y5Idvdr/xST5izKQ
 6aongl95JV4EmUS9v+Nsml6u0m3toyslDCPllHJBE4Sh+B9mjlMC+ZHcIF8QZvYFTN4O
 JY90I+7MeSogKkWq+UMJmqPyCwwvnExgFawjQpd4vdLOfW1bwcv2ocYh9sLF32D34YDd
 VmXih4Q99vhZikvNZ1QpAOHV/wwyj5UwniyYSymVrpzQ0ckHeiH6/pnpz7FccwpBi6FG
 JNJ+BZ03fwnl2D6s1nvKiIIWrq6tp+XLpDLj7mvUVBvqkSbOyp8a0HVurITuRB5mQCRg
 rXBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpm8YZSlbQGVNgVOcOfBJgzQPLpZB5D5IJSRxbiNcMkFwUCDOjB5UU0Q84DIwFW7u44szUYs1eHLrtN57VJ4DH@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxrrqnRyQ0IOVRvu+fDJdRGBFAEwyN3fY2hGer06O9pElSU/3Jc
 GqYsd9IW/Tk+2TCZqcxMZprVsNiCTFEDdh4Sx4GmPL6vvul/bnQZNgNE
X-Gm-Gg: ASbGncvaO6b8CZIl9KoNao42nLZxcOD/fg5A15GWcsdloLmf6i9c2vzLZscHbgGN/6/
 RbdZYd87iC5BEZHsQgOamzrrhB943NQPQzvrkl2MVPKpaH0S7D2rHriMbaEY/VvCbXyzrwU6NY3
 WvY/XJbm6I7D7HFnFVLBZYR28/zWZ7s7D7I8DvRQjLm+m/M3+agvogkR+3+lmuA6pf0jIQTrfO9
 s46pB38FB+KJmObA+A/p3+iQSeaIj3GkNxZJdvpGbhfviIanHlYFuRVGftGcfQH8oeFs0BNhi0+
 9H+Y4gR2SgfWzMlM0o9GSjNwQuLP8QwFgHb0M5BZLrri+GsSny0zRfehPlWAmN4I9eyi2jONmG/
 UkGzCKIZfK8p3zltRKFPiOxSmyAvriDH/URiP/QUE7qDNxRZsS74BHun4vIqRzn0sDVr3BE2dWr
 MKdSpC1cyfgZfouCLYZckhdF/L39WjuzVJLYZuZ2PkwE0sK/iizda/CEQMbjhvDIWUNbU=
X-Google-Smtp-Source: AGHT+IHsMTbrToOgSfw/axpEq5aA945OrTH9TJkjiHeMvhP5+IJdja0uMyNVev6oemCHmeiLlKtHlw==
X-Received: by 2002:a17:902:d4c3:b0:264:ee2:c3f5 with SMTP id
 d9443c01a7336-294cb39d89cmr11771875ad.19.1761593594807; 
 Mon, 27 Oct 2025 12:33:14 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2a00:79e0:2e7c:8:88a3:d9a1:52ff:2597])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29498cf358fsm89857025ad.20.2025.10.27.12.33.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 12:33:14 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Mon, 27 Oct 2025 12:33:08 -0700
Message-ID: <20251027193308.4013974-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.51.1.838.g19442a804e-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Daeho Jeong The recent increase in the number of
 Segment
 Summary Area (SSA) entries from 512 to 2048 was an unintentional change in
 logic of 16kb block support. This commit corrects the issue. 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.169 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [daeho43(at)gmail.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [daeho43(at)gmail.com]
X-Headers-End: 1vDSy5-00010i-QG
Subject: [f2fs-dev] [PATCH v3] f2fs-tools: revert summary entry count from
 2048 to 512 in 16kb block support
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Daeho Jeong <daehojeong@google.com>

The recent increase in the number of Segment Summary Area (SSA) entries
from 512 to 2048 was an unintentional change in logic of 16kb block
support. This commit corrects the issue.

To better utilize the space available from the erroneous 2048-entry
calculation, we are implementing a solution to share the currently
unused SSA space with neighboring segments. This enhances overall
SSA utilization without impacting the established 8MB segment size.

Fixes: 50fd00b168d7 ("f2fs-tools: Support different block sizes")
Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
v3: add a feature to prevent from mounting deprecated format
v2: detect legacy layout and prevent mount.
    fix ssa block calculation bug in resize tool.
---
 fsck/f2fs.h        | 18 ++++++++++-
 fsck/fsck.c        | 16 +++-------
 fsck/fsck.h        |  5 +++
 fsck/inject.c      |  4 +--
 fsck/mount.c       | 80 +++++++++++++++++++++++++++++++---------------
 fsck/resize.c      | 62 +++++++++++++++++++----------------
 include/f2fs_fs.h  | 15 +++++----
 lib/libf2fs_io.c   | 12 +++++++
 mkfs/f2fs_format.c |  6 +++-
 9 files changed, 143 insertions(+), 75 deletions(-)

diff --git a/fsck/f2fs.h b/fsck/f2fs.h
index 187e73c..538c99e 100644
--- a/fsck/f2fs.h
+++ b/fsck/f2fs.h
@@ -441,8 +441,10 @@ static inline block_t __end_block_addr(struct f2fs_sb_info *sbi)
 	(SM_I(sbi) ? SM_I(sbi)->seg0_blkaddr :				\
 		le32_to_cpu(F2FS_RAW_SUPER(sbi)->segment0_blkaddr))
 
+#define SUMS_PER_BLOCK (F2FS_BLKSIZE / F2FS_SUM_BLKSIZE)
 #define GET_SUM_BLKADDR(sbi, segno)					\
-	((sbi->sm_info->ssa_blkaddr) + segno)
+	((SM_I(sbi)->ssa_blkaddr) + segno / SUMS_PER_BLOCK)
+#define GET_SUM_BLKOFF(segno)	(segno % SUMS_PER_BLOCK)
 
 #define GET_SEGOFF_FROM_SEG0(sbi, blk_addr)				\
 	((blk_addr) - SM_I(sbi)->seg0_blkaddr)
@@ -492,6 +494,20 @@ static inline block_t sum_blk_addr(struct f2fs_sb_info *sbi, int base, int type)
 		- (base + 1) + type;
 }
 
+static inline int write_sum_block(struct f2fs_sb_info *sbi,
+		void *buf, unsigned int segno, enum rw_hint whint)
+{
+	return dev_write_4k_block(buf, GET_SUM_BLKADDR(sbi, segno),
+			GET_SUM_BLKOFF(segno), whint);
+}
+
+static inline int read_sum_block(struct f2fs_sb_info *sbi,
+		void *buf, unsigned int segno)
+{
+	return dev_read_4k_block(buf, GET_SUM_BLKADDR(sbi, segno),
+			GET_SUM_BLKOFF(segno));
+}
+
 /* for the list of fsync inodes, used only during recovery */
 struct fsync_inode_entry {
 	struct list_head list;	/* list head */
diff --git a/fsck/fsck.c b/fsck/fsck.c
index 4c36dc1..d0766a9 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -228,11 +228,9 @@ static int is_valid_ssa_node_blk(struct f2fs_sb_info *sbi, u32 nid,
 		}
 	}
 	if (need_fix && f2fs_dev_is_writable()) {
-		u64 ssa_blk;
 		int ret2;
 
-		ssa_blk = GET_SUM_BLKADDR(sbi, segno);
-		ret2 = dev_write_block(sum_blk, ssa_blk, WRITE_LIFE_NONE);
+		ret2 = write_sum_block(sbi, sum_blk, segno, WRITE_LIFE_NONE);
 		ASSERT(ret2 >= 0);
 	}
 out:
@@ -367,11 +365,9 @@ static int is_valid_ssa_data_blk(struct f2fs_sb_info *sbi, u32 blk_addr,
 		}
 	}
 	if (need_fix && f2fs_dev_is_writable()) {
-		u64 ssa_blk;
 		int ret2;
 
-		ssa_blk = GET_SUM_BLKADDR(sbi, segno);
-		ret2 = dev_write_block(sum_blk, ssa_blk, WRITE_LIFE_NONE);
+		ret2 = write_sum_block(sbi, sum_blk, segno, WRITE_LIFE_NONE);
 		ASSERT(ret2 >= 0);
 	}
 out:
@@ -3879,14 +3875,12 @@ int fsck_verify(struct f2fs_sb_info *sbi)
 			rewrite_sit_area_bitmap(sbi);
 			if (c.zoned_model == F2FS_ZONED_HM) {
 				struct curseg_info *curseg;
-				u64 ssa_blk;
 
 				for (i = 0; i < NO_CHECK_TYPE; i++) {
 					curseg = CURSEG_I(sbi, i);
-					ssa_blk = GET_SUM_BLKADDR(sbi,
-							curseg->segno);
-					ret = dev_write_block(curseg->sum_blk,
-							ssa_blk,
+					ret = write_sum_block(sbi,
+							curseg->sum_blk,
+							curseg->segno,
 							WRITE_LIFE_NONE);
 					ASSERT(ret >= 0);
 				}
diff --git a/fsck/fsck.h b/fsck/fsck.h
index 40cb6d9..7e96b39 100644
--- a/fsck/fsck.h
+++ b/fsck/fsck.h
@@ -292,6 +292,11 @@ extern bool is_sit_bitmap_set(struct f2fs_sb_info *sbi, u32 blk_addr);
 int f2fs_defragment(struct f2fs_sb_info *, u64, u64, u64, int);
 
 /* resize.c */
+#define GET_SUM_NEW_BLKADDR(new_sb, segno)	\
+	(get_newsb(ssa_blkaddr) +		\
+	 (segno >> (get_newsb(log_blocksize) - DEFAULT_BLKSIZE_BITS)))
+#define GET_SUM_NEW_BLKOFF(new_sb, segno)	\
+	(segno % (1 << (get_newsb(log_blocksize) - DEFAULT_BLKSIZE_BITS)))
 int f2fs_resize(struct f2fs_sb_info *);
 
 /* sload.c */
diff --git a/fsck/inject.c b/fsck/inject.c
index bd6ab84..fe5c293 100644
--- a/fsck/inject.c
+++ b/fsck/inject.c
@@ -689,7 +689,6 @@ static int inject_ssa(struct f2fs_sb_info *sbi, struct inject_option *opt)
 	struct summary_footer *footer;
 	struct f2fs_summary *sum;
 	u32 segno, offset;
-	block_t ssa_blkaddr;
 	int type;
 	int ret;
 
@@ -754,8 +753,7 @@ static int inject_ssa(struct f2fs_sb_info *sbi, struct inject_option *opt)
 
 	print_sum_footer_info(footer);
 
-	ssa_blkaddr = GET_SUM_BLKADDR(sbi, segno);
-	ret = dev_write_block(sum_blk, ssa_blkaddr, WRITE_LIFE_NONE);
+	ret = write_sum_block(sbi, sum_blk, segno, WRITE_LIFE_NONE);
 	ASSERT(ret >= 0);
 
 out:
diff --git a/fsck/mount.c b/fsck/mount.c
index a1c4cbb..4959721 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -1170,6 +1170,40 @@ int sanity_check_raw_super(struct f2fs_super_block *sb, enum SB_ADDR sb_addr)
 		return -1;
 	}
 
+	/*
+	 * Check for legacy summary layout on 16KB+ block devices.
+	 * Modern f2fs-tools packs multiple 4KB summary areas into one block,
+	 * whereas legacy versions used one block per summary, leading
+	 * to a much larger SSA.
+	 */
+	if (blocksize != F2FS_MIN_BLKSIZE) {
+		unsigned int required_ssa_blocks;
+		unsigned int expected_ssa_segs;
+		uint64_t total_meta_segments, diff;
+
+		required_ssa_blocks = round_up(get_sb(segment_count_main),
+						SUMS_PER_BLOCK);
+		expected_ssa_segs = round_up(required_ssa_blocks,
+						blocks_per_seg);
+		total_meta_segments = get_sb(segment_count_ckpt) +
+			get_sb(segment_count_sit) +
+			get_sb(segment_count_nat) +
+			expected_ssa_segs;
+		diff = total_meta_segments % segs_per_zone;
+		if (diff)
+			expected_ssa_segs += segs_per_zone - diff;
+
+		if (get_sb(segment_count_ssa) > expected_ssa_segs) {
+			MSG(0, "Error: Device formatted with a legacy version. "
+					"Please reformat.\n");
+			MSG(0, "\tSSA segment count (%u) is larger than "
+					"expected (%u) for block size (%u).\n",
+				get_sb(segment_count_ssa), expected_ssa_segs,
+				blocksize);
+			return -1;
+		}
+	}
+
 	if (sanity_check_area_boundary(sb, sb_addr))
 		return -1;
 	return 0;
@@ -2144,6 +2178,7 @@ static void read_normal_summaries(struct f2fs_sb_info *sbi, int type)
 	struct curseg_info *curseg;
 	unsigned int segno = 0;
 	block_t blk_addr = 0;
+	__u32 blk_offset = 0;
 	int ret;
 
 	if (IS_DATASEG(type)) {
@@ -2154,24 +2189,26 @@ static void read_normal_summaries(struct f2fs_sb_info *sbi, int type)
 			blk_addr = sum_blk_addr(sbi, NR_CURSEG_DATA_TYPE, type);
 	} else {
 		segno = get_cp(cur_node_segno[type - CURSEG_HOT_NODE]);
-		if (is_set_ckpt_flags(cp, CP_UMOUNT_FLAG))
+		if (is_set_ckpt_flags(cp, CP_UMOUNT_FLAG)) {
 			blk_addr = sum_blk_addr(sbi, NR_CURSEG_NODE_TYPE,
 							type - CURSEG_HOT_NODE);
-		else
+		} else {
 			blk_addr = GET_SUM_BLKADDR(sbi, segno);
+			blk_offset = GET_SUM_BLKOFF(segno);
+		}
 	}
 
-	sum_blk = malloc(F2FS_BLKSIZE);
+	sum_blk = malloc(F2FS_SUM_BLKSIZE);
 	ASSERT(sum_blk);
 
-	ret = dev_read_block(sum_blk, blk_addr);
+	ret = dev_read_4k_block(sum_blk, blk_addr, blk_offset);
 	ASSERT(ret >= 0);
 
 	if (IS_NODESEG(type) && !is_set_ckpt_flags(cp, CP_UMOUNT_FLAG))
 		restore_node_summary(sbi, segno, sum_blk);
 
 	curseg = CURSEG_I(sbi, type);
-	memcpy(curseg->sum_blk, sum_blk, F2FS_BLKSIZE);
+	memcpy(curseg->sum_blk, sum_blk, F2FS_SUM_BLKSIZE);
 	reset_curseg(sbi, type);
 	free(sum_blk);
 }
@@ -2199,8 +2236,7 @@ void update_sum_entry(struct f2fs_sb_info *sbi, block_t blk_addr,
 							SUM_TYPE_DATA;
 
 	/* write SSA all the time */
-	ret = dev_write_block(sum_blk, GET_SUM_BLKADDR(sbi, segno),
-			      WRITE_LIFE_NONE);
+	ret = write_sum_block(sbi, sum_blk, segno, WRITE_LIFE_NONE);
 	ASSERT(ret >= 0);
 
 	if (type == SEG_TYPE_NODE || type == SEG_TYPE_DATA ||
@@ -2399,11 +2435,9 @@ struct f2fs_summary_block *get_sum_block(struct f2fs_sb_info *sbi,
 	struct f2fs_summary_block *sum_blk;
 	struct curseg_info *curseg;
 	int type, ret;
-	u64 ssa_blk;
 
 	*ret_type= SEG_TYPE_MAX;
 
-	ssa_blk = GET_SUM_BLKADDR(sbi, segno);
 	for (type = 0; type < NR_CURSEG_NODE_TYPE; type++) {
 		curseg = CURSEG_I(sbi, CURSEG_HOT_NODE + type);
 		if (segno == curseg->segno) {
@@ -2434,10 +2468,10 @@ struct f2fs_summary_block *get_sum_block(struct f2fs_sb_info *sbi,
 		}
 	}
 
-	sum_blk = calloc(F2FS_BLKSIZE, 1);
+	sum_blk = calloc(F2FS_SUM_BLKSIZE, 1);
 	ASSERT(sum_blk);
 
-	ret = dev_read_block(sum_blk, ssa_blk);
+	ret = read_sum_block(sbi, sum_blk, segno);
 	ASSERT(ret >= 0);
 
 	if (IS_SUM_NODE_SEG(sum_blk))
@@ -3054,7 +3088,6 @@ int find_next_free_block(struct f2fs_sb_info *sbi, u64 *to, int left,
 		struct curseg_info *curseg = CURSEG_I(sbi, want_type);
 		unsigned int segs_per_zone = sbi->segs_per_sec * sbi->secs_per_zone;
 		char buf[F2FS_BLKSIZE];
-		u64 ssa_blk;
 		int ret;
 
 		*to = NEXT_FREE_BLKADDR(sbi, curseg);
@@ -3072,17 +3105,15 @@ int find_next_free_block(struct f2fs_sb_info *sbi, u64 *to, int left,
 				segno = GET_SEGNO(sbi, new_blkaddr);
 			}
 
-			ssa_blk = GET_SUM_BLKADDR(sbi, curseg->segno);
-			ret = dev_write_block(curseg->sum_blk, ssa_blk,
-					      WRITE_LIFE_NONE);
+			ret = write_sum_block(sbi, curseg->sum_blk,
+					curseg->segno, WRITE_LIFE_NONE);
 			ASSERT(ret >= 0);
 
 			curseg->segno = segno;
 			curseg->next_blkoff = 0;
 			curseg->alloc_type = LFS;
 
-			ssa_blk = GET_SUM_BLKADDR(sbi, curseg->segno);
-			ret = dev_read_block(&buf, ssa_blk);
+			ret = read_sum_block(sbi, &buf, curseg->segno);
 			ASSERT(ret >= 0);
 
 			memcpy(curseg->sum_blk, &buf, SUM_ENTRIES_SIZE);
@@ -3160,7 +3191,7 @@ void move_one_curseg_info(struct f2fs_sb_info *sbi, u64 from, int left,
 	struct curseg_info *curseg = CURSEG_I(sbi, i);
 	char buf[F2FS_BLKSIZE];
 	u32 old_segno;
-	u64 ssa_blk, to;
+	u64 to;
 	int ret;
 
 	if ((get_sb(feature) & F2FS_FEATURE_RO)) {
@@ -3178,8 +3209,8 @@ void move_one_curseg_info(struct f2fs_sb_info *sbi, u64 from, int left,
 	}
 
 	/* update original SSA too */
-	ssa_blk = GET_SUM_BLKADDR(sbi, curseg->segno);
-	ret = dev_write_block(curseg->sum_blk, ssa_blk, WRITE_LIFE_NONE);
+	ret = write_sum_block(sbi, curseg->sum_blk, curseg->segno,
+			WRITE_LIFE_NONE);
 	ASSERT(ret >= 0);
 bypass_ssa:
 	to = from;
@@ -3193,8 +3224,7 @@ bypass_ssa:
 	curseg->alloc_type = c.zoned_model == F2FS_ZONED_HM ? LFS : SSR;
 
 	/* update new segno */
-	ssa_blk = GET_SUM_BLKADDR(sbi, curseg->segno);
-	ret = dev_read_block(buf, ssa_blk);
+	ret = read_sum_block(sbi, buf, curseg->segno);
 	ASSERT(ret >= 0);
 
 	memcpy(curseg->sum_blk, buf, SUM_ENTRIES_SIZE);
@@ -3440,7 +3470,6 @@ void write_checkpoint(struct f2fs_sb_info *sbi)
 	/* update summary blocks having nullified journal entries */
 	for (i = 0; i < NO_CHECK_TYPE; i++) {
 		struct curseg_info *curseg = CURSEG_I(sbi, i);
-		u64 ssa_blk;
 
 		if (!(flags & CP_UMOUNT_FLAG) && IS_NODESEG(i))
 			continue;
@@ -3451,9 +3480,8 @@ void write_checkpoint(struct f2fs_sb_info *sbi)
 
 		if (!(get_sb(feature) & F2FS_FEATURE_RO)) {
 			/* update original SSA too */
-			ssa_blk = GET_SUM_BLKADDR(sbi, curseg->segno);
-			ret = dev_write_block(curseg->sum_blk, ssa_blk,
-					      WRITE_LIFE_NONE);
+			ret = write_sum_block(sbi, curseg->sum_blk,
+					curseg->segno, WRITE_LIFE_NONE);
 			ASSERT(ret >= 0);
 		}
 	}
diff --git a/fsck/resize.c b/fsck/resize.c
index 58914ec..f71290a 100644
--- a/fsck/resize.c
+++ b/fsck/resize.c
@@ -115,7 +115,8 @@ static int get_new_sb(struct f2fs_super_block *sb)
 			get_sb(segment_count_sit) +
 			get_sb(segment_count_nat))) * blks_per_seg;
 
-	blocks_for_ssa = total_valid_blks_available / blks_per_seg + 1;
+	blocks_for_ssa = round_up(total_valid_blks_available / blks_per_seg,
+			SUMS_PER_BLOCK);
 
 	set_sb(segment_count_ssa, SEG_ALIGN(blocks_for_ssa));
 
@@ -209,23 +210,24 @@ static void migrate_main(struct f2fs_sb_info *sbi, unsigned int offset)
 				START_BLOCK(sbi, 0) + offset);
 }
 
-static void move_ssa(struct f2fs_sb_info *sbi, unsigned int segno,
-					block_t new_sum_blk_addr)
+static void move_ssa(struct f2fs_sb_info *sbi, struct f2fs_super_block *new_sb,
+		unsigned int old_segno, unsigned int new_segno)
 {
 	struct f2fs_summary_block *sum_blk;
 	int type;
 
-	sum_blk = get_sum_block(sbi, segno, &type);
+	sum_blk = get_sum_block(sbi, old_segno, &type);
 	if (type < SEG_TYPE_MAX) {
 		int ret;
+		u64 new_blkaddr = GET_SUM_NEW_BLKADDR(new_sb, new_segno);
+		u32 new_blkoff = GET_SUM_NEW_BLKOFF(new_sb, new_segno);
 
-		ret = dev_write_block(sum_blk, new_sum_blk_addr,
-				      WRITE_LIFE_NONE);
+		ret = dev_write_4k_block(sum_blk, new_blkaddr, new_blkoff,
+				WRITE_LIFE_NONE);
 		ASSERT(ret >= 0);
 		DBG(1, "Write summary block: (%d) segno=%x/%x --> (%d) %x\n",
-				type, segno, GET_SUM_BLKADDR(sbi, segno),
-				IS_SUM_NODE_SEG(sum_blk),
-				new_sum_blk_addr);
+			type, old_segno, GET_SUM_BLKADDR(sbi, old_segno),
+			IS_SUM_NODE_SEG(sum_blk), (unsigned int)new_blkaddr);
 	}
 	if (type == SEG_TYPE_NODE || type == SEG_TYPE_DATA ||
 			type == SEG_TYPE_MAX) {
@@ -240,36 +242,42 @@ static void migrate_ssa(struct f2fs_sb_info *sbi,
 	struct f2fs_super_block *sb = F2FS_RAW_SUPER(sbi);
 	block_t old_sum_blkaddr = get_sb(ssa_blkaddr);
 	block_t new_sum_blkaddr = get_newsb(ssa_blkaddr);
-	block_t end_sum_blkaddr = get_newsb(main_blkaddr);
-	block_t expand_sum_blkaddr = new_sum_blkaddr +
-					MAIN_SEGS(sbi) - offset;
-	block_t blkaddr;
+	unsigned int expand_segno = MAIN_SEGS(sbi) - offset;
+	unsigned int new_seg_total = get_newsb(segment_count);
+	int new_segno;
 	int ret;
-	void *zero_block = calloc(F2FS_BLKSIZE, 1);
+	void *zero_block = calloc(F2FS_SUM_BLKSIZE, 1);
 	ASSERT(zero_block);
 
-	if (offset && new_sum_blkaddr < old_sum_blkaddr + offset) {
-		blkaddr = new_sum_blkaddr;
-		while (blkaddr < end_sum_blkaddr) {
-			if (blkaddr < expand_sum_blkaddr) {
-				move_ssa(sbi, offset++, blkaddr++);
+	if (offset && new_sum_blkaddr <= (old_sum_blkaddr +
+				offset / SUMS_PER_BLOCK)) {
+		new_segno = 0;
+		while (new_segno < new_seg_total) {
+			if (new_segno < expand_segno) {
+				move_ssa(sbi, new_sb, offset++, new_segno);
 			} else {
-				ret = dev_write_block(zero_block, blkaddr++,
-						      WRITE_LIFE_NONE);
+				ret = dev_write_4k_block(zero_block,
+					GET_SUM_NEW_BLKADDR(new_sb, new_segno),
+					GET_SUM_NEW_BLKOFF(new_sb, new_segno),
+					WRITE_LIFE_NONE);
 				ASSERT(ret >=0);
 			}
+			new_segno++;
 		}
 	} else {
-		blkaddr = end_sum_blkaddr - 1;
+		new_segno = new_seg_total - 1;
 		offset = MAIN_SEGS(sbi) - 1;
-		while (blkaddr >= new_sum_blkaddr) {
-			if (blkaddr >= expand_sum_blkaddr) {
-				ret = dev_write_block(zero_block, blkaddr--,
-						      WRITE_LIFE_NONE);
+		while (new_segno >= 0) {
+			if (new_segno >= expand_segno) {
+				ret = dev_write_4k_block(zero_block,
+					GET_SUM_NEW_BLKADDR(new_sb, new_segno),
+					GET_SUM_NEW_BLKOFF(new_sb, new_segno),
+					WRITE_LIFE_NONE);
 				ASSERT(ret >=0);
 			} else {
-				move_ssa(sbi, offset--, blkaddr--);
+				move_ssa(sbi, new_sb, offset--, new_segno);
 			}
+			new_segno--;
 		}
 	}
 
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index bd75dbb..88a854a 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -655,6 +655,7 @@ enum {
 #define F2FS_MIN_BLKSIZE		4096
 #define F2FS_MAX_BLKSIZE		16384
 #define F2FS_BLKSIZE			c.blksize	/* support configurable block size */
+#define F2FS_SUM_BLKSIZE		4096
 #define F2FS_MAX_EXTENSION		64	/* # of extension entries */
 #define F2FS_EXTENSION_LEN		8	/* max size of extension */
 #define F2FS_BLK_ALIGN(x)	(((x) + F2FS_BLKSIZE - 1) / F2FS_BLKSIZE)
@@ -1218,7 +1219,7 @@ struct f2fs_sit_block {
  * from node's page's beginning to get a data block address.
  * ex) data_blkaddr = (block_t)(nodepage_start_address + ofs_in_node)
  */
-#define ENTRIES_IN_SUM		(F2FS_BLKSIZE / 8)
+#define ENTRIES_IN_SUM		(F2FS_SUM_BLKSIZE / 8)
 #define	SUMMARY_SIZE		(7)	/* sizeof(struct summary) */
 #define	SUM_FOOTER_SIZE		(5)	/* sizeof(struct summary_footer) */
 #define SUM_ENTRIES_SIZE	(SUMMARY_SIZE * ENTRIES_IN_SUM)
@@ -1248,7 +1249,7 @@ struct summary_footer {
 
 static_assert(sizeof(struct summary_footer) == 5, "");
 
-#define SUM_JOURNAL_SIZE	(F2FS_BLKSIZE - SUM_FOOTER_SIZE -\
+#define SUM_JOURNAL_SIZE	(F2FS_SUM_BLKSIZE - SUM_FOOTER_SIZE -\
 				SUM_ENTRIES_SIZE)
 #define NAT_JOURNAL_ENTRIES	((SUM_JOURNAL_SIZE - 2) /\
 				sizeof(struct nat_journal_entry))
@@ -1347,7 +1348,7 @@ struct f2fs_summary_block {
 };
 #define F2FS_SUMMARY_BLOCK_JOURNAL(blk) ((struct f2fs_journal *)(&(blk)->entries[ENTRIES_IN_SUM]))
 #define F2FS_SUMMARY_BLOCK_FOOTER(blk) ((struct summary_footer *)&((char *)\
-					(&(blk)->entries[0]))[F2FS_BLKSIZE - SUM_FOOTER_SIZE])
+		(&(blk)->entries[0]))[F2FS_SUM_BLKSIZE - SUM_FOOTER_SIZE])
 
 /*
  * For directory operations
@@ -1709,6 +1710,8 @@ extern int dev_fill_block(void *, __u64, enum rw_hint);
 
 extern int dev_read_block(void *, __u64);
 extern int dev_reada_block(__u64);
+extern int dev_write_4k_block(void *, __u64, __u32, enum rw_hint);
+extern int dev_read_4k_block(void *, __u64, __u32);
 
 extern int dev_read_version(void *, __u64, size_t);
 extern void get_kernel_version(__u8 *);
@@ -2159,18 +2162,18 @@ static inline void check_block_struct_sizes(void)
 	assert(sizeof(struct f2fs_summary) * ENTRIES_IN_SUM
 			+ offsetof(struct f2fs_journal, nat_j)
 			+ NAT_JOURNAL_ENTRIES * sizeof(struct nat_journal_entry)
-			+ NAT_JOURNAL_RESERVED + sizeof(struct summary_footer) == F2FS_BLKSIZE);
+			+ NAT_JOURNAL_RESERVED + sizeof(struct summary_footer) == F2FS_SUM_BLKSIZE);
 
 	/* Check SIT Journal Block Size */
 	assert(sizeof(struct f2fs_summary) * ENTRIES_IN_SUM
 			+ offsetof(struct f2fs_journal, sit_j)
 			+ SIT_JOURNAL_ENTRIES * sizeof(struct sit_journal_entry)
-			+ SIT_JOURNAL_RESERVED + sizeof(struct summary_footer) == F2FS_BLKSIZE);
+			+ SIT_JOURNAL_RESERVED + sizeof(struct summary_footer) == F2FS_SUM_BLKSIZE);
 
 	/* Check Info Journal Block Size */
 	assert(sizeof(struct f2fs_summary) * ENTRIES_IN_SUM + sizeof(__le64)
 			+ offsetof(struct f2fs_journal, info)
-			+ EXTRA_INFO_RESERVED + sizeof(struct summary_footer) == F2FS_BLKSIZE);
+			+ EXTRA_INFO_RESERVED + sizeof(struct summary_footer) == F2FS_SUM_BLKSIZE);
 
 	/* Check Dentry Block Size */
 	assert(sizeof(__u8) * (SIZE_OF_DENTRY_BITMAP + SIZE_OF_RESERVED)
diff --git a/lib/libf2fs_io.c b/lib/libf2fs_io.c
index 2030440..919318e 100644
--- a/lib/libf2fs_io.c
+++ b/lib/libf2fs_io.c
@@ -734,6 +734,18 @@ int dev_reada_block(__u64 blk_addr)
 	return dev_readahead(blk_addr << F2FS_BLKSIZE_BITS, F2FS_BLKSIZE);
 }
 
+int dev_write_4k_block(void *buf, __u64 blk_addr, __u32 offset, enum rw_hint whint)
+{
+	return dev_write(buf, (blk_addr << F2FS_BLKSIZE_BITS) + offset * 4096,
+			4096, whint);
+}
+
+int dev_read_4k_block(void *buf, __u64 blk_addr, __u32 offset)
+{
+	return dev_read(buf, (blk_addr << F2FS_BLKSIZE_BITS) + offset * 4096,
+			4096);
+}
+
 int f2fs_fsync_device(void)
 {
 #ifdef HAVE_FSYNC
diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
index 6deb671..6efad45 100644
--- a/mkfs/f2fs_format.c
+++ b/mkfs/f2fs_format.c
@@ -500,8 +500,12 @@ static int f2fs_prepare_super_block(void)
 	if (c.feature & F2FS_FEATURE_RO) {
 		blocks_for_ssa = 0;
 	} else {
+		unsigned int ssa_per_block;
+
 		ASSERT((total_valid_blks_available % c.blks_per_seg) == 0);
-		blocks_for_ssa = total_valid_blks_available / c.blks_per_seg;
+		ssa_per_block = c.blksize / F2FS_SUM_BLKSIZE;
+		blocks_for_ssa = round_up(total_valid_blks_available /
+				c.blks_per_seg,	ssa_per_block);
 	}
 
 	set_sb(segment_count_ssa, SEG_ALIGN(blocks_for_ssa));
-- 
2.51.1.838.g19442a804e-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
