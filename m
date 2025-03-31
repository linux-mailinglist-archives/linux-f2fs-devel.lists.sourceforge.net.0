Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A631CA76E75
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLVx-0005qL-20;
	Mon, 31 Mar 2025 20:13:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVj-0005fb-Mm
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zN7zhfjCoHd8SehdGoG0gOzFFora0Wolpda3AFrIU6w=; b=audN6eSe5Z0bqPMQmdRA9LdNbx
 vtZzDgtaArvJpD5PRY9ToNQ7BHWTUWss511CVCXc/dGr0CVe67ezgvPanD/s7iUOwNQE33NLrzS9s
 3avae60Ao9agKbfD4/vI08OL6w9Y109MS7zpd/yW+trRWL4JBNYMfyPdKUQRNkMVmFCg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zN7zhfjCoHd8SehdGoG0gOzFFora0Wolpda3AFrIU6w=; b=NGbQSZ8GZqbK1uAXiP3K57qTHr
 Zk+56JasYxaMEyckzKKDOvtZ/M1MveehV+abGQpCkVQ0OcygoNZk0+Za9yILgpj3u1jvIXIBFFFT1
 fh8jJcJRqhO3514ajC4s5NV+eLeNPV4bnRP3Wczq59lBgOD/ZuehcZy3q/LRneDUQ1FE=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVd-0003ch-ES for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=zN7zhfjCoHd8SehdGoG0gOzFFora0Wolpda3AFrIU6w=; b=LSK+vNYcwBaITM6vNmHE/acoU6
 vvAOZ9u+/KYYvLigbdVZOsxfAm4lIcBijjyRP8T0uGiO1rkSz1ILhhF9pggmtOOwPdoHiGpUeiqR0
 VHUPIYuD+8do1UdFbIZDVom/4NbG37FLpoNJNOUQI8kkiwQd3mYFKQ7rQTOv57vzGdsM6Ep/8M8dz
 wp05zYiKf03hs7WrvSr1x3VVBLRcVvSIYoRgyS1p7lzlQ64AoSLLKdMmLrKmMkX1J9RcWvzDyeoql
 ntVqHFKkmsIqVr77Ge0UzHZZS0KjCt1A+MXmglOQrJ56xWqfp531d6bm+aLLvs9tbUAWi9YBSB7Tu
 9SNDK1Tg==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVW-00000004SGU-4BZ6;
 Mon, 31 Mar 2025 20:13:19 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:12:04 +0100
Message-ID: <20250331201256.1057782-105-willy@infradead.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331201256.1057782-1-willy@infradead.org>
References: <20250331201256.1057782-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Remove two calls to compound_head(). Signed-off-by: Matthew
 Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/inline.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-) diff --git a/fs/f2fs/inline.c
 b/fs/f2fs/inline.c index 58f427e9d1f7..fda56c7e848e 100644 ---
 a/fs/f2fs/inline.c
 +++ b/fs/f2fs/inline.c @@ -755,7 +755,7 @@ int f2fs_read_inline_dir(struct
 file *file, s [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-accredit.habeas.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [90.155.50.34 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1tzLVd-0003ch-ES
Subject: [f2fs-dev] [PATCH 104/153] f2fs: Use a folio in
 f2fs_read_inline_dir()
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

Remove two calls to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/inline.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 58f427e9d1f7..fda56c7e848e 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -755,7 +755,7 @@ int f2fs_read_inline_dir(struct file *file, struct dir_context *ctx,
 				struct fscrypt_str *fstr)
 {
 	struct inode *inode = file_inode(file);
-	struct page *ipage = NULL;
+	struct folio *ifolio = NULL;
 	struct f2fs_dentry_ptr d;
 	void *inline_dentry = NULL;
 	int err;
@@ -765,17 +765,17 @@ int f2fs_read_inline_dir(struct file *file, struct dir_context *ctx,
 	if (ctx->pos == d.max)
 		return 0;
 
-	ipage = f2fs_get_inode_page(F2FS_I_SB(inode), inode->i_ino);
-	if (IS_ERR(ipage))
-		return PTR_ERR(ipage);
+	ifolio = f2fs_get_inode_folio(F2FS_I_SB(inode), inode->i_ino);
+	if (IS_ERR(ifolio))
+		return PTR_ERR(ifolio);
 
 	/*
 	 * f2fs_readdir was protected by inode.i_rwsem, it is safe to access
 	 * ipage without page's lock held.
 	 */
-	unlock_page(ipage);
+	folio_unlock(ifolio);
 
-	inline_dentry = inline_data_addr(inode, ipage);
+	inline_dentry = inline_data_addr(inode, &ifolio->page);
 
 	make_dentry_ptr_inline(inode, &d, inline_dentry);
 
@@ -783,7 +783,7 @@ int f2fs_read_inline_dir(struct file *file, struct dir_context *ctx,
 	if (!err)
 		ctx->pos = d.max;
 
-	f2fs_put_page(ipage, 0);
+	f2fs_folio_put(ifolio, false);
 	return err < 0 ? err : 0;
 }
 
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
