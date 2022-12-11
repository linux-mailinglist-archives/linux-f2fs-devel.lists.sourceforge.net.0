Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DD4649210
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 11 Dec 2022 03:52:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p4CS8-0003LG-EP;
	Sun, 11 Dec 2022 02:52:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1p4CS6-0003L3-OJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 11 Dec 2022 02:52:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 Subject:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4uXBbax0pRzc3Gsg708xLPBc3ddVSelMyAflgxqp9JA=; b=DKUu25BLY/FsfTsloFUHQnn95w
 p253LgBYo0FYxF5I238o8CSUAHpAFW4RFhmTt7Uo2nKOxNwd9oeYhdcaXuQgFFIv8AimL3jBj6Fr6
 7UGXwAFEkWZ5gaJq1860HQRs0OQxPae86E7OXP2c6OEKsR1QDRi7qDKfwECZRqsrJkgo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:From:
 References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4uXBbax0pRzc3Gsg708xLPBc3ddVSelMyAflgxqp9JA=; b=e+AEWxWcRvBaoE5mzPO8dtT7vw
 eHSqrwv6SQSVBgbbMs5PnWldBy/+fk8bZzyjz/Wd5aLhU4gqcvtaP5CBXrN8Jqsvm1kjIYadhB/W8
 tsA//MVA2cT7O18mNzOyUo9WsS2ystFXqDBwpUV0AzMWduC/lRFOza2E1XsCW6JmmcHo=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p4CS6-00DScE-4n for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 11 Dec 2022 02:52:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BBA2E60D17;
 Sun, 11 Dec 2022 02:52:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD9BBC433D2;
 Sun, 11 Dec 2022 02:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670727144;
 bh=yVMfp1uldktAIyVGvt7Bwh+o9jSNVgi13RdkbJkMSso=;
 h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
 b=ii8rmZPLgA65CJBwT9eRtatBx4UujWU5YmhkOIbXTyN/p8hD3c0QeM0Yg3XyxuA4e
 0mS7XyVuhbpQrg8pKgTB2ZgLPak8OBEVwvUCgFjSaapqe5FW2UJay+PoYCYQYFM6Sq
 MuzVq1pq8Cn15ourdetznTtcScCwSQ2h5S5Sy9ukKKZXGAofsvPSKcOjFRKJ+NTWzn
 fKswUWgUgAdMpfXHfO6orI4DhhnWvmLLwaVVDbsq426NjAhjujhkt+vzAZku9ADsWq
 mwUXnCZZY0E5GkGRPbCy2QSvl23+zQboHu97R2eDzsvtulb+0VKDMqruWJFFTF6Jjb
 CMTSQ/WBcXRcQ==
Message-ID: <810bd221-1f35-db79-e9f3-a521464b3eaf@kernel.org>
Date: Sun, 11 Dec 2022 10:52:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US
To: Yuwei Guan <ssawgyw@gmail.com>, jaegeuk@kernel.org
References: <20221209112813.73700-1-Yuwei.Guan@zeekrlife.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20221209112813.73700-1-Yuwei.Guan@zeekrlife.com>
X-Spam-Score: -5.5 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/12/9 19:28, Yuwei Guan wrote: > In non-foreground
 gc mode, if no victim is selected,
 the gc process > will wait for no_gc_sleep_time
 before waking up again. In this > subsequent time, even tho [...] 
 Content analysis details:   (-5.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.3 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p4CS6-00DScE-4n
Subject: Re: [f2fs-dev] [PATCH] f2fs: do decrease_sleep_time() if any of the
 victims have been selected
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

On 2022/12/9 19:28, Yuwei Guan wrote:
> In non-foreground gc mode, if no victim is selected, the gc process
> will wait for no_gc_sleep_time before waking up again. In this
> subsequent time, even though a victim will be selected, the gc process
> still waits for no_gc_sleep_time before waking up. The configuration
> of wait_ms is not reasonable.
> 
> After any of the victims have been selected, we need to do
> decrease_sleep_time() to reduce wait_ms.
> 
> If it is GC_URGENT_HIGH or GC_URGENT_MID gc mode,
> wait_ms will keep urgent_sleep_time after executing decrease_sleep_time().
> 
> In decrease_sleep_time() wait_time will be reduced to max_sleep_time
> from no_gc_sleep_time, if *wait is no_gc_sleep_time. And then it goes
> down in the next step.
> 
> Signed-off-by: Yuwei Guan <Yuwei.Guan@zeekrlife.com>
> ---
>   fs/f2fs/gc.c | 2 ++
>   fs/f2fs/gc.h | 7 ++++++-
>   2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index f0c6506d8975..c023ffeb9268 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -141,6 +141,8 @@ static int gc_thread_func(void *data)
>   			/* don't bother wait_ms by foreground gc */
>   			if (!foreground)
>   				wait_ms = gc_th->no_gc_sleep_time;
> +		} else {
> +			decrease_sleep_time(gc_th, &wait_ms);

Once BGGC selects valid victim, it will go faster and fater?

How about:

	} else {
		/* reset wait_ms to default sleep time */
		if (wait_ms == gc_th->no_gc_sleep_time)
			wait_ms = gc_th->min_sleep_time;
	}

Thanks,

>   		}
>   
>   		if (foreground)
> diff --git a/fs/f2fs/gc.h b/fs/f2fs/gc.h
> index 19b956c2d697..6402584dcd72 100644
> --- a/fs/f2fs/gc.h
> +++ b/fs/f2fs/gc.h
> @@ -150,8 +150,13 @@ static inline void decrease_sleep_time(struct f2fs_gc_kthread *gc_th,
>   {
>   	unsigned int min_time = gc_th->min_sleep_time;
>   
> -	if (*wait == gc_th->no_gc_sleep_time)
> +	if (*wait == gc_th->urgent_sleep_time)
> +		return;
> +
> +	if (*wait == gc_th->no_gc_sleep_time) {
>   		*wait = gc_th->max_sleep_time;
> +		return;
> +	}
>   
>   	if ((long long)*wait - (long long)min_time < (long long)min_time)
>   		*wait = min_time;


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
