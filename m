Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 787B864E137
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Dec 2022 19:46:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p5tFt-0007ro-CS;
	Thu, 15 Dec 2022 18:46:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1p5tFs-0007ri-7w
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Dec 2022 18:46:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qMB3hnNk206TpWv/2jRzGNZ+MMG0HvjLpLTn93hh+Bw=; b=eVBW0k6YBhy6r0+UY39ScLpXbs
 Y5xf+joeBnkUM357nfMljP0bh1PwJB0XU9YvSrY6inAfWMaxDSLmmqJaFvcjEni9BKG0UCrV6OGAA
 dQP26TPjuWyKTcDWZ3EgrVarzaVdZLMLn6/hiTK2z2ogWK2toZ6j5Ow/HPKeCGLuOz44=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qMB3hnNk206TpWv/2jRzGNZ+MMG0HvjLpLTn93hh+Bw=; b=hM8Zoyq9ZxSH162A2Xmg8V5qe0
 As2BBPHw63fwzzDRECbJ96L3BYtfKpZ/KmTWLvEkInFVG7NDXxYUOB0dgblv8yd+nhfczv2Hjbj+m
 6EUuzHzAL2rpCSDLYWdtjUczIbljD7b1+eqxAn0oSjCTNeoOSDDKAfu5j9WUfUhh6Row=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p5tFq-0000iO-7E for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Dec 2022 18:46:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CD00161ED5;
 Thu, 15 Dec 2022 18:46:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 089D4C433EF;
 Thu, 15 Dec 2022 18:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671130004;
 bh=x9bWYzUxgKuZhJ+ojrxhQJDtwuVcFG5HzxB5nLuRHKY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sujr8PWeAcvVFmpdLc0aXAJetCLKKUuNwx4IITPhRJ9LXXsJn5Z+AKi8V9fDKc/wl
 1/lDsqXJgY2uTHOcO/vu+75GRhpveQ/1a7b5cPewN7Br8hLh7kOqn/PKpuvrF4B6GI
 eMMT7uT48j7XHl4dGAR9BeKze+/FaCLTitqsohoptkgbN48I2OHVC46CziNOyxxRFz
 uBBGzbN0aqgUj6/XwrjROwtu+B1LtGMcfBl1sUSJIli1msi+dabmk9364+UyOSVbm5
 zNSoO5dGwm+5Tka5uFiVGaWLv1hPaPKtKCz+CtT30TpO8kp0xtIZXt1679hwbhih+X
 1fD+9eM9DZoNA==
Date: Thu, 15 Dec 2022 10:46:42 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Yangtao Li <frank.li@vivo.com>
Message-ID: <Y5trkmRJ2LIV2u3V@google.com>
References: <20221215172020.8115-1-frank.li@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221215172020.8115-1-frank.li@vivo.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/16, Yangtao Li wrote: > >From now on, f2fs also has
 its own patchwork link, thanks to Jaegeuk > for starting this tool. Let's
 update it to f2fs entry. > > I've been focusing on android storage ( [...]
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p5tFq-0000iO-7E
Subject: Re: [f2fs-dev] [PATCH] MAINTAINERS: Add f2fs's patchwork and add
 Yangtao as a reviewer of f2fs
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 12/16, Yangtao Li wrote:
> >From now on, f2fs also has its own patchwork link, thanks to Jaegeuk
> for starting this tool. Let's update it to f2fs entry.
> 
> I've been focusing on android storage (especially f2fs) for the past
> two years. And I volunteered to be a f2fs reviewer, add my email address
> in maintainship entry of f2fs.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a608f19da3a9..655a8b68b332 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7886,9 +7886,11 @@ F:	drivers/iommu/exynos-iommu.c
>  F2FS FILE SYSTEM
>  M:	Jaegeuk Kim <jaegeuk@kernel.org>
>  M:	Chao Yu <chao@kernel.org>
> +R:	Yangtao Li <frank.li@vivo.com>

Sorry, I don't see the level of your work to reach out to this.

>  L:	linux-f2fs-devel@lists.sourceforge.net
>  S:	Maintained
>  W:	https://f2fs.wiki.kernel.org/
> +Q:	https://patchwork.kernel.org/project/f2fs/list/
>  B:	https://bugzilla.kernel.org/enter_bug.cgi?product=File%20System&component=f2fs
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
>  F:	Documentation/ABI/testing/sysfs-fs-f2fs
> -- 
> 2.25.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
