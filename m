Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CF250AB5A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Apr 2022 00:19:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nhf8w-0001gX-6Y; Thu, 21 Apr 2022 22:19:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bart.vanassche@gmail.com>) id 1nhf8u-0001g0-S4
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Apr 2022 22:19:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/JoHHbKwp+3D78GUUrikoEYlfX049c8nQRj3HqVgFJc=; b=ELimwr6uNBax59atjWWVTbUpRB
 yg3QPrgZvCY5sts58QacadoVIjLjJu86+7AmkJ68pITIVEBTGUm0VnhEvGhLgWbmI2FqmQCaXezFt
 GC7l8uwxwd0fuWJQIcIOHBwyN5Rka/v+t39C8DdwcUZRspZmgPMgE/71Swuv/KmnFvYM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/JoHHbKwp+3D78GUUrikoEYlfX049c8nQRj3HqVgFJc=; b=h6r8f5KeAg6Yxwj3jx+1wVmL9Q
 QskfxwWYnkl8LZs3VMkzDlF+3REGPGVZpVcxWMZMlyFhkGX2z01DbpQVmm8VqNZWt2GCzTjFN3ed+
 ycJPgOqbRzEFcwdF8uYpi1hN6bux5NBN7bGOdsxhlRQzYwcMjVNKsr4Hu0iiDidtG/Q8=;
Received: from mail-pl1-f180.google.com ([209.85.214.180])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nhf8s-005sPv-Hk
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Apr 2022 22:19:15 +0000
Received: by mail-pl1-f180.google.com with SMTP id c12so6774378plr.6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 21 Apr 2022 15:19:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/JoHHbKwp+3D78GUUrikoEYlfX049c8nQRj3HqVgFJc=;
 b=LNql+6FMQ6ufcG9s5VXUBAb23XHmnuu1ODe+UQ1sXw/e7DeCQ9KMBhMbbkImzaxW8g
 QRjGORlHCbkxl+sIT3U+HDCBRdzuomRWz/0Uluq5MR9fL3uhqRy6npOBm1dK15uW70gQ
 GDOlkU6Z5CZoVDHCINa/2YLt+uT67gPMWbXQv63TI5HBryHrhxOIuxHMCJPXmd+yxaPa
 gmRMqt8+hdSdeoYWNCLv3H/R/tfisBaJoHLRaeNHCLUCaL9MsjA4ZpOf5+PMBL+Xx6rJ
 l6P+2vDkLSa4eD/VfaJc9Zl03cOXqs06hkvjFxr+SQRCNgUQHCbh23Mr4EqnoavvIBVM
 i1Bw==
X-Gm-Message-State: AOAM532MgWqIkA41j4TA3Y73+LxVmT7FhM7506aJHX7fjXDyg99wzSQe
 t9nd/EBo8OzYaJWvStnS3+CSPDEh3bHw4A==
X-Google-Smtp-Source: ABdhPJwPaNsvpFPNV/a6iJxsusOKlc7d6wkQGYIP+7guk2isGUQpA6iTizFmfBXCqZWMtSPxP+vEbA==
X-Received: by 2002:a17:902:d2c7:b0:15a:218a:432c with SMTP id
 n7-20020a170902d2c700b0015a218a432cmr1372165plc.20.1650579548560; 
 Thu, 21 Apr 2022 15:19:08 -0700 (PDT)
Received: from bvanassche-linux.mtv.corp.google.com
 ([2620:15c:211:201:a034:31d8:ca4e:1f35])
 by smtp.gmail.com with ESMTPSA id
 hi21-20020a17090b30d500b001cd4989ff4csm3794876pjb.19.2022.04.21.15.19.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 15:19:07 -0700 (PDT)
From: Bart Van Assche <bvanassche@acm.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Date: Thu, 21 Apr 2022 15:18:18 -0700
Message-Id: <20220421221836.3935616-14-bvanassche@acm.org>
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
 Content preview:  Applying the __attribute__((packed)) annotation to members
 that do not need it impacts performance negatively on architectures that
 do not support efficient unaligned accesses (e.g. ARMv7). Hence mini [...]
 Content analysis details:   (0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [bart.vanassche[at]gmail.com]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.180 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.180 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
X-Headers-End: 1nhf8s-005sPv-Hk
Subject: [f2fs-dev] [PATCH 13/31] Remove unnecessary __attribute__((packed))
 annotations
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

Applying the __attribute__((packed)) annotation to members that do not
need it impacts performance negatively on architectures that do not
support efficient unaligned accesses (e.g. ARMv7). Hence minimize the
__attribute__((packed)) annotations.

See also CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS in the Linux kernel.

Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 fsck/quotaio.c      |  2 +-
 fsck/quotaio_tree.h |  2 +-
 fsck/quotaio_v2.h   |  6 +++---
 fsck/xattr.h        |  2 +-
 include/f2fs_fs.h   | 52 ++++++++++++++++++++++-----------------------
 include/quota.h     |  9 +++-----
 tools/f2fscrypt.c   |  4 ++--
 7 files changed, 37 insertions(+), 40 deletions(-)

diff --git a/fsck/quotaio.c b/fsck/quotaio.c
index 52e962432c72..a3815b0c8835 100644
--- a/fsck/quotaio.c
+++ b/fsck/quotaio.c
@@ -31,7 +31,7 @@ static const char * const extensions[MAXQUOTAS] = {
 struct disk_dqheader {
 	__le32 dqh_magic;
 	__le32 dqh_version;
-} __attribute__ ((packed));
+};
 
 static_assert(sizeof(struct disk_dqheader) == 8, "");
 
diff --git a/fsck/quotaio_tree.h b/fsck/quotaio_tree.h
index b88c55c01d5c..8072c6e188fd 100644
--- a/fsck/quotaio_tree.h
+++ b/fsck/quotaio_tree.h
@@ -33,7 +33,7 @@ struct qt_disk_dqdbheader {
 	__le16 dqdh_entries; /* Number of valid entries in block */
 	__le16 dqdh_pad1;
 	__le32 dqdh_pad2;
-} __attribute__ ((packed));
+};
 
 static_assert(sizeof(struct qt_disk_dqdbheader) == 16, "");
 
diff --git a/fsck/quotaio_v2.h b/fsck/quotaio_v2.h
index a37300d78bd0..b054422f5a6e 100644
--- a/fsck/quotaio_v2.h
+++ b/fsck/quotaio_v2.h
@@ -18,7 +18,7 @@
 struct v2_disk_dqheader {
 	__le32 dqh_magic;	/* Magic number identifying file */
 	__le32 dqh_version;	/* File version */
-} __attribute__ ((packed));
+};
 
 static_assert(sizeof(struct v2_disk_dqheader) == 8, "");
 
@@ -36,7 +36,7 @@ struct v2_disk_dqinfo {
 	__le32 dqi_free_blk;	/* Number of first free block in the list */
 	__le32 dqi_free_entry;	/* Number of block with at least one
 					 * free entry */
-} __attribute__ ((packed));
+};
 
 static_assert(sizeof(struct v2_disk_dqinfo) == 24, "");
 
@@ -53,7 +53,7 @@ struct v2r1_disk_dqblk {
 	__le64 dqb_curspace;	/* current space occupied (in bytes) */
 	__le64 dqb_btime;	/* time limit for excessive disk use */
 	__le64 dqb_itime;	/* time limit for excessive inode use */
-} __attribute__ ((packed));
+};
 
 static_assert(sizeof(struct v2r1_disk_dqblk) == 72, "");
 
diff --git a/fsck/xattr.h b/fsck/xattr.h
index 5709a7df7adb..4e4b50d47bd7 100644
--- a/fsck/xattr.h
+++ b/fsck/xattr.h
@@ -45,7 +45,7 @@ struct fscrypt_context {
 	u8 flags;
 	u8 master_key_descriptor[FS_KEY_DESCRIPTOR_SIZE];
 	u8 nonce[FS_KEY_DERIVATION_NONCE_SIZE];
-} __attribute__((packed));
+};
 
 static_assert(sizeof(struct fscrypt_context) == 28, "");
 
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index cfd3b711f288..49438eb2e6f2 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -735,11 +735,10 @@ enum {
 /*
  * For superblock
  */
-#pragma pack(push, 1)
 struct f2fs_device {
 	__u8 path[MAX_PATH_LEN];
 	__le32 total_segments;
-} __attribute__((packed));
+};
 
 static_assert(sizeof(struct f2fs_device) == 68, "");
 
@@ -754,7 +753,8 @@ struct f2fs_super_block {
 	__le32 segs_per_sec;		/* # of segments per section */
 	__le32 secs_per_zone;		/* # of sections per zone */
 	__le32 checksum_offset;		/* checksum offset inside super block */
-	__le64 block_count;		/* total # of user blocks */
+	__le64 block_count __attribute__((packed));
+					/* total # of user blocks */
 	__le32 section_count;		/* total # of sections */
 	__le32 segment_count;		/* total # of segments */
 	__le32 segment_count_ckpt;	/* # of segments for checkpoint */
@@ -781,14 +781,14 @@ struct f2fs_super_block {
 	__le32 feature;			/* defined features */
 	__u8 encryption_level;		/* versioning level for encryption */
 	__u8 encrypt_pw_salt[16];	/* Salt used for string2key algorithm */
-	struct f2fs_device devs[MAX_DEVICES];	/* device list */
-	__le32 qf_ino[F2FS_MAX_QUOTAS];	/* quota inode numbers */
+	struct f2fs_device devs[MAX_DEVICES] __attribute__((packed));	/* device list */
+	__le32 qf_ino[F2FS_MAX_QUOTAS] __attribute__((packed));	/* quota inode numbers */
 	__u8 hot_ext_count;		/* # of hot file extension */
 	__le16  s_encoding;		/* Filename charset encoding */
 	__le16  s_encoding_flags;	/* Filename charset encoding flags */
 	__u8 reserved[306];		/* valid reserved region */
 	__le32 crc;			/* checksum of superblock */
-} __attribute__((packed));
+};
 
 static_assert(sizeof(struct f2fs_super_block) == 3072, "");
 
@@ -841,7 +841,7 @@ struct f2fs_checkpoint {
 
 	/* SIT and NAT version bitmap */
 	unsigned char sit_nat_version_bitmap[];
-} __attribute__((packed));
+};
 
 static_assert(sizeof(struct f2fs_checkpoint) == 192, "");
 
@@ -867,7 +867,7 @@ struct f2fs_orphan_block {
 	__le16 blk_count;	/* Number of orphan inode blocks in CP */
 	__le32 entry_count;	/* Total number of orphan nodes in current CP */
 	__le32 check_sum;	/* CRC32 for orphan inode block */
-} __attribute__((packed));
+};
 
 static_assert(sizeof(struct f2fs_orphan_block) == 4096, "");
 
@@ -878,7 +878,7 @@ struct f2fs_extent {
 	__le32 fofs;		/* start file offset of the extent */
 	__le32 blk_addr;	/* start block address of the extent */
 	__le32 len;		/* lengh of the extent */
-} __attribute__((packed));
+};
 
 static_assert(sizeof(struct f2fs_extent) == 12, "");
 
@@ -1005,7 +1005,7 @@ struct f2fs_inode {
 	__u8 i_name[F2FS_NAME_LEN];	/* file name for SPOR */
 	__u8 i_dir_level;		/* dentry_level for large dir */
 
-	struct f2fs_extent i_ext;	/* caching a largest extent */
+	struct f2fs_extent i_ext __attribute__((packed));	/* caching a largest extent */
 
 	union {
 		struct {
@@ -1025,19 +1025,21 @@ struct f2fs_inode {
 	};
 	__le32 i_nid[5];		/* direct(2), indirect(2),
 						double_indirect(1) node id */
-} __attribute__((packed));
+};
 
+static_assert(offsetof(struct f2fs_inode, i_extra_end) -
+	      offsetof(struct f2fs_inode, i_extra_isize) == 36, "");
 static_assert(sizeof(struct f2fs_inode) == 4072, "");
 
 struct direct_node {
 	__le32 addr[DEF_ADDRS_PER_BLOCK];	/* array of data block address */
-} __attribute__((packed));
+};
 
 static_assert(sizeof(struct direct_node) == 4072, "");
 
 struct indirect_node {
 	__le32 nid[NIDS_PER_BLOCK];	/* array of data block address */
-} __attribute__((packed));
+};
 
 static_assert(sizeof(struct indirect_node) == 4072, "");
 
@@ -1054,9 +1056,9 @@ struct node_footer {
 	__le32 nid;		/* node id */
 	__le32 ino;		/* inode nunmber */
 	__le32 flag;		/* include cold/fsync/dentry marks and offset */
-	__le64 cp_ver;		/* checkpoint version */
+	__le64 cp_ver __attribute__((packed));		/* checkpoint version */
 	__le32 next_blkaddr;	/* next node page block address */
-} __attribute__((packed));
+};
 
 static_assert(sizeof(struct node_footer) == 24, "");
 
@@ -1068,7 +1070,7 @@ struct f2fs_node {
 		struct indirect_node in;
 	};
 	struct node_footer footer;
-} __attribute__((packed));
+};
 
 static_assert(sizeof(struct f2fs_node) == 4096, "");
 
@@ -1090,7 +1092,7 @@ static_assert(sizeof(struct f2fs_nat_entry) == 9, "");
 
 struct f2fs_nat_block {
 	struct f2fs_nat_entry entries[NAT_ENTRY_PER_BLOCK];
-} __attribute__((packed));
+};
 
 static_assert(sizeof(struct f2fs_nat_block) == 4095, "");
 
@@ -1137,7 +1139,7 @@ static_assert(sizeof(struct f2fs_sit_entry) == 74, "");
 
 struct f2fs_sit_block {
 	struct f2fs_sit_entry entries[SIT_ENTRY_PER_BLOCK];
-} __attribute__((packed));
+};
 
 static_assert(sizeof(struct f2fs_sit_block) == 4070, "");
 
@@ -1181,8 +1183,8 @@ static_assert(sizeof(struct f2fs_summary) == 7, "");
 
 struct summary_footer {
 	unsigned char entry_type;	/* SUM_TYPE_XXX */
-	__le32 check_sum;		/* summary checksum */
-} __attribute__((packed));
+	__le32 check_sum __attribute__((packed)); /* summary checksum */
+};
 
 static_assert(sizeof(struct summary_footer) == 5, "");
 
@@ -1222,7 +1224,7 @@ static_assert(sizeof(struct nat_journal_entry) == 13, "");
 struct nat_journal {
 	struct nat_journal_entry entries[NAT_JOURNAL_ENTRIES];
 	__u8 reserved[NAT_JOURNAL_RESERVED];
-} __attribute__((packed));
+};
 
 static_assert(sizeof(struct nat_journal) == 505, "");
 
@@ -1236,7 +1238,7 @@ static_assert(sizeof(struct sit_journal_entry) == 78, "");
 struct sit_journal {
 	struct sit_journal_entry entries[SIT_JOURNAL_ENTRIES];
 	__u8 reserved[SIT_JOURNAL_RESERVED];
-} __attribute__((packed));
+};
 
 static_assert(sizeof(struct sit_journal) == 505, "");
 
@@ -1267,7 +1269,7 @@ struct f2fs_summary_block {
 	struct f2fs_summary entries[ENTRIES_IN_SUM];
 	struct f2fs_journal journal;
 	struct summary_footer footer;
-} __attribute__((packed));
+};
 
 static_assert(sizeof(struct f2fs_summary_block) == 4096, "");
 
@@ -1321,12 +1323,10 @@ struct f2fs_dentry_block {
 	__u8 reserved[SIZE_OF_RESERVED];
 	struct f2fs_dir_entry dentry[NR_DENTRY_IN_BLOCK];
 	__u8 filename[NR_DENTRY_IN_BLOCK][F2FS_SLOT_LEN];
-} __attribute__((packed));
+};
 
 static_assert(sizeof(struct f2fs_dentry_block) == 4096, "");
 
-#pragma pack(pop)
-
 /* for inline stuff */
 #define DEF_INLINE_RESERVED_SIZE	1
 
diff --git a/include/quota.h b/include/quota.h
index 5b7aaa891d28..f0eff71a9a26 100644
--- a/include/quota.h
+++ b/include/quota.h
@@ -44,11 +44,10 @@ enum quota_type {
 
 #define QT_TREEOFF	1	/* Offset of tree in file in blocks */
 
-#pragma pack(push, 1)
 struct v2_disk_dqheader {
 	uint32_t dqh_magic;	/* Magic number identifying file */
 	uint32_t dqh_version;	/* File version */
-} __attribute__ ((packed));
+};
 
 static_assert(sizeof(struct v2_disk_dqheader) == 8, "");
 
@@ -60,7 +59,7 @@ struct v2_disk_dqinfo {
 	uint32_t dqi_blocks;	/* Number of blocks in file */
 	uint32_t dqi_free_blk;	/* Number of first free block in the list */
 	uint32_t dqi_free_entry;	/* Number of block with at least one free entry */
-} __attribute__ ((packed));
+};
 
 static_assert(sizeof(struct v2_disk_dqinfo) == 24, "");
 
@@ -77,10 +76,8 @@ struct v2r1_disk_dqblk {
 	__le64 dqb_curspace;    /* current space occupied (in bytes) */
 	__le64 dqb_btime;       /* time limit for excessive disk use */
 	__le64 dqb_itime;       /* time limit for excessive inode use */
-} __attribute__ ((packed));
+};
 
 static_assert(sizeof(struct v2r1_disk_dqblk) == 72, "");
 
-#pragma pack(pop)
-
 #endif
diff --git a/tools/f2fscrypt.c b/tools/f2fscrypt.c
index 97624ba5e185..72bfb6467300 100644
--- a/tools/f2fscrypt.c
+++ b/tools/f2fscrypt.c
@@ -102,7 +102,7 @@ struct f2fs_fscrypt_policy {
 	__u8 filenames_encryption_mode;
 	__u8 flags;
 	__u8 master_key_descriptor[F2FS_KEY_DESCRIPTOR_SIZE];
-} __attribute__((packed));
+};
 
 static_assert(sizeof(struct f2fs_fscrypt_policy) == 12, "");
 
@@ -121,7 +121,7 @@ struct f2fs_encryption_key {
         __u32 mode;
         char raw[F2FS_MAX_KEY_SIZE];
         __u32 size;
-} __attribute__((__packed__));
+};
 
 static_assert(sizeof(struct f2fs_encryption_key) == 72, "");
 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
