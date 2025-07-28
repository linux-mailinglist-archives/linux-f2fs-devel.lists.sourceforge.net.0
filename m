Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E3311B135CA
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Jul 2025 09:38:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N3/6DOxmE3h4pG3QrlaqdhxJBVQ82zsKZ6aYvIrvVRo=; b=Qnp56VKoLEgA4sNxr4d+XBrM0h
	ygS+VUtRTsUQ/jA8lUdk5EnJRcadmgpw+IfjK9vRFF8AsYY0uQRlAIJFDNiTs67/eA0S/KktGnRrW
	9FJR+HW8pbKvMyd6kgg9pmvvRpxOr6z+0bhbo6NXiou0ASfLqwmHOk2NF/0nyVs6lQKg=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ugIRP-0003TB-NV;
	Mon, 28 Jul 2025 07:38:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ugIRO-0003Su-2k
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Jul 2025 07:38:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3QJdYrra0DbuwOXYAue7lqrBod6jgRxZzVJGY26b2Ds=; b=OMeVNkfsJvzZBuk6K2iMiHJbPd
 kP7XKB8aU033fTQ35hmoSpqp531nPNpeUNVYRNguH3d46OTIrzZ0n0csgpdgGhrakWaPCtojlX7nG
 JCCpl7uVVL6ElyvLItdqflVKgyPgTkCpvdb9stT3y0mF4v1vL2wb4v/BDBTC257iXhJ4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3QJdYrra0DbuwOXYAue7lqrBod6jgRxZzVJGY26b2Ds=; b=gt+KdQ52n/4ELdgBLa7xdfiHoe
 yRI1nbfpcALzm+9AFCY/Gt5+o6Mgkepgp3NCnQMut2K8vy514yzlENILZVYMi0t683DNyi3dhMtjL
 cPxTJrRhU7J9xBNc3bJcxjPvUFCUeowiTy9ICgdLQvnFfEtz+nSim2nN+7SQ44FapS5U=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ugIRO-0003fq-26 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Jul 2025 07:38:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B39024439D;
 Mon, 28 Jul 2025 07:38:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64899C4CEE7;
 Mon, 28 Jul 2025 07:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753688308;
 bh=MXCtCH4Mr1jaHZuM+QGNycFJtdivRPqdSwiI9clW9h4=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=KvHF3H3gSLZ5/ut2pHq1z0zyhB/m8iWH3RoMKOocLzap1sk67LGY6BfdseQGJabqr
 M78OLmkIt6gJXyUcZ3zkjhQCzV15RV3I05dq/MNqz7NmR7znHjxt+FRWIBjTqKFCT7
 TG7kliGEGiPaUm+Ng3y3ZsUG3ERMijlX3hWs6QRNlXtHGDUjE/Vm6Tko6/Aut+DyUE
 eCe2xi/1U/gJbemI6q25Oanx1Lvt3wJMcQGeNnW7r1XFOfqGUzUDbO/YK9QcEDPuwZ
 gzHcJqT3/uzMZMKTVJX8QDg3kfeePelaFFQTqap3AqsqognwrIBUM602PejI4FWVGl
 KGUEL0M7tg06Q==
Message-ID: <d258ab6d-a97a-4232-bf90-5afedd5cccb2@kernel.org>
Date: Mon, 28 Jul 2025 15:38:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Qi Han <hanqi@vivo.com>, jaegeuk@kernel.org
References: <20250725075310.1614614-1-hanqi@vivo.com>
Content-Language: en-US
In-Reply-To: <20250725075310.1614614-1-hanqi@vivo.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 7/25/25 15:53, Qi Han wrote: > Jens has already completed
 the development of uncached buffered I/O > in git [1], and in f2fs, uncached
 buffered I/O read can be enabled > simply by setting the FOP_D [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ugIRO-0003fq-26
Subject: Re: [f2fs-dev] [PATCH] f2fs: f2fs supports uncached buffered I/O
 read
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

On 7/25/25 15:53, Qi Han wrote:
> Jens has already completed the development of uncached buffered I/O
> in git [1], and in f2fs, uncached buffered I/O read can be enabled
> simply by setting the FOP_DONTCACHE flag in f2fs_file_operations.

IIUC, we may suffer lock issue when we call pwritev(.. ,RWF_DONTCACHE)?
as Jen mentioned in below path, right?

soft-irq
- folio_end_writeback()
 - filemap_end_dropbehind_write()
  - filemap_end_dropbehind()
   - folio_unmap_invalidate()
    - lock i_lock

Thanks,

> 
> I have been testing a use case locally, which aligns with Jens' test
> case [2]. In the read scenario, using uncached buffer I/O results in
> more stable read performance and a lower load on the background memory
> reclaim thread (kswapd). So let's enable uncached buffer I/O reads on
> F2FS.
> 
> Read test data without using uncached buffer I/O:
> reading bs 32768, uncached 0
>    1s: 1856MB/sec, MB=1856
>    2s: 1907MB/sec, MB=3763
>    3s: 1830MB/sec, MB=5594
>    4s: 1745MB/sec, MB=7333
>    5s: 1829MB/sec, MB=9162
>    6s: 1903MB/sec, MB=11075
>    7s: 1878MB/sec, MB=12942
>    8s: 1763MB/sec, MB=14718
>    9s: 1845MB/sec, MB=16549
>   10s: 1915MB/sec, MB=18481
>   11s: 1831MB/sec, MB=20295
>   12s: 1750MB/sec, MB=22066
>   13s: 1787MB/sec, MB=23832
>   14s: 1913MB/sec, MB=25769
>   15s: 1898MB/sec, MB=27668
>   16s: 1795MB/sec, MB=29436
>   17s: 1812MB/sec, MB=31248
>   18s: 1890MB/sec, MB=33139
>   19s: 1880MB/sec, MB=35020
>   20s: 1754MB/sec, MB=36810
> 
> 08:36:26      UID       PID    %usr %system  %guest   %wait    %CPU   CPU  Command
> 08:36:27        0        93    0.00    0.00    0.00    0.00    0.00     7  kswapd0
> 08:36:28        0        93    0.00    0.00    0.00    0.00    0.00     7  kswapd0
> 08:36:29        0        93    0.00    0.00    0.00    0.00    0.00     7  kswapd0
> 08:36:30        0        93    0.00   56.00    0.00    0.00   56.00     7  kswapd0
> 08:36:31        0        93    0.00   73.00    0.00    0.00   73.00     7  kswapd0
> 08:36:32        0        93    0.00   83.00    0.00    0.00   83.00     7  kswapd0
> 08:36:33        0        93    0.00   75.00    0.00    0.00   75.00     7  kswapd0
> 08:36:34        0        93    0.00   81.00    0.00    0.00   81.00     7  kswapd0
> 08:36:35        0        93    0.00   54.00    0.00    1.00   54.00     2  kswapd0
> 08:36:36        0        93    0.00   61.00    0.00    0.00   61.00     0  kswapd0
> 08:36:37        0        93    0.00   68.00    0.00    0.00   68.00     7  kswapd0
> 08:36:38        0        93    0.00   53.00    0.00    0.00   53.00     2  kswapd0
> 08:36:39        0        93    0.00   82.00    0.00    0.00   82.00     7  kswapd0
> 08:36:40        0        93    0.00   77.00    0.00    0.00   77.00     1  kswapd0
> 08:36:41        0        93    0.00   74.00    0.00    1.00   74.00     7  kswapd0
> 08:36:42        0        93    0.00   71.00    0.00    0.00   71.00     7  kswapd0
> 08:36:43        0        93    0.00   78.00    0.00    0.00   78.00     7  kswapd0
> 08:36:44        0        93    0.00   85.00    0.00    0.00   85.00     7  kswapd0
> 08:36:45        0        93    0.00   83.00    0.00    0.00   83.00     7  kswapd0
> 08:36:46        0        93    0.00   70.00    0.00    0.00   70.00     7  kswapd0
> 08:36:47        0        93    0.00   78.00    0.00    1.00   78.00     2  kswapd0
> 08:36:48        0        93    0.00   81.00    0.00    0.00   81.00     3  kswapd0
> 08:36:49        0        93    0.00   54.00    0.00    0.00   54.00     7  kswapd0
> 08:36:50        0        93    0.00   76.00    0.00    0.00   76.00     1  kswapd0
> 08:36:51        0        93    0.00   75.00    0.00    0.00   75.00     0  kswapd0
> 08:36:52        0        93    0.00   73.00    0.00    0.00   73.00     7  kswapd0
> 08:36:53        0        93    0.00   61.00    0.00    1.00   61.00     7  kswapd0
> 08:36:54        0        93    0.00   80.00    0.00    0.00   80.00     7  kswapd0
> 08:36:55        0        93    0.00   64.00    0.00    0.00   64.00     7  kswapd0
> 08:36:56        0        93    0.00   56.00    0.00    0.00   56.00     7  kswapd0
> 08:36:57        0        93    0.00   26.00    0.00    0.00   26.00     2  kswapd0
> 08:36:58        0        93    0.00   24.00    0.00    1.00   24.00     3  kswapd0
> 08:36:59        0        93    0.00   22.00    0.00    1.00   22.00     3  kswapd0
> 08:37:00        0        93    0.00   15.84    0.00    0.00   15.84     3  kswapd0
> 08:37:01        0        93    0.00    0.00    0.00    0.00    0.00     3  kswapd0
> 08:37:02        0        93    0.00    0.00    0.00    0.00    0.00     3  kswapd0
> 
> Read test data after using uncached buffer I/O:
> reading bs 32768, uncached 1
>    1s: 1863MB/sec, MB=1863
>    2s: 1903MB/sec, MB=3766
>    3s: 1860MB/sec, MB=5627
>    4s: 1864MB/sec, MB=7491
>    5s: 1860MB/sec, MB=9352
>    6s: 1854MB/sec, MB=11206
>    7s: 1874MB/sec, MB=13081
>    8s: 1874MB/sec, MB=14943
>    9s: 1840MB/sec, MB=16798
>   10s: 1849MB/sec, MB=18647
>   11s: 1863MB/sec, MB=20511
>   12s: 1798MB/sec, MB=22310
>   13s: 1897MB/sec, MB=24207
>   14s: 1817MB/sec, MB=26025
>   15s: 1893MB/sec, MB=27918
>   16s: 1917MB/sec, MB=29836
>   17s: 1863MB/sec, MB=31699
>   18s: 1904MB/sec, MB=33604
>   19s: 1894MB/sec, MB=35499
>   20s: 1907MB/sec, MB=37407
> 
> 08:38:00      UID       PID    %usr %system  %guest   %wait    %CPU   CPU  Command
> 08:38:01        0        93    0.00    0.00    0.00    0.00    0.00     4  kswapd0
> 08:38:02        0        93    0.00    0.00    0.00    0.00    0.00     4  kswapd0
> 08:38:03        0        93    0.00    0.00    0.00    0.00    0.00     4  kswapd0
> 08:38:04        0        93    0.00    0.00    0.00    0.00    0.00     4  kswapd0
> 08:38:05        0        93    0.00    0.00    0.00    0.00    0.00     4  kswapd0
> 08:38:06        0        93    0.00    1.00    0.00    1.00    1.00     0  kswapd0
> 08:38:07        0        93    0.00    0.00    0.00    0.00    0.00     0  kswapd0
> 08:38:08        0        93    0.00    0.00    0.00    0.00    0.00     0  kswapd0
> 08:38:09        0        93    0.00    1.00    0.00    0.00    1.00     1  kswapd0
> 08:38:10        0        93    0.00    0.00    0.00    0.00    0.00     1  kswapd0
> 08:38:11        0        93    0.00    0.00    0.00    0.00    0.00     1  kswapd0
> 08:38:12        0        93    0.00    0.00    0.00    0.00    0.00     1  kswapd0
> 08:38:13        0        93    0.00    0.00    0.00    0.00    0.00     1  kswapd0
> 08:38:14        0        93    0.00    0.00    0.00    0.00    0.00     1  kswapd0
> 08:38:15        0        93    0.00    3.00    0.00    0.00    3.00     0  kswapd0
> 08:38:16        0        93    0.00    0.00    0.00    0.00    0.00     0  kswapd0
> 08:38:17        0        93    0.00    0.00    0.00    0.00    0.00     0  kswapd0
> 08:38:18        0        93    0.00    0.00    0.00    0.00    0.00     0  kswapd0
> 08:38:19        0        93    0.00    0.00    0.00    0.00    0.00     0  kswapd0
> 08:38:20        0        93    0.00    0.00    0.00    0.00    0.00     0  kswapd0
> 08:38:21        0        93    0.00    0.00    0.00    0.00    0.00     0  kswapd0
> 08:38:22        0        93    0.00    0.00    0.00    0.00    0.00     0  kswapd0
> 08:38:23        0        93    0.00    3.00    0.00    0.00    3.00     4  kswapd0
> 08:38:24        0        93    0.00    0.00    0.00    0.00    0.00     4  kswapd0
> 08:38:25        0        93    0.00    0.00    0.00    0.00    0.00     4  kswapd0
> 08:38:26        0        93    0.00    4.00    0.00    0.00    4.00     3  kswapd0
> 08:38:27        0        93    0.00    0.00    0.00    0.00    0.00     3  kswapd0
> 08:38:28        0        93    0.00    0.00    0.00    0.00    0.00     3  kswapd0
> 08:38:29        0        93    0.00    0.00    0.00    0.00    0.00     3  kswapd0
> 08:38:30        0        93    0.00    0.00    0.00    0.00    0.00     3  kswapd0
> 08:38:31        0        93    0.00    0.00    0.00    0.00    0.00     3  kswapd0
> 08:38:32        0        93    0.00    0.00    0.00    0.00    0.00     3  kswapd0
> 08:38:33        0        93    0.00    0.00    0.00    0.00    0.00     3  kswapd0
> 
> [1]
> https://lore.kernel.org/all/20241220154831.1086649-10-axboe@kernel.dk/T/#m58520a94b46f543d82db3711453dfc7bb594b2b0
> 
> [2]
> https://pastebin.com/u8eCBzB5
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
