Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 90008216B5D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  7 Jul 2020 13:22:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jslfo-0005aT-6k; Tue, 07 Jul 2020 11:22:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jslfm-0005aB-Fn
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 07 Jul 2020 11:22:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uJCfycduqa9vTYAKP8rPtQCLdirXlsx85Gtuopnq07w=; b=eNjsNQLvPVP53RRUv50Ahyy0+D
 2E1nZZQVXs6V+YuS48/ve957xUbTpw5obLtJYPTbYdFPP68mueEHtb1fcSdupq4iNJ3w6gJlUd1nB
 bKKzqu42qr7IzJGPT7AHS+zShILRBFniAbtrJBs+tMYbk+11pERPzSVKKYBy5h27mskk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uJCfycduqa9vTYAKP8rPtQCLdirXlsx85Gtuopnq07w=; b=lsFMOnQoOf6K6EgKdGwMa1Wd/K
 FsKuWvL3WXnzyeJi2Bk+g8C59WgM7i5sUojUPBpEDAtuctght4hn5oHie4wRwCLvxhHmnjpFcj1df
 +lCr3TbcWhquQF1whe2jUpdkl25OI4uOJ04a1/7zHtVinLTyl2nhaFCr2vc9dB9hCNns=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jslfj-00A8Bk-UR
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 07 Jul 2020 11:22:02 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 3843FBA025BB331CADEA;
 Tue,  7 Jul 2020 19:21:53 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.487.0; Tue, 7 Jul 2020 19:21:45 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Tue, 7 Jul 2020 19:21:27 +0800
Message-ID: <20200707112128.89136-5-yuchao0@huawei.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200707112128.89136-1-yuchao0@huawei.com>
References: <20200707112128.89136-1-yuchao0@huawei.com>
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
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jslfj-00A8Bk-UR
Subject: [f2fs-dev] [PATCH 4/5] f2fs: support 64-bits key in f2fs rb-tree
 node entry
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

then, we can add specified entry into rb-tree with 64-bits segment time
as key.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/extent_cache.c | 37 +++++++++++++++++++++++++++++++++++--
 fs/f2fs/f2fs.h         | 15 ++++++++++++---
 fs/f2fs/segment.c      |  4 ++--
 3 files changed, 49 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
index 686c68b98610..3ebf976a682d 100644
--- a/fs/f2fs/extent_cache.c
+++ b/fs/f2fs/extent_cache.c
@@ -58,6 +58,29 @@ struct rb_entry *f2fs_lookup_rb_tree(struct rb_root_cached *root,
 	return re;
 }
 
+struct rb_node **f2fs_lookup_rb_tree_ext(struct f2fs_sb_info *sbi,
+					struct rb_root_cached *root,
+					struct rb_node **parent,
+					unsigned long long key, bool *leftmost)
+{
+	struct rb_node **p = &root->rb_root.rb_node;
+	struct rb_entry *re;
+
+	while (*p) {
+		*parent = *p;
+		re = rb_entry(*parent, struct rb_entry, rb_node);
+
+		if (key < re->key) {
+			p = &(*p)->rb_left;
+		} else {
+			p = &(*p)->rb_right;
+			*leftmost = false;
+		}
+	}
+
+	return p;
+}
+
 struct rb_node **f2fs_lookup_rb_tree_for_insert(struct f2fs_sb_info *sbi,
 				struct rb_root_cached *root,
 				struct rb_node **parent,
@@ -166,7 +189,7 @@ struct rb_entry *f2fs_lookup_rb_tree_ret(struct rb_root_cached *root,
 }
 
 bool f2fs_check_rb_tree_consistence(struct f2fs_sb_info *sbi,
-						struct rb_root_cached *root)
+				struct rb_root_cached *root, bool check_key)
 {
 #ifdef CONFIG_F2FS_CHECK_FS
 	struct rb_node *cur = rb_first_cached(root), *next;
@@ -183,13 +206,23 @@ bool f2fs_check_rb_tree_consistence(struct f2fs_sb_info *sbi,
 		cur_re = rb_entry(cur, struct rb_entry, rb_node);
 		next_re = rb_entry(next, struct rb_entry, rb_node);
 
+		if (check_key) {
+			if (cur_re->key > next_re->key) {
+				f2fs_info(sbi, "inconsistent rbtree, "
+					"cur(%llu) next(%llu)",
+					cur_re->key, next_re->key);
+				return false;
+			}
+			goto next;
+		}
+
 		if (cur_re->ofs + cur_re->len > next_re->ofs) {
 			f2fs_info(sbi, "inconsistent rbtree, cur(%u, %u) next(%u, %u)",
 				  cur_re->ofs, cur_re->len,
 				  next_re->ofs, next_re->len);
 			return false;
 		}
-
+next:
 		cur = next;
 	}
 #endif
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index dcf99f1bdfe1..3430964f0f6a 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -635,8 +635,13 @@ enum {
 
 struct rb_entry {
 	struct rb_node rb_node;		/* rb node located in rb-tree */
-	unsigned int ofs;		/* start offset of the entry */
-	unsigned int len;		/* length of the entry */
+	union {
+		struct {
+			unsigned int ofs;	/* start offset of the entry */
+			unsigned int len;	/* length of the entry */
+		};
+		unsigned long long key;		/* 64-bits key */
+	};
 };
 
 struct extent_info {
@@ -3828,6 +3833,10 @@ void f2fs_leave_shrinker(struct f2fs_sb_info *sbi);
  */
 struct rb_entry *f2fs_lookup_rb_tree(struct rb_root_cached *root,
 				struct rb_entry *cached_re, unsigned int ofs);
+struct rb_node **f2fs_lookup_rb_tree_ext(struct f2fs_sb_info *sbi,
+				struct rb_root_cached *root,
+				struct rb_node **parent,
+				unsigned long long key, bool *left_most);
 struct rb_node **f2fs_lookup_rb_tree_for_insert(struct f2fs_sb_info *sbi,
 				struct rb_root_cached *root,
 				struct rb_node **parent,
@@ -3838,7 +3847,7 @@ struct rb_entry *f2fs_lookup_rb_tree_ret(struct rb_root_cached *root,
 		struct rb_node ***insert_p, struct rb_node **insert_parent,
 		bool force, bool *leftmost);
 bool f2fs_check_rb_tree_consistence(struct f2fs_sb_info *sbi,
-						struct rb_root_cached *root);
+				struct rb_root_cached *root, bool check_key);
 unsigned int f2fs_shrink_extent_tree(struct f2fs_sb_info *sbi, int nr_shrink);
 void f2fs_init_extent_tree(struct inode *inode, struct page *ipage);
 void f2fs_drop_extent_tree(struct inode *inode);
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 222d28c44e4f..b66ac28d9aa5 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1521,7 +1521,7 @@ static int __issue_discard_cmd(struct f2fs_sb_info *sbi,
 			goto next;
 		if (unlikely(dcc->rbtree_check))
 			f2fs_bug_on(sbi, !f2fs_check_rb_tree_consistence(sbi,
-								&dcc->root));
+							&dcc->root, false));
 		blk_start_plug(&plug);
 		list_for_each_entry_safe(dc, tmp, pend_list, list) {
 			f2fs_bug_on(sbi, dc->state != D_PREP);
@@ -2887,7 +2887,7 @@ static unsigned int __issue_discard_cmd_range(struct f2fs_sb_info *sbi,
 	mutex_lock(&dcc->cmd_lock);
 	if (unlikely(dcc->rbtree_check))
 		f2fs_bug_on(sbi, !f2fs_check_rb_tree_consistence(sbi,
-								&dcc->root));
+							&dcc->root, false));
 
 	dc = (struct discard_cmd *)f2fs_lookup_rb_tree_ret(&dcc->root,
 					NULL, start,
-- 
2.26.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
