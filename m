Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ED524AFD43C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jul 2025 19:04:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GX5OE+7gppTiMSOJJir25z4AFRxY3kg+LHk/EKz57Sw=; b=IaI3WsCyFQNKKMbvtpHe15YKgR
	9Yx1z+4d5NPeq7GanGlBhw2UPA7N7cuAmqx5CZcrK0QokSCqwcvA+26E7mQO3XYcKHRCe1HEumD0o
	4c9VYuAbha2rWyHxI1damvqQARL7aDDHeYPKWmhE20PukPOmOw1tEj1HoqHKVAeQPWtY=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZBjx-0005He-Pe;
	Tue, 08 Jul 2025 17:04:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1uZBju-0005FE-1H
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FP5YtJ59TT1ihQ7zQjlpmywgFKiXFrsJshE5SeQdrgI=; b=FmjuBwR9HZgWB6kHSSbcWtM+wu
 mockjqwJ7mNOVEIP3GVUx1svsIdhGes0sPcSDARf2/KPlJ/WFrMweZo7kv1KIjnLBh7nllKLtG5V2
 J5Hm+hw6Ls/t616dyt6FFNVKu0TAzJUWKuNGwbkuF4SWHEWnUELa0NpiVngGY1R0+MOM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FP5YtJ59TT1ihQ7zQjlpmywgFKiXFrsJshE5SeQdrgI=; b=Nt+K9y2Za0q9KwnFo0JTXWT33+
 MRhNYV9J6calxqFmxAAnvpDwIEnC3w/u1YnPSrLHEiImVjRByueTM0AB9vij+6BWqvQKSCdPU343T
 RtJdzB9YAqV5Ko689V0zN0eRsWTz4Ghb+jLTbaT8HslYJv6MW7sRyAIVfkgkMTcDmvcw=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZBjt-0006FH-0j for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=FP5YtJ59TT1ihQ7zQjlpmywgFKiXFrsJshE5SeQdrgI=; b=AbARTrU51alVZ5UtJaX9KBNP+g
 +abADSjcv4tmsuLtFChM+LEFLqtmjmb7bVPqG6kP5ZJMCtuIv0UifaOLHDD1R31uIAF+D/BClhdQm
 2dz6mgbEM4PkEboNg4Un1l0+BUldQcJ7NnqS3PSBc7xg2vxcetxTnW1a7ZhHeDkg2evnwmL3PGC07
 Of8YnIbsXUZ7GJu1YrkqqZ1ZEAu5S4jzDwiir9ewsSgGLGE5G1nsmGE4tr+usyuNeLmDedqPLvaOP
 EKOcDLrEkn7+BEhNGQ5v6DFuYOMTRyTmP3PdXyXOyv9TNhVbcIu5h4MZbZW9WjC3LoKUhhNtVL/3i
 eZbcAfog==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uZBjh-00000000T60-25Qk;
 Tue, 08 Jul 2025 17:04:05 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue,  8 Jul 2025 18:03:25 +0100
Message-ID: <20250708170359.111653-29-willy@infradead.org>
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
 Content preview: Both callers have a folio so pass it in. Signed-off-by:
 Matthew
 Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/node.h | 2 +-
 fs/f2fs/recovery.c
 | 4 ++-- 2 files changed, 3 insertions(+), 3 deletions(-) 
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
X-Headers-End: 1uZBjt-0006FH-0j
Subject: [f2fs-dev] [PATCH 28/60] f2fs: Pass a folio to is_dent_dnode()
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

Both callers have a folio so pass it in.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/node.h     | 2 +-
 fs/f2fs/recovery.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/node.h b/fs/f2fs/node.h
index 17afa6d51053..aea801c58097 100644
--- a/fs/f2fs/node.h
+++ b/fs/f2fs/node.h
@@ -405,7 +405,7 @@ static inline int is_node(const struct page *page, int type)
 
 #define is_cold_node(page)	is_node(page, COLD_BIT_SHIFT)
 #define is_fsync_dnode(folio)	is_node(&folio->page, FSYNC_BIT_SHIFT)
-#define is_dent_dnode(page)	is_node(page, DENT_BIT_SHIFT)
+#define is_dent_dnode(folio)	is_node(&folio->page, DENT_BIT_SHIFT)
 
 static inline void set_cold_node(const struct folio *folio, bool is_dir)
 {
diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index 3434be2d7865..3bfcf5c297a5 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -438,7 +438,7 @@ static int find_fsync_dnodes(struct f2fs_sb_info *sbi, struct list_head *head,
 
 			if (!check_only &&
 					IS_INODE(&folio->page) &&
-					is_dent_dnode(&folio->page)) {
+					is_dent_dnode(folio)) {
 				err = f2fs_recover_inode_page(sbi, folio);
 				if (err) {
 					f2fs_folio_put(folio, true);
@@ -463,7 +463,7 @@ static int find_fsync_dnodes(struct f2fs_sb_info *sbi, struct list_head *head,
 		}
 		entry->blkaddr = blkaddr;
 
-		if (IS_INODE(&folio->page) && is_dent_dnode(&folio->page))
+		if (IS_INODE(&folio->page) && is_dent_dnode(folio))
 			entry->last_dentry = blkaddr;
 next:
 		/* check next segment */
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
