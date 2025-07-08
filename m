Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DBEAFD44D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jul 2025 19:04:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qOySyGeGez1exoaQoHoziwWlcBphbgZHtuyA5LW6SFk=; b=Y/0rJI1PT6aN8IgiNKXEl9D2Qp
	t56L5YY7z6K9PSJZQK/5DmyY+bUBNcGR5ny8/K5SjntN9gXAq6jEMdCx4gtHcPz3FnVIHRrc3/HRI
	miHm9//k/KMzF8yefxY/e1bXNUuk5a4Ey4F1BSxd6BmW/VRrKaK0lgFKYlk+LvhuybeA=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZBk1-0005YM-HW;
	Tue, 08 Jul 2025 17:04:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1uZBjr-0005Vo-Bb
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1rvrXqtgaPtphVgDSx2F+CtzQVJM9t3JV9wjgQ6QmxY=; b=aJR8/w5DH1cTW0kTzyzv168jAP
 VpauFU5PY9hzg7TB3FjRy1XcDzPd/zN+jbGo2P6EKAPoBmNMvSHfC0MpQyd62te0JBHZHcs+BxQoR
 keVdaSEzzaoXCEylOvhaLc7Kd5sf1W+J7PwLrzLVFYbfjW3oMCOR3x2FbpPtkIIuFlGo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1rvrXqtgaPtphVgDSx2F+CtzQVJM9t3JV9wjgQ6QmxY=; b=X+8fIt2+Y+f42SHyBI4DDrXVfT
 NE37p3yNnUPjsSV62Rpz+NO1NU3ZuBCn5bdhiQxIrJLkPoCjxPVuDhFI55gvuU06akY0Zri2UxPfJ
 Kt11yK5vgdXWR/kpy6lP3MO1288mYuEjm3BTgEcV1WK9LukVxETcYBqLHCWGUDaP58e0=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZBjq-0006Ef-Lb for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=1rvrXqtgaPtphVgDSx2F+CtzQVJM9t3JV9wjgQ6QmxY=; b=tK/ixqvhKVlnLJO0rJpdMR5QY/
 fGFMPtvg7B4lTUGSpyGg5np4v8Lm3CPsH9RhXUm4hesTQcIZYnYtc78iD9IrBajB+GLeZxhnM7QI5
 knV6VFG0PRRzQfW4kG5vgYEQFNtZaAJzn1ac43oCspsMFvlAPoL5H6zoRwB5O2RKRh2XwzaZzINM+
 kNK6SFoyd8F89b6OLR7UAeFqb6E/ZMHa8pucJtu69xcQh0Z/vFR1JhtLkJw3ssCZGscYio2f0Gwym
 bm+r+bam88ZVbij646CZXsjb6SWM9SVEfDGTjO77ofwkBUOjyp1qpYaWNDqMhjIEmhRkb66ay9/y2
 ROjBZxvA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uZBjf-00000000T4L-0kXl;
 Tue, 08 Jul 2025 17:04:03 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue,  8 Jul 2025 18:03:09 +0100
Message-ID: <20250708170359.111653-13-willy@infradead.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250708170359.111653-1-willy@infradead.org>
References: <20250708170359.111653-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: All callers have a folio so pass it in. Also make the
 argument
 const as the function does not modify it. Removes a call to compound_head().
 Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org> ---
 fs/f2fs/f2fs.h
 | 2 +- fs/f2fs/node.h | 10 +++++----- fs/f2fs/recovery.c | 6 +++--- 3 files
 changed, 9 insertions(+), 9 deletions(-) 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1uZBjq-0006Ef-Lb
Subject: [f2fs-dev] [PATCH 12/60] f2fs: Pass a folio to
 is_recoverable_dnode()
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

All callers have a folio so pass it in.  Also make the argument const
as the function does not modify it.  Removes a call to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/f2fs.h     |  2 +-
 fs/f2fs/node.h     | 10 +++++-----
 fs/f2fs/recovery.c |  6 +++---
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 5e443b2ce8db..ae66c40c4b7d 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2018,7 +2018,7 @@ static inline struct f2fs_sb_info *F2FS_M_SB(struct address_space *mapping)
 	return F2FS_I_SB(mapping->host);
 }
 
-static inline struct f2fs_sb_info *F2FS_F_SB(struct folio *folio)
+static inline struct f2fs_sb_info *F2FS_F_SB(const struct folio *folio)
 {
 	return F2FS_M_SB(folio->mapping);
 }
diff --git a/fs/f2fs/node.h b/fs/f2fs/node.h
index c03cc1fdd136..75e03f994847 100644
--- a/fs/f2fs/node.h
+++ b/fs/f2fs/node.h
@@ -262,7 +262,7 @@ static inline unsigned int ofs_of_node(const struct page *node_page)
 	return flag >> OFFSET_BIT_SHIFT;
 }
 
-static inline __u64 cpver_of_node(struct page *node_page)
+static inline __u64 cpver_of_node(const struct page *node_page)
 {
 	struct f2fs_node *rn = F2FS_NODE(node_page);
 	return le64_to_cpu(rn->footer.cp_ver);
@@ -313,19 +313,19 @@ static inline void fill_node_footer_blkaddr(struct page *page, block_t blkaddr)
 	rn->footer.next_blkaddr = cpu_to_le32(blkaddr);
 }
 
-static inline bool is_recoverable_dnode(struct page *page)
+static inline bool is_recoverable_dnode(const struct folio *folio)
 {
-	struct f2fs_checkpoint *ckpt = F2FS_CKPT(F2FS_P_SB(page));
+	struct f2fs_checkpoint *ckpt = F2FS_CKPT(F2FS_F_SB(folio));
 	__u64 cp_ver = cur_cp_version(ckpt);
 
 	/* Don't care crc part, if fsck.f2fs sets it. */
 	if (__is_set_ckpt_flags(ckpt, CP_NOCRC_RECOVERY_FLAG))
-		return (cp_ver << 32) == (cpver_of_node(page) << 32);
+		return (cp_ver << 32) == (cpver_of_node(&folio->page) << 32);
 
 	if (__is_set_ckpt_flags(ckpt, CP_CRC_RECOVERY_FLAG))
 		cp_ver |= (cur_cp_crc(ckpt) << 32);
 
-	return cp_ver == cpver_of_node(page);
+	return cp_ver == cpver_of_node(&folio->page);
 }
 
 /*
diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index 224754186096..380055000083 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -375,7 +375,7 @@ static int sanity_check_node_chain(struct f2fs_sb_info *sbi, block_t blkaddr,
 		if (IS_ERR(folio))
 			return PTR_ERR(folio);
 
-		if (!is_recoverable_dnode(&folio->page)) {
+		if (!is_recoverable_dnode(folio)) {
 			f2fs_folio_put(folio, true);
 			*is_detecting = false;
 			return 0;
@@ -424,7 +424,7 @@ static int find_fsync_dnodes(struct f2fs_sb_info *sbi, struct list_head *head,
 			break;
 		}
 
-		if (!is_recoverable_dnode(&folio->page)) {
+		if (!is_recoverable_dnode(folio)) {
 			f2fs_folio_put(folio, true);
 			break;
 		}
@@ -796,7 +796,7 @@ static int recover_data(struct f2fs_sb_info *sbi, struct list_head *inode_list,
 			break;
 		}
 
-		if (!is_recoverable_dnode(&folio->page)) {
+		if (!is_recoverable_dnode(folio)) {
 			f2fs_folio_put(folio, true);
 			break;
 		}
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
