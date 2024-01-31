Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F8584380A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 31 Jan 2024 08:40:03 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rV5CQ-0003WS-F3;
	Wed, 31 Jan 2024 07:39:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rV5CI-0003WI-Ub
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 Jan 2024 07:39:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Z0MSpeNJHy0X57W6dlxQzgrRvSFDvNOpxWAMhTRKNXI=; b=kXqD3GGFaQ0Fhy7iv6ufm7dYbJ
 9M//jiYFTkRDyGd551/DP4BFfU3AhPW5p+ftBzJRPJKbBxTkwqobY3hMyVi4Db5pr8tCALVTbmMzZ
 mtowZD0YzReY3rjrmsjWaQWlAUGe5uE/2yy/zKWEnhGiH2trBYkmkepFI2SV19umaAs0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Z0MSpeNJHy0X57W6dlxQzgrRvSFDvNOpxWAMhTRKNXI=; b=IPMb4P8Ext1XNJRvB5Tu5b7TAT
 X6saYDW3Y1uPalwvLlGUOvwtRl4d/LcLy0J3NYxJbjQ18AKQDhGU+J8N3MMY/fzSygQIQxg12FZOf
 56yIj+oKhoCOkE4CYa0NgQp6oRSXY//kZMFjxDJWDRVDKLAi6MYYBmTySNGPY78ZrRqk=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rV5CH-0003ua-HM for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 Jan 2024 07:39:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 75F4DCE1184;
 Wed, 31 Jan 2024 07:39:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CF20C433C7;
 Wed, 31 Jan 2024 07:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706686778;
 bh=A7giZ2Ti9Ecl4x04u9G+VVMe8IvOUokvvBy0EenptqU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Qjmq1TtnOCD0FxLl4IA2CKw7ObbAVqdsjelzCCnzlxyvSjgQXPl4LEcfz7KZrXgAq
 u/kb5dihV3JCpkhNpfqPTNYIOYQiZqrGz1TcYDPEZhzXcPjsND6AyAwWMtJ2YpmJT1
 JHEwdm2CLj7Nu3i4GgSEs9bQjwEw1Z1Za1S0jmJtgKImJop680K/zEhgHXCJYvcy6e
 QY3lUwhyt+NFlmgboa6HRPUrKSzfmq4ZWnFZ66bHXE7H9uw/1u2Nd9pjPs/KB34M7e
 0iFjvMuO7PCtmdTaJauGBXoaFr2REfL6pM0VziA2AEBQvOu8+yrTfDjqFcwcpkSNEf
 XUzgk9qWBNRqA==
Message-ID: <dec7e126-9fbe-45b7-b661-6464ac5261fb@kernel.org>
Date: Wed, 31 Jan 2024 15:39:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: zhangxirui <xirui.zhang@vivo.com>, jaegeuk@kernel.org
References: <20240126063723.2926123-1-xirui.zhang@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240126063723.2926123-1-xirui.zhang@vivo.com>
X-Spam-Score: -3.8 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/1/26 14:37, zhangxirui wrote: > In sparse mode we
 just read or write to a sparse file not a block device > so no need to check
 device mount state in sparse mode. I guess it needs to check whether regular
 file was a backfile of mounted loop device, so we can only skip block device
 related check? 
 Content analysis details:   (-3.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rV5CH-0003ua-HM
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: skip check device mount state in
 sparse mode
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/1/26 14:37, zhangxirui wrote:
> In sparse mode we just read or write to a sparse file not a block device
> so no need to check device mount state in sparse mode.

I guess it needs to check whether regular file was a backfile of mounted
loop device, so we can only skip block device related check?

https://lore.kernel.org/linux-f2fs-devel/20240131073425.4043962-1-chao@kernel.org

Thanks,

> 
> Signed-off-by: zhangxirui <xirui.zhang@vivo.com>
> ---
>   lib/libf2fs.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/lib/libf2fs.c b/lib/libf2fs.c
> index 2451201..5315de2 100644
> --- a/lib/libf2fs.c
> +++ b/lib/libf2fs.c
> @@ -830,6 +830,10 @@ int f2fs_devs_are_umounted(void)
>   {
>   	int i;
>   
> +	/*no need to check device mount state in sparse mode*/
> +	if (c.sparse_mode)
> +		return 0;
> +
>   	for (i = 0; i < c.ndevs; i++)
>   		if (f2fs_dev_is_umounted((char *)c.devices[i].path))
>   			return -1;


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
