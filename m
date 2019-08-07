Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC1984E2C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 Aug 2019 16:06:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hvMaN-0004X3-Da; Wed, 07 Aug 2019 14:06:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1hvMaM-0004Ww-6B
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 07 Aug 2019 14:06:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=opZqQKKTvUL1jWDpr49kDNssR5gn1b5atzv0H5+q/YI=; b=TqsbJTU9Ziw50zPbM/zSJGxXyv
 ckp1TKWXXqXuoDw2Ey8s4usHxE1W4vQQSLMAbv8lIe7PuEiWh2PzHIERCXzMHWS+Gw5jb+izYKKGk
 AZSy2mu05ZnPpDHiIWFgWYy/ngsyRMCFXzg1lwlvSC/eMC1pUcHzR2yRqdKzm2J9phDY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=opZqQKKTvUL1jWDpr49kDNssR5gn1b5atzv0H5+q/YI=; b=BzDyzbghtiJA4cHLob3c5dV3lp
 L3VCZT63fZbFHRqFfu7D0wbJwC5EhXzPa0l+XZLyaHSv/SHpu1QaAF+R+YebW5HJe3Lud8kZ7rBrV
 qAlOs4NdCsPrDfOoxGjqfF67oczz/F1Agd5yzIH22WM0+edBbiDX6TAGvOCI5agGW3SE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hvMaK-00E00E-53
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 07 Aug 2019 14:06:38 +0000
Received: from [192.168.0.101] (unknown [180.111.32.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4DFC22086D;
 Wed,  7 Aug 2019 14:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565186790;
 bh=w7C0l0lFsyuhZH6E3/g9IKVSeZ+Jcfin9tOPX7+Sm98=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=e8YXrdMMRS6XjYVj7XpJBuc+m7WZn9aZJJe10v7wKy903YW75EKHRoyqGipyVl8Zm
 ODQVy1+Yy/4Ne8SoWKglzUtXUCpqTLOFaRiAxPBzaaeoR9RAzutsTGTDEWbHqTYV6t
 Bqcq7BJAn7UQKGrcOQ1finM/JT4NL9yvaKzgYoh4=
To: Sahitya Tummala <stummala@codeaurora.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
References: <1565185232-11506-1-git-send-email-stummala@codeaurora.org>
From: Chao Yu <chao@kernel.org>
Message-ID: <2b8f7a88-5204-a4ea-9f80-1056abb30d98@kernel.org>
Date: Wed, 7 Aug 2019 22:06:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1565185232-11506-1-git-send-email-stummala@codeaurora.org>
Content-Language: en-US
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hvMaK-00E00E-53
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: Fix indefinite loop in f2fs_gc()
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

On 2019-8-7 21:40, Sahitya Tummala wrote:
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
> GC loop under such error scenarios. Currently, add this logic under
> CONFIG_F2FS_CHECK_FS to be able to root cause the issue in debug
> version.
> 
> Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
> ---
> v4: Cover all logic with CONFIG_F2FS_CHECK_FS
> 
>  fs/f2fs/gc.c      | 31 +++++++++++++++++++++++++++++--
>  fs/f2fs/segment.c | 14 +++++++++++++-
>  fs/f2fs/segment.h |  3 +++
>  3 files changed, 45 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 8974672..cbcacbd 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -382,6 +382,16 @@ static int get_victim_by_default(struct f2fs_sb_info *sbi,
>  			nsearched++;
>  		}
>  
> +#ifdef CONFIG_F2FS_CHECK_FS
> +		/*
> +		 * skip selecting the invalid segno (that is failed due to block
> +		 * validity check failure during GC) to avoid endless GC loop in
> +		 * such cases.
> +		 */
> +		if (test_bit(segno, sm->invalid_segmap))
> +			goto next;
> +#endif
> +
>  		secno = GET_SEC_FROM_SEG(sbi, segno);
>  
>  		if (sec_usage_check(sbi, secno))
> @@ -602,8 +612,15 @@ static bool is_alive(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
>  {
>  	struct page *node_page;
>  	nid_t nid;
> -	unsigned int ofs_in_node;
> +	unsigned int ofs_in_node, segno;
>  	block_t source_blkaddr;
> +	unsigned long offset;
> +#ifdef CONFIG_F2FS_CHECK_FS
> +	struct sit_info *sit_i = SIT_I(sbi);
> +#endif
> +
> +	segno = GET_SEGNO(sbi, blkaddr);
> +	offset = GET_BLKOFF_FROM_SEG0(sbi, blkaddr);
>  
>  	nid = le32_to_cpu(sum->nid);
>  	ofs_in_node = le16_to_cpu(sum->ofs_in_node);
> @@ -627,8 +644,18 @@ static bool is_alive(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
>  	source_blkaddr = datablock_addr(NULL, node_page, ofs_in_node);
>  	f2fs_put_page(node_page, 1);
>  
> -	if (source_blkaddr != blkaddr)
> +	if (source_blkaddr != blkaddr) {
> +#ifdef CONFIG_F2FS_CHECK_FS

		unsigned int segno = GET_SEGNO(sbi, blkaddr);
		unsigned int offset = GET_BLKOFF_FROM_SEG0(sbi, blkaddr);

Should be local, otherwise it looks good to me, I think Jaegeuk can help to fix
this while merging.

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,

> +		if (unlikely(check_valid_map(sbi, segno, offset))) {
> +			if (!test_and_set_bit(segno, sit_i->invalid_segmap)) {
> +				f2fs_err(sbi, "mismatched blkaddr %u (source_blkaddr %u) in seg %u\n",
> +						blkaddr, source_blkaddr, segno);
> +				f2fs_bug_on(sbi, 1);
> +			}
> +		}
> +#endif
>  		return false;
> +	}
>  	return true;
>  }
>  
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index a661ac3..ee795b1 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -806,6 +806,9 @@ static void __remove_dirty_segment(struct f2fs_sb_info *sbi, unsigned int segno,
>  		enum dirty_type dirty_type)
>  {
>  	struct dirty_seglist_info *dirty_i = DIRTY_I(sbi);
> +#ifdef CONFIG_F2FS_CHECK_FS
> +	struct sit_info *sit_i = SIT_I(sbi);
> +#endif
>  
>  	if (test_and_clear_bit(segno, dirty_i->dirty_segmap[dirty_type]))
>  		dirty_i->nr_dirty[dirty_type]--;
> @@ -817,9 +820,13 @@ static void __remove_dirty_segment(struct f2fs_sb_info *sbi, unsigned int segno,
>  		if (test_and_clear_bit(segno, dirty_i->dirty_segmap[t]))
>  			dirty_i->nr_dirty[t]--;
>  
> -		if (get_valid_blocks(sbi, segno, true) == 0)
> +		if (get_valid_blocks(sbi, segno, true) == 0) {
>  			clear_bit(GET_SEC_FROM_SEG(sbi, segno),
>  						dirty_i->victim_secmap);
> +#ifdef CONFIG_F2FS_CHECK_FS
> +			clear_bit(segno, sit_i->invalid_segmap);
> +#endif
> +		}
>  	}
>  }
>  
> @@ -4015,6 +4022,10 @@ static int build_sit_info(struct f2fs_sb_info *sbi)
>  	sit_i->sit_bitmap_mir = kmemdup(src_bitmap, bitmap_size, GFP_KERNEL);
>  	if (!sit_i->sit_bitmap_mir)
>  		return -ENOMEM;
> +
> +	sit_i->invalid_segmap = f2fs_kvzalloc(sbi, bitmap_size, GFP_KERNEL);
> +	if (!sit_i->invalid_segmap)
> +		return -ENOMEM;
>  #endif
>  
>  	/* init SIT information */
> @@ -4517,6 +4528,7 @@ static void destroy_sit_info(struct f2fs_sb_info *sbi)
>  	kvfree(sit_i->sit_bitmap);
>  #ifdef CONFIG_F2FS_CHECK_FS
>  	kvfree(sit_i->sit_bitmap_mir);
> +	kvfree(sit_i->invalid_segmap);
>  #endif
>  	kvfree(sit_i);
>  }
> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> index b746028..9370d53 100644
> --- a/fs/f2fs/segment.h
> +++ b/fs/f2fs/segment.h
> @@ -229,6 +229,9 @@ struct sit_info {
>  	char *sit_bitmap;		/* SIT bitmap pointer */
>  #ifdef CONFIG_F2FS_CHECK_FS
>  	char *sit_bitmap_mir;		/* SIT bitmap mirror */
> +
> +	/* bitmap of segments to be ignored by GC in case of errors */
> +	unsigned long *invalid_segmap;
>  #endif
>  	unsigned int bitmap_size;	/* SIT bitmap size */
>  
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
