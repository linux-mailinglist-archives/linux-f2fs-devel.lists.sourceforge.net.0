Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8372D1C730C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  6 May 2020 16:41:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jWLEH-00023Z-3Q; Wed, 06 May 2020 14:40:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jWLEF-00023D-Q0
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 06 May 2020 14:40:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Jz5d4sy19eeUKnWJuN1OpT8jLV2waeEmCRqvNciiefU=; b=jTPnb95hnMi8g2nKq3AL1KgZO0
 MvMllSvTeYeMLXpvKHP4YWu12joRcD9l+gyiOjmFOFgK7UOhHbGQ2kw0JvEPhLnGc4tNIE+LXgEio
 EnHxKlACqHkjM2Og416EQVSyb/wNmnNIPCxspmCmFhyH3uF00ykCul4JzD4TzN9HwlDU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Jz5d4sy19eeUKnWJuN1OpT8jLV2waeEmCRqvNciiefU=; b=d5zM8XBzSpFMyyBFReY1caP3Pz
 53EFO+Euv/BTg2tBD5Dv84GoxHZbCX6phUijuqJDt6M8NFsC9Ts0WxpF96WVnM29byn4K+rXYuwh4
 S0ZpUuRgkL9Bk2VorNhzfSc6EDkr444qljldr670JL40xvVwGOX10DqVLaCUD9+8FzkY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jWLEC-00GIDN-Cv
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 06 May 2020 14:40:55 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ADF8420836;
 Wed,  6 May 2020 14:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588776046;
 bh=9U62jgahJdR8GAtK62CMoQe0Ovl5NACA8i7JfHZthGE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vHW2zqs1qHsKqGoUSp+2/Z6QdYcq8WpW5a/UGmwIMIw/4g3TWXm1lwnRfgb6oUaMP
 8oVnEXD0Fz77VY0W6Tr/m17aZlkLP7gpPYT3uiDzQmFGAyNPEIfgHGW2r50M4raxxR
 m6SEJy8ppvu98jLun+V97ey8G9P+PZ4l1AV8FRwA=
Date: Wed, 6 May 2020 07:40:46 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200506144046.GB107238@google.com>
References: <20200502002920.76569-1-jaegeuk@kernel.org>
 <20200502002920.76569-3-jaegeuk@kernel.org>
 <38429e30-cd8c-6169-2d4f-90e56a9d202f@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <38429e30-cd8c-6169-2d4f-90e56a9d202f@huawei.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1jWLEC-00GIDN-Cv
Subject: Re: [f2fs-dev] [PATCH 3/3] f2fs_io: show more flags
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

On 05/06, Chao Yu wrote:
> On 2020/5/2 8:29, Jaegeuk Kim wrote:
> > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > ---
> >  tools/f2fs_io/f2fs_io.c | 28 ++++++++++++++++++++++++++++
> >  tools/f2fs_io/f2fs_io.h | 12 ++++++++++++
> >  2 files changed, 40 insertions(+)
> > 
> > diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
> > index 9be99f0..d1889ff 100644
> > --- a/tools/f2fs_io/f2fs_io.c
> > +++ b/tools/f2fs_io/f2fs_io.c
> > @@ -186,6 +186,10 @@ static void do_set_verity(int argc, char **argv, const struct cmd_desc *cmd)
> >  "f2fs_io getflags [file]\n\n"					\
> >  "get a flag given the file\n"					\
> >  "flag can show \n"						\
> > +"  encryption\n"						\
> > +"  nocow(pinned)\n"						\
> > +"  inline_data\n"						\
> > +"  verity\n"							\
> >  "  casefold\n"							\
> >  "  compression\n"						\
> >  "  nocompression\n"
> > @@ -222,6 +226,30 @@ static void do_getflags(int argc, char **argv, const struct cmd_desc *cmd)
> >  		printf("nocompression");
> >  		exist = 1;
> >  	}
> > +	if (flag & FS_ENCRYPT_FL) {
> > +		if (exist)
> > +			printf(",");
> > +		printf("encrypt");
> > +		exist = 1;
> > +	}
> > +	if (flag & FS_VERITY_FL) {
> > +		if (exist)
> > +			printf(",");
> > +		printf("verity");
> > +		exist = 1;
> > +	}
> > +	if (flag & FS_INLINE_DATA_FL) {
> > +		if (exist)
> > +			printf(",");
> > +		printf("inline_data");
> > +		exist = 1;
> > +	}
> > +	if (flag & FS_NOCOW_FL) {
> > +		if (exist)
> > +			printf(",");
> > +		printf("nocow(pinned)");
> > +		exist = 1;
> > +	}
> >  	if (!exist)
> >  		printf("none");
> >  	printf("\n");
> > diff --git a/tools/f2fs_io/f2fs_io.h b/tools/f2fs_io/f2fs_io.h
> > index c6ea7ff..2c828bc 100644
> > --- a/tools/f2fs_io/f2fs_io.h
> > +++ b/tools/f2fs_io/f2fs_io.h
> > @@ -110,6 +110,18 @@ typedef u32	__be32;
> >  #define F2FS_IOC_FSGETXATTR		FS_IOC_FSGETXATTR
> >  #define F2FS_IOC_FSSETXATTR		FS_IOC_FSSETXATTR
> >  
> > +#ifndef FS_ENCRYPT_FL
> > +#define FS_ENCRYPT_FL			0x00000800 /* Encrypted file */
> > +#endif
> > +#ifndef FS_VERITY_FL
> > +#define FS_VERITY_FL			0x00100000 /* Verity protected inode */
> > +#endif
> > +#ifndef FS_INLINE_DATA_FL
> > +#define FS_INLINE_DATA_FL		0x10000000 /* Reserved for ext4 */
> 
> /* Inline data regular/symlink */

Done.

> 
> > +#endif
> > +#ifndef FS_NOCOW_FL
> > +#define FS_NOCOW_FL			0x00800000 /* Do not cow file */
> > +#endif
> >  #ifndef FS_NOCOMP_FL
> >  #define FS_NOCOMP_FL			0x00000400 /* Don't compress */
> >  #endif
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
