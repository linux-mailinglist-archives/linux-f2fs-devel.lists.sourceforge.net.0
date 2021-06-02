Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 606FE399402
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Jun 2021 21:54:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1loWwp-0003FW-3m; Wed, 02 Jun 2021 19:54:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1loWwo-0003FP-B0
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 02 Jun 2021 19:54:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gnb6uAHPUUtbAZoHTC44cWwOEVh3RRu1AQKmnIeaK50=; b=azUcVoOoo96jeRUhUq/Lo3tBjt
 yOKVBWGP1bG8CNOMhqzmC3RbWjHCFNn30L6NVZutTiocuMMX4KA112ZJSrU7tJqY18+NLqlgwo905
 TyhitTE0Gi55qje4gAIbXP7ijZIgtGcumdJjbZYXlIzCLB/PmrvarjON9Senzo3FGQHg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gnb6uAHPUUtbAZoHTC44cWwOEVh3RRu1AQKmnIeaK50=; b=Ve7JPH0jEbjg1DH4t1f9EaaV3F
 cGquwV6D6CYdcao0zts88X31onD9mC3qwJid7BUj/LtSoVOCBZLZUyUWVHOyjB32zf0cfj+tvzHOi
 ttF/sYvlFaucX5X/6tr+macSecrSKlRyKdb/RxVHxJXDvn/WfmJYs5jFrQaNLJIepGOc=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1loWwn-007orK-M5
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 02 Jun 2021 19:54:41 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1D97B613EE;
 Wed,  2 Jun 2021 19:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622663672;
 bh=7IekTvQ7CS5QD1TW6WqSq7COBCKEeOkMr3jBpyWe7ik=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FRi2utBngfyVZe6SNXoEqEEWfnwtYuiD+nA0zi9s8YwkvF7J9sLnFeNxeWNIx2Dca
 cOeYCfXYeHPZJOvIBycxDHDkR6fISULpZ+WRGwub/XKBI13m2dg3j3U9Mlc5LxCCPG
 /s5rY7811rmKQ4dZnP0GCtX/6ttaRq/LT4txxINCh/GMSlUQdVVyyL+14Z/Yrb6Q0o
 FL5O8MfVLRbGFt1Vu7cBqlz8QiBidKXrQxjf8eyYhh0ho2rE7EQKjxUfUTkYSGIBi2
 yLeG8mBoxwrNGGi3v25bVRESRr65vm9nf2db3k0VWBQVQ2MiPQrNAYpoMlC7zDEdJd
 n+IapTdxt7TGA==
Date: Wed, 2 Jun 2021 12:54:30 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Daniel Rosenberg <drosen@google.com>
Message-ID: <YLfh9pv1fDT+Q3pe@sol.localdomain>
References: <20210602041539.123097-1-drosen@google.com>
 <20210602041539.123097-3-drosen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210602041539.123097-3-drosen@google.com>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1loWwn-007orK-M5
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: Advertise encrypted casefolding in
 sysfs
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
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Jun 02, 2021 at 04:15:39AM +0000, Daniel Rosenberg wrote:
> +#ifdef CONFIG_UNICODE
> +F2FS_FEATURE_RO_ATTR(encrypted_casefold, FEAT_ENCRYPTED_CASEFOLD);
> +#endif

Shouldn't it be defined(CONFIG_UNICODE) && defined(CONFIG_FS_ENCRYPTION)?

>  #endif
>  #ifdef CONFIG_BLK_DEV_ZONED
>  F2FS_FEATURE_RO_ATTR(block_zoned, FEAT_BLKZONED);
> @@ -815,6 +823,9 @@ static struct attribute *f2fs_feat_attrs[] = {
>  #ifdef CONFIG_FS_ENCRYPTION
>  	ATTR_LIST(encryption),
>  	ATTR_LIST(test_dummy_encryption_v2),
> +#ifdef CONFIG_UNICODE
> +	ATTR_LIST(encrypted_casefold),
> +#endif

Likewise here.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
