Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 173CE60C207
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Oct 2022 05:03:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1onADo-0000tJ-ST;
	Tue, 25 Oct 2022 03:03:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1onADn-0000tC-Np
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Oct 2022 03:03:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vWYwVHs5tmRMB04hZfpiJ2gPP1zHDGWy4KARrVfDXqk=; b=CZIDj+C3XiqtmrTey4VHSoPFcj
 oZh4j22wQsi4WoFmGgQr3pMNFJxF1p9uhjjfo4JgNwyT+1cLjqnnL6iE3EWa1F5ZX620H0TrNnTQc
 rGg7O/YmOzRkWoyDLR7FHCjEfV7U/3Sh7Zc4Xk9HXs2953Xg0YYzYY8w7y+BuPO01/E4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vWYwVHs5tmRMB04hZfpiJ2gPP1zHDGWy4KARrVfDXqk=; b=DtS8woXN6LjB8tjgRQaT29BrlJ
 kDY5z0HOTf4ysZc3WUDHubJLonRYbF38egkhCO3bDUmbBHseqS22KrVF0mi33X+uBkkjdPgIYsieN
 qqSQQwgitG8126ZWPQDbYJl0cmgVDQTeDgHXzhJLauukTRp/mI3g7hu8eRem54PTSfu0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1onADn-0000sq-53 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Oct 2022 03:03:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BE527616CE;
 Tue, 25 Oct 2022 03:03:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02D1DC433D6;
 Tue, 25 Oct 2022 03:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666666993;
 bh=C0BzoxkThe4sl0x6SHLn0j8oqMtjmakTknJ4uj7PQTI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=WhOyePJz7tW6yocb59ISNSqfnILjY6mCjKZ209fPxjxprTu70KVjuJvAMcOA12pE6
 Ncz12n+2S2bZMYwqifAIcgGjGhbRJ/f63Xiv07gqs89xoVnPEBzPVSsQ1Gige+1ffM
 hVdq/qaNjVfos5hS55HOXcPnkbeU/0lFa3s8NUxSm65745aZRJE3OaVNfSQQkclNdJ
 s5VMhHAtxtlcfl9trvpDhdmmsXoeA4RgZuq5cmI9KJ6x+Cn0aLrgQm8CVD/Xm2QRV3
 2flOFndoW1FJnjd4POGuPSmvp92dpk8DgCMwmzLjlc0RBwQEDiegxI3iCAGhbkj0ft
 d3nlsQmLtIdxw==
Message-ID: <5f0e2e43-1167-7fb7-9dc6-02ed0fc1858b@kernel.org>
Date: Tue, 25 Oct 2022 11:03:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org
References: <20221021174633.12541-1-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20221021174633.12541-1-frank.li@vivo.com>
X-Spam-Score: -5.7 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/10/22 1:46, Yangtao Li wrote: > Under the current
 logic, when gc_urgent_high_remaining is set to 1, > the mode will be switched
 to normal at the beginning, instead of > running in gc_urgent mo [...] 
 Content analysis details:   (-5.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1onADn-0000sq-53
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: fix gc mode when
 gc_urgent_high_remaining is 1
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

On 2022/10/22 1:46, Yangtao Li wrote:
> Under the current logic, when gc_urgent_high_remaining is set to 1,
> the mode will be switched to normal at the beginning, instead of
> running in gc_urgent mode.
> 
> Let's switch the gc mode back to normal when the gc ends.
> 
> Fixes: 265576181b4a ("f2fs: remove gc_urgent_high_limited for cleanup")
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>   fs/f2fs/gc.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 4546e01b2ee0..2f113fbcb85c 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -45,6 +45,7 @@ static int gc_thread_func(void *data)
>   	set_freezable();
>   	do {
>   		bool sync_mode, foreground = false;
> +		bool gc_normal_mode = false;
>   
>   		wait_event_interruptible_timeout(*wq,
>   				kthread_should_stop() || freezing(current) ||
> @@ -101,7 +102,7 @@ static int gc_thread_func(void *data)
>   			if (sbi->gc_urgent_high_remaining) {
>   				sbi->gc_urgent_high_remaining--;
>   				if (!sbi->gc_urgent_high_remaining)
> -					sbi->gc_mode = GC_NORMAL;
> +					gc_normal_mode = true;
>   			}
>   			spin_unlock(&sbi->gc_urgent_high_lock);

So, can we move above logic to the end of loop?

>   		}
> @@ -162,6 +163,10 @@ static int gc_thread_func(void *data)
>   		/* balancing f2fs's metadata periodically */
>   		f2fs_balance_fs_bg(sbi, true);
>   next:
> +		if (gc_normal_mode) {
> +			sbi->gc_mode = GC_NORMAL;
> +			gc_normal_mode = false;
> +		}
>   		sb_end_write(sbi->sb);
>   
>   	} while (!kthread_should_stop());


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
