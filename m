Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E94DA9B2B97
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Oct 2024 10:34:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t5M8b-0002qF-EB;
	Mon, 28 Oct 2024 09:34:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1t5M8a-0002q8-AJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Oct 2024 09:34:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=B6MazbGP4HrYcwILg8bEzY/PkLBqhVZVxYcFS9HMHeM=; b=GouLKpQ1aJMr5mT/9siRQMM+0t
 Fj03g7Knq7iu7K7VN5UIl+ygd8Dr3Zi7OJsM5P/TDukIF3a5JdctqP6JiakTC1TCBVsDZEDbEFmdu
 GLhNHndIZZoAP+2lmCEl6M7S7UEWxPVMv2x0iJomYqCniVLo+uIpfKvM6iINLcjCdvnU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=B6MazbGP4HrYcwILg8bEzY/PkLBqhVZVxYcFS9HMHeM=; b=WFPUcvdvksm6e97QsGy3Df8H1k
 bBg1E0Mc83kjYSWjVV7g/Z78u4hNN5A5+uFShbm4/1vO8adefePk1YZuSWPF2EjLeXSPJ9pxC+/kU
 CNShI7ynGpp4UrFohfFaIaB0h8yho0Od8WkBpOctD831+WKxyD0dFZt1LDDyWM+2AytA=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t5M8Y-0007Hs-PI for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Oct 2024 09:34:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id EE6F8A41B19;
 Mon, 28 Oct 2024 09:32:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D486BC4CEC3;
 Mon, 28 Oct 2024 09:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730108039;
 bh=dnGFplpXtdXmv74hrDBEMPzNNFSWKG3VBi8j7yZuIJM=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=RetUAL2P7RQI6rmFqD5AhYhCGx+dYZi0q407G+GHWBgtJOkwPzOlzzjjHRzXdVHf7
 BGXtJIHFybBT84XUuDEkI8RsmmOv7gLpPdKF3ATeSe/pXWY0MJzmiJJE6b2aeXRY4m
 nJLKFG6ec+d3DKbTmRyhrBWexlNdrSQKUtFLxV2BUjJ4tgd6DrTJ6Y67x7870Q1erC
 CEYCbTDh4fNwqtBuBHOwX1LCaemttEkJSoUl8JtssXLNZT560KonXBENPEwnDIUdJ2
 XRNvW91o36FSSdiuOU2FOSNYP0m/ClUoMM5OHiS02x3dMSl2UK6oKiinBpj0R8prrV
 LZ/JmH6t75Zrw==
Message-ID: <7d68560a-19ea-455c-ba23-1dda32ed4d15@kernel.org>
Date: Mon, 28 Oct 2024 17:33:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhiguo Niu <zhiguo.niu@unisoc.com>, jaegeuk@kernel.org
References: <1729652883-12202-1-git-send-email-zhiguo.niu@unisoc.com>
Content-Language: en-US
In-Reply-To: <1729652883-12202-1-git-send-email-zhiguo.niu@unisoc.com>
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/10/23 11:08, Zhiguo Niu wrote: > If gc_mode is set
 to GC_URGENT_LOW or GC_URGENT_MID, cost benefit GC > approach should be used, 
 but if ATGC is enabled at the same time, > Age-threshold approa [...] 
 Content analysis details:   (-0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t5M8Y-0007Hs-PI
Subject: Re: [f2fs-dev] [PATCH V2] f2fs: fix to avoid use GC_AT when setting
 gc_mode as GC_URGENT_LOW or GC_URGENT_MID
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
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Hao_hao.Wang@unisoc.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/10/23 11:08, Zhiguo Niu wrote:
> If gc_mode is set to GC_URGENT_LOW or GC_URGENT_MID, cost benefit GC
> approach should be used, but if ATGC is enabled at the same time,
> Age-threshold approach will be selected, which can only do amount of
> GC and it is much less than the numbers of CB approach.

The code looks fine to me, there is one more thing, can you please update
description of gc_urgent in sysfs-fs-f2fs? so it can describe explicitly
that configuring gc_urgent to low or mid will setup GC_CB GC policy which
will override GC_AT.

Thanks,

> 
> some traces:
>    f2fs_gc-254:48-396     [007] ..... 2311600.684028: f2fs_gc_begin: dev = (254,48), gc_type = Background GC, no_background_GC = 0, nr_free_secs = 0, nodes = 1053, dents = 2, imeta = 18, free_sec:44898, free_seg:44898, rsv_seg:239, prefree_seg:0
>    f2fs_gc-254:48-396     [007] ..... 2311600.684527: f2fs_get_victim: dev = (254,48), type = No TYPE, policy = (Background GC, LFS-mode, Age-threshold), victim = 10, cost = 4294364975, ofs_unit = 1, pre_victim_secno = -1, prefree = 0, free = 44898
>    f2fs_gc-254:48-396     [007] ..... 2311600.714835: f2fs_gc_end: dev = (254,48), ret = 0, seg_freed = 0, sec_freed = 0, nodes = 1562, dents = 2, imeta = 18, free_sec:44898, free_seg:44898, rsv_seg:239, prefree_seg:0
>    f2fs_gc-254:48-396     [007] ..... 2311600.714843: f2fs_background_gc: dev = (254,48), wait_ms = 50, prefree = 0, free = 44898
>    f2fs_gc-254:48-396     [007] ..... 2311600.771785: f2fs_gc_begin: dev = (254,48), gc_type = Background GC, no_background_GC = 0, nr_free_secs = 0, nodes = 1562, dents = 2, imeta = 18, free_sec:44898, free_seg:44898, rsv_seg:239, prefree_seg:
>    f2fs_gc-254:48-396     [007] ..... 2311600.772275: f2fs_gc_end: dev = (254,48), ret = -61, seg_freed = 0, sec_freed = 0, nodes = 1562, dents = 2, imeta = 18, free_sec:44898, free_seg:44898, rsv_seg:239, prefree_seg:0
> 
> Fixes: 0e5e81114de1 ("f2fs: add GC_URGENT_LOW mode in gc_urgent")
> Fixes: d98af5f45520 ("f2fs: introduce gc_urgent_mid mode")
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
> ---
> v2: make GC_URGENT_LOW also use CB approach
> ---
>   fs/f2fs/gc.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index e40bdd1..3e1b6d2 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -257,6 +257,8 @@ static int select_gc_type(struct f2fs_sb_info *sbi, int gc_type)
>   
>   	switch (sbi->gc_mode) {
>   	case GC_IDLE_CB:
> +	case GC_URGENT_LOW:
> +	case GC_URGENT_MID:
>   		gc_mode = GC_CB;
>   		break;
>   	case GC_IDLE_GREEDY:



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
