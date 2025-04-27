Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 33078A9E118
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 27 Apr 2025 10:46:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u8xec-0006ex-6s;
	Sun, 27 Apr 2025 08:46:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1u8xea-0006er-Se
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 27 Apr 2025 08:46:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5KI2L5ivUK9NlFQoIhrgUx+i3n/Dom6NR1YxsrvYAco=; b=FCDuqOfdGTT1jrVa1cG8VfrYpO
 SgOn3a8jWUzdBl/HkaxAiK9/x3NFaVaYDlSGGSacZH3PUFKJ9Ed7ZP235c/GF+VvdDKtWqDvudDB2
 32Baml7Q5Ou+4cSm6JtrL2qchG/y3VcUR9z12yby/JOIu2E+pLFWDzJ1E4ZqArUgln4E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5KI2L5ivUK9NlFQoIhrgUx+i3n/Dom6NR1YxsrvYAco=; b=FsaPdrjNlRC75xWN67hpw7ndlt
 M3p7iidZNOgyeTjasVtLEOL5sMwPUuhyepzFROKmGXHGroa0qlvwaBOSEKMVAYpowFHNXifZGhxJ2
 VQECGYE/ID0oT6EZZgOzYPSk6TV1sCHMC3IOMMpdrHsX89nvN7eC0hKcFn1WD+cEBOK4=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u8xeL-0000UO-5g for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 27 Apr 2025 08:46:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C9B1F68444;
 Sun, 27 Apr 2025 08:45:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71E77C4CEE3;
 Sun, 27 Apr 2025 08:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745743563;
 bh=rCcI+tdLs9zIz0fIv5ikr+V0j+yc/33LJttCK7iCtQY=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=jCVKBoGCifxhAKaeMdPE1idNaqnEAg1uILpj8Dx8a4VAYQ9YAkjgOE0VQ+peRQErh
 E/Tgyl39AQ/zWlXekae2UQirMEKixl+8LH6wKR6hvFOsaGzQz7+81i+EdCl0tZAx4A
 7ze0lOWLjs1F4y42TEcQg/t0j9zAdBV/UlDw5wN5O+6Fz+L9L70zbmEuGcXzYNRw3h
 Qst8sLr4q1ZPZmMRvE9WwTUuTOzK+QVZyR6MWk5rdDJX/341R5VmXnWDa9QR9xJOxL
 ExRsv5iPsLrWKnGHWdTVRFej+tpwkOJIeyqWkUvIVYWYqiv8RtCZxxNTpVHlx8Ztxe
 zzw8DVpLNwgQA==
Message-ID: <c2f5bc82-3e8d-4ca8-9818-d90be8ce374f@kernel.org>
Date: Sun, 27 Apr 2025 16:45:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: nl6720 <devnull@nl6720.me>, linux-f2fs-devel@lists.sourceforge.net
References: <20250425013623.918150-1-devnull@nl6720.me>
Content-Language: en-US
In-Reply-To: <20250425013623.918150-1-devnull@nl6720.me>
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/25/25 09:36, nl6720 via Linux-f2fs-devel wrote: > Some
 drives operate in "512e" configuration with their logical block > size set
 to 512 bytes for legacy compatibility reasons while providing > a [...] 
 Content analysis details:   (-0.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in sa-accredit.habeas.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in bl.score.senderscore.com]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u8xeL-0000UO-5g
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: prefer physical over logical
 block size
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 4/25/25 09:36, nl6720 via Linux-f2fs-devel wrote:
> Some drives operate in "512e" configuration with their logical block
> size set to 512 bytes for legacy compatibility reasons while providing
> a more optimal 4096 byte value as the physical block size.
> 
> Since the physical block size is the smallest unit a physical storage
> device can write atomically, prefer it over the logical block size.
> 
> Closes: https://github.com/jaegeuk/f2fs-tools/issues/29

f2fs uses PAGE_SIZE as block size, commonly it's 4096 rather than 512?

Thanks,

> 
> Signed-off-by: nl6720 <devnull@nl6720.me>
> ---
>  lib/libf2fs.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/libf2fs.c b/lib/libf2fs.c
> index d2579d76a5c7eaf141dc8aad11c176eeadabad83..040ea4bc87288fa075cb4bf51df08b9db28a65b3 100644
> --- a/lib/libf2fs.c
> +++ b/lib/libf2fs.c
> @@ -933,10 +933,15 @@ void get_kernel_uname_version(__u8 *version)
>  #define BLKSSZGET	_IO(0x12,104)
>  #endif
>  
> +#if defined(__linux__) && defined(_IO) && !defined(BLKPBSZGET)
> +#define BLKPBSZGET	_IO(0x12,123)
> +#endif
> +
>  #if defined(__APPLE__)
>  #include <sys/disk.h>
>  #define BLKGETSIZE	DKIOCGETBLOCKCOUNT
>  #define BLKSSZGET	DKIOCGETBLOCKCOUNT
> +#define BLKPBSZGET	DKIOCGETBLOCKCOUNT
>  #endif /* APPLE_DARWIN */
>  
>  #ifndef _WIN32
> @@ -1050,8 +1055,8 @@ int get_device_info(int i)
>  	} else if (S_ISREG(stat_buf->st_mode)) {
>  		dev->total_sectors = stat_buf->st_size / dev->sector_size;
>  	} else if (S_ISBLK(stat_buf->st_mode)) {
> -#ifdef BLKSSZGET
> -		if (ioctl(fd, BLKSSZGET, &sector_size) < 0)
> +#if defined(BLKPBSZGET) && defined(BLKSSZGET)
> +		if ((ioctl(fd, BLKPBSZGET, &sector_size) < 0) && (ioctl(fd, BLKSSZGET, &sector_size) < 0))
>  			MSG(0, "\tError: Using the default sector size\n");
>  		else if (dev->sector_size < sector_size)
>  			dev->sector_size = sector_size;



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
