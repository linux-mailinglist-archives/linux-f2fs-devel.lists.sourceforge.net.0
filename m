Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9AC2E78E5
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 30 Dec 2020 14:04:44 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kub9W-0000fW-BZ; Wed, 30 Dec 2020 13:04:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1kub9U-0000fP-8R
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 30 Dec 2020 13:04:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OR0+gQhZFNhydzlrNJBsXDBdJa5B2Q2MVXGNUuF5iYY=; b=jsFPCEB/mz7J/54tCBkiF9oR83
 JvKnBSSjF/Uy/HjXR3JNjs/S8Rhxd4is6hzNTeVyxBraC1QtXEJ05zCTj+vgKqMObycN/l6JPfWLl
 z/MKvzdXmf3ulQ4uyZ2CS5HgbpkpkJ5X4t/K/w1DT0EOpsQjGsH1i6kUkuDBScAt5Z0w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OR0+gQhZFNhydzlrNJBsXDBdJa5B2Q2MVXGNUuF5iYY=; b=DbFUokHMncEhOOr5ZT3TNQ8Shu
 V3LDPqIMfgeZx38/ct51sELU1g0B82nIYPWtwhW1OIMbFqmSDnRNE3ksecY/iDCWdruWzPw7V23pA
 lplg4pwyPqw6wEU9/wkQUunkfJTcoGX8Cp+bSqPidB5qKQ1eiDFJs6AT2rQCwj29yCSo=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kub9F-008iag-OI
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 30 Dec 2020 13:04:32 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 411A52251E;
 Wed, 30 Dec 2020 13:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609333452;
 bh=W+Vc45MUrKdrvxQ64QJS/mCrmgrrq1KOiiAdgNhRAcI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NPqqq1WFf/qF18zLCVdiBVl7iIdw8qAMcUqwZHqBAiHqjnsaat33W9YHb4PHHuNIU
 jgArdsb4GHgerWDBftT7UcL4bLjjWDTC5NvPEJoA62zFqrkWAL5dlwXvHFrlOVac7z
 KAhyKiHaTWOMCWjMp68KDgpbMJqDte6pyObtN7dMSiS4Qk8cJqhlC99YM3ktBDzaNf
 wEaaNVa4SmVXJWaARPbXWuKwPx0aa2+P/RFnMHO5un7c/jkOuGNEp2YY6qw/w15C/T
 27injA5OdfgUYBMCptJV4JoNLGupafHx1snmFWacpFXByMWJGs6kDInMrZcBz3ruy4
 MZEeycs5pzNiQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Wed, 30 Dec 2020 08:03:50 -0500
Message-Id: <20201230130357.3637261-10-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201230130357.3637261-1-sashal@kernel.org>
References: <20201230130357.3637261-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kub9F-008iag-OI
Subject: [f2fs-dev] [PATCH AUTOSEL 5.4 10/17] f2fs: avoid race condition for
 shrinker count
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
Cc: Sasha Levin <sashal@kernel.org>, Light Hsieh <Light.Hsieh@mediatek.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-mediatek@lists.infradead.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Jaegeuk Kim <jaegeuk@kernel.org>

[ Upstream commit a95ba66ac1457b76fe472c8e092ab1006271f16c ]

Light reported sometimes shinker gets nat_cnt < dirty_nat_cnt resulting in
wrong do_shinker work. Let's avoid to return insane overflowed value by adding
single tracking value.

Reported-by: Light Hsieh <Light.Hsieh@mediatek.com>
Reviewed-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/checkpoint.c |  2 +-
 fs/f2fs/debug.c      | 11 ++++++-----
 fs/f2fs/f2fs.h       | 10 ++++++++--
 fs/f2fs/node.c       | 29 ++++++++++++++++++-----------
 fs/f2fs/node.h       |  4 ++--
 fs/f2fs/shrinker.c   |  4 +---
 6 files changed, 36 insertions(+), 24 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index c966ccc44c157..a57219c51c01a 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -1596,7 +1596,7 @@ int f2fs_write_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 			goto out;
 		}
 
-		if (NM_I(sbi)->dirty_nat_cnt == 0 &&
+		if (NM_I(sbi)->nat_cnt[DIRTY_NAT] == 0 &&
 				SIT_I(sbi)->dirty_sentries == 0 &&
 				prefree_segments(sbi) == 0) {
 			f2fs_flush_sit_entries(sbi, cpc);
diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index 9b0bedd82581b..d8d64447bc947 100644
--- a/fs/f2fs/debug.c
+++ b/fs/f2fs/debug.c
@@ -107,8 +107,8 @@ static void update_general_status(struct f2fs_sb_info *sbi)
 		si->node_pages = NODE_MAPPING(sbi)->nrpages;
 	if (sbi->meta_inode)
 		si->meta_pages = META_MAPPING(sbi)->nrpages;
-	si->nats = NM_I(sbi)->nat_cnt;
-	si->dirty_nats = NM_I(sbi)->dirty_nat_cnt;
+	si->nats = NM_I(sbi)->nat_cnt[TOTAL_NAT];
+	si->dirty_nats = NM_I(sbi)->nat_cnt[DIRTY_NAT];
 	si->sits = MAIN_SEGS(sbi);
 	si->dirty_sits = SIT_I(sbi)->dirty_sentries;
 	si->free_nids = NM_I(sbi)->nid_cnt[FREE_NID];
@@ -254,9 +254,10 @@ static void update_mem_info(struct f2fs_sb_info *sbi)
 	si->cache_mem += (NM_I(sbi)->nid_cnt[FREE_NID] +
 				NM_I(sbi)->nid_cnt[PREALLOC_NID]) *
 				sizeof(struct free_nid);
-	si->cache_mem += NM_I(sbi)->nat_cnt * sizeof(struct nat_entry);
-	si->cache_mem += NM_I(sbi)->dirty_nat_cnt *
-					sizeof(struct nat_entry_set);
+	si->cache_mem += NM_I(sbi)->nat_cnt[TOTAL_NAT] *
+				sizeof(struct nat_entry);
+	si->cache_mem += NM_I(sbi)->nat_cnt[DIRTY_NAT] *
+				sizeof(struct nat_entry_set);
 	si->cache_mem += si->inmem_pages * sizeof(struct inmem_pages);
 	for (i = 0; i < MAX_INO_ENTRY; i++)
 		si->cache_mem += sbi->im[i].ino_num * sizeof(struct ino_entry);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 63440abe58c42..604fc2391f9f2 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -797,6 +797,13 @@ enum nid_state {
 	MAX_NID_STATE,
 };
 
+enum nat_state {
+	TOTAL_NAT,
+	DIRTY_NAT,
+	RECLAIMABLE_NAT,
+	MAX_NAT_STATE,
+};
+
 struct f2fs_nm_info {
 	block_t nat_blkaddr;		/* base disk address of NAT */
 	nid_t max_nid;			/* maximum possible node ids */
@@ -812,8 +819,7 @@ struct f2fs_nm_info {
 	struct rw_semaphore nat_tree_lock;	/* protect nat_tree_lock */
 	struct list_head nat_entries;	/* cached nat entry list (clean) */
 	spinlock_t nat_list_lock;	/* protect clean nat entry list */
-	unsigned int nat_cnt;		/* the # of cached nat entries */
-	unsigned int dirty_nat_cnt;	/* total num of nat entries in set */
+	unsigned int nat_cnt[MAX_NAT_STATE]; /* the # of cached nat entries */
 	unsigned int nat_blocks;	/* # of nat blocks */
 
 	/* free node ids management */
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 2a4a382f28fed..7c34e49363f40 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -62,8 +62,8 @@ bool f2fs_available_free_memory(struct f2fs_sb_info *sbi, int type)
 				sizeof(struct free_nid)) >> PAGE_SHIFT;
 		res = mem_size < ((avail_ram * nm_i->ram_thresh / 100) >> 2);
 	} else if (type == NAT_ENTRIES) {
-		mem_size = (nm_i->nat_cnt * sizeof(struct nat_entry)) >>
-							PAGE_SHIFT;
+		mem_size = (nm_i->nat_cnt[TOTAL_NAT] *
+				sizeof(struct nat_entry)) >> PAGE_SHIFT;
 		res = mem_size < ((avail_ram * nm_i->ram_thresh / 100) >> 2);
 		if (excess_cached_nats(sbi))
 			res = false;
@@ -177,7 +177,8 @@ static struct nat_entry *__init_nat_entry(struct f2fs_nm_info *nm_i,
 	list_add_tail(&ne->list, &nm_i->nat_entries);
 	spin_unlock(&nm_i->nat_list_lock);
 
-	nm_i->nat_cnt++;
+	nm_i->nat_cnt[TOTAL_NAT]++;
+	nm_i->nat_cnt[RECLAIMABLE_NAT]++;
 	return ne;
 }
 
@@ -207,7 +208,8 @@ static unsigned int __gang_lookup_nat_cache(struct f2fs_nm_info *nm_i,
 static void __del_from_nat_cache(struct f2fs_nm_info *nm_i, struct nat_entry *e)
 {
 	radix_tree_delete(&nm_i->nat_root, nat_get_nid(e));
-	nm_i->nat_cnt--;
+	nm_i->nat_cnt[TOTAL_NAT]--;
+	nm_i->nat_cnt[RECLAIMABLE_NAT]--;
 	__free_nat_entry(e);
 }
 
@@ -253,7 +255,8 @@ static void __set_nat_cache_dirty(struct f2fs_nm_info *nm_i,
 	if (get_nat_flag(ne, IS_DIRTY))
 		goto refresh_list;
 
-	nm_i->dirty_nat_cnt++;
+	nm_i->nat_cnt[DIRTY_NAT]++;
+	nm_i->nat_cnt[RECLAIMABLE_NAT]--;
 	set_nat_flag(ne, IS_DIRTY, true);
 refresh_list:
 	spin_lock(&nm_i->nat_list_lock);
@@ -273,7 +276,8 @@ static void __clear_nat_cache_dirty(struct f2fs_nm_info *nm_i,
 
 	set_nat_flag(ne, IS_DIRTY, false);
 	set->entry_cnt--;
-	nm_i->dirty_nat_cnt--;
+	nm_i->nat_cnt[DIRTY_NAT]--;
+	nm_i->nat_cnt[RECLAIMABLE_NAT]++;
 }
 
 static unsigned int __gang_lookup_nat_set(struct f2fs_nm_info *nm_i,
@@ -2881,14 +2885,17 @@ int f2fs_flush_nat_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 	LIST_HEAD(sets);
 	int err = 0;
 
-	/* during unmount, let's flush nat_bits before checking dirty_nat_cnt */
+	/*
+	 * during unmount, let's flush nat_bits before checking
+	 * nat_cnt[DIRTY_NAT].
+	 */
 	if (enabled_nat_bits(sbi, cpc)) {
 		down_write(&nm_i->nat_tree_lock);
 		remove_nats_in_journal(sbi);
 		up_write(&nm_i->nat_tree_lock);
 	}
 
-	if (!nm_i->dirty_nat_cnt)
+	if (!nm_i->nat_cnt[DIRTY_NAT])
 		return 0;
 
 	down_write(&nm_i->nat_tree_lock);
@@ -2899,7 +2906,8 @@ int f2fs_flush_nat_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 	 * into nat entry set.
 	 */
 	if (enabled_nat_bits(sbi, cpc) ||
-		!__has_cursum_space(journal, nm_i->dirty_nat_cnt, NAT_JOURNAL))
+		!__has_cursum_space(journal,
+			nm_i->nat_cnt[DIRTY_NAT], NAT_JOURNAL))
 		remove_nats_in_journal(sbi);
 
 	while ((found = __gang_lookup_nat_set(nm_i,
@@ -3023,7 +3031,6 @@ static int init_node_manager(struct f2fs_sb_info *sbi)
 						F2FS_RESERVED_NODE_NUM;
 	nm_i->nid_cnt[FREE_NID] = 0;
 	nm_i->nid_cnt[PREALLOC_NID] = 0;
-	nm_i->nat_cnt = 0;
 	nm_i->ram_thresh = DEF_RAM_THRESHOLD;
 	nm_i->ra_nid_pages = DEF_RA_NID_PAGES;
 	nm_i->dirty_nats_ratio = DEF_DIRTY_NAT_RATIO_THRESHOLD;
@@ -3160,7 +3167,7 @@ void f2fs_destroy_node_manager(struct f2fs_sb_info *sbi)
 			__del_from_nat_cache(nm_i, natvec[idx]);
 		}
 	}
-	f2fs_bug_on(sbi, nm_i->nat_cnt);
+	f2fs_bug_on(sbi, nm_i->nat_cnt[TOTAL_NAT]);
 
 	/* destroy nat set cache */
 	nid = 0;
diff --git a/fs/f2fs/node.h b/fs/f2fs/node.h
index e05af5df56485..4a2e7eaf2b028 100644
--- a/fs/f2fs/node.h
+++ b/fs/f2fs/node.h
@@ -123,13 +123,13 @@ static inline void raw_nat_from_node_info(struct f2fs_nat_entry *raw_ne,
 
 static inline bool excess_dirty_nats(struct f2fs_sb_info *sbi)
 {
-	return NM_I(sbi)->dirty_nat_cnt >= NM_I(sbi)->max_nid *
+	return NM_I(sbi)->nat_cnt[DIRTY_NAT] >= NM_I(sbi)->max_nid *
 					NM_I(sbi)->dirty_nats_ratio / 100;
 }
 
 static inline bool excess_cached_nats(struct f2fs_sb_info *sbi)
 {
-	return NM_I(sbi)->nat_cnt >= DEF_NAT_CACHE_THRESHOLD;
+	return NM_I(sbi)->nat_cnt[TOTAL_NAT] >= DEF_NAT_CACHE_THRESHOLD;
 }
 
 static inline bool excess_dirty_nodes(struct f2fs_sb_info *sbi)
diff --git a/fs/f2fs/shrinker.c b/fs/f2fs/shrinker.c
index a467aca29cfef..3ceebaaee3840 100644
--- a/fs/f2fs/shrinker.c
+++ b/fs/f2fs/shrinker.c
@@ -18,9 +18,7 @@ static unsigned int shrinker_run_no;
 
 static unsigned long __count_nat_entries(struct f2fs_sb_info *sbi)
 {
-	long count = NM_I(sbi)->nat_cnt - NM_I(sbi)->dirty_nat_cnt;
-
-	return count > 0 ? count : 0;
+	return NM_I(sbi)->nat_cnt[RECLAIMABLE_NAT];
 }
 
 static unsigned long __count_free_nids(struct f2fs_sb_info *sbi)
-- 
2.27.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
