Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC8850AB57
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Apr 2022 00:19:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nhf8s-0001ev-1e; Thu, 21 Apr 2022 22:19:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bart.vanassche@gmail.com>) id 1nhf8p-0001eD-U1
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Apr 2022 22:19:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2zEqefegxDfjhimXJAK9n0zaQjxgHoQK8QvviMIJTG4=; b=G6nzEqkYNxfYP+Zk2Je/3X1tgx
 eAco9iWU6QG7HWyk1TsHcDka5lSQPvYa6NfxaRTkMkLd3N0UbQCfRIOxzkJI2H63sX1Zw4KwBVqs/
 brUo9Qqn73RGo04OsO7ookDw22LN3pZ+qwmnTMLQOT81kte9cqEQtJVLe0KDv96mouu0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2zEqefegxDfjhimXJAK9n0zaQjxgHoQK8QvviMIJTG4=; b=FBrY7j0Sun/VXcW0Ge9er0IZRJ
 /LIGY1hgolmlSx2MSvNc2tW4WPBVzZ0z9wUviGrmg8gBZd5wf+k028qI3twktzyKdB0zYSA2o02QL
 CESan5NZ0uxhAwt4SnKlWKRXFyNyzcQzuNVRztjBY9/hCbz4b1a668EOnqg13PnG+tdA=;
Received: from mail-pl1-f182.google.com ([209.85.214.182])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nhf8n-0002vx-IW
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Apr 2022 22:19:10 +0000
Received: by mail-pl1-f182.google.com with SMTP id h12so3098720plf.12
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 21 Apr 2022 15:19:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2zEqefegxDfjhimXJAK9n0zaQjxgHoQK8QvviMIJTG4=;
 b=dwcTByJF6G4vafj71Fe8yImp/JmB7dYqDp7bLaU1QEk4afwopXFK/TqAmkCjQ/FVGj
 S8RU8PuEZCAnlK7Jw6/zTll6rEju9YkxptHQAGJfMiZ9NnBtrCICiMzBZcxLorKhPev9
 7+a9KrnlfcKbAUfTdDjiTPxd2s6T3d7FYBJOeHDt1g6XoESr30/57CaxRD5dB09CRFHe
 iwrVAyHo4Dpg6hWDKajwvGPrQqaMB14X9O5vj+0/qvZT8OUeGSMf6JBiTAukQXsZqb7X
 8OFSoJB0MkzfUHw/u/atMh4n6RXJrMri5R/0xxUiRaW7+i/UPFcaxoB+6ZQVPXnvwXiW
 8zEA==
X-Gm-Message-State: AOAM533VNDSz0kCIUy0es8XOh65V6qosMhBPuA/XDNOez60itU/HmnR9
 k7rtJ0mrN+oobTCGmhudPT0=
X-Google-Smtp-Source: ABdhPJyE+kOo1hJXEs9SmCjeVxXujik4hIEZWjKLcSWiSK8YTOGhj0wyNO5dN4JEiuplXPI+MCE40w==
X-Received: by 2002:a17:90a:fb89:b0:1d6:5252:3fae with SMTP id
 cp9-20020a17090afb8900b001d652523faemr1874614pjb.182.1650579543855; 
 Thu, 21 Apr 2022 15:19:03 -0700 (PDT)
Received: from bvanassche-linux.mtv.corp.google.com
 ([2620:15c:211:201:a034:31d8:ca4e:1f35])
 by smtp.gmail.com with ESMTPSA id
 hi21-20020a17090b30d500b001cd4989ff4csm3794876pjb.19.2022.04.21.15.19.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 15:19:03 -0700 (PDT)
From: Bart Van Assche <bvanassche@acm.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Date: Thu, 21 Apr 2022 15:18:15 -0700
Message-Id: <20220421221836.3935616-11-bvanassche@acm.org>
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
 Content preview:  Before modifying the __attribute__((packed)) annotations,
 let the compiler verify the sizes of on-disk data structures. Signed-off-by:
 Bart Van Assche <bvanassche@acm.org> --- fsck/quotaio.c | 2 ++
 fsck/quotaio_tree.h
 | 2 ++ fsck/quotaio_v2.h | 6 +++++ fsck/xattr.h | 2 ++ include/f2fs_fs.h
 | 54 ++++++++++++++++++++++++ [...] 
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
 [209.85.214.182 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.182 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
X-Headers-End: 1nhf8n-0002vx-IW
Subject: [f2fs-dev] [PATCH 10/31] Verify structure sizes at compile time
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

Before modifying the __attribute__((packed)) annotations, let the
compiler verify the sizes of on-disk data structures.

Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 fsck/quotaio.c      |  2 ++
 fsck/quotaio_tree.h |  2 ++
 fsck/quotaio_v2.h   |  6 +++++
 fsck/xattr.h        |  2 ++
 include/f2fs_fs.h   | 54 +++++++++++++++++++++++++++++++++++++++++++++
 include/quota.h     |  7 ++++++
 tools/f2fscrypt.c   |  4 ++++
 7 files changed, 77 insertions(+)

diff --git a/fsck/quotaio.c b/fsck/quotaio.c
index 51abbb7b2c57..52e962432c72 100644
--- a/fsck/quotaio.c
+++ b/fsck/quotaio.c
@@ -33,6 +33,8 @@ struct disk_dqheader {
 	__le32 dqh_version;
 } __attribute__ ((packed));
 
+static_assert(sizeof(struct disk_dqheader) == 8, "");
+
 int cur_qtype = -1;
 u32 qf_last_blkofs[MAXQUOTAS] = {0, 0, 0};
 enum qf_szchk_type_t qf_szchk_type[MAXQUOTAS] =
diff --git a/fsck/quotaio_tree.h b/fsck/quotaio_tree.h
index 8f4dae054691..b88c55c01d5c 100644
--- a/fsck/quotaio_tree.h
+++ b/fsck/quotaio_tree.h
@@ -35,6 +35,8 @@ struct qt_disk_dqdbheader {
 	__le32 dqdh_pad2;
 } __attribute__ ((packed));
 
+static_assert(sizeof(struct qt_disk_dqdbheader) == 16, "");
+
 struct dquot;
 struct quota_handle;
 
diff --git a/fsck/quotaio_v2.h b/fsck/quotaio_v2.h
index de2db2785cb0..a37300d78bd0 100644
--- a/fsck/quotaio_v2.h
+++ b/fsck/quotaio_v2.h
@@ -20,6 +20,8 @@ struct v2_disk_dqheader {
 	__le32 dqh_version;	/* File version */
 } __attribute__ ((packed));
 
+static_assert(sizeof(struct v2_disk_dqheader) == 8, "");
+
 /* Flags for version specific files */
 #define V2_DQF_MASK  0x0000	/* Mask for all valid ondisk flags */
 
@@ -36,6 +38,8 @@ struct v2_disk_dqinfo {
 					 * free entry */
 } __attribute__ ((packed));
 
+static_assert(sizeof(struct v2_disk_dqinfo) == 24, "");
+
 struct v2r1_disk_dqblk {
 	__le32 dqb_id;	/* id this quota applies to */
 	__le32 dqb_pad;
@@ -51,4 +55,6 @@ struct v2r1_disk_dqblk {
 	__le64 dqb_itime;	/* time limit for excessive inode use */
 } __attribute__ ((packed));
 
+static_assert(sizeof(struct v2r1_disk_dqblk) == 72, "");
+
 #endif
diff --git a/fsck/xattr.h b/fsck/xattr.h
index 579ab6c42585..5709a7df7adb 100644
--- a/fsck/xattr.h
+++ b/fsck/xattr.h
@@ -47,6 +47,8 @@ struct fscrypt_context {
 	u8 nonce[FS_KEY_DERIVATION_NONCE_SIZE];
 } __attribute__((packed));
 
+static_assert(sizeof(struct fscrypt_context) == 28, "");
+
 #define F2FS_ACL_VERSION	0x0001
 
 struct f2fs_acl_entry {
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index e6fc8a0e08f6..7804dd158de4 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -68,6 +68,10 @@
 # define UNUSED(x) x
 #endif
 
+#ifndef static_assert
+#define static_assert _Static_assert
+#endif
+
 #ifdef ANDROID_WINDOWS_HOST
 #undef HAVE_LINUX_TYPES_H
 #endif
@@ -737,6 +741,8 @@ struct f2fs_device {
 	__le32 total_segments;
 } __attribute__((packed));
 
+static_assert(sizeof(struct f2fs_device) == 68, "");
+
 struct f2fs_super_block {
 	__le32 magic;			/* Magic Number */
 	__le16 major_ver;		/* Major Version */
@@ -784,6 +790,8 @@ struct f2fs_super_block {
 	__le32 crc;			/* checksum of superblock */
 } __attribute__((packed));
 
+static_assert(sizeof(struct f2fs_super_block) == 3072, "");
+
 /*
  * For checkpoint
  */
@@ -835,6 +843,8 @@ struct f2fs_checkpoint {
 	unsigned char sit_nat_version_bitmap[];
 } __attribute__((packed));
 
+static_assert(sizeof(struct f2fs_checkpoint) == 192, "");
+
 #define CP_BITMAP_OFFSET	\
 	(offsetof(struct f2fs_checkpoint, sit_nat_version_bitmap))
 #define CP_MIN_CHKSUM_OFFSET	CP_BITMAP_OFFSET
@@ -859,6 +869,8 @@ struct f2fs_orphan_block {
 	__le32 check_sum;	/* CRC32 for orphan inode block */
 } __attribute__((packed));
 
+static_assert(sizeof(struct f2fs_orphan_block) == 4096, "");
+
 /*
  * For NODE structure
  */
@@ -868,6 +880,8 @@ struct f2fs_extent {
 	__le32 len;		/* lengh of the extent */
 } __attribute__((packed));
 
+static_assert(sizeof(struct f2fs_extent) == 12, "");
+
 #define F2FS_NAME_LEN		255
 
 /* max output length of pretty_print_filename() including null terminator */
@@ -1013,15 +1027,20 @@ struct f2fs_inode {
 						double_indirect(1) node id */
 } __attribute__((packed));
 
+static_assert(sizeof(struct f2fs_inode) == 4072, "");
 
 struct direct_node {
 	__le32 addr[DEF_ADDRS_PER_BLOCK];	/* array of data block address */
 } __attribute__((packed));
 
+static_assert(sizeof(struct direct_node) == 4072, "");
+
 struct indirect_node {
 	__le32 nid[NIDS_PER_BLOCK];	/* array of data block address */
 } __attribute__((packed));
 
+static_assert(sizeof(struct indirect_node) == 4072, "");
+
 enum {
 	COLD_BIT_SHIFT = 0,
 	FSYNC_BIT_SHIFT,
@@ -1039,6 +1058,8 @@ struct node_footer {
 	__le32 next_blkaddr;	/* next node page block address */
 } __attribute__((packed));
 
+static_assert(sizeof(struct node_footer) == 24, "");
+
 struct f2fs_node {
 	/* can be one of three types: inode, direct, and indirect types */
 	union {
@@ -1049,6 +1070,8 @@ struct f2fs_node {
 	struct node_footer footer;
 } __attribute__((packed));
 
+static_assert(sizeof(struct f2fs_node) == 4096, "");
+
 /*
  * For NAT entries
  */
@@ -1063,10 +1086,14 @@ struct f2fs_nat_entry {
 	__le32 block_addr;	/* block address */
 } __attribute__((packed));
 
+static_assert(sizeof(struct f2fs_nat_entry) == 9, "");
+
 struct f2fs_nat_block {
 	struct f2fs_nat_entry entries[NAT_ENTRY_PER_BLOCK];
 } __attribute__((packed));
 
+static_assert(sizeof(struct f2fs_nat_block) == 4095, "");
+
 /*
  * For SIT entries
  *
@@ -1106,10 +1133,14 @@ struct f2fs_sit_entry {
 	__le64 mtime;				/* segment age for cleaning */
 } __attribute__((packed));
 
+static_assert(sizeof(struct f2fs_sit_entry) == 74, "");
+
 struct f2fs_sit_block {
 	struct f2fs_sit_entry entries[SIT_ENTRY_PER_BLOCK];
 } __attribute__((packed));
 
+static_assert(sizeof(struct f2fs_sit_block) == 4070, "");
+
 /*
  * For segment summary
  *
@@ -1142,6 +1173,8 @@ struct f2fs_summary {
 	};
 } __attribute__((packed));
 
+static_assert(sizeof(struct f2fs_summary) == 7, "");
+
 /* summary block type, node or data, is stored to the summary_footer */
 #define SUM_TYPE_NODE		(1)
 #define SUM_TYPE_DATA		(0)
@@ -1151,6 +1184,8 @@ struct summary_footer {
 	__le32 check_sum;		/* summary checksum */
 } __attribute__((packed));
 
+static_assert(sizeof(struct summary_footer) == 5, "");
+
 #define SUM_JOURNAL_SIZE	(F2FS_BLKSIZE - SUM_FOOTER_SIZE -\
 				SUM_ENTRIES_SIZE)
 #define NAT_JOURNAL_ENTRIES	((SUM_JOURNAL_SIZE - 2) /\
@@ -1182,26 +1217,36 @@ struct nat_journal_entry {
 	struct f2fs_nat_entry ne;
 } __attribute__((packed));
 
+static_assert(sizeof(struct nat_journal_entry) == 13, "");
+
 struct nat_journal {
 	struct nat_journal_entry entries[NAT_JOURNAL_ENTRIES];
 	__u8 reserved[NAT_JOURNAL_RESERVED];
 } __attribute__((packed));
 
+static_assert(sizeof(struct nat_journal) == 505, "");
+
 struct sit_journal_entry {
 	__le32 segno;
 	struct f2fs_sit_entry se;
 } __attribute__((packed));
 
+static_assert(sizeof(struct sit_journal_entry) == 78, "");
+
 struct sit_journal {
 	struct sit_journal_entry entries[SIT_JOURNAL_ENTRIES];
 	__u8 reserved[SIT_JOURNAL_RESERVED];
 } __attribute__((packed));
 
+static_assert(sizeof(struct sit_journal) == 505, "");
+
 struct f2fs_extra_info {
 	__le64 kbytes_written;
 	__u8 reserved[EXTRA_INFO_RESERVED];
 } __attribute__((packed));
 
+static_assert(sizeof(struct f2fs_extra_info) == 505, "");
+
 struct f2fs_journal {
 	union {
 		__le16 n_nats;
@@ -1215,6 +1260,8 @@ struct f2fs_journal {
 	};
 } __attribute__((packed));
 
+static_assert(sizeof(struct f2fs_journal) == 507, "");
+
 /* 4KB-sized summary block structure */
 struct f2fs_summary_block {
 	struct f2fs_summary entries[ENTRIES_IN_SUM];
@@ -1222,6 +1269,8 @@ struct f2fs_summary_block {
 	struct summary_footer footer;
 } __attribute__((packed));
 
+static_assert(sizeof(struct f2fs_summary_block) == 4096, "");
+
 /*
  * For directory operations
  */
@@ -1263,6 +1312,8 @@ struct f2fs_dir_entry {
 	__u8 file_type;		/* file type */
 } __attribute__((packed));
 
+static_assert(sizeof(struct f2fs_dir_entry) == 11, "");
+
 /* 4KB-sized directory entry block */
 struct f2fs_dentry_block {
 	/* validity bitmap for directory entries in each block */
@@ -1271,6 +1322,9 @@ struct f2fs_dentry_block {
 	struct f2fs_dir_entry dentry[NR_DENTRY_IN_BLOCK];
 	__u8 filename[NR_DENTRY_IN_BLOCK][F2FS_SLOT_LEN];
 } __attribute__((packed));
+
+static_assert(sizeof(struct f2fs_dentry_block) == 4096, "");
+
 #pragma pack(pop)
 
 /* for inline stuff */
diff --git a/include/quota.h b/include/quota.h
index 627a86f6421f..5b7aaa891d28 100644
--- a/include/quota.h
+++ b/include/quota.h
@@ -50,6 +50,8 @@ struct v2_disk_dqheader {
 	uint32_t dqh_version;	/* File version */
 } __attribute__ ((packed));
 
+static_assert(sizeof(struct v2_disk_dqheader) == 8, "");
+
 /* Header with type and version specific information */
 struct v2_disk_dqinfo {
 	uint32_t dqi_bgrace;	/* Time before block soft limit becomes hard limit */
@@ -60,6 +62,8 @@ struct v2_disk_dqinfo {
 	uint32_t dqi_free_entry;	/* Number of block with at least one free entry */
 } __attribute__ ((packed));
 
+static_assert(sizeof(struct v2_disk_dqinfo) == 24, "");
+
 struct v2r1_disk_dqblk {
 	__le32 dqb_id;  	/* id this quota applies to */
 	__le32 dqb_pad;
@@ -74,6 +78,9 @@ struct v2r1_disk_dqblk {
 	__le64 dqb_btime;       /* time limit for excessive disk use */
 	__le64 dqb_itime;       /* time limit for excessive inode use */
 } __attribute__ ((packed));
+
+static_assert(sizeof(struct v2r1_disk_dqblk) == 72, "");
+
 #pragma pack(pop)
 
 #endif
diff --git a/tools/f2fscrypt.c b/tools/f2fscrypt.c
index fe3e0ff3c1a9..97624ba5e185 100644
--- a/tools/f2fscrypt.c
+++ b/tools/f2fscrypt.c
@@ -104,6 +104,8 @@ struct f2fs_fscrypt_policy {
 	__u8 master_key_descriptor[F2FS_KEY_DESCRIPTOR_SIZE];
 } __attribute__((packed));
 
+static_assert(sizeof(struct f2fs_fscrypt_policy) == 12, "");
+
 #define F2FS_IOC_SET_ENCRYPTION_POLICY	_IOR('f', 19, struct f2fs_fscrypt_policy)
 #define F2FS_IOC_GET_ENCRYPTION_PWSALT	_IOW('f', 20, __u8[16])
 #define F2FS_IOC_GET_ENCRYPTION_POLICY	_IOW('f', 21, struct f2fs_fscrypt_policy)
@@ -121,6 +123,8 @@ struct f2fs_encryption_key {
         __u32 size;
 } __attribute__((__packed__));
 
+static_assert(sizeof(struct f2fs_encryption_key) == 72, "");
+
 int options;
 
 extern void f2fs_sha512(const unsigned char *in, unsigned long in_size,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
