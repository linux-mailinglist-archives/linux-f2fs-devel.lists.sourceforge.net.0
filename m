Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 914DE2DD510
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 17 Dec 2020 17:21:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kpw1x-0005lJ-Bp; Thu, 17 Dec 2020 16:21:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1kpw1v-0005kt-RX
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Dec 2020 16:21:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=syvjnyY1cKrgFCFB9R+2izuRbc2TCdjkwkNEsBhnc84=; b=FoZhHYd2uuUAtf+wCJq7S2i1m4
 oTj2z+ukOGC9UyKiNxTBZIsPTnaMf1jijgysCQTX6FPvsnJ2dku/GPOINejKeGFeRqkvVOQdMeHkD
 8uTRu8cb24u673nFp04xTZCsgwO/DZTbKsm/64XLSPPSPpazb6ie6JzGtEO2mEKfEUCQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=syvjnyY1cKrgFCFB9R+2izuRbc2TCdjkwkNEsBhnc84=; b=SbG7ahAt+BiVmy6f+xUcfwM/cv
 W8a+z29dL0wxs+8kYxVOWZErfKhs9yllzL+dV+u6dha6FJM815Y5+yIE8bWZOA5t6l/BwWyoELDGc
 hx2H1bO+MiQaJpzW854dSASt/6cS+cH3uvetfGBL3Ejj7lfvP6QF8FjA0uCh000SbB2g=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kpw1m-000JJH-O1
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Dec 2020 16:21:27 +0000
Date: Thu, 17 Dec 2020 08:21:11 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608222073;
 bh=5ZVdz6tU8WfcGT073w+gVr7OxTaroW5bcOFuHIc1Rkk=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=ArSe9XYB8e+SwvVHNo7AqUa8odgQkAX3DO3FkdD0aDKZzfjdjKFhVpYEge6Zf7Rk8
 flOPd9Wqi0G7xeVlmDrWSCBdT8f3qJmTXf7bovQ9AcwRy49lTFnVyznUbm+SyiIORZ
 hGiF17qcmhAZwTJXX0S83hjhKaY1K3baZXh1+mJd8H/6zkP1gHOCugeIpiERPeQq3/
 nHqnvu3Lu57Qxtg/y5I89C0zu3kjF382FV4QcWVUgcR7eieaVuerINcC1EchLtynzr
 KHJXDciTVJw3XaskK9JxIgXMunBDmbz8PS01PlI3lzI8IJVX83BKciNTkYEpeGfUrY
 QY9MQnaIjYtKA==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: "John A. Leuenhagen" <john+kernel+f2fs-devel@zlima12.com>
Message-ID: <X9uFd2eOcYIjVTLm@google.com>
References: <20201217075744.ytylmaawi2fwvxqv@Lima-1.maple.zlima12.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201217075744.ytylmaawi2fwvxqv@Lima-1.maple.zlima12.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: zlima12.com]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kpw1m-000JJH-O1
Subject: Re: [f2fs-dev] [PATCH] mkfs.f2fs.8: Better document the -g argument.
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

On 12/17, John A. Leuenhagen via Linux-f2fs-devel wrote:
> To use Android defaults, you must use `-g android`. However, the man
> page previously implied that you need only use `-g`.
> 
> Since you must specify `android`, I figured it would be appropriate
> to name that field `default-options` in the man page. If there was ever
> a reason to have a different set of default options, the `-g` option
> could be used with a new `default-options` value, i.e. `-g example`.

Applied, thanks~

> 
> Signed-off-by: John A. Leuenhagen <john@zlima12.com>
> ---
>  man/mkfs.f2fs.8 | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/man/mkfs.f2fs.8 b/man/mkfs.f2fs.8
> index 0aca4dc..c90ebcc 100644
> --- a/man/mkfs.f2fs.8
> +++ b/man/mkfs.f2fs.8
> @@ -32,6 +32,7 @@ mkfs.f2fs \- create an F2FS file system
>  ]
>  [
>  .B \-g
> +.I default-options
>  ]
>  [
>  .B \-i
> @@ -136,8 +137,14 @@ Force overwrite when an existing filesystem is detected on the device.
>  By default, mkfs.f2fs will not write to the device if it suspects that
>  there is a filesystem or partition table on the device already.
>  .TP
> -.BI \-g
> -Add default Android options.
> +.BI \-g " default-options"
> +Use a default set of options.
> +The following values are supported:
> +.RS 1.2i
> +.TP 1.2i
> +.B android
> +Use default options for Android.
> +.RE
>  .TP
>  .BI \-i
>  Enable extended node bitmap.
> -- 
> 2.26.2
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
