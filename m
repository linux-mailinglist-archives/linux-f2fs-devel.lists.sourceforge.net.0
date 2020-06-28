Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4706620C57C
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 28 Jun 2020 04:58:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jpNWn-0007zO-Qy; Sun, 28 Jun 2020 02:58:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jpNWm-0007zF-RT
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 28 Jun 2020 02:58:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LJ75Y8YHd6tS45piorhyniOGebPz9H8wwX3YB3P6DzQ=; b=TO66FF0zTS6/urLcLbAu9hEomz
 sSUcwvWUxNnD+rg05JpgvgP8pFJMNd6pL2MtmIHsHIQddNHxHa+YCmBpCqpxQKxWa/2npmuMp/Itq
 AzfZvFczPWstDe3kRZpGb2wYtrl/GBA90dJ5KLT+oN3pJ3Nswj8aoz/jo/kl+QeOqzl0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=LJ75Y8YHd6tS45piorhyniOGebPz9H8wwX3YB3P6DzQ=; b=m
 K2V5SfEJp4CImE7jTiYiuyGuIBtYhBP5NsAr9qQk/ty6V0ceRVXg1H/oDonKKweIFM35/ICcrt3XO
 djuAJqtVWLlRMq9TFeDqms6VIimrpMUow5bYsEcA7c3I3C7+qslaeKtKsiTi6ZY23xx1uxW+EvSBx
 1YO4Ku8sa2pLrBg0=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jpNWl-0038jH-B2
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 28 Jun 2020 02:58:44 +0000
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id C0C51489BF0EB5B79EAD;
 Sun, 28 Jun 2020 10:58:34 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.487.0; Sun, 28 Jun 2020 10:58:27 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Sun, 28 Jun 2020 10:58:17 +0800
Message-ID: <20200628025817.90623-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.35 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jpNWl-0038jH-B2
Subject: [f2fs-dev] [PATCH v2 1/5] f2fs: fix to wait page writeback before
 update
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

Filesystem including f2fs should support stable page for special
device like software raid, however there is one missing path that
page could be updated while it is writeback state as below, fix
this.

- gc_node_segment
 - f2fs_move_node_page
  - __write_node_page
   - set_page_writeback

- do_read_inode
 - f2fs_init_extent_tree
  - __f2fs_init_extent_tree
    i_ext->len = 0;

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
v2:
- add call path into message.
- remove unrelated changes.
 fs/f2fs/extent_cache.c | 18 +++++++++---------
 fs/f2fs/f2fs.h         |  2 +-
 fs/f2fs/inode.c        |  3 +--
 3 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
index e60078460ad1..686c68b98610 100644
--- a/fs/f2fs/extent_cache.c
+++ b/fs/f2fs/extent_cache.c
@@ -325,9 +325,10 @@ static void __drop_largest_extent(struct extent_tree *et,
 }
 
 /* return true, if inode page is changed */
-static bool __f2fs_init_extent_tree(struct inode *inode, struct f2fs_extent *i_ext)
+static void __f2fs_init_extent_tree(struct inode *inode, struct page *ipage)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	struct f2fs_extent *i_ext = ipage ? &F2FS_INODE(ipage)->i_ext : NULL;
 	struct extent_tree *et;
 	struct extent_node *en;
 	struct extent_info ei;
@@ -335,16 +336,18 @@ static bool __f2fs_init_extent_tree(struct inode *inode, struct f2fs_extent *i_e
 	if (!f2fs_may_extent_tree(inode)) {
 		/* drop largest extent */
 		if (i_ext && i_ext->len) {
+			f2fs_wait_on_page_writeback(ipage, NODE, true, true);
 			i_ext->len = 0;
-			return true;
+			set_page_dirty(ipage);
+			return;
 		}
-		return false;
+		return;
 	}
 
 	et = __grab_extent_tree(inode);
 
 	if (!i_ext || !i_ext->len)
-		return false;
+		return;
 
 	get_extent_info(&ei, i_ext);
 
@@ -360,17 +363,14 @@ static bool __f2fs_init_extent_tree(struct inode *inode, struct f2fs_extent *i_e
 	}
 out:
 	write_unlock(&et->lock);
-	return false;
 }
 
-bool f2fs_init_extent_tree(struct inode *inode, struct f2fs_extent *i_ext)
+void f2fs_init_extent_tree(struct inode *inode, struct page *ipage)
 {
-	bool ret =  __f2fs_init_extent_tree(inode, i_ext);
+	__f2fs_init_extent_tree(inode, ipage);
 
 	if (!F2FS_I(inode)->extent_tree)
 		set_inode_flag(inode, FI_NO_EXTENT);
-
-	return ret;
 }
 
 static bool f2fs_lookup_extent_tree(struct inode *inode, pgoff_t pgofs,
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index cba9c0129f09..54cde692d88d 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3821,7 +3821,7 @@ struct rb_entry *f2fs_lookup_rb_tree_ret(struct rb_root_cached *root,
 bool f2fs_check_rb_tree_consistence(struct f2fs_sb_info *sbi,
 						struct rb_root_cached *root);
 unsigned int f2fs_shrink_extent_tree(struct f2fs_sb_info *sbi, int nr_shrink);
-bool f2fs_init_extent_tree(struct inode *inode, struct f2fs_extent *i_ext);
+void f2fs_init_extent_tree(struct inode *inode, struct page *ipage);
 void f2fs_drop_extent_tree(struct inode *inode);
 unsigned int f2fs_destroy_extent_node(struct inode *inode);
 void f2fs_destroy_extent_tree(struct inode *inode);
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 33affa788588..66969ae852b9 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -367,8 +367,7 @@ static int do_read_inode(struct inode *inode)
 	fi->i_pino = le32_to_cpu(ri->i_pino);
 	fi->i_dir_level = ri->i_dir_level;
 
-	if (f2fs_init_extent_tree(inode, &ri->i_ext))
-		set_page_dirty(node_page);
+	f2fs_init_extent_tree(inode, node_page);
 
 	get_inline_info(inode, ri);
 
-- 
2.26.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
