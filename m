Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 704CEA76EC0
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:14:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLWV-0001G7-HB;
	Mon, 31 Mar 2025 20:14:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVp-0000r7-04
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/nIbEKNyFcocgtdNUSwNYHMXTjONBQnSxBcJpmdtBJg=; b=BYSKxEBPuQlLz31gwX3xxYCQBk
 keJOq2qA8LpISuhzwyyY4KwRSdTnJqZpw4aQzyGFoezO8CPU4HC1XrCN/T+3eEsAbE4RwjL1MC0qs
 ypnJ6WA2QUwx+4NuNMVCo4HRHgTBhJc2c71PbvWG4H9SyZD1EkooWe4tpatYYj0qUihw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/nIbEKNyFcocgtdNUSwNYHMXTjONBQnSxBcJpmdtBJg=; b=TiZA9nBkFRSJXsRnBRwTQLKaSc
 UugCRahL79OtsqF19kWwpJZR/qA/N1z266IWjCcv4enGJyo77tsVtzBIhZRkFRmhgxS65rfDqDawR
 1wUSgskny/k91XXvMkSgMwZ7epF7gsaYiT/5AvVnM4mGKUa48zYmzZqU1B4ZChwo9x2g=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVe-0003dH-G6 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=/nIbEKNyFcocgtdNUSwNYHMXTjONBQnSxBcJpmdtBJg=; b=s0Yn0w+OEf8sFCvWgnXVSgThmS
 AujOnHT6eOoIYGDZfr91J0HQEoSvZF4aJrMFK/1XYNST/+aloukFZpQdkGMtO45m2HJC/Th39fSIb
 RhCaPf6OJlGZxEMXZkeWW3gsbsXA2cc0QiznfKGeWV8ywFfzUaWnT0PU3XfYFikP/eeMSLNvZlonw
 JyYxys8kqTtX4Fbp1paYl8seixSWOD7Ujurk9gEL0PJotvUspI3fU9FoVOIGGo1oRMIRYYn2ixjwD
 InPm8TnP82UEp0Mr6I8RnYChWlq97WuyyQIGoEgeJgJ61uqllfENxeM5ekVvZiOYrHeSjxKQw7BSp
 vC+29A5g==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVY-00000004SMK-0YTh;
 Mon, 31 Mar 2025 20:13:20 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:12:11 +0100
Message-ID: <20250331201256.1057782-112-willy@infradead.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331201256.1057782-1-willy@infradead.org>
References: <20250331201256.1057782-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Also convert in_page to in_folio. Save five hidden calls to
 compound_head(). Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
 --- fs/f2fs/xattr.c | 28 ++++++++++++++ 1 file changed, 14 insertions(+),
 14 deletions(-) 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-accredit.habeas.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [90.155.50.34 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1tzLVe-0003dH-G6
Subject: [f2fs-dev] [PATCH 111/153] f2fs: Pass a folio to write_all_xattrs()
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
Cc: "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Also convert in_page to in_folio.  Save five hidden calls to
compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/xattr.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
index 9dd0d90355f7..43f363f0658b 100644
--- a/fs/f2fs/xattr.c
+++ b/fs/f2fs/xattr.c
@@ -429,11 +429,11 @@ static int read_all_xattrs(struct inode *inode, struct folio *ifolio,
 }
 
 static inline int write_all_xattrs(struct inode *inode, __u32 hsize,
-				void *txattr_addr, struct page *ipage)
+				void *txattr_addr, struct folio *ifolio)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	size_t inline_size = inline_xattr_size(inode);
-	struct page *in_page = NULL;
+	struct folio *in_folio = NULL;
 	void *xattr_addr;
 	void *inline_addr = NULL;
 	struct folio *xfolio;
@@ -446,29 +446,29 @@ static inline int write_all_xattrs(struct inode *inode, __u32 hsize,
 
 	/* write to inline xattr */
 	if (inline_size) {
-		if (ipage) {
-			inline_addr = inline_xattr_addr(inode, ipage);
+		if (ifolio) {
+			inline_addr = inline_xattr_addr(inode, &ifolio->page);
 		} else {
-			in_page = f2fs_get_inode_page(sbi, inode->i_ino);
-			if (IS_ERR(in_page)) {
+			in_folio = f2fs_get_inode_folio(sbi, inode->i_ino);
+			if (IS_ERR(in_folio)) {
 				f2fs_alloc_nid_failed(sbi, new_nid);
-				return PTR_ERR(in_page);
+				return PTR_ERR(in_folio);
 			}
-			inline_addr = inline_xattr_addr(inode, in_page);
+			inline_addr = inline_xattr_addr(inode, &in_folio->page);
 		}
 
-		f2fs_wait_on_page_writeback(ipage ? ipage : in_page,
+		f2fs_folio_wait_writeback(ifolio ? ifolio : in_folio,
 							NODE, true, true);
 		/* no need to use xattr node block */
 		if (hsize <= inline_size) {
 			err = f2fs_truncate_xattr_node(inode);
 			f2fs_alloc_nid_failed(sbi, new_nid);
 			if (err) {
-				f2fs_put_page(in_page, 1);
+				f2fs_folio_put(in_folio, true);
 				return err;
 			}
 			memcpy(inline_addr, txattr_addr, inline_size);
-			set_page_dirty(ipage ? ipage : in_page);
+			folio_mark_dirty(ifolio ? ifolio : in_folio);
 			goto in_page_out;
 		}
 	}
@@ -502,12 +502,12 @@ static inline int write_all_xattrs(struct inode *inode, __u32 hsize,
 	memcpy(xattr_addr, txattr_addr + inline_size, VALID_XATTR_BLOCK_SIZE);
 
 	if (inline_size)
-		set_page_dirty(ipage ? ipage : in_page);
+		folio_mark_dirty(ifolio ? ifolio : in_folio);
 	folio_mark_dirty(xfolio);
 
 	f2fs_folio_put(xfolio, true);
 in_page_out:
-	f2fs_put_page(in_page, 1);
+	f2fs_folio_put(in_folio, true);
 	return err;
 }
 
@@ -766,7 +766,7 @@ static int __f2fs_setxattr(struct inode *inode, int index,
 		*(u32 *)((u8 *)last + newsize) = 0;
 	}
 
-	error = write_all_xattrs(inode, new_hsize, base_addr, &ifolio->page);
+	error = write_all_xattrs(inode, new_hsize, base_addr, ifolio);
 	if (error)
 		goto exit;
 
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
