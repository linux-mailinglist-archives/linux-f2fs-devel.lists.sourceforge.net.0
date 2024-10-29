Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0122A9B40FE
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Oct 2024 04:25:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t5cqp-0001Xc-Vs;
	Tue, 29 Oct 2024 03:24:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1t5cqp-0001XW-DD
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 03:24:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zd0p/JmEDKLY4MmrHLt32dIAUWp70/lqR8BzzvV2AuI=; b=Ut9SopbRGeYExwUvgrjYqnIShQ
 edIAHjpH60rLCha6udt0NQcUFnEmDzH5pJ14E2GYaXQ/aftIx9MDUGSYs2rcdGNX1GbNgVXco04J2
 uLMgxFAhkVHx9ns4zS9eR5hb5dsV++Cz9ublIwDMKFh7df6jKjMyZDDjv/r8CwStnu/Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zd0p/JmEDKLY4MmrHLt32dIAUWp70/lqR8BzzvV2AuI=; b=Je7n+q2MpUvncgelSgJe5Z6ur2
 GrBzgJMSfs56Qwry1mLeJxUcl+Grpaov/ElQXdRKd4zKwmzATSovgKgnuzE90hbcsZwQPvU8WXx/E
 axxr4wc5Y+mML316uWpq/PNFTxg9RuxjSzLqK1ZuQHlbQ1z6zdbyM5BMJffm2Uw7fCsY=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t5cqn-00035W-Eu for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 03:24:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id AA610A41565;
 Tue, 29 Oct 2024 03:22:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40A01C4CECD;
 Tue, 29 Oct 2024 03:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730172291;
 bh=LvpMyiaaNKLeTHaVFYd4nKHxAgZ31IpQg4KBhS92H7c=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=EcEGLwRSK0em4tQUAvvOSPBTOAd5G6I0czh+JmUsLeyUCL6GeWIPGdHMah6MrR/Ni
 gflzXtv1aIP0NPv3zhCodmRe7Krf7Dqo7Ka9sgJ9f6ma+imMwcEJyeJdyNYGNBkjZC
 Um7Z3u12rWFJlLW3y8E/HherRDiB2Xv+KXWvsvem9Q70J0jg3eU/P4f7dzsVa6hgeC
 Rw1a7463JOIvRPawB+54nuNrPXNIuWMGlUtCcpQxlo5Tj1gZWnV3z4uK2p0Kr5TmyD
 TCGuL23VPe4m4WLyKt3RuHAokGOS0SPl393pi3bnwkHnPnKtAB3GSjRYeCkJZUqbey
 y/yMkULz6JlPg==
Message-ID: <e8c6f079-2bc7-4738-8d34-268d2f86bb0b@kernel.org>
Date: Tue, 29 Oct 2024 11:24:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhiguo Niu <zhiguo.niu@unisoc.com>, jaegeuk@kernel.org
References: <1730171569-10757-1-git-send-email-zhiguo.niu@unisoc.com>
Content-Language: en-US
In-Reply-To: <1730171569-10757-1-git-send-email-zhiguo.niu@unisoc.com>
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/10/29 11:12, Zhiguo Niu wrote: > If gc_mode is set
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
X-Headers-End: 1t5cqn-00035W-Eu
Subject: Re: [f2fs-dev] [PATCH V3] f2fs: fix to avoid use GC_AT when setting
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

On 2024/10/29 11:12, Zhiguo Niu wrote:
> If gc_mode is set to GC_URGENT_LOW or GC_URGENT_MID, cost benefit GC
> approach should be used, but if ATGC is enabled at the same time,
> Age-threshold approach will be selected, which can only do amount of
> GC and it is much less than the numbers of CB approach.
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

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
