Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A871A76E4B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLVk-0000mq-I0;
	Mon, 31 Mar 2025 20:13:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVT-0000jm-VH
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GhI8BZdLyvaucr9r4a2eQNWPKMreS6lMGr2xogonWBA=; b=QjidP4zxFhr77IIx0lmeiaFNCa
 akRgYJaQLLyW0diLPvANDaXWgTaE2wA5nlb9nrudnHEeRqXqkk1ZXQqU7vMD19bhGn1sgZqUFrMAi
 18fS+gZp61Jwz5Cd2JDmMP4eCzaMRPKm4cTns2lOOHkXg0G0CS2Pp2woXU8BElx/QX+0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GhI8BZdLyvaucr9r4a2eQNWPKMreS6lMGr2xogonWBA=; b=l98SRGw+j1B3JKflVfz1vEkqGA
 fWkaC4cN/Y84MF4eNzBxjFumY8DWCPE3sGhxChQOkQRuWkIhyq02Wlg3mrqKs9OswewnLrLYJ0yXg
 wpFy0b4bzdSR3O7s8i0yZtDUSlGrv7KMCL4I04nLDpa3jsH5Z/Efmemgc/3fVDhZHyt4=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVT-0003ZO-Pm for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=GhI8BZdLyvaucr9r4a2eQNWPKMreS6lMGr2xogonWBA=; b=HknQ0wHwCIuKxIzk5R/vwgHYrj
 iVH6r+J6o+gF/lKNSPcvDl17hqQlqXLaBD3i4ms6+pE5Uj2v48ZQPT7gHmJQLzOgbm0NfOLGYpzZe
 rsiqm7gSm1yVzf0lOfIzL0iZCGPKHPkl0jL02FkJSMAGMKBqUgwFNeo4iMxb+MJfLfmbSO4dq7CGb
 ql7Y/2ddRDSPmfQd4B3P944djNCV09fqBgesdA3xXbRO1GLNSdf33jYv9yWFrl4qkalA+fCrCiBsm
 1yhppb6DkvZg1JM4KTWlww6YxoOKQKNWzlNfKy14FcwEvzb7rIIpF1eFWe17Ii29Spa0Y8JRv7S9A
 88/sccqA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVN-00000004Rmx-1dvW;
 Mon, 31 Mar 2025 20:13:09 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:11:16 +0100
Message-ID: <20250331201256.1057782-57-willy@infradead.org>
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
 Content preview: Remove three hidden calls to compound_head(). Signed-off-by:
 Matthew Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/dir.c | 18
 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-) diff --git a/fs/f2fs/dir.c
 b/fs/f2fs/dir.c index 2334995c9f9b..1e939c251752 100644 --- a/fs/f2fs/dir.c
 +++ b/fs/f2fs/dir.c @@ -664,7 +664,7 @@ int f2fs_add_regular_entry(struct
 inode *dir, const struc [...] 
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
X-Headers-End: 1tzLVT-0003ZO-Pm
Subject: [f2fs-dev] [PATCH 056/153] f2fs: Use a folio in
 f2fs_add_regular_entry()
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

Remove three hidden calls to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/dir.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index 2334995c9f9b..1e939c251752 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -664,7 +664,7 @@ int f2fs_add_regular_entry(struct inode *dir, const struct f2fs_filename *fname,
 	unsigned int current_depth;
 	unsigned long bidx, block;
 	unsigned int nbucket, nblock;
-	struct page *dentry_page = NULL;
+	struct folio *dentry_folio = NULL;
 	struct f2fs_dentry_block *dentry_blk = NULL;
 	struct f2fs_dentry_ptr d;
 	struct page *page = NULL;
@@ -697,24 +697,24 @@ int f2fs_add_regular_entry(struct inode *dir, const struct f2fs_filename *fname,
 				(le32_to_cpu(fname->hash) % nbucket));
 
 	for (block = bidx; block <= (bidx + nblock - 1); block++) {
-		dentry_page = f2fs_get_new_data_page(dir, NULL, block, true);
-		if (IS_ERR(dentry_page))
-			return PTR_ERR(dentry_page);
+		dentry_folio = f2fs_get_new_data_folio(dir, NULL, block, true);
+		if (IS_ERR(dentry_folio))
+			return PTR_ERR(dentry_folio);
 
-		dentry_blk = page_address(dentry_page);
+		dentry_blk = folio_address(dentry_folio);
 		bit_pos = f2fs_room_for_filename(&dentry_blk->dentry_bitmap,
 						slots, NR_DENTRY_IN_BLOCK);
 		if (bit_pos < NR_DENTRY_IN_BLOCK)
 			goto add_dentry;
 
-		f2fs_put_page(dentry_page, 1);
+		f2fs_folio_put(dentry_folio, true);
 	}
 
 	/* Move to next level to find the empty slot for new dentry */
 	++level;
 	goto start;
 add_dentry:
-	f2fs_wait_on_page_writeback(dentry_page, DATA, true, true);
+	f2fs_folio_wait_writeback(dentry_folio, DATA, true, true);
 
 	if (inode) {
 		f2fs_down_write(&F2FS_I(inode)->i_sem);
@@ -729,7 +729,7 @@ int f2fs_add_regular_entry(struct inode *dir, const struct f2fs_filename *fname,
 	f2fs_update_dentry(ino, mode, &d, &fname->disk_name, fname->hash,
 			   bit_pos);
 
-	set_page_dirty(dentry_page);
+	folio_mark_dirty(dentry_folio);
 
 	if (inode) {
 		f2fs_i_pino_write(inode, dir->i_ino);
@@ -746,7 +746,7 @@ int f2fs_add_regular_entry(struct inode *dir, const struct f2fs_filename *fname,
 	if (inode)
 		f2fs_up_write(&F2FS_I(inode)->i_sem);
 
-	f2fs_put_page(dentry_page, 1);
+	f2fs_folio_put(dentry_folio, true);
 
 	return err;
 }
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
