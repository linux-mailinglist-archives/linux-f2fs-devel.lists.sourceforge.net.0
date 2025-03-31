Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CDFA76EA3
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:14:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLWD-0001MF-02;
	Mon, 31 Mar 2025 20:14:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVo-00015R-Mc
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=s0aGzADpb82qOaG8v56gE6Vc0WLqVtQCU76ZZfiS9NM=; b=fK1ZWNckFM60FTCyntJzAkP9Al
 +CTjyHk5mgmE6qAcrRinmTYVMmNZVlUHHGK0DvFKqbhYO8VB8PcqZMAc1rIf3uXaVqisIU5ZM03ae
 MxJEBcgmraU8bouacWHiYAAZv+2TdTMKCirAwfrVy170nsBoSH86pT7An46SVQzOLb+Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=s0aGzADpb82qOaG8v56gE6Vc0WLqVtQCU76ZZfiS9NM=; b=NNV3TojpvnugI+9J3eUjCQDbxE
 Q4iykBZwBHORK5VOoOlM+97S/0uci/tG7+j/lbsSdZ3wl9I6HUocYsd9HW5qMnxAZIL85c8hFjsYI
 mh28sIEHCqQQfnGbGM3Qw5ZLtxAXQDSnvphNsDRJj/C1BOgNiUEYo1XFiM3CqXtBtASY=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVj-0003fS-DN for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=s0aGzADpb82qOaG8v56gE6Vc0WLqVtQCU76ZZfiS9NM=; b=QHHVqk/mq/YCKVwpJWRMTFjU6O
 QrGQGlzRzI3VRUnFIxOWH7d/SbN/jZ/xcCbmwhVwnxouNoZBpMxkWUEx/wGa8xPewb4IAAH3tJIjK
 tVDibPESWebaVYPMdTdzp5xDLBIJkTwla95O/5prb3pacvrYSWupR5b39vl+IomeQTsrCKD2RwRFk
 nWfssSts0+6o33dCml6DKy6fU5u1K8zZascvFFZKnoBswlwP6dtebAdogtAFAFU844oSSl17WoCMP
 tmTYIuXNgmYqpOFU7zJ3spjXfXdfq65PwkWHxHwEhX+I8XTeUY2x9znQ2U+IayGa3ucm0BgiNYvvx
 G/M8auuA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVX-00000004SL8-3mEY;
 Mon, 31 Mar 2025 20:13:19 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:12:10 +0100
Message-ID: <20250331201256.1057782-111-willy@infradead.org>
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
 Content preview:  Also pass the folio into read_all_xattrs(). Signed-off-by:
 Matthew Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/xattr.c | 12
 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-) diff --git a/fs/f2fs/xattr.c
 b/fs/f2fs/xattr.c index 10f4f82bdbde..9dd0d90355f7 100644 ---
 a/fs/f2fs/xattr.c
 +++ b/fs/f2fs/xattr.c @@ -385, 7 +385, 7 @@ static int lookup_all_xattrs(struct
 inode *inode, [...] 
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
X-Headers-End: 1tzLVj-0003fS-DN
Subject: [f2fs-dev] [PATCH 110/153] f2fs: Pass a folio to __f2fs_setxattr()
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

Also pass the folio into read_all_xattrs().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/xattr.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
index 10f4f82bdbde..9dd0d90355f7 100644
--- a/fs/f2fs/xattr.c
+++ b/fs/f2fs/xattr.c
@@ -385,7 +385,7 @@ static int lookup_all_xattrs(struct inode *inode, struct page *ipage,
 	return err;
 }
 
-static int read_all_xattrs(struct inode *inode, struct page *ipage,
+static int read_all_xattrs(struct inode *inode, struct folio *ifolio,
 							void **base_addr)
 {
 	struct f2fs_xattr_header *header;
@@ -402,7 +402,7 @@ static int read_all_xattrs(struct inode *inode, struct page *ipage,
 
 	/* read from inline xattr */
 	if (inline_size) {
-		err = read_inline_xattr(inode, ipage, txattr_addr);
+		err = read_inline_xattr(inode, &ifolio->page, txattr_addr);
 		if (err)
 			goto fail;
 	}
@@ -627,7 +627,7 @@ static bool f2fs_xattr_value_same(struct f2fs_xattr_entry *entry,
 
 static int __f2fs_setxattr(struct inode *inode, int index,
 			const char *name, const void *value, size_t size,
-			struct page *ipage, int flags)
+			struct folio *ifolio, int flags)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct f2fs_xattr_entry *here, *last;
@@ -651,7 +651,7 @@ static int __f2fs_setxattr(struct inode *inode, int index,
 	if (size > MAX_VALUE_LEN(inode))
 		return -E2BIG;
 retry:
-	error = read_all_xattrs(inode, ipage, &base_addr);
+	error = read_all_xattrs(inode, ifolio, &base_addr);
 	if (error)
 		return error;
 
@@ -766,7 +766,7 @@ static int __f2fs_setxattr(struct inode *inode, int index,
 		*(u32 *)((u8 *)last + newsize) = 0;
 	}
 
-	error = write_all_xattrs(inode, new_hsize, base_addr, ipage);
+	error = write_all_xattrs(inode, new_hsize, base_addr, &ifolio->page);
 	if (error)
 		goto exit;
 
@@ -817,7 +817,7 @@ int f2fs_setxattr(struct inode *inode, int index, const char *name,
 	/* this case is only from f2fs_init_inode_metadata */
 	if (ifolio)
 		return __f2fs_setxattr(inode, index, name, value,
-						size, &ifolio->page, flags);
+						size, ifolio, flags);
 	f2fs_balance_fs(sbi, true);
 
 	f2fs_lock_op(sbi);
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
