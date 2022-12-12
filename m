Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 745EA64AAB7
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Dec 2022 23:59:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p4rlZ-0005fq-Aj;
	Mon, 12 Dec 2022 22:59:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1p4rlX-0005fk-PU
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Dec 2022 22:59:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LZkynOPEtsPGpEBy4SAU4oTAyq+TNMWFvqQLQ1WJ3zs=; b=magBjhXr4uCFkhl2JNtIOPubql
 BKSur00N2fV0WVB0K2FPDtnw+LGAaSejF4mQwmJybJcrV5FgIfx58Q4MIv1XPUsOmjHmu4/20PyBD
 UV3+yubJbMKqjYgdJVdK5zN5oIexifvkayN4U8+fDR8nMzPI5wKqZn3XBXZh7V5X5NWA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LZkynOPEtsPGpEBy4SAU4oTAyq+TNMWFvqQLQ1WJ3zs=; b=LZg3s1dSg09MlDDsyJQBvkrJ5e
 26AWVzt8b1JOuoUH4Wo/KGV7MG4+CZUSP2dbedLCI5yMTbmBPpVFL+OwTEU8ImlqM4+hQm2mDbICQ
 G6lP8RI2h3/cdVONw42yT1Io1jVmwpnFGXWDeYHQ9SVykftRL+RuF9TMHA2/envXMBec=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p4rlW-00F9g1-Vx for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Dec 2022 22:59:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B5A6EB80E86;
 Mon, 12 Dec 2022 22:59:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62116C433D2;
 Mon, 12 Dec 2022 22:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670885951;
 bh=J8NGtFkQLRX6/TbtLwsBA7Kjq8Yuonc02Ue0Zj4NUwQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VpkuGvomgZG5gzrK6Jnyc/CpL8p+DoFA7fTxHjM3uZ3UB/oyVZcgAil3S+mYfVUXo
 33aPAHt5PyeSZccz6RG47o39CQUt2xNB81st9jHCcArrQUDxF96OQBb5RTfyjtwRu9
 75SdWuB5xwha4xQBlYAR1UXX6Z0nYbnM6sCOWB59MR9GfebBrSdM+MFAYp/mHTbPWN
 MnIp5LAI3ZYz4XXOHDI6y3YN8afh4SFgy35ezIVJOhoMC8/dY+pfg4qgTx5f/RIIRM
 s35vDQPuFFiHzsGEOgMywvN+9VYOjG63FMwLlGwbRf47jXrUSTXGUSsUn+7pEn9Sd/
 3kP3T0G3qD+XQ==
Date: Mon, 12 Dec 2022 14:59:09 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <Y5eyPe7Yqz2xpluU@google.com>
References: <20221205145603.70779-1-frank.li@vivo.com>
 <38ab73c5-4865-188f-9554-6bcaec7cc78b@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <38ab73c5-4865-188f-9554-6bcaec7cc78b@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/11, Chao Yu wrote: > On 2022/12/5 22:56, Yangtao Li
 wrote: > > Just like other data we count uses the number of bytes as the basic
 unit, > > but discard uses the number of cmds as the statistica [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p4rlW-00F9g1-Vx
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix iostat parameter for discard
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
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Yangtao Li <frank.li@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 12/11, Chao Yu wrote:
> On 2022/12/5 22:56, Yangtao Li wrote:
> > Just like other data we count uses the number of bytes as the basic unit,
> > but discard uses the number of cmds as the statistical unit. In fact the
> > discard command contains the number of blocks, so let's change to the
> > number of bytes as the base unit.
> > 
> > Fixes: b0af6d491a6b ("f2fs: add app/fs io stat")
> > 
> > Signed-off-by: Yangtao Li <frank.li@vivo.com>
> > ---
> >   fs/f2fs/segment.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> > index 9486ca49ecb1..bc262e17b279 100644
> > --- a/fs/f2fs/segment.c
> > +++ b/fs/f2fs/segment.c
> > @@ -1181,7 +1181,7 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
> >   		atomic_inc(&dcc->issued_discard);
> > -		f2fs_update_iostat(sbi, NULL, FS_DISCARD, 1);
> > +		f2fs_update_iostat(sbi, NULL, FS_DISCARD, len * F2FS_BLKSIZE);
> 
> In order to avoid breaking its usage of application, how about keeping
> FS_DISCARD as it is, and add FS_DISCARD_IO to account discard bytes?

I picked this to match the f2fs_update_iostat() definition. Do we know
how many applications will be affected? I don't have any at a glance in
Android tho.

void f2fs_update_iostat(struct f2fs_sb_info *sbi, struct inode *inode,
                        enum iostat_type type, unsigned long long io_bytes)


> 
> Thanks,
> 
> >   		lstart += len;
> >   		start += len;


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
