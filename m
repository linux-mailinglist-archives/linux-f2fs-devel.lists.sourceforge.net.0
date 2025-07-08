Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A2BAFD428
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jul 2025 19:04:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yaxUCLzQBlIgH1WWKdEOnWo9X32dyzo9cxniMrAGa+k=; b=l0UlGTiLtl5eqLHkg5dKD4+Qcf
	9iya/U3NmOYnR8P27OYAv+cnXSUZx1MqYzUKJfFySZ32SUFfMSD/H/63tPfDahxp1gmwoT136viAH
	MCTFiCdt3+HHCHf4NEifTG7r7eNgfndLrNn8aYvKjSEN2JdNpAOZ1GmeA20KM7aojYoA=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZBjs-0002mZ-0z;
	Tue, 08 Jul 2025 17:04:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1uZBjp-0002lg-SM
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cIE09PI7moKxGK/7CR4OMqfLXIWDx6qN4lWVJRgs46Y=; b=MYyOUhZ9Plxy813SK7+wDvh8bM
 YzyTDVCXq4+u+dhcdjoMk3aVNnQwrobD+twam7Th0bo1soq2RUsi26K4XtX/FQDzHsf+xMzS4h29m
 MMofI3vP3/xHJxtlWUmS73TwODGNY46R1dFovhJ3eiOqxYn8OwOBxlLZhqqT6kiqh/pI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cIE09PI7moKxGK/7CR4OMqfLXIWDx6qN4lWVJRgs46Y=; b=aEkmm8W0wQEElVxwky1upDBfSl
 SAua/uUfx3/iAGz/gYyu8UMlU49URci4GwMmVI+3ip+1TuNaz69Lzbtsf3yJd1rhTW6cxTvq5fde0
 6MQBeqMUvJwz6Gb56bst6TEyFVdITRrKlz/F7pcsRktbjuG4RAkbkK0rwPo7Fkshd2Gw=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZBjp-0006EJ-1z for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=cIE09PI7moKxGK/7CR4OMqfLXIWDx6qN4lWVJRgs46Y=; b=qYpUe0I6KJRqnyhlEGb1ncqxdV
 mLhdie7UR321CbTBarP5mEXY0BgJ+ApIyik2c3G2/BnVbKewRSzxxd4sutPhqysrGsR6uQuLjCV77
 eU/NGqi/3uufBDyewEeOpD4N9ymNR4Mp+GkLmGf6dUsLbMMofMH8TIce4AdJ+gbgqU5YKEEj/GI/k
 uL4I48uepBuo/WP+36kA8/mUgoIcJvOK2HQyA57C2ozy082kJrgN+Bie4HJ5T8V5hZmtiiH8Z3Trv
 sgRUQt6bbmjXWHTvap9MPKpllOyDxpAqLlxNvvBIrwSrMmpGZq04xbsywaydA349wwG0u3MuYR0tm
 D4U3O3dA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uZBji-00000000T6l-1v2j;
 Tue, 08 Jul 2025 17:04:06 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue,  8 Jul 2025 18:03:32 +0100
Message-ID: <20250708170359.111653-36-willy@infradead.org>
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
 Content preview: The only caller already has a folio so pass it in.
 Signed-off-by:
 Matthew Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/f2fs.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-) diff --git a/fs/f2fs/f2fs.h
 b/fs/f2fs/f2fs.h index f98d83ccd1e2..3463fa414b55 100644 --- a/fs/f2fs/f2fs.h
 +++ b/fs/f2fs/f2fs.h @@ -3039, 20 +3039,
 20 @@ static inline __le32 *blkaddr_in_node(struct f2fs [...] 
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
X-Headers-End: 1uZBjp-0006EJ-1z
Subject: [f2fs-dev] [PATCH 35/60] f2fs: Pass a folio to get_dnode_base()
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

The only caller already has a folio so pass it in.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/f2fs.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index f98d83ccd1e2..3463fa414b55 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3039,20 +3039,20 @@ static inline __le32 *blkaddr_in_node(struct f2fs_node *node)
 
 static inline int f2fs_has_extra_attr(struct inode *inode);
 static inline unsigned int get_dnode_base(struct inode *inode,
-					struct page *node_page)
+					struct folio *node_folio)
 {
-	if (!IS_INODE(node_page))
+	if (!IS_INODE(&node_folio->page))
 		return 0;
 
 	return inode ? get_extra_isize(inode) :
-			offset_in_addr(&F2FS_NODE(node_page)->i);
+			offset_in_addr(&F2FS_NODE(&node_folio->page)->i);
 }
 
 static inline __le32 *get_dnode_addr(struct inode *inode,
 					struct folio *node_folio)
 {
 	return blkaddr_in_node(F2FS_NODE(&node_folio->page)) +
-			get_dnode_base(inode, &node_folio->page);
+			get_dnode_base(inode, node_folio);
 }
 
 static inline block_t data_blkaddr(struct inode *inode,
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
