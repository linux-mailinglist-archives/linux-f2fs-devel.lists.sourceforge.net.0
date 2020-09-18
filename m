Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E32FA26F218
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 18 Sep 2020 04:56:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kJ6Zp-0004ek-Ki; Fri, 18 Sep 2020 02:56:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kJ6Zn-0004ed-Tq
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 18 Sep 2020 02:56:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=THblYdrikFI8rlbL9zXxUZMslh9zpf4MvPznTtNsVGM=; b=igg6r2DZzEtWRh3VYKQi02Z+S8
 4Qjtx3zXlteQwDvv4k0ioTeEtwbyBO8HXnsVHoak0wELbcustIn7ws4eALjunI4NZyV87EcGjWO6C
 40GxZYBCLYuljt76+RbT7t9u+TjneEm3ZXv6fIvg9p8YTBoHyWO8lu1u20oHzUI9B9vI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=THblYdrikFI8rlbL9zXxUZMslh9zpf4MvPznTtNsVGM=; b=jrdY7AzWahvm1Y7Gsp4GPoivlP
 56qWE/4qUyJKZPaSPcWNK5YiBro+EllGp3cGLtPrjTs9+GxiCi9yTkduKGpk4VP6dUIt6Ue+P1CEh
 fPVsAJdBO+msqclr93zBZGFd/J69+IPsKhhEQAed9eWllVUGU15OE+Em7PXLiYLbe2wg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kJ6Ze-00F0Re-QY
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 18 Sep 2020 02:56:43 +0000
Received: from gmail.com (unknown [104.132.1.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1FB8E206B6;
 Fri, 18 Sep 2020 02:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600397789;
 bh=btqXYTF0PNPv/mb8paQ68oaE4+SHI3dRRxApfP+mkmw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HcFsvhzc6CeEQ2WObijhFV05KNALsNgNCaTmUQZomWYV8hLpjWsCgGVMHDragVd5F
 zhsUNf/clR7+8Drg1VGRAXaXEFpPCkw3Bi/BTmxg/IUtooLBLifg9tgtO6u00Jy/1n
 rD0qAz3zWclop2Fw4CQbTItr5M0orjqojFzNcmYE=
Date: Thu, 17 Sep 2020 19:56:27 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200918025627.GA3518637@gmail.com>
References: <20200916034307.2092020-1-nickrterrell@gmail.com>
 <20200916034307.2092020-9-nickrterrell@gmail.com>
 <28bf92f1-1246-a840-6195-0e230e517e6d@huawei.com>
 <C8517011-9B6F-499F-BEC6-25BF1F0794AC@fb.com>
 <f7b19bc6-e57f-b4d8-b1f7-89c428b79cdf@huawei.com>
 <C327820B-5BD8-4739-AE4E-04EF27BE8150@fb.com>
 <9589E483-A94B-4AF6-8C03-B0763715B40A@fb.com>
 <a8b6e21d-fb51-1a50-8f2a-045f3a496c12@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a8b6e21d-fb51-1a50-8f2a-045f3a496c12@huawei.com>
X-Spam-Score: -3.1 (---)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -3.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1kJ6Ze-00F0Re-QY
Subject: Re: [f2fs-dev] [PATCH 6/9] f2fs: zstd: Switch to the zstd-1.4.6 API
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
Cc: Johannes Weiner <jweiner@fb.com>, Nick Terrell <nickrterrell@gmail.com>,
 Yann Collet <cyan@fb.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, Petr Malat <oss@malat.biz>,
 Chris Mason <clm@fb.com>, Nick Terrell <terrelln@fb.com>,
 Kernel Team <Kernel-team@fb.com>, Niket Agarwal <niketa@fb.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Sep 18, 2020 at 09:47:32AM +0800, Chao Yu wrote:
> Ah, I got it.
> 
> Step of enabling compressed inode is not correct, we should touch an empty
> file, and then use 'chattr +c' on that file to enable compression, otherwise
> the race condition could be complicated to handle. So we need below diff to
> disallow setting compression flag on an non-empty file:
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 8a422400e824..b462db7898fd 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -1836,6 +1836,8 @@ static int f2fs_setflags_common(struct inode *inode, u32 iflags, u32 mask)
>  		if (iflags & F2FS_COMPR_FL) {
>  			if (!f2fs_may_compress(inode))
>  				return -EINVAL;
> +			if (get_dirty_pages(inode) || fi->i_compr_blocks)
> +				return  -EINVAL;
> 
>  			set_compress_context(inode);
>  		}

Why not:

	if (inode->i_size)
		return -EINVAL;


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
