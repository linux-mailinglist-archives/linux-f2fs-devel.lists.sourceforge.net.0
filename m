Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D252567C29
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  6 Jul 2022 04:58:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o8vEr-0008Cq-MW; Wed, 06 Jul 2022 02:58:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chaoliu719@gmail.com>) id 1o8vEq-0008Cj-BA
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 06 Jul 2022 02:58:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CZr3dzSRDubMHiSbyMahDvMPsy6//7ZQ0uObt7KDHek=; b=ObkmjbQdyiCpRXqL78+V1nY0Np
 vu4yysfFCG5LWJF2gMBRFTmNJCRV3BNOrNhTquP/4CSSl8KqTe4URXarmYYgrAjuovkmqzL9xlBBx
 wAGv8icXm6d9J9BCv00Es4t0s6O6TzSuwCrLCImOC2f18L8rNKaLZco3VhgT+3j8N+mo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CZr3dzSRDubMHiSbyMahDvMPsy6//7ZQ0uObt7KDHek=; b=k9D5RWGp+tABFU0TXO9ExpvFDd
 zv+34czsS/+9YJhUoFhgjnsQQC3QrU7x2+cdkgdcaxEN/yRMKiMDvMio86xkEqDhRZp0vv0ktdN6F
 uGA66rND5XhJDes+bwVllbEEUQWfsK3ofFf5aBaZg2D/84QibBETSvTAeMA7d7Q5I4dY=;
Received: from mail-pf1-f174.google.com ([209.85.210.174])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1o8vEm-008OcE-Ca
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 06 Jul 2022 02:58:02 +0000
Received: by mail-pf1-f174.google.com with SMTP id t3so21772pfq.10
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 05 Jul 2022 19:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=CZr3dzSRDubMHiSbyMahDvMPsy6//7ZQ0uObt7KDHek=;
 b=HxQ5XpqCJR7bQ291/zFfr1/slk1+Ny8UQXCsnMvii/LnCXYabecAxcp7bZhDHLowsQ
 cgHOVNasCUngfgNFfrPBE8dOJs3lE11j0mLHHKMpI5Vmoa1DyvLziRvf+YgAW9SxxSt3
 mYWPDaPoFK3Q0Ht5mvWP7vpiruVFSmXeM9VnK9EuKNRTiqjlvIWYO+sDaiRzcZsckYgy
 RPL9GtLLo3pLQkZqocQtUZFodQOeoqVHFXtJ33C8Zv9D+Bs2DXs6ANQyES+I74DyXl1u
 R2Tv+rQs+CypcxrA0F8mQ9ADohWg9LeWbi+XEP7XWT8/UOzYFm7PLWr3EHbVu2mm4hB4
 7M2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CZr3dzSRDubMHiSbyMahDvMPsy6//7ZQ0uObt7KDHek=;
 b=goP53ARN2x6GWK9tG9MtKgltSvdXpE//iqMYgsiVQPsszcUgXEgahE5YOQDP3oGnLO
 eSiA8a/Gnpa0DT+O9Zmcqzne8Aw8Hkj6+PMoaUiyFnG4uRAPvTtiMKWL1BakxtWbSxSl
 RlNzDC4QIIEzjkOZZbSbHvBg7n7CPTIj4iRGpz+2pEf/lgPfEJ3bzF072kPDiXvBD9RD
 1nWSNuJYMGf2c/0NPzbS/oAK+GLGkLDrbPYZYQLUxMS1ZZnWvwj94X6VZkZ1yxK3dkOH
 dwM6UF7UdLhXbhnFHwKIM/3MYzDIlb66NJDy4+Z1qyc5AEuEhwYWEh0GXuKc39AfVkPK
 Yf+A==
X-Gm-Message-State: AJIora/39bcCHSjqLDghvmZq2p/xprHtDb/V1MR66uvPAlIdReMhz3uZ
 aaJSi1bmaZfpUgoPf5RHGpM=
X-Google-Smtp-Source: AGRyM1sKLQ3d+GoXwwsvfwzbA/mZ6j9YV/pFxUw3me7+TWs0RGTz/ZvRqysF8WGZPZ6Gj9q2P4cFpQ==
X-Received: by 2002:aa7:94ad:0:b0:525:265b:991f with SMTP id
 a13-20020aa794ad000000b00525265b991fmr45295137pfl.30.1657076273975; 
 Tue, 05 Jul 2022 19:57:53 -0700 (PDT)
Received: from liuchao-VM ([156.236.96.165]) by smtp.gmail.com with ESMTPSA id
 p22-20020a1709027ed600b0016a0fe1a1fbsm24350981plb.220.2022.07.05.19.57.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 19:57:53 -0700 (PDT)
Date: Wed, 6 Jul 2022 10:57:48 +0800
From: Chao Liu <chaoliu719@gmail.com>
To: Chao Yu <chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <YsT6LKtTQCuOdPHt@liuchao-VM>
References: <20220621064833.1079383-1-chaoliu719@gmail.com>
 <0771b00b-e781-cd29-896a-4b6ebc948c2e@kernel.org>
 <YrPvuPLze3QoCkPJ@liuchao-VM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YrPvuPLze3QoCkPJ@liuchao-VM>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Ping. On Thu, Jun 23, 2022 at 12:44:40PM +0800,
 Chao Liu wrote:
 > On Wed, Jun 22, 2022 at 09:42:13PM +0800, Chao Yu wrote: > > On 2022/6/21
 14:48, Chao Liu wrote: > > > From: Chao Liu > > > > > > If the i [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [chaoliu719[at]gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [chaoliu719[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.174 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.174 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1o8vEm-008OcE-Ca
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to remove F2FS_COMPR_FL and tag
 F2FS_NOCOMP_FL at the same time
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
Cc: Chao Liu <liuchao@coolpad.com>, linux-kernel@vger.kernel.org,
 Wayne Zhang <zhangwen@coolpad.com>, Yue Hu <huyue2@coolpad.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Ping.

On Thu, Jun 23, 2022 at 12:44:40PM +0800, Chao Liu wrote:
> On Wed, Jun 22, 2022 at 09:42:13PM +0800, Chao Yu wrote:
> > On 2022/6/21 14:48, Chao Liu wrote:
> > > From: Chao Liu <liuchao@coolpad.com>
> > >
> > > If the inode has the compress flag, it will fail to use
> > > 'chattr -c +m' to remove its compress flag and tag no compress flag.
> > > However, the same command will be successful when executed again,
> > > as shown below:
> > >
> > >    $ touch foo.txt
> > >    $ chattr +c foo.txt
> > >    $ chattr -c +m foo.txt
> > >    chattr: Invalid argument while setting flags on foo.txt
> > >    $ chattr -c +m foo.txt
> > >    $ f2fs_io getflags foo.txt
> > >    get a flag on foo.txt ret=0, flags=nocompression,inline_data
> > >
> > > Fix this by removing some checks in f2fs_setflags_common()
> > > that do not affect the original logic. I go through all the
> > > possible scenarios, and the results are as follows. Bold is
> > > the only thing that has changed.
> > >
> > > +---------------+-----------+-----------+----------+
> > > |               |            file flags            |
> > > + command       +-----------+-----------+----------+
> > > |               | no flag   | compr     | nocompr  |
> > > +---------------+-----------+-----------+----------+
> > > | chattr +c     | compr     | compr     | -EINVAL  |
> > > | chattr -c     | no flag   | no flag   | nocompr  |
> > > | chattr +m     | nocompr   | -EINVAL   | nocompr  |
> > > | chattr -m     | no flag   | compr     | no flag  |
> > > | chattr +c +m  | -EINVAL   | -EINVAL   | -EINVAL  |
> > > | chattr +c -m  | compr     | compr     | compr    |
> > > | chattr -c +m  | nocompr   | *nocompr* | nocompr  |
> > > | chattr -c -m  | no flag   | no flag   | no flag  |
> > > +---------------+-----------+-----------+----------+
> > >
> > > Fixes: 4c8ff7095bef ("f2fs: support data compression")
> > > Signed-off-by: Chao Liu <liuchao@coolpad.com>
> > > ---
> > >
> > > This patch depends on the the patch
> > > "f2fs: allow compression of files without blocks" sent earlier this day.
> > >
> > >   fs/f2fs/file.c | 9 +--------
> > >   1 file changed, 1 insertion(+), 8 deletions(-)
> > >
> > > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > > index daaa0dfd2d2e..0c3ae5993b7a 100644
> > > --- a/fs/f2fs/file.c
> > > +++ b/fs/f2fs/file.c
> > > @@ -1873,10 +1873,7 @@ static int f2fs_setflags_common(struct inode *inode, u32 iflags, u32 mask)
> > >   		if (masked_flags & F2FS_COMPR_FL) {
> > >   			if (!f2fs_disable_compressed_file(inode))
> > >   				return -EINVAL;
> > > -		}
> > > -		if (iflags & F2FS_NOCOMP_FL)
> > > -			return -EINVAL;
> > > -		if (iflags & F2FS_COMPR_FL) {
> > > +		} else {
> > >   			if (!f2fs_may_compress(inode))
> > >   				return -EINVAL;
> > >   			if (S_ISREG(inode->i_mode) && F2FS_HAS_BLOCKS(inode))
> > > @@ -1885,10 +1882,6 @@ static int f2fs_setflags_common(struct inode *inode, u32 iflags, u32 mask)
> > >   			set_compress_context(inode);
> > >   		}
> > >   	}
> > > -	if ((iflags ^ masked_flags) & F2FS_NOCOMP_FL) {
> > > -		if (masked_flags & F2FS_COMPR_FL)
> > > -			return -EINVAL;
> > > -	}
> >
> > Without above check condition, can we return -EINVAL for the case:
> >
> > chattr +c on file w/ nocompr flag
> >
> > |               | no flag   | compr     | nocompr  |
> > +---------------+-----------+-----------+----------+
> > | chattr +c     | compr     | compr     | *-EINVAL*  |
>
> Yes, we can.
>
> chattr(1) grabs flags via GETFLAGS, modifies the result,
> and passes that to SETFLAGS. If we execute 'chattr +c'
> on the file with nocompr flag, the iflags will
> contain both compr and nocompr flags, then be refused by:
>
>     if ((iflags & F2FS_COMPR_FL) && (iflags & F2FS_NOCOMP_FL))
>         return -EINVAL;
>
> In addition, if iflags has only compr flag, while masked_flags
> has only nocompr flag for some reason
> (either because of concurrency of chattr(1) or by a user),
> I think we need remove nocompr flag and tag compr flag on the file,
> similar to the following.
>
> |               | no flag   | compr     | nocompr  |
> +---------------+-----------+-----------+----------+
> | chattr +c -m  | compr     | compr     | *compr*  |
>
> Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
