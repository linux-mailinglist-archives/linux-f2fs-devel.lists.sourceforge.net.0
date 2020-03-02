Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0E817618F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  2 Mar 2020 18:50:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j8pD2-0005VH-S1; Mon, 02 Mar 2020 17:50:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1j8pCz-0005Ux-Tk
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 02 Mar 2020 17:50:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7xrXVO+rwlWjqq/9vxJYCRJ9NIjQ/b/98VjPfbxG0BE=; b=jew8/kWlvwhVraDySXjV5zXTv+
 I+JLByrYt4KKZCyBi++uwfUKvqw6oOBy8g4+XOF00JlnmIbSD3338MM+IphVo/EwwvFh7BRPFlElJ
 vvm2YQPrj4rPEeZSNGm4+I/l7mpgmVRr2HsL3nJLObhS/Qx9hxFzy1bqEWdZFxlsk55g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7xrXVO+rwlWjqq/9vxJYCRJ9NIjQ/b/98VjPfbxG0BE=; b=c9OHi4CIpKmmwySpTwVefYS41a
 XvOGKKS/bwkbsA0V4NNLpRHLm3CNVlcr1VCCJjBX4y5rJOauc7jGriSTZR+igKDQvS1sr4n2XUoLF
 UJQtk3whIk1ByfmVrBmD7EOfxqlgzYvtELM0/w8bD1xnunyYhTj1jUooLJLcpF6GVnOw=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j8pCw-00BG41-Cm
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 02 Mar 2020 17:50:25 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DB0DE214DB;
 Mon,  2 Mar 2020 17:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583171416;
 bh=6k85wi2JdoMHglj+WpaRbnb+L0nNsUt9jd/nKM6n8H4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XAx9vtyE2Nf9ytTuEaFKQIrVapER7/q84E+ugRqoRoWvIpNsZGCEN/5TR9LsKwUgQ
 vpH19g2uv2ZFc40IwwJ6E4PxKM4ABmefg98Xf3Ve9EXrT6V4iVSNR98TUTPxok+X0s
 sUGDcJfYg0F/LmQhiSw4ev4u+c9jyxx8GkU4FTZk=
Date: Mon, 2 Mar 2020 09:50:14 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200302175014.GA98133@gmail.com>
References: <20200228111456.11311-1-yuchao0@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200228111456.11311-1-yuchao0@huawei.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Spam-Score: 1.4 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 1.1 FSL_HELO_FAKE          No description available.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j8pCw-00BG41-Cm
Subject: Re: [f2fs-dev] [PATCH] f2fs: compress: support zstd compress
 algorithm
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Feb 28, 2020 at 07:14:56PM +0800, Chao Yu wrote:
> Add zstd compress algorithm support, use "compress_algorithm=zstd"
> mountoption to enable it.
> 
> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> ---
>  Documentation/filesystems/f2fs.txt |   4 +-
>  fs/f2fs/Kconfig                    |   9 ++
>  fs/f2fs/compress.c                 | 151 +++++++++++++++++++++++++++++
>  fs/f2fs/f2fs.h                     |   2 +
>  fs/f2fs/super.c                    |   7 ++
>  include/trace/events/f2fs.h        |   3 +-
>  6 files changed, 173 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/filesystems/f2fs.txt b/Documentation/filesystems/f2fs.txt
> index 4eb3e2ddd00e..b1a66cf0e967 100644
> --- a/Documentation/filesystems/f2fs.txt
> +++ b/Documentation/filesystems/f2fs.txt
> @@ -235,8 +235,8 @@ checkpoint=%s[:%u[%]]     Set to "disable" to turn off checkpointing. Set to "en
>                         hide up to all remaining free space. The actual space that
>                         would be unusable can be viewed at /sys/fs/f2fs/<disk>/unusable
>                         This space is reclaimed once checkpoint=enable.
> -compress_algorithm=%s  Control compress algorithm, currently f2fs supports "lzo"
> -                       and "lz4" algorithm.
> +compress_algorithm=%s  Control compress algorithm, currently f2fs supports "lzo",
> +                       "lz4" and "zstd" algorithm.
>  compress_log_size=%u   Support configuring compress cluster size, the size will
>                         be 4KB * (1 << %u), 16KB is minimum size, also it's
>                         default size.
> diff --git a/fs/f2fs/Kconfig b/fs/f2fs/Kconfig
> index f0faada30f30..bb68d21e1f8c 100644
> --- a/fs/f2fs/Kconfig
> +++ b/fs/f2fs/Kconfig
> @@ -118,3 +118,12 @@ config F2FS_FS_LZ4
>  	default y
>  	help
>  	  Support LZ4 compress algorithm, if unsure, say Y.
> +
> +config F2FS_FS_ZSTD
> +	bool "ZSTD compression support"
> +	depends on F2FS_FS_COMPRESSION
> +	select ZSTD_COMPRESS
> +	select ZSTD_DECOMPRESS
> +	default y
> +	help
> +	  Support ZSTD compress algorithm, if unsure, say Y.
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index bd3ea01db448..c8e1175eaf4e 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -11,6 +11,7 @@
>  #include <linux/backing-dev.h>
>  #include <linux/lzo.h>
>  #include <linux/lz4.h>
> +#include <linux/zstd.h>
>  
>  #include "f2fs.h"
>  #include "node.h"
> @@ -291,6 +292,151 @@ static const struct f2fs_compress_ops f2fs_lz4_ops = {
>  };
>  #endif
>  
> +#ifdef CONFIG_F2FS_FS_ZSTD
> +#define F2FS_ZSTD_DEFAULT_CLEVEL	1
> +
> +static int zstd_init_compress_ctx(struct compress_ctx *cc)
> +{
> +	return 0;
> +}
> +
> +static void zstd_destroy_compress_ctx(struct compress_ctx *cc)
> +{
> +}
> +
> +static int zstd_compress_pages(struct compress_ctx *cc)
> +{
> +	ZSTD_parameters params;
> +	ZSTD_CStream *stream;
> +	ZSTD_inBuffer inbuf;
> +	ZSTD_outBuffer outbuf;
> +	void *workspace;
> +	unsigned int workspace_size;
> +	int src_size = cc->rlen;
> +	int dst_size = src_size - PAGE_SIZE - COMPRESS_HEADER_SIZE;
> +	int ret;
> +
> +	params = ZSTD_getParams(F2FS_ZSTD_DEFAULT_CLEVEL, src_size, 0);
> +	workspace_size = ZSTD_CStreamWorkspaceBound(params.cParams);
> +
> +	workspace = f2fs_kvmalloc(F2FS_I_SB(cc->inode),
> +					workspace_size, GFP_NOFS);
> +	if (!workspace)
> +		return -ENOMEM;
> +
> +	stream = ZSTD_initCStream(params, 0,
> +					workspace, workspace_size);

Why is this allocating the memory for every compression operation, instead of
ahead of time in ->init_compress_ctx()?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
