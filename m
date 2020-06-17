Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 195CF1FC440
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Jun 2020 04:54:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jlODU-0008Jy-1Q; Wed, 17 Jun 2020 02:54:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jlODS-0008Jr-Bg
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 17 Jun 2020 02:54:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=R6DmJLrwCHHyf3RLjqR2ShPeBEHFK8xm2dQAYqTU/Q8=; b=DWRAISzIb/DleqLbdR1zhgRLvo
 0Z0kUGAdcYMUBvmPKUETBK0Utj+tSgP++eHj8wp9U57ye9nHSuhx+5C0McZMy2p1mEFXO9gO5MG8P
 6tbTWE9z1FJNIGIBInMe5moVCJEHYWKapLHEhfepIhnua/j+IF7CRvatLQY2g0iwQ1Y8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=R6DmJLrwCHHyf3RLjqR2ShPeBEHFK8xm2dQAYqTU/Q8=; b=KuO0DkQBqdlTFcQh40b03c2rWK
 /ex09SR90v6advtnUgvohh8hU9v5NMFmFJEMr/S97LI05PAeNhLEviBdL58k5D7xr2m7LkckOrbrV
 BDUL2yXRA0n2iXATHdPp03+AeyLODm0UlvCe0vQZO0v29IMtX0rqlglA56THEIKin0Bs=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jlODN-006CZ2-HB
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 17 Jun 2020 02:54:18 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id B634F31B6863C48191F5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 17 Jun 2020 10:53:58 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.206) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 17 Jun
 2020 10:53:52 +0800
To: Jack Qiu <jack.qiu@huawei.com>, <linux-f2fs-devel@lists.sourceforge.net>
References: <20200616134642.39168-1-jack.qiu@huawei.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <cfa17c07-0b6e-eff8-2ec2-ca59c506a293@huawei.com>
Date: Wed, 17 Jun 2020 10:53:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200616134642.39168-1-jack.qiu@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.35 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jlODN-006CZ2-HB
Subject: Re: [f2fs-dev] [PATCH -next] f2fs: get the right gc victim section
 when section has several segments
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/6/16 21:46, Jack Qiu wrote:
> Assume each section has 4 segment:
>      .___________________________.
>      |_Segment0_|_..._|_Segment3_|
>      .                          .
>      .                  .
>      .__________.
>      |_section0_|
> 
> Segment 0~2 has 0 valid block, segment 3 has 512 valid blocks.
> It will fail if we want to gc section0 in this scenes,
> because all 4 segments in section0 is not dirty.
> So we should use dirty section bitmap instead of dirty segment bitmap
> to get right victim section.

Nice catch.

> 
> Signed-off-by: Jack Qiu <jack.qiu@huawei.com>
> ---
>  fs/f2fs/gc.c      | 41 +++++++++++++++++++++++----------------
>  fs/f2fs/segment.c | 49 ++++++++++++++++++++++++++++++++++++++++++++++-
>  fs/f2fs/segment.h |  6 +++++-
>  3 files changed, 78 insertions(+), 18 deletions(-)
> 
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 5b95d5a146eb..0fc5cc41a310 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -21,6 +21,11 @@
>  #include "gc.h"
>  #include <trace/events/f2fs.h>
> 
> +#define DIRTY_UNIT_MAP(p)	(((p)->ofs_unit > 1) ? \
> +				((p)->dirty_secmap) : ((p)->dirty_segmap))
> +static unsigned int count_bits(const unsigned long *addr,
> +				unsigned int offset, unsigned int len);
> +
>  static int gc_thread_func(void *data)
>  {
>  	struct f2fs_sb_info *sbi = data;
> @@ -192,9 +197,15 @@ static void select_policy(struct f2fs_sb_info *sbi, int gc_type,
>  		p->ofs_unit = 1;
>  	} else {
>  		p->gc_mode = select_gc_type(sbi, gc_type);
> -		p->dirty_segmap = dirty_i->dirty_segmap[DIRTY];
> -		p->max_search = dirty_i->nr_dirty[DIRTY];
>  		p->ofs_unit = sbi->segs_per_sec;
> +		if (p->ofs_unit > 1) {
> +			p->dirty_segmap = dirty_i->dirty_secmap;
> +			p->max_search = count_bits(p->dirty_secmap,
> +						0, MAIN_SECS(sbi));
> +		} else {
> +			p->dirty_segmap = dirty_i->dirty_segmap[DIRTY];
> +			p->max_search = dirty_i->nr_dirty[DIRTY];
> +		}
>  	}
> 
>  	/*
> @@ -365,10 +376,14 @@ static int get_victim_by_default(struct f2fs_sb_info *sbi,
>  	}
> 
>  	while (1) {
> -		unsigned long cost;
> -		unsigned int segno;
> -
> -		segno = find_next_bit(p.dirty_segmap, last_segment, p.offset);
> +		unsigned long cost, *dirty_bitmap;
> +		unsigned int unit_no, segno;
> +
> +		dirty_bitmap = DIRTY_UNIT_MAP(&p);
> +		unit_no = find_next_bit(dirty_bitmap,
> +				last_segment / p.ofs_unit,
> +				p.offset / p.ofs_unit);
> +		segno = unit_no * p.ofs_unit;
>  		if (segno >= last_segment) {
>  			if (sm->last_victim[p.gc_mode]) {
>  				last_segment =
> @@ -381,14 +396,7 @@ static int get_victim_by_default(struct f2fs_sb_info *sbi,
>  		}
> 
>  		p.offset = segno + p.ofs_unit;
> -		if (p.ofs_unit > 1) {
> -			p.offset -= segno % p.ofs_unit;
> -			nsearched += count_bits(p.dirty_segmap,
> -						p.offset - p.ofs_unit,
> -						p.ofs_unit);
> -		} else {
> -			nsearched++;
> -		}
> +		nsearched++;
> 
>  #ifdef CONFIG_F2FS_CHECK_FS
>  		/*
> @@ -421,9 +429,10 @@ static int get_victim_by_default(struct f2fs_sb_info *sbi,
>  next:
>  		if (nsearched >= p.max_search) {
>  			if (!sm->last_victim[p.gc_mode] && segno <= last_victim)
> -				sm->last_victim[p.gc_mode] = last_victim + 1;
> +				sm->last_victim[p.gc_mode] =
> +					last_victim + p.ofs_unit;
>  			else
> -				sm->last_victim[p.gc_mode] = segno + 1;
> +				sm->last_victim[p.gc_mode] = segno + p.ofs_unit;
>  			sm->last_victim[p.gc_mode] %=
>  				(MAIN_SECS(sbi) * sbi->segs_per_sec);
>  			break;
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 196f31503511..60bd70a68447 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -778,6 +778,7 @@ static void __locate_dirty_segment(struct f2fs_sb_info *sbi, unsigned int segno,
>  		enum dirty_type dirty_type)
>  {
>  	struct dirty_seglist_info *dirty_i = DIRTY_I(sbi);
> +	unsigned short valid_blocks;
> 
>  	/* need not be added */
>  	if (IS_CURSEG(sbi, segno))
> @@ -796,6 +797,16 @@ static void __locate_dirty_segment(struct f2fs_sb_info *sbi, unsigned int segno,
>  		}
>  		if (!test_and_set_bit(segno, dirty_i->dirty_segmap[t]))
>  			dirty_i->nr_dirty[t]++;
> +

if (__is_large_section()) {
	unsigned short valid_blocks = get_valid_blocks(sbi, segno, true);
	unsigned int secno = GET_SEC_FROM_SEG(sbi, segno);

	f2fs_bug_on(sbi, unlikely(...));

	if (IS_CURSEC(sbi, secno))
		set_bit(secno, dirty_i->dirty_secmap);
}

> +		valid_blocks = get_valid_blocks(sbi, segno, true);
> +		if (valid_blocks == 0 || valid_blocks == sbi->blocks_per_seg *
> +				sbi->segs_per_sec) {

should be replaced w/ BLKS_PER_SEC(sbi)

> +			f2fs_bug_on(sbi, 1);
> +		} else {
> +			if (!IS_CURSEC(sbi, GET_SEC_FROM_SEG(sbi, segno)))
> +				set_bit(GET_SEC_FROM_SEG(sbi, segno),
> +						dirty_i->dirty_secmap);
> +		}
>  	}
>  }
> 
> @@ -803,6 +814,7 @@ static void __remove_dirty_segment(struct f2fs_sb_info *sbi, unsigned int segno,
>  		enum dirty_type dirty_type)
>  {
>  	struct dirty_seglist_info *dirty_i = DIRTY_I(sbi);
> +	unsigned short valid_blocks;
> 
>  	if (test_and_clear_bit(segno, dirty_i->dirty_segmap[dirty_type]))
>  		dirty_i->nr_dirty[dirty_type]--;
> @@ -814,13 +826,23 @@ static void __remove_dirty_segment(struct f2fs_sb_info *sbi, unsigned int segno,
>  		if (test_and_clear_bit(segno, dirty_i->dirty_segmap[t]))
>  			dirty_i->nr_dirty[t]--;
> 
> -		if (get_valid_blocks(sbi, segno, true) == 0) {
> +		valid_blocks = get_valid_blocks(sbi, segno, true);
> +		if (valid_blocks == 0) {
>  			clear_bit(GET_SEC_FROM_SEG(sbi, segno),
>  						dirty_i->victim_secmap);
>  #ifdef CONFIG_F2FS_CHECK_FS
>  			clear_bit(segno, SIT_I(sbi)->invalid_segmap);
>  #endif
>  		}

Ditto, could you clean up below codes as above?

if (__is_large_section()) {
	if ( == 0 || == BLKS_PER_SEC) {
		clear_bit();
		return;
	}

	if (!IS_CURSEC)
		set_bit();
}

> +		if (valid_blocks == 0 || valid_blocks == sbi->blocks_per_seg *
> +				sbi->segs_per_sec) {
> +			clear_bit(GET_SEC_FROM_SEG(sbi, segno),
> +					dirty_i->dirty_secmap);
> +		} else {
> +			if (!IS_CURSEC(sbi, GET_SEC_FROM_SEG(sbi, segno)))
> +				set_bit(GET_SEC_FROM_SEG(sbi, segno),
> +						dirty_i->dirty_secmap);
> +		}
>  	}
>  }
> 
> @@ -4313,6 +4335,22 @@ static void init_dirty_segmap(struct f2fs_sb_info *sbi)
>  		__locate_dirty_segment(sbi, segno, DIRTY);
>  		mutex_unlock(&dirty_i->seglist_lock);
>  	}
> +
> +	segno = 0;
> +	mutex_lock(&dirty_i->seglist_lock);
> +	while (1) {
> +		if (segno >= MAIN_SECS(sbi))
> +			break;
> +		valid_blocks = get_valid_blocks(sbi, segno, true);
> +		if (!(valid_blocks == 0 || valid_blocks == sbi->blocks_per_seg *
> +						sbi->segs_per_sec)) {
> +			if (!IS_CURSEC(sbi, GET_SEC_FROM_SEG(sbi, segno)))
> +				set_bit(GET_SEC_FROM_SEG(sbi, segno),
> +						dirty_i->dirty_secmap);
> +		}
> +		segno += sbi->segs_per_sec;
> +	}

blks_per_sec = BLKS_PER_SEC(sbi);

for (segno = 0; segno < MAIN_SECS(sbi); segno += sbi->segs_per_sec) {
	valid_blocks = get_valid_blocks(sbi, segno, true);
	secno = GET_SEC_FROM_SEG(sbi, segno);

	if (!valid_blocks || valid_blocks == blks_per_sec))
		continue;
	if (IS_CURSEC(sbi, secno)
		continue;
	set_bit(secno, dirty_i->dirty_secmap);
}

> +	mutex_unlock(&dirty_i->seglist_lock);
>  }
> 
>  static int init_victim_secmap(struct f2fs_sb_info *sbi)
> @@ -4349,6 +4387,11 @@ static int build_dirty_segmap(struct f2fs_sb_info *sbi)
>  			return -ENOMEM;
>  	}
> 

We only need to allocate/free such memory if one section contains multi segments.

> +	bitmap_size = f2fs_bitmap_size(MAIN_SECS(sbi));
> +	dirty_i->dirty_secmap = f2fs_kvzalloc(sbi, bitmap_size, GFP_KERNEL);
> +	if (!dirty_i->dirty_secmap)
> +		return -ENOMEM;
> +
>  	init_dirty_segmap(sbi);
>  	return init_victim_secmap(sbi);
>  }
> @@ -4775,6 +4818,10 @@ static void destroy_dirty_segmap(struct f2fs_sb_info *sbi)
>  	for (i = 0; i < NR_DIRTY_TYPE; i++)
>  		discard_dirty_segmap(sbi, i);
> 
> +	mutex_lock(&dirty_i->seglist_lock);
> +	kvfree(dirty_i->dirty_secmap);
> +	mutex_unlock(&dirty_i->seglist_lock);
> +
>  	destroy_victim_secmap(sbi);
>  	SM_I(sbi)->dirty_info = NULL;
>  	kvfree(dirty_i);
> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> index cba16cca5189..5037c4f54be2 100644
> --- a/fs/f2fs/segment.h
> +++ b/fs/f2fs/segment.h
> @@ -166,7 +166,10 @@ enum {
>  struct victim_sel_policy {
>  	int alloc_mode;			/* LFS or SSR */
>  	int gc_mode;			/* GC_CB or GC_GREEDY */
> -	unsigned long *dirty_segmap;	/* dirty segment bitmap */

IMO, we don't need to use union, one common bitmap pointer is enough?

unsigned long *dirty_bitmap;	/* dirty segment/section bitmap */

> +	union {
> +		unsigned long *dirty_segmap;	/* dirty segment bitmap */
> +		unsigned long *dirty_secmap;	/* dirty section bitmap */
> +	};
>  	unsigned int max_search;	/* maximum # of segments to search */

/* maximum # of segments/sections to search */

>  	unsigned int offset;		/* last scanned bitmap offset */
>  	unsigned int ofs_unit;		/* bitmap search unit */
> @@ -266,6 +269,7 @@ enum dirty_type {
>  struct dirty_seglist_info {
>  	const struct victim_selection *v_ops;	/* victim selction operation */
>  	unsigned long *dirty_segmap[NR_DIRTY_TYPE];
> +	unsigned long *dirty_secmap;
>  	struct mutex seglist_lock;		/* lock for segment bitmaps */
>  	int nr_dirty[NR_DIRTY_TYPE];		/* # of dirty segments */
>  	unsigned long *victim_secmap;		/* background GC victims */
> --
> 2.17.1
> 
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
