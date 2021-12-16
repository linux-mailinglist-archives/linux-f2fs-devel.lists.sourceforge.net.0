Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 17705477C87
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 Dec 2021 20:28:03 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mxwQ0-00077x-VE; Thu, 16 Dec 2021 19:27:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1mxwPz-00077o-7b
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 16 Dec 2021 19:27:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=D+MPOLjuC9YAZC7MY1GMbvfD9fePj9JFhSGnk9XGHWk=; b=ZFB2ZeLdzZcg3nmpBK48ZGGI9t
 tqVz5egQVF4FKk0QoMgpE+LawYPqiDTApeC2t6iHm7kJA6oC9gbDe3ctkVtqked9zX87lF0NCLRrU
 2fEki8mlxiu/DaziOvL6a/r8j5C+hJFeX0xFm23Dvvyu/GmYBKzKJyb/VGa4oQsNGYK8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=D+MPOLjuC9YAZC7MY1GMbvfD9fePj9JFhSGnk9XGHWk=; b=i/a5b+8Y11oxr9kpV2MvnqKyPR
 u3nBByAkkkBvuMsk8DfgJcj4UikQrDd/xqqdCdBIhGgGd1G4WVJMfm15uOl4E+US/Nj0a+PKxZNKS
 af1xtZMI36AN7eh+F3OYVgyS1tMCOHxuAmwZmrr7dU1GgyaRhNYU78S1UvUisS933u20=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mxwPy-000GOJ-KQ
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 16 Dec 2021 19:27:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 70DE661F53;
 Thu, 16 Dec 2021 19:27:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0D6AC36AE7;
 Thu, 16 Dec 2021 19:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639682863;
 bh=y9pmpG/GpQhywg0oyPjfAOSC0w9MurmFDyL8vwRPxdQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MtTytv3KtLulXsc5BdJ2vK0Vq2DfIPyfF7uY6lJc2e//Z1J3bTD7+eQDqxmgy8MFH
 Ix2pYTZecI7tdxbAKQ8ZBY621IzmQlhaVdrrDhs5PBDzoxH7N9Vy4NvxQTSmD+8qD2
 kSx0qI44oFplBGf3ER3NIuFGCOb1zZOWHCHbmKqkr7vIRMw/MRC4qyGpyI/k9haSKU
 ADMOI/auT7tegII6s8t+z0DLlopY4+oDBoPGHSU60uo/N0THauoJdHG4Ot5EkZvbPU
 y5T/DXclQ/oOvM8V5oprN4GNjpXAHc0Oj4rMZRbfDKX/r3znLPEHkPEXfFiDWiCDnE
 wuBiA79X1lRAw==
Date: Thu, 16 Dec 2021 11:27:42 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Yang Li <yang.lee@linux.alibaba.com>
Message-ID: <YbuTLr/HJO3IMI6u@google.com>
References: <20211215023858.33303-1-yang.lee@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211215023858.33303-1-yang.lee@linux.alibaba.com>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/15,
 Yang Li wrote: > Fix the following coccicheck warning:
 > ./fs/f2fs/sysfs.c:491:41-46: WARNING: conversion to bool not needed here
 > > Reported-by: Abaci Robot <abaci@linux.alibaba.com> > Sig [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mxwPy-000GOJ-KQ
Subject: Re: [f2fs-dev] [PATCH -next] f2fs: Simplify bool conversion
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
Cc: Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 12/15, Yang Li wrote:
> Fix the following coccicheck warning:
> ./fs/f2fs/sysfs.c:491:41-46: WARNING: conversion to bool not needed here
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  fs/f2fs/sysfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index 9e1cf44642ae..530c36b89bf1 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -488,7 +488,7 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
>  
>  	if (!strcmp(a->attr.name, "gc_urgent_high_remaining")) {
>  		spin_lock(&sbi->gc_urgent_high_lock);
> -		sbi->gc_urgent_high_limited = t == 0 ? false : true;
> +		sbi->gc_urgent_high_limited = t != 0;

Why not this?
		sbi->gc_urgent_high_limited = t;

>  		sbi->gc_urgent_high_remaining = t;
>  		spin_unlock(&sbi->gc_urgent_high_lock);
>  
> -- 
> 2.20.1.7.g153144c


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
