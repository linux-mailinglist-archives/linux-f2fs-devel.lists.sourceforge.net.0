Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A91A39315
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Feb 2025 06:52:22 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tkGWn-00023r-2R;
	Tue, 18 Feb 2025 05:52:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tkGWl-00023Y-K8
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Feb 2025 05:52:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fDqWscxPRQ0KKXzzEQ5kU80x7n6q8Fvwr29XIj71fLI=; b=Nqp7Gs45n2KRr01wIAKeR5D/Ze
 8va+IXYldlFhElBEk5h3JHHO4d+NYK2jdmLVzT2bfyzCCaXTOW+IDNjiKZf9i+uzDXaZe3ct0FTAI
 ajpHqgsS7CkXpVujpRmzYv0OENKGQ/3KYwbYOxBX0nW2odasKFYeLY/kwrqQ0f7n7G6g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fDqWscxPRQ0KKXzzEQ5kU80x7n6q8Fvwr29XIj71fLI=; b=VpjFeBn97QYMRUE1XtIBJVdgv/
 7xbZo1oZFudAz6KVr7I0jIZHpTkpoNAE1CUDtNbevn/fow4/R7Fs0Bbv99TxieBYS0iDjll1ZZffo
 ud9VXJ/YeKSZuxIQqWg4Dno5C9MuBBdXlljSXq4QuaInR0chBXS9hCrzddM3Qw1R93z4=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tkGWj-0007bP-BT for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Feb 2025 05:52:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=fDqWscxPRQ0KKXzzEQ5kU80x7n6q8Fvwr29XIj71fLI=; b=vOfuj+V8/kOdy/6eNxnEzL+bil
 CHlpYCBeaX/LgRZINmxL4HsYv9ySbzjcbNsXkcKOHlGWWCtov4KZGJ4DaLQJb0c+FG33A9nOJgYca
 4OEvSjoPKusJhYwbi0jnYbFUC0ECAoQQI8kB5v3BPEo8SLgscmkaqU/yJX1uBZowfhiqBNBxiatc9
 e4VLsTWvTl8WWuL1Q4NdfOytupc8XUZBWbo+dVOehrnMvKe3vABMf/1L4Mpmg0kDoj59rtNGLihqK
 TgrZbDeeKZPwaDNIQhnopX1ntnlnE8Yd/0gwP2f5Y7pquaUOPR2iOWUMy1V5PfvzbDAuvflnyCIwi
 N57TkQnQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tkGWc-00000002TrW-0HmO; Tue, 18 Feb 2025 05:52:06 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue, 18 Feb 2025 05:51:40 +0000
Message-ID: <20250218055203.591403-7-willy@infradead.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250218055203.591403-1-willy@infradead.org>
References: <20250218055203.591403-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Its one caller now has a folio;
 pass it in and do page conversions
 where necessary inside flush_dirty_inode(). Saves two hidden calls to
 compound_head().
 Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org> ---
 fs/f2fs/node.c
 | 12 ++++++------ 1 file changed, 6 insertions(+), 6 deletions(-) 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [90.155.50.34 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1tkGWj-0007bP-BT
Subject: [f2fs-dev] [PATCH 06/27] f2fs: Pass a folio to flush_dirty_inode()
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
Cc: linux-fsdevel@vger.kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Its one caller now has a folio; pass it in and do page conversions where
necessary inside flush_dirty_inode().  Saves two hidden calls to
compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/node.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 6022f9200f4c..1ff6f5888950 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1920,18 +1920,18 @@ static int f2fs_match_ino(struct inode *inode, unsigned long ino, void *data)
 	return 1;
 }
 
-static bool flush_dirty_inode(struct page *page)
+static bool flush_dirty_inode(struct folio *folio)
 {
-	struct f2fs_sb_info *sbi = F2FS_P_SB(page);
+	struct f2fs_sb_info *sbi = F2FS_F_SB(folio);
 	struct inode *inode;
-	nid_t ino = ino_of_node(page);
+	nid_t ino = ino_of_node(&folio->page);
 
 	inode = find_inode_nowait(sbi->sb, ino, f2fs_match_ino, NULL);
 	if (!inode)
 		return false;
 
-	f2fs_update_inode(inode, page);
-	unlock_page(page);
+	f2fs_update_inode(inode, &folio->page);
+	folio_unlock(folio);
 
 	iput(inode);
 	return true;
@@ -2054,7 +2054,7 @@ int f2fs_sync_node_pages(struct f2fs_sb_info *sbi,
 			}
 
 			/* flush dirty inode */
-			if (IS_INODE(&folio->page) && flush_dirty_inode(&folio->page))
+			if (IS_INODE(&folio->page) && flush_dirty_inode(folio))
 				goto lock_node;
 write_node:
 			f2fs_folio_wait_writeback(folio, NODE, true, true);
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
