Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 528D5466A1D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  2 Dec 2021 20:01:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1msrKL-0007Gp-3z; Thu, 02 Dec 2021 19:01:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1msrKJ-0007GY-M9
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 02 Dec 2021 19:01:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yfyCIoGWGlMrlx8z5hI5xpbxizYomDO0c67RLNl6EB4=; b=gGr6IFHtsgNwCk0vgQOKdDrR34
 3hndbo8sP11kf/zaCMRPj+mxKmMmFm0o9CUUe0Vf6q4YTxSNbhJZCHu5lBV9GxQKIY66QC4mLnwqM
 cAFDu/M/1nth/V4LdZsjOZIjWo6jUpsV3bb5hfw4nMjIKv/VaeVQDOZUfjPUW4mqo4UU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yfyCIoGWGlMrlx8z5hI5xpbxizYomDO0c67RLNl6EB4=; b=HINIGcMn0NjQa1iG6r4lRcMrSX
 xiiUYqrtZc2hwZuX7Ae2jf1F/mU1Z1nm1tUjauvxhXSF51In/52XBGuKXknt/rEIYEJXMC1S4gZWY
 WCuIaGg1SJkYMMWI8FDAguu9UFFQjjttFedI3mdPvIsNbeU9tIqXvS7CsImLVWPPPG+Q=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1msrKH-0001Lu-4L
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 02 Dec 2021 19:01:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1439BB82454
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  2 Dec 2021 19:00:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF0AAC00446;
 Thu,  2 Dec 2021 19:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638471648;
 bh=uFwJzTD6B0n40MqyShmUzKM0VAHNm6R1wMiDLKIANZk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lXvVCg6aviSxbCByQiYa5/vBfMZrIAmU88pUAqgemQ/8p1+eJOIIeQ8Jcs+q7AHDA
 rDKYV2PXg4mo2BpzLLVpFZBUjz1sHemOaTdEzip2Vu0cP5JA04Av8D52J0zRIH+nVJ
 b4u2e0ZaGS6aYX7W6QDR/cAs9x5L3tYmfdMrl7j0XUBmwHN82NiTpwJztZTnjZ6QbB
 yHpk5WFJma4DWQkTSJCHXU4tqTsLukwQeijuFLpXne3fkLJMQTvel2GcMe/r150pQE
 wGlbZNU0d+GqgN6xjdyGlQahfKD7wzukRHcD2r4EjIn1eDg1Na+jeesV1gi+XavYkr
 JWSxmvSHFn+Kg==
Date: Thu, 2 Dec 2021 11:00:47 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <YakX38onzsW5Ef8B@google.com>
References: <20211116214510.2934905-1-jaegeuk@kernel.org>
 <20211116214510.2934905-5-jaegeuk@kernel.org>
 <b36e2d44-4834-3931-6a32-4fa52d1d7785@kernel.org>
 <YahIf3UlhuxJT1O4@sol.localdomain>
 <1ba0f002-42c7-b085-0c54-6071664ba79b@kernel.org>
 <YakPrVPz5+qQm3kQ@sol.localdomain> <YakXMV0UvBV7TVwe@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YakXMV0UvBV7TVwe@google.com>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/02, Jaegeuk Kim wrote: > On 12/02, Eric Biggers wrote:
 > > On Thu, Dec 02, 2021 at 10:04:11PM +0800, Chao Yu wrote: > > > On 2021/12/2
 12:15, Eric Biggers wrote: > > > > On Thu, Dec 02, 2021 at [...] 
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
X-Headers-End: 1msrKH-0001Lu-4L
Subject: Re: [f2fs-dev] [PATCH 5/6] f2fs: implement iomap operations
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

On 12/02, Jaegeuk Kim wrote:
> On 12/02, Eric Biggers wrote:
> > On Thu, Dec 02, 2021 at 10:04:11PM +0800, Chao Yu wrote:
> > > On 2021/12/2 12:15, Eric Biggers wrote:
> > > > On Thu, Dec 02, 2021 at 11:10:41AM +0800, Chao Yu wrote:
> > > > > Why not relocating this check before f2fs_map_blocks()?
> > > 
> > > Wait, it supports DIO in multi-device image after commit 	71f2c8206202
> > > ("f2fs: multidevice: support direct IO"), how about
> > > checking with f2fs_allow_multi_device_dio()?
> > > 
> > > Thanks,
> > > 
> > 
> > Okay, that was not the case when I sent this patch originally.  We'll need to
> > update this to support multiple devices.
> 
> Chao/Eric, does this make sense?
> 
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -4070,11 +4070,10 @@ static int f2fs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
>                 }
>                 if (WARN_ON_ONCE(!__is_valid_data_blkaddr(map.m_pblk)))
>                         return -EINVAL;
> -               iomap->addr = blks_to_bytes(inode, map.m_pblk);
> 
> -               if (WARN_ON_ONCE(f2fs_is_multi_device(F2FS_I_SB(inode))))
> -                       return -EINVAL;
> -               iomap->bdev = inode->i_sb->s_bdev;
> +               iomap->bdev = map->m_multidev_dio ? map.m_bdev :

correction:			map.m_multidev_dio

> +                                               inode->i_sb->s_bdev;
> +               iomap->addr = blks_to_bytes(inode, map.m_pblk);
>         } else {
>                 iomap->length = blks_to_bytes(inode, next_pgofs) -
>                                 iomap->offset;
> 
> > 
> > - Eric
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
