Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7962D92C565
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  9 Jul 2024 23:38:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sRIXJ-0006SE-0g;
	Tue, 09 Jul 2024 21:38:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1sRIXH-0006S5-56
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 Jul 2024 21:38:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=66OA481FzLGJnV+T7aHXNWhyGBdnm2SSFx3vPMi/Phs=; b=X1syHRIY6oLJt1qb2BJxzl+ujF
 aIXcXAW+UVMzMf90ZZixMbhR8N/52PN/13IwGeOCNDqaMHR/EdwX/3p72a/5o38JWJmF1V53J23Bb
 QUKQjk+8YE+DbxD9gGxki2+WdgTrGfAwV9S8x7Pzen0oGHFJ2hixJBKxBb4yBeyzJfAw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=66OA481FzLGJnV+T7aHXNWhyGBdnm2SSFx3vPMi/Phs=; b=N7j81gZIZYpS5sTRW+2y6o+zWp
 2X4xea/cplJ3MFN7rwVo4Qmucvu2VOF2Nf3FXal5L2EBD7PwWrMWPOA78OodyGhm1nxn64I8vGcay
 DFeXVQGGxLwC0ZLjsuaPAMJybFo2ctmJLgvyqfRwQKuLvJT6b3fJcxIW6kfv0JmOfueo=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sRIXG-0000vZ-9f for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 Jul 2024 21:38:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id CE834CE1320;
 Tue,  9 Jul 2024 21:37:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC2F0C32786;
 Tue,  9 Jul 2024 21:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720561073;
 bh=gsLdDddWkHg5lq2YwUFU5nuknJozwpUymGvYM9nQiIg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=u2sQbdUL2DveWVPjld3UkF5xK9RsJt0/zgw/DBnaUDWI5oRY+neLWb02TwwXgQ8f8
 PQWbp1O8UTT4yC4s6Va2/skbZyiLALG6N2YfsYkJpuSACpqHCSR7V0egmQX3FN21Yo
 41W7jGc0Juiwu0IeT9J6YYL3CH0PcrXlr8XEitaFSFXKjiMmuagYlljioeJr4Y2lvC
 JSwIjbhTJcyDSDl1rrex62LjiFPG6SlsANrQrK7tVN+5CAbQyiC9+66k1lsBdAX4XQ
 VI9g76/9wdEsVfGbHNr50mKUoasEGmpI6DHWQm+aqQeyvT+Cm1lH19k1zDsgAWERU/
 s8dxAIzFp+QVg==
Date: Tue, 9 Jul 2024 21:37:51 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Sheng Yong <shengyong@oppo.com>
Message-ID: <Zo2tr92oxPEuKBFm@google.com>
References: <20240625075839.3750112-1-shengyong@oppo.com>
 <20240625121512.3877754-1-shengyong@oppo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240625121512.3877754-1-shengyong@oppo.com>
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 06/25, Sheng Yong wrote: > When new_curseg() is allocating
 a new segment, if mode=fragment:xxx is > switched on in large section scenario,
 __get_next_segno() will select > the next segno randomly i [...] 
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sRIXG-0000vZ-9f
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: only fragment segment in the same
 section
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
Cc: daehojeong@google.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 06/25, Sheng Yong wrote:
> When new_curseg() is allocating a new segment, if mode=fragment:xxx is
> switched on in large section scenario, __get_next_segno() will select
> the next segno randomly in the range of [0, maxsegno] in order to
> fragment segments.
> 
> If the candidate segno is free, get_new_segment() will use it directly
> as the new segment.
> 
> However, if the section of the candidate is not empty, and some other
> segments have already been used, and have a different type (e.g NODE)
> with the candidate (e.g DATA), GC will complain inconsistent segment
> type later.
> 
> This could be reproduced by the following steps:
> 
>   dd if=/dev/zero of=test.img bs=1M count=10240
>   mkfs.f2fs -s 128 test.img
>   mount -t f2fs test.img /mnt -o mode=fragment:block
>   echo 1 > /sys/fs/f2fs/loop0/max_fragment_chunk
>   echo 512 > /sys/fs/f2fs/loop0/max_fragment_hole
>   dd if=/dev/zero of=/mnt/testfile bs=4K count=100
>   umount /mnt
> 
>   F2FS-fs (loop0): Inconsistent segment (4377) type [0, 1] in SSA and SIT
> 
> In order to allow simulating segment fragmentation in large section
> scenario, this patch reduces the candidate range:
>  * if curseg is the last segment in the section, return curseg->segno
>    to make get_new_segment() itself find the next free segment.
>  * if curseg is in the middle of the secion, select candicate randomly in
>    the range of [curseg + 1, last_seg_in_the_same_section] to keep type
>    consistent.
> 
> Signed-off-by: Sheng Yong <shengyong@oppo.com>
> ---
> v2: update commit msg
> ---
>  fs/f2fs/segment.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index a0ce3d080f80a..55d474f5c2103 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -2782,10 +2782,21 @@ static unsigned int __get_next_segno(struct f2fs_sb_info *sbi, int type)
>  {
>  	struct curseg_info *curseg = CURSEG_I(sbi, type);
>  	unsigned short seg_type = curseg->seg_type;
> +	unsigned int hint;
>  
>  	sanity_check_seg_type(sbi, seg_type);
> -	if (f2fs_need_rand_seg(sbi))
> -		return get_random_u32_below(MAIN_SECS(sbi) * SEGS_PER_SEC(sbi));
> +	if (f2fs_need_rand_seg(sbi)) {
> +		if (__is_large_section(sbi)) {
> +			hint = GET_SEC_FROM_SEG(sbi, curseg->segno);
> +			if (GET_SEC_FROM_SEG(sbi, curseg->segno + 1) != hint)
> +				return curseg->segno;
> +			return get_random_u32_inclusive(curseg->segno + 1,
> +					GET_SEG_FROM_SEC(sbi, hint + 1) - 1);
> +		} else {
> +			return get_random_u32_below(MAIN_SECS(sbi) *
> +						SEGS_PER_SEC(sbi));
> +		}
> +	}
>  
>  	if (__is_large_section(sbi))
>  		return curseg->segno;

	if (__is_large_section(sbi)) {
		if (f2fs_need_rand_seg(sbi)) {
			unsigned int hint = GET_SEC_FROM_SEG(sbi, curseg->segno);
			if (GET_SEC_FROM_SEG(sbi, curseg->segno + 1) != hint)
				return curseg->segno;
			return get_random_u32_inclusive(curseg->segno + 1,
					GET_SEG_FROM_SEC(sbi, hint + 1) - 1);
		}
		return curseg->segno;
	} else if (f2fs_need_rand_seg(sbi)) {
		return get_random_u32_below(MAIN_SECS(sbi) * SEGS_PER_SEC(sbi));
	}

> -- 
> 2.40.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
