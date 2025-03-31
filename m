Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2F3A76E7F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLVz-0005tC-2H;
	Mon, 31 Mar 2025 20:13:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVn-0005iK-K1
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7cHQPIHB42clAexJkqoX3zxkQpD0TxSqQD/o9EdAlmI=; b=hCIZFV4DrersbVzB4lg44bvfJq
 SHyxt1/PodCaiHiyStgMbtOPssC70B80ej6oFJ6HGH6y5it/6WCnZGD+8jsKBUT4QGN3KZxPgtGIb
 9A3dgvSsG7SgyyAsqiR3CXk47o161v5qrC6F4651cIxDmg5hKpWo59QduhuDNusk690M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7cHQPIHB42clAexJkqoX3zxkQpD0TxSqQD/o9EdAlmI=; b=YFrO7qfKZ4TfR0BG8X2DSW6O3T
 lYizLFLFxLPMotPeJpUPfLRGg53/ZoaCR0KVW2Md2XoEyqnVrAq8MAZfKI28HlzBnkEpJt/Toucg8
 pPbOq4I/+fovSUrgn97ES8xoVB3blhkdlblONZCfVkfyo/a+N+VsczMSZmZOKNe75pDI=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVc-0003cD-Ad for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=7cHQPIHB42clAexJkqoX3zxkQpD0TxSqQD/o9EdAlmI=; b=GOjJrwPP0keroV1Qfnu/z0Dhz0
 tkYa5ei0j+XcrJKLqqUwWiMJmsC4qSHtzwb5CurNsi7vjOL1vpfXGIPOZeMiJnDk8XmbEiiIYZvkD
 AEggbz6lOivOx6rnYzXq0kknxYBRPiWqoZQ4mCJbHZAJPukk7RPzhPF/qlhSwBKy01q1sgzA/1Jmn
 M6pkeRslPLoAHfjN6KkeUuoHH0KF7NOB/frvdBXckaTXoiV//kqTtN3wutS0xVNuSlj2bx6vGu/+D
 Tkrd/kvY0sHqKGJjmMPLL6/JWF1lDG7NJYi8F8aw8Qit66CVI2MgykxtIWfjiol/drBUTrZEvP5dc
 AyMUp68g==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVV-00000004SB2-3uDt;
 Mon, 31 Mar 2025 20:13:17 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:11:58 +0100
Message-ID: <20250331201256.1057782-99-willy@infradead.org>
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
 Content preview: All callers have now been converted to call
 f2fs_get_xnode_folio().
 Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org> ---
 fs/f2fs/f2fs.h
 | 1 - fs/f2fs/node.c | 8 -------- 2 files changed, 9 deletions(-) 
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
X-Headers-End: 1tzLVc-0003cD-Ad
Subject: [f2fs-dev] [PATCH 098/153] f2fs: Remove f2fs_get_xnode_page()
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

All callers have now been converted to call f2fs_get_xnode_folio().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/f2fs.h | 1 -
 fs/f2fs/node.c | 8 --------
 2 files changed, 9 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 9257ea0f2ecf..cf61763e2209 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3733,7 +3733,6 @@ struct folio *f2fs_get_node_folio(struct f2fs_sb_info *sbi, pgoff_t nid);
 struct folio *f2fs_get_inode_folio(struct f2fs_sb_info *sbi, pgoff_t ino);
 struct page *f2fs_get_inode_page(struct f2fs_sb_info *sbi, pgoff_t ino);
 struct folio *f2fs_get_xnode_folio(struct f2fs_sb_info *sbi, pgoff_t xnid);
-struct page *f2fs_get_xnode_page(struct f2fs_sb_info *sbi, pgoff_t xnid);
 int f2fs_move_node_folio(struct folio *node_folio, int gc_type);
 void f2fs_flush_inline_data(struct f2fs_sb_info *sbi);
 int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 3c8c8c8a5508..2db41552ae76 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1559,14 +1559,6 @@ struct folio *f2fs_get_xnode_folio(struct f2fs_sb_info *sbi, pgoff_t xnid)
 	return __get_node_folio(sbi, xnid, NULL, 0, NODE_TYPE_XATTR);
 }
 
-struct page *f2fs_get_xnode_page(struct f2fs_sb_info *sbi, pgoff_t xnid)
-{
-	struct folio *folio = __get_node_folio(sbi, xnid, NULL, 0,
-						NODE_TYPE_XATTR);
-
-	return &folio->page;
-}
-
 static struct folio *f2fs_get_node_folio_ra(struct folio *parent, int start)
 {
 	struct f2fs_sb_info *sbi = F2FS_F_SB(parent);
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
