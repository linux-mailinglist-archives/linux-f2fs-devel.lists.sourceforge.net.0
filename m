Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 619A38420E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 Aug 2019 04:04:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hvBJK-0006YB-Kw; Wed, 07 Aug 2019 02:04:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hvBJJ-0006Y3-PZ
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 07 Aug 2019 02:04:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7ltUjr1xpukAtloKlnJy93ln/BuGdxJhRxWTdAF7qqw=; b=NRu9+wRYU1NAkdv76dnfPFA64Y
 r2xY6agoi9UX59jwp5eNnYwApOXVJy7xztSWp5qvDzqMg4PzhMRZ0EwatbicZNV8uHGWzxFKQshCA
 osbdZBEwLhUDEDlBEbXcSgh/a8IAXE+3B3AzEs9e4zzHPwcu05FKoMz5w5xzAjSCAbG4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7ltUjr1xpukAtloKlnJy93ln/BuGdxJhRxWTdAF7qqw=; b=ioHxIbJjddVjaUA7cGIy9+awk0
 wiIAGCbUvmXGmYlfK/2a35OGTTenV8DM5WXN5cIGL3N+yfhn90zClKmxK/j+cNJ41fRdvCoExAmXY
 Xuts3CmjFDuh/FZgnjDZvtnvREs3v1uZUl4nqP692CTMynBeWPN/dHndDftsijgIrYHw=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hvBJF-00DQIe-Sg
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 07 Aug 2019 02:04:17 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id DC2CF9F66E5EC9A6F118;
 Wed,  7 Aug 2019 10:04:06 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.206) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 7 Aug 2019
 10:04:04 +0800
To: Sahitya Tummala <stummala@codeaurora.org>, Jaegeuk Kim
 <jaegeuk@kernel.org>, <linux-f2fs-devel@lists.sourceforge.net>
References: <1565090396-7263-1-git-send-email-stummala@codeaurora.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <8766875c-1e35-22dc-48d2-45b6776e4f38@huawei.com>
Date: Wed, 7 Aug 2019 10:04:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1565090396-7263-1-git-send-email-stummala@codeaurora.org>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: codeaurora.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hvBJF-00DQIe-Sg
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: Fix indefinite loop in f2fs_gc()
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
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Sahitya,

On 2019/8/6 19:19, Sahitya Tummala wrote:
> Policy - Foreground GC, LFS and greedy GC mode.
> 
> Under this policy, f2fs_gc() loops forever to GC as it doesn't have
> enough free segements to proceed and thus it keeps calling gc_more
> for the same victim segment.  This can happen if the selected victim
> segment could not be GC'd due to failed blkaddr validity check i.e.
> is_alive() returns false for the blocks set in current validity map.
> 
> Fix this by keeping track of such invalid segments and skip those
> segments for selection in get_victim_by_default() to avoid endless
> GC loop under such error scenarios.
> 
> Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
> ---
> v2: fix as per Chao's suggestion to handle this error case
> 
>  fs/f2fs/gc.c      | 15 ++++++++++++++-
>  fs/f2fs/segment.c |  5 +++++
>  fs/f2fs/segment.h |  3 +++
>  3 files changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 8974672..321a78a 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -382,6 +382,14 @@ static int get_victim_by_default(struct f2fs_sb_info *sbi,
>  			nsearched++;
>  		}
>  
> +		/*
> +		 * skip selecting the invalid segno (that is failed due to block
> +		 * validity check failed during GC) to avoid endless GC loop in
> +		 * such cases.
> +		 */
> +		if (test_bit(segno, sm->invalid_segmap))
> +			goto next;
> +
>  		secno = GET_SEC_FROM_SEG(sbi, segno);
>  
>  		if (sec_usage_check(sbi, secno))
> @@ -975,6 +983,7 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
>  	int off;
>  	int phase = 0;
>  	int submitted = 0;
> +	struct sit_info *sit_i = SIT_I(sbi);
>  
>  	start_addr = START_BLOCK(sbi, segno);
>  
> @@ -1008,8 +1017,12 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
>  		}
>  
>  		/* Get an inode by ino with checking validity */
> -		if (!is_alive(sbi, entry, &dni, start_addr + off, &nofs))
> +		if (!is_alive(sbi, entry, &dni, start_addr + off, &nofs)) {
> +			if (!test_and_set_bit(segno, sit_i->invalid_segmap))
> +				f2fs_err(sbi, "invalid blkaddr %u in seg %u is found\n",
> +						start_addr + off, segno);

Oh, there is some normal cases in is_alive(), such as f2fs_get_node_page() or
f2fs_get_node_info() failure due to no memory, we should bypass such cases. I
guess something like this:

if (source_blkaddr != blkaddr) {
	if (unlikely(check_valid_map(sbi, segno, off))) {
		if (!test_and_set_bit(segno, sit_i->invalid_segmap)) {
			f2fs_err(sbi, "invalid blkaddr %u in seg %u is found\n",
				start_addr + off, segno);
			set_sbi_flag(sbi, SBI_NEED_FSCK);
		}
	}
	return false;
}

I think this will be safe to call check_valid_map(), because there should be no
race in between is_alive() and update_sit_entry() from all paths due to node
page lock dependence.

One more concern is should we use this under CONFIG_F2FS_CHECK_FS? If there is
actually such a bug can cause data inconsistency, we'd better find the root
cause in debug version.

Thanks,

>  			continue;
> +		}
>  
>  		if (phase == 2) {
>  			f2fs_ra_node_page(sbi, dni.ino);
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index a661ac3..d45a1d3 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -4017,6 +4017,10 @@ static int build_sit_info(struct f2fs_sb_info *sbi)
>  		return -ENOMEM;
>  #endif
>  
> +	sit_i->invalid_segmap = f2fs_kvzalloc(sbi, bitmap_size, GFP_KERNEL);
> +	if (!sit_i->invalid_segmap)
> +		return -ENOMEM;
> +
>  	/* init SIT information */
>  	sit_i->s_ops = &default_salloc_ops;
>  
> @@ -4518,6 +4522,7 @@ static void destroy_sit_info(struct f2fs_sb_info *sbi)
>  #ifdef CONFIG_F2FS_CHECK_FS
>  	kvfree(sit_i->sit_bitmap_mir);
>  #endif
> +	kvfree(sit_i->invalid_segmap);
>  	kvfree(sit_i);
>  }
>  
> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> index b746028..bc5dbe8 100644
> --- a/fs/f2fs/segment.h
> +++ b/fs/f2fs/segment.h
> @@ -246,6 +246,9 @@ struct sit_info {
>  	unsigned long long min_mtime;		/* min. modification time */
>  	unsigned long long max_mtime;		/* max. modification time */
>  
> +	/* list of segments to be ignored by GC in case of errors */
> +	unsigned long *invalid_segmap;
> +
>  	unsigned int last_victim[MAX_GC_POLICY]; /* last victim segment # */
>  };
>  
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
