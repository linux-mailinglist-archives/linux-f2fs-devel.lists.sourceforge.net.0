Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E22BA872C54
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  6 Mar 2024 02:49:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rhgOy-0000uj-Hx;
	Wed, 06 Mar 2024 01:49:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rhgOw-0000ud-Le
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 06 Mar 2024 01:48:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Q/VDq/HBzzlKN0MQRg6uAbHN/Y2ScX5/F+iWF+U8TPk=; b=eDGm29OWRK3u55+qAGl5o/XWqh
 4NBpx4MPYTQoRemmkZR55KQKcYULii/QsYCaVJyzIwlf6m53jftna99KnnhnJiXHtctO4nIHUfAfQ
 w2W3clXo/9PoQOB0PFmieoynP54L7SkjFlx2LdaBzQOWrBJuBDBm5BDd+UYb1m3XcI2E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Q/VDq/HBzzlKN0MQRg6uAbHN/Y2ScX5/F+iWF+U8TPk=; b=T8mrOmJY9FfOstvQyatJhtD2zU
 IA5blrtkBRZU624jllAX75i57cQ7Whcc0VZAnoo8FMMkoIWKAohHbwv90/Sr6q/a1cZ1Hc0XAIdP8
 IPX1oPo/o3UVGlH8iAF7dbWMOEB5deeOmT9qhj06NJmLyLd/JFdHhJsWOHNr+0AM39BE=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rhgOp-0005W7-Ni for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 06 Mar 2024 01:48:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 21463CE20B0;
 Wed,  6 Mar 2024 01:48:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DF2EC433F1;
 Wed,  6 Mar 2024 01:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709689725;
 bh=rgKLOGz+NBarhLpk4OYzhz7bVkPRRMgs5+kz/74cL04=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=UIXCiskZ/y54tEmBjW0vVX4foThN0YH730WROKu2nTnEiJvPtflWx/QkFwLiQ4ZhK
 dDVGP9Oq9qsNWAVA3vwTqH8WLQTmPyZVY6fs0X12+zYD0VQQQCkAF7r80qGVofz7rh
 OAS0WQNQDZ/YUsjgtBlwKEuodBjvFzNJNN1fKWuMyTu5UuP5/b0BELVF/+0bpt3DVQ
 XZfpV7TS4h7vLfgZZbyUWNOt3t/ji5Fy/JBdQVciAPMs0QFviJiuoLCE9HoUfwUNw/
 VXxjUd/xecb0RRQk0KpjPUuDX5ckvPRYUAyGpyobLAfNEwGqkJciU0GBpLfoZuAMXN
 YqbTG2sGxzBVA==
Message-ID: <3017291c-f600-4810-8d6e-8d9ef7a8d43f@kernel.org>
Date: Wed, 6 Mar 2024 09:48:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Roman Smirnov <r.smirnov@omp.ru>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20240305080943.6922-1-r.smirnov@omp.ru>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240305080943.6922-1-r.smirnov@omp.ru>
X-Spam-Score: -3.1 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/3/5 16:09, Roman Smirnov wrote: > Cast expression
 type to unsigned long in __count_extent_cache() > to prevent integer overflow.
 > > Found by Linux Verification Center (linuxtesting.org) with [...] 
 Content analysis details:   (-3.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rhgOp-0005W7-Ni
Subject: Re: [f2fs-dev] [PATCH] f2fs: Cast expression type to unsigned long
 in __count_extent_cache()
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
Cc: lvc-project@linuxtesting.org, Sergey Shtylyov <s.shtylyov@omp.ru>,
 linux-kernel@vger.kernel.org, Karina Yankevich <k.yankevich@omp.ru>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/3/5 16:09, Roman Smirnov wrote:
> Cast expression type to unsigned long in __count_extent_cache()
> to prevent integer overflow.
> 
> Found by Linux Verification Center (linuxtesting.org) with Svace.
> 
> Signed-off-by: Roman Smirnov <r.smirnov@omp.ru>
> Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,

> ---
>   fs/f2fs/shrinker.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/shrinker.c b/fs/f2fs/shrinker.c
> index 83d6fb97dcae..bb86a06c5d5e 100644
> --- a/fs/f2fs/shrinker.c
> +++ b/fs/f2fs/shrinker.c
> @@ -33,7 +33,7 @@ static unsigned long __count_extent_cache(struct f2fs_sb_info *sbi,
>   {
>   	struct extent_tree_info *eti = &sbi->extent_tree[type];
>   
> -	return atomic_read(&eti->total_zombie_tree) +
> +	return (unsigned long)atomic_read(&eti->total_zombie_tree) +
>   				atomic_read(&eti->total_ext_node);
>   }
>   


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
