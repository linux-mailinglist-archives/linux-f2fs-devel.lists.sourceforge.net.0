Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A474163A423
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Nov 2022 10:06:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oza5w-0000pk-E8;
	Mon, 28 Nov 2022 09:06:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qxy65535@gmail.com>) id 1oza5u-0000pb-Ia
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Nov 2022 09:06:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CsU4/OuRMovveciFxhVb5bu8yT4MmZjVpSlJ69GC4U4=; b=dfJ3tZHlYtp5WzUEqT4b9ce4qB
 SbrmTtZHPw56U5WO63KFMeupdaYHGeaGmVnU1zCcYPAguA6PdJqiEwoHZBOtozbPf6Yp8mBKt7tMx
 qKMPhm7A4cySlzOgc8tou6f20CMP6CkKdY9Dfrl+fhhmvNcMPe64NX8/VUbrUtYEWRPs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CsU4/OuRMovveciFxhVb5bu8yT4MmZjVpSlJ69GC4U4=; b=PSF6+dms7zK/IUTf8pkxmuo5+H
 0sgAG4445j+bba6MhGo6BcJglWMoTxm2zOAaTRMPt9juAVGq2sADI4DU9AAwQIkMaTDBULR3wsCW1
 8QC3GYOgr+ElV5LC5bbxYIEmz1iVHxvUPl03FVCbGCDXPn/i0fZvaCnVHZAd/LYMFMrs=;
Received: from mail-pg1-f180.google.com ([209.85.215.180])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oza5q-0004MM-9R for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Nov 2022 09:06:30 +0000
Received: by mail-pg1-f180.google.com with SMTP id 62so9331594pgb.13
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 28 Nov 2022 01:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CsU4/OuRMovveciFxhVb5bu8yT4MmZjVpSlJ69GC4U4=;
 b=BL3rp/rVs9Gg7Sd783cM4AUnvSJqIDeFCw2qPt/FzHEK+V3Ajwt8cRhn6oHvqSxPXV
 /SZ/iuh+c6j9kMDRuu8WIg40Y3nWCOOAHv1Qjex/G20oNLWZftDMAx77jiRTALgNqLQi
 zYAJLAImm+rdJqwDtR0yGNNcmPkecG8x0YBCHy9diGvmhJXO9/wEfaUh9uZx6RHNy0+2
 7erAFqBywOsrVGoPfG7xUm31m9eMQFCG9DX64HHp9UZT91zHhJkx8SHf8nl2tr7hnLMY
 rO4Tg+hMtyR0kKBiMpwnLasVrTBHfj8A+sNoZEbNzCxfbUMsAd1mb9XrAhI0ORQmoS9q
 MHgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CsU4/OuRMovveciFxhVb5bu8yT4MmZjVpSlJ69GC4U4=;
 b=BnRrkwVgiTphb822pp99I9PHVzX+FbuBI2/ij1a/O/wJkoLO9wJoBY3kQS7mT41jKT
 +kiSV2wOaOd8zOMeNsCOjoy5b8DLSEzcsVVEUwDIZ0weYLeZ7G0zEMm8uUTmx90dpwFD
 B9AS5/vhszFJJ00AGWoJn2E6Yj/64M/pCHC5XmsIYBG7Gu324AZ4SlY0B+MFmZS1IqP8
 SugH2xEwdPN8Mylw+9ziisAJLHWKe3LpA7ZkZt5Y98D7fo8vW0p2UtaSN6qI9SYRM7+K
 Dy6pMNAfOwItvaiN/lvDGk1eeB8b8/B/ZFdj0MDkvZVNkdxK/HEZBz9XGl/aF/OTR1kW
 JPAw==
X-Gm-Message-State: ANoB5pl1cZwv1yt6S19bKS5GzN46kMYnSG1ofedAYzaRm3UPvFoTDQwS
 lFnDiGnIz363iO6tcqL9iMggi1tQsDZgQg==
X-Google-Smtp-Source: AA0mqf4NGDXdQgLKSy+nkPLytToWN6zY3bspiCJp8/B6xgElUbQurBRgsWhq0z9NihoykfZIpNncJg==
X-Received: by 2002:a62:1a45:0:b0:575:253e:48d5 with SMTP id
 a66-20020a621a45000000b00575253e48d5mr4706628pfa.32.1669626380512; 
 Mon, 28 Nov 2022 01:06:20 -0800 (PST)
Received: from mi-HP-ProDesk-680-G4-MT.mioffice.cn ([43.224.245.252])
 by smtp.gmail.com with ESMTPSA id
 s17-20020a170902ea1100b001811a197797sm8269268plg.194.2022.11.28.01.06.18
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 28 Nov 2022 01:06:19 -0800 (PST)
From: qixiaoyu1 <qxy65535@gmail.com>
X-Google-Original-From: qixiaoyu1 <qixiaoyu1@xiaomi.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 28 Nov 2022 16:58:56 +0800
Message-Id: <20221128085859.5295-3-qixiaoyu1@xiaomi.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20221128085859.5295-1-qixiaoyu1@xiaomi.com>
References: <20221128085859.5295-1-qixiaoyu1@xiaomi.com>
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: xiongping1 Signed-off-by: xiongping1 Signed-off-by:
 qixiaoyu1 --- fs/f2fs/block_age.c | 590 +++++++++++++++++++++++++++++++++++-
 fs/f2fs/debug.c | 13 + fs/f2fs/f2fs.h | 64 +++- fs/f2fs/file.c | 10 + fs/f2fs/
 [...] Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.215.180 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [qxy65535[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [qxy65535[at]gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.180 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1oza5q-0004MM-9R
Subject: [f2fs-dev] [PATCH 2/5] f2fs: implement cache to manager block
 update frequency per inode
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
Cc: xiongping1 <xiongping1@xiaomi.com>, qixiaoyu1 <qixiaoyu1@xiaomi.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: xiongping1 <xiongping1@xiaomi.com>

Signed-off-by: xiongping1 <xiongping1@xiaomi.com>
Signed-off-by: qixiaoyu1 <qixiaoyu1@xiaomi.com>
---
 fs/f2fs/block_age.c         | 590 +++++++++++++++++++++++++++++++++++-
 fs/f2fs/debug.c             |  13 +
 fs/f2fs/f2fs.h              |  64 +++-
 fs/f2fs/file.c              |  10 +
 fs/f2fs/inode.c             |   8 +
 fs/f2fs/namei.c             |   4 +
 fs/f2fs/node.c              |   7 +-
 fs/f2fs/node.h              |   3 +
 fs/f2fs/segment.c           |   6 +
 fs/f2fs/shrinker.c          |   3 +
 fs/f2fs/super.c             |  22 +-
 include/trace/events/f2fs.h | 239 +++++++++++++++
 12 files changed, 965 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/block_age.c b/fs/f2fs/block_age.c
index 1e8711a03959..c8e8fbe51d8e 100644
--- a/fs/f2fs/block_age.c
+++ b/fs/f2fs/block_age.c
@@ -10,19 +10,607 @@
 
 #include "f2fs.h"
 #include "segment.h"
+#include <trace/events/f2fs.h>
+
+static struct kmem_cache *age_extent_tree_slab;
+static struct kmem_cache *age_extent_node_slab;
+
 
 static inline void f2fs_inc_data_block_alloc(struct f2fs_sb_info *sbi)
 {
 	atomic64_inc(&sbi->total_data_alloc);
 }
 
-void f2fs_init_block_age_info(struct f2fs_sb_info *sbi)
+static void f2fs_init_block_age_info(struct f2fs_sb_info *sbi)
 {
 	atomic64_set(&sbi->total_data_alloc, 0);
 }
 
+static inline bool f2fs_may_age_extent_tree(struct inode *inode)
+{
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+
+	/*
+	 * for recovered files during mount do not create extents
+	 * if shrinker is not registered.
+	 */
+	if (list_empty(&sbi->s_list))
+		return false;
+
+	/* don't cache block age info for cold file */
+	if (is_inode_flag_set(inode, FI_COMPRESSED_FILE) ||
+			file_is_cold(inode))
+		return false;
+
+	return S_ISREG(inode->i_mode)
+			|| S_ISDIR(inode->i_mode);
+}
+
+static void f2fs_init_age_cache_info(struct f2fs_sb_info *sbi)
+{
+	INIT_RADIX_TREE(&sbi->age_extent_tree_root, GFP_NOIO);
+	mutex_init(&sbi->age_extent_tree_lock);
+	INIT_LIST_HEAD(&sbi->age_extent_list);
+	spin_lock_init(&sbi->age_extent_lock);
+	atomic_set(&sbi->total_age_ext_tree, 0);
+	INIT_LIST_HEAD(&sbi->zombie_age_list);
+	atomic_set(&sbi->total_zombie_age_tree, 0);
+	atomic_set(&sbi->total_age_ext_node, 0);
+}
+
+#ifdef CONFIG_QUOTA
+static void f2fs_init_quota_age_extent_cache(struct f2fs_sb_info *sbi)
+{
+	struct quota_info *dqopt = sb_dqopt(sbi->sb);
+	struct inode *qinode;
+	int cnt;
+
+	for (cnt = 0; cnt < MAXQUOTAS; cnt++) {
+		if (!sb_has_quota_active(sbi->sb, cnt))
+			continue;
+
+		qinode = dqopt->files[cnt];
+		f2fs_init_age_extent_tree(qinode);
+	}
+}
+#endif
+
+static void __detach_age_extent_node(struct f2fs_sb_info *sbi,
+				struct age_extent_tree *et, struct age_extent_node *en)
+{
+	rb_erase_cached(&en->rb_node, &et->root);
+	atomic_dec(&et->node_cnt);
+	atomic_dec(&sbi->total_age_ext_node);
+
+	if (et->cached_en == en)
+		et->cached_en = NULL;
+
+	trace_f2fs_detach_age_extent_node(sbi, et, &en->ei);
+	kmem_cache_free(age_extent_node_slab, en);
+}
+
+/*
+ * Flow to release an age_extent_node:
+ * 1. list_del_init
+ * 2. __detach_age_extent_node
+ * 3. kmem_cache_free.
+ */
+static void __release_age_extent_node(struct f2fs_sb_info *sbi,
+			struct age_extent_tree *et, struct age_extent_node *en)
+{
+	spin_lock(&sbi->age_extent_lock);
+	f2fs_bug_on(sbi, list_empty(&en->list));
+	list_del_init(&en->list);
+	spin_unlock(&sbi->age_extent_lock);
+
+	__detach_age_extent_node(sbi, et, en);
+}
+
+static unsigned int __free_age_extent_tree(struct f2fs_sb_info *sbi,
+					struct age_extent_tree *et)
+{
+	struct rb_node *node, *next;
+	struct age_extent_node *en;
+	unsigned int count = atomic_read(&et->node_cnt);
+
+	node = rb_first_cached(&et->root);
+	while (node) {
+		next = rb_next(node);
+		en = rb_entry(node, struct age_extent_node, rb_node);
+		__release_age_extent_node(sbi, et, en);
+		node = next;
+	}
+
+	return count - atomic_read(&et->node_cnt);
+}
+
+unsigned int f2fs_drop_age_extent_node(struct inode *inode)
+{
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	struct age_extent_tree *et = F2FS_I(inode)->age_extent_tree;
+	unsigned int node_cnt = 0;
+
+	if (!et || !atomic_read(&et->node_cnt))
+		return 0;
+
+	write_lock(&et->lock);
+	node_cnt = __free_age_extent_tree(sbi, et);
+	write_unlock(&et->lock);
+
+	return node_cnt;
+}
+
+unsigned int f2fs_shrink_age_extent_tree(struct f2fs_sb_info *sbi, int nr_shrink)
+{
+	struct age_extent_tree *et, *next;
+	struct age_extent_node *en;
+	unsigned int node_cnt = 0, tree_cnt = 0;
+	int remained;
+
+	if (!atomic_read(&sbi->total_zombie_age_tree))
+		goto free_node;
+
+	if (!mutex_trylock(&sbi->age_extent_tree_lock))
+		goto out;
+
+	/* 1. remove unreferenced extent tree */
+	list_for_each_entry_safe(et, next, &sbi->zombie_age_list, list) {
+		if (atomic_read(&et->node_cnt)) {
+			write_lock(&et->lock);
+			node_cnt += __free_age_extent_tree(sbi, et);
+			write_unlock(&et->lock);
+		}
+		f2fs_bug_on(sbi, atomic_read(&et->node_cnt));
+		list_del_init(&et->list);
+		radix_tree_delete(&sbi->age_extent_tree_root, et->ino);
+		kmem_cache_free(age_extent_tree_slab, et);
+		atomic_dec(&sbi->total_age_ext_tree);
+		atomic_dec(&sbi->total_zombie_age_tree);
+		tree_cnt++;
+
+		if (node_cnt + tree_cnt >= nr_shrink)
+			goto unlock_out;
+		cond_resched();
+	}
+	mutex_unlock(&sbi->age_extent_tree_lock);
+
+free_node:
+	/* 2. remove LRU extent entries */
+	if (!mutex_trylock(&sbi->age_extent_tree_lock))
+		goto out;
+
+	remained = nr_shrink - (node_cnt + tree_cnt);
+
+	spin_lock(&sbi->age_extent_lock);
+	for (; remained > 0; remained--) {
+		if (list_empty(&sbi->age_extent_list))
+			break;
+		en = list_first_entry(&sbi->age_extent_list,
+					struct age_extent_node, list);
+		et = en->et;
+		if (!write_trylock(&et->lock)) {
+			/* refresh this extent node's position in extent list */
+			list_move_tail(&en->list, &sbi->age_extent_list);
+			continue;
+		}
+
+		list_del_init(&en->list);
+		spin_unlock(&sbi->age_extent_lock);
+
+		__detach_age_extent_node(sbi, et, en);
+
+		write_unlock(&et->lock);
+		node_cnt++;
+		spin_lock(&sbi->age_extent_lock);
+	}
+	spin_unlock(&sbi->age_extent_lock);
+
+unlock_out:
+	mutex_unlock(&sbi->age_extent_tree_lock);
+out:
+	trace_f2fs_shrink_age_extent_tree(sbi, nr_shrink, node_cnt, tree_cnt);
+
+	return node_cnt + tree_cnt;
+}
+
+static bool f2fs_lookup_age_extent_tree(struct inode *inode, pgoff_t pgofs,
+							struct age_extent_info *ei)
+{
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	struct age_extent_tree *et = F2FS_I(inode)->age_extent_tree;
+	struct age_extent_node *en;
+
+	if (!et)
+		return false;
+
+	trace_f2fs_lookup_age_extent_tree_start(inode, pgofs);
+
+	read_lock(&et->lock);
+
+	en = (struct age_extent_node *)f2fs_lookup_rb_tree(&et->root,
+				(struct rb_entry *)et->cached_en, pgofs);
+	if (!en) {
+		read_unlock(&et->lock);
+		return false;
+	}
+
+	if (ei)
+		*ei = en->ei;
+	spin_lock(&sbi->age_extent_lock);
+	if (!list_empty(&en->list)) {
+		list_move_tail(&en->list, &sbi->age_extent_list);
+		et->cached_en = en;
+	}
+	spin_unlock(&sbi->age_extent_lock);
+	read_unlock(&et->lock);
+
+	trace_f2fs_lookup_age_extent_tree_end(inode, pgofs, &en->ei);
+	return true;
+}
+
+bool f2fs_lookup_age_extent_cache(struct inode *inode, pgoff_t pgofs,
+					struct age_extent_info *ei)
+{
+	if (!f2fs_may_age_extent_tree(inode))
+		return false;
+
+	return f2fs_lookup_age_extent_tree(inode, pgofs, ei);
+}
+
+static inline bool __is_age_extent_mergeable(struct age_extent_info *back,
+						struct age_extent_info *front)
+{
+	return (back->fofs + back->len == front->fofs &&
+			back->age == front->age &&
+			back->last_blocks == front->last_blocks);
+}
+
+static inline bool __is_back_age_ext_mergeable(struct age_extent_info *cur,
+						struct age_extent_info *back)
+{
+	return __is_age_extent_mergeable(back, cur);
+}
+
+static inline bool __is_front_age_ext_mergeable(struct age_extent_info *cur,
+						struct age_extent_info *front)
+{
+	return __is_age_extent_mergeable(cur, front);
+}
+
+static inline void set_age_extent_info(struct age_extent_info *ei, unsigned int fofs,
+				unsigned int len, unsigned long long age,
+				unsigned long long last_blocks)
+{
+	ei->fofs = fofs;
+	ei->len = len;
+	ei->age = age;
+	ei->last_blocks = last_blocks;
+}
+
+static struct age_extent_node *__try_merge_age_extent_node(struct f2fs_sb_info *sbi,
+				struct age_extent_tree *et, struct age_extent_info *ei,
+				struct age_extent_node *prev_ex,
+				struct age_extent_node *next_ex)
+{
+	struct age_extent_node *en = NULL;
+
+	if (prev_ex && __is_back_age_ext_mergeable(ei, &prev_ex->ei)) {
+		prev_ex->ei.len += ei->len;
+		ei = &prev_ex->ei;
+		en = prev_ex;
+	}
+
+	if (next_ex && __is_front_age_ext_mergeable(ei, &next_ex->ei)) {
+		next_ex->ei.fofs = ei->fofs;
+		next_ex->ei.len += ei->len;
+		if (en)
+			__release_age_extent_node(sbi, et, prev_ex);
+
+		en = next_ex;
+	}
+
+	if (!en)
+		return NULL;
+
+	spin_lock(&sbi->age_extent_lock);
+	if (!list_empty(&en->list)) {
+		list_move_tail(&en->list, &sbi->age_extent_list);
+		et->cached_en = en;
+	}
+	spin_unlock(&sbi->age_extent_lock);
+
+	trace_f2fs_merged_age_extent_node(sbi, et, &en->ei);
+	return en;
+}
+
+static struct age_extent_node *__attach_age_extent_node(struct f2fs_sb_info *sbi,
+				struct age_extent_tree *et, struct age_extent_info *ei,
+				struct rb_node *parent, struct rb_node **p,
+				bool leftmost)
+{
+	struct age_extent_node *en;
+
+	en = kmem_cache_alloc(age_extent_node_slab, GFP_ATOMIC);
+	if (!en)
+		return NULL;
+
+	en->ei = *ei;
+	INIT_LIST_HEAD(&en->list);
+	en->et = et;
+
+	rb_link_node(&en->rb_node, parent, p);
+	rb_insert_color_cached(&en->rb_node, &et->root, leftmost);
+	atomic_inc(&et->node_cnt);
+	atomic_inc(&sbi->total_age_ext_node);
+
+	trace_f2fs_attach_age_extent_node(sbi, en->et, &en->ei);
+	return en;
+}
+
+static struct age_extent_node *__insert_age_extent_tree(struct f2fs_sb_info *sbi,
+				struct age_extent_tree *et, struct age_extent_info *ei,
+				struct rb_node **insert_p,
+				struct rb_node *insert_parent,
+				bool leftmost)
+{
+	struct rb_node **p;
+	struct rb_node *parent = NULL;
+	struct age_extent_node *en = NULL;
+
+	if (insert_p && insert_parent) {
+		parent = insert_parent;
+		p = insert_p;
+		goto do_insert;
+	}
+
+	leftmost = true;
+
+	p = f2fs_lookup_rb_tree_for_insert(sbi, &et->root, &parent,
+						ei->fofs, &leftmost);
+do_insert:
+	en = __attach_age_extent_node(sbi, et, ei, parent, p, leftmost);
+	if (!en)
+		return NULL;
+
+	/* update in global extent list */
+	spin_lock(&sbi->age_extent_lock);
+	list_add_tail(&en->list, &sbi->age_extent_list);
+	et->cached_en = en;
+	spin_unlock(&sbi->age_extent_lock);
+
+	return en;
+}
+
+static void f2fs_update_age_extent_tree_range(struct inode *inode,
+				pgoff_t fofs, unsigned int len, unsigned long long age,
+				unsigned long long last_blks)
+{
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	struct age_extent_tree *et = F2FS_I(inode)->age_extent_tree;
+	struct age_extent_node *en = NULL, *en1 = NULL;
+	struct age_extent_node *prev_en = NULL, *next_en = NULL;
+	struct age_extent_info ei, dei;
+	struct rb_node **insert_p = NULL, *insert_parent = NULL;
+	unsigned int end = fofs + len;
+	unsigned int pos = (unsigned int)fofs;
+	bool leftmost = false;
+
+	if (!et)
+		return;
+
+	trace_f2fs_update_age_extent_tree_range(inode, fofs, len, age, last_blks);
+
+	write_lock(&et->lock);
+
+	/* 1. lookup first extent node in range [fofs, fofs + len - 1] */
+	en = (struct age_extent_node *)f2fs_lookup_rb_tree_ret(&et->root,
+					(struct rb_entry *)et->cached_en, fofs,
+					(struct rb_entry **)&prev_en,
+					(struct rb_entry **)&next_en,
+					&insert_p, &insert_parent, false,
+					&leftmost);
+	if (!en)
+		en = next_en;
+
+	/* 2. invlidate all age extent nodes in range [fofs, fofs + len - 1] */
+	while (en && en->ei.fofs < end) {
+		unsigned int org_end;
+		int parts = 0;	/* # of parts current age extent split into */
+
+		next_en = en1 = NULL;
+
+		dei = en->ei;
+		org_end = dei.fofs + dei.len;
+		f2fs_bug_on(sbi, pos >= org_end);
+
+		if (pos > dei.fofs) {
+			en->ei.len = pos - en->ei.fofs;
+			prev_en = en;
+			parts = 1;
+		}
+
+		if (end < org_end) {
+			if (parts) {
+				set_age_extent_info(&ei, end,
+						org_end - end, dei.age, dei.last_blocks);
+				en1 = __insert_age_extent_tree(sbi, et, &ei,
+							NULL, NULL, true);
+				next_en = en1;
+			} else {
+				en->ei.fofs = end;
+				en->ei.len -= end - dei.fofs;
+				en->ei.age = dei.age;
+				en->ei.last_blocks = dei.last_blocks;
+				next_en = en;
+			}
+			parts++;
+		}
+
+		if (!next_en) {
+			struct rb_node *node = rb_next(&en->rb_node);
+
+			next_en = rb_entry_safe(node, struct age_extent_node,
+						rb_node);
+		}
+
+		if (!parts)
+			__release_age_extent_node(sbi, et, en);
+
+		/*
+		 * if original extent is split into zero or two parts, extent
+		 * tree has been altered by deletion or insertion, therefore
+		 * invalidate pointers regard to tree.
+		 */
+		if (parts != 1) {
+			insert_p = NULL;
+			insert_parent = NULL;
+		}
+		en = next_en;
+	}
+
+	/* 3. update extent in extent cache */
+	if (last_blks) {
+		set_age_extent_info(&ei, fofs, len, age, last_blks);
+		if (!__try_merge_age_extent_node(sbi, et, &ei, prev_en, next_en))
+			__insert_age_extent_tree(sbi, et, &ei,
+					insert_p, insert_parent, leftmost);
+	}
+
+	write_unlock(&et->lock);
+}
+
+void f2fs_update_age_extent_cache(struct inode *inode, pgoff_t fofs,
+					unsigned int len, unsigned long long age,
+					unsigned long long cur_blk_alloced)
+{
+	if (!f2fs_may_age_extent_tree(inode))
+		return;
+
+	f2fs_update_age_extent_tree_range(inode, fofs, len, age, cur_blk_alloced);
+}
+
+void f2fs_truncate_age_extent_cache(struct inode *inode, pgoff_t fofs, unsigned int len)
+{
+	f2fs_update_age_extent_cache(inode, fofs, len, 0, 0);
+}
+
+void f2fs_destroy_age_extent_tree(struct inode *inode)
+{
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	struct age_extent_tree *et = F2FS_I(inode)->age_extent_tree;
+	unsigned int node_cnt = 0;
+
+	if (!et)
+		return;
+
+	if (inode->i_nlink && !is_bad_inode(inode) &&
+					atomic_read(&et->node_cnt)) {
+		mutex_lock(&sbi->age_extent_tree_lock);
+		list_add_tail(&et->list, &sbi->zombie_age_list);
+		atomic_inc(&sbi->total_zombie_age_tree);
+		mutex_unlock(&sbi->age_extent_tree_lock);
+		return;
+	}
+
+	/* free all extent info belong to this extent tree */
+	node_cnt = f2fs_drop_age_extent_node(inode);
+
+	/* delete extent tree entry in radix tree */
+	mutex_lock(&sbi->age_extent_tree_lock);
+	f2fs_bug_on(sbi, atomic_read(&et->node_cnt));
+	radix_tree_delete(&sbi->age_extent_tree_root, inode->i_ino);
+	kmem_cache_free(age_extent_tree_slab, et);
+	atomic_dec(&sbi->total_age_ext_tree);
+	mutex_unlock(&sbi->age_extent_tree_lock);
+
+	F2FS_I(inode)->age_extent_tree = NULL;
+
+	trace_f2fs_destroy_age_extent_tree(inode, node_cnt);
+}
+
+void f2fs_init_data_seperation_info(struct f2fs_sb_info *sbi)
+{
+	f2fs_init_block_age_info(sbi);
+	f2fs_init_age_cache_info(sbi);
+
+	f2fs_init_age_extent_tree(sbi->sb->s_root->d_inode);
+#ifdef CONFIG_QUOTA
+	f2fs_init_quota_age_extent_cache(sbi);
+#endif
+}
+
 void f2fs_inc_block_alloc_count(struct f2fs_sb_info *sbi, int type)
 {
 	if (IS_DATASEG(type))
 		f2fs_inc_data_block_alloc(sbi);
 }
+
+int __init f2fs_create_age_extent_cache(void)
+{
+	age_extent_tree_slab = f2fs_kmem_cache_create("f2fs_age_extent_tree",
+			sizeof(struct age_extent_tree));
+	if (!age_extent_tree_slab)
+		return -ENOMEM;
+	age_extent_node_slab = f2fs_kmem_cache_create("f2fs_age_extent_node",
+			sizeof(struct age_extent_node));
+	if (!age_extent_node_slab) {
+		kmem_cache_destroy(age_extent_tree_slab);
+		return -ENOMEM;
+	}
+	return 0;
+}
+
+bool f2fs_init_age_extent_tree(struct inode *inode)
+{
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	struct age_extent_tree *et;
+	nid_t ino = inode->i_ino;
+
+	if (!f2fs_may_age_extent_tree(inode))
+		return false;
+
+	mutex_lock(&sbi->age_extent_tree_lock);
+	et = radix_tree_lookup(&sbi->age_extent_tree_root, ino);
+	if (!et) {
+		et = f2fs_kmem_cache_alloc(age_extent_tree_slab, GFP_NOFS, false, sbi);
+		f2fs_radix_tree_insert(&sbi->age_extent_tree_root, ino, et);
+		memset(et, 0, sizeof(struct age_extent_tree));
+		et->ino = ino;
+		et->root = RB_ROOT_CACHED;
+		et->cached_en = NULL;
+		rwlock_init(&et->lock);
+		INIT_LIST_HEAD(&et->list);
+		atomic_set(&et->node_cnt, 0);
+		atomic_inc(&sbi->total_age_ext_tree);
+	} else {
+		atomic_dec(&sbi->total_zombie_age_tree);
+		list_del_init(&et->list);
+	}
+	mutex_unlock(&sbi->age_extent_tree_lock);
+
+	/* never died until evict_inode */
+	F2FS_I(inode)->age_extent_tree = et;
+
+	trace_f2fs_init_age_extent_tree(inode, atomic_read(&et->node_cnt));
+	return true;
+}
+
+unsigned long long f2fs_total_age_cache_size(struct f2fs_sb_info *sbi)
+{
+	return atomic_read(&sbi->total_age_ext_tree) *
+				sizeof(struct age_extent_tree) +
+				atomic_read(&sbi->total_age_ext_node) *
+				sizeof(struct age_extent_node);
+}
+
+unsigned long f2fs_count_age_extent_cache(struct f2fs_sb_info *sbi)
+{
+	return atomic_read(&sbi->total_zombie_age_tree) +
+				atomic_read(&sbi->total_age_ext_node);
+}
+
+void f2fs_destroy_age_extent_cache(void)
+{
+	kmem_cache_destroy(age_extent_node_slab);
+	kmem_cache_destroy(age_extent_tree_slab);
+}
diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index d24abdac20bb..38eb8699a497 100644
--- a/fs/f2fs/debug.c
+++ b/fs/f2fs/debug.c
@@ -83,6 +83,8 @@ static void update_general_status(struct f2fs_sb_info *sbi)
 	si->ext_node = atomic_read(&sbi->total_ext_node);
 #ifdef CONFIG_F2FS_FS_DATA_SEPARATION
 	si->total_data_blocks_alloc = atomic64_read(&sbi->total_data_alloc);
+	si->age_ext_tree_count = atomic_read(&sbi->total_age_ext_tree);
+	si->age_ext_node_count = atomic_read(&sbi->total_age_ext_node);
 #endif
 	si->ndirty_node = get_pages(sbi, F2FS_DIRTY_NODES);
 	si->ndirty_dent = get_pages(sbi, F2FS_DIRTY_DENTS);
@@ -301,6 +303,9 @@ static void update_mem_info(struct f2fs_sb_info *sbi)
 						sizeof(struct extent_tree);
 	si->cache_mem += atomic_read(&sbi->total_ext_node) *
 						sizeof(struct extent_node);
+#ifdef CONFIG_F2FS_FS_DATA_SEPARATION
+	si->age_ext_mem = f2fs_total_age_cache_size(sbi);
+#endif
 
 	si->page_mem = 0;
 	if (sbi->node_inode) {
@@ -575,6 +580,14 @@ static int stat_show(struct seq_file *s, void *v)
 				si->base_mem >> 10);
 		seq_printf(s, "  - cached: %llu KB\n",
 				si->cache_mem >> 10);
+#ifdef CONFIG_F2FS_FS_DATA_SEPARATION
+		seq_printf(s, "  - age cached: %llu KB\n",
+				si->age_ext_mem >> 10);
+		seq_printf(s, "  - ext tree count: %u\n",
+				si->age_ext_tree_count);
+		seq_printf(s, "  - ext node count: %u\n",
+				si->age_ext_node_count);
+#endif
 		seq_printf(s, "  - paged : %llu KB\n",
 				si->page_mem >> 10);
 	}
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 686f09846de4..5cc516228407 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -603,6 +603,10 @@ enum {
 #define RECOVERY_MIN_RA_BLOCKS		1
 
 #define F2FS_ONSTACK_PAGES	16	/* nr of onstack pages */
+#ifdef CONFIG_F2FS_FS_DATA_SEPARATION
+/* number of age extent info in extent cache we try to shrink */
+#define AGE_EXTENT_CACHE_SHRINK_NUMBER	128
+#endif
 
 struct rb_entry {
 	struct rb_node rb_node;		/* rb node located in rb-tree */
@@ -642,6 +646,31 @@ struct extent_tree {
 	bool largest_updated;		/* largest extent updated */
 };
 
+#ifdef CONFIG_F2FS_FS_DATA_SEPARATION
+struct age_extent_info {
+	unsigned int fofs;		/* start offset in a file */
+	unsigned int len;		/* length of the extent */
+	unsigned long long age;		/* block age of the extent */
+	unsigned long long last_blocks;	/* last total blocks allocated */
+};
+
+struct age_extent_node {
+	struct rb_node rb_node;			/* rb node located in rb-tree */
+	struct age_extent_info ei;		/* age extent info */
+	struct list_head list;			/* node in global age extent list of sbi */
+	struct age_extent_tree *et;		/* age extent tree pointer */
+};
+
+struct age_extent_tree {
+	nid_t ino;			/* inode number */
+	struct rb_root_cached root;	/* root of age extent info rb-tree */
+	struct age_extent_node *cached_en;	/* recently accessed age extent node */
+	struct list_head list;		/* to be used by sbi->zombie_age_list */
+	rwlock_t lock;			/* protect age extent info rb-tree */
+	atomic_t node_cnt;		/* # of age extent node in rb-tree*/
+};
+#endif
+
 /*
  * This structure is taken from ext4_map_blocks.
  *
@@ -803,6 +832,9 @@ struct f2fs_inode_info {
 	struct extent_tree *extent_tree;	/* cached extent_tree entry */
 	struct inode *cow_inode;	/* copy-on-write inode for atomic write */
 
+#ifdef CONFIG_F2FS_FS_DATA_SEPARATION
+	struct age_extent_tree *age_extent_tree;	/* cached age_extent_tree entry */
+#endif
 	/* avoid racing between foreground op and gc */
 	struct f2fs_rwsem i_gc_rwsem[2];
 	struct f2fs_rwsem i_xattr_sem; /* avoid racing between reading and changing EAs */
@@ -1677,6 +1709,18 @@ struct f2fs_sb_info {
 	atomic_t total_zombie_tree;		/* extent zombie tree count */
 	atomic_t total_ext_node;		/* extent info count */
 
+#ifdef CONFIG_F2FS_FS_DATA_SEPARATION
+	/* for age extent tree cache */
+	struct radix_tree_root age_extent_tree_root;	/* cache age extent cache entries */
+	struct mutex age_extent_tree_lock;		/* locking age extent radix tree */
+	struct list_head age_extent_list;		/* lru list for shrinker */
+	spinlock_t age_extent_lock;			/* locking age extent lru list */
+	atomic_t total_age_ext_tree;			/* age extent tree count */
+	struct list_head zombie_age_list;		/* age extent zombie tree list */
+	atomic_t total_zombie_age_tree;			/* age extent zombie tree count */
+	atomic_t total_age_ext_node;			/* age extent info count */
+#endif
+
 	/* basic filesystem units */
 	unsigned int log_sectors_per_block;	/* log2 sectors per block */
 	unsigned int log_blocksize;		/* log2 block size */
@@ -3864,6 +3908,9 @@ struct f2fs_stat_info {
 	unsigned long long hit_total, total_ext;
 #ifdef CONFIG_F2FS_FS_DATA_SEPARATION
 	unsigned long long total_data_blocks_alloc;
+	unsigned long long age_ext_mem;
+	unsigned int age_ext_tree_count;
+	unsigned int age_ext_node_count;
 #endif
 	int ext_tree, zombie_tree, ext_node;
 	int ndirty_node, ndirty_dent, ndirty_meta, ndirty_imeta;
@@ -4177,8 +4224,23 @@ void f2fs_destroy_extent_cache(void);
 /*
  * block_age.c
  */
-void f2fs_init_block_age_info(struct f2fs_sb_info *sbi);
+void f2fs_init_data_seperation_info(struct f2fs_sb_info *sbi);
 void f2fs_inc_block_alloc_count(struct f2fs_sb_info *sbi, int type);
+unsigned long long f2fs_total_age_cache_size(struct f2fs_sb_info *sbi);
+unsigned long f2fs_count_age_extent_cache(struct f2fs_sb_info *sbi);
+bool f2fs_init_age_extent_tree(struct inode *inode);
+unsigned int f2fs_shrink_age_extent_tree(struct f2fs_sb_info *sbi, int nr_shrink);
+unsigned int f2fs_drop_age_extent_node(struct inode *inode);
+void f2fs_destroy_age_extent_tree(struct inode *inode);
+bool f2fs_lookup_age_extent_cache(struct inode *inode, pgoff_t pgofs,
+					struct age_extent_info *ei);
+void f2fs_update_age_extent_cache(struct inode *inode, pgoff_t fofs,
+					unsigned int len, u64 age,
+					unsigned long long cur_blk_alloced);
+void f2fs_truncate_age_extent_cache(struct inode *inode, pgoff_t fofs,
+					unsigned int len);
+int __init f2fs_create_age_extent_cache(void);
+void f2fs_destroy_age_extent_cache(void);
 #endif
 
 /*
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 82cda1258227..860e2405e6bb 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -619,6 +619,10 @@ void f2fs_truncate_data_blocks_range(struct dnode_of_data *dn, int count)
 		fofs = f2fs_start_bidx_of_node(ofs_of_node(dn->node_page),
 							dn->inode) + ofs;
 		f2fs_update_extent_cache_range(dn, fofs, 0, len);
+#ifdef CONFIG_F2FS_FS_DATA_SEPARATION
+		/* delete block age info from cache */
+		f2fs_truncate_age_extent_cache(dn->inode, fofs, nr_free);
+#endif
 		dec_valid_block_count(sbi, dn->inode, nr_free);
 	}
 	dn->ofs_in_node = ofs;
@@ -1403,6 +1407,9 @@ static int f2fs_do_collapse(struct inode *inode, loff_t offset, loff_t len)
 
 	f2fs_lock_op(sbi);
 	f2fs_drop_extent_tree(inode);
+#ifdef CONFIG_F2FS_FS_DATA_SEPARATION
+	f2fs_drop_age_extent_node(inode);
+#endif
 	truncate_pagecache(inode, offset);
 	ret = __exchange_data_block(inode, inode, end, start, nrpages - end, true);
 	f2fs_unlock_op(sbi);
@@ -1664,6 +1671,9 @@ static int f2fs_insert_range(struct inode *inode, loff_t offset, loff_t len)
 
 		f2fs_lock_op(sbi);
 		f2fs_drop_extent_tree(inode);
+#ifdef CONFIG_F2FS_FS_DATA_SEPARATION
+		f2fs_drop_age_extent_node(inode);
+#endif
 
 		ret = __exchange_data_block(inode, inode, idx,
 					idx + delta, nr, false);
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 9f0d3864d9f1..be05870b466f 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -394,6 +394,10 @@ static int do_read_inode(struct inode *inode)
 
 	f2fs_init_extent_tree(inode, node_page);
 
+#ifdef CONFIG_F2FS_FS_DATA_SEPARATION
+	f2fs_init_age_extent_tree(inode);
+#endif
+
 	get_inline_info(inode, ri);
 
 	fi->i_extra_isize = f2fs_has_extra_attr(inode) ?
@@ -782,6 +786,10 @@ void f2fs_evict_inode(struct inode *inode)
 
 	f2fs_destroy_extent_tree(inode);
 
+#ifdef CONFIG_F2FS_FS_DATA_SEPARATION
+	f2fs_destroy_age_extent_tree(inode);
+#endif
+
 	if (inode->i_nlink || is_bad_inode(inode))
 		goto no_delete;
 
diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index a389772fd212..193d65e8f292 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -105,6 +105,10 @@ static struct inode *f2fs_new_inode(struct user_namespace *mnt_userns,
 
 	f2fs_init_extent_tree(inode, NULL);
 
+#ifdef CONFIG_F2FS_FS_DATA_SEPARATION
+	f2fs_init_age_extent_tree(inode);
+#endif
+
 	F2FS_I(inode)->i_flags =
 		f2fs_mask_flags(mode, F2FS_I(dir)->i_flags & F2FS_FL_INHERITED);
 
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 983572f23896..280dcc8d4939 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -60,7 +60,7 @@ bool f2fs_available_free_memory(struct f2fs_sb_info *sbi, int type)
 	avail_ram = val.totalram - val.totalhigh;
 
 	/*
-	 * give 25%, 25%, 50%, 50%, 50% memory for each components respectively
+	 * give 25%, 25%, 50%, 50%, 50%, 50% memory for each components respectively
 	 */
 	if (type == FREE_NIDS) {
 		mem_size = (nm_i->nid_cnt[FREE_NID] *
@@ -91,6 +91,11 @@ bool f2fs_available_free_memory(struct f2fs_sb_info *sbi, int type)
 				atomic_read(&sbi->total_ext_node) *
 				sizeof(struct extent_node)) >> PAGE_SHIFT;
 		res = mem_size < ((avail_ram * nm_i->ram_thresh / 100) >> 1);
+#ifdef CONFIG_F2FS_FS_DATA_SEPARATION
+	} else if (type == AGE_EXTENT_CACHE) {
+		mem_size = f2fs_total_age_cache_size(sbi) >> PAGE_SHIFT;
+		res = mem_size < ((avail_ram * nm_i->ram_thresh / 100) >> 1);
+#endif
 	} else if (type == DISCARD_CACHE) {
 		mem_size = (atomic_read(&dcc->discard_cmd_cnt) *
 				sizeof(struct discard_cmd)) >> PAGE_SHIFT;
diff --git a/fs/f2fs/node.h b/fs/f2fs/node.h
index 3c09cae058b0..3a103bd3833f 100644
--- a/fs/f2fs/node.h
+++ b/fs/f2fs/node.h
@@ -147,6 +147,9 @@ enum mem_type {
 	DIRTY_DENTS,	/* indicates dirty dentry pages */
 	INO_ENTRIES,	/* indicates inode entries */
 	EXTENT_CACHE,	/* indicates extent cache */
+#ifdef CONFIG_F2FS_FS_DATA_SEPARATION
+	AGE_EXTENT_CACHE,	/* indicates age extent cache */
+#endif
 	DISCARD_CACHE,	/* indicates memory of cached discard cmds */
 	COMPRESS_PAGE,	/* indicates memory of cached compressed pages */
 	BASE_CHECK,	/* check kernel status */
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 0cf022fd3560..b105d8418f77 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -440,6 +440,12 @@ void f2fs_balance_fs_bg(struct f2fs_sb_info *sbi, bool from_bg)
 	if (!f2fs_available_free_memory(sbi, EXTENT_CACHE))
 		f2fs_shrink_extent_tree(sbi, EXTENT_CACHE_SHRINK_NUMBER);
 
+#ifdef CONFIG_F2FS_FS_DATA_SEPARATION
+	/* try to shrink age extent cache when there is no enough memory */
+	if (!f2fs_available_free_memory(sbi, AGE_EXTENT_CACHE))
+		f2fs_shrink_age_extent_tree(sbi, AGE_EXTENT_CACHE_SHRINK_NUMBER);
+#endif
+
 	/* check the # of cached NAT entries */
 	if (!f2fs_available_free_memory(sbi, NAT_ENTRIES))
 		f2fs_try_to_free_nats(sbi, NAT_ENTRY_PER_BLOCK);
diff --git a/fs/f2fs/shrinker.c b/fs/f2fs/shrinker.c
index dd3c3c7a90ec..9a139a0a6f8f 100644
--- a/fs/f2fs/shrinker.c
+++ b/fs/f2fs/shrinker.c
@@ -131,6 +131,9 @@ void f2fs_join_shrinker(struct f2fs_sb_info *sbi)
 void f2fs_leave_shrinker(struct f2fs_sb_info *sbi)
 {
 	f2fs_shrink_extent_tree(sbi, __count_extent_cache(sbi));
+#ifdef CONFIG_F2FS_FS_DATA_SEPARATION
+	f2fs_shrink_age_extent_tree(sbi, f2fs_count_age_extent_cache(sbi));
+#endif
 
 	spin_lock(&f2fs_list_lock);
 	list_del_init(&sbi->s_list);
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index bf799d92282a..91d3c9d0425d 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1421,6 +1421,10 @@ static int f2fs_drop_inode(struct inode *inode)
 			/* should remain fi->extent_tree for writepage */
 			f2fs_destroy_extent_node(inode);
 
+#ifdef CONFIG_F2FS_FS_DATA_SEPARATION
+			f2fs_drop_age_extent_node(inode);
+#endif
+
 			sb_start_intwrite(inode->i_sb);
 			f2fs_i_size_write(inode, 0);
 
@@ -4476,7 +4480,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 	f2fs_join_shrinker(sbi);
 
 #ifdef CONFIG_F2FS_FS_DATA_SEPARATION
-	f2fs_init_block_age_info(sbi);
+	f2fs_init_data_seperation_info(sbi);
 #endif
 
 	f2fs_tuning_parameters(sbi);
@@ -4673,9 +4677,18 @@ static int __init init_f2fs_fs(void)
 	err = f2fs_create_extent_cache();
 	if (err)
 		goto free_recovery_cache;
+#ifdef CONFIG_F2FS_FS_DATA_SEPARATION
+	err = f2fs_create_age_extent_cache();
+	if (err)
+		goto free_extent_cache;
+#endif
 	err = f2fs_create_garbage_collection_cache();
 	if (err)
+#ifdef CONFIG_F2FS_FS_DATA_SEPARATION
+		goto free_age_extent_cache;
+#else
 		goto free_extent_cache;
+#endif
 	err = f2fs_init_sysfs();
 	if (err)
 		goto free_garbage_collection_cache;
@@ -4729,6 +4742,10 @@ static int __init init_f2fs_fs(void)
 	f2fs_exit_sysfs();
 free_garbage_collection_cache:
 	f2fs_destroy_garbage_collection_cache();
+#ifdef CONFIG_F2FS_FS_DATA_SEPARATION
+free_age_extent_cache:
+	f2fs_destroy_age_extent_cache();
+#endif
 free_extent_cache:
 	f2fs_destroy_extent_cache();
 free_recovery_cache:
@@ -4761,6 +4778,9 @@ static void __exit exit_f2fs_fs(void)
 	f2fs_destroy_garbage_collection_cache();
 	f2fs_destroy_extent_cache();
 	f2fs_destroy_recovery_cache();
+#ifdef CONFIG_F2FS_FS_DATA_SEPARATION
+	f2fs_destroy_age_extent_cache();
+#endif
 	f2fs_destroy_checkpoint_caches();
 	f2fs_destroy_segment_manager_caches();
 	f2fs_destroy_node_manager_caches();
diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
index c6b372401c27..b19c057ff801 100644
--- a/include/trace/events/f2fs.h
+++ b/include/trace/events/f2fs.h
@@ -160,6 +160,11 @@ struct extent_info;
 struct victim_sel_policy;
 struct f2fs_map_blocks;
 
+#ifdef CONFIG_F2FS_FS_DATA_SEPARATION
+struct age_extent_tree;
+struct age_extent_info;
+#endif
+
 DECLARE_EVENT_CLASS(f2fs__inode,
 
 	TP_PROTO(struct inode *inode),
@@ -1659,6 +1664,240 @@ TRACE_EVENT(f2fs_destroy_extent_tree,
 		__entry->node_cnt)
 );
 
+#ifdef CONFIG_F2FS_FS_DATA_SEPARATION
+DECLARE_EVENT_CLASS(f2fs_add_age_extent_node,
+
+	TP_PROTO(struct f2fs_sb_info *sbi,
+				struct age_extent_tree *et, struct age_extent_info *ei),
+
+	TP_ARGS(sbi, et, ei),
+
+	TP_STRUCT__entry(
+		__field(dev_t,	dev)
+		__field(ino_t,	ino)
+		__field(unsigned int, cnt)
+		__field(unsigned int, fofs)
+		__field(unsigned int, len)
+		__field(unsigned long long, age)
+		__field(unsigned long long, blocks)
+	),
+
+	TP_fast_assign(
+		__entry->dev = sbi->sb->s_dev;
+		__entry->ino = et->ino;
+		__entry->cnt = atomic_read(&et->node_cnt);
+		__entry->fofs = ei->fofs;
+		__entry->len = ei->len;
+		__entry->age = ei->age;
+		__entry->blocks = ei->last_blocks;
+	),
+
+	TP_printk("dev = (%d,%d), ino = %lu, node_cnt = %lu, "
+		"age_ext_info(fofs: %u, len: %u, age: %llu, blocks: %llu)",
+		show_dev_ino(__entry),
+		__entry->cnt,
+		__entry->fofs,
+		__entry->len,
+		__entry->age,
+		__entry->blocks)
+);
+
+DEFINE_EVENT(f2fs_add_age_extent_node, f2fs_attach_age_extent_node,
+
+	TP_PROTO(struct f2fs_sb_info *sbi,
+				struct age_extent_tree *et, struct age_extent_info *ei),
+
+	TP_ARGS(sbi, et, ei)
+);
+
+DEFINE_EVENT(f2fs_add_age_extent_node, f2fs_merged_age_extent_node,
+
+	TP_PROTO(struct f2fs_sb_info *sbi,
+				struct age_extent_tree *et, struct age_extent_info *ei),
+
+	TP_ARGS(sbi, et, ei)
+);
+
+DEFINE_EVENT(f2fs_add_age_extent_node, f2fs_detach_age_extent_node,
+
+	TP_PROTO(struct f2fs_sb_info *sbi,
+				struct age_extent_tree *et, struct age_extent_info *ei),
+
+	TP_ARGS(sbi, et, ei)
+);
+
+TRACE_EVENT(f2fs_lookup_age_extent_tree_start,
+
+	TP_PROTO(struct inode *inode, unsigned int pgofs),
+
+	TP_ARGS(inode, pgofs),
+
+	TP_STRUCT__entry(
+		__field(dev_t,	dev)
+		__field(ino_t,	ino)
+		__field(unsigned int, pgofs)
+	),
+
+	TP_fast_assign(
+		__entry->dev = inode->i_sb->s_dev;
+		__entry->ino = inode->i_ino;
+		__entry->pgofs = pgofs;
+	),
+
+	TP_printk("dev = (%d,%d), ino = %lu, pgofs = %u",
+		show_dev_ino(__entry),
+		__entry->pgofs)
+);
+
+TRACE_EVENT_CONDITION(f2fs_lookup_age_extent_tree_end,
+
+	TP_PROTO(struct inode *inode, unsigned int pgofs,
+						struct age_extent_info *ei),
+
+	TP_ARGS(inode, pgofs, ei),
+
+	TP_CONDITION(ei),
+
+	TP_STRUCT__entry(
+		__field(dev_t,	dev)
+		__field(ino_t,	ino)
+		__field(unsigned int, pgofs)
+		__field(unsigned int, fofs)
+		__field(unsigned int, len)
+		__field(unsigned long long, age)
+		__field(unsigned long long, blocks)
+	),
+
+	TP_fast_assign(
+		__entry->dev = inode->i_sb->s_dev;
+		__entry->ino = inode->i_ino;
+		__entry->pgofs = pgofs;
+		__entry->fofs = ei->fofs;
+		__entry->len = ei->len;
+		__entry->age = ei->age;
+		__entry->blocks = ei->last_blocks;
+	),
+
+	TP_printk("dev = (%d,%d), ino = %lu, pgofs = %u, "
+		"age_ext_info(fofs: %u, len: %u, age: %llu, blocks: %llu)",
+		show_dev_ino(__entry),
+		__entry->pgofs,
+		__entry->fofs,
+		__entry->len,
+		__entry->age,
+		__entry->blocks)
+);
+
+TRACE_EVENT(f2fs_update_age_extent_tree_range,
+
+	TP_PROTO(struct inode *inode, unsigned int pgofs, unsigned int len,
+					unsigned long long age,
+					unsigned long long last_blks),
+
+	TP_ARGS(inode, pgofs, len, age, last_blks),
+
+	TP_STRUCT__entry(
+		__field(dev_t,	dev)
+		__field(ino_t,	ino)
+		__field(unsigned int, pgofs)
+		__field(unsigned int, len)
+		__field(unsigned long long, age)
+		__field(unsigned long long, blocks)
+	),
+
+	TP_fast_assign(
+		__entry->dev = inode->i_sb->s_dev;
+		__entry->ino = inode->i_ino;
+		__entry->pgofs = pgofs;
+		__entry->len = len;
+		__entry->age = age;
+		__entry->blocks = last_blks;
+	),
+
+	TP_printk("dev = (%d,%d), ino = %lu, pgofs = %u, "
+					"len = %u, age = %llu, blocks = %llu",
+		show_dev_ino(__entry),
+		__entry->pgofs,
+		__entry->len,
+		__entry->age,
+		__entry->blocks)
+);
+
+TRACE_EVENT(f2fs_shrink_age_extent_tree,
+
+	TP_PROTO(struct f2fs_sb_info *sbi, int nr_shrink,
+						unsigned int node_cnt, unsigned int tree_cnt),
+
+	TP_ARGS(sbi, nr_shrink, node_cnt, tree_cnt),
+
+	TP_STRUCT__entry(
+		__field(dev_t,	dev)
+		__field(int, nr_shrink)
+		__field(unsigned int, node_cnt)
+		__field(unsigned int, tree_cnt)
+	),
+
+	TP_fast_assign(
+		__entry->dev = sbi->sb->s_dev;
+		__entry->nr_shrink = nr_shrink;
+		__entry->node_cnt = node_cnt;
+		__entry->tree_cnt = tree_cnt;
+	),
+
+	TP_printk("dev = (%d,%d), nr_shrink = %d, shrunk: node_cnt = %u, tree_cnt = %u",
+		show_dev(__entry->dev),
+		__entry->nr_shrink,
+		__entry->node_cnt,
+		__entry->tree_cnt)
+);
+
+TRACE_EVENT(f2fs_init_age_extent_tree,
+
+	TP_PROTO(struct inode *inode, unsigned int node_cnt),
+
+	TP_ARGS(inode, node_cnt),
+
+	TP_STRUCT__entry(
+		__field(dev_t,	dev)
+		__field(ino_t,	ino)
+		__field(unsigned int, node_cnt)
+	),
+
+	TP_fast_assign(
+		__entry->dev = inode->i_sb->s_dev;
+		__entry->ino = inode->i_ino;
+		__entry->node_cnt = node_cnt;
+	),
+
+	TP_printk("dev = (%d,%d), ino = %lu, node_cnt = %u",
+		show_dev_ino(__entry),
+		__entry->node_cnt)
+);
+
+TRACE_EVENT(f2fs_destroy_age_extent_tree,
+
+	TP_PROTO(struct inode *inode, unsigned int node_cnt),
+
+	TP_ARGS(inode, node_cnt),
+
+	TP_STRUCT__entry(
+		__field(dev_t,	dev)
+		__field(ino_t,	ino)
+		__field(unsigned int, node_cnt)
+	),
+
+	TP_fast_assign(
+		__entry->dev = inode->i_sb->s_dev;
+		__entry->ino = inode->i_ino;
+		__entry->node_cnt = node_cnt;
+	),
+
+	TP_printk("dev = (%d,%d), ino = %lu, destroyed: node_cnt = %u",
+		show_dev_ino(__entry),
+		__entry->node_cnt)
+);
+#endif
+
 DECLARE_EVENT_CLASS(f2fs_sync_dirty_inodes,
 
 	TP_PROTO(struct super_block *sb, int type, s64 count),
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
