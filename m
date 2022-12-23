Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A70C76549B3
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Dec 2022 01:14:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p8Vi8-0000rZ-WF;
	Fri, 23 Dec 2022 00:14:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1p8Vi7-0000rS-GW
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Dec 2022 00:14:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/wdi0KRKsj8pKESKD+rfwDybGwmA3ojPHem0aqJlFq0=; b=TbBG9Cc7NIsnT7FQ2N92+Fw+mn
 FqldKZJEpKp7Yfas4HUBPL86wzlfmdXZOLfEhCo1/NA5aAyPElHx+lMQZ8hP8mM2WqPULtdo/7XM5
 yLzu0aJwJ4h1UF4eSxb8vbNv1K7NotpBND3dlMaTqNu8WRdG74o942hr97LI8u+XA3Js=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/wdi0KRKsj8pKESKD+rfwDybGwmA3ojPHem0aqJlFq0=; b=IYsD0VgcImxDYLQXpWOt0sho6B
 P0rDkD0zI9s758LRqdbIu/9y1SEsHF0bXE3lcn3Byqx5XLKtoevXOJiITHYuS+YQXOExWC+2TENxa
 FNjKmIn8sV7q2mpGCaz90pf9OfgddxBgoneTTCBWHBaxL7mLxiN+urFAplEU3eyuVvP8=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p8Vi3-008QTR-Rz for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Dec 2022 00:14:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9384DB81F66;
 Fri, 23 Dec 2022 00:14:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45F59C433D2;
 Fri, 23 Dec 2022 00:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671754480;
 bh=VE+yqOLcd3z2ANYoGY7M19qxnqQnS9CN5fiaLNE8QTM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=W4cpKjoUuotsEOOB00erID4kYg3YPb2pgf3GJX0X/VT+qrOIwYAOUiKJYgPA/UPAT
 ZAz/Ma0QERpC8iLm86sSEnz34URhJ2dvWv09WecgUou24CGCbRWvLZOaK5FDPsrf0N
 nrmsj2DJeLKEbenEiw9Ja2CCSgfBwmt4U6DLvIxCoQ3g24PVdSqd3F/mAfW4u8oECC
 v3RO0Xpemyn/qrrvYXWCEsParc5Romxq8jmFUFaGhl+e4SvLNCCz3PhIBX6phI4GxY
 ijp3YKYq/qWJb31j03oqDD01ON/MPzok3gBSHaKaEx7hseXsl3R4vXPMuFlrnwwZS8
 mXqYUvzL32yTQ==
Date: Thu, 22 Dec 2022 16:14:38 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <Y6Ty7qaU2jOf/P1m@google.com>
References: <20221222022830.976309-1-raj.khem@gmail.com>
 <20221222022830.976309-2-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221222022830.976309-2-raj.khem@gmail.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/21, Khem Raj wrote: > Remove _LARGEFILE64_SOURCE, this
 is redundant when _FILE_OFFSET_BITS=64 > additionally it fixes build with
 musl because the detection logic for > lseek64 fails because when [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p8Vi3-008QTR-Rz
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs_io: Define _FILE_OFFSET_BITS=64
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 12/21, Khem Raj wrote:
> Remove _LARGEFILE64_SOURCE, this is redundant when _FILE_OFFSET_BITS=64
> additionally it fixes build with musl because the detection logic for
> lseek64 fails because when using _LARGEFILE64_SOURCE musl also define's
> lseek64 as an alias to lseek
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  lib/libf2fs_io.c        | 4 +++-
>  tools/f2fs_io/f2fs_io.c | 4 ++--
>  2 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/libf2fs_io.c b/lib/libf2fs_io.c
> index 1a8167d..abb43a3 100644
> --- a/lib/libf2fs_io.c
> +++ b/lib/libf2fs_io.c
> @@ -11,7 +11,9 @@
>   *
>   * Dual licensed under the GPL or LGPL version 2 licenses.
>   */
> -#define _LARGEFILE64_SOURCE
> +#ifndef _FILE_OFFSET_BITS
> +#define _FILE_OFFSET_BITS 64
> +#endif

This fails to build in x86_64/gcc.

libf2fs_io.c:87:8: error: unknown type name 'off64_t'
   87 | static off64_t  *dcache_blk; /* which block it cached */
      |        ^~~~~~~


>  
>  #include <stdio.h>
>  #include <stdlib.h>
> diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
> index 6dcd840..cb99039 100644
> --- a/tools/f2fs_io/f2fs_io.c
> +++ b/tools/f2fs_io/f2fs_io.c
> @@ -12,8 +12,8 @@
>  #ifndef _LARGEFILE_SOURCE
>  #define _LARGEFILE_SOURCE
>  #endif
> -#ifndef _LARGEFILE64_SOURCE
> -#define _LARGEFILE64_SOURCE
> +#ifndef _FILE_OFFSET_BITS
> +#define _FILE_OFFSET_BITS 64
>  #endif
>  #ifndef O_LARGEFILE
>  #define O_LARGEFILE 0
> -- 
> 2.39.0
> 
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
