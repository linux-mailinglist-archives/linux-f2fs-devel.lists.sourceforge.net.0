Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8508977D832
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 16 Aug 2023 04:13:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qW622-0001zS-7x;
	Wed, 16 Aug 2023 02:13:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <3_iLcZAYKAOEGURVHQJRRJOH.FRP@flex--drosen.bounces.google.com>)
 id 1qW621-0001zM-KE for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 16 Aug 2023 02:13:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9aBAiu+20AKswTuHb3c49no1CNIktUKzBfI4WLE/3/w=; b=AvkTrONJtzAW0I17aa9l0Yiz9S
 2EAho3i9/M4sHxCg+V3BitxGW8drvQfrGHE/grNLZgD0eHcXSnyQg5TD7bLXqCz6erOyr37izjrlk
 oj+QRTfgAMNI5mZN6gH8x0+iMksfNjJ6aY6/M+f1u8rgXQAaFupwIUB6fop1iAqP+z6o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9aBAiu+20AKswTuHb3c49no1CNIktUKzBfI4WLE/3/w=; b=V2nD3xL/Zo/OGORfNybOJokZ/H
 DtmF095g8xOeXPHJrAfTOhoFcgezHC+0a40K/LMoZ5/mwCXLOF9BIF2ThTpn3G/STMzUU3B5KN2QA
 krZZ72kJPC0OnSZSUQNuSgpwQx7EpQmposBMNVZg1GjVLg6v84fND3By3YjW4m/6HBZk=;
Received: from mail-pf1-f201.google.com ([209.85.210.201])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qW621-0001SB-Nc for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 16 Aug 2023 02:13:10 +0000
Received: by mail-pf1-f201.google.com with SMTP id
 d2e1a72fcca58-68877684da1so1004072b3a.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 15 Aug 2023 19:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1692151984; x=1692756784;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=9aBAiu+20AKswTuHb3c49no1CNIktUKzBfI4WLE/3/w=;
 b=zHm1s/gL0Lru+X+44ja/nzLUJX6Gd/45Ofp9q6y5SswBuOD+/ePvGxvS7tFDVToZpS
 EaEgAiMxmut7VZAMgYd2j/nPCIucslyRrQOC0bOMgNYBkQxpBk87/xoQdfCTWvZhCBhy
 Vo6IMJ1qyfrGIGomhAsMPWhhm0D1NViPmhHIaNocm69PeXiX+Gy8gyBIXo+LnOuxona/
 Y5sXcomZLQx5kLaLGx7qMRU5DZuLToRzkxwmDlQeDnFq4wQRfcD2/+Ga0KO49byGyBOP
 E15jfGWkdZohs2ZW/wAGaxCbjEK76D4fBwtyruIHrOqa3ZLBjD8RWp/atOwyHTFJq0NX
 Aybg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692151984; x=1692756784;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9aBAiu+20AKswTuHb3c49no1CNIktUKzBfI4WLE/3/w=;
 b=UXR/rXG9j5yso1yvPPKuphV76Zpmx4g+Ts8JT76efz/hPHlu612t9hlph0LFPXYtjE
 pfTAKmUxD+bcj57PwhQwuEK5sV17GXCIm1Stxt7czkzI2UzX5/Ev+Oqq8iZQurCnI4pv
 yuX41AwyYjv1jAd5UyGttLAv/Oaps4DBf0CM+IePt8pVrUlXtmiX4advzAm+jLHLtlGq
 0tr4r5ksbffiL/aRMKpd693D7XV8uv0BR1Q8GduYzgb4gC6x/NZ2LRpaT3nLKYwmYtSI
 IARJtye+yBMBgtkf6sLHqEacHpFnG4ImrosfOyH3kATUUAr3O0ZEp9nvEpMEEPZpJ7zQ
 MTcw==
X-Gm-Message-State: AOJu0Yy+3l+oRWKvg/K9mQHBoUyzD8xvgON0bzBKfJ6UkzkhXrTbH5nc
 Wgl9ZyJh/2EfaYjHHSmVWS/gQn1J5iM0SEchsdmIkbdIjXncwhtNkk01dLp4/TaCVIdr7BA4pcV
 /jtvutiKcbGfjVM+6/PgTdnaWTGUKnC0voCK06LRy8FFWOOiW+pfw69sH5HIlz14pMUBBRGGxmf
 y2iXoFC1Y=
X-Google-Smtp-Source: AGHT+IFefHa0OuOiJUzg0poI1m6TvFdyu16T/KRtQdOV1sc5ko+Jfe74ZD25SN09L024tb74RcWF5SYkhow=
X-Received: from drosen.mtv.corp.google.com
 ([2620:15c:211:201:19fa:33cd:f272:37ec])
 (user=drosen job=sendgmr) by 2002:a25:dc54:0:b0:d42:42f8:93bf with SMTP id
 y81-20020a25dc54000000b00d4242f893bfmr6622ybe.0.1692148478975; Tue, 15 Aug
 2023 18:14:38 -0700 (PDT)
Date: Tue, 15 Aug 2023 18:14:32 -0700
In-Reply-To: <20230816011432.1966838-1-drosen@google.com>
Mime-Version: 1.0
References: <20230816011432.1966838-1-drosen@google.com>
X-Mailer: git-send-email 2.41.0.694.ge786442a9b-goog
Message-ID: <20230816011432.1966838-2-drosen@google.com>
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -7.7 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This allows f2fs to support cases where the block size = page
 size for both 4K and 16K block sizes. Other sizes should work as well, should
 the need arise. This does not currently support 4K Block siz [...] 
 Content analysis details:   (-7.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
 welcome-list
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.201 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.201 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1qW621-0001SB-Nc
Subject: [f2fs-dev] [PATCH 1/1] ANDROID: f2fs: Support Block Size == Page
 Size
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
 fs/f2fs/node.c          |  2 +-
 fs/f2fs/super.c         |  4 +--
 include/linux/f2fs_fs.h | 69 ++++++++++++++++++++++++-----------------
 4 files changed, 45 insertions(+), 32 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 5d9697717353..c9e4d02d21d6 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -4052,7 +4052,7 @@ static int check_swap_activate(struct swap_info_struct *sis,
 	sis->highest_bit = cur_lblock - 1;
 out:
 	if (not_aligned)
-		f2fs_warn(sbi, "Swapfile (%u) is not align to section: 1) creat(), 2) ioctl(F2FS_IOC_SET_PIN_FILE), 3) fallocate(%u * N)",
+		f2fs_warn(sbi, "Swapfile (%u) is not align to section: 1) creat(), 2) ioctl(F2FS_IOC_SET_PIN_FILE), 3) fallocate(%lu * N)",
 			  not_aligned, blks_per_sec * F2FS_BLKSIZE);
 	return ret;
 }
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
index a067466a694c..895122ff3964 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3469,7 +3469,7 @@ static int sanity_check_raw_super(struct f2fs_sb_info *sbi,
 		return -EFSCORRUPTED;
 	}
 
-	/* Currently, support 512/1024/2048/4096 bytes sector size */
+	/* Currently, support 512/1024/2048/4096/16K bytes sector size */
 	if (le32_to_cpu(raw_super->log_sectorsize) >
 				F2FS_MAX_LOG_SECTOR_SIZE ||
 		le32_to_cpu(raw_super->log_sectorsize) <
@@ -4915,7 +4915,7 @@ static int __init init_f2fs_fs(void)
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
2.41.0.694.ge786442a9b-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
