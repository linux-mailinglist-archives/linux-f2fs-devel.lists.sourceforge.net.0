Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BD2694EBE
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Feb 2023 19:04:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pRdBc-0007d5-5W;
	Mon, 13 Feb 2023 18:04:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1pRdBa-0007cy-Kf
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Feb 2023 18:04:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TR+ZxE36P95Yfkr1b9gPEdccwFwujLrd73riunmoQOI=; b=d/S7A0R4VTluThGjezPU6cP5O0
 LqUgZN3SERVF5pdE1ILQbVEgJRjiO2ePkFIcutLco11cdO0OCntdzgClXMjgP3nfrQsd3lEMMc8b5
 GTd/7NjS06e75MIPI+zo4fR8nouZBe+CWMhRF3Y/Hh6tytcXDCqJlV5PHHNS3dWjMGLI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TR+ZxE36P95Yfkr1b9gPEdccwFwujLrd73riunmoQOI=; b=edM+ql5z+6/4bSDi9EJIcMP3w8
 v7CGsroZAsBbrlUr2OmDEZXUgTbGP0tH7V3OU25S79ghGRm04EsJeSM17kkXH0m1eu/CxPjjaKOTM
 use1dtHtpKZWeUB+3P/BvLFsRDMrkXXpDQqZ/PQ4hSlAvyDCYYj9bSViZF7J3NGs+pMo=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pRdBY-0002Hx-D6 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Feb 2023 18:04:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C35E86121F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 13 Feb 2023 18:04:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23A6AC433D2;
 Mon, 13 Feb 2023 18:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676311451;
 bh=jl2zLZQEi/b6cx6PVSR62juBYlUQyWBIxbakuTBb/NQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sQpVcF/sakhc7iNXkRTjQ74bDVe5+X8CDeR+H0yGM242a0uC95ZbeGCFos5agmstE
 QxR92oW/tKc+shHT1OpfLR73g0iaFHkdq0gHaVLdqgG6DCxVZofHwSpF/9F3dmORBo
 vKo1z6rMXGQn5EMfDhPYSYfvwfGa/j04Wi/V43an8708Tyu1HBEbawHUnyubE2hW4n
 iKT5XK5uId5ojAWB4sM0GQsesMq9d2X8P1ShDh4bJEsC/0O8LkvlzmwfaKE7IzdI26
 n0+dxmIHBfpQgGGwYg6WWDEOJ3Bn70DrZbvtmoa08YWp6RUE/mRyxbK5boHr76pcLK
 7EIcNu7tIDa3w==
Date: Mon, 13 Feb 2023 10:04:09 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <Y+p7mbH9toKZ07z8@google.com>
References: <20230208212502.339427-1-jaegeuk@kernel.org>
 <f35c29ae-6406-4170-dc09-24df7d7ac2a8@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f35c29ae-6406-4170-dc09-24df7d7ac2a8@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 02/13, Chao Yu wrote: > On 2023/2/9 5:25,
 Jaegeuk Kim wrote:
 > > We need to check the first disk only, and trim the other disks. > > I'm
 confused, why we don't need to trim first disk? dd9c372646ed ("mkfs.f2fs:
 check zeros in first 16MB for Android") - We actually don't need to issue
 trim on entire disk by checking first blocks having zeros. 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pRdBY-0002Hx-D6
Subject: Re: [f2fs-dev] [PATCH] mkfs.f2fs: trim all the devices except the
 first one
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

On 02/13, Chao Yu wrote:
> On 2023/2/9 5:25, Jaegeuk Kim wrote:
> > We need to check the first disk only, and trim the other disks.
> 
> I'm confused, why we don't need to trim first disk?

dd9c372646ed ("mkfs.f2fs: check zeros in first 16MB for Android")
 - We actually don't need to issue trim on entire disk by checking first
    blocks having zeros.

This is what Android checks when to decide format as we expect the first disk
was supposed to have a written superblock. That's not for secondary disk and
so on.

> 
> Thanks,
> 
> > 
> > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > ---
> >   mkfs/f2fs_format_utils.c | 4 ++++
> >   1 file changed, 4 insertions(+)
> > 
> > diff --git a/mkfs/f2fs_format_utils.c b/mkfs/f2fs_format_utils.c
> > index 597c2b3a7b1c..448fbaa8866e 100644
> > --- a/mkfs/f2fs_format_utils.c
> > +++ b/mkfs/f2fs_format_utils.c
> > @@ -129,6 +129,10 @@ static bool is_wiped_device(int i)
> >   	int nblocks = 4096;	/* 16MB size */
> >   	int j;
> > +	/* let's trim the other devices except the first device */
> > +	if (i > 0)
> > +		return false;
> > +
> >   	buf = malloc(F2FS_BLKSIZE);
> >   	if (buf == NULL) {
> >   		MSG(1, "\tError: Malloc Failed for buf!!!\n");


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
