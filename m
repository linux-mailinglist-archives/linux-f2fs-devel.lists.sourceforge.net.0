Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CC93658D015
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  9 Aug 2022 00:21:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oLB7P-0006Um-MD; Mon, 08 Aug 2022 22:21:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1oLB7O-0006UX-HG
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 08 Aug 2022 22:21:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=G/ak0FQheGLKQlnB4WrxLc8JWTENdjRzDxEM7D7LisE=; b=blgO/Dnxp99yukeIxxn6wvLzSr
 JcX22Sm41DjcYHbQT9CXbRh5hEGsdmo6iyHfYagCyKmSVbL9zylK4UYnRnlzalK1MzjC9RxGFZOTj
 L10+a+ivKl36UP6tN/lsdeVtIEsMFhPmDy3TpSF247CJKhXTEcKteVLUOehy9p/gbFlY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=G/ak0FQheGLKQlnB4WrxLc8JWTENdjRzDxEM7D7LisE=; b=e
 BcPvuHmT98ATw230nLA57L66CTKUHvCEr8ALc6+8vtRCbM8xzUNSORDMtf8SKYtQiQwlAeZbQlP0S
 84kx8+p1KATqR2z2FUpBMoJ9TjppCCGi64SKFSyWrrtlWBJKZb0CGmaAw9wQTvtFrpogWIb4CwkxX
 orFlwqHa1Xu4kW30=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oLB7I-0005h6-QX
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 08 Aug 2022 22:21:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4FED9B810F6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  8 Aug 2022 22:20:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7704C433C1;
 Mon,  8 Aug 2022 22:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659997241;
 bh=lIclQvnK+itArINLJ/KecmYAIs9vU8h4mrS5i9neodo=;
 h=From:To:Cc:Subject:Date:From;
 b=knyLQ/yFPReb1oRHuYMVDpYRTWR2DeZfah3bHkexr1lTXbCYn9/4M4Maat0Rn/PcP
 O6s0yZkk3uNBFkBkOmA2tZFpDmjIlLwSjbefuE+3mj1HjMyacbSI+if/9KNoklD7tn
 8IvkQ8snCeZUh7g2VD1thbG5CjdBSdncROp4jsWEQ9VB2IEI58WkNQtOOInNtwh5cD
 13mmYLL7rP3KK8nif1VbnoEjiFPvWjqXGcly0vb0IfkrnRMzKfvpHxlsAJjFIsPXpX
 BxN6trtorh6ziOKF831gDWM36/g4DxQdEX9Pcr8wzcQrB1ajQ2Q1D3vufgI6L4f3hj
 fYpKn1E5fD8zA==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon,  8 Aug 2022 15:20:35 -0700
Message-Id: <20220808222035.1293977-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.37.1.559.g78731f0fdb-goog
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: We don't need to check the running kernel configuration.
 Signed-off-by:
 Jaegeuk Kim <jaegeuk@kernel.org> --- fsck/mount.c | 6 ------ fsck/xattr.c
 | 2 +- fsck/xattr.h | 2 +- include/f2fs_fs.h | 15 ++++++--------- 4 files
 changed, 8 insertions(+), 17 deletion [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oLB7I-0005h6-QX
Subject: [f2fs-dev] [PATCH] f2fs-tools: use F2FS_BLKSIZE instead of
 PAGE_*_SIZE
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

We don't need to check the running kernel configuration.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fsck/mount.c      |  6 ------
 fsck/xattr.c      |  2 +-
 fsck/xattr.h      |  2 +-
 include/f2fs_fs.h | 15 ++++++---------
 4 files changed, 8 insertions(+), 17 deletions(-)

diff --git a/fsck/mount.c b/fsck/mount.c
index 584e6d1370ae..e2caac032aa0 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -812,12 +812,6 @@ int sanity_check_raw_super(struct f2fs_super_block *sb, enum SB_ADDR sb_addr)
 		return -1;
 	}
 
-	if (F2FS_BLKSIZE != PAGE_CACHE_SIZE) {
-		MSG(0, "Invalid page_cache_size (%d), supports only 4KB\n",
-			PAGE_CACHE_SIZE);
-		return -1;
-	}
-
 	blocksize = 1 << get_sb(log_blocksize);
 	if (F2FS_BLKSIZE != blocksize) {
 		MSG(0, "Invalid blocksize (%u), supports only 4KB\n",
diff --git a/fsck/xattr.c b/fsck/xattr.c
index f0c53435e881..8e668730b374 100644
--- a/fsck/xattr.c
+++ b/fsck/xattr.c
@@ -121,7 +121,7 @@ static void write_all_xattrs(struct f2fs_sb_info *sbi,
 	/* write to xattr node block */
 	xattr_addr = (void *)xattr_node;
 	memcpy(xattr_addr, txattr_addr + inline_size,
-			PAGE_SIZE - sizeof(struct node_footer));
+			F2FS_BLKSIZE - sizeof(struct node_footer));
 
 	ret = dev_write_block(xattr_node, blkaddr);
 
diff --git a/fsck/xattr.h b/fsck/xattr.h
index 74aa5418cbd3..22ea35ca0a49 100644
--- a/fsck/xattr.h
+++ b/fsck/xattr.h
@@ -132,7 +132,7 @@ static inline int f2fs_acl_count(int size)
 			!IS_XATTR_LAST_ENTRY(entry); \
 			entry = XATTR_NEXT_ENTRY(entry))
 
-#define MIN_OFFSET	XATTR_ALIGN(PAGE_SIZE -			\
+#define MIN_OFFSET	XATTR_ALIGN(F2FS_BLKSIZE -		\
 		sizeof(struct node_footer) - sizeof(__u32))
 
 #define MAX_VALUE_LEN	(MIN_OFFSET -				\
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 8125e9f8d082..509d75a263e0 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -349,10 +349,6 @@ static inline uint64_t bswap_64(uint64_t val)
 		snprintf(buf, len, #member)
 
 /* these are defined in kernel */
-#ifndef PAGE_SIZE
-#define PAGE_SIZE		4096
-#endif
-#define PAGE_CACHE_SIZE		4096
 #define BITS_PER_BYTE		8
 #ifndef SECTOR_SHIFT
 #define SECTOR_SHIFT		9
@@ -949,9 +945,10 @@ static_assert(sizeof(struct f2fs_extent) == 12, "");
 				DEFAULT_INLINE_XATTR_ADDRS -		\
 				F2FS_TOTAL_EXTRA_ATTR_SIZE -		\
 				DEF_INLINE_RESERVED_SIZE))
-#define INLINE_DATA_OFFSET	(PAGE_CACHE_SIZE - sizeof(struct node_footer) \
-				- sizeof(__le32)*(DEF_ADDRS_PER_INODE + 5 - \
-				DEF_INLINE_RESERVED_SIZE))
+#define INLINE_DATA_OFFSET	(F2FS_BLKSIZE -				\
+				sizeof(struct node_footer) -		\
+				sizeof(__le32) * (DEF_ADDRS_PER_INODE +	\
+				5 - DEF_INLINE_RESERVED_SIZE))
 
 #define DEF_DIR_LEVEL		0
 
@@ -1093,7 +1090,7 @@ static_assert(sizeof(struct f2fs_node) == 4096, "");
 /*
  * For NAT entries
  */
-#define NAT_ENTRY_PER_BLOCK (PAGE_CACHE_SIZE / sizeof(struct f2fs_nat_entry))
+#define NAT_ENTRY_PER_BLOCK (F2FS_BLKSIZE / sizeof(struct f2fs_nat_entry))
 #define NAT_BLOCK_OFFSET(start_nid) (start_nid / NAT_ENTRY_PER_BLOCK)
 
 #define DEFAULT_NAT_ENTRY_RATIO		20
@@ -1120,7 +1117,7 @@ static_assert(sizeof(struct f2fs_nat_block) == 4095, "");
  * Not allow to change this.
  */
 #define SIT_VBLOCK_MAP_SIZE 64
-#define SIT_ENTRY_PER_BLOCK (PAGE_CACHE_SIZE / sizeof(struct f2fs_sit_entry))
+#define SIT_ENTRY_PER_BLOCK (F2FS_BLKSIZE / sizeof(struct f2fs_sit_entry))
 
 /*
  * F2FS uses 4 bytes to represent block address. As a result, supported size of
-- 
2.37.1.559.g78731f0fdb-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
