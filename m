Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6310D2CD0AD
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Dec 2020 09:02:44 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kkjZX-0007mQ-HT; Thu, 03 Dec 2020 08:02:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1kkjYS-0007i0-C2
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Dec 2020 08:01:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8lV4UbsWOaYzcgvpgM6UaRNTfVDnGCE3rEFbmCIfNZk=; b=H0NLf8ra6Rjgs6X6OlQOZHbkO1
 UPujEgtNN5xunn2xppPulQCfEKgO+nw0G6GnBidvRhmkoVrZhWPhQHjcrIhj8fXGtW+wq70LAF+Gd
 ICKRi3dZWjt25iUnVPz5EUqVuuB+xYx4oMYZVGEA5aNavm/peWa+ySD2juNC2vBvqA5w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8lV4UbsWOaYzcgvpgM6UaRNTfVDnGCE3rEFbmCIfNZk=; b=PdfgwH0AHjV9EKUX1B03/dXjqJ
 5s5Z8s4Xhm2acnpm4XPJzqYduXl0LzUkpYKJPNGtgrqAP1es2U9BkKxe3Gy1QiQ1p6D6LpEqQWUIt
 TkLqwvCFSzPxRLMw2VpazT3jVCbIPBNcNHJjWTnjdFw38TBU6yT3hOT3lx2dLULcjLOg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kkjTB-00CvyE-43
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Dec 2020 07:56:15 +0000
Date: Wed, 2 Dec 2020 23:55:52 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1606982154;
 bh=rz02GCgewfm55sL5cZJTThh4AAN8pUvV+L7FrS0PPb4=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=Jsy0lxiNLYPSX8cD6X344gl/fq7SP61RmodhRySWLSW8F8YRq8TKeDbSX8ABX4glr
 tydWpI7moDT7Cc5mKANdm44Git3NJH3Yikss59VcDAdS3PyETZbdXb9DYAqYyZkumS
 rAkHc+SuWtlx3qr18WW4JpOk6eoCTfvjYwk3nYvtRdRwoioY5HFRWMdLGRBFl+QTOC
 nCtKqh8Pe7iDJI8BWLeOTVSHsvgqBJyZ0XUEDArR4Z84XJdWQWSsnwI6Luq7Rex4KF
 sFXzp40nY3YXbogrmA1PixTNPGFFzq+tVdMPe6s8TFPAw/z0yH/tric7J8ZFZlhgDT
 4K2m6X8duYxSg==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <X8iaCHmmCQzzJdu3@google.com>
References: <20201109170012.2129411-1-jaegeuk@kernel.org>
 <20201112053414.GB3826485@google.com>
 <20201112054051.GA4092972@google.com> <X8iAh7quYw77O6XC@google.com>
 <df364dab-6640-654b-c36e-3f84f4bcbc2b@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <df364dab-6640-654b-c36e-3f84f4bcbc2b@huawei.com>
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kkjTB-00CvyE-43
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: avoid race condition for shinker
 count
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
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org,
 Light Hsieh <Light.Hsieh@mediatek.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 12/03, Chao Yu wrote:
> On 2020/12/3 14:07, Jaegeuk Kim wrote:
> > On 11/11, Jaegeuk Kim wrote:
> > > Light reported sometimes shinker gets nat_cnt < dirty_nat_cnt resulting in
> > > wrong do_shinker work. Let's avoid to get stale data by using nat_tree_lock.
> > > 
> > > Reported-by: Light Hsieh <Light.Hsieh@mediatek.com>
> > > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > > ---
> > > v3:
> > >   - fix to use NM_I(sbi)
> > > 
> > >   fs/f2fs/shrinker.c | 6 +++++-
> > >   1 file changed, 5 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/fs/f2fs/shrinker.c b/fs/f2fs/shrinker.c
> > > index d66de5999a26..555712ba06d8 100644
> > > --- a/fs/f2fs/shrinker.c
> > > +++ b/fs/f2fs/shrinker.c
> > > @@ -18,7 +18,11 @@ static unsigned int shrinker_run_no;
> > >   static unsigned long __count_nat_entries(struct f2fs_sb_info *sbi)
> > >   {
> > > -	long count = NM_I(sbi)->nat_cnt - NM_I(sbi)->dirty_nat_cnt;
> > > +	long count;
> > > +
> > > +	down_read(&NM_I(sbi)->nat_tree_lock);
> > > +	count = NM_I(sbi)->nat_cnt - NM_I(sbi)->dirty_nat_cnt;
> > > +	up_read(&NM_I(sbi)->nat_tree_lock);
> > 
> > I just fosund this can give kernel hang due to the following backtrace.
> > f2fs_shrink_count
> > shrink_slab
> > shrink_node
> > do_try_to_free_pages
> > try_to_free_pages
> > __alloc_pages_nodemask
> > alloc_pages_current
> > allocate_slab
> > __slab_alloc
> > __slab_alloc
> > kmem_cache_alloc
> > add_free_nid
> > f2fs_flush_nat_entries
> > f2fs_write_checkpoint
> 
> Oh, I missed that case.
> 
> > 
> > Let me just check like this.
> > 
> > > From 971163330224449d90aac90957ea38f77d494f0f Mon Sep 17 00:00:00 2001
> > From: Jaegeuk Kim <jaegeuk@kernel.org>
> > Date: Fri, 6 Nov 2020 13:22:05 -0800
> > Subject: [PATCH] f2fs: avoid race condition for shrinker count
> > 
> > Light reported sometimes shinker gets nat_cnt < dirty_nat_cnt resulting in
> > wrong do_shinker work. Let's avoid to return insane overflowed value.
> > 
> > Reported-by: Light Hsieh <Light.Hsieh@mediatek.com>
> > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > ---
> >   fs/f2fs/shrinker.c | 6 +++---
> >   1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/fs/f2fs/shrinker.c b/fs/f2fs/shrinker.c
> > index d66de5999a26..75b5b4aaed99 100644
> > --- a/fs/f2fs/shrinker.c
> > +++ b/fs/f2fs/shrinker.c
> > @@ -18,9 +18,9 @@ static unsigned int shrinker_run_no;
> >   static unsigned long __count_nat_entries(struct f2fs_sb_info *sbi)
> >   {
> > -	long count = NM_I(sbi)->nat_cnt - NM_I(sbi)->dirty_nat_cnt;
> > -
> > -	return count > 0 ? count : 0;
> > +	if (NM_I(sbi)->nat_cnt > NM_I(sbi)->dirty_nat_cnt)
> > +		return NM_I(sbi)->nat_cnt - NM_I(sbi)->dirty_nat_cnt;
> 
> Hmm.. in the case that we are not in checkpoint progress, nat_cnt and dirty_nat_cnt
> is mutable, how can we make sure the calculation is non-negative after the check
> condition? :(

How about adding another variable to monitor it?

From bdc5a805487f0210df7ef4e85ce5a4f0471bca72 Mon Sep 17 00:00:00 2001
From: Jaegeuk Kim <jaegeuk@kernel.org>
Date: Fri, 6 Nov 2020 13:22:05 -0800
Subject: [PATCH] f2fs: avoid race condition for shrinker count

Light reported sometimes shinker gets nat_cnt < dirty_nat_cnt resulting in
wrong do_shinker work. Let's avoid to return insane overflowed value by adding
single tracking value.

Reported-by: Light Hsieh <Light.Hsieh@mediatek.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/checkpoint.c |  2 +-
 fs/f2fs/debug.c      | 11 ++++++-----
 fs/f2fs/f2fs.h       | 10 ++++++++--
 fs/f2fs/node.c       | 29 ++++++++++++++++++-----------
 fs/f2fs/node.h       |  4 ++--
 fs/f2fs/shrinker.c   |  4 +---
 6 files changed, 36 insertions(+), 24 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 14ba1519639e..617d0f6b0836 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -1619,7 +1619,7 @@ int f2fs_write_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 			goto out;
 		}
 
-		if (NM_I(sbi)->dirty_nat_cnt == 0 &&
+		if (NM_I(sbi)->nat_cnt[DIRTY_NAT] == 0 &&
 				SIT_I(sbi)->dirty_sentries == 0 &&
 				prefree_segments(sbi) == 0) {
 			f2fs_flush_sit_entries(sbi, cpc);
diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index a8357fd4f5fa..197c914119da 100644
--- a/fs/f2fs/debug.c
+++ b/fs/f2fs/debug.c
@@ -145,8 +145,8 @@ static void update_general_status(struct f2fs_sb_info *sbi)
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
@@ -278,9 +278,10 @@ static void update_mem_info(struct f2fs_sb_info *sbi)
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
index 4417f791dbc6..78394ea91717 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -818,6 +818,13 @@ enum nid_state {
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
@@ -833,8 +840,7 @@ struct f2fs_nm_info {
 	struct rw_semaphore nat_tree_lock;	/* protect nat_tree_lock */
 	struct list_head nat_entries;	/* cached nat entry list (clean) */
 	spinlock_t nat_list_lock;	/* protect clean nat entry list */
-	unsigned int nat_cnt;		/* the # of cached nat entries */
-	unsigned int dirty_nat_cnt;	/* total num of nat entries in set */
+	unsigned int nat_cnt[MAX_NAT_STATE]; /* the # of cached nat entries */
 	unsigned int nat_blocks;	/* # of nat blocks */
 
 	/* free node ids management */
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 42394de6c7eb..e65d73293a3f 100644
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
@@ -2944,14 +2948,17 @@ int f2fs_flush_nat_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc)
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
@@ -2962,7 +2969,8 @@ int f2fs_flush_nat_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 	 * into nat entry set.
 	 */
 	if (enabled_nat_bits(sbi, cpc) ||
-		!__has_cursum_space(journal, nm_i->dirty_nat_cnt, NAT_JOURNAL))
+		!__has_cursum_space(journal,
+			nm_i->nat_cnt[DIRTY_NAT], NAT_JOURNAL))
 		remove_nats_in_journal(sbi);
 
 	while ((found = __gang_lookup_nat_set(nm_i,
@@ -3086,7 +3094,6 @@ static int init_node_manager(struct f2fs_sb_info *sbi)
 						F2FS_RESERVED_NODE_NUM;
 	nm_i->nid_cnt[FREE_NID] = 0;
 	nm_i->nid_cnt[PREALLOC_NID] = 0;
-	nm_i->nat_cnt = 0;
 	nm_i->ram_thresh = DEF_RAM_THRESHOLD;
 	nm_i->ra_nid_pages = DEF_RA_NID_PAGES;
 	nm_i->dirty_nats_ratio = DEF_DIRTY_NAT_RATIO_THRESHOLD;
@@ -3220,7 +3227,7 @@ void f2fs_destroy_node_manager(struct f2fs_sb_info *sbi)
 			__del_from_nat_cache(nm_i, natvec[idx]);
 		}
 	}
-	f2fs_bug_on(sbi, nm_i->nat_cnt);
+	f2fs_bug_on(sbi, nm_i->nat_cnt[TOTAL_NAT]);
 
 	/* destroy nat set cache */
 	nid = 0;
diff --git a/fs/f2fs/node.h b/fs/f2fs/node.h
index 69e5859e993c..f84541b57acb 100644
--- a/fs/f2fs/node.h
+++ b/fs/f2fs/node.h
@@ -126,13 +126,13 @@ static inline void raw_nat_from_node_info(struct f2fs_nat_entry *raw_ne,
 
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
index d66de5999a26..dd3c3c7a90ec 100644
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
2.29.2.454.gaff20da3a2-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
