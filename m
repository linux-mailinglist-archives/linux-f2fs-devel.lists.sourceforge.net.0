Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA5D9AE301
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 24 Oct 2024 12:49:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t3vOz-0002jX-Cd;
	Thu, 24 Oct 2024 10:49:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1t3vOx-0002jK-WC
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Oct 2024 10:49:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bN9I1JJkp22a7vKfMvoew4Qeuk8aW2j4g0lDhcw0+wo=; b=jcA9PoOMFg7pRrPQxn+VLHhVKY
 6nHJscvE9YKHb0zQeuklLFem7aproNY72x/gVCyVbzVDsRCZU7OHM9kFrD8EyxjYE1lhgaIehhu2e
 LXqMYWHMCAzK2Twg0dRTwkcQcO00P5XhlZHG7fisMgkPQcD7ZKC19SbtcRRTvHBnjBZc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bN9I1JJkp22a7vKfMvoew4Qeuk8aW2j4g0lDhcw0+wo=; b=B548bBqUjwvtLgVP8+Z/J9Wnvz
 AhWH8SwKhjhZJh3b3b/Fpfd4yyD+7BSMc84SRxgl6AAo0adWxb7UfN6ZxKXfV1Xg5wpUmFGcrW7T8
 /bBGH4y5T5KAz0ixn3KugUqXblvVxypYopv1YMHNyslHlrzymC+SStuk9zy3cn/zLsFs=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t3vOx-0008Ha-SR for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Oct 2024 10:49:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id F2200A452BB;
 Thu, 24 Oct 2024 10:48:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE8F8C4CEC7;
 Thu, 24 Oct 2024 10:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729766940;
 bh=QBIUyzNrF0JLjhARXuYRcTcvRkEiWVTMcOrNUSB679s=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=PaGAkgOpPsDYIUNbryZOZKUGtPadB14Z8I965dkhNKDla8AQ1kwiP/r1ylgGkiXlC
 ULX1Q4MqeRNwmSPvZ0ozhr1mR6raKluRrSLttRov2YobqXh3fCMdwrDZSy5Y/y/0Dl
 UK1PDtb6IUrY6BlD4bk0fGfCJ6BBWg6acwMRs7vU5PcsVFxpI4fd/cZ686XxK/jE9v
 xGV6ghfJp96Ie3V9RQB/64rEvNYVGabyGBaIWYXrM7WPAdcFAoaVtBLOcDfo/qQu5F
 97/ZUOcQPyczHsEFVIovGkKB6yHG1ThlRrgz8lvW30oHrhr7uHv8vnKqXxZvHlcwRv
 CEGnmWGrjmNEw==
Message-ID: <a224e560-2937-4edd-93d8-8077de6054b1@kernel.org>
Date: Thu, 24 Oct 2024 18:48:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhiguo Niu <zhiguo.niu@unisoc.com>, jaegeuk@kernel.org
References: <1729762134-380-1-git-send-email-zhiguo.niu@unisoc.com>
Content-Language: en-US
In-Reply-To: <1729762134-380-1-git-send-email-zhiguo.niu@unisoc.com>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/10/24 17:28, Zhiguo Niu wrote: > F2FS_BLKSIZE may
 be 4KB, 16KB, so use F2FS_BLKSIZE to replace > some hardcode desc about unit
 in some f2fs_io cmd, also > adjust "-c" parameters in mkfs man, t [...] 
 Content analysis details:   (-0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t3vOx-0008Ha-SR
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: correct some confused desc about
 unit
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

On 2024/10/24 17:28, Zhiguo Niu wrote:
> F2FS_BLKSIZE may be 4KB, 16KB, so use F2FS_BLKSIZE to replace
> some hardcode desc about unit in some f2fs_io cmd, also
> adjust "-c" parameters in mkfs man, to be consistent with
> commit c35fa8cd75ac ("mkfs.f2fs: change -c option description").
> 
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
> ---
>   man/mkfs.f2fs.8         | 2 +-
>   tools/f2fs_io/f2fs_io.c | 6 +++---
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/man/mkfs.f2fs.8 b/man/mkfs.f2fs.8
> index de885be..8b3b0cc 100644
> --- a/man/mkfs.f2fs.8
> +++ b/man/mkfs.f2fs.8
> @@ -122,7 +122,7 @@ block size matches the page size.
>   The default value is 4096.
>   .TP
>   .BI \-c " device-list"
> -Build f2fs with these additional comma separated devices, so that the user can
> +Build f2fs with these additional devices, so that the user can
>   see all the devices as one big volume.
>   Supports up to 7 devices except meta device.
>   .TP
> diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
> index 95f575f..ee4ed0e 100644
> --- a/tools/f2fs_io/f2fs_io.c
> +++ b/tools/f2fs_io/f2fs_io.c
> @@ -1013,7 +1013,7 @@ static void do_randread(int argc, char **argv, const struct cmd_desc *cmd)
>   
>   #define fiemap_desc "get block address in file"
>   #define fiemap_help					\
> -"f2fs_io fiemap [offset in 4kb] [count in 4kb] [file_path]\n\n"\
> +"f2fs_io fiemap [offset in F2FS_BLKSIZE] [count in F2FS_BLKSIZE] [file_path]\n\n"\
>   
>   #if defined(HAVE_LINUX_FIEMAP_H) && defined(HAVE_LINUX_FS_H)
>   static void do_fiemap(int argc, char **argv, const struct cmd_desc *cmd)
> @@ -1617,8 +1617,8 @@ static void do_move_range(int argc, char **argv, const struct cmd_desc *cmd)
>   #define gc_range_desc "trigger filesystem gc_range"
>   #define gc_range_help "f2fs_io gc_range [sync_mode] [start] [length] [file_path]\n\n"\
>   "  sync_mode : 0: asynchronous, 1: synchronous\n"			\
> -"  start     : start offset of defragment region, unit: 4kb\n"	\
> -"  length    : bytes number of defragment region, unit: 4kb\n"	\
> +"  start     : start offset of defragment region, unit: F2FS_BLKSIZE\n"	\
> +"  length    : bytes number of defragment region, unit: F2FS_BLKSIZE\n"	\

I think we'd better unify default block size to 4096 since in most of
places in f2fs_io.c, we use 4096 as default IO/buffer size.

git grep -n "4096" tools/f2fs_io/f2fs_io.c
tools/f2fs_io/f2fs_io.c:212:    args.block_size = 4096;
tools/f2fs_io/f2fs_io.c:662:    buf_size = bs * 4096;
tools/f2fs_io/f2fs_io.c:666:    buf = aligned_xalloc(4096, buf_size);
tools/f2fs_io/f2fs_io.c:877:    buf_size = bs * 4096;
tools/f2fs_io/f2fs_io.c:881:    buf = aligned_xalloc(4096, buf_size);
tools/f2fs_io/f2fs_io.c:901:            if (posix_fadvise(fd, 0, 4096, POSIX_FADV_SEQUENTIAL) != 0)
tools/f2fs_io/f2fs_io.c:903:            if (posix_fadvise(fd, 0, 4096, POSIX_FADV_WILLNEED) != 0)
tools/f2fs_io/f2fs_io.c:979:    buf_size = bs * 4096;
tools/f2fs_io/f2fs_io.c:981:    buf = aligned_xalloc(4096, buf_size);
tools/f2fs_io/f2fs_io.c:994:    aligned_size = (u64)stbuf.st_size & ~((u64)(4096 - 1));
tools/f2fs_io/f2fs_io.c:997:    end_idx = (u64)(aligned_size - buf_size) / (u64)4096 + 1;
tools/f2fs_io/f2fs_io.c:1004:           ret = pread(fd, buf, buf_size, 4096 * idx);
tools/f2fs_io/f2fs_io.c:1222:           char *buf = aligned_xalloc(4096, 4096);
tools/f2fs_io/f2fs_io.c:1224:           while ((ret = xread(src_fd, buf, 4096)) > 0)

git grep -n "F2FS_BLKSIZE" tools/f2fs_io/f2fs_io.c
tools/f2fs_io/f2fs_io.c:1034:   start = (u64)atoi(argv[1]) * F2FS_BLKSIZE;
tools/f2fs_io/f2fs_io.c:1035:   length = (u64)atoi(argv[2]) * F2FS_BLKSIZE;
tools/f2fs_io/f2fs_io.c:1042:                           start / F2FS_BLKSIZE, length / F2FS_BLKSIZE);

We can add a new macro F2FS_DEFAULT_BLKSIZE and use it instead of magic
number and F2FS_BLKSIZE, what do you think?

Thanks,

>   
>   static void do_gc_range(int argc, char **argv, const struct cmd_desc *cmd)
>   {



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
