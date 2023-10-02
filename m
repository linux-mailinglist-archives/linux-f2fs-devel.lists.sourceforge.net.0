Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 525427B5D92
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Oct 2023 01:09:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qnS30-0003KV-RO;
	Mon, 02 Oct 2023 23:09:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <3tU0bZQYKAOwRfcgSbUccUZS.Qca@flex--drosen.bounces.google.com>)
 id 1qnS2z-0003KO-74 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Oct 2023 23:09:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oFc/1qwpJTshwX+HnTUXi/tdU2k2eAkeuZcyOEMWxaI=; b=cUr2VQmRuDzdOPh5GiIuBT2gt+
 MeHSHan/M9PjP9rZMtP1akpd3tt4KswSHYvOsC8BhL2GT4MHZrguzw43A2McOP/fESB/XQd4GEowb
 lSyYllMBuYYFN/FZeAWJcO4DN4LNdy6OPrau5++6llk+Kt7lx+5RV7iyGXujmDBpb7AQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oFc/1qwpJTshwX+HnTUXi/tdU2k2eAkeuZcyOEMWxaI=; b=YdYK2R/NCVXS8B1ztzotm2j6qe
 B/VWLp+O5+r+sUlT36IMoaistIWqTn6L252zzs09r2kusCb9DH1JzwIglobeZdogm6IUIewopKMK7
 JXOmva2pIssylzrxRePnG498dgiP4cWyipamBD/HWFRMOifVelOb/ZRmApXR0fO5u2Zw=;
Received: from mail-yw1-f202.google.com ([209.85.128.202])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qnS2t-0007Ab-20 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Oct 2023 23:09:51 +0000
Received: by mail-yw1-f202.google.com with SMTP id
 00721157ae682-5a22029070bso7844927b3.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 02 Oct 2023 16:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1696288181; x=1696892981;
 darn=lists.sourceforge.net; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=oFc/1qwpJTshwX+HnTUXi/tdU2k2eAkeuZcyOEMWxaI=;
 b=e21f0lMdbuRgxap1+uZD3GajVsnfQ2A2T6dY9x4XxPUVWxqyrZvPuECg1ln17CRqGF
 0zjhRQyG7aLSrVaHuaeAfUTHCZDSaWdzy5T7a25qm1bGQ+dMmfnECx+mdWOEozP2dqlP
 +cqqEmk97fuftEFmk2dezK6F1k1rzBBBpeqCoQjNnKRMsOqvTkE/CxSc9XoXhheiW99x
 Hlmg8ffiEQtnPlF8PDUACYRzMvFfpx6lDsxcZYJSqGKZAKowTMs4v+LP3b//8wZiBT+l
 oWMHSimkF/13VgDn3JLIYowY0fZNGJxcc4HPKZDpVPITcmg8nLbvQ43pxoZh1zTQHNKx
 IfVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696288181; x=1696892981;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oFc/1qwpJTshwX+HnTUXi/tdU2k2eAkeuZcyOEMWxaI=;
 b=iM7YScF/PFklyBXTNMzo8gHEs/zfxVO8sTvNFfXxMopdMPHPUgaI4B8iMJzbbsPM6g
 GKoRhy/2z+kz0G7jTvvVje9ZbS5hTWcjMO8Xgm60hk6a1KKXpblw2GNXAUYMR4bsMQcm
 ie/bDThu+OG1Jd73X5zrEJks04VK5a1asGFp0m1B8K3ojBeRsA5dVRokNPRQlE50M2Sv
 9qAjmpur16Xjan+ehYt4CL2AC7NEabdPbh9ZD4UbstA+j8SwdVWNcKDK27y1aXzbMjG2
 ydn9PTbMQuf4xfZ0WKvLdEoKjfiPEsYLLlrmaJ8uedvjRWOcT05doVz0XQm3aGLSdPCP
 c+Qw==
X-Gm-Message-State: AOJu0YzPrcqnj8G2BPvlgTPSIYhDPIsRkPobHOv42lLqW4tRcq0meF4l
 3AZ3oFyxuPGCS2AQagsljiuQCbOhI4TnqbNHLJQd29cwokz+2zOKNPNelOKuRSpWlBxhB+b57E0
 LDlIRxHZaXfEryQEGMEmk6UiJGTOz2FxGu5rsYwN9b2Vphtt5Ul7XoasQDV+OqNPX7KSEfttNKK
 uyZf3IGQY=
X-Google-Smtp-Source: AGHT+IHLNmpViRKbpSKtg1Cj48WNCslBRkxGhpUR16vPOom2pWNWGGOtXud4DgPILbE+W6IlCft02BpUhno=
X-Received: from drosen.mtv.corp.google.com
 ([2620:15c:211:201:459f:6e1a:6be7:55da])
 (user=drosen job=sendgmr) by 2002:a05:690c:729:b0:59b:ccba:1249 with SMTP id
 bt9-20020a05690c072900b0059bccba1249mr274387ywb.10.1696288181435; Mon, 02 Oct
 2023 16:09:41 -0700 (PDT)
Date: Mon,  2 Oct 2023 16:09:35 -0700
In-Reply-To: <20231002230935.169229-1-drosen@google.com>
Mime-Version: 1.0
References: <20231002230935.169229-1-drosen@google.com>
X-Mailer: git-send-email 2.42.0.582.g8ccd20d70d-goog
Message-ID: <20231002230935.169229-2-drosen@google.com>
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -8.3 (--------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This allows f2fs to support cases where the block size = page
 size for both 4K and 16K block sizes. Other sizes should work as well, should
 the need arise. This does not currently support 4K Block siz [...] 
 Content analysis details:   (-8.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
 welcome-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.202 listed in list.dnswl.org]
 -0.6 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.202 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1qnS2t-0007Ab-20
Subject: [f2fs-dev] [PATCH v2 1/1] f2fs: Support Block Size == Page Size
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
 linux-kernel@vger.kernel.org, Daniel Rosenberg <drosen@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This allows f2fs to support cases where the block size = page size for
both 4K and 16K block sizes. Other sizes should work as well, should the
need arise. This does not currently support 4K Block size filesystems if
the page size is 16K.

Signed-off-by: Daniel Rosenberg <drosen@google.com>
---
 fs/f2fs/data.c          |  2 +-
 fs/f2fs/inode.c         |  2 +-
 fs/f2fs/node.c          |  2 +-
 fs/f2fs/super.c         |  4 +--
 include/linux/f2fs_fs.h | 69 ++++++++++++++++++++++++-----------------
 5 files changed, 46 insertions(+), 33 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 96342aba8022..4e42b5f24deb 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -4076,7 +4076,7 @@ static int check_swap_activate(struct swap_info_struct *sis,
 	sis->highest_bit = cur_lblock - 1;
 out:
 	if (not_aligned)
-		f2fs_warn(sbi, "Swapfile (%u) is not align to section: 1) creat(), 2) ioctl(F2FS_IOC_SET_PIN_FILE), 3) fallocate(%u * N)",
+		f2fs_warn(sbi, "Swapfile (%u) is not align to section: 1) creat(), 2) ioctl(F2FS_IOC_SET_PIN_FILE), 3) fallocate(%lu * N)",
 			  not_aligned, blks_per_sec * F2FS_BLKSIZE);
 	return ret;
 }
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index cde243840abd..cafb81588359 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -315,7 +315,7 @@ static bool sanity_check_inode(struct inode *inode, struct page *node_page)
 			f2fs_has_inline_xattr(inode) &&
 			(!fi->i_inline_xattr_size ||
 			fi->i_inline_xattr_size > MAX_INLINE_XATTR_SIZE)) {
-			f2fs_warn(sbi, "%s: inode (ino=%lx) has corrupted i_inline_xattr_size: %d, max: %zu",
+			f2fs_warn(sbi, "%s: inode (ino=%lx) has corrupted i_inline_xattr_size: %d, max: %lu",
 				  __func__, inode->i_ino, fi->i_inline_xattr_size,
 				  MAX_INLINE_XATTR_SIZE);
 			return false;
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index ee2e1dd64f25..a2b2c6c7f66d 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -633,7 +633,7 @@ static void f2fs_ra_node_pages(struct page *parent, int start, int n)
 
 	/* Then, try readahead for siblings of the desired node */
 	end = start + n;
-	end = min(end, NIDS_PER_BLOCK);
+	end = min(end, (int)NIDS_PER_BLOCK);
 	for (i = start; i < end; i++) {
 		nid = get_nid(parent, i, false);
 		f2fs_ra_node_page(sbi, nid);
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index bc303a052215..d2eafb56af81 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3502,7 +3502,7 @@ static int sanity_check_raw_super(struct f2fs_sb_info *sbi,
 		return -EFSCORRUPTED;
 	}
 
-	/* Currently, support 512/1024/2048/4096 bytes sector size */
+	/* Currently, support 512/1024/2048/4096/16K bytes sector size */
 	if (le32_to_cpu(raw_super->log_sectorsize) >
 				F2FS_MAX_LOG_SECTOR_SIZE ||
 		le32_to_cpu(raw_super->log_sectorsize) <
@@ -4948,7 +4948,7 @@ static int __init init_f2fs_fs(void)
 	int err;
 
 	if (PAGE_SIZE != F2FS_BLKSIZE) {
-		printk("F2FS not supported on PAGE_SIZE(%lu) != %d\n",
+		printk("F2FS not supported on PAGE_SIZE(%lu) != BLOCK_SIZE(%lu)\n",
 				PAGE_SIZE, F2FS_BLKSIZE);
 		return -EINVAL;
 	}
diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
index a82a4bb6ce68..07ed69c2840d 100644
--- a/include/linux/f2fs_fs.h
+++ b/include/linux/f2fs_fs.h
@@ -13,10 +13,10 @@
 
 #define F2FS_SUPER_OFFSET		1024	/* byte-size offset */
 #define F2FS_MIN_LOG_SECTOR_SIZE	9	/* 9 bits for 512 bytes */
-#define F2FS_MAX_LOG_SECTOR_SIZE	12	/* 12 bits for 4096 bytes */
-#define F2FS_LOG_SECTORS_PER_BLOCK	3	/* log number for sector/blk */
-#define F2FS_BLKSIZE			4096	/* support only 4KB block */
-#define F2FS_BLKSIZE_BITS		12	/* bits for F2FS_BLKSIZE */
+#define F2FS_MAX_LOG_SECTOR_SIZE	PAGE_SHIFT	/* Max is Block Size */
+#define F2FS_LOG_SECTORS_PER_BLOCK	(PAGE_SHIFT - 9) /* log number for sector/blk */
+#define F2FS_BLKSIZE			PAGE_SIZE /* support only block == page */
+#define F2FS_BLKSIZE_BITS		PAGE_SHIFT /* bits for F2FS_BLKSIZE */
 #define F2FS_MAX_EXTENSION		64	/* # of extension entries */
 #define F2FS_EXTENSION_LEN		8	/* max size of extension */
 #define F2FS_BLK_ALIGN(x)	(((x) + F2FS_BLKSIZE - 1) >> F2FS_BLKSIZE_BITS)
@@ -210,14 +210,14 @@ struct f2fs_checkpoint {
 	unsigned char sit_nat_version_bitmap[];
 } __packed;
 
-#define CP_CHKSUM_OFFSET	4092	/* default chksum offset in checkpoint */
+#define CP_CHKSUM_OFFSET	(F2FS_BLKSIZE - sizeof(__le32))	/* default chksum offset in checkpoint */
 #define CP_MIN_CHKSUM_OFFSET						\
 	(offsetof(struct f2fs_checkpoint, sit_nat_version_bitmap))
 
 /*
  * For orphan inode management
  */
-#define F2FS_ORPHANS_PER_BLOCK	1020
+#define F2FS_ORPHANS_PER_BLOCK	((F2FS_BLKSIZE - 4 * sizeof(__le32)) / sizeof(__le32))
 
 #define GET_ORPHAN_BLOCKS(n)	(((n) + F2FS_ORPHANS_PER_BLOCK - 1) / \
 					F2FS_ORPHANS_PER_BLOCK)
@@ -243,14 +243,31 @@ struct f2fs_extent {
 #define F2FS_NAME_LEN		255
 /* 200 bytes for inline xattrs by default */
 #define DEFAULT_INLINE_XATTR_ADDRS	50
-#define DEF_ADDRS_PER_INODE	923	/* Address Pointers in an Inode */
+
+#define OFFSET_OF_END_OF_I_EXT		360
+#define SIZE_OF_I_NID			20
+
+struct node_footer {
+	__le32 nid;		/* node id */
+	__le32 ino;		/* inode number */
+	__le32 flag;		/* include cold/fsync/dentry marks and offset */
+	__le64 cp_ver;		/* checkpoint version */
+	__le32 next_blkaddr;	/* next node page block address */
+} __packed;
+
+/* Address Pointers in an Inode */
+#define DEF_ADDRS_PER_INODE	((F2FS_BLKSIZE - OFFSET_OF_END_OF_I_EXT	\
+					- SIZE_OF_I_NID	\
+					- sizeof(struct node_footer)) / sizeof(__le32))
 #define CUR_ADDRS_PER_INODE(inode)	(DEF_ADDRS_PER_INODE - \
 					get_extra_isize(inode))
 #define DEF_NIDS_PER_INODE	5	/* Node IDs in an Inode */
 #define ADDRS_PER_INODE(inode)	addrs_per_inode(inode)
-#define DEF_ADDRS_PER_BLOCK	1018	/* Address Pointers in a Direct Block */
+/* Address Pointers in a Direct Block */
+#define DEF_ADDRS_PER_BLOCK	((F2FS_BLKSIZE - sizeof(struct node_footer)) / sizeof(__le32))
 #define ADDRS_PER_BLOCK(inode)	addrs_per_block(inode)
-#define NIDS_PER_BLOCK		1018	/* Node IDs in an Indirect Block */
+/* Node IDs in an Indirect Block */
+#define NIDS_PER_BLOCK		((F2FS_BLKSIZE - sizeof(struct node_footer)) / sizeof(__le32))
 
 #define ADDRS_PER_PAGE(page, inode)	\
 	(IS_INODE(page) ? ADDRS_PER_INODE(inode) : ADDRS_PER_BLOCK(inode))
@@ -342,14 +359,6 @@ enum {
 
 #define OFFSET_BIT_MASK		GENMASK(OFFSET_BIT_SHIFT - 1, 0)
 
-struct node_footer {
-	__le32 nid;		/* node id */
-	__le32 ino;		/* inode number */
-	__le32 flag;		/* include cold/fsync/dentry marks and offset */
-	__le64 cp_ver;		/* checkpoint version */
-	__le32 next_blkaddr;	/* next node page block address */
-} __packed;
-
 struct f2fs_node {
 	/* can be one of three types: inode, direct, and indirect types */
 	union {
@@ -363,7 +372,7 @@ struct f2fs_node {
 /*
  * For NAT entries
  */
-#define NAT_ENTRY_PER_BLOCK (PAGE_SIZE / sizeof(struct f2fs_nat_entry))
+#define NAT_ENTRY_PER_BLOCK (F2FS_BLKSIZE / sizeof(struct f2fs_nat_entry))
 
 struct f2fs_nat_entry {
 	__u8 version;		/* latest version of cached nat entry */
@@ -378,12 +387,13 @@ struct f2fs_nat_block {
 /*
  * For SIT entries
  *
- * Each segment is 2MB in size by default so that a bitmap for validity of
- * there-in blocks should occupy 64 bytes, 512 bits.
+ * A validity bitmap of 64 bytes covers 512 blocks of area. For a 4K page size,
+ * this results in a segment size of 2MB. For 16k pages, the default segment size
+ * is 8MB.
  * Not allow to change this.
  */
 #define SIT_VBLOCK_MAP_SIZE 64
-#define SIT_ENTRY_PER_BLOCK (PAGE_SIZE / sizeof(struct f2fs_sit_entry))
+#define SIT_ENTRY_PER_BLOCK (F2FS_BLKSIZE / sizeof(struct f2fs_sit_entry))
 
 /*
  * F2FS uses 4 bytes to represent block address. As a result, supported size of
@@ -418,7 +428,7 @@ struct f2fs_sit_block {
  * For segment summary
  *
  * One summary block contains exactly 512 summary entries, which represents
- * exactly 2MB segment by default. Not allow to change the basic units.
+ * exactly one segment by default. Not allow to change the basic units.
  *
  * NOTE: For initializing fields, you must use set_summary
  *
@@ -429,12 +439,12 @@ struct f2fs_sit_block {
  * from node's page's beginning to get a data block address.
  * ex) data_blkaddr = (block_t)(nodepage_start_address + ofs_in_node)
  */
-#define ENTRIES_IN_SUM		512
+#define ENTRIES_IN_SUM		(F2FS_BLKSIZE / 8)
 #define	SUMMARY_SIZE		(7)	/* sizeof(struct summary) */
 #define	SUM_FOOTER_SIZE		(5)	/* sizeof(struct summary_footer) */
 #define SUM_ENTRY_SIZE		(SUMMARY_SIZE * ENTRIES_IN_SUM)
 
-/* a summary entry for a 4KB-sized block in a segment */
+/* a summary entry for a block in a segment */
 struct f2fs_summary {
 	__le32 nid;		/* parent node id */
 	union {
@@ -518,7 +528,7 @@ struct f2fs_journal {
 	};
 } __packed;
 
-/* 4KB-sized summary block structure */
+/* Block-sized summary block structure */
 struct f2fs_summary_block {
 	struct f2fs_summary entries[ENTRIES_IN_SUM];
 	struct f2fs_journal journal;
@@ -559,11 +569,14 @@ typedef __le32	f2fs_hash_t;
  * Note: there are more reserved space in inline dentry than in regular
  * dentry, when converting inline dentry we should handle this carefully.
  */
-#define NR_DENTRY_IN_BLOCK	214	/* the number of dentry in a block */
+
+/* the number of dentry in a block */
+#define NR_DENTRY_IN_BLOCK	((BITS_PER_BYTE * F2FS_BLKSIZE) / \
+					((SIZE_OF_DIR_ENTRY + F2FS_SLOT_LEN) * BITS_PER_BYTE + 1))
 #define SIZE_OF_DIR_ENTRY	11	/* by byte */
 #define SIZE_OF_DENTRY_BITMAP	((NR_DENTRY_IN_BLOCK + BITS_PER_BYTE - 1) / \
 					BITS_PER_BYTE)
-#define SIZE_OF_RESERVED	(PAGE_SIZE - ((SIZE_OF_DIR_ENTRY + \
+#define SIZE_OF_RESERVED	(F2FS_BLKSIZE - ((SIZE_OF_DIR_ENTRY + \
 				F2FS_SLOT_LEN) * \
 				NR_DENTRY_IN_BLOCK + SIZE_OF_DENTRY_BITMAP))
 #define MIN_INLINE_DENTRY_SIZE		40	/* just include '.' and '..' entries */
@@ -576,7 +589,7 @@ struct f2fs_dir_entry {
 	__u8 file_type;		/* file type */
 } __packed;
 
-/* 4KB-sized directory entry block */
+/* Block-sized directory entry block */
 struct f2fs_dentry_block {
 	/* validity bitmap for directory entries in each block */
 	__u8 dentry_bitmap[SIZE_OF_DENTRY_BITMAP];
-- 
2.42.0.582.g8ccd20d70d-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
