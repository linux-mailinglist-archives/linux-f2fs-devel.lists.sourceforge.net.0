Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 565E3AFD444
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jul 2025 19:04:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GawaN7P7mg9R9SnP59JwLCixf8KZXZ8+/q04SNvJdZg=; b=FlNjyXQj6vsYu9sfQsjvq3yieW
	0MLD3TFHBoEP+bnmBCNvCdFaRA1r0jnxvCIRqZlXdvq/invRltyJvxUAfsJKxv2vgQj6u5n80tHYm
	RkaGHyEjVH9Y3kEoTjRub9yQwE6JGNDW6Q+xtXnbm22zFw5lvc87tTBduBZRc6yUTWMU=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZBk0-0002s3-0k;
	Tue, 08 Jul 2025 17:04:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1uZBjv-0002pI-RQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0pH0KOf2lJ1Ia87grso69Oz4UdKnCqSvU6d4DC0w2r8=; b=lajK7IasGzjGxIsd927lfVJnAN
 p16RZ5gJtNeCiN2CUG1MAp6l0+i8NozOGc6unWp4SfMnVSTW8lm8ETgUXbzpFEZJBvQdkwMmA1CON
 bUwKLUcKCfK2EwLtkT63IdhF+k//gYI7xH9l377MErZ/J1aOOS+6hvCpBgRCYj5l59uA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0pH0KOf2lJ1Ia87grso69Oz4UdKnCqSvU6d4DC0w2r8=; b=lNSRbkMz6cKB0J0zeo98oUk7KZ
 obTT8pNlotFkffaTEZmJl67oOXzDu4UraFpEUo77wCVVjGfXgHNY5DqD/nUZAcFWjvHyV1IV5a1eG
 bR4VCbmAtqilF2IVsqIz2FafNBax4SWJaKSkGvjpJo8/CVW9UP782lG9glg412RN6ojA=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZBjs-0006F1-5Y for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=0pH0KOf2lJ1Ia87grso69Oz4UdKnCqSvU6d4DC0w2r8=; b=KhQcZsrQfr03xxTn/LOuR/Jfou
 skOGYEkAfnvUBcJECLP2QFJihx6Fq3Wau0HAqOi1vE3D0RSCNbkpwXZYFDA8cmvjq3d2dRphnwjmU
 u5jb5qXS5wuqW8uqmeYxB2GOU/5MLYw+U2HZMz0Jrnoru5uFYB7Bjz+mmTW1eZ4TFBGAdpd+2NIrh
 UL+6jdA6GUAn+oW5lF8ggAyr+dvubXL1wjnNNIwhnRxD8b/zOrSxdQ5YCCGRBL7A1H+3kgsrvArw3
 KArAdkPsVDmrJb+WNsH9dbqjQRXblfgRT2+ecq7EvKeoKcO9fJcOMA7qL5WtD1GWpIwq+u3Z/rnqH
 FcdCt7HA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uZBjg-00000000T5P-3032;
 Tue, 08 Jul 2025 17:04:04 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue,  8 Jul 2025 18:03:19 +0100
Message-ID: <20250708170359.111653-23-willy@infradead.org>
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
 --- fs/f2fs/inode.c | 2 +- fs/f2fs/node.c | 4 ++-- fs/f2fs/node.h | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-) 
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
X-Headers-End: 1uZBjs-0006F1-5Y
Subject: [f2fs-dev] [PATCH 22/60] f2fs: Pass a folio to set_cold_node()
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
 fs/f2fs/inode.c | 2 +-
 fs/f2fs/node.c  | 4 ++--
 fs/f2fs/node.h  | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 61fd96f0a1ff..9b71e3e4f635 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -484,7 +484,7 @@ static int do_read_inode(struct inode *inode)
 	/* try to recover cold bit for non-dir inode */
 	if (!S_ISDIR(inode->i_mode) && !is_cold_node(&node_folio->page)) {
 		f2fs_folio_wait_writeback(node_folio, NODE, true, true);
-		set_cold_node(&node_folio->page, false);
+		set_cold_node(node_folio, false);
 		folio_mark_dirty(node_folio);
 	}
 
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index c733cf6daa2f..15a024581014 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1381,7 +1381,7 @@ struct folio *f2fs_new_node_folio(struct dnode_of_data *dn, unsigned int ofs)
 
 	f2fs_folio_wait_writeback(folio, NODE, true, true);
 	fill_node_footer(&folio->page, dn->nid, dn->inode->i_ino, ofs, true);
-	set_cold_node(&folio->page, S_ISDIR(dn->inode->i_mode));
+	set_cold_node(folio, S_ISDIR(dn->inode->i_mode));
 	if (!folio_test_uptodate(folio))
 		folio_mark_uptodate(folio);
 	if (folio_mark_dirty(folio))
@@ -2828,7 +2828,7 @@ int f2fs_recover_inode_page(struct f2fs_sb_info *sbi, struct folio *folio)
 	if (!folio_test_uptodate(ifolio))
 		folio_mark_uptodate(ifolio);
 	fill_node_footer(&ifolio->page, ino, ino, 0, true);
-	set_cold_node(&ifolio->page, false);
+	set_cold_node(ifolio, false);
 
 	src = F2FS_INODE(folio);
 	dst = F2FS_INODE(ifolio);
diff --git a/fs/f2fs/node.h b/fs/f2fs/node.h
index bf6d6fab0c78..d1c15fc0ddd8 100644
--- a/fs/f2fs/node.h
+++ b/fs/f2fs/node.h
@@ -406,9 +406,9 @@ static inline int is_node(const struct page *page, int type)
 #define is_fsync_dnode(page)	is_node(page, FSYNC_BIT_SHIFT)
 #define is_dent_dnode(page)	is_node(page, DENT_BIT_SHIFT)
 
-static inline void set_cold_node(struct page *page, bool is_dir)
+static inline void set_cold_node(const struct folio *folio, bool is_dir)
 {
-	struct f2fs_node *rn = F2FS_NODE(page);
+	struct f2fs_node *rn = F2FS_NODE(&folio->page);
 	unsigned int flag = le32_to_cpu(rn->footer.flag);
 
 	if (is_dir)
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
