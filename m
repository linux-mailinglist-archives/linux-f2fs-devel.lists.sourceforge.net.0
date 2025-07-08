Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD35AFD431
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jul 2025 19:04:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iVLcI/WhjbjzRwmy22Q404+B97xXp83l/B2uNsmwaJ4=; b=Fh6JAf5i+UoJj99Sgi72xvoMCb
	S2ZpdpTEnOhO+xAa8jbdjKGl65KgLGB3fPHykIvdXoRKf4xgmdNA18Rf49XJYciGHZF5LDzVzTPgr
	WlAn7JNb85u/7cKFxSXRwncTrwAiDyHPdJPsuWl2VCgMfxjIfmJA+4VoK+gfWHLCSHmg=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZBjt-0005F4-WA;
	Tue, 08 Jul 2025 17:04:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1uZBjr-0005Dp-Bj
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=R2jMJxpR2A64tzaHabELNjuPL6LuxY/1e8z+k/PkZKI=; b=HKCTYBhPaygfnnW0x01Gjw2DF+
 MUSLaC7XegcuHBvVJqKHBfutmtV59AfneWV8bU/5/NgOmPPATyJh3ERcxShQARjVEugDErjJ7c+T7
 5zpNHBb4Swvq7n3GJWqrQPh6jh9YG6ZzfBaLXGEb54XqCePjLOtwGvZgGjjQXYmNuO5k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=R2jMJxpR2A64tzaHabELNjuPL6LuxY/1e8z+k/PkZKI=; b=N/UJWeTtyJexAgpDq4awm/m6cT
 6estIavAqtfyu6quK9cXQ+FtsITNLiKsIuUsZZLb6wR56CG6RnyqyFb5XDNlEuzvMj/9vng4sCmuB
 kqFRBLK/0BylLrDMmuwyOBcodzZLMvrbe9bKPLM94v5wDsy3QyESoogbR+XBVRxAJC08=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZBjn-0006EB-Bh for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=R2jMJxpR2A64tzaHabELNjuPL6LuxY/1e8z+k/PkZKI=; b=nb9ykw8uNr4uGQKPIIBYgNDCfl
 9QecGrrk5U+p8hWN8+QL7TyVrXpilJekkVffj6973vAReCFGtYMiZLqUkJpAzHvxRM+I2IHj7LfVn
 ZEaMc2S4SqtKXFk44ZkGQS6o/idd+o/mgcIcsXqtM5znduEh5Bm0Wfih66Jn54GAgeY2lsaHcMAO3
 jAmwRd8oYmtUKYKIoUXoYYKOY1dA25McBvJmtzcIBS5XGt8CCZNdKlGPzO0HHUDQIDhOK9W4y2fxG
 n9DFGewW3hMbzORabswGLedMc4CFWr6CZCdhhYiVygNt/HtjdMDVjid4ECZJfusVEit/Njvl7S9fc
 qe7XOYQg==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uZBjh-00000000T5b-007d;
 Tue, 08 Jul 2025 17:04:05 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue,  8 Jul 2025 18:03:21 +0100
Message-ID: <20250708170359.111653-25-willy@infradead.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250708170359.111653-1-willy@infradead.org>
References: <20250708170359.111653-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: All callers have a folio so pass it in. Also mark it as const
 to help the compiler. Signed-off-by: Matthew Wilcox (Oracle)
 <willy@infradead.org>
 --- fs/f2fs/node.c | 4 ++-- fs/f2fs/node.h | 4 ++-- fs/f2fs/recovery.c |
 2 +- 3 files changed, 5 insertions(+), 5 deletions(-) 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1uZBjn-0006EB-Bh
Subject: [f2fs-dev] [PATCH 24/60] f2fs: Pass a folio to fill_node_footer()
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

All callers have a folio so pass it in.  Also mark it as const to help
the compiler.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/node.c     | 4 ++--
 fs/f2fs/node.h     | 4 ++--
 fs/f2fs/recovery.c | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 15a024581014..9c47f1e73421 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1380,7 +1380,7 @@ struct folio *f2fs_new_node_folio(struct dnode_of_data *dn, unsigned int ofs)
 	set_node_addr(sbi, &new_ni, NEW_ADDR, false);
 
 	f2fs_folio_wait_writeback(folio, NODE, true, true);
-	fill_node_footer(&folio->page, dn->nid, dn->inode->i_ino, ofs, true);
+	fill_node_footer(folio, dn->nid, dn->inode->i_ino, ofs, true);
 	set_cold_node(folio, S_ISDIR(dn->inode->i_mode));
 	if (!folio_test_uptodate(folio))
 		folio_mark_uptodate(folio);
@@ -2827,7 +2827,7 @@ int f2fs_recover_inode_page(struct f2fs_sb_info *sbi, struct folio *folio)
 
 	if (!folio_test_uptodate(ifolio))
 		folio_mark_uptodate(ifolio);
-	fill_node_footer(&ifolio->page, ino, ino, 0, true);
+	fill_node_footer(ifolio, ino, ino, 0, true);
 	set_cold_node(ifolio, false);
 
 	src = F2FS_INODE(folio);
diff --git a/fs/f2fs/node.h b/fs/f2fs/node.h
index 0fd4a09d6e2f..91a037a1815d 100644
--- a/fs/f2fs/node.h
+++ b/fs/f2fs/node.h
@@ -274,10 +274,10 @@ static inline block_t next_blkaddr_of_node(struct folio *node_folio)
 	return le32_to_cpu(rn->footer.next_blkaddr);
 }
 
-static inline void fill_node_footer(struct page *page, nid_t nid,
+static inline void fill_node_footer(const struct folio *folio, nid_t nid,
 				nid_t ino, unsigned int ofs, bool reset)
 {
-	struct f2fs_node *rn = F2FS_NODE(page);
+	struct f2fs_node *rn = F2FS_NODE(&folio->page);
 	unsigned int old_flag = 0;
 
 	if (reset)
diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index 185632ef790f..2de28bdfa670 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -759,7 +759,7 @@ static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
 	}
 
 	copy_node_footer(dn.node_folio, folio);
-	fill_node_footer(&dn.node_folio->page, dn.nid, ni.ino,
+	fill_node_footer(dn.node_folio, dn.nid, ni.ino,
 					ofs_of_node(&folio->page), false);
 	folio_mark_dirty(dn.node_folio);
 err:
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
