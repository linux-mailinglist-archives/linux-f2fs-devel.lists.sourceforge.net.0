Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9E651EE51
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  8 May 2022 16:41:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nni6G-0007JB-2d; Sun, 08 May 2022 14:41:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nni6E-0007Ie-RB
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 08 May 2022 14:41:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pkj4h1N5vUw3ptwUNxt5tmuIW/mBf6Cvd1BuowRIVCM=; b=Tz8LpkRc2t10vzJDFKph55ma2t
 likqfaPMsIzoEBO//X6xyLjI+rP9TwdEQPxiX7xOZ0sC5cmCpeKwsfl0BRVW8TUI/osMtWDpx98SW
 2kZXAWYgBHwwvJY06GBgadsxeq5cvzZedGfyrSwks+ib2T78fj424YeY4X5j3Fabe6RQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pkj4h1N5vUw3ptwUNxt5tmuIW/mBf6Cvd1BuowRIVCM=; b=AnvwYsgT9B4hH7hnNA9sLscg0T
 L8cz8jXkub2Yr5BgLc6M3kv10MSVYXTT0GqhVOOiCcW1a/YBTMY/E5MLqkr7Ehwx8LbKjgwSPRqCa
 ZteYRdNG3x6MVQxw/YN3HDah8JSqGMT7taxJ+ewOPgrGl2AsL6TePlt63q3OVGpxuszI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nni6C-0004ax-NG
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 08 May 2022 14:41:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 833AD611DC
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun,  8 May 2022 14:41:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A9C7C385A4;
 Sun,  8 May 2022 14:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652020877;
 bh=t8HXZdI0ta/IUuWc1jQys+uGfSMD6nMCvKG+hO+WBPM=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=kJ46Gd53tCLywcEn4kCqDiiuLMTMC6Uoaq1aF9x+umUYyVUCxl5X7uG+g/IMEtJw+
 /VupFsaSTJI5s1SgnEkEl1eFERtDEeKWWitjL0+bsM6Gd2nmxTNrZ84RAtFhAc2iJS
 EmTxaA9fP40nE7NzB1vDtyZOkuwAThuI032kF3RtLT9ctTkXfdI58N/yZOh/C+FUi/
 CBXh2WdM7I4RXHBsWXhlaS3tIlx76w7+fAfshQK45xbBO2lf5zMKfom2W7kWvUbwuE
 JP5EQZbWSMLmgYrVeG/TeCdyTMp3VN8Zd8PVji01vxsDjg5yGWB0WkIEpKvysgRG+I
 2qn0dKGiBem7g==
Message-ID: <eb8f1316-11df-ab02-1834-542ca193c17c@kernel.org>
Date: Sun, 8 May 2022 22:41:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20220506232032.1264078-1-jaegeuk@kernel.org>
 <20220506232032.1264078-3-jaegeuk@kernel.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220506232032.1264078-3-jaegeuk@kernel.org>
X-Spam-Score: -7.3 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/5/7 7:20, Jaegeuk Kim wrote: > In f2fs_gc thread,
 let's keep wait_ms when sec_freed was zero. sec_freed won't increase for
 background
 GC due to below statement: if (gc_type == FG_GC && get_valid_blocks(sbi,
 segno, false) == 0) seg_freed++; 
 Content analysis details:   (-7.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.5 NICE_REPLY_A           Looks like a legit reply (A)
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nni6C-0004ax-NG
Subject: Re: [f2fs-dev] [PATCH 3/5] f2fs: keep wait_ms if EAGAIN happens
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

On 2022/5/7 7:20, Jaegeuk Kim wrote:
> In f2fs_gc thread, let's keep wait_ms when sec_freed was zero.

sec_freed won't increase for background GC due to below statement:

		if (gc_type == FG_GC &&
				get_valid_blocks(sbi, segno, false) == 0)
			seg_freed++;

It may cause gc thread migrates lots of segments in each round?

Thanks,

> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>   fs/f2fs/gc.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index aeffcc1d5c02..ec3f6f876e76 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -37,7 +37,8 @@ static int gc_thread_func(void *data)
>   	unsigned int wait_ms;
>   	struct f2fs_gc_control gc_control = {
>   		.victim_segno = NULL_SEGNO,
> -		.should_migrate_blocks = false };
> +		.should_migrate_blocks = false,
> +		.err_gc_skipped = false };
>   
>   	wait_ms = gc_th->min_sleep_time;
>   
> @@ -146,7 +147,6 @@ static int gc_thread_func(void *data)
>   
>   		gc_control.init_gc_type = sync_mode ? FG_GC : BG_GC;
>   		gc_control.no_bg_gc = foreground;
> -		gc_control.err_gc_skipped = sync_mode;
>   
>   		/* if return value is not zero, no victim was selected */
>   		if (f2fs_gc(sbi, &gc_control))


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
