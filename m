Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 469736DC535
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 Apr 2023 11:39:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1plnzm-0001wN-VD;
	Mon, 10 Apr 2023 09:39:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1plnzi-0001wG-PK
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Apr 2023 09:39:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ll6Ml2xivpo4dKJM18/9OF/Dc9jSVBrYm7MF8eSTx9c=; b=TsAu/4kIRyQX4lnBuV9xnncJIw
 ZomtxpJpawqzXlhNdYgi/Hc7sVlBVE4ImoLXMVPwr3eebF5Gw9WlK8wjVEsl9KXakE9hH79k+rH+h
 jwTQ2XmS4TKIU8QWPdID+yD5fSZxK+nPZyyHsYSWwCs5jRjUTm3QjHdIrmD+TsY1RLao=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ll6Ml2xivpo4dKJM18/9OF/Dc9jSVBrYm7MF8eSTx9c=; b=A
 H131hIwK8aYDZn1yzfeQ/nV/LIE4PMz2jRff3+nu9cYApvgniAhekIH/LbOrE8hfk1ZX+Xg4Ww8m3
 9KEf7gq1ZzW1vNDHpSK0MpLCjGgYBs4LMf9+jiK+QxzyiydSq8JrbwYtWV0DjOhpir+LuipC2Viw9
 TXY9sqAfA8AzCiLw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1plnzf-0005K9-Gr for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Apr 2023 09:39:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 280D161A2A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 10 Apr 2023 09:39:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEE72C43443;
 Mon, 10 Apr 2023 09:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681119558;
 bh=hQfvtLSuuwTvz2MLeajEI4NVGlDu7NNc7omUTcL4vyk=;
 h=From:To:Cc:Subject:Date:From;
 b=htSUCPpZOVsAJvoQg2qVAmzMdJCiKS4lo+6ZwcvoOlqUbWTB3wqpm/y06AIPYV2ji
 3IgmKGtIStSoVph9kxLG19iJEhHEC9ZMoBgEAVRqaSDxN3vnn0UDam4DgfgR0mBzDZ
 okDsUILdt9SwNpZT5ruVuVZ1Btoxc5F0iV2xDC+2FJQdfe5Iid3Eh0Koj4nPDXhxk6
 YBx67YCO3UFIh8rWwG0PYXxArMQNtFzkhfMYgjsQw7DfpsUTOcUiFu19YTcPP6eeC8
 bYT9UeFc9r4bVkyUJ5WrFPHxAUl2diDZSf8oRFxtPuM79Xb4gLLurRGsp11N+wEMqR
 z0Il+vRNOftMg==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Mon, 10 Apr 2023 17:39:12 +0800
Message-Id: <20230410093912.2184557-1-chao@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  There may be subtle race condition,
 make PagePrivate and page_private
 being inconsistent, result in decreasing page count incorrectly, introduce
 a per-inode spinlock to avoid such condition. Signed-off-by: Chao Yu
 <chao@kernel.org>
 --- fs/f2fs/f2fs.h | 19 ++++++++++++++++++- fs/f2fs/super.c | 2 ++ 2 files
 changed, 20 insertions(+), 1 deletion(-) 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1plnzf-0005K9-Gr
Subject: [f2fs-dev] [PATCH RFC] f2fs: fix to use spinlock to avoid
 page.private update race
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

There may be subtle race condition, make PagePrivate and page_private
being inconsistent, result in decreasing page count incorrectly,
introduce a per-inode spinlock to avoid such condition.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/f2fs.h  | 19 ++++++++++++++++++-
 fs/f2fs/super.c |  2 ++
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index c378aedcadea..6b31bef5853e 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -856,6 +856,8 @@ struct f2fs_inode_info {
 
 	unsigned int atomic_write_cnt;
 	loff_t original_i_size;		/* original i_size before atomic write */
+
+	spinlock_t private_lock;	/* protect page->private */
 };
 
 static inline void get_read_extent_info(struct extent_info *ext,
@@ -1413,21 +1415,28 @@ static inline bool page_private_##name(struct page *page) \
 		test_bit(PAGE_PRIVATE_##flagname, &page_private(page)); \
 }
 
+static inline struct f2fs_inode_info *F2FS_I(struct inode *inode);
 #define PAGE_PRIVATE_SET_FUNC(name, flagname) \
 static inline void set_page_private_##name(struct page *page) \
 { \
+	unsigned long flags; \
+	spin_lock_irqsave(&F2FS_I(page->mapping->host)->private_lock, flags); \
 	if (!PagePrivate(page)) \
 		attach_page_private(page, (void *)page->private); \
 	set_bit(PAGE_PRIVATE_NOT_POINTER, &page_private(page)); \
 	set_bit(PAGE_PRIVATE_##flagname, &page_private(page)); \
+	spin_unlock_irqrestore(&F2FS_I(page->mapping->host)->private_lock, flags); \
 }
 
 #define PAGE_PRIVATE_CLEAR_FUNC(name, flagname) \
 static inline void clear_page_private_##name(struct page *page) \
 { \
+	unsigned long flags; \
+	spin_lock_irqsave(&F2FS_I(page->mapping->host)->private_lock, flags); \
 	clear_bit(PAGE_PRIVATE_##flagname, &page_private(page)); \
-	if (page_private(page) == BIT(PAGE_PRIVATE_NOT_POINTER)) \
+	if (page_private(page) == (BIT(PAGE_PRIVATE_NOT_POINTER))) \
 		detach_page_private(page); \
+	spin_unlock_irqrestore(&F2FS_I(page->mapping->host)->private_lock, flags); \
 }
 
 PAGE_PRIVATE_GET_FUNC(nonpointer, NOT_POINTER);
@@ -1456,17 +1465,25 @@ static inline unsigned long get_page_private_data(struct page *page)
 
 static inline void set_page_private_data(struct page *page, unsigned long data)
 {
+	unsigned long flags;
+
+	spin_lock_irqsave(&F2FS_I(page->mapping->host)->private_lock, flags);
 	if (!PagePrivate(page))
 		attach_page_private(page, 0);
 	set_bit(PAGE_PRIVATE_NOT_POINTER, &page_private(page));
 	page_private(page) |= data << PAGE_PRIVATE_MAX;
+	spin_unlock_irqrestore(&F2FS_I(page->mapping->host)->private_lock, flags);
 }
 
 static inline void clear_page_private_data(struct page *page)
 {
+	unsigned long flags;
+
+	spin_lock_irqsave(&F2FS_I(page->mapping->host)->private_lock, flags);
 	page_private(page) &= GENMASK(PAGE_PRIVATE_MAX - 1, 0);
 	if (page_private(page) == BIT(PAGE_PRIVATE_NOT_POINTER))
 		detach_page_private(page);
+	spin_unlock_irqrestore(&F2FS_I(page->mapping->host)->private_lock, flags);
 }
 
 /* For compression */
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index a1b570a5e50f..555424dd85fd 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1419,6 +1419,8 @@ static struct inode *f2fs_alloc_inode(struct super_block *sb)
 	init_f2fs_rwsem(&fi->i_gc_rwsem[WRITE]);
 	init_f2fs_rwsem(&fi->i_xattr_sem);
 
+	spin_lock_init(&fi->private_lock);
+
 	/* Will be used by directory only */
 	fi->i_dir_level = F2FS_SB(sb)->dir_level;
 
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
