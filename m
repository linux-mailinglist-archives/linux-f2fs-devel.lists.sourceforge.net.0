Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AEA85CD43
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Feb 2024 02:17:21 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rcbEa-0007LD-0I;
	Wed, 21 Feb 2024 01:17:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rcbEY-0007L6-Ev
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Feb 2024 01:17:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6OwgCWOgOVVDX5UTQkCh6vhobxs42LvA76/uYvMEehA=; b=RQoF6jMhaV3xtrOeQMa7UuMI/D
 HDG/4A2MswIYX6+VdvhVRatDqQS361awpe8Id8+ie7gMIacq/wOYvBKPajB/i0ljyVSE7vidCXxLV
 y40rg2gw2ExKnOffugOfzAVgF6ntL0gsEuf2MySPYQA+zpaQYB+gZZhdNNWLOENMkdD0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6OwgCWOgOVVDX5UTQkCh6vhobxs42LvA76/uYvMEehA=; b=QbYfMLSke8sN05e9XeoEh3JzPR
 5SnBszJYiKdTobWBHxU/ZLJdykRANS4uiulLKi5l3Ihe+WINklSWoZ6TXNRdiJlRsyLcVwn1piKva
 LIgTa4JVHCdHhtOEH8ysdVVOMeOWFMHSSMr6omxNA8NC4PzZWQaDX++Q9lGwGNzldhvQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rcbEW-00050H-3S for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Feb 2024 01:17:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E1FAB61370
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 21 Feb 2024 01:17:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1064C433C7;
 Wed, 21 Feb 2024 01:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708478222;
 bh=ZssCYSdcPvwYcsgLG+bxFQkUAPS70WrmqGVwNZl6i9Y=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=TtE/yrmnUSkhLIFj+clbTq0XT/iD9WUsBSQGxxF99eXp8c1gLp/DWwZorUi930J6x
 3eh+wjOL8HF9nGbMS+zebq771O6lZj4vpcF3pWK8pA5P3EDjJq7Q5B9JX1ZYKQBZQt
 CQMw7PN+/cY8wIeIf5LZ5xYj49FtvgsfElOprDmzd0Joxu7MngfXPQsRl5heySvNQ3
 bbloy3JDqzQdNfQ+7OE95igDXlYy8+LbOSTc2Pe9mv9hwTujvOqatEpSuK+vbBxv9j
 xk4DeIWux2nkt9P+Zllhr2W+uHWIUsY9nMCSAmwO4rlvhrqDN2rVd7+b+4TkJVDUn1
 E9qikaVzVl1JQ==
Message-ID: <1a9d9c59-dbba-4d9e-8804-2fb92c56b5b3@kernel.org>
Date: Wed, 21 Feb 2024 09:16:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20240207164620.1536038-1-jaegeuk@kernel.org>
 <ZdUQ6uKYyfzn5Fhv@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <ZdUQ6uKYyfzn5Fhv@google.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/2/21 4:51,
 Jaegeuk Kim wrote: > No one uses this feature.
 Let's kill it. > > Reviewed-by: Daeho Jeong <daehojeong@google.com> >
 Signed-off-by:
 Jaegeuk Kim <jaegeuk@kernel.org> > --- > > Change [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rcbEW-00050H-3S
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: kill heap-based allocation
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/2/21 4:51, Jaegeuk Kim wrote:
> No one uses this feature. Let's kill it.
> 
> Reviewed-by: Daeho Jeong <daehojeong@google.com>
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
> 
>   Change log from v1:
>    - keep mount options but give warnings instead
> 
>   Documentation/filesystems/f2fs.rst |  4 +--
>   fs/f2fs/gc.c                       |  5 ++-
>   fs/f2fs/segment.c                  | 54 ++++--------------------------
>   fs/f2fs/segment.h                  | 10 ------
>   fs/f2fs/super.c                    |  9 +----
>   5 files changed, 11 insertions(+), 71 deletions(-)
> 
> diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
> index 9ac5083dae8e..c30a800604fd 100644
> --- a/Documentation/filesystems/f2fs.rst
> +++ b/Documentation/filesystems/f2fs.rst
> @@ -126,9 +126,7 @@ norecovery		 Disable the roll-forward recovery routine, mounted read-
>   discard/nodiscard	 Enable/disable real-time discard in f2fs, if discard is
>   			 enabled, f2fs will issue discard/TRIM commands when a
>   			 segment is cleaned.
> -no_heap			 Disable heap-style segment allocation which finds free
> -			 segments for data from the beginning of main area, while
> -			 for node from the end of main area.
> +no_heap			 Deprecated.

heap/no_heap			Deprecated

Otherwise, it looks good to me.

Reviewed-by: Chao Yu <chao@kernel.org>

BTW, do we need to kill heap-based allocation in mkfs.f2fs as well?

Thanks,

>   nouser_xattr		 Disable Extended User Attributes. Note: xattr is enabled
>   			 by default if CONFIG_F2FS_FS_XATTR is selected.
>   noacl			 Disable POSIX Access Control List. Note: acl is enabled
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 501b93b45b6c..a089a938355b 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -280,12 +280,11 @@ static void select_policy(struct f2fs_sb_info *sbi, int gc_type,
>   			p->max_search > sbi->max_victim_search)
>   		p->max_search = sbi->max_victim_search;
>   
> -	/* let's select beginning hot/small space first in no_heap mode*/
> +	/* let's select beginning hot/small space first. */
>   	if (f2fs_need_rand_seg(sbi))
>   		p->offset = get_random_u32_below(MAIN_SECS(sbi) *
>   						SEGS_PER_SEC(sbi));
> -	else if (test_opt(sbi, NOHEAP) &&
> -		(type == CURSEG_HOT_DATA || IS_NODESEG(type)))
> +	else if (type == CURSEG_HOT_DATA || IS_NODESEG(type))
>   		p->offset = 0;
>   	else
>   		p->offset = SIT_I(sbi)->last_victim[p->gc_mode];
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 94c4f7b16c19..09af17af4e7a 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -2634,16 +2634,14 @@ static int is_next_segment_free(struct f2fs_sb_info *sbi,
>    * This function should be returned with success, otherwise BUG
>    */
>   static void get_new_segment(struct f2fs_sb_info *sbi,
> -			unsigned int *newseg, bool new_sec, int dir)
> +			unsigned int *newseg, bool new_sec)
>   {
>   	struct free_segmap_info *free_i = FREE_I(sbi);
>   	unsigned int segno, secno, zoneno;
>   	unsigned int total_zones = MAIN_SECS(sbi) / sbi->secs_per_zone;
>   	unsigned int hint = GET_SEC_FROM_SEG(sbi, *newseg);
>   	unsigned int old_zoneno = GET_ZONE_FROM_SEG(sbi, *newseg);
> -	unsigned int left_start = hint;
>   	bool init = true;
> -	int go_left = 0;
>   	int i;
>   
>   	spin_lock(&free_i->segmap_lock);
> @@ -2657,30 +2655,10 @@ static void get_new_segment(struct f2fs_sb_info *sbi,
>   find_other_zone:
>   	secno = find_next_zero_bit(free_i->free_secmap, MAIN_SECS(sbi), hint);
>   	if (secno >= MAIN_SECS(sbi)) {
> -		if (dir == ALLOC_RIGHT) {
> -			secno = find_first_zero_bit(free_i->free_secmap,
> +		secno = find_first_zero_bit(free_i->free_secmap,
>   							MAIN_SECS(sbi));
> -			f2fs_bug_on(sbi, secno >= MAIN_SECS(sbi));
> -		} else {
> -			go_left = 1;
> -			left_start = hint - 1;
> -		}
> -	}
> -	if (go_left == 0)
> -		goto skip_left;
> -
> -	while (test_bit(left_start, free_i->free_secmap)) {
> -		if (left_start > 0) {
> -			left_start--;
> -			continue;
> -		}
> -		left_start = find_first_zero_bit(free_i->free_secmap,
> -							MAIN_SECS(sbi));
> -		f2fs_bug_on(sbi, left_start >= MAIN_SECS(sbi));
> -		break;
> +		f2fs_bug_on(sbi, secno >= MAIN_SECS(sbi));
>   	}
> -	secno = left_start;
> -skip_left:
>   	segno = GET_SEG_FROM_SEC(sbi, secno);
>   	zoneno = GET_ZONE_FROM_SEC(sbi, secno);
>   
> @@ -2691,21 +2669,13 @@ static void get_new_segment(struct f2fs_sb_info *sbi,
>   		goto got_it;
>   	if (zoneno == old_zoneno)
>   		goto got_it;
> -	if (dir == ALLOC_LEFT) {
> -		if (!go_left && zoneno + 1 >= total_zones)
> -			goto got_it;
> -		if (go_left && zoneno == 0)
> -			goto got_it;
> -	}
>   	for (i = 0; i < NR_CURSEG_TYPE; i++)
>   		if (CURSEG_I(sbi, i)->zone == zoneno)
>   			break;
>   
>   	if (i < NR_CURSEG_TYPE) {
>   		/* zone is in user, try another */
> -		if (go_left)
> -			hint = zoneno * sbi->secs_per_zone - 1;
> -		else if (zoneno + 1 >= total_zones)
> +		if (zoneno + 1 >= total_zones)
>   			hint = 0;
>   		else
>   			hint = (zoneno + 1) * sbi->secs_per_zone;
> @@ -2763,8 +2733,7 @@ static unsigned int __get_next_segno(struct f2fs_sb_info *sbi, int type)
>   	if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED)))
>   		return 0;
>   
> -	if (test_opt(sbi, NOHEAP) &&
> -		(seg_type == CURSEG_HOT_DATA || IS_NODESEG(seg_type)))
> +	if (seg_type == CURSEG_HOT_DATA || IS_NODESEG(seg_type))
>   		return 0;
>   
>   	if (SIT_I(sbi)->last_victim[ALLOC_NEXT])
> @@ -2784,21 +2753,12 @@ static unsigned int __get_next_segno(struct f2fs_sb_info *sbi, int type)
>   static void new_curseg(struct f2fs_sb_info *sbi, int type, bool new_sec)
>   {
>   	struct curseg_info *curseg = CURSEG_I(sbi, type);
> -	unsigned short seg_type = curseg->seg_type;
>   	unsigned int segno = curseg->segno;
> -	int dir = ALLOC_LEFT;
>   
>   	if (curseg->inited)
> -		write_sum_page(sbi, curseg->sum_blk,
> -				GET_SUM_BLOCK(sbi, segno));
> -	if (seg_type == CURSEG_WARM_DATA || seg_type == CURSEG_COLD_DATA)
> -		dir = ALLOC_RIGHT;
> -
> -	if (test_opt(sbi, NOHEAP))
> -		dir = ALLOC_RIGHT;
> -
> +		write_sum_page(sbi, curseg->sum_blk, GET_SUM_BLOCK(sbi, segno));
>   	segno = __get_next_segno(sbi, type);
> -	get_new_segment(sbi, &segno, new_sec, dir);
> +	get_new_segment(sbi, &segno, new_sec);
>   	curseg->next_segno = segno;
>   	reset_curseg(sbi, type, 1);
>   	curseg->alloc_type = LFS;
> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> index 6fadfb634aac..0f1a5210c163 100644
> --- a/fs/f2fs/segment.h
> +++ b/fs/f2fs/segment.h
> @@ -131,16 +131,6 @@ static inline void sanity_check_seg_type(struct f2fs_sb_info *sbi,
>   #define SECTOR_TO_BLOCK(sectors)					\
>   	((sectors) >> F2FS_LOG_SECTORS_PER_BLOCK)
>   
> -/*
> - * indicate a block allocation direction: RIGHT and LEFT.
> - * RIGHT means allocating new sections towards the end of volume.
> - * LEFT means the opposite direction.
> - */
> -enum {
> -	ALLOC_RIGHT = 0,
> -	ALLOC_LEFT
> -};
> -
>   /*
>    * In the victim_sel_policy->alloc_mode, there are three block allocation modes.
>    * LFS writes data sequentially with cleaning operations.
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 5aaf44c4698b..916e82e9c307 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -733,10 +733,8 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
>   			clear_opt(sbi, DISCARD);
>   			break;
>   		case Opt_noheap:
> -			set_opt(sbi, NOHEAP);
> -			break;
>   		case Opt_heap:
> -			clear_opt(sbi, NOHEAP);
> +			f2fs_warn(sbi, "heap/no_heap options were deprecated");
>   			break;
>   #ifdef CONFIG_F2FS_FS_XATTR
>   		case Opt_user_xattr:
> @@ -1962,10 +1960,6 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
>   	} else {
>   		seq_puts(seq, ",nodiscard");
>   	}
> -	if (test_opt(sbi, NOHEAP))
> -		seq_puts(seq, ",no_heap");
> -	else
> -		seq_puts(seq, ",heap");
>   #ifdef CONFIG_F2FS_FS_XATTR
>   	if (test_opt(sbi, XATTR_USER))
>   		seq_puts(seq, ",user_xattr");
> @@ -2142,7 +2136,6 @@ static void default_options(struct f2fs_sb_info *sbi, bool remount)
>   	set_opt(sbi, INLINE_XATTR);
>   	set_opt(sbi, INLINE_DATA);
>   	set_opt(sbi, INLINE_DENTRY);
> -	set_opt(sbi, NOHEAP);
>   	set_opt(sbi, MERGE_CHECKPOINT);
>   	F2FS_OPTION(sbi).unusable_cap = 0;
>   	sbi->sb->s_flags |= SB_LAZYTIME;


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
