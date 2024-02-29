Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 547BC86D0AF
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 29 Feb 2024 18:31:51 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rfkG3-00070n-Gn;
	Thu, 29 Feb 2024 17:31:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1rfkG2-00070g-BB
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 29 Feb 2024 17:31:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cEBsRTjeYZL7lft2lbbGHaJbX/THXtZeXgDz2aLPhDE=; b=Vse7276K3IWX/3bBNt6vHEBFrA
 VPApnYbj44THVigy0qHEZiIJy/QxghXrkLZLILXGgbTMr4gVxSHlU2dXXS4qwxA3C84Q3Oz2HdjcA
 tZcRyAmjSRFT8XUPv0gdXUc5jtYC8Ma/U2RONmqGXFkmtk+ZV+nbAolKZtqGVVaBLpEk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cEBsRTjeYZL7lft2lbbGHaJbX/THXtZeXgDz2aLPhDE=; b=NFJNvclILJhvY6S5Y/aa5imOJn
 DSvdDInR8wKm5AEaUPK7I5Ziv5J0RMA5Gco7XhvRHHBKGUwz91bPDbfTjqxPN+9E7Gc5rhoObwRk0
 3KQJa5ImuK5mvzmBMQwNQkYXC+bMM9AwyGiJ8K+bZYfG79dylDka4CHDIyWKEB7GWk0U=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rfkFx-0001Pi-Mq for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 29 Feb 2024 17:31:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 07162CE1282;
 Thu, 29 Feb 2024 17:31:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D5D1C433F1;
 Thu, 29 Feb 2024 17:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709227889;
 bh=9DzNczRfLQHZQ7xM/5Rsf1G4ssLJqqDQeagj+2HQ7og=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=diJHgxM014XnHKWcaxVwTBkW3gX57RmZxYWS+sJS+A7HG35g3mzRWzGi6YrIHriPn
 QgUZzvQlv4DAI1wWyZ+KYWohVL6+qvRqKOBAKh1Eg5afeYkADvoypyDL7wSSngpC9e
 gptRCTe8jpqiSosxVs/SQ/fTdvQu0bKclizFrICODQB/No3OTJkAMW8KxPl8K2qofN
 m3Sr8deGN0pYmVf2ay7keF8TOqQmkl3/tOgN+rS6S939MLrazA2ETU7a+bTmTSuvaX
 4tS8lqpbf3gxEcBRMFT2oG9c0M0T0FcQqIE7YxH2I2hK2idblOSQSfCKdGnWtET+pJ
 QvuC8j/TNBaQg==
Date: Thu, 29 Feb 2024 09:31:27 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: "Colin King (gmail)" <colin.i.king@gmail.com>
Message-ID: <ZeC_b8JipJyjycW3@google.com>
References: <20240229091449.105032-1-colin.i.king@gmail.com>
 <ZeC64dDr-nBGlsli@google.com>
 <5e705d83-871e-4403-a77f-ec197eefb7c4@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5e705d83-871e-4403-a77f-ec197eefb7c4@gmail.com>
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 02/29, Colin King (gmail) wrote: > On 29/02/2024 17:12,
 Jaegeuk Kim wrote: > > Hi Colin, > > > > Thank you for the fix. If you don't
 mind, can I integrate this fix > > into the original patch? > > [...] 
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rfkFx-0001Pi-Mq
Subject: Re: [f2fs-dev] [PATCH][next] f2fs: Fix two spelling mistakes in
 f2fs_zone_status array
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 02/29, Colin King (gmail) wrote:
> On 29/02/2024 17:12, Jaegeuk Kim wrote:
> > Hi Colin,
> > 
> > Thank you for the fix. If you don't mind, can I integrate this fix
> > into the original patch?
> 
> Sure. No problem.

Thank you so much!

> 
> Colin
> > 
> > Thanks,
> > 
> > On 02/29, Colin Ian King wrote:
> > > The array f2fs_zone_status contains two spelling mistakes in
> > > literal strings. Fix them.
> > > 
> > > Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> > > ---
> > >   fs/f2fs/segment.c | 4 ++--
> > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> > > index bdb27e4a604b..072c4355d3d3 100644
> > > --- a/fs/f2fs/segment.c
> > > +++ b/fs/f2fs/segment.c
> > > @@ -4921,8 +4921,8 @@ static int sanity_check_curseg(struct f2fs_sb_info *sbi)
> > >   const char *f2fs_zone_status[BLK_ZONE_COND_OFFLINE + 1] = {
> > >   	[BLK_ZONE_COND_NOT_WP]		= "NOT_WP",
> > >   	[BLK_ZONE_COND_EMPTY]		= "EMPTY",
> > > -	[BLK_ZONE_COND_IMP_OPEN]	= "IMPLICITE_OPEN",
> > > -	[BLK_ZONE_COND_EXP_OPEN]	= "EXPLICITE_OPEN",
> > > +	[BLK_ZONE_COND_IMP_OPEN]	= "IMPLICIT_OPEN",
> > > +	[BLK_ZONE_COND_EXP_OPEN]	= "EXPLICIT_OPEN",
> > >   	[BLK_ZONE_COND_CLOSED]		= "CLOSED",
> > >   	[BLK_ZONE_COND_READONLY]	= "READONLY",
> > >   	[BLK_ZONE_COND_FULL]		= "FULL",
> > > -- 
> > > 2.39.2


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
