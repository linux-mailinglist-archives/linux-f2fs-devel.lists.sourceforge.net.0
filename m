Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D303996E7ED
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  6 Sep 2024 04:56:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1smP92-00075X-0l;
	Fri, 06 Sep 2024 02:56:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1smP8z-00075P-05
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 06 Sep 2024 02:56:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Hl0V1ybPzdOshtEvgn1gQWfj3F7B0K93i9hyp6no5dQ=; b=Vg8ksUcBw8ilXMpgX+IkP3hKq5
 5Dfbr4Ha46TYabjV22dvodx1+H5zRgmNeBU2s/JCEV//Qdqg45NgdVfygC7Jn9XhnEzmqrrJQ+Xyp
 su6K0Og8TmHMCrQDAX9p7FwXOXVxKRCPJ+x0T46DPKXwL57t84l/G9IbPkgxMBnjbWpk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Hl0V1ybPzdOshtEvgn1gQWfj3F7B0K93i9hyp6no5dQ=; b=hrN/sl2mJldufY/GcuaRKT2Uu6
 M86WY8q3erKzZmHBZhVZ6owQZyh6Qo1oSiA2I/llpkJsA6aohAEjJIN8ZLA73tfs/qfVhusMp+87D
 CLViChB+9niGRqIeEzA3jFmjTXtTJvdvU6m49kvI2uGtK3a5U+lu/lbQ73N4IwqzNRUA=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1smP8y-0005Ik-6V for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 06 Sep 2024 02:56:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 290D9A4370B;
 Fri,  6 Sep 2024 02:56:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E264EC4CEC3;
 Fri,  6 Sep 2024 02:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725591370;
 bh=qgnvsxHpCz4EVBPco1NOjE/FCNHMlw/IPYRztBb49aY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Z0uSUxFvjxemebFIt78o6fDrJCp8BCtbUae6TTI7RWpZH8sOpIgm+1pqE6OZ4+4Kr
 oBBs3P/Cj1Dl42a8vE2TTl+ihni6Z+nB8B29dbTskrIC8FxPxLzaW21x15Dl5jtZTD
 ai5xzcfiRSIvPRy24gwZLhz7iHDeqqk5ck4e7kgdSR2PFoVBKYcc+ZiYK1I3vyMrhF
 RUVHjh8px5ceccf38golfl39VGFzgpxPHUFJuZR63LKZS56hjMuvRTSW5mLgSzg9e7
 vman8HjnhMCzRitB8Yd60JowQyuK39RC8Iwff2XmFfMNOkjNpwj8S4vx/D91Fetiln
 A6Z65OjtQ9IrA==
Message-ID: <501416af-b08c-448b-881d-0915575e22f5@kernel.org>
Date: Fri, 6 Sep 2024 10:56:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20240829215242.3641502-1-daeho43@gmail.com>
 <20240829215242.3641502-2-daeho43@gmail.com>
Content-Language: en-US
In-Reply-To: <20240829215242.3641502-2-daeho43@gmail.com>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/8/30 5:52, Daeho Jeong wrote: > From: Daeho Jeong
 <daehojeong@google.com> > > Now we do readahead for a full section by not
 considering > migration_granularity and it triggers unnecessary read [...]
 Content analysis details:   (-0.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1smP8y-0005Ik-6V
Subject: Re: [f2fs-dev] [PATCH 2/7] f2fs: read summary blocks with the
 correct amount for migration_granularity
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/8/30 5:52, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Now we do readahead for a full section by not considering
> migration_granularity and it triggers unnecessary read. So, make it read
> with the correct amount.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
>   fs/f2fs/gc.c | 33 ++++++++++++++++++++-------------
>   1 file changed, 20 insertions(+), 13 deletions(-)
> 
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 46e3bc26b78a..b5d3fd40b17a 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -1708,24 +1708,33 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
>   	struct blk_plug plug;
>   	unsigned int segno = start_segno;
>   	unsigned int end_segno = start_segno + SEGS_PER_SEC(sbi);
> +	unsigned int sec_end_segno;
>   	int seg_freed = 0, migrated = 0;
>   	unsigned char type = IS_DATASEG(get_seg_entry(sbi, segno)->type) ?
>   						SUM_TYPE_DATA : SUM_TYPE_NODE;
>   	unsigned char data_type = (type == SUM_TYPE_DATA) ? DATA : NODE;
>   	int submitted = 0;
>   
> -	if (__is_large_section(sbi))
> -		end_segno = rounddown(end_segno, SEGS_PER_SEC(sbi));
> +	if (__is_large_section(sbi)) {
> +		sec_end_segno = rounddown(end_segno, SEGS_PER_SEC(sbi));
>   
> -	/*
> -	 * zone-capacity can be less than zone-size in zoned devices,
> -	 * resulting in less than expected usable segments in the zone,
> -	 * calculate the end segno in the zone which can be garbage collected
> -	 */
> -	if (f2fs_sb_has_blkzoned(sbi))
> -		end_segno -= SEGS_PER_SEC(sbi) -
> +		/*
> +		 * zone-capacity can be less than zone-size in zoned devices,
> +		 * resulting in less than expected usable segments in the zone,
> +		 * calculate the end segno in the zone which can be garbage
> +		 * collected
> +		 */
> +		if (f2fs_sb_has_blkzoned(sbi))
> +			sec_end_segno -= SEGS_PER_SEC(sbi) -
>   					f2fs_usable_segs_in_sec(sbi, segno);
>   
> +		if (gc_type == BG_GC)
> +			end_segno = start_segno + sbi->migration_granularity;
> +
> +		if (end_segno > sec_end_segno)
> +			end_segno = sec_end_segno;
> +	}
> +
>   	sanity_check_seg_type(sbi, get_seg_entry(sbi, segno)->type);
>   
>   	/* readahead multi ssa blocks those have contiguous address */
> @@ -1762,9 +1771,6 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
>   
>   		if (get_valid_blocks(sbi, segno, false) == 0)
>   			goto freed;
> -		if (gc_type == BG_GC && __is_large_section(sbi) &&
> -				migrated >= sbi->migration_granularity)

It seems we change the logic from migrating "migration_granularity" segments which
has valid blocks to scanning "migration_granularity" segments and try migrating
valid blocks in those segments.

IIUC, when background GC recycle sparse zone, it will take gc thread more round,
it seems low efficient. How do you think of keeping previous implementation?

Thanks,

> -			goto skip;
>   		if (!PageUptodate(sum_page) || unlikely(f2fs_cp_error(sbi)))
>   			goto skip;
>   
> @@ -1803,7 +1809,8 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
>   
>   		if (__is_large_section(sbi))
>   			sbi->next_victim_seg[gc_type] =
> -				(segno + 1 < end_segno) ? segno + 1 : NULL_SEGNO;
> +				(segno + 1 < sec_end_segno) ?
> +					segno + 1 : NULL_SEGNO;
>   skip:
>   		f2fs_put_page(sum_page, 0);
>   	}



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
