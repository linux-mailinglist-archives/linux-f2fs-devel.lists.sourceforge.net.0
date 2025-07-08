Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BE3AFD423
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jul 2025 19:04:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dBT/z1QOcYHtOXfTSb7VPYg6PO+VOPaBGoOioDIcpIs=; b=ebZcjspGu8GlOjmcU7logjqvoE
	v7gOIfOyM0e/uG5aw0Mj2SvJWtZ2J82G0D4uhxA+Fw0n/NKKx4byTZJY2D/MnUPWH/Zm0QwW1xR4F
	Tjxu/8xHAdphTg4yuAj2O6YMEemG0K3RgwwryVp69t9iGiSb5dX0NW6yhroJH0uOeYCM=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZBjq-0005DQ-9l;
	Tue, 08 Jul 2025 17:04:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1uZBjo-0005Cu-JB
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=q3aKHScSXfTUya+QWhslac3Urorr+V1I3nUwzUtzaV0=; b=bJzHiU0BwKrKrl1sHySbEaCBN2
 fR/duv6KFB8zGfNtoH50zlUHZ0qKRlLxob9XcKAawBdAH/3FsZ2TUQAWk2oAlEeElzkMi0SkHwC+y
 94VoWozjNml/Bbh4ZLuNlF0n+1ueX9WV82tET1MOQdWu3DFyTHTHRZl/12gUNIbyd51k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=q3aKHScSXfTUya+QWhslac3Urorr+V1I3nUwzUtzaV0=; b=B0jfxxIz8CwzE0vahpcIxMo25t
 R28CTeEMIOMk9nUCsxR9fungtMqe6tidyRtWJ+GC+8092pUEUSvH/6UwEYCeD+YqrK0qEfTPbyaie
 d3FjMyALHgzTO80RQ5YpYEA990RNEYxgqQLyPjG3MZFNJ1hDACA2GDjyNRd/pJRfc1V8=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZBjk-0006Dq-K5 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=q3aKHScSXfTUya+QWhslac3Urorr+V1I3nUwzUtzaV0=; b=FnmYFZPUAI2Kcsa6htlO4cChm5
 g1Fo0U7PgVxbeqo06Zzz63Jc6rGb63z4X5WFVDdSLaKddFz2H/ta9wESyLeMLCDK06opL2anmYKP+
 1mk+J0cnD/YUedk2iOTpaPZh/AsGSCbxs4qC74oPY5VeVGzwrfneJR1yEIXQ57YItwf+udeCOjbgV
 Nl/LJT6zocF8n3NPZ9+ArvRzGCD8Ay2l/s5IjWhRSTAbgP93b7sAsJHFty1OAKrHl6sT6T3gwoj3h
 02LuPhSjwLaJ1E2it2YB6yH0e77fHamapksEA3MrbxTH/U+KZNn/CykBgrO3UHN/5Hoo2FNgnrYc8
 HwDPVXhQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uZBjd-00000000T3U-4Bna;
 Tue, 08 Jul 2025 17:04:02 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue,  8 Jul 2025 18:03:01 +0100
Message-ID: <20250708170359.111653-5-willy@infradead.org>
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
 Content preview:  The only caller has a folio, so pass it in. Signed-off-by:
 Matthew Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/f2fs.h | 2 +-
 fs/f2fs/node.c
 | 6 +++--- fs/f2fs/recovery.c | 2 +- 3 files changed, 5 insertions(+), 5
 deletions(-) 
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
X-Headers-End: 1uZBjk-0006Dq-K5
Subject: [f2fs-dev] [PATCH 04/60] f2fs: Pass a folio to
 f2fs_recover_inode_page()
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

The only caller has a folio, so pass it in.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/f2fs.h     | 2 +-
 fs/f2fs/node.c     | 6 +++---
 fs/f2fs/recovery.c | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index aa535dcf2297..1243264f4170 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3790,7 +3790,7 @@ void f2fs_alloc_nid_failed(struct f2fs_sb_info *sbi, nid_t nid);
 int f2fs_try_to_free_nids(struct f2fs_sb_info *sbi, int nr_shrink);
 int f2fs_recover_inline_xattr(struct inode *inode, struct folio *folio);
 int f2fs_recover_xattr_data(struct inode *inode, struct page *page);
-int f2fs_recover_inode_page(struct f2fs_sb_info *sbi, struct page *page);
+int f2fs_recover_inode_page(struct f2fs_sb_info *sbi, struct folio *folio);
 int f2fs_restore_node_summary(struct f2fs_sb_info *sbi,
 			unsigned int segno, struct f2fs_summary_block *sum);
 int f2fs_flush_nat_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc);
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 2fd287f2bca4..742f9f750390 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -2801,10 +2801,10 @@ int f2fs_recover_xattr_data(struct inode *inode, struct page *page)
 	return 0;
 }
 
-int f2fs_recover_inode_page(struct f2fs_sb_info *sbi, struct page *page)
+int f2fs_recover_inode_page(struct f2fs_sb_info *sbi, struct folio *folio)
 {
 	struct f2fs_inode *src, *dst;
-	nid_t ino = ino_of_node(page);
+	nid_t ino = ino_of_node(&folio->page);
 	struct node_info old_ni, new_ni;
 	struct folio *ifolio;
 	int err;
@@ -2830,7 +2830,7 @@ int f2fs_recover_inode_page(struct f2fs_sb_info *sbi, struct page *page)
 	fill_node_footer(&ifolio->page, ino, ino, 0, true);
 	set_cold_node(&ifolio->page, false);
 
-	src = F2FS_INODE(page);
+	src = F2FS_INODE(&folio->page);
 	dst = F2FS_INODE(&ifolio->page);
 
 	memcpy(dst, src, offsetof(struct f2fs_inode, i_ext));
diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index 10212130097c..7768e10fc183 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -439,7 +439,7 @@ static int find_fsync_dnodes(struct f2fs_sb_info *sbi, struct list_head *head,
 			if (!check_only &&
 					IS_INODE(&folio->page) &&
 					is_dent_dnode(&folio->page)) {
-				err = f2fs_recover_inode_page(sbi, &folio->page);
+				err = f2fs_recover_inode_page(sbi, folio);
 				if (err) {
 					f2fs_folio_put(folio, true);
 					break;
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
