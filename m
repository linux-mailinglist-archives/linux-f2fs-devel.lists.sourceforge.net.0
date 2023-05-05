Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 924AA6F82D1
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  5 May 2023 14:22:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1puuRs-0006Ru-ID;
	Fri, 05 May 2023 12:22:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1puuRn-0006Rn-Ay
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 05 May 2023 12:22:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7Z7eix1/UmFLd69fyYThNpexgkZd+bAa2TEj8jkRQJk=; b=UblPZu06Y4863XvSMbs0HFoJFd
 cYxbNg9VDtGZGPlPjEr+38mfoTZgAs4K1qJ7BM5zjE+GzZ0Zt7wGXaYFpwnDQSyrfRAX2M92X+Ho7
 JkvivxlZ7qM+kwPZK4h6Hm/v6LqhgU2AHl78pYrawjGceUrQ1xDvqWVD3ENWrAxVJueA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7Z7eix1/UmFLd69fyYThNpexgkZd+bAa2TEj8jkRQJk=; b=KmBfFebgDVudZaUks5cjuWGzaO
 Iuob5sNGotmaI0MCEE8eN0TUPwyqIbCDIKKKevhdSkvp/yyHhen2GgPSe+juSm0IuSjSb+D6Rgyx3
 3lXrsolKwt9yZewmS3lA2a03b/DTcWX8joxyNCfjAIxAFc5jCskUm2CxgtMmA6fRegjY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1puuRm-00FE8x-Ts for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 05 May 2023 12:22:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8AFF9615FB;
 Fri,  5 May 2023 12:21:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85BDFC433EF;
 Fri,  5 May 2023 12:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683289317;
 bh=kVbC8QvtTP91akM/8g+e5cDFlJlaPkveDFGRjOeaEKM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=qUYjMmblucGyhbYQG0FO69Lqlm7ZsgApRx0RohzGK+UBJHCp9HEfAa+qCspEh2X3B
 Q+SsPwEj+98C0tGiKZp9irP6uO3Ue2VYHUShHvRSvastgfDy94gw0KUvucjRWGHdGj
 5aQc+ITUIgrsgU6F/4HDG4gL9CUTy0A61ub7hGpszwaDKau6wHmtv/K+UjN34gg593
 1tZDFmC33ZW34x2OvYc8EAuP6p9kX5RvYha8H4oOnBdz1y7ZN16SXQdE++s/El8UjW
 +RjVh5lVtMntV3E5eaqgOiO24iPRveYNbF8vJZJn3HrHv/l7iWvgpP8GPnBG2gSIT3
 j4K9kvuEgXAZQ==
Message-ID: <c0fbc92e-2ba1-0500-023e-743ac297d587@kernel.org>
Date: Fri, 5 May 2023 20:21:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20230504185238.19488-1-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230504185238.19488-1-frank.li@vivo.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/5/5 2:52,
 Yangtao Li wrote: > In the following scenario, 
 after executing the move_range ioctl syscall, > the block size of the source
 file is 0, but data can still be read. > > # stat test > F [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1puuRm-00FE8x-Ts
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to call invalidate_mapping_pages
 in f2fs_move_file_range
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

On 2023/5/5 2:52, Yangtao Li wrote:
> In the following scenario, after executing the move_range ioctl syscall,
> the block size of the source file is 0, but data can still be read.
> 
>    # stat test
>    File: test
>    Size: 6               Blocks: 8          IO Block: 4096   regular file
>    # ./new_f2fs_io move_range test test_move_range 0 0 0
>    move range ret=0
>    # stat test
>    File: test
>    Size: 6               Blocks: 0          IO Block: 4096   regular file
>    # cat test
>    nihao
> 
> Let's fix to call invalidate_mapping_pages() after __exchange_data_block()
> success.
> 
> Fixes: 4dd6f977fc77 ("f2fs: support an ioctl to move a range of data blocks")
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>   fs/f2fs/file.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 78aa8cff4b41..ae7752c5cd0a 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -2870,6 +2870,9 @@ static int f2fs_move_file_range(struct file *file_in, loff_t pos_in,
>   			f2fs_i_size_write(dst, dst_max_i_size);
>   		else if (dst_osize != dst->i_size)
>   			f2fs_i_size_write(dst, dst_osize);
> +
> +		invalidate_mapping_pages(src->i_mapping,
> +				pos_out, pos_in + len);

It needs to consider error cases?

Should we call this to drop page cache of src_inode after __clone_blkaddrs()
for each round exchange in __exchange_data_block()? and also drop page cache
of dst_indoe in roll_back case?

Thanks,

>   	}
>   	f2fs_unlock_op(sbi);
>   


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
