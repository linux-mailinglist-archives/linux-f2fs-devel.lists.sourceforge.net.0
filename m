Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1214AB0524A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 15 Jul 2025 08:59:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bHLlErP+UvlMskY1X7ITkNJNMMbe1+Ik3FgBfbFEDbM=; b=Lxj639gSe5KcexTCpiNmAWyh14
	KY8ViE19h7Bd6OxWIMyTStBw4OikgNSqbcEi+i60a5/10kitd5PaqM/nDfchqgrV8j3M19ddAFNWR
	OtDe3s87m4CXQYNIf2lH/8aZWqkSbdlwKaHnM3snzOckRkrS69WOQdikLBOXgSPfxZ1I=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ubZd4-0008Mg-E4;
	Tue, 15 Jul 2025 06:59:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ubZd3-0008MY-Cd
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Jul 2025 06:59:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zHi0UvMHVWbml4fL4f4hsykn6gZns8kB9v7BCNN+JZw=; b=gbsdPTlmkoxW6btqVdgGXpTfMv
 oCSVC4pxdAjUDKck70bbGxOt/9RIRxTqRMGPiDV8wtR/WYPXvUBhXJ2DmaiXpu+5mF2cKIcMpnjoM
 CxVOYv6jN+V9LKXEqiDkEX4mc3qBMiGLciPSxYKxeZdqOAXaxyYCiq1KJURoZhNcminA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zHi0UvMHVWbml4fL4f4hsykn6gZns8kB9v7BCNN+JZw=; b=QD7wkpi2G6hr3qmjDXlV5Mu2GK
 tUqZ0QTG8Dfu6L9nGlKEYgNJA/qS9yv4yQ0gUTwznS+ZQsb/pOiLuZvpi9kbcuF3o4PE3u7gzWSvx
 fpj9pd0IdBm9oHAp/VQXkVtZ9xoR5cpGwf1VcjoI/N2wLCQIr+HujrnBx/HLWgIkWj68=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ubZd2-0000G9-Rk for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Jul 2025 06:59:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6B7575C5600;
 Tue, 15 Jul 2025 06:58:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBE46C4CEE3;
 Tue, 15 Jul 2025 06:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752562739;
 bh=mbfAD0hFlSTMolZq2J7TOzEpdHQycJi5YCq0IBF2A/8=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=O8PNAUDlkgOCGO6+fGwuv8CuHB7rLOROlx30Eb8pl4AIwW17YkCXE3mmGsl0Gemsv
 vL8D8zy0qoE/LtPbsLHZ2KutU4BiuKTL2pigTiWwtr4Uq1qsFSTDbgdv2lzqvZzn0M
 IS7RHwsc6dP3bAdpf/BJchRSOqOIP2HgbUUpShmDYIkZgFKXq8/bddkttu2MwG0eoQ
 +9WGvdcY53XfE91dqwBm1LijPgSzs3MOY8LLQd3llu3KLFUC/xP/Tb9Ts8oC3ifovn
 urLTJ+DI58tHbPPaOntX+FJ8Ui7ux+QyYMJcOtFzyelbrpj2vCzDSwkdBcgKHUt9mu
 jo+N7FzT2LryA==
Message-ID: <d822f21f-bfdb-443a-b639-66860a30ccbd@kernel.org>
Date: Tue, 15 Jul 2025 14:58:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Qi Han <hanqi@vivo.com>, jaegeuk@kernel.org
References: <20250715031054.14404-1-hanqi@vivo.com>
Content-Language: en-US
In-Reply-To: <20250715031054.14404-1-hanqi@vivo.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 7/15/25 11:10, Qi Han wrote: > Jens has already completed
 the development of uncached buffered I/O > in git [1], and in f2fs, the feature
 can be enabled simply by setting > the FOP_DONTCACHE flag i [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ubZd2-0000G9-Rk
Subject: Re: [f2fs-dev] [PATCH] f2fs: f2fs supports uncached buffered I/O
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
Cc: axboe@kernel.dk, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 7/15/25 11:10, Qi Han wrote:
> Jens has already completed the development of uncached buffered I/O
> in git [1], and in f2fs, the feature can be enabled simply by setting
> the FOP_DONTCACHE flag in f2fs_file_operations.

Hi Qi, do you have any numbers of f2fs before/after this change? though
I'm not against supporting this feature in f2fs.

Thanks,

> 
> [1]
> https://lore.kernel.org/all/20241220154831.1086649-10-axboe@kernel.dk/T/#m58520a94b46f543d82db3711453dfc7bb594b2b0
> 
> Signed-off-by: Qi Han <hanqi@vivo.com>
> ---
>  fs/f2fs/file.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 696131e655ed..d8da1fc2febf 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -5425,5 +5425,5 @@ const struct file_operations f2fs_file_operations = {
>  	.splice_read	= f2fs_file_splice_read,
>  	.splice_write	= iter_file_splice_write,
>  	.fadvise	= f2fs_file_fadvise,
> -	.fop_flags	= FOP_BUFFER_RASYNC,
> +	.fop_flags	= FOP_BUFFER_RASYNC | FOP_DONTCACHE,
>  };



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
