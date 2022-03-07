Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF154CEF33
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Mar 2022 02:43:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nR2P5-0001oz-Ho; Mon, 07 Mar 2022 01:43:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nR2P3-0001ot-Jn
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Mar 2022 01:43:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=x62ftUyM0wg/9i7HW/XAtqQhW5v9gjc3DAursd8pDNA=; b=Ys3uHVsy5bC31WMcgfvkvHzxoC
 hJljpGrot3QJPPUBCFPe8tHnj3Ah9pZZlUh1Oxies3S8eJnlUASzSg1pZRgQD3swgwDQ6hsPhUWlr
 ucYDn4FJ8G3PRnGFZjw+TZjakOLfNewzjqLwK4NQlBT+6vP3PWig6rQDk1eAGelo2tas=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=x62ftUyM0wg/9i7HW/XAtqQhW5v9gjc3DAursd8pDNA=; b=F+wtOSNEG/22qkE+v1nT42rS9+
 vkZhqbrP0dxBy0chrqGnsCmFOPxSfJnZHu7JqEifKK1BIPd945ln3ldoaCdRrIQexJ0ccgFV4nH+N
 ChQ5Eyh7M0FchNyYzvdDy/8mr4KZfAcP+KowH4Bj1Fr7UY0pH6JQeCgeskB4/NyG4Ay0=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nR2P1-006sSD-4i
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Mar 2022 01:43:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 97B4AB80EB7;
 Mon,  7 Mar 2022 01:43:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 054AEC340F5;
 Mon,  7 Mar 2022 01:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646617383;
 bh=W1sCukf/hiAaVeAsFs6A3j0ipo4YX/zGw7DizbmR3mw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=oi5UdKMVhoxMyCZBK1L7o8DQCv7wOaaYbnxqOeLGQpjih1QLA3QUzOzMYJsGzHA4R
 ODY5F+vVaZMhKSCHyNCjjfv7GgQZvaYrTEwZBUVJyKUX3MsHVGBlibh5EEArQ/BP8x
 oxeSM8c29m8alg+NWmG/GMwIaJMr8E77zYQ70rvArRhk7I5GzuLK6Jp6x/qTbwLD4b
 qrMUBajh4rlcUojEX+oz+dNkieeeQG3es9E8FvM2QW6BS99G7nsVdgxQzrVLhYUxwb
 qgIoRka76wuxveL7Rk8ez1/bmEM2eRV2KSwpWMgMmsv7ALmmqKSBE9uUGYa1b3Uqdt
 LeiGIHx3xq3XQ==
Message-ID: <bc67518a-37c9-724d-9a27-d8e9354c5404@kernel.org>
Date: Mon, 7 Mar 2022 09:42:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To: Fengnan Chang <fengnanchang@gmail.com>, jaegeuk@kernel.org
References: <20220305040019.225150-1-fengnanchang@gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220305040019.225150-1-fengnanchang@gmail.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/3/5 12:00, Fengnan Chang wrote: > When compressed
 file has blocks, start atomic write will be failed,
 but You mean f2fs_ioc_start_atomic_write
 will succeed, but compressed flag will be remained in inode? 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nR2P1-006sSD-4i
Subject: Re: [f2fs-dev] [RFC PATCH] f2fs: fix compress file start atomic
 write may cause data corruption
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
Cc: changfengnan@vivo.com, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/3/5 12:00, Fengnan Chang wrote:
> When compressed file has blocks, start atomic write will be failed, but

You mean f2fs_ioc_start_atomic_write will succeed, but compressed flag
will be remained in inode?

> still set FI_ATOMIC_FILE flag, if write partial cluster and commit
> atomic write will cause data corruption.

Could you please explain more about why data will be corrupted?

Thanks,

> Fixes: 4c8ff7095bef (f2fs: support data compression)
> Fixes: 7eab7a696827 (f2fs: compress: remove unneeded read when rewrite whole cluster)
> 
> Signed-off-by: Fengnan Chang <fengnanchang@gmail.com>
> ---
>   fs/f2fs/data.c | 4 +---
>   fs/f2fs/file.c | 3 ++-
>   2 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 6b5f389ba998..5cbee4ed0982 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -3358,8 +3358,7 @@ static int f2fs_write_begin(struct file *file, struct address_space *mapping,
>   		int ret;
>   
>   		*fsdata = NULL;
> -
> -		if (len == PAGE_SIZE)
> +		if (len == PAGE_SIZE && !(f2fs_is_atomic_file(inode)))
>   			goto repeat;
>   
>   		ret = f2fs_prepare_compress_overwrite(inode, pagep,
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index cfdc41f87f5d..26a648ef9e1f 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -2009,7 +2009,8 @@ static int f2fs_ioc_start_atomic_write(struct file *filp)
>   
>   	inode_lock(inode);
>   
> -	f2fs_disable_compressed_file(inode);
> +	if (!f2fs_disable_compressed_file(inode))
> +		return -EINVAL;
>   
>   	if (f2fs_is_atomic_file(inode)) {
>   		if (is_inode_flag_set(inode, FI_ATOMIC_REVOKE_REQUEST))


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
