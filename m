Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6957EAFD46C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jul 2025 19:05:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SLGv8jv4yXYGjkjYm/aIlEgRKo+d/0oDmFOHtOnIasU=; b=l5TYkBrJedwyPfuyNFpNLZ9xdN
	nKWMlqOb+A8zIIaNIsgwSUgKHUERzvOCwiP0ABnZThPTblBc/Edw1gVdtGvXAjYKyvLCRwVq94QGA
	I7uQALstLLw7mkXfbxfC+mZlw0A0jtXBC2UqabQthjs4Gkn/5AKYXnx6Y2Cc2yShQ3QY=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZBl0-0005Yo-6D;
	Tue, 08 Jul 2025 17:05:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1uZBjz-0005J4-5u
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aHqa4yqs2PUD99+pQv3lj70AXuQIXxxoBXCv8+LFcMc=; b=ZGSWCLIPLG/8BXSr7ziylll/Xe
 Fp7UEFWgLZo9MJdFUID9KY/0/yRsteORUcOiI4Pnzd7qcFbRzOV2SRj32TSF3Lg2wLwop/kGYIWGy
 9DuvwHknvRqnTnRljt1ztBLZljQPl/7z59g2OClYGwx5W7CgY6VdSazJeCSspv5MlQUE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aHqa4yqs2PUD99+pQv3lj70AXuQIXxxoBXCv8+LFcMc=; b=IEGiVvVI9oM5zqtTR+oOvg8xwb
 AqaN24kuKubktaQPMAy7EWpufpLwfLJ4Bra361dPzAe4AypyFUxn6SWhsYeZL4cSq0kJBrRcxypQW
 +B2jYG80MUeyh0F1sb7aY12J0U1xJrjrQp9DWViMgm2s8LelofkASIuKmAjug41z7ulU=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZBjw-0006H0-Dq for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=aHqa4yqs2PUD99+pQv3lj70AXuQIXxxoBXCv8+LFcMc=; b=mL798PoZtPzeQkOEyrzd7ygswX
 8WTSDci2+igTJysuUkbcmWUiNMMMwGgzfqTN53MBSsjBUoygS8OKe4h1WjheS6KVywxGiFGp4YOk/
 ES25nMBxPC5s3ZQVkeHbpse+64/KyBomX6SrkSwMaHpbGH1xNQKFK2DIdofpRButhfDESw6B7C1LB
 GWOJcUWl3o/KtEk19lJ0cODCNfTYWa9zf8FXgikwGSKc17TcUW2MeAiksbR9RMw723mEsdvq2xnK6
 c5rfs9SuciwRCy2GmdUtRhw/z4eS9fkPSqpcOsE9udQgSpn+Fxuv1row/b6QxkE78gBE4ev9z2+1S
 a1sSTd7w==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uZBjh-00000000T6L-3ozk;
 Tue, 08 Jul 2025 17:04:05 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue,  8 Jul 2025 18:03:28 +0100
Message-ID: <20250708170359.111653-32-willy@infradead.org>
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
 Content preview:  All callers now have a folio so pass it in. Signed-off-by:
 Matthew Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/inode.c | 2 +-
 fs/f2fs/node.c | 12 ++++++------ fs/f2fs/node.h | 2 +- fs/f2fs/segment.c |
 4 ++-- 4 files changed, 10 insertions [...] 
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
X-Headers-End: 1uZBjw-0006H0-Dq
Subject: [f2fs-dev] [PATCH 31/60] f2fs: Pass a folio to is_cold_node()
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

All callers now have a folio so pass it in.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/inode.c   |  2 +-
 fs/f2fs/node.c    | 12 ++++++------
 fs/f2fs/node.h    |  2 +-
 fs/f2fs/segment.c |  4 ++--
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 9b71e3e4f635..68510c2d90a9 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -482,7 +482,7 @@ static int do_read_inode(struct inode *inode)
 		__recover_inline_status(inode, node_folio);
 
 	/* try to recover cold bit for non-dir inode */
-	if (!S_ISDIR(inode->i_mode) && !is_cold_node(&node_folio->page)) {
+	if (!S_ISDIR(inode->i_mode) && !is_cold_node(node_folio)) {
 		f2fs_folio_wait_writeback(node_folio, NODE, true, true);
 		set_cold_node(node_folio, false);
 		folio_mark_dirty(node_folio);
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index b55827d687e2..d406342714f7 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -313,7 +313,7 @@ static unsigned int __gang_lookup_nat_set(struct f2fs_nm_info *nm_i,
 bool f2fs_in_warm_node_list(struct f2fs_sb_info *sbi, struct folio *folio)
 {
 	return is_node_folio(folio) && IS_DNODE(&folio->page) &&
-					is_cold_node(&folio->page);
+					is_cold_node(folio);
 }
 
 void f2fs_init_fsync_node_info(struct f2fs_sb_info *sbi)
@@ -1631,7 +1631,7 @@ static struct folio *last_fsync_dnode(struct f2fs_sb_info *sbi, nid_t ino)
 				return ERR_PTR(-EIO);
 			}
 
-			if (!IS_DNODE(&folio->page) || !is_cold_node(&folio->page))
+			if (!IS_DNODE(&folio->page) || !is_cold_node(folio))
 				continue;
 			if (ino_of_node(folio) != ino)
 				continue;
@@ -1702,7 +1702,7 @@ static bool __write_node_folio(struct folio *folio, bool atomic, bool *submitted
 
 	if (!is_sbi_flag_set(sbi, SBI_CP_DISABLED) &&
 			wbc->sync_mode == WB_SYNC_NONE &&
-			IS_DNODE(&folio->page) && is_cold_node(&folio->page))
+			IS_DNODE(&folio->page) && is_cold_node(folio))
 		goto redirty_out;
 
 	/* get old block addr of this node page */
@@ -1840,7 +1840,7 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
 				goto out;
 			}
 
-			if (!IS_DNODE(&folio->page) || !is_cold_node(&folio->page))
+			if (!IS_DNODE(&folio->page) || !is_cold_node(folio))
 				continue;
 			if (ino_of_node(folio) != ino)
 				continue;
@@ -2043,10 +2043,10 @@ int f2fs_sync_node_pages(struct f2fs_sb_info *sbi,
 			if (step == 0 && IS_DNODE(&folio->page))
 				continue;
 			if (step == 1 && (!IS_DNODE(&folio->page) ||
-						is_cold_node(&folio->page)))
+						is_cold_node(folio)))
 				continue;
 			if (step == 2 && (!IS_DNODE(&folio->page) ||
-						!is_cold_node(&folio->page)))
+						!is_cold_node(folio)))
 				continue;
 lock_node:
 			if (wbc->sync_mode == WB_SYNC_ALL)
diff --git a/fs/f2fs/node.h b/fs/f2fs/node.h
index aea801c58097..a03e30a1b8c2 100644
--- a/fs/f2fs/node.h
+++ b/fs/f2fs/node.h
@@ -403,7 +403,7 @@ static inline int is_node(const struct page *page, int type)
 	return le32_to_cpu(rn->footer.flag) & BIT(type);
 }
 
-#define is_cold_node(page)	is_node(page, COLD_BIT_SHIFT)
+#define is_cold_node(folio)	is_node(&folio->page, COLD_BIT_SHIFT)
 #define is_fsync_dnode(folio)	is_node(&folio->page, FSYNC_BIT_SHIFT)
 #define is_dent_dnode(folio)	is_node(&folio->page, DENT_BIT_SHIFT)
 
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 533b4295e4d6..cd49015a905a 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3620,7 +3620,7 @@ static int __get_segment_type_4(struct f2fs_io_info *fio)
 		else
 			return CURSEG_COLD_DATA;
 	} else {
-		if (IS_DNODE(fio->page) && is_cold_node(fio->page))
+		if (IS_DNODE(fio->page) && is_cold_node(fio->folio))
 			return CURSEG_WARM_NODE;
 		else
 			return CURSEG_COLD_NODE;
@@ -3678,7 +3678,7 @@ static int __get_segment_type_6(struct f2fs_io_info *fio)
 						inode->i_write_hint);
 	} else {
 		if (IS_DNODE(fio->page))
-			return is_cold_node(fio->page) ? CURSEG_WARM_NODE :
+			return is_cold_node(fio->folio) ? CURSEG_WARM_NODE :
 						CURSEG_HOT_NODE;
 		return CURSEG_COLD_NODE;
 	}
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
