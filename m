Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F2C51A2EA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 May 2022 17:01:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nmGVR-0001Tc-7S; Wed, 04 May 2022 15:01:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nmGVP-0001TS-FS
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 04 May 2022 15:01:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DQ6CJSIHmqdhVSUcabXqvI9smgG520mgfbvXIWLFYdE=; b=gzpoKX6pgTFEqm++e3slII3Ph8
 4NSbX4uqiAdKsM+wJo49vipmPTbK3PsaI1nLhqn9un+J/EZg/HYLD+TK02i9WllOkoGanHe5ReNKL
 tBKu6cIWzarXhe4CPQ0uioeKxWxlcePaOjw/eTezCcFysGsNcfS1N5WZkcSLf+Nl6dXs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DQ6CJSIHmqdhVSUcabXqvI9smgG520mgfbvXIWLFYdE=; b=Cmu8KU1NnoAVKULSM2GZCBs1wn
 1T57nbrWWw6o2KceSHMf2OOuhMFc0hSaFohs/Q8U9y1vy8d0z24/sXntiZ1ByB8fqtNqoQcBVSXUD
 ae2uw43t+K0BZvt49ZLSKrq5QG22pZUWG6YaLL/VEIIzRO9gMKcipJrlskhy896usnBA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nmGVJ-0006F2-Vm
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 04 May 2022 15:01:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8D30961B38
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  4 May 2022 15:01:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0E9AC385AA;
 Wed,  4 May 2022 15:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651676476;
 bh=hsb9BD/AU1MN+uA25YZeRTjDbC9XD7vw8yxTGz+0JYA=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=o4dn9ADSKLFj4Ka6j5C8RJoR7BJakNMSyTWjQg5fK2Tzi85sgProzAjuuqYEfbFPy
 /GMIz8C9FBnu/BVVAaRMpq01uwNE03URajY0jPlOsehuXfNuf7zHdbjOYj8qUv69dp
 DiZnWH72LQKgmPesxxu5/AzPC35I5I9YuwmAy57wiOcVrraAbgDI1TR91BuLPplu0D
 9vteAJupCJ9SEwl2w8KrFlPYfMetqHUO/l8jVVKC3aheNp5gU8wfSfCCrdJfdbnYMB
 ok4tagakp6LUdAF17YxDWc7iHmTuORVqrmdiv8vgYRcvZc6K6TsbF2RVwFUTHpZAnk
 7RQ4AFeYoFqUw==
Message-ID: <cf5d3814-073f-df3c-a16d-33161140fe6f@kernel.org>
Date: Wed, 4 May 2022 23:01:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20220503203040.365028-1-jaegeuk@kernel.org>
 <20220503203040.365028-2-jaegeuk@kernel.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220503203040.365028-2-jaegeuk@kernel.org>
X-Spam-Score: -8.3 (--------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/5/4 4:30, Jaegeuk Kim wrote: > The f2fs_gc uses a
 bitmap to indicate pinned sections, but when disabling > chckpoint, we call
 f2fs_gc() with NULL_SEGNO which selects the same dirty > segment a [...] 
 Content analysis details:   (-8.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -2.5 NICE_REPLY_A           Looks like a legit reply (A)
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nmGVJ-0006F2-Vm
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: avoid to select pinned section
 during checkpoint=disable
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

On 2022/5/4 4:30, Jaegeuk Kim wrote:
> The f2fs_gc uses a bitmap to indicate pinned sections, but when disabling
> chckpoint, we call f2fs_gc() with NULL_SEGNO which selects the same dirty
> segment as a victim all the time, resulting in checkpoint=disable failure.
> Let's pick another one, if we fail to collect it.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>   fs/f2fs/gc.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 4d47723523c3..5ba8104e138b 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -1838,10 +1838,7 @@ int f2fs_gc(struct f2fs_sb_info *sbi, bool sync,
>   	if (gc_type == FG_GC)
>   		sbi->cur_victim_sec = NULL_SEGNO;
>   
> -	if (sync)
> -		goto stop;

Semantics of 'sync' parameter should be: migrate one section at least before
exit?

So, should it be?

if (seg_freed && (sync || !has_not_enough_free_secs(sbi, sec_freed, 0)))
	goto stop;

Thanks,

> -
> -	if (!has_not_enough_free_secs(sbi, sec_freed, 0))
> +	if (!has_not_enough_free_secs(sbi, sec_freed, 0) && seg_freed)
>   		goto stop;
>   
>   	if (skipped_round <= MAX_SKIP_GC_COUNT || skipped_round * 2 < round) {


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
