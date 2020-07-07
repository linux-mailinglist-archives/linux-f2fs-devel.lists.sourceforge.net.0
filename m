Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 400D92164E9
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  7 Jul 2020 05:51:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jseeD-0003s2-F7; Tue, 07 Jul 2020 03:51:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jseeC-0003rv-HC
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 07 Jul 2020 03:51:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MPljBwGUBNEQaUcCbfwaFTrKcxaOekNYcwzYjeVQZjQ=; b=RW/0ADt3tn8SiRhW/HzzWWxcSS
 ufz1+VGc955AAtZ+2u99qntQgbGxIsGKQXj1UiwiAY6JGT/xPaLcRLByaiFsT5PlMvxxuniKx7AhQ
 o9QaXXBqw1ydmo/Ug7jpQHNnpnMHUBE63T+A6qaOPo/dkmxWMVzxvKlRLXqo0tRTzFLA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MPljBwGUBNEQaUcCbfwaFTrKcxaOekNYcwzYjeVQZjQ=; b=OofDjr2DQgnQbKOExiXqppSNqu
 UvdNgpUwLLfaoI93rQw+EwfWYm8wVn3gNZ/3aBkZ1jbtJRhpS/588mgXno9hLjicLErvdkKFGOxyv
 x52IiuKeGDchY93bZmnmd9IO3gU6adjf0TzPZ99YoEi61H6gqra0BUHCR2XzGhotsPSU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jsee4-009qK8-Fb
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 07 Jul 2020 03:51:56 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0C14820702;
 Tue,  7 Jul 2020 03:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594093903;
 bh=n3QaN/AcOarhci8t0/aAOujv5BQ+QU2vLdZDKjo8yfk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kfNDkPXXzQAlT/KXnmCa4j7fEy1nG2HtYt0oE6Jnw3IQL9XTyKinomuslweNL/b+K
 abc+/CxTAF5tdT60zQNAdozBC404Xir7/MzaBwCpIzzVGKRsGMc9ZC4vFPN1JN5tFy
 1W8VE8AMi5/Yx0JlzkbPWT6B1tHQggAebwv1u/7Y=
Date: Mon, 6 Jul 2020 20:51:42 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200707035142.GB3142230@google.com>
References: <20200630100428.19105-1-yuchao0@huawei.com>
 <20200707032106.GA3139161@google.com>
 <f0aee719-1ead-f816-52ec-9f1f913495fa@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f0aee719-1ead-f816-52ec-9f1f913495fa@huawei.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jsee4-009qK8-Fb
Subject: Re: [f2fs-dev] [PATCH RFC 1/5] f2fs: introduce inmem curseg
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

On 07/07, Chao Yu wrote:
> On 2020/7/7 11:21, Jaegeuk Kim wrote:
> > Hi Chao,
> > 
> > Do you have any brief design doc to present the idea?
> 
> Hi Jaegeuk,
> 
> You mean this whole patchset, right?
> 
> I can add a brief design description in patch 0/5.

Yeah, it's a bit hard to understand the whole flow.

Thanks,

> 
> > 
> > Thanks,
> > 
> > On 06/30, Chao Yu wrote:
> >> Previous implementation of aligned pinfile allocation will:
> >> - allocate new segment on cold data log no matter whether last used
> >> segment is partially used or not, it makes IOs more random;
> >> - force concurrent cold data/GCed IO going into warm data area, it
> >> can make a bad effect on hot/cold data separation;
> >>
> >> In this patch, we introduce a new type of log named 'inmem curseg',
> >> the differents from normal curseg is:
> >> - it reuses existed segment type (CURSEG_XXX_NODE/DATA);
> >> - it only exists in memory, its segno, blkofs, summary will not b
> >>  persisted into checkpoint area;
> >>
> >> With this new feature, we can enhance scalability of log, special
> >> allocators can be created for purposes:
> >> - pure lfs allocator for aligned pinfile allocation or file
> >> defragmentation
> >> - pure ssr allocator for later feature
> >>
> >> So that, let's update aligned pinfile allocation to use this new
> >> inmem curseg fwk.
> >>
> >> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> >> ---
> >>  fs/f2fs/checkpoint.c |   7 ++-
> >>  fs/f2fs/debug.c      |   6 ++-
> >>  fs/f2fs/f2fs.h       |  12 +++--
> >>  fs/f2fs/file.c       |   3 +-
> >>  fs/f2fs/gc.c         |   2 +-
> >>  fs/f2fs/segment.c    | 107 ++++++++++++++++++++++++++++++-------------
> >>  fs/f2fs/segment.h    |  17 ++++---
> >>  fs/f2fs/super.c      |   9 ++--
> >>  8 files changed, 112 insertions(+), 51 deletions(-)
> >>
> >> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> >> index 1bb8278a1c4a..644a914af25a 100644
> >> --- a/fs/f2fs/checkpoint.c
> >> +++ b/fs/f2fs/checkpoint.c
> >> @@ -1623,11 +1623,16 @@ int f2fs_write_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
> >>  
> >>  	f2fs_flush_sit_entries(sbi, cpc);
> >>  
> >> +	/* save inmem log status */
> >> +	f2fs_save_inmem_curseg(sbi, CURSEG_COLD_DATA_PINNED);
> >> +
> >>  	err = do_checkpoint(sbi, cpc);
> >>  	if (err)
> >>  		f2fs_release_discard_addrs(sbi);
> >>  	else
> >>  		f2fs_clear_prefree_segments(sbi, cpc);
> >> +
> >> +	f2fs_restore_inmem_curseg(sbi, CURSEG_COLD_DATA_PINNED);
> >>  stop:
> >>  	unblock_operations(sbi);
> >>  	stat_inc_cp_count(sbi->stat_info);
> >> @@ -1658,7 +1663,7 @@ void f2fs_init_ino_entry_info(struct f2fs_sb_info *sbi)
> >>  	}
> >>  
> >>  	sbi->max_orphans = (sbi->blocks_per_seg - F2FS_CP_PACKS -
> >> -			NR_CURSEG_TYPE - __cp_payload(sbi)) *
> >> +			NR_CURSEG_PERSIST_TYPE - __cp_payload(sbi)) *
> >>  				F2FS_ORPHANS_PER_BLOCK;
> >>  }
> >>  
> >> diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
> >> index 4276c0f79beb..41a91aa8c262 100644
> >> --- a/fs/f2fs/debug.c
> >> +++ b/fs/f2fs/debug.c
> >> @@ -164,7 +164,7 @@ static void update_general_status(struct f2fs_sb_info *sbi)
> >>  		* 100 / (int)(sbi->user_block_count >> sbi->log_blocks_per_seg)
> >>  		/ 2;
> >>  	si->util_invalid = 50 - si->util_free - si->util_valid;
> >> -	for (i = CURSEG_HOT_DATA; i <= CURSEG_COLD_NODE; i++) {
> >> +	for (i = CURSEG_HOT_DATA; i < NO_CHECK_TYPE; i++) {
> >>  		struct curseg_info *curseg = CURSEG_I(sbi, i);
> >>  		si->curseg[i] = curseg->segno;
> >>  		si->cursec[i] = GET_SEC_FROM_SEG(sbi, curseg->segno);
> >> @@ -393,6 +393,10 @@ static int stat_show(struct seq_file *s, void *v)
> >>  			   si->dirty_seg[CURSEG_COLD_NODE],
> >>  			   si->full_seg[CURSEG_COLD_NODE],
> >>  			   si->valid_blks[CURSEG_COLD_NODE]);
> >> +		seq_printf(s, "  - Pinned file: %8d %8d %8d\n",
> >> +			   si->curseg[CURSEG_COLD_DATA_PINNED],
> >> +			   si->cursec[CURSEG_COLD_DATA_PINNED],
> >> +			   si->curzone[CURSEG_COLD_DATA_PINNED]);
> >>  		seq_printf(s, "\n  - Valid: %d\n  - Dirty: %d\n",
> >>  			   si->main_area_segs - si->dirty_count -
> >>  			   si->prefree_count - si->free_segs,
> >> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> >> index 7d6c5f8ce16b..f06c77066284 100644
> >> --- a/fs/f2fs/f2fs.h
> >> +++ b/fs/f2fs/f2fs.h
> >> @@ -996,7 +996,9 @@ static inline void set_new_dnode(struct dnode_of_data *dn, struct inode *inode,
> >>   */
> >>  #define	NR_CURSEG_DATA_TYPE	(3)
> >>  #define NR_CURSEG_NODE_TYPE	(3)
> >> -#define NR_CURSEG_TYPE	(NR_CURSEG_DATA_TYPE + NR_CURSEG_NODE_TYPE)
> >> +#define NR_CURSEG_INMEM_TYPE	(1)
> >> +#define NR_CURSEG_PERSIST_TYPE	(NR_CURSEG_DATA_TYPE + NR_CURSEG_NODE_TYPE)
> >> +#define NR_CURSEG_TYPE		(NR_CURSEG_INMEM_TYPE + NR_CURSEG_PERSIST_TYPE)
> >>  
> >>  enum {
> >>  	CURSEG_HOT_DATA	= 0,	/* directory entry blocks */
> >> @@ -1005,8 +1007,10 @@ enum {
> >>  	CURSEG_HOT_NODE,	/* direct node blocks of directory files */
> >>  	CURSEG_WARM_NODE,	/* direct node blocks of normal files */
> >>  	CURSEG_COLD_NODE,	/* indirect node blocks */
> >> -	NO_CHECK_TYPE,
> >> -	CURSEG_COLD_DATA_PINNED,/* cold data for pinned file */
> >> +	NR_PERSISTENT_LOG,	/* number of persistent log */
> >> +	CURSEG_COLD_DATA_PINNED = NR_PERSISTENT_LOG,
> >> +				/* pinned file that needs consecutive block address */
> >> +	NO_CHECK_TYPE,		/* number of persistent & inmem log */
> >>  };
> >>  
> >>  struct flush_cmd {
> >> @@ -3359,6 +3363,8 @@ block_t f2fs_get_unusable_blocks(struct f2fs_sb_info *sbi);
> >>  int f2fs_disable_cp_again(struct f2fs_sb_info *sbi, block_t unusable);
> >>  void f2fs_release_discard_addrs(struct f2fs_sb_info *sbi);
> >>  int f2fs_npages_for_summary_flush(struct f2fs_sb_info *sbi, bool for_ra);
> >> +void f2fs_save_inmem_curseg(struct f2fs_sb_info *sbi, int type);
> >> +void f2fs_restore_inmem_curseg(struct f2fs_sb_info *sbi, int type);
> >>  void f2fs_allocate_segment_for_resize(struct f2fs_sb_info *sbi, int type,
> >>  					unsigned int start, unsigned int end);
> >>  void f2fs_allocate_new_segment(struct f2fs_sb_info *sbi, int type);
> >> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> >> index c10e82806c2a..8611ade06018 100644
> >> --- a/fs/f2fs/file.c
> >> +++ b/fs/f2fs/file.c
> >> @@ -1656,13 +1656,14 @@ static int expand_inode_data(struct inode *inode, loff_t offset,
> >>  		}
> >>  
> >>  		down_write(&sbi->pin_sem);
> >> -		map.m_seg_type = CURSEG_COLD_DATA_PINNED;
> >>  
> >>  		f2fs_lock_op(sbi);
> >>  		f2fs_allocate_new_segment(sbi, CURSEG_COLD_DATA);
> >>  		f2fs_unlock_op(sbi);
> >>  
> >> +		map.m_seg_type = CURSEG_COLD_DATA_PINNED;
> >>  		err = f2fs_map_blocks(inode, &map, 1, F2FS_GET_BLOCK_PRE_DIO);
> >> +
> >>  		up_write(&sbi->pin_sem);
> >>  
> >>  		done += map.m_len;
> >> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> >> index 3b718da69910..84807abe4e00 100644
> >> --- a/fs/f2fs/gc.c
> >> +++ b/fs/f2fs/gc.c
> >> @@ -1448,7 +1448,7 @@ static int free_segment_range(struct f2fs_sb_info *sbi,
> >>  	mutex_unlock(&DIRTY_I(sbi)->seglist_lock);
> >>  
> >>  	/* Move out cursegs from the target range */
> >> -	for (type = CURSEG_HOT_DATA; type < NR_CURSEG_TYPE; type++)
> >> +	for (type = CURSEG_HOT_DATA; type < NR_CURSEG_PERSIST_TYPE; type++)
> >>  		f2fs_allocate_segment_for_resize(sbi, type, start, end);
> >>  
> >>  	/* do GC to move out valid blocks in the range */
> >> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> >> index 5924b3965ae4..863ec6f1fb87 100644
> >> --- a/fs/f2fs/segment.c
> >> +++ b/fs/f2fs/segment.c
> >> @@ -1958,7 +1958,7 @@ static void set_prefree_as_free_segments(struct f2fs_sb_info *sbi)
> >>  
> >>  	mutex_lock(&dirty_i->seglist_lock);
> >>  	for_each_set_bit(segno, dirty_i->dirty_segmap[PRE], MAIN_SEGS(sbi))
> >> -		__set_test_and_free(sbi, segno);
> >> +		__set_test_and_free(sbi, segno, false);
> >>  	mutex_unlock(&dirty_i->seglist_lock);
> >>  }
> >>  
> >> @@ -2496,6 +2496,7 @@ static void reset_curseg(struct f2fs_sb_info *sbi, int type, int modified)
> >>  	struct curseg_info *curseg = CURSEG_I(sbi, type);
> >>  	struct summary_footer *sum_footer;
> >>  
> >> +	curseg->inited = true;
> >>  	curseg->segno = curseg->next_segno;
> >>  	curseg->zone = GET_ZONE_FROM_SEG(sbi, curseg->segno);
> >>  	curseg->next_blkoff = 0;
> >> @@ -2503,24 +2504,31 @@ static void reset_curseg(struct f2fs_sb_info *sbi, int type, int modified)
> >>  
> >>  	sum_footer = &(curseg->sum_blk->footer);
> >>  	memset(sum_footer, 0, sizeof(struct summary_footer));
> >> -	if (IS_DATASEG(type))
> >> +	if (IS_DATASEG(curseg->seg_type))
> >>  		SET_SUM_TYPE(sum_footer, SUM_TYPE_DATA);
> >> -	if (IS_NODESEG(type))
> >> +	if (IS_NODESEG(curseg->seg_type))
> >>  		SET_SUM_TYPE(sum_footer, SUM_TYPE_NODE);
> >> -	__set_sit_entry_type(sbi, type, curseg->segno, modified);
> >> +	__set_sit_entry_type(sbi, curseg->seg_type, curseg->segno, modified);
> >>  }
> >>  
> >>  static unsigned int __get_next_segno(struct f2fs_sb_info *sbi, int type)
> >>  {
> >> +	struct curseg_info *curseg = CURSEG_I(sbi, type);
> >> +
> >>  	/* if segs_per_sec is large than 1, we need to keep original policy. */
> >>  	if (__is_large_section(sbi))
> >> -		return CURSEG_I(sbi, type)->segno;
> >> +		return curseg->segno;
> >> +
> >> +	/* inmem log may not locate on any segment after mount */
> >> +	if (!curseg->inited)
> >> +		return 0;
> >>  
> >>  	if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED)))
> >>  		return 0;
> >>  
> >>  	if (test_opt(sbi, NOHEAP) &&
> >> -		(type == CURSEG_HOT_DATA || IS_NODESEG(type)))
> >> +		(curseg->seg_type == CURSEG_HOT_DATA ||
> >> +		IS_NODESEG(curseg->seg_type)))
> >>  		return 0;
> >>  
> >>  	if (SIT_I(sbi)->last_victim[ALLOC_NEXT])
> >> @@ -2530,7 +2538,7 @@ static unsigned int __get_next_segno(struct f2fs_sb_info *sbi, int type)
> >>  	if (F2FS_OPTION(sbi).alloc_mode == ALLOC_MODE_REUSE)
> >>  		return 0;
> >>  
> >> -	return CURSEG_I(sbi, type)->segno;
> >> +	return curseg->segno;
> >>  }
> >>  
> >>  /*
> >> @@ -2540,12 +2548,14 @@ static unsigned int __get_next_segno(struct f2fs_sb_info *sbi, int type)
> >>  static void new_curseg(struct f2fs_sb_info *sbi, int type, bool new_sec)
> >>  {
> >>  	struct curseg_info *curseg = CURSEG_I(sbi, type);
> >> +	unsigned short seg_type = curseg->seg_type;
> >>  	unsigned int segno = curseg->segno;
> >>  	int dir = ALLOC_LEFT;
> >>  
> >> -	write_sum_page(sbi, curseg->sum_blk,
> >> +	if (curseg->inited)
> >> +		write_sum_page(sbi, curseg->sum_blk,
> >>  				GET_SUM_BLOCK(sbi, segno));
> >> -	if (type == CURSEG_WARM_DATA || type == CURSEG_COLD_DATA)
> >> +	if (seg_type == CURSEG_WARM_DATA || seg_type == CURSEG_COLD_DATA)
> >>  		dir = ALLOC_RIGHT;
> >>  
> >>  	if (test_opt(sbi, NOHEAP))
> >> @@ -2622,6 +2632,43 @@ static void change_curseg(struct f2fs_sb_info *sbi, int type)
> >>  	f2fs_put_page(sum_page, 1);
> >>  }
> >>  
> >> +void f2fs_save_inmem_curseg(struct f2fs_sb_info *sbi, int type)
> >> +{
> >> +	struct curseg_info *curseg = CURSEG_I(sbi, type);
> >> +
> >> +	mutex_lock(&curseg->curseg_mutex);
> >> +	if (!curseg->inited)
> >> +		goto out;
> >> +
> >> +	if (get_valid_blocks(sbi, curseg->segno, false)) {
> >> +		write_sum_page(sbi, curseg->sum_blk,
> >> +				GET_SUM_BLOCK(sbi, curseg->segno));
> >> +	} else {
> >> +		mutex_lock(&DIRTY_I(sbi)->seglist_lock);
> >> +		__set_test_and_free(sbi, curseg->segno, true);
> >> +		mutex_unlock(&DIRTY_I(sbi)->seglist_lock);
> >> +	}
> >> +out:
> >> +	mutex_unlock(&curseg->curseg_mutex);
> >> +}
> >> +
> >> +void f2fs_restore_inmem_curseg(struct f2fs_sb_info *sbi, int type)
> >> +{
> >> +	struct curseg_info *curseg = CURSEG_I(sbi, type);
> >> +
> >> +	mutex_lock(&curseg->curseg_mutex);
> >> +	if (!curseg->inited)
> >> +		goto out;
> >> +	if (get_valid_blocks(sbi, curseg->segno, false))
> >> +		goto out;
> >> +
> >> +	mutex_lock(&DIRTY_I(sbi)->seglist_lock);
> >> +	__set_test_and_inuse(sbi, curseg->segno);
> >> +	mutex_unlock(&DIRTY_I(sbi)->seglist_lock);
> >> +out:
> >> +	mutex_unlock(&curseg->curseg_mutex);
> >> +}
> >> +
> >>  static int get_ssr_segment(struct f2fs_sb_info *sbi, int type)
> >>  {
> >>  	struct curseg_info *curseg = CURSEG_I(sbi, type);
> >> @@ -2738,11 +2785,15 @@ void __allocate_new_segment(struct f2fs_sb_info *sbi, int type)
> >>  	struct curseg_info *curseg = CURSEG_I(sbi, type);
> >>  	unsigned int old_segno;
> >>  
> >> +	if (!curseg->inited)
> >> +		goto alloc;
> >> +
> >>  	if (!curseg->next_blkoff &&
> >>  		!get_valid_blocks(sbi, curseg->segno, false) &&
> >>  		!get_ckpt_valid_blocks(sbi, curseg->segno))
> >>  		return;
> >>  
> >> +alloc:
> >>  	old_segno = curseg->segno;
> >>  	SIT_I(sbi)->s_ops->allocate_segment(sbi, type, true);
> >>  	locate_dirty_segment(sbi, old_segno);
> >> @@ -3126,19 +3177,6 @@ void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
> >>  {
> >>  	struct sit_info *sit_i = SIT_I(sbi);
> >>  	struct curseg_info *curseg = CURSEG_I(sbi, type);
> >> -	bool put_pin_sem = false;
> >> -
> >> -	if (type == CURSEG_COLD_DATA) {
> >> -		/* GC during CURSEG_COLD_DATA_PINNED allocation */
> >> -		if (down_read_trylock(&sbi->pin_sem)) {
> >> -			put_pin_sem = true;
> >> -		} else {
> >> -			type = CURSEG_WARM_DATA;
> >> -			curseg = CURSEG_I(sbi, type);
> >> -		}
> >> -	} else if (type == CURSEG_COLD_DATA_PINNED) {
> >> -		type = CURSEG_COLD_DATA;
> >> -	}
> >>  
> >>  	down_read(&SM_I(sbi)->curseg_lock);
> >>  
> >> @@ -3204,9 +3242,6 @@ void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
> >>  	mutex_unlock(&curseg->curseg_mutex);
> >>  
> >>  	up_read(&SM_I(sbi)->curseg_lock);
> >> -
> >> -	if (put_pin_sem)
> >> -		up_read(&sbi->pin_sem);
> >>  }
> >>  
> >>  static void update_device_state(struct f2fs_io_info *fio)
> >> @@ -3574,7 +3609,7 @@ static int read_normal_summaries(struct f2fs_sb_info *sbi, int type)
> >>  		blk_off = le16_to_cpu(ckpt->cur_data_blkoff[type -
> >>  							CURSEG_HOT_DATA]);
> >>  		if (__exist_node_summaries(sbi))
> >> -			blk_addr = sum_blk_addr(sbi, NR_CURSEG_TYPE, type);
> >> +			blk_addr = sum_blk_addr(sbi, NR_CURSEG_PERSIST_TYPE, type);
> >>  		else
> >>  			blk_addr = sum_blk_addr(sbi, NR_CURSEG_DATA_TYPE, type);
> >>  	} else {
> >> @@ -3652,8 +3687,9 @@ static int restore_curseg_summaries(struct f2fs_sb_info *sbi)
> >>  	}
> >>  
> >>  	if (__exist_node_summaries(sbi))
> >> -		f2fs_ra_meta_pages(sbi, sum_blk_addr(sbi, NR_CURSEG_TYPE, type),
> >> -					NR_CURSEG_TYPE - type, META_CP, true);
> >> +		f2fs_ra_meta_pages(sbi,
> >> +				sum_blk_addr(sbi, NR_CURSEG_PERSIST_TYPE, type),
> >> +				NR_CURSEG_PERSIST_TYPE - type, META_CP, true);
> >>  
> >>  	for (; type <= CURSEG_COLD_NODE; type++) {
> >>  		err = read_normal_summaries(sbi, type);
> >> @@ -4155,14 +4191,14 @@ static int build_curseg(struct f2fs_sb_info *sbi)
> >>  	struct curseg_info *array;
> >>  	int i;
> >>  
> >> -	array = f2fs_kzalloc(sbi, array_size(NR_CURSEG_TYPE, sizeof(*array)),
> >> -			     GFP_KERNEL);
> >> +	array = f2fs_kzalloc(sbi, array_size(NR_CURSEG_TYPE,
> >> +					sizeof(*array)), GFP_KERNEL);
> >>  	if (!array)
> >>  		return -ENOMEM;
> >>  
> >>  	SM_I(sbi)->curseg_array = array;
> >>  
> >> -	for (i = 0; i < NR_CURSEG_TYPE; i++) {
> >> +	for (i = 0; i < NO_CHECK_TYPE; i++) {
> >>  		mutex_init(&array[i].curseg_mutex);
> >>  		array[i].sum_blk = f2fs_kzalloc(sbi, PAGE_SIZE, GFP_KERNEL);
> >>  		if (!array[i].sum_blk)
> >> @@ -4172,8 +4208,13 @@ static int build_curseg(struct f2fs_sb_info *sbi)
> >>  				sizeof(struct f2fs_journal), GFP_KERNEL);
> >>  		if (!array[i].journal)
> >>  			return -ENOMEM;
> >> +		if (i < NR_PERSISTENT_LOG)
> >> +			array[i].seg_type = CURSEG_HOT_DATA + i;
> >> +		else if (i == CURSEG_COLD_DATA_PINNED)
> >> +			array[i].seg_type = CURSEG_COLD_DATA;
> >>  		array[i].segno = NULL_SEGNO;
> >>  		array[i].next_blkoff = 0;
> >> +		array[i].inited = false;
> >>  	}
> >>  	return restore_curseg_summaries(sbi);
> >>  }
> >> @@ -4408,7 +4449,7 @@ static int sanity_check_curseg(struct f2fs_sb_info *sbi)
> >>  	 * In LFS/SSR curseg, .next_blkoff should point to an unused blkaddr;
> >>  	 * In LFS curseg, all blkaddr after .next_blkoff should be unused.
> >>  	 */
> >> -	for (i = 0; i < NO_CHECK_TYPE; i++) {
> >> +	for (i = 0; i < NR_PERSISTENT_LOG; i++) {
> >>  		struct curseg_info *curseg = CURSEG_I(sbi, i);
> >>  		struct seg_entry *se = get_seg_entry(sbi, curseg->segno);
> >>  		unsigned int blkofs = curseg->next_blkoff;
> >> @@ -4637,7 +4678,7 @@ int f2fs_fix_curseg_write_pointer(struct f2fs_sb_info *sbi)
> >>  {
> >>  	int i, ret;
> >>  
> >> -	for (i = 0; i < NO_CHECK_TYPE; i++) {
> >> +	for (i = 0; i < NR_PERSISTENT_LOG; i++) {
> >>  		ret = fix_curseg_write_pointer(sbi, i);
> >>  		if (ret)
> >>  			return ret;
> >> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> >> index f261e3e6a69b..8ff261550cbb 100644
> >> --- a/fs/f2fs/segment.h
> >> +++ b/fs/f2fs/segment.h
> >> @@ -22,7 +22,7 @@
> >>  #define GET_R2L_SEGNO(free_i, segno)	((segno) + (free_i)->start_segno)
> >>  
> >>  #define IS_DATASEG(t)	((t) <= CURSEG_COLD_DATA)
> >> -#define IS_NODESEG(t)	((t) >= CURSEG_HOT_NODE)
> >> +#define IS_NODESEG(t)	((t) >= CURSEG_HOT_NODE && (t) <= CURSEG_COLD_NODE)
> >>  
> >>  #define IS_HOT(t)	((t) == CURSEG_HOT_NODE || (t) == CURSEG_HOT_DATA)
> >>  #define IS_WARM(t)	((t) == CURSEG_WARM_NODE || (t) == CURSEG_WARM_DATA)
> >> @@ -34,7 +34,8 @@
> >>  	 ((seg) == CURSEG_I(sbi, CURSEG_COLD_DATA)->segno) ||	\
> >>  	 ((seg) == CURSEG_I(sbi, CURSEG_HOT_NODE)->segno) ||	\
> >>  	 ((seg) == CURSEG_I(sbi, CURSEG_WARM_NODE)->segno) ||	\
> >> -	 ((seg) == CURSEG_I(sbi, CURSEG_COLD_NODE)->segno))
> >> +	 ((seg) == CURSEG_I(sbi, CURSEG_COLD_NODE)->segno) ||	\
> >> +	 ((seg) == CURSEG_I(sbi, CURSEG_COLD_DATA_PINNED)->segno))
> >>  
> >>  #define IS_CURSEC(sbi, secno)						\
> >>  	(((secno) == CURSEG_I(sbi, CURSEG_HOT_DATA)->segno /		\
> >> @@ -48,7 +49,9 @@
> >>  	 ((secno) == CURSEG_I(sbi, CURSEG_WARM_NODE)->segno /		\
> >>  	  (sbi)->segs_per_sec) ||	\
> >>  	 ((secno) == CURSEG_I(sbi, CURSEG_COLD_NODE)->segno /		\
> >> -	  (sbi)->segs_per_sec))	\
> >> +	  (sbi)->segs_per_sec) ||	\
> >> +	 ((secno) == CURSEG_I(sbi, CURSEG_COLD_DATA_PINNED)->segno /	\
> >> +	  (sbi)->segs_per_sec))
> >>  
> >>  #define MAIN_BLKADDR(sbi)						\
> >>  	(SM_I(sbi) ? SM_I(sbi)->main_blkaddr : 				\
> >> @@ -288,10 +291,12 @@ struct curseg_info {
> >>  	struct rw_semaphore journal_rwsem;	/* protect journal area */
> >>  	struct f2fs_journal *journal;		/* cached journal info */
> >>  	unsigned char alloc_type;		/* current allocation type */
> >> +	unsigned short seg_type;		/* segment type like CURSEG_XXX_TYPE */
> >>  	unsigned int segno;			/* current segment number */
> >>  	unsigned short next_blkoff;		/* next block offset to write */
> >>  	unsigned int zone;			/* current zone number */
> >>  	unsigned int next_segno;		/* preallocated segment */
> >> +	bool inited;				/* indicate inmem log is inited */
> >>  };
> >>  
> >>  struct sit_entry_set {
> >> @@ -305,8 +310,6 @@ struct sit_entry_set {
> >>   */
> >>  static inline struct curseg_info *CURSEG_I(struct f2fs_sb_info *sbi, int type)
> >>  {
> >> -	if (type == CURSEG_COLD_DATA_PINNED)
> >> -		type = CURSEG_COLD_DATA;
> >>  	return (struct curseg_info *)(SM_I(sbi)->curseg_array + type);
> >>  }
> >>  
> >> @@ -438,7 +441,7 @@ static inline void __set_inuse(struct f2fs_sb_info *sbi,
> >>  }
> >>  
> >>  static inline void __set_test_and_free(struct f2fs_sb_info *sbi,
> >> -		unsigned int segno)
> >> +		unsigned int segno, bool inmem)
> >>  {
> >>  	struct free_segmap_info *free_i = FREE_I(sbi);
> >>  	unsigned int secno = GET_SEC_FROM_SEG(sbi, segno);
> >> @@ -449,7 +452,7 @@ static inline void __set_test_and_free(struct f2fs_sb_info *sbi,
> >>  	if (test_and_clear_bit(segno, free_i->free_segmap)) {
> >>  		free_i->free_segments++;
> >>  
> >> -		if (IS_CURSEC(sbi, secno))
> >> +		if (!inmem && IS_CURSEC(sbi, secno))
> >>  			goto skip_free;
> >>  		next = find_next_bit(free_i->free_segmap,
> >>  				start_segno + sbi->segs_per_sec, start_segno);
> >> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> >> index 80cb7cd358f8..0fefa130585f 100644
> >> --- a/fs/f2fs/super.c
> >> +++ b/fs/f2fs/super.c
> >> @@ -575,7 +575,8 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
> >>  		case Opt_active_logs:
> >>  			if (args->from && match_int(args, &arg))
> >>  				return -EINVAL;
> >> -			if (arg != 2 && arg != 4 && arg != NR_CURSEG_TYPE)
> >> +			if (arg != 2 && arg != 4 &&
> >> +				arg != NR_CURSEG_PERSIST_TYPE)
> >>  				return -EINVAL;
> >>  			F2FS_OPTION(sbi).active_logs = arg;
> >>  			break;
> >> @@ -981,7 +982,7 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
> >>  	}
> >>  
> >>  	/* Not pass down write hints if the number of active logs is lesser
> >> -	 * than NR_CURSEG_TYPE.
> >> +	 * than NR_CURSEG_PERSIST_TYPE.
> >>  	 */
> >>  	if (F2FS_OPTION(sbi).active_logs != NR_CURSEG_TYPE)
> >>  		F2FS_OPTION(sbi).whint_mode = WHINT_MODE_OFF;
> >> @@ -1614,7 +1615,7 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
> >>  static void default_options(struct f2fs_sb_info *sbi)
> >>  {
> >>  	/* init some FS parameters */
> >> -	F2FS_OPTION(sbi).active_logs = NR_CURSEG_TYPE;
> >> +	F2FS_OPTION(sbi).active_logs = NR_CURSEG_PERSIST_TYPE;
> >>  	F2FS_OPTION(sbi).inline_xattr_size = DEFAULT_INLINE_XATTR_ADDRS;
> >>  	F2FS_OPTION(sbi).whint_mode = WHINT_MODE_OFF;
> >>  	F2FS_OPTION(sbi).alloc_mode = ALLOC_MODE_DEFAULT;
> >> @@ -2946,7 +2947,7 @@ int f2fs_sanity_check_ckpt(struct f2fs_sb_info *sbi)
> >>  	cp_payload = __cp_payload(sbi);
> >>  	if (cp_pack_start_sum < cp_payload + 1 ||
> >>  		cp_pack_start_sum > blocks_per_seg - 1 -
> >> -			NR_CURSEG_TYPE) {
> >> +			NR_CURSEG_PERSIST_TYPE) {
> >>  		f2fs_err(sbi, "Wrong cp_pack_start_sum: %u",
> >>  			 cp_pack_start_sum);
> >>  		return 1;
> >> -- 
> >> 2.26.2
> > .
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
