Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A00FAFD445
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jul 2025 19:04:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZOx74hp9kGrpnVJa16qeHjPUWsQrYoR8lrqOUGtgXf0=; b=dAhf9xmnewj8e4csstFKgEuakz
	wm+2gRYU2WUtKacxJP6Woo6N3jEcHsT13//iUE7288l+3jfShYAbHyVGKvXv7whx9Ny6MoxTD6CNx
	I3FDTb6WqryeRt9VY0rYLyqNxHo7+HIDxA1PtNIRzTDQ6JOWuxDEny91/YQEmSgQdlXs=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZBk0-0002sS-Bb;
	Tue, 08 Jul 2025 17:04:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1uZBjw-0002pp-SO
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=o8m/wrU2lm3J69/ZQAHh0OUYfHatjQM0x6+WcJpNi7A=; b=j4wb5tHPD6Z+H9mrdfBhNkNa6J
 KJBdZazh7TR7neXoepnQpAVDATRe4mDy+um85SLc3fEP27I1Dqy12pyOsDy+KUKp6I7hX6xC5yEpI
 kTKvzKfd2G8HBjPRZnNhD8d2PAItb8wYRRVN8J8awY62Va7bHyo5IeNLEX5/uQ4BxUkk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=o8m/wrU2lm3J69/ZQAHh0OUYfHatjQM0x6+WcJpNi7A=; b=lvP1HInEdfCXjAVqph0bjVHdjn
 YEccoruAUyGESSGYTJxEbaOQsBPM4QJxKaJw4IpLEJrENywkikIC2kvNf/jEIQurWeDuEbcARPsd3
 gNr8qcuyTvpWlieJ460qqFblQeRbss9445NiTc/ruBne/52D0JFHbV8kSUP6oHO7q5pk=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZBjr-0006Ep-IK for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=o8m/wrU2lm3J69/ZQAHh0OUYfHatjQM0x6+WcJpNi7A=; b=rffmzwQU820j1Q1B1zQLUpe0MQ
 7sk9bKJ7sc0CMOWkJAueeIQ1q/YkC9qQWjNvWijd64WNGQg1oqP8G/Is5WaV9Ya/vkg0mv6OghMN7
 GVHJDdA9KI9LhsHED4fvBYYtgMeL+N/OROJnv9KIyrzCFfulcZ7cHEsvEx+Vc3LwcMk7xfw05pOLj
 Dnya4jJ+SvmAAW1Wl6opaQiL0TdyPulZ5PdHTDIyL63SQaOeC5iXEdPBQ6PKaK/BVfliUZSgBotFE
 nHvcn8YRjqfrlcslV3Jq3puxYYh7QV5ViwcU1eOmyaa6wTQE6REXNvzNPZDtsfaR/rrvSTb7ScgZb
 qTaknFyg==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uZBjf-00000000T4u-3Xrz;
 Tue, 08 Jul 2025 17:04:04 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue,  8 Jul 2025 18:03:14 +0100
Message-ID: <20250708170359.111653-18-willy@infradead.org>
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
 Content preview: All callers have a folio so pass it in. Signed-off-by:
 Matthew
 Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/f2fs.h | 2 +-
 fs/f2fs/inode.c
 | 10 +++++----- fs/f2fs/node.c | 2 +- fs/f2fs/node.h | 2 +- fs/f2fs/segment.c
 | 2 +- 5 files chan [...] 
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
X-Headers-End: 1uZBjr-0006Ep-IK
Subject: [f2fs-dev] [PATCH 17/60] f2fs: Pass a folio to
 f2fs_inode_chksum_set()
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

All callers have a folio so pass it in.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/f2fs.h    |  2 +-
 fs/f2fs/inode.c   | 10 +++++-----
 fs/f2fs/node.c    |  2 +-
 fs/f2fs/node.h    |  2 +-
 fs/f2fs/segment.c |  2 +-
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 7488ebc7b390..49312008fedb 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3634,7 +3634,7 @@ int f2fs_pin_file_control(struct inode *inode, bool inc);
  */
 void f2fs_set_inode_flags(struct inode *inode);
 bool f2fs_inode_chksum_verify(struct f2fs_sb_info *sbi, struct folio *folio);
-void f2fs_inode_chksum_set(struct f2fs_sb_info *sbi, struct page *page);
+void f2fs_inode_chksum_set(struct f2fs_sb_info *sbi, struct folio *folio);
 struct inode *f2fs_iget(struct super_block *sb, unsigned long ino);
 struct inode *f2fs_iget_retry(struct super_block *sb, unsigned long ino);
 int f2fs_try_to_free_nats(struct f2fs_sb_info *sbi, int nr_shrink);
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index db4ccde3737a..0a071ce586fa 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -184,14 +184,14 @@ bool f2fs_inode_chksum_verify(struct f2fs_sb_info *sbi, struct folio *folio)
 	return provided == calculated;
 }
 
-void f2fs_inode_chksum_set(struct f2fs_sb_info *sbi, struct page *page)
+void f2fs_inode_chksum_set(struct f2fs_sb_info *sbi, struct folio *folio)
 {
-	struct f2fs_inode *ri = &F2FS_NODE(page)->i;
+	struct f2fs_inode *ri = &F2FS_NODE(&folio->page)->i;
 
-	if (!f2fs_enable_inode_chksum(sbi, page))
+	if (!f2fs_enable_inode_chksum(sbi, &folio->page))
 		return;
 
-	ri->i_inode_checksum = cpu_to_le32(f2fs_inode_chksum(sbi, page));
+	ri->i_inode_checksum = cpu_to_le32(f2fs_inode_chksum(sbi, &folio->page));
 }
 
 static bool sanity_check_compress_inode(struct inode *inode,
@@ -752,7 +752,7 @@ void f2fs_update_inode(struct inode *inode, struct folio *node_folio)
 
 	init_idisk_time(inode);
 #ifdef CONFIG_F2FS_CHECK_FS
-	f2fs_inode_chksum_set(F2FS_I_SB(inode), &node_folio->page);
+	f2fs_inode_chksum_set(F2FS_I_SB(inode), node_folio);
 #endif
 }
 
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index db41d41f03db..50c08e89f063 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -2215,7 +2215,7 @@ static bool f2fs_dirty_node_folio(struct address_space *mapping,
 		folio_mark_uptodate(folio);
 #ifdef CONFIG_F2FS_CHECK_FS
 	if (IS_INODE(&folio->page))
-		f2fs_inode_chksum_set(F2FS_M_SB(mapping), &folio->page);
+		f2fs_inode_chksum_set(F2FS_M_SB(mapping), folio);
 #endif
 	if (filemap_dirty_folio(mapping, folio)) {
 		inc_page_count(F2FS_M_SB(mapping), F2FS_DIRTY_NODES);
diff --git a/fs/f2fs/node.h b/fs/f2fs/node.h
index 8d7d7405de9b..914399113f21 100644
--- a/fs/f2fs/node.h
+++ b/fs/f2fs/node.h
@@ -429,7 +429,7 @@ static inline void set_mark(struct folio *folio, int mark, int type)
 	rn->footer.flag = cpu_to_le32(flag);
 
 #ifdef CONFIG_F2FS_CHECK_FS
-	f2fs_inode_chksum_set(F2FS_F_SB(folio), &folio->page);
+	f2fs_inode_chksum_set(F2FS_F_SB(folio), folio);
 #endif
 }
 #define set_dentry_mark(folio, mark)	set_mark(folio, mark, DENT_BIT_SHIFT)
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 91f32c113da4..28fb844b7921 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3854,7 +3854,7 @@ int f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct folio *folio,
 	if (folio && IS_NODESEG(curseg->seg_type)) {
 		fill_node_footer_blkaddr(&folio->page, NEXT_FREE_BLKADDR(sbi, curseg));
 
-		f2fs_inode_chksum_set(sbi, &folio->page);
+		f2fs_inode_chksum_set(sbi, folio);
 	}
 
 	if (fio) {
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
