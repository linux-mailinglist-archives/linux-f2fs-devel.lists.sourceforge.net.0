Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE0D507CD0
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Apr 2022 00:48:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ngwdi-0003Tg-JQ; Tue, 19 Apr 2022 22:48:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1ngwdh-0003TZ-C5
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 19 Apr 2022 22:48:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eKZfq6pwYS4v8VgUCZFG3YbZOnU0PrZ4ldn03JSlIQg=; b=VB5Knw2BMfi7tCBFvg87katHln
 BqPXZjg2/7c/TLv4iqHiv1a9vaPlve8t37/hI1tesglU/ZnCbzEfaC1PvEQpA2DN1kNsVcMr+8po1
 /lIVTY7MN5mlgJc0YdMxK6MZ8TKkY1VVtqCF27tC+pOYwtwm3VroVYT3y+KF+7SsJku4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eKZfq6pwYS4v8VgUCZFG3YbZOnU0PrZ4ldn03JSlIQg=; b=EGoezymNrxZDGt6Hp3JR+7F5uq
 TttrZoZre/01gr+IPX4SvsgKZPO6NubdXDYGcw9ZqgD26ulJy5xzzCi7Gud2x1s3v+Hk+fCcSQgPd
 uYYLxOg9s8lgTOYSi+b/yy3Dlx3bAf2d53gj98q5pVfKf8LZn7gv7r2CtcjPjTsYm3kI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1ngwdf-0007MJ-4j
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 19 Apr 2022 22:48:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id ABB5061797
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 19 Apr 2022 22:47:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07842C385A7;
 Tue, 19 Apr 2022 22:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650408473;
 bh=dPPIfXbZmC5wjSWim42Hh9CV6QDmZuiHOOhATFqi7iE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qHu9LbfiE7riITqbGfeNYlSsHrfTenqTgAHnD3GDcRA+HNIswG89wNc2yNcW2Dazk
 P6sQ4sBTupkxO/Grto42/r5M2DL4CV8CIWthm1KD8gqHgqaT26Eb6R7ecjlGzARJVO
 9WAYKmU64t5CMIc1Yg+tN6FRDrTvM2Xe8srM4f5wliRq2Zbph+AwP/ij6rZyFCvj3M
 0m31D2I7bJOV+oFxA53LmiAWFJp/buyuRroJd2+XFhKw521dIF5UxQV2B9yZ0cp9Tv
 V/85kznCiJSaOvBgDuwgGhloYoknOOBPB0f2ems+gKUMeY03+aOtHcnumAgAA8J2UI
 o7TYi9Sm5Kg1Q==
Date: Tue, 19 Apr 2022 15:47:51 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <Yl88F3RVRMfwyB7+@google.com>
References: <20220413154920.2024872-1-jaegeuk@kernel.org>
 <20220413154920.2024872-2-jaegeuk@kernel.org>
 <d22c42f8-525a-a0a6-2fef-a43b2fc3a2c7@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d22c42f8-525a-a0a6-2fef-a43b2fc3a2c7@kernel.org>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 04/17, Chao Yu wrote: > On 2022/4/13 23:49, Jaegeuk Kim
 wrote: > > Let's attach io_flags to bio only, so that we can merge IOs given
 original > > io_flags only. > > > > Fixes: 64bf0eef0171 ("f2fs: [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ngwdf-0007MJ-4j
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: keep io_flags to avoid IO split
 due to different op_flags in two fio holders
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

On 04/17, Chao Yu wrote:
> On 2022/4/13 23:49, Jaegeuk Kim wrote:
> > Let's attach io_flags to bio only, so that we can merge IOs given original
> > io_flags only.
> > 
> > Fixes: 64bf0eef0171 ("f2fs: pass the bio operation to bio_alloc_bioset")
> 
> Nice catch.
> 
> Wasn't this bug introduced by:

I don't think so.

> 
> commit da9953b729c1 ("f2fs: introduce sysfs/data_io_flag to attach REQ_META/FUA")
> 
> static void __attach_data_io_flag(struct f2fs_io_info *fio)
> {
> ...
>        if ((1 << fio->temp) & meta_flag)
>                fio->op_flags |= REQ_META;
>        if ((1 << fio->temp) & fua_flag)
>                fio->op_flags |= REQ_FUA;
> ...
> 
> Thanks,
> 
> > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > ---
> >   fs/f2fs/data.c | 33 +++++++++++++++++++++------------
> >   1 file changed, 21 insertions(+), 12 deletions(-)
> > 
> > diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> > index acc523f893ba..fcf0daa386de 100644
> > --- a/fs/f2fs/data.c
> > +++ b/fs/f2fs/data.c
> > @@ -387,11 +387,23 @@ int f2fs_target_device_index(struct f2fs_sb_info *sbi, block_t blkaddr)
> >   	return 0;
> >   }
> > -static void __attach_io_flag(struct f2fs_io_info *fio, unsigned int io_flag)
> > +static unsigned int f2fs_io_flags(struct f2fs_io_info *fio)
> >   {
> >   	unsigned int temp_mask = (1 << NR_TEMP_TYPE) - 1;
> > -	unsigned int fua_flag = io_flag & temp_mask;
> > -	unsigned int meta_flag = (io_flag >> NR_TEMP_TYPE) & temp_mask;
> > +	unsigned int fua_flag, meta_flag, io_flag;
> > +	unsigned int op_flags = 0;
> > +
> > +	if (fio->op != REQ_OP_WRITE)
> > +		return 0;
> > +	if (fio->type == DATA)
> > +		io_flag = fio->sbi->data_io_flag;
> > +	else if (fio->type == NODE)
> > +		io_flag = fio->sbi->node_io_flag;
> > +	else
> > +		return 0;
> > +
> > +	fua_flag = io_flag & temp_mask;
> > +	meta_flag = (io_flag >> NR_TEMP_TYPE) & temp_mask;
> >   	/*
> >   	 * data/node io flag bits per temp:
> > @@ -400,9 +412,10 @@ static void __attach_io_flag(struct f2fs_io_info *fio, unsigned int io_flag)
> >   	 * Cold | Warm | Hot | Cold | Warm | Hot |
> >   	 */
> >   	if ((1 << fio->temp) & meta_flag)
> > -		fio->op_flags |= REQ_META;
> > +		op_flags |= REQ_META;
> >   	if ((1 << fio->temp) & fua_flag)
> > -		fio->op_flags |= REQ_FUA;
> > +		op_flags |= REQ_FUA;
> > +	return op_flags;
> >   }
> >   static struct bio *__bio_alloc(struct f2fs_io_info *fio, int npages)
> > @@ -412,14 +425,10 @@ static struct bio *__bio_alloc(struct f2fs_io_info *fio, int npages)
> >   	sector_t sector;
> >   	struct bio *bio;
> > -	if (fio->type == DATA)
> > -		__attach_io_flag(fio, sbi->data_io_flag);
> > -	else if (fio->type == NODE)
> > -		__attach_io_flag(fio, sbi->node_io_flag);
> > -
> >   	bdev = f2fs_target_device(sbi, fio->new_blkaddr, &sector);
> > -	bio = bio_alloc_bioset(bdev, npages, fio->op | fio->op_flags, GFP_NOIO,
> > -			       &f2fs_bioset);
> > +	bio = bio_alloc_bioset(bdev, npages,
> > +				fio->op | fio->op_flags | f2fs_io_flags(fio),
> > +				GFP_NOIO, &f2fs_bioset);
> >   	bio->bi_iter.bi_sector = sector;
> >   	if (is_read_io(fio->op)) {
> >   		bio->bi_end_io = f2fs_read_end_io;


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
