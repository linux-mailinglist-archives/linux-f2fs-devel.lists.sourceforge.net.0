Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BC26D592847
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Aug 2022 05:52:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oNR9d-0002zf-TI;
	Mon, 15 Aug 2022 03:52:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1oNR9c-0002zY-2L
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Aug 2022 03:52:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=si+yP/cAPX61+BKFdf43zy7PI169kxeZSBXYu+A0pes=; b=iEvfOTwBI96rQtw79Xso5yhK8F
 waYSlmcco/6zLJ95ZceROeUegExi7OcFANx6vb7HnjBah7sT60wf3c+ctGTwt/S78oSOtYkY1GUI1
 VWW+9FItljnB38cQmDvx+zgH7TzvMqhVjXlM9F2z5/LoJreDv9LLohKTnR9IA0pfcp5c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=si+yP/cAPX61+BKFdf43zy7PI169kxeZSBXYu+A0pes=; b=TkD5QkvOrqyl6astpxhb3uRX19
 FBRRi9MzrqYOumsTd3GKZjTAsaW8IQx0e2SbR7HNkn1XZymgworxJTO2FVBCJuMAkBb9cPUSXzGf7
 9W5EDVpeShDt72Rgsvn8jJy5ouaTUPdKhbZ1cMRR9wZoACx4hkIBie37OhkFiyG+SPvg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oNR9a-002csY-89 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Aug 2022 03:52:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D984F61019
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 15 Aug 2022 03:52:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32E67C433D6;
 Mon, 15 Aug 2022 03:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660535552;
 bh=x8mswgoGqL/z1c3stv7WymTX1bkbDAeAwck9N1MfYS0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=cGj6y/eJLhf7nsTgC7aSqktLSsEdswIC18PEZUrpeELK4uChjmCRTernzEtYJfczD
 zcHGxIqyIOG2DR6+Q+z0gLM6QVMw0rUr8u88f6eHt4wdD8G9cpojJ78ij2/FJs1bDG
 42xq8vbVpILU76o+m/NyGbp/WSuj/u5AiM36GFh5ucLLqsvycpPnx0DJKtlyp/OgDA
 OjiczQKGG/PHQO6VI2SW8AZxe90myMJSW8YJBvZRqfspOog0IFKC2gqJxaEfNMdYnN
 /I1YHBOecfiDbZ1qktoNtAvZiirc4Z05vXkDlGYL5TrOxwxgNuhfZH0j0vCPhvQmTh
 KK4lfYKUt1pfw==
Message-ID: <65562b32-505f-796e-305a-d1b03baeb388@kernel.org>
Date: Mon, 15 Aug 2022 11:52:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20220813143709.11909-1-jaegeuk@kernel.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220813143709.11909-1-jaegeuk@kernel.org>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/8/13 22:37, Jaegeuk Kim wrote: > We should decrease
 the frozen counter. > > Cc: stable@kernel.org > Fixes: 325163e9892b ("f2fs:
 add gc_urgent_high_remaining sysfs node") > Signed-off-by: Jaege [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oNR9a-002csY-89
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix wrong continue condition in GC
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
Cc: stable@kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/8/13 22:37, Jaegeuk Kim wrote:
> We should decrease the frozen counter.
> 
> Cc: stable@kernel.org
> Fixes: 325163e9892b ("f2fs: add gc_urgent_high_remaining sysfs node")
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>   fs/f2fs/gc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 6da21d405ce1..7e4b41240d59 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -102,7 +102,7 @@ static int gc_thread_func(void *data)
>   					sbi->gc_urgent_high_limited = false;
>   					spin_unlock(&sbi->gc_urgent_high_lock);
>   					sbi->gc_mode = GC_NORMAL;
> -					continue;
> +					goto next;
>   				}
>   				sbi->gc_urgent_high_remaining--;
>   			}

Why not:

	if (!sbi->gc_urgent_high_remaining) {
		sbi->gc_urgent_high_limited = false;
		spin_unlock(&sbi->gc_urgent_high_lock);
		sbi->gc_mode = GC_NORMAL;
	} else {
		sbi->gc_urgent_high_remaining--;
	}

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
