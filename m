Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DB36F8B6050
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Apr 2024 19:42:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s1V17-0006DQ-PZ;
	Mon, 29 Apr 2024 17:42:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1s1V16-0006DG-H2
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Apr 2024 17:42:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=h/Y42jh5LPtII17/c/+XlyPq8CoeyYRBRQ4ZWFpNvvk=; b=EvQ8xtvmnERxIr2AbjC2gtczFK
 RzXU7abcXn7q3vr7q99u3h8UPyj4UtSLDktiVcow5PesjDjwnMiuVY6i3P4EJm42N8+5soC2hVSBd
 ziVBfOtVvgmQifPVw2Xv2zsZScFUivl4CyBaP+qko4ZZuJ3EgBX3QdVRSe3+9UHvO90k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=h/Y42jh5LPtII17/c/+XlyPq8CoeyYRBRQ4ZWFpNvvk=; b=AG4i0IFYBM8MDpvtIcmirtPe93
 Ql5CTivDxoagUHwnYOiMu8RgmCk1sxQJJ+30wu9TlyDvswkHcFzV2KDmvx+EI2QdnBrccRDZUL37B
 AYPsPhhZoaPTenTIzg0kb2rFDZ7WjAV82QqvWjZegLeJ+iXUnutDA/tinFsGzR08OBr4=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1s1V15-0004zO-8A for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Apr 2024 17:42:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id BA408CE0B4F;
 Mon, 29 Apr 2024 17:42:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A87AC113CD;
 Mon, 29 Apr 2024 17:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714412522;
 bh=yakMz0hoQgUZe2Te30CXUQdBv3i+eTPVugrRBpkhO2s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hStxyTpTfnLBwdqXiQlRLFW8Gl4zI5C6dALu44IQL4xttAJBcsC0KeMCg64+Z5sE+
 tuI3LnRRLRjzcKrrpkoZLah4tCBrUMBIAHmHc1qsw4hTQiY6eKfZQLzf5eJmX/kEIR
 lJOXCx1PWz2LAqI/xLrs6NkArYbrGPygrxThyBEpZkEZZ/JlKLjily3ZqfT0Q3IGqj
 aMMxG9u6JcNWQE9372Cc2ZFWqrmHRX288M4QrkKLQjCbqT7r4HXIwEHnoF5nMDweGW
 yWa1hm85jn1rsQAnbXD1QsKVtkz7TnxkHTiy6FPIqs0FPijcGLJ/BzUvg9HKqQwDrX
 de+oih0b1BRRw==
Date: Mon, 29 Apr 2024 17:42:01 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Wu Bo <bo.wu@vivo.com>
Message-ID: <Zi_b6alGIb2wAkb5@google.com>
References: <20240426104156.321701-1-bo.wu@vivo.com>
 <Zi_a0wEZpCNW8jHL@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Zi_a0wEZpCNW8jHL@google.com>
X-Spam-Score: -1.2 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 04/29, Jaegeuk Kim wrote: > On 04/26, Wu Bo wrote: > >
 As for zoned-UFS, f2fs section size is forced to zone size. And zone > > size
 may not aligned to pow2. > > > > Fixes: 859fca6b706e ("f2fs: swa [...] 
 Content analysis details:   (-1.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -1.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1s1V15-0004zO-8A
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix block migration when section is
 not aligned to pow2
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
Cc: Wu Bo <wubo.oduw@gmail.com>, linux-kernel@vger.kernel.org,
 Liao Yuanhong <liaoyuanhong@vivo.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 04/29, Jaegeuk Kim wrote:
> On 04/26, Wu Bo wrote:
> > As for zoned-UFS, f2fs section size is forced to zone size. And zone
> > size may not aligned to pow2.
> > 
> > Fixes: 859fca6b706e ("f2fs: swap: support migrating swapfile in aligned write mode")
> > Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
> > Signed-off-by: Wu Bo <bo.wu@vivo.com>
> > ---
> >  fs/f2fs/data.c | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> > 
> > diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> > index d9494b5fc7c1..7ff5ad3fd5dc 100644
> > --- a/fs/f2fs/data.c
> > +++ b/fs/f2fs/data.c
> > @@ -3904,7 +3904,6 @@ static int check_swap_activate(struct swap_info_struct *sis,
> >  	int nr_extents = 0;
> >  	unsigned long nr_pblocks;
> >  	unsigned int blks_per_sec = BLKS_PER_SEC(sbi);
> > -	unsigned int sec_blks_mask = BLKS_PER_SEC(sbi) - 1;
> >  	unsigned int not_aligned = 0;
> >  	int ret = 0;
> >  
> > @@ -3942,8 +3941,8 @@ static int check_swap_activate(struct swap_info_struct *sis,
> >  		pblock = map.m_pblk;
> >  		nr_pblocks = map.m_len;
> >  
> > -		if ((pblock - SM_I(sbi)->main_blkaddr) & sec_blks_mask ||
> > -				nr_pblocks & sec_blks_mask ||
> > +		if ((pblock - SM_I(sbi)->main_blkaddr) % blks_per_sec ||
> > +				nr_pblocks % blks_per_sec ||
> 
> Modified a bit to address udiv issue like below. Let's see.

Ok, I took v2 instead of this.

> 
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -3923,8 +3923,8 @@ static int check_swap_activate(struct swap_info_struct *sis,
>         sector_t highest_pblock = 0;
>         int nr_extents = 0;
>         unsigned long nr_pblocks;
> +       u32 align;
>         unsigned int blks_per_sec = BLKS_PER_SEC(sbi);
> -       unsigned int sec_blks_mask = BLKS_PER_SEC(sbi) - 1;
>         unsigned int not_aligned = 0;
>         int ret = 0;
> 
> @@ -3961,10 +3961,10 @@ static int check_swap_activate(struct swap_info_struct *sis,
> 
>                 pblock = map.m_pblk;
>                 nr_pblocks = map.m_len;
> +               div_u64_rem(nr_pblocks, blks_per_sec, &align);
> 
> -               if ((pblock - SM_I(sbi)->main_blkaddr) & sec_blks_mask ||
> -                               nr_pblocks & sec_blks_mask ||
> -                               !f2fs_valid_pinned_area(sbi, pblock)) {
> +               if ((pblock - SM_I(sbi)->main_blkaddr) % blks_per_sec ||
> +                               align || !f2fs_valid_pinned_area(sbi, pblock)) {
>                         bool last_extent = false;
> 
>                         not_aligned++;
> 
> >  				!f2fs_valid_pinned_area(sbi, pblock)) {
> >  			bool last_extent = false;
> >  
> > -- 
> > 2.25.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
