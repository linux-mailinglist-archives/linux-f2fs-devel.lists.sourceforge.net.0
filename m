Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 272627576BD
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Jul 2023 10:38:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qLgDj-00014Z-Os;
	Tue, 18 Jul 2023 08:38:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chaoliu719@gmail.com>) id 1qLgDh-00014L-To
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Jul 2023 08:38:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=30h3KzD2w48K2b2PswKmzqqYtrtvBjqTQadg4ahh90s=; b=Eyud+mzAW/zl1d810gAO/R/8LI
 hZLxOY4yQEG0xNWRZznSr2229r7YN30lXNlgP7JilIvQ0xg4ZiDb+Dc+EAnhFRxu/Ky4QPHCZ3Pt3
 Gr1sQ+OJMniapn6R42QcfGonjFm+4WtMo3NFBmx38BjRVSXe7gj/2PhrnuhehTivepKU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=30h3KzD2w48K2b2PswKmzqqYtrtvBjqTQadg4ahh90s=; b=T
 93PqTTkYDVspiInYkuwBp+nbTwrzW4g/iI5a3IBCZDJDURrqd+DIpJAIlZkJu/wM7I+SgakhAWn1P
 M00erpDbRzOi2q2YyafFjLUsEp5Oj3WaPJHd5rj30Az0tTCzJJJ8M0sYvsMVCyw6elnQaTJgUWcrw
 Np+q4w2WmaybBinU=;
Received: from mail-pl1-f172.google.com ([209.85.214.172])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qLgDd-00047v-GR for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Jul 2023 08:38:07 +0000
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-1b9cd6a0051so33396685ad.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 18 Jul 2023 01:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689669478; x=1692261478;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=30h3KzD2w48K2b2PswKmzqqYtrtvBjqTQadg4ahh90s=;
 b=bOJ6K71cCVm6DplYNQv9p3wn+qKHMIc4I+ZLZ7zGmYk6ebDDJ5zRgl1AyGPcHSnQwl
 3tP3Tvi/ziPemczNb/TLxLEMLmnROD5nXxxX3URdZ4TVrPEhTBBND2CJAIj4GrZk2tSX
 7TUJNPe4L4+a7ZOtlWsxyAQPAQ+L4s0EPCQPyJTnkw0aVVP/Mu1DjHvcT12LUGjZpVRa
 Cn+JC3xtwaNo7LlBJlqiQs33ciaFevALpHby8Fesj5TrTC7bye8JAbocSFp9SxqU3FUY
 RlK+tEIlniFq2+SVEyPPMw0wtlsmcG8SU2qt7giEl+DV17lPAE46mUuRvqitP35lUMtP
 /WWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689669478; x=1692261478;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=30h3KzD2w48K2b2PswKmzqqYtrtvBjqTQadg4ahh90s=;
 b=HHDQSTluJ5L6T5umWorjl8MJDdd2steb91EwJDcEj7AFysXihMV+6ML3U7tXslClYK
 YQps+yCDjXAETpBrX6D563qJnEtNz532ZpHR+03pUfJTKw+W/jsODUPqDTodHGxgXHJy
 7Kjwyl8hqsjrZdoiO+cIQKZz3rRPKP78cm7bpgnLpr6+kgnE++HmMCCNk/tgMckxAu/u
 HyTFtWfvXwROPQbMQe6v1/3JUiDwyxZj5Rh67BXhp5jKOwH5YJ+OzqqQTGSoHkdSuWOj
 F+fx6xHvuuCLWdsCXK/7JCU4dvu9W5GDgf8E/jb4cb4ui8siKWBHnkJ2cvPPVC+fcGOR
 uLTw==
X-Gm-Message-State: ABy/qLY4TIBhdDyNVwR3Ll7HuhP6s6s0L5fY+IeFG9S+hABwgWN2Zdn7
 D/ZJ4ocbXcCoqZvzYOiXs9DKMIoVVfF5gfQn
X-Google-Smtp-Source: APBJJlGVlccV5qjxxEhrAFezTsAhu/iOZCzOLJ5EZgBoIcb9uGek8/yf/wFF/6I5w4DqPUy4ClKAVw==
X-Received: by 2002:a17:903:32c6:b0:1bb:3a7:6af7 with SMTP id
 i6-20020a17090332c600b001bb03a76af7mr2031650plr.23.1689669477654; 
 Tue, 18 Jul 2023 01:37:57 -0700 (PDT)
Received: from localhost.localdomain ([156.236.96.165])
 by smtp.gmail.com with ESMTPSA id
 a1-20020a170902900100b001b8c689060dsm1262817plp.28.2023.07.18.01.37.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jul 2023 01:37:57 -0700 (PDT)
From: Chao Liu <chaoliu719@gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue, 18 Jul 2023 16:33:10 +0800
Message-Id: <20230718083310.367067-1-chaoliu719@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Chao Liu This patch is a cleanup: 1. Merge
 __drop_largest_extent()
 since it has only one caller. 2. Introduce __notify_largest_extent_updated()
 and __drop_largest_extent() to help manage largest and largest_up [...] 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.172 listed in list.dnswl.org]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [chaoliu719[at]gmail.com]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [chaoliu719[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.214.172 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qLgDd-00047v-GR
Subject: [f2fs-dev] [PATCH] f2fs: introduce two helper functions for the
 largest cached extent
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
Cc: Chao Liu <liuchao@coolpad.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Chao Liu <liuchao@coolpad.com>

This patch is a cleanup:
1. Merge __drop_largest_extent() since it has only one caller.
2. Introduce __notify_largest_extent_updated() and
   __drop_largest_extent() to help manage largest and largest_update
   in extent_tree.

Signed-off-by: Chao Liu <liuchao@coolpad.com>
---
 fs/f2fs/extent_cache.c | 60 +++++++++++++++++++-----------------------
 fs/f2fs/f2fs.h         |  4 +--
 2 files changed, 29 insertions(+), 35 deletions(-)

diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
index 0e2d49140c07f..45dfddd8c3ad0 100644
--- a/fs/f2fs/extent_cache.c
+++ b/fs/f2fs/extent_cache.c
@@ -19,6 +19,12 @@
 #include "node.h"
 #include <trace/events/f2fs.h>
 
+static void __drop_largest_extent(struct extent_tree *et)
+{
+	et->largest.len = 0;
+	et->largest_updated = true;
+}
+
 bool sanity_check_extent_cache(struct inode *inode)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
@@ -35,8 +41,7 @@ bool sanity_check_extent_cache(struct inode *inode)
 
 	/* Let's drop, if checkpoint got corrupted. */
 	if (is_set_ckpt_flags(sbi, CP_ERROR_FLAG)) {
-		ei->len = 0;
-		et->largest_updated = true;
+		__drop_largest_extent(et);
 		return true;
 	}
 
@@ -310,6 +315,8 @@ static void __detach_extent_node(struct f2fs_sb_info *sbi,
 
 	if (et->cached_en == en)
 		et->cached_en = NULL;
+
+	/* keep the largest as we can still use it */
 	kmem_cache_free(extent_node_slab, en);
 }
 
@@ -385,15 +392,6 @@ static unsigned int __free_extent_tree(struct f2fs_sb_info *sbi,
 	return count - atomic_read(&et->node_cnt);
 }
 
-static void __drop_largest_extent(struct extent_tree *et,
-					pgoff_t fofs, unsigned int len)
-{
-	if (fofs < et->largest.fofs + et->largest.len &&
-			fofs + len > et->largest.fofs) {
-		et->largest.len = 0;
-		et->largest_updated = true;
-	}
-}
 
 void f2fs_init_read_extent_tree(struct inode *inode, struct page *ipage)
 {
@@ -601,6 +599,15 @@ static struct extent_node *__insert_extent_tree(struct f2fs_sb_info *sbi,
 	return en;
 }
 
+static void __notify_largest_extent_updated(struct extent_tree *et,
+					struct inode *inode)
+{
+	if (et->type == EX_READ && et->largest_updated) {
+		f2fs_mark_inode_dirty_sync(inode, true);
+		et->largest_updated = false;
+	}
+}
+
 static void __update_extent_tree_range(struct inode *inode,
 			struct extent_info *tei, enum extent_type type)
 {
@@ -612,7 +619,6 @@ static void __update_extent_tree_range(struct inode *inode,
 	struct rb_node **insert_p = NULL, *insert_parent = NULL;
 	unsigned int fofs = tei->fofs, len = tei->len;
 	unsigned int end = fofs + len;
-	bool updated = false;
 	bool leftmost = false;
 
 	if (!et)
@@ -636,11 +642,10 @@ static void __update_extent_tree_range(struct inode *inode,
 		prev = et->largest;
 		dei.len = 0;
 
-		/*
-		 * drop largest extent before lookup, in case it's already
-		 * been shrunk from extent tree
-		 */
-		__drop_largest_extent(et, fofs, len);
+		/* updates may cause largest extent cache to become invalid */
+		if (fofs < et->largest.fofs + et->largest.len &&
+		    fofs + len > et->largest.fofs)
+			__drop_largest_extent(et);
 	}
 
 	/* 1. lookup first extent node in range [fofs, fofs + len - 1] */
@@ -733,8 +738,7 @@ static void __update_extent_tree_range(struct inode *inode,
 		if (dei.len >= 1 &&
 				prev.len < F2FS_MIN_EXTENT_LEN &&
 				et->largest.len < F2FS_MIN_EXTENT_LEN) {
-			et->largest.len = 0;
-			et->largest_updated = true;
+			__drop_largest_extent(et);
 			set_inode_flag(inode, FI_NO_EXTENT);
 		}
 	}
@@ -742,10 +746,6 @@ static void __update_extent_tree_range(struct inode *inode,
 	if (is_inode_flag_set(inode, FI_NO_EXTENT))
 		__free_extent_tree(sbi, et);
 
-	if (et->largest_updated) {
-		et->largest_updated = false;
-		updated = true;
-	}
 	goto out_read_extent_cache;
 update_age_extent_cache:
 	if (!tei->last_blocks)
@@ -758,9 +758,7 @@ static void __update_extent_tree_range(struct inode *inode,
 					insert_p, insert_parent, leftmost);
 out_read_extent_cache:
 	write_unlock(&et->lock);
-
-	if (updated)
-		f2fs_mark_inode_dirty_sync(inode, true);
+	__notify_largest_extent_updated(et, inode);
 }
 
 #ifdef CONFIG_F2FS_FS_COMPRESSION
@@ -1092,7 +1090,6 @@ static void __drop_extent_tree(struct inode *inode, enum extent_type type)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct extent_tree *et = F2FS_I(inode)->extent_tree[type];
-	bool updated = false;
 
 	if (!__may_extent_tree(inode, type))
 		return;
@@ -1101,14 +1098,11 @@ static void __drop_extent_tree(struct inode *inode, enum extent_type type)
 	__free_extent_tree(sbi, et);
 	if (type == EX_READ) {
 		set_inode_flag(inode, FI_NO_EXTENT);
-		if (et->largest.len) {
-			et->largest.len = 0;
-			updated = true;
-		}
+		if (et->largest.len)
+			__drop_largest_extent(et);
 	}
 	write_unlock(&et->lock);
-	if (updated)
-		f2fs_mark_inode_dirty_sync(inode, true);
+	__notify_largest_extent_updated(et, inode);
 }
 
 void f2fs_drop_extent_tree(struct inode *inode)
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index d372bedb0fe4e..da02e120e5ea6 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -665,7 +665,7 @@ struct extent_tree {
 
 struct extent_tree_info {
 	struct radix_tree_root extent_tree_root;/* cache extent cache entries */
-	struct mutex extent_tree_lock;	/* locking extent radix tree */
+	struct mutex extent_tree_lock;		/* locking extent radix tree */
 	struct list_head extent_list;		/* lru list for shrinker */
 	spinlock_t extent_lock;			/* locking extent lru list */
 	atomic_t total_ext_tree;		/* extent tree count */
@@ -766,7 +766,7 @@ enum {
 	FI_ACL_MODE,		/* indicate acl mode */
 	FI_NO_ALLOC,		/* should not allocate any blocks */
 	FI_FREE_NID,		/* free allocated nide */
-	FI_NO_EXTENT,		/* not to use the extent cache */
+	FI_NO_EXTENT,		/* not to use the read extent cache */
 	FI_INLINE_XATTR,	/* used for inline xattr */
 	FI_INLINE_DATA,		/* used for inline data*/
 	FI_INLINE_DENTRY,	/* used for inline dentry */
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
