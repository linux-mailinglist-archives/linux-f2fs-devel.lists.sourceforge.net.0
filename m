Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A487891CD
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 26 Aug 2023 00:44:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qZfXS-00020y-2w;
	Fri, 25 Aug 2023 22:44:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <3ui7pZAYKAOkOcZdPYRZZRWP.NZX@flex--drosen.bounces.google.com>)
 id 1qZfXP-00020d-1y for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Aug 2023 22:44:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ho3I6bC/6dZHaaLIiUYtafwWZw5KFog8yCN8vQtyLIw=; b=DT8ikGiFFLZTgf33MDJ64NtKZF
 sjnvb/sdLfxpUksY7omhdgiIcGHVqMCp9yRrlXHkpbGKtAUDbQsCge93a09XMXfhbS1wzedHwmg/x
 MFSld7D3eZJ/B2oMsxahSclSoVMgWoy2AfG/4OWHVIAQOtEbEeUpFEJxHzH2D7sMrBwg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ho3I6bC/6dZHaaLIiUYtafwWZw5KFog8yCN8vQtyLIw=; b=F0hMsIj34/jSLrsSmnnzXZCoY1
 K8Uv4ON1dDNLrP6xmZSYKulrwi7VY/3gbCGwMK7RenaOPR+e1kgJQdHXzg8MGo/AEwTfBxGN9xwG6
 nULctHMeA6F96SbmdTYVE0d53cmBEf0X/JlAqmgICL//lXUekhIaaOGn8ofqGFnO7RL0=;
Received: from mail-yb1-f202.google.com ([209.85.219.202])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qZfXM-00FcAM-Bp for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Aug 2023 22:44:17 +0000
Received: by mail-yb1-f202.google.com with SMTP id
 3f1490d57ef6-d74a0f88457so1724948276.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 25 Aug 2023 15:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1693003450; x=1693608250;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=ho3I6bC/6dZHaaLIiUYtafwWZw5KFog8yCN8vQtyLIw=;
 b=KtGoW6tioHuE3VJrToVL3gwYAzrtNM/yPHT3PFIkWqMQpgOMUp9X1ioBcCksrWURoR
 R7g/af1tsHysegCYK9s6Fl943dIcRzFp84ymNf0OuvQ5D4mB5Zpsd4rdmWbV4WxNISnX
 eL4Rt8TyWHgQMQaBk3QNie+GrrvgH+yZ7HSfcYBOdsDaG4hbfimn+CQG/QSvGDYw+0SC
 f8FkouiVpSZObL8F22DnmIL+cmt453hJ/sLb4Ts/AWMdziBUnbhPVSqXsySsldgaQcQt
 HmCIVz2MEUZ2/ycfv5hSWonGXbcux9gzMmo7OWM8VJTFmsBVYZJB1VjF9/kquUXGknyI
 Pwyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693003450; x=1693608250;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ho3I6bC/6dZHaaLIiUYtafwWZw5KFog8yCN8vQtyLIw=;
 b=CcHnxTydVkkotX6EU9Ya5kFoHbLxbBt8qX/E5GHSAO//xUZAiUlX99e65ke35LsRMh
 wbn8cV4tcNbyOz9AQXKZFy99mw81KumCwLS4pzshV7jOggY5fGKlpaESNtRK5aM5PAnv
 jrF39DcuuKUOFmrvQSfw/bzXIhCaPe7Bvy+7eYfTIuM+X14X9z87uabjfQ+OvREo6xiN
 RW2yDtDunIgD4cXW7PFK5Kj4hCYvCtIgtUGVA/qZyLvBaCfiv+e436U2I0FxM8vIKBzD
 UBt6Q9HBzMbqBuGE1CzC8kQLrOS13T1o+5jPYcyC9ff575wq+GmoZjOP6oF8Eb6VVPqO
 rxgw==
X-Gm-Message-State: AOJu0YwbSFLKMwDHQttF3CwIXGYDaSPTyvPr/qiPIMKIkXBJW97Je+a1
 7Ulwa3WVPPz+I2f7jSXKWGaK+T3kBl1VO8lnVYAkFYs5oeman8nbnFWUsWayYREjH+KOd8yx64n
 1wUwcRQeZKh8K1TU46iaPunHPrThdzJxAfXRBeELRS5EUR3yE8B6RO9MaWn6mk7LZC+cWJ5mtJV
 MDkGTX5C8=
X-Google-Smtp-Source: AGHT+IEjKzkzS2g8erJd13mpRjsMIXJIAcUoszPOKghGEGrpnPngmachtqm+kFM57AGWSugNH5f8woBaqXU=
X-Received: from drosen.mtv.corp.google.com
 ([2620:15c:211:201:ad1d:adc4:c021:b463])
 (user=drosen job=sendgmr) by 2002:a5b:991:0:b0:d07:9d79:881c with SMTP id
 c17-20020a5b0991000000b00d079d79881cmr541440ybq.11.1693003450649; Fri, 25 Aug
 2023 15:44:10 -0700 (PDT)
Date: Fri, 25 Aug 2023 15:43:54 -0700
In-Reply-To: <20230825224400.2206278-1-drosen@google.com>
Mime-Version: 1.0
References: <20230825224400.2206278-1-drosen@google.com>
X-Mailer: git-send-email 2.42.0.rc2.253.gd59a3bf2b4-goog
Message-ID: <20230825224400.2206278-2-drosen@google.com>
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -7.7 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This converts the various block size based constants to be
 defined in terms of the block size. This makes it possible to change the
 block size by changing only F2FS_BLKSIZE_BITS in f2fs_fs.h Signed-off-by:
 Daniel Rosenberg <drosen@google.com> --- fsck/dir.c | 2 +- fsck/dump.c | 4
 +- fsck/fsck.h | 2 +- fsck/mount.c | 6 +-- include/f2fs_fs.h | 81
 ++++++++++++++++++++++ man [...] 
 Content analysis details:   (-7.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
 welcome-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.202 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.219.202 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1qZfXM-00FcAM-Bp
Subject: [f2fs-dev] [PATCH v2 1/7] f2fs-tools: Define constants in terms of
 BLKSIZE
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
From: Daniel Rosenberg via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Daniel Rosenberg <drosen@google.com>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, kernel-team@android.com,
 Daniel Rosenberg <drosen@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This converts the various block size based constants to be defined in
terms of the block size. This makes it possible to change the block size
by changing only F2FS_BLKSIZE_BITS in f2fs_fs.h

Signed-off-by: Daniel Rosenberg <drosen@google.com>
---
 fsck/dir.c               |  2 +-
 fsck/dump.c              |  4 +-
 fsck/fsck.h              |  2 +-
 fsck/mount.c             |  6 +--
 include/f2fs_fs.h        | 81 ++++++++++++++++++++++------------------
 man/sload.f2fs.8         |  2 +-
 mkfs/f2fs_format.c       | 12 +++---
 mkfs/f2fs_format_main.c  |  2 +-
 mkfs/f2fs_format_utils.c |  2 +-
 9 files changed, 61 insertions(+), 52 deletions(-)

diff --git a/fsck/dir.c b/fsck/dir.c
index a20aa8b..33f83ee 100644
--- a/fsck/dir.c
+++ b/fsck/dir.c
@@ -474,7 +474,7 @@ static void init_inode_block(struct f2fs_sb_info *sbi,
 
 	if (de->file_type == F2FS_FT_DIR) {
 		mode |= S_IFDIR;
-		size = 4096;
+		size = F2FS_BLKSIZE;
 		links++;
 		blocks++;
 	} else if (de->file_type == F2FS_FT_REG_FILE) {
diff --git a/fsck/dump.c b/fsck/dump.c
index e7a1c5c..a3fb9bc 100644
--- a/fsck/dump.c
+++ b/fsck/dump.c
@@ -687,8 +687,8 @@ static void dump_data_offset(u32 blk_addr, int ofs_in_node)
 	bidx +=  ofs_in_node;
 
 	setlocale(LC_ALL, "");
-	MSG(0, " - Data offset       : 0x%x (4KB), %'u (bytes)\n",
-				bidx, bidx * 4096);
+	MSG(0, " - Data offset       : 0x%x (BLOCK), %'u (bytes)\n",
+				bidx, bidx * F2FS_BLKSIZE);
 	free(node_blk);
 }
 
diff --git a/fsck/fsck.h b/fsck/fsck.h
index 0f7caf4..89d0b22 100644
--- a/fsck/fsck.h
+++ b/fsck/fsck.h
@@ -126,7 +126,7 @@ struct f2fs_fsck {
 	struct quota_ctx *qctx;
 };
 
-#define BLOCK_SZ		4096
+#define BLOCK_SZ		F2FS_BLKSIZE
 struct block {
 	unsigned char buf[BLOCK_SZ];
 };
diff --git a/fsck/mount.c b/fsck/mount.c
index 5e687a8..f09e468 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -995,8 +995,8 @@ int sanity_check_raw_super(struct f2fs_super_block *sb, enum SB_ADDR sb_addr)
 
 	blocksize = 1 << get_sb(log_blocksize);
 	if (F2FS_BLKSIZE != blocksize) {
-		MSG(0, "Invalid blocksize (%u), supports only 4KB\n",
-			blocksize);
+		MSG(0, "Invalid blocksize (%u), supports only (%u)\n",
+			blocksize, F2FS_BLKSIZE);
 		return -1;
 	}
 
@@ -1007,7 +1007,7 @@ int sanity_check_raw_super(struct f2fs_super_block *sb, enum SB_ADDR sb_addr)
 		return -1;
 	}
 
-	/* Currently, support 512/1024/2048/4096 bytes sector size */
+	/* Currently, support powers of 2 from 512 to BLOCK SIZE bytes sector size */
 	if (get_sb(log_sectorsize) > F2FS_MAX_LOG_SECTOR_SIZE ||
 			get_sb(log_sectorsize) < F2FS_MIN_LOG_SECTOR_SIZE) {
 		MSG(0, "Invalid log sectorsize (%u)\n", get_sb(log_sectorsize));
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 7e7db22..6975143 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -385,18 +385,18 @@ static inline uint64_t bswap_64(uint64_t val)
 #define SECTOR_SHIFT		9
 #endif
 #define F2FS_SUPER_MAGIC	0xF2F52010	/* F2FS Magic Number */
-#define CP_CHKSUM_OFFSET	4092
+#define CP_CHKSUM_OFFSET	(F2FS_BLKSIZE - sizeof(__le32))
 #define SB_CHKSUM_OFFSET	3068
 #define MAX_PATH_LEN		64
 #define MAX_DEVICES		8
 
 #define F2FS_BYTES_TO_BLK(bytes)    ((bytes) >> F2FS_BLKSIZE_BITS)
-#define F2FS_BLKSIZE_BITS 12
+#define F2FS_BLKSIZE_BITS 12	/* 4KB block */
 
 /* for mkfs */
 #define	F2FS_NUMBER_OF_CHECKPOINT_PACK	2
 #define	DEFAULT_SECTOR_SIZE		512
-#define	DEFAULT_SECTORS_PER_BLOCK	8
+#define	DEFAULT_SECTORS_PER_BLOCK	(1 << (F2FS_BLKSIZE_BITS - SECTOR_SHIFT))
 #define	DEFAULT_BLOCKS_PER_SEGMENT	512
 #define DEFAULT_SEGMENTS_PER_SECTION	1
 
@@ -627,8 +627,8 @@ enum {
  */
 #define F2FS_SUPER_OFFSET		1024	/* byte-size offset */
 #define F2FS_MIN_LOG_SECTOR_SIZE	9	/* 9 bits for 512 bytes */
-#define F2FS_MAX_LOG_SECTOR_SIZE	12	/* 12 bits for 4096 bytes */
-#define F2FS_BLKSIZE			4096	/* support only 4KB block */
+#define F2FS_MAX_LOG_SECTOR_SIZE	F2FS_BLKSIZE_BITS	/* 12 bits for 4096 bytes */
+#define F2FS_BLKSIZE			(1 << F2FS_BLKSIZE_BITS)/* support only 4KB block */
 #define F2FS_MAX_EXTENSION		64	/* # of extension entries */
 #define F2FS_EXTENSION_LEN		8	/* max size of extension */
 #define F2FS_BLK_ALIGN(x)	(((x) + F2FS_BLKSIZE - 1) / F2FS_BLKSIZE)
@@ -642,7 +642,7 @@ enum {
 #define F2FS_META_INO(sbi)	(sbi->meta_ino_num)
 
 #define F2FS_MAX_QUOTAS		3
-#define QUOTA_DATA		2
+#define QUOTA_DATA		(((1024 * 6 - 1) / F2FS_BLKSIZE) + 1)
 #define QUOTA_INO(sb,t)	(le32_to_cpu((sb)->qf_ino[t]))
 
 /*
@@ -853,7 +853,7 @@ static_assert(sizeof(struct f2fs_checkpoint) == 192, "");
 /*
  * For orphan inode management
  */
-#define F2FS_ORPHANS_PER_BLOCK	1020
+#define F2FS_ORPHANS_PER_BLOCK	((F2FS_BLKSIZE - 4 * sizeof(__le32)) / sizeof(__le32))
 
 struct f2fs_orphan_block {
 	__le32 ino[F2FS_ORPHANS_PER_BLOCK];	/* inode numbers */
@@ -864,7 +864,7 @@ struct f2fs_orphan_block {
 	__le32 check_sum;	/* CRC32 for orphan inode block */
 };
 
-static_assert(sizeof(struct f2fs_orphan_block) == 4096, "");
+static_assert(sizeof(struct f2fs_orphan_block) == F2FS_BLKSIZE, "");
 
 /*
  * For NODE structure
@@ -884,13 +884,31 @@ static_assert(sizeof(struct f2fs_extent) == 12, "");
 
 /* 200 bytes for inline xattrs by default */
 #define DEFAULT_INLINE_XATTR_ADDRS	50
-#define DEF_ADDRS_PER_INODE	923	/* Address Pointers in an Inode */
+
+struct node_footer {
+	__le32 nid;   /* node id */
+	__le32 ino;   /* inode number */
+	__le32 flag;    /* include cold/fsync/dentry marks and offset */
+	__le64 cp_ver __attribute__((packed));    /* checkpoint version */
+	__le32 next_blkaddr;  /* next node page block address */
+};
+
+static_assert(sizeof(struct node_footer) == 24, "");
+
+#define OFFSET_OF_END_OF_I_EXT    360
+#define SIZE_OF_I_NID     20
+/* Address Pointers in an Inode */
+#define DEF_ADDRS_PER_INODE ((F2FS_BLKSIZE - OFFSET_OF_END_OF_I_EXT \
+				- SIZE_OF_I_NID \
+				- sizeof(struct node_footer)) / sizeof(__le32))
 #define CUR_ADDRS_PER_INODE(inode)	(DEF_ADDRS_PER_INODE - \
 					__get_extra_isize(inode))
 #define ADDRS_PER_INODE(i)	addrs_per_inode(i)
-#define DEF_ADDRS_PER_BLOCK	1018	/* Address Pointers in a Direct Block */
+/* Address Pointers in a Direct Block */
+#define DEF_ADDRS_PER_BLOCK ((F2FS_BLKSIZE - sizeof(struct node_footer)) / sizeof(__le32))
 #define ADDRS_PER_BLOCK(i)	addrs_per_block(i)
-#define NIDS_PER_BLOCK          1018	/* Node IDs in an Indirect Block */
+/* Node IDs in an Indirect Block */
+#define NIDS_PER_BLOCK    ((F2FS_BLKSIZE - sizeof(struct node_footer)) / sizeof(__le32))
 
 #define	NODE_DIR1_BLOCK		(DEF_ADDRS_PER_INODE + 1)
 #define	NODE_DIR2_BLOCK		(DEF_ADDRS_PER_INODE + 2)
@@ -1024,19 +1042,19 @@ struct f2fs_inode {
 
 static_assert(offsetof(struct f2fs_inode, i_extra_end) -
 	      offsetof(struct f2fs_inode, i_extra_isize) == 36, "");
-static_assert(sizeof(struct f2fs_inode) == 4072, "");
+static_assert(sizeof(struct f2fs_inode) == F2FS_BLKSIZE - 24, "");
 
 struct direct_node {
 	__le32 addr[DEF_ADDRS_PER_BLOCK];	/* array of data block address */
 };
 
-static_assert(sizeof(struct direct_node) == 4072, "");
+static_assert(sizeof(struct direct_node) == F2FS_BLKSIZE - 24, "");
 
 struct indirect_node {
 	__le32 nid[NIDS_PER_BLOCK];	/* array of data block address */
 };
 
-static_assert(sizeof(struct indirect_node) == 4072, "");
+static_assert(sizeof(struct indirect_node) == F2FS_BLKSIZE - 24, "");
 
 enum {
 	COLD_BIT_SHIFT = 0,
@@ -1047,15 +1065,6 @@ enum {
 
 #define XATTR_NODE_OFFSET	((((unsigned int)-1) << OFFSET_BIT_SHIFT) \
 				>> OFFSET_BIT_SHIFT)
-struct node_footer {
-	__le32 nid;		/* node id */
-	__le32 ino;		/* inode nunmber */
-	__le32 flag;		/* include cold/fsync/dentry marks and offset */
-	__le64 cp_ver __attribute__((packed));		/* checkpoint version */
-	__le32 next_blkaddr;	/* next node page block address */
-};
-
-static_assert(sizeof(struct node_footer) == 24, "");
 
 struct f2fs_node {
 	/* can be one of three types: inode, direct, and indirect types */
@@ -1067,7 +1076,7 @@ struct f2fs_node {
 	struct node_footer footer;
 };
 
-static_assert(sizeof(struct f2fs_node) == 4096, "");
+static_assert(sizeof(struct f2fs_node) == F2FS_BLKSIZE, "");
 
 /*
  * For NAT entries
@@ -1089,7 +1098,7 @@ struct f2fs_nat_block {
 	struct f2fs_nat_entry entries[NAT_ENTRY_PER_BLOCK];
 };
 
-static_assert(sizeof(struct f2fs_nat_block) == 4095, "");
+static_assert(sizeof(struct f2fs_nat_block) == F2FS_BLKSIZE - (F2FS_BLKSIZE % 9), "");
 
 /*
  * For SIT entries
@@ -1140,13 +1149,13 @@ struct f2fs_sit_block {
 	struct f2fs_sit_entry entries[SIT_ENTRY_PER_BLOCK];
 };
 
-static_assert(sizeof(struct f2fs_sit_block) == 4070, "");
+static_assert(sizeof(struct f2fs_sit_block) == F2FS_BLKSIZE - (F2FS_BLKSIZE % 74), "");
 
 /*
  * For segment summary
  *
- * One summary block contains exactly 512 summary entries, which represents
- * exactly 2MB segment by default. Not allow to change the basic units.
+ * One summary block contains exactly 2048 summary entries, which represents
+ * exactly 32MB segment by default. Not allow to change the basic units.
  *
  * NOTE: For initializing fields, you must use set_summary
  *
@@ -1157,7 +1166,7 @@ static_assert(sizeof(struct f2fs_sit_block) == 4070, "");
  * from node's page's beginning to get a data block address.
  * ex) data_blkaddr = (block_t)(nodepage_start_address + ofs_in_node)
  */
-#define ENTRIES_IN_SUM		512
+#define ENTRIES_IN_SUM		(F2FS_BLKSIZE / 8)
 #define	SUMMARY_SIZE		(7)	/* sizeof(struct summary) */
 #define	SUM_FOOTER_SIZE		(5)	/* sizeof(struct summary_footer) */
 #define SUM_ENTRIES_SIZE	(SUMMARY_SIZE * ENTRIES_IN_SUM)
@@ -1225,7 +1234,7 @@ struct nat_journal {
 	__u8 reserved[NAT_JOURNAL_RESERVED];
 };
 
-static_assert(sizeof(struct nat_journal) == 505, "");
+static_assert(sizeof(struct nat_journal) == (F2FS_BLKSIZE / 8) - 7, "");
 
 struct sit_journal_entry {
 	__le32 segno;
@@ -1239,14 +1248,14 @@ struct sit_journal {
 	__u8 reserved[SIT_JOURNAL_RESERVED];
 };
 
-static_assert(sizeof(struct sit_journal) == 505, "");
+static_assert(sizeof(struct sit_journal) == (F2FS_BLKSIZE / 8) - 7, "");
 
 struct f2fs_extra_info {
 	__le64 kbytes_written;
 	__u8 reserved[EXTRA_INFO_RESERVED];
 } __attribute__((packed));
 
-static_assert(sizeof(struct f2fs_extra_info) == 505, "");
+static_assert(sizeof(struct f2fs_extra_info) == (F2FS_BLKSIZE / 8) - 7, "");
 
 struct f2fs_journal {
 	union {
@@ -1261,7 +1270,7 @@ struct f2fs_journal {
 	};
 } __attribute__((packed));
 
-static_assert(sizeof(struct f2fs_journal) == 507, "");
+static_assert(sizeof(struct f2fs_journal) == (F2FS_BLKSIZE / 8) - 5, "");
 
 /* 4KB-sized summary block structure */
 struct f2fs_summary_block {
@@ -1270,7 +1279,7 @@ struct f2fs_summary_block {
 	struct summary_footer footer;
 };
 
-static_assert(sizeof(struct f2fs_summary_block) == 4096, "");
+static_assert(sizeof(struct f2fs_summary_block) == F2FS_BLKSIZE, "");
 
 /*
  * For directory operations
@@ -1289,8 +1298,8 @@ typedef __le32	f2fs_hash_t;
 #define GET_DENTRY_SLOTS(x)	((x + F2FS_SLOT_LEN - 1) >> F2FS_SLOT_LEN_BITS)
 
 /* the number of dentry in a block */
-#define NR_DENTRY_IN_BLOCK	214
-
+#define NR_DENTRY_IN_BLOCK  ((BITS_PER_BYTE * F2FS_BLKSIZE) / \
+				((SIZE_OF_DIR_ENTRY + F2FS_SLOT_LEN) * BITS_PER_BYTE + 1))
 /* MAX level for dir lookup */
 #define MAX_DIR_HASH_DEPTH	63
 
diff --git a/man/sload.f2fs.8 b/man/sload.f2fs.8
index ed5ee4b..f213dea 100644
--- a/man/sload.f2fs.8
+++ b/man/sload.f2fs.8
@@ -82,7 +82,7 @@ independently.
 Specify cluster size in power of two blocks.
 The minimum value is 2 (4 blocks, default).
 The maximum value is 8 (256 blocks).
-Note that a block contains 4096 bytes.
+Note that a block contains 4096 or 16384 bytes.
 This option must be used with option \fB\-c\fR.
 .TP
 .BI \-a " compression-algorithm"
diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
index d937eda..3453e17 100644
--- a/mkfs/f2fs_format.c
+++ b/mkfs/f2fs_format.c
@@ -1370,7 +1370,7 @@ static int f2fs_write_default_quota(int qtype, __le32 raw_id)
 
 	memcpy(filebuf + 5136, &dqblk, sizeof(struct v2r1_disk_dqblk));
 
-	/* Write two blocks */
+	/* Write quota blocks */
 	for (i = 0; i < QUOTA_DATA; i++) {
 		blkaddr = alloc_next_free_block(CURSEG_HOT_DATA);
 
@@ -1383,13 +1383,13 @@ static int f2fs_write_default_quota(int qtype, __le32 raw_id)
 		update_sit_journal(CURSEG_HOT_DATA);
 		update_summary_entry(CURSEG_HOT_DATA,
 					le32_to_cpu(sb->qf_ino[qtype]), i);
-	}
+		DBG(1, "\tWriting quota data, at offset %08x (%d/%d)\n",
+						blkaddr, i + 1, QUOTA_DATA);
 
-	DBG(1, "\tWriting quota data, at offset %08x, %08x\n",
-					blkaddr - 1, blkaddr);
+	}
 
 	free(filebuf);
-	return blkaddr - 1;
+	return blkaddr + 1 - QUOTA_DATA;
 }
 
 static int f2fs_write_qf_inode(int qtype)
@@ -1424,7 +1424,7 @@ static int f2fs_write_qf_inode(int qtype)
 	else
 		ASSERT(0);
 
-	/* write two blocks */
+	/* write quota blocks */
 	data_blkaddr = f2fs_write_default_quota(qtype, raw_id);
 	if (data_blkaddr == 0) {
 		free(raw_node);
diff --git a/mkfs/f2fs_format_main.c b/mkfs/f2fs_format_main.c
index 08c1b25..b2b84dd 100644
--- a/mkfs/f2fs_format_main.c
+++ b/mkfs/f2fs_format_main.c
@@ -139,7 +139,7 @@ static void add_default_options(void)
 		/* -d1 -f -w 4096 -R 0:0 */
 		c.dbg_lv = 1;
 		force_overwrite = 1;
-		c.wanted_sector_size = 4096;
+		c.wanted_sector_size = F2FS_BLKSIZE;
 		c.root_uid = c.root_gid = 0;
 
 		/* RO doesn't need any other features */
diff --git a/mkfs/f2fs_format_utils.c b/mkfs/f2fs_format_utils.c
index 437f113..1c2003e 100644
--- a/mkfs/f2fs_format_utils.c
+++ b/mkfs/f2fs_format_utils.c
@@ -116,7 +116,7 @@ static bool is_wiped_device(int i)
 	int fd = dev->fd;
 	char *buf, *zero_buf;
 	bool wiped = true;
-	int nblocks = 4096;	/* 16MB size */
+	int nblocks = (4096 * 4096) / F2FS_BLKSIZE;	/* 16MB size */
 	int j;
 
 	/* let's trim the other devices except the first device */
-- 
2.42.0.rc2.253.gd59a3bf2b4-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
