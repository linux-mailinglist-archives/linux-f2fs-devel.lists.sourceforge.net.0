Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA96E53B0
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Oct 2019 20:18:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iO4AR-0006SB-1y; Fri, 25 Oct 2019 18:18:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1iO4AP-0006Rw-RA
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 25 Oct 2019 18:18:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nW4Xxx7/ibxucUuehY9mKLfAncPLcu07Pb3XLWY0rVo=; b=P5kVkPY+NyUwqRWmNCvIVXPhMb
 RaiNkWQu62MQVu4XCxDCirA3DZjguSy1xUZa4dNvlV0TJjwvrJTYadJ5Zd7xgmcu30G7TDmg1xYzK
 0oFoDmr4HuIzCJieuWl5YkPbV5P7OPt+wZilphGqSkUeDss7YOsAFLJQod5l2aK9F86U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nW4Xxx7/ibxucUuehY9mKLfAncPLcu07Pb3XLWY0rVo=; b=JqdGWfWhBDQ/Qvod8qwEpyrHPD
 4ofATAGFKaGIsLqfXY8SSrF1yglYaUlTzlPCw2KF8t2MNNeMT23hafV7nG4tBH/ou4zw4ldurVMJB
 RRu3G6Xqf5xX9uOphfs7R2MPS+sw+9FqzC9KXAZOM6EbDddhsixhs44hn+/oGHQuSLzk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iO4AM-003Sc4-Tk
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 25 Oct 2019 18:18:29 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 405AA2084C;
 Fri, 25 Oct 2019 18:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1572027501;
 bh=QyxXeRhAn6IU09Yd9YgTaiSpiG5q2CrkU/Tx9usCv/Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ezhSn5HfO4r0cAhH0IJtvehRat2I5cSuQBxn3isfnKr1bfDqKwf9QjbXGb+qVXnzT
 JxXvO8gLaMmyVMNyWoB0pVza0/TGBaHuUZv14qJVwAkyM3ZsO8sDmh87Osb8heiI/N
 +RUJAIkOoYgf1jlmLJoLwA/YucekNPanIs6N1CX8=
Date: Fri, 25 Oct 2019 11:18:20 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20191025181820.GA24183@jaegeuk-macbookpro.roam.corp.google.com>
References: <20191022171602.93637-1-jaegeuk@kernel.org>
 <c916c749-0abe-a7b7-e748-f0c4d5599e4a@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c916c749-0abe-a7b7-e748-f0c4d5599e4a@huawei.com>
User-Agent: Mutt/1.8.2 (2017-04-18)
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iO4AM-003Sc4-Tk
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: support aligned pinned file
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

On 10/24, Chao Yu wrote:
> Hi Jaegeuk,
> 
> On 2019/10/23 1:16, Jaegeuk Kim wrote:
> > This patch supports 2MB-aligned pinned file, which can guarantee no GC at all
> > by allocating fully valid 2MB segment.
> > 
> > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > ---
> >  fs/f2fs/f2fs.h     |  4 +++-
> >  fs/f2fs/file.c     | 39 ++++++++++++++++++++++++++++++++++-----
> >  fs/f2fs/recovery.c |  2 +-
> >  fs/f2fs/segment.c  | 21 ++++++++++++++++++++-
> >  fs/f2fs/segment.h  |  2 ++
> >  fs/f2fs/super.c    |  1 +
> >  fs/f2fs/sysfs.c    |  2 ++
> >  7 files changed, 63 insertions(+), 8 deletions(-)
> > 
> > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > index ca342f4c7db1..c681f51e351b 100644
> > --- a/fs/f2fs/f2fs.h
> > +++ b/fs/f2fs/f2fs.h
> > @@ -890,6 +890,7 @@ enum {
> >  	CURSEG_WARM_NODE,	/* direct node blocks of normal files */
> >  	CURSEG_COLD_NODE,	/* indirect node blocks */
> >  	NO_CHECK_TYPE,
> > +	CURSEG_COLD_DATA_PINNED,/* cold data for pinned file */
> >  };
> >  
> >  struct flush_cmd {
> > @@ -1301,6 +1302,7 @@ struct f2fs_sb_info {
> >  
> >  	/* threshold for gc trials on pinned files */
> >  	u64 gc_pin_file_threshold;
> > +	struct rw_semaphore pin_sem;
> >  
> >  	/* maximum # of trials to find a victim segment for SSR and GC */
> >  	unsigned int max_victim_search;
> > @@ -3116,7 +3118,7 @@ void f2fs_release_discard_addrs(struct f2fs_sb_info *sbi);
> >  int f2fs_npages_for_summary_flush(struct f2fs_sb_info *sbi, bool for_ra);
> >  void allocate_segment_for_resize(struct f2fs_sb_info *sbi, int type,
> >  					unsigned int start, unsigned int end);
> > -void f2fs_allocate_new_segments(struct f2fs_sb_info *sbi);
> > +void f2fs_allocate_new_segments(struct f2fs_sb_info *sbi, int type);
> >  int f2fs_trim_fs(struct f2fs_sb_info *sbi, struct fstrim_range *range);
> >  bool f2fs_exist_trim_candidates(struct f2fs_sb_info *sbi,
> >  					struct cp_control *cpc);
> > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > index 29bc0a542759..f6c038e8a6a7 100644
> > --- a/fs/f2fs/file.c
> > +++ b/fs/f2fs/file.c
> > @@ -1545,12 +1545,41 @@ static int expand_inode_data(struct inode *inode, loff_t offset,
> >  	if (off_end)
> >  		map.m_len++;
> >  
> > -	if (f2fs_is_pinned_file(inode))
> > -		map.m_seg_type = CURSEG_COLD_DATA;
> > +	if (!map.m_len)
> > +		return 0;
> > +
> > +	if (f2fs_is_pinned_file(inode)) {
> > +		block_t len = (map.m_len >> sbi->log_blocks_per_seg) <<
> > +					sbi->log_blocks_per_seg;
> > +		block_t done = 0;
> > +
> > +		if (map.m_len % sbi->blocks_per_seg)
> > +			len += sbi->blocks_per_seg;
> >  
> > -	err = f2fs_map_blocks(inode, &map, 1, (f2fs_is_pinned_file(inode) ?
> > -						F2FS_GET_BLOCK_PRE_DIO :
> > -						F2FS_GET_BLOCK_PRE_AIO));
> > +		map.m_len = sbi->blocks_per_seg;
> > +next_alloc:
> > +		mutex_lock(&sbi->gc_mutex);
> > +		err = f2fs_gc(sbi, true, false, NULL_SEGNO);
> > +		if (err && err != -ENODATA && err != -EAGAIN)
> > +			goto out_err;
> 
> To grab enough free space?
> 
> Shouldn't we call
> 
> 	if (has_not_enough_free_secs(sbi, 0, 0)) {
> 		mutex_lock(&sbi->gc_mutex);
> 		f2fs_gc(sbi, false, false, NULL_SEGNO);
> 	}

The above calls gc all the time. Do we need this?

> 
> > +
> > +		down_write(&sbi->pin_sem);
> > +		map.m_seg_type = CURSEG_COLD_DATA_PINNED;
> > +		f2fs_allocate_new_segments(sbi, CURSEG_COLD_DATA);
> > +		err = f2fs_map_blocks(inode, &map, 1, F2FS_GET_BLOCK_PRE_DIO);
> > +		up_write(&sbi->pin_sem);
> > +
> > +		done += map.m_len;
> > +		len -= map.m_len;
> > +		map.m_lblk += map.m_len;
> > +		if (!err && len)
> > +			goto next_alloc;
> > +
> > +		map.m_len = done;
> > +	} else {
> > +		err = f2fs_map_blocks(inode, &map, 1, F2FS_GET_BLOCK_PRE_AIO);
> > +	}
> > +out_err:
> >  	if (err) {
> >  		pgoff_t last_off;
> >  
> > diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
> > index 783773e4560d..76477f71d4ee 100644
> > --- a/fs/f2fs/recovery.c
> > +++ b/fs/f2fs/recovery.c
> > @@ -711,7 +711,7 @@ static int recover_data(struct f2fs_sb_info *sbi, struct list_head *inode_list,
> >  		f2fs_put_page(page, 1);
> >  	}
> >  	if (!err)
> > -		f2fs_allocate_new_segments(sbi);
> > +		f2fs_allocate_new_segments(sbi, NO_CHECK_TYPE);
> >  	return err;
> >  }
> >  
> > diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> > index 25c750cd0272..253d72c2663c 100644
> > --- a/fs/f2fs/segment.c
> > +++ b/fs/f2fs/segment.c
> > @@ -2690,7 +2690,7 @@ void allocate_segment_for_resize(struct f2fs_sb_info *sbi, int type,
> >  	up_read(&SM_I(sbi)->curseg_lock);
> >  }
> >  
> > -void f2fs_allocate_new_segments(struct f2fs_sb_info *sbi)
> > +void f2fs_allocate_new_segments(struct f2fs_sb_info *sbi, int type)
> >  {
> >  	struct curseg_info *curseg;
> >  	unsigned int old_segno;
> > @@ -2699,6 +2699,9 @@ void f2fs_allocate_new_segments(struct f2fs_sb_info *sbi)
> >  	down_write(&SIT_I(sbi)->sentry_lock);
> >  
> >  	for (i = CURSEG_HOT_DATA; i <= CURSEG_COLD_DATA; i++) {
> > +		if (type != NO_CHECK_TYPE && i != type)
> > +			continue;
> > +
> >  		curseg = CURSEG_I(sbi, i);
> >  		old_segno = curseg->segno;
> >  		SIT_I(sbi)->s_ops->allocate_segment(sbi, i, true);
> > @@ -3068,6 +3071,19 @@ void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
> >  {
> >  	struct sit_info *sit_i = SIT_I(sbi);
> >  	struct curseg_info *curseg = CURSEG_I(sbi, type);
> > +	bool put_pin_sem = false;
> > +
> > +	if (type == CURSEG_COLD_DATA) {
> > +		/* GC during CURSEG_COLD_DATA_PINNED allocation */
> > +		if (down_read_trylock(&sbi->pin_sem)) {
> > +			put_pin_sem = true;
> > +		} else {
> > +			type = CURSEG_WARM_DATA;
> > +			curseg = CURSEG_I(sbi, type);
> 
> It will mix pending cold data into warm area... rather than recovering curseg to
> write pointer of last cold segment?
> 
> I know maybe that fallocate aligned address could be corner case, but I guess
> there should be some better solutions can handle race case more effectively.
> 
> One solution could be: allocating a virtual log header to select free segment as
> 2m-aligned space target.

I thought about that, but concluded to avoid too much changes.

> 
> Thanks,
> 
> > +		}
> > +	} else if (type == CURSEG_COLD_DATA_PINNED) {
> > +		type = CURSEG_COLD_DATA;
> > +	}
> >  
> >  	down_read(&SM_I(sbi)->curseg_lock);
> >  
> > @@ -3133,6 +3149,9 @@ void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
> >  	mutex_unlock(&curseg->curseg_mutex);
> >  
> >  	up_read(&SM_I(sbi)->curseg_lock);
> > +
> > +	if (put_pin_sem)
> > +		up_read(&sbi->pin_sem);
> >  }
> >  
> >  static void update_device_state(struct f2fs_io_info *fio)
> > diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> > index 325781a1ae4d..a95467b202ea 100644
> > --- a/fs/f2fs/segment.h
> > +++ b/fs/f2fs/segment.h
> > @@ -313,6 +313,8 @@ struct sit_entry_set {
> >   */
> >  static inline struct curseg_info *CURSEG_I(struct f2fs_sb_info *sbi, int type)
> >  {
> > +	if (type == CURSEG_COLD_DATA_PINNED)
> > +		type = CURSEG_COLD_DATA;
> >  	return (struct curseg_info *)(SM_I(sbi)->curseg_array + type);
> >  }
> >  
> > diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> > index f320fd11db48..c02a47ce551b 100644
> > --- a/fs/f2fs/super.c
> > +++ b/fs/f2fs/super.c
> > @@ -2853,6 +2853,7 @@ static void init_sb_info(struct f2fs_sb_info *sbi)
> >  	spin_lock_init(&sbi->dev_lock);
> >  
> >  	init_rwsem(&sbi->sb_lock);
> > +	init_rwsem(&sbi->pin_sem);
> >  }
> >  
> >  static int init_percpu_info(struct f2fs_sb_info *sbi)
> > diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> > index b558b64a4c9c..f164959e4224 100644
> > --- a/fs/f2fs/sysfs.c
> > +++ b/fs/f2fs/sysfs.c
> > @@ -154,6 +154,8 @@ static ssize_t features_show(struct f2fs_attr *a,
> >  	if (f2fs_sb_has_casefold(sbi))
> >  		len += snprintf(buf + len, PAGE_SIZE - len, "%s%s",
> >  				len ? ", " : "", "casefold");
> > +	len += snprintf(buf + len, PAGE_SIZE - len, "%s%s",
> > +				len ? ", " : "", "pin_file");
> >  	len += snprintf(buf + len, PAGE_SIZE - len, "\n");
> >  	return len;
> >  }
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
