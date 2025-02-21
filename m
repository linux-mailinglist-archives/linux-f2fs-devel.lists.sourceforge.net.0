Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 800ECA3EAB0
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Feb 2025 03:19:40 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tlIdb-0001hR-UT;
	Fri, 21 Feb 2025 02:19:35 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tlIda-0001hK-3V
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Feb 2025 02:19:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aA/TYNyw6tNSd63i/toSTOjWBKu28m/1jjoS/Hzy1n4=; b=Q3n4C8X2IxDKoeuE8Qc3nyMFM1
 m51xvpqzA+RnHoMZHipTxt7xFzbS93EhOjpGlf7ccJAqsFwIQQsz6XjbzLFXsYTBADgNcmidMmPiV
 1z024OkQKNxRpXPK7vIeN2Lg6Ua01gbmVEOw57mUMLyZZH3AjQo82LLdD/5cLof1MDJI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aA/TYNyw6tNSd63i/toSTOjWBKu28m/1jjoS/Hzy1n4=; b=WsSDjF+6la9VilE6LlHGZpp4lt
 mGOJK0pOoRJWbyW0b5tokOYFhZLgJLCFm4xvOxCkIfQ37ntD9JKRDoUJzXELzb0I2j7oBaSGUtnrA
 jLFJ4kt7l9Wn+3clogxM0pDHT1iSW4FiUnz2u2mOVw4BBWK+36mIPJZF+/U6FcRgvo/U=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tlIdY-0005S3-P4 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Feb 2025 02:19:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 506EC5C5559;
 Fri, 21 Feb 2025 02:18:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0E83C4CEE2;
 Fri, 21 Feb 2025 02:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740104362;
 bh=IXFVmyxXiZyUE5Rvw8hT3fkk95tLDsh1VA2zohW+Ih0=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=UebIWKuWMhOPD+PWUaoEMWVO9NwQQADbJ4s3lZdcwgtg583zHbzrmli1adVKTdp21
 NZMRmFHWouaMQ2wFHCoo0lONYmWWJPAZOvelFFrzJHbCcMTfRUmyPtglzedztWxjQs
 bkD0jkJ5d+wMz8H8iffknkcHZo6Nz7S4eUYY+/pukDAVRqsupwzgRzrbv5qW1p/N0c
 ibecU9bweVjX/KEz4eyXPTIUmeDys3gVkumROySUEtT8vv7qzXLA/52odAKMlWfcmP
 L04Jmrjyy1mzDpMayfRASVmqOt9wEKdvSzuFSsLtfKyfvb0a/3K6T/gGZm9M/R9DPb
 GF93GJIHrX2Dg==
Message-ID: <e62dfe59-61a9-426f-bec4-69223b7247f9@kernel.org>
Date: Fri, 21 Feb 2025 10:19:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20250220154904.2698964-1-daeho43@gmail.com>
Content-Language: en-US
Autocrypt: addr=chao@kernel.org; keydata=
 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
In-Reply-To: <20250220154904.2698964-1-daeho43@gmail.com>
X-Spam-Score: -5.7 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025/2/20 23:49, Daeho Jeong wrote: > From: Daeho Jeong
 <daehojeong@google.com> > > When we support segment or section unit discard,
 we should only focus on > how actively we submit discard command [...] 
 Content analysis details:   (-5.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tlIdY-0005S3-P4
Subject: Re: [f2fs-dev] [PATCH] f2fs: do not use granularity control for
 segment or section unit discard
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

On 2025/2/20 23:49, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> When we support segment or section unit discard, we should only focus on
> how actively we submit discard commands for only one type of size, such
> as segment or section. In this case, we don't have to manage smaller
> sized discards.
> 
> Reported-by: Yohan Joung <yohan.joung@sk.com>
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
>   fs/f2fs/segment.c | 29 ++++++++++++++++++++---------
>   1 file changed, 20 insertions(+), 9 deletions(-)
> 
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index c282e8a0a2ec..4316ff7aa0d1 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -1661,12 +1661,20 @@ static int __issue_discard_cmd(struct f2fs_sb_info *sbi,
>   				f2fs_time_over(sbi, UMOUNT_DISCARD_TIMEOUT))
>   			break;
>   
> -		if (i + 1 < dpolicy->granularity)
> -			break;
> +		/*
> +		 * Do not granularity control for segment or section
> +		 * unit discard, since we have only one type of discard length.
> +		 */
> +		if (f2fs_block_unit_discard(sbi)) {
> +			if (i + 1 < dpolicy->granularity)
> +				break;
>   
> -		if (i + 1 < dcc->max_ordered_discard && dpolicy->ordered) {
> -			__issue_discard_cmd_orderly(sbi, dpolicy, &issued);
> -			return issued;
> +			if (i + 1 < dcc->max_ordered_discard &&
> +					dpolicy->ordered) {
> +				__issue_discard_cmd_orderly(sbi, dpolicy,
> +						&issued);
> +				return issued;
> +			}
>   		}
>   
>   		pend_list = &dcc->pend_list[i];
> @@ -1701,6 +1709,13 @@ static int __issue_discard_cmd(struct f2fs_sb_info *sbi,
>   
>   		if (issued >= dpolicy->max_requests || io_interrupted)
>   			break;
> +
> +		/*
> +		 * We only use the largest discard unit for segment or
> +		 * section unit discard.
> +		 */
> +		if (!f2fs_block_unit_discard(sbi))
> +			break;
>   	}
>   
>   	if (dpolicy->type == DPOLICY_UMOUNT && issued) {
> @@ -2320,10 +2335,6 @@ static int create_discard_cmd_control(struct f2fs_sb_info *sbi)
>   	dcc->discard_granularity = DEFAULT_DISCARD_GRANULARITY;
>   	dcc->max_ordered_discard = DEFAULT_MAX_ORDERED_DISCARD_GRANULARITY;
>   	dcc->discard_io_aware = DPOLICY_IO_AWARE_ENABLE;
> -	if (F2FS_OPTION(sbi).discard_unit == DISCARD_UNIT_SEGMENT)
> -		dcc->discard_granularity = BLKS_PER_SEG(sbi);
> -	else if (F2FS_OPTION(sbi).discard_unit == DISCARD_UNIT_SECTION)
> -		dcc->discard_granularity = BLKS_PER_SEC(sbi);

Hi Daeho,

I think this bug was introduced by commit 4f993264fe29 ("f2fs: introduce
discard_unit mount option"), since it set discard_granularity to section
size incorrectly for discard_unit=section mount option, once section size
is large than segment size, discard_granularity will be larger than 512.

However, w/ current implementation, we only support range of [1, 512] for
discard_granularity parameter, resulting in failing to submitting all
dicards.

So, what do you think of setting discard_granularity to 512 for both
discard_unit=segment and discard_unit=section mount option, as I proposed
in [1]? Then, discard_thread in DPOLICY_BG mode can submit those large-sized
discards.

[1] https://lore.kernel.org/linux-f2fs-devel/53598146-1f01-41ad-980e-9f4b989e81ab@kernel.org/

Thanks,

>   
>   	INIT_LIST_HEAD(&dcc->entry_list);
>   	for (i = 0; i < MAX_PLIST_NUM; i++)



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
