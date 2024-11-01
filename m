Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1553E9B8959
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  1 Nov 2024 03:36:34 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t6hWQ-0002hn-Ee;
	Fri, 01 Nov 2024 02:36:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1t6hWO-0002hY-Ot
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 01 Nov 2024 02:36:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iMqR9EDKActfKe6tdKTI1S1e9inb4loGQ4+QWd1kZ/0=; b=lG6SCAEKJLkAjJoDJ1dD74KKVo
 5ksaYkzw3ya4taaBkRWF8szhLWE2vn1JOCZJOgqrG/r8Y23jITKVndrRXLyh9Ysd0WYcqHqWT7Xbe
 t0JtvW1ynNMaued+F72y/WLWXdVwp7AR/RpAyWm9aM12oBqaMJEpoMkZfSVg34djZAsc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iMqR9EDKActfKe6tdKTI1S1e9inb4loGQ4+QWd1kZ/0=; b=CV/oyiFmr1QxWfNOUTKzEp95+e
 HYEarW9hesQqYUmFhzHaWcW3xf164kAZGUnG/mxz/N62yrdSwr+8BhAT7tN7QSXlM7dTUcl851N2z
 LmQcw0vLUtW2H56RAOJROlsA4UnhTZVqOS/NdRdeFcndw8JBZ1iuSoTTqqvHJ6slsaiU=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t6hWK-00022n-CI for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 01 Nov 2024 02:36:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 1735CA4156E;
 Fri,  1 Nov 2024 02:34:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15D7CC4CEC3;
 Fri,  1 Nov 2024 02:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730428570;
 bh=0huvr86IZjuH0dxBEMWUcQq3vXzn9tBf7P+2WdfP0Fg=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=o62mErCHPvdOWVzRcHE2AHdgIYSmL5c0Y+u9oJeAJpriwsA3hlhXXJ7o486fqrXX4
 VlUYPYvb4Pniy8+wH6X+7FCOiT0IvpTuyrl1s+8Gm2Q3B6fAaU53+xjFOtGhwFY8I+
 y9pProlQjWYESmObVyjTm1D/wf60CXwEtUPwmrVuPfieTa+NpBMgpVOac87DPMZA8m
 Wiiviih3MILCOuPywC/zV+5SejXTyqLOrVo2PDfNf5kLG8x+ju81PPhP+9FICxTR1b
 eU1c2ifVTqBrLAucISlJrHYO3xJTDxBwi/5k+gCxAGj7qvIgV4enEDKB7J/polCxyF
 soyfXnLD5o0rA==
Message-ID: <bf348748-46ba-47dd-a12d-5111be2df95e@kernel.org>
Date: Fri, 1 Nov 2024 10:36:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhiguo Niu <zhiguo.niu@unisoc.com>, jaegeuk@kernel.org
References: <1730354393-19672-1-git-send-email-zhiguo.niu@unisoc.com>
 <1730354393-19672-2-git-send-email-zhiguo.niu@unisoc.com>
Content-Language: en-US
In-Reply-To: <1730354393-19672-2-git-send-email-zhiguo.niu@unisoc.com>
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/10/31 13:59, Zhiguo Niu wrote: > If user give a file
 size as "length" parameter for fiemap > operations, but this size is non-block
 size aligned, > it will show 2 segments fiemap results even [...] 
 Content analysis details:   (-0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t6hWK-00022n-CI
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: fix to adjust appropriate length
 for fiemap
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

On 2024/10/31 13:59, Zhiguo Niu wrote:
> If user give a file size as "length" parameter for fiemap
> operations, but this size is non-block size aligned,
> it will show 2 segments fiemap results even this whole file
> is contiguous on disk, such as the following results, please
> note that this f2fs_io has been modified for testing.
> 
>   ./f2fs_io fiemap 0 19304 ylog/analyzer.py
> Fiemap: offset = 0 len = 19304
>          logical addr.    physical addr.   length           flags
> 0       0000000000000000 0000000020baa000 0000000000004000 00001000
> 1       0000000000004000 0000000020bae000 0000000000001000 00001001
> 
> after this patch:
>   ./f2fs_io fiemap 0 19304 ylog/analyzer.py
> Fiemap: offset = 0 len = 19304
> 	logical addr.    physical addr.   length           flags
> 0	0000000000000000 00000000315f3000 0000000000005000 00001000

Why is FIEMAP_EXTENT_LAST missing in #0 extent? As we can see it
in #1 extent before your change.

1       0000000000004000 0000000020bae000 0000000000001000 00001001

Thanks,

> 
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
> ---
> f2fs_io has been modified for testing, the length for fiemap is
> real file size, not block number
> ---
>   fs/f2fs/data.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 90fa8ab..8c9bb42 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -1966,8 +1966,8 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
>   			goto out;
>   	}
>   
> -	if (bytes_to_blks(inode, len) == 0)
> -		len = blks_to_bytes(inode, 1);
> +	if (len & (blks_to_bytes(inode, 1) - 1))
> +		len = round_up(len, blks_to_bytes(inode, 1));
>   
>   	start_blk = bytes_to_blks(inode, start);
>   	last_blk = bytes_to_blks(inode, start + len - 1);



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
