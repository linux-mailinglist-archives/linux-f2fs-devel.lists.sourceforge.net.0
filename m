Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D56FC72C994
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Jun 2023 17:16:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q8jHR-0005ZJ-MC;
	Mon, 12 Jun 2023 15:16:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1q8jHO-0005Yv-HE
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jun 2023 15:16:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Z5Pf4ziPz9KMxmLWccglXWUagFaqxPegJ6hUllTiHfA=; b=KZvieQVRQBWLV90IS0rbPRjbKb
 obKiCcMjWEsD2yqFM/Jae5Xpyah5COVJp3JGEl6oO4KAU55xdl9X4IQ6fShgZniiQTXpdYZVcCN+F
 qy3mr4tZjfoFfhoPjezXLxlfSPRPHDxY2hBilSJgApTzsJDNKven7aG+dLtV3bI1+tyk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Z5Pf4ziPz9KMxmLWccglXWUagFaqxPegJ6hUllTiHfA=; b=WQztoSiOiGPMeu7RRSsiMZuPVZ
 XiVWmCwukb8INPmBZPHo2A0FemmNuh/eq/wHLrOOaQR1G9cN49BFFtzD6Y9jy+Rp/0CKniuh/lUQN
 KS6te0ixBCWweR50zO7PYnwqZAtTEpyjl82kOeeihTJmNxH6j1IcH5dIIYdCJXkIuO6M=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q8jHN-0005PX-RJ for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jun 2023 15:16:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6F29662AA4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 12 Jun 2023 15:16:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 221C2C433D2;
 Mon, 12 Jun 2023 15:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686582979;
 bh=VLmvo45nf29IuG+YTl9Gl3lt4c+ebnPo5uxerXRlXko=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Bshr1OfYltFslXZdEjlUSqICDgJI1LPrtzlg4RjMXgNVBy5t0laRk4j0e8oAp7SWD
 /HeQd41h84YtSmYI8DPAWppaKZGw3O260hkx9AVF5vbGcx9jHGi5WIVZjS4kiAr7cb
 dEFrkHfXIoEBFFqYQd8Um0IZo1s53eLemxXjm0E7aksMsYx3naW26tnV6pBv1El3DF
 CnkldVBK9IXX1NVRerTjTT7qn1NNgPNPda4nElyPi6n+plkt0YGa4kVa3mx3qOFXlP
 PJEG4XkwvK1pRaCwroaByVOH7AOxi5Eh6IfOBv+ZhhvhJutVevEyuP3i0PGNQjqe1r
 rXUA3GQ6JpTyg==
Date: Mon, 12 Jun 2023 08:16:17 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <ZIc2wa2ZRLQ/Q8LE@google.com>
References: <20230607162954.2651657-1-jaegeuk@kernel.org>
 <85ff67e0-c6c6-e693-bcba-6e36a3dd2ea4@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <85ff67e0-c6c6-e693-bcba-6e36a3dd2ea4@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 06/12, Chao Yu wrote: > On 2023/6/8 0:29,
 Jaegeuk Kim wrote:
 > > ZSTD does not support compress_level=0. > > IIUC, it looks the range
 is [0, ZSTD_MAX_CLEVEL], 0 equals to default > (ZSTD_CLEVEL_DEF [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q8jHN-0005PX-RJ
Subject: Re: [f2fs-dev] [PATCH] f2fs: set zstd default compression level to 3
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

On 06/12, Chao Yu wrote:
> On 2023/6/8 0:29, Jaegeuk Kim wrote:
> > ZSTD does not support compress_level=0.
> 
> IIUC, it looks the range is [0, ZSTD_MAX_CLEVEL], 0 equals to default
> (ZSTD_CLEVEL_DEFAULT).

Ok, that seems a quick workaround of zstd, since it'd be quite hard to know
level=0 will be interpreted to whatever default behind the scenes.

> 
> zstd_compress.c
> 
>     /* row */
>     if (compressionLevel == 0) row = ZSTD_CLEVEL_DEFAULT;   /* 0 == default */
>     else if (compressionLevel < 0) row = 0;   /* entry 0 is baseline for fast mode */
>     else if (compressionLevel > ZSTD_MAX_CLEVEL) row = ZSTD_MAX_CLEVEL;
>     else row = compressionLevel;
> 
> Thanks,
> 
> > 
> > The commit d7ffafc99c42 ("f2fs: add sanity compress level check for compressed file")
> > revealed the issue.
> > 
> > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > ---
> >   fs/f2fs/super.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> > index 8fd23caa1ed9..1fb8d4f27a40 100644
> > --- a/fs/f2fs/super.c
> > +++ b/fs/f2fs/super.c
> > @@ -627,7 +627,7 @@ static int f2fs_set_zstd_level(struct f2fs_sb_info *sbi, const char *str)
> >   	int len = 4;
> >   	if (strlen(str) == len) {
> > -		F2FS_OPTION(sbi).compress_level = 0;
> > +		F2FS_OPTION(sbi).compress_level = 3;
> >   		return 0;
> >   	}


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
