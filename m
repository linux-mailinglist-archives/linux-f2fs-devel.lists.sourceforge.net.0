Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3931E848A0
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 Aug 2019 11:29:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hvIGK-0000vY-Lk; Wed, 07 Aug 2019 09:29:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hvIGJ-0000vR-5F
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 07 Aug 2019 09:29:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9zeYFqg5SefUJh1NgOY9ukIHDIpXRthG4oMGXSZIF0s=; b=bnA4fyk04V1Y0s4/cF7TlsGGCO
 vXo3Wnqk64I+zpTBSXwFWLws+46u/ecJw9CRHrsO6k5upDWZYDwvJvibSshxIlCBEZ424D8PtgQrt
 RdRF299qGG/R4pT2Mba1gVKgSFn9b0ZrLtS7hhWU6nbOIw9NLXl9SFNkLoBBk/g5bPrw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9zeYFqg5SefUJh1NgOY9ukIHDIpXRthG4oMGXSZIF0s=; b=ex/1HjNZO0ANMeRd1hvQ7t8yGn
 eSvAqniq/ewaOSfnGDaZybh4BF371xm2KxaYYEP2L5Ec6/2b2x8sG8iCNz0AxbfhlDUtOd2PxNizN
 zoxvqYGI4gXVtQSYld72c8eBxHVMCyguPpU+GNCgaEnnauS2D6vFSUWka3xk/GFfMmmk=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hvIGG-00DjYN-SM
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 07 Aug 2019 09:29:39 +0000
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id D52E6DF81BE714EA1D5A;
 Wed,  7 Aug 2019 17:29:29 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.203) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 7 Aug 2019
 17:29:25 +0800
To: Sahitya Tummala <stummala@codeaurora.org>, Jaegeuk Kim
 <jaegeuk@kernel.org>, <linux-f2fs-devel@lists.sourceforge.net>
References: <1565167927-23305-1-git-send-email-stummala@codeaurora.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <196c97bf-e846-794f-f4fe-0d1523a74575@huawei.com>
Date: Wed, 7 Aug 2019 17:29:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1565167927-23305-1-git-send-email-stummala@codeaurora.org>
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
X-Headers-End: 1hvIGG-00DjYN-SM
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: Fix indefinite loop in f2fs_gc()
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

On 2019/8/7 16:52, Sahitya Tummala wrote:
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
> v3: address Chao's comments and also add logic to clear invalid_segmap

Hi Sahitya,

I meant we could cover all invalid_segmap related codes w/ CONFIG_F2FS_CHECK_FS
in upstream code, like we did for sit_info.sit_bitmap_mir. In private code
(qualconn or others), if this issue happens frequently, we can enable it by
default before it is fixed.

How do you think?

Btw, still no fsck log on broken image?

Thanks,

> 
>  fs/f2fs/gc.c      | 25 +++++++++++++++++++++++--
>  fs/f2fs/segment.c | 10 +++++++++-
>  fs/f2fs/segment.h |  3 +++
>  3 files changed, 35 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 8974672..f7b9602 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -382,6 +382,14 @@ static int get_victim_by_default(struct f2fs_sb_info *sbi,
>  			nsearched++;
>  		}
>  
> +		/*
> +		 * skip selecting the invalid segno (that is failed due to block
> +		 * validity check failure during GC) to avoid endless GC loop in
> +		 * such cases.
> +		 */
> +		if (test_bit(segno, sm->invalid_segmap))
> +			goto next;
> +
>  		secno = GET_SEC_FROM_SEG(sbi, segno);
>  
>  		if (sec_usage_check(sbi, secno))
> @@ -602,8 +610,13 @@ static bool is_alive(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
>  {
>  	struct page *node_page;
>  	nid_t nid;
> -	unsigned int ofs_in_node;
> +	unsigned int ofs_in_node, segno;
>  	block_t source_blkaddr;
> +	unsigned long offset;
> +	struct sit_info *sit_i = SIT_I(sbi);
> +
> +	segno = GET_SEGNO(sbi, blkaddr);
> +	offset = GET_BLKOFF_FROM_SEG0(sbi, blkaddr);
>  
>  	nid = le32_to_cpu(sum->nid);
>  	ofs_in_node = le16_to_cpu(sum->ofs_in_node);
> @@ -627,8 +640,16 @@ static bool is_alive(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
>  	source_blkaddr = datablock_addr(NULL, node_page, ofs_in_node);
>  	f2fs_put_page(node_page, 1);
>  
> -	if (source_blkaddr != blkaddr)
> +	if (source_blkaddr != blkaddr) {
> +		if (unlikely(check_valid_map(sbi, segno, offset))) {
> +			if (!test_and_set_bit(segno, sit_i->invalid_segmap)) {
> +				f2fs_err(sbi, "mismatched blkaddr %u (source_blkaddr %u) in seg %u\n",
> +						blkaddr, source_blkaddr, segno);
> +				f2fs_bug_on(sbi, 1);
> +			}
> +		}
>  		return false;
> +	}
>  	return true;
>  }
>  
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index a661ac3..c3ba9e7 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -806,6 +806,7 @@ static void __remove_dirty_segment(struct f2fs_sb_info *sbi, unsigned int segno,
>  		enum dirty_type dirty_type)
>  {
>  	struct dirty_seglist_info *dirty_i = DIRTY_I(sbi);
> +	struct sit_info *sit_i = SIT_I(sbi);
>  
>  	if (test_and_clear_bit(segno, dirty_i->dirty_segmap[dirty_type]))
>  		dirty_i->nr_dirty[dirty_type]--;
> @@ -817,9 +818,11 @@ static void __remove_dirty_segment(struct f2fs_sb_info *sbi, unsigned int segno,
>  		if (test_and_clear_bit(segno, dirty_i->dirty_segmap[t]))
>  			dirty_i->nr_dirty[t]--;
>  
> -		if (get_valid_blocks(sbi, segno, true) == 0)
> +		if (get_valid_blocks(sbi, segno, true) == 0) {
>  			clear_bit(GET_SEC_FROM_SEG(sbi, segno),
>  						dirty_i->victim_secmap);
> +			clear_bit(segno, sit_i->invalid_segmap);
> +		}
>  	}
>  }
>  
> @@ -4017,6 +4020,10 @@ static int build_sit_info(struct f2fs_sb_info *sbi)
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
> @@ -4518,6 +4525,7 @@ static void destroy_sit_info(struct f2fs_sb_info *sbi)
>  #ifdef CONFIG_F2FS_CHECK_FS
>  	kvfree(sit_i->sit_bitmap_mir);
>  #endif
> +	kvfree(sit_i->invalid_segmap);
>  	kvfree(sit_i);
>  }
>  
> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> index b746028..3918155c 100644
> --- a/fs/f2fs/segment.h
> +++ b/fs/f2fs/segment.h
> @@ -246,6 +246,9 @@ struct sit_info {
>  	unsigned long long min_mtime;		/* min. modification time */
>  	unsigned long long max_mtime;		/* max. modification time */
>  
> +	/* bitmap of segments to be ignored by GC in case of errors */
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
