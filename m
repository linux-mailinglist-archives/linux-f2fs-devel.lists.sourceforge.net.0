Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2E36363DA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 23 Nov 2022 16:36:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oxrnw-0002q6-QD;
	Wed, 23 Nov 2022 15:36:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1oxrnu-0002px-Q0
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 23 Nov 2022 15:36:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fipQTHgMhtPS6F7RAECt44iGv/rx815JLVR+cjyGrW4=; b=cCdgvd79C/gOhp6V1VUB8nnEKD
 VdR0uCxjjoiN7PxHJx3eRXf/VP5/mqLrW3c7sVl6gHHJu7426L574ZGdETXjQLXTsOf8/cptqC/sY
 5jAaZCdvEq5d8bJEs0wFF2nqFYTb+UNhg5Gn1uA0iwn7w+6v/FCg3iebHbKzgXLg9Jz0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fipQTHgMhtPS6F7RAECt44iGv/rx815JLVR+cjyGrW4=; b=OeSmc/90T7OvB5zv0KrT4yrAtc
 TM3z065b9VF3b4+L9ckvDKI9DzeCjhYxSMLhTKVVHTfqSS4eXHrYPkDn0UyIH2rdwRKyEIlLbFmJE
 GFRluRJLsHWJxJp0V2f6U8VGK57nWsnGBhdPmwX8DDRFOd25KMdy4/gU+oh6qAu7ccJ0=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oxrnu-0006be-06 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 23 Nov 2022 15:36:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AE686B8216D;
 Wed, 23 Nov 2022 15:36:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39B0BC433C1;
 Wed, 23 Nov 2022 15:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669217802;
 bh=Db2IMqt/WnSC6DJcik+jIpLTIIOJDwi9tk6VSBExq7s=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Pa9gjxejMoB6NBP/+t0yFzKXmAt+UwG4jEZ37OvVsQZrwr70uTQj0NrXgO6He/FsN
 3mPOKgWgo20myCQck0T9ZJH3Gy2o80QsyIiD9J2pHz4VpbKeGDmmYhdpajKsYbXHS/
 OjRDWWqa+EgnU/HBW4qXDIWEGkzXtDw0a/3guyLyTyk2T2im5mfhE7aBejwqgjBj9S
 oCueTveZ129pTh2AgcJ3wX4YfKokRQ3PUyh719uU9jJbxJSAU7Yo2eOfKGOWvILdaG
 9FgnVZJQeQfximeaxZsB2GVuLhlFM+f1Wqi5DBNLjpwap2Hkwy3/JibcbJ01/3Nqr4
 uNua9p+uZNZlg==
Message-ID: <6258327d-8205-644e-9879-c96448841720@kernel.org>
Date: Wed, 23 Nov 2022 23:36:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org
References: <20221118034600.59489-1-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20221118034600.59489-1-frank.li@vivo.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/11/18 11:46, Yangtao Li wrote: > Under the current
 logic, after the discard thread wakes up, it will not > run according to
 the expected policy, but will use the expected policy > before sleep [...]
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oxrnu-0006be-06
Subject: Re: [f2fs-dev] [PATCH] f2fs: init discard policy after thread wakeup
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/11/18 11:46, Yangtao Li wrote:
> Under the current logic, after the discard thread wakes up, it will not
> run according to the expected policy, but will use the expected policy
> before sleep. Move the strategy selection to after the thread wakes up,
> so that the running state of the thread meets expectations.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>   fs/f2fs/segment.c | 20 +++++++++-----------
>   1 file changed, 9 insertions(+), 11 deletions(-)
> 
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 8b0b76550578..609e90aa80c2 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -1685,6 +1685,11 @@ static int issue_discard_thread(void *data)
>   	set_freezable();
>   
>   	do {

		if (!atomic_read(&dcc->discard_cmd_cnt))
		       wait_ms = dpolicy.max_interval;

Thanks,

> +		wait_event_interruptible_timeout(*q,
> +				kthread_should_stop() || freezing(current) ||
> +				dcc->discard_wake,
> +				msecs_to_jiffies(wait_ms));
> +
>   		if (sbi->gc_mode == GC_URGENT_HIGH ||
>   			!f2fs_available_free_memory(sbi, DISCARD_CACHE))
>   			__init_discard_policy(sbi, &dpolicy, DPOLICY_FORCE, 1);
> @@ -1692,14 +1697,6 @@ static int issue_discard_thread(void *data)
>   			__init_discard_policy(sbi, &dpolicy, DPOLICY_BG,
>   						dcc->discard_granularity);
>   
> -		if (!atomic_read(&dcc->discard_cmd_cnt))
> -		       wait_ms = dpolicy.max_interval;
> -
> -		wait_event_interruptible_timeout(*q,
> -				kthread_should_stop() || freezing(current) ||
> -				dcc->discard_wake,
> -				msecs_to_jiffies(wait_ms));
> -
>   		if (dcc->discard_wake)
>   			dcc->discard_wake = 0;
>   
> @@ -1713,12 +1710,11 @@ static int issue_discard_thread(void *data)
>   			continue;
>   		if (kthread_should_stop())
>   			return 0;
> -		if (is_sbi_flag_set(sbi, SBI_NEED_FSCK)) {
> +		if (is_sbi_flag_set(sbi, SBI_NEED_FSCK) ||
> +			!atomic_read(&dcc->discard_cmd_cnt)) {
>   			wait_ms = dpolicy.max_interval;
>   			continue;
>   		}
> -		if (!atomic_read(&dcc->discard_cmd_cnt))
> -			continue;
>   
>   		sb_start_intwrite(sbi->sb);
>   
> @@ -1733,6 +1729,8 @@ static int issue_discard_thread(void *data)
>   		} else {
>   			wait_ms = dpolicy.max_interval;
>   		}
> +		if (!atomic_read(&dcc->discard_cmd_cnt))
> +			wait_ms = dpolicy.max_interval;
>   
>   		sb_end_intwrite(sbi->sb);
>   


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
