Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA6DAADA17
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 May 2025 10:26:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FoW/PIsCndHxWszzDlqGsphTvCvEPasG8E/tFnDrvKw=; b=RJPBlewXTNINLGvtnWpWAm/ePK
	K1MStWfvVUd1OdAqWo/A2LspnV+BeXW8pl3RoN4HqkO1t36/VlS6V2OItnRAeM/UGPvKRTEJ8HtUF
	edfwo3UgBiMp4s9CnkZawVD1PDHaiXEHWubd9CXeJY/QP8DVJG1DVBQTeQKDqd9hY2a0=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uCa6G-00016a-5D;
	Wed, 07 May 2025 08:25:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uCa6A-00014J-4f
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 May 2025 08:25:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jsL2zV2GI3izuE8kovX8w2HbmFyOHtTqGkpAU31XAmQ=; b=DgTNf+cfkQLg9vSILLxOTWSmLl
 qVs7xw6J7AFD+oOUckLn4Q4N1qbkc3ZsTh8S6JdKHVrT2G3LUfr2ADEwhjmAa5AlNav+lomQ2MJO8
 WQh8VpOvIeAr+ooyLhZuV56SIvKg9eh+lH52UGvMMdBTB6vKkhHrqGy6AJ+p+vPsLBFQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jsL2zV2GI3izuE8kovX8w2HbmFyOHtTqGkpAU31XAmQ=; b=JJZfojNGVIjDZ/egJOLtA1+dz+
 gDmpeEhX8rqLadp61kTlCBD0qcCUeMe/7+tG2Fiu+BiAjkuCpLnl5YkYCOrDH327Mdi/beXiBZvfk
 Zq1xtTMyeHa+qc3WzOXdTx62Xmuvot0sF7wFIFrvmPu2Hs52HjoHqUeB01MDfBPxI490=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uCa5u-00074P-KV for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 May 2025 08:25:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B03E6629E3;
 Wed,  7 May 2025 08:25:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C6F5C4CEE7;
 Wed,  7 May 2025 08:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746606328;
 bh=OHTRZaNtriLqkULeuZpFqR5miAeK7XH76kJ1OIoEIp8=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=Iz2x9TX7mItLvPjvCTtG/DtUzTG7cG+vx3C67sliDFTZCVNDt+RugtMjL0Alnr541
 RG7XUUgt+11Go+hjm2B5WUUklfqlRugw4kon/1qwToK7HyQaEU/LRPq4uMxjY2t7hg
 TeLOU927tc9BG8gTdsGJJaCY9FIiJ6wdsCXTZ48WFRr+fXTxzm5NbRZe7S56OW1/Tl
 m1XsqwJnz+wZFBS0aO/3yKJ8vBvyVcofv1qdRKw8K5hY8OyrpjK9y6OEpooW8F9Q1+
 EdfkJxV42kihFZIpSVTZ4UKrxGG7K7rtYPI9vWzFHpkcAMcQL8D+HXpLPWJc2lAmaS
 uM9zTsk6FzQMg==
Message-ID: <ddbb5e57-5a50-40fe-96ef-c2a3c0c72a13@kernel.org>
Date: Wed, 7 May 2025 16:25:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "yohan.joung" <yohan.joung@sk.com>, jaegeuk@kernel.org,
 daehojeong@google.com
References: <20250507043038.591-1-yohan.joung@sk.com>
Content-Language: en-US
In-Reply-To: <20250507043038.591-1-yohan.joung@sk.com>
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/7/25 12:30, yohan.joung wrote: > In LFS mode,
 the previous segment cannot use invalid blocks,
 > so the remaining blocks from the next_blkoff
 of the current segment > to the end of the section are [...] 
 Content analysis details:   (-1.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uCa5u-00074P-KV
Subject: Re: [f2fs-dev] [PATCH v3 1/2] f2fs: add a method for calculating
 the remaining blocks in the current segment in LFS mode.
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: pilhyun.kim@sk.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 5/7/25 12:30, yohan.joung wrote:
> In LFS mode, the previous segment cannot use invalid blocks,
> so the remaining blocks from the next_blkoff of the current segment
> to the end of the section are calculated.
> 
> Signed-off-by: yohan.joung <yohan.joung@sk.com>
> ---
>  fs/f2fs/segment.h | 23 +++++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> index 03c0f59be5a8..f5d30f32ebdb 100644
> --- a/fs/f2fs/segment.h
> +++ b/fs/f2fs/segment.h
> @@ -102,6 +102,8 @@ static inline void sanity_check_seg_type(struct f2fs_sb_info *sbi,
>  #define CAP_SEGS_PER_SEC(sbi)					\
>  	(SEGS_PER_SEC(sbi) -					\
>  	BLKS_TO_SEGS(sbi, (sbi)->unusable_blocks_per_sec))
> +#define GET_START_SEG_FROM_SEC(sbi, segno)			\
> +	(rounddown(segno, SEGS_PER_SEC(sbi)))
>  #define GET_SEC_FROM_SEG(sbi, segno)				\
>  	(((segno) == -1) ? -1 : (segno) / SEGS_PER_SEC(sbi))
>  #define GET_SEG_FROM_SEC(sbi, secno)				\
> @@ -582,8 +584,14 @@ static inline bool has_curseg_enough_space(struct f2fs_sb_info *sbi,
>  		if (unlikely(segno == NULL_SEGNO))
>  			return false;
>  
> -		left_blocks = CAP_BLKS_PER_SEC(sbi) -
> -				get_ckpt_valid_blocks(sbi, segno, true);
> +		if (f2fs_lfs_mode(sbi) && __is_large_section(sbi)) {
> +			left_blocks = CAP_BLKS_PER_SEC(sbi) -
> +				(segno - GET_START_SEG_FROM_SEC(sbi, segno)) * BLKS_PER_SEG(sbi) -

SEGS_TO_BLKS(sbi, (segno - GET_START_SEG_FROM_SEC(sbi, segno))) ?

> +				CURSEG_I(sbi, i)->next_blkoff;
> +		} else {
> +			left_blocks = CAP_BLKS_PER_SEC(sbi) -
> +					get_ckpt_valid_blocks(sbi, segno, true);
> +		}
>  
>  		blocks = i <= CURSEG_COLD_DATA ? data_blocks : node_blocks;
>  		if (blocks > left_blocks)
> @@ -596,8 +604,15 @@ static inline bool has_curseg_enough_space(struct f2fs_sb_info *sbi,
>  	if (unlikely(segno == NULL_SEGNO))
>  		return false;
>  
> -	left_blocks = CAP_BLKS_PER_SEC(sbi) -
> -			get_ckpt_valid_blocks(sbi, segno, true);
> +	if (f2fs_lfs_mode(sbi) && __is_large_section(sbi)) {
> +		left_blocks = CAP_BLKS_PER_SEC(sbi) -
> +				(segno - GET_START_SEG_FROM_SEC(sbi, segno)) * BLKS_PER_SEG(sbi) -

Ditto,

> +				CURSEG_I(sbi, CURSEG_HOT_DATA)->next_blkoff;
> +	} else {
> +		left_blocks = CAP_BLKS_PER_SEC(sbi) -
> +				get_ckpt_valid_blocks(sbi, segno, true);
> +	}
> +
>  	if (dent_blocks > left_blocks)
>  		return false;
>  	return true;



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
