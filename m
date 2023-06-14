Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1467304A3
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Jun 2023 18:12:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q9T6v-00074e-92;
	Wed, 14 Jun 2023 16:12:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1q9T6u-00074Y-H6
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Jun 2023 16:12:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Lr1ZZTCf15AvYMxDnMMt5E+jpq5+LtMzXblEUiiPrdk=; b=aFajymUiQ/j4OrauuJkQTk08SS
 y1X5bKxvnkevq4/4Vab+lVRHZ/oTeaXN+65pfjbMg58GgdUMpEhMjnPr+5Q41a1PzoFyMr59t/69R
 RzlybzPsQG9QCxSHZnD6aJLKTJiSw1vQIVGubhV5pfEAC5Abr1YuuZrsOkjhrHDccVCY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Lr1ZZTCf15AvYMxDnMMt5E+jpq5+LtMzXblEUiiPrdk=; b=GFcYFO0fChvHEYc8TwMjPyel8T
 3YO7rR5hgTRpt1EpUJuQm0SRaVdp8xWtTtYaLeWk+Ot4hQvEeHhNnfstMqusQZzyb3+R8CDAP9hZ5
 VWib/mM+QnUumztK7v5i6v1c0syM2+LvyU97YbOEG0ihcDqLdYPtE7LowY0V+acyrRn8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q9T6u-0036EL-Ri for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Jun 2023 16:12:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 738D663E03;
 Wed, 14 Jun 2023 16:12:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B66E7C433C0;
 Wed, 14 Jun 2023 16:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686759154;
 bh=FEAvt09O6YlhBhsJVN7XSwEaTIxjO3rTJIGM+hEU564=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=I+bdARuVnMWdw4t+E5ZTma/ibxUmcJ7ShxJ9VNEwWMqpy/xF5Y6fRnDbxYZLInq3o
 Sz/2uxYawHv0/oz732UW121Q2zelg4oo+9zyScjRiBjosdyV8WL4U6F836U0ImOZH6
 5WnXuKNguk+my7Er9pftjkkNLZccC1VXtybFP2OwgqIXhAnlzGlyjKlCOIvtU9hZHm
 XcchYq7dPA9udSqGe27mHkmCUTz5FmCYwyviG8RnmVrbL+bqsHiWbV9JlNMQTYsm40
 xpVD1mC3yog/JPFHtKdShRyb5xj8LpnlEa2IWDpXWEovId8Q6jX7zIZOXVnjgYqdyX
 5V4rvSjySnTmg==
Date: Wed, 14 Jun 2023 09:12:33 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Daejun Park <daejun7.park@samsung.com>
Message-ID: <ZInm8cxDnqnD9QrU@google.com>
References: <20230613203947.2745943-1-jaegeuk@kernel.org>
 <CGME20230613204109epcas2p158ecc100d3fe2db1ab2b7ee8335d01e7@epcms2p4>
 <20230614060757epcms2p4e11a8f8bf2fa44eac99a5bb7f47f8dcd@epcms2p4>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230614060757epcms2p4e11a8f8bf2fa44eac99a5bb7f47f8dcd@epcms2p4>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Daejun, On 06/14, Daejun Park wrote: > Hi Jaegeuk, > >
 > If there're huge # of small discards, this will increase checkpoint latency
 > > insanely. Let's issue small discards only by trim. > > > > Signed-off-b
 [...] Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q9T6u-0036EL-Ri
Subject: Re: [f2fs-dev] [PATCH] f2fs: do not issue small discard commands
 during checkpoint
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Daejun,

On 06/14, Daejun Park wrote:
> Hi Jaegeuk,
> =

> > If there're huge # of small discards, this will increase checkpoint lat=
ency
> > insanely. Let's issue small discards only by trim.
> > =

> > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > ---
> >  fs/f2fs/segment.c | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> > =

> > diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> > index 0c0c033c4bdd..ef46bb085385 100644
> > --- a/fs/f2fs/segment.c
> > +++ b/fs/f2fs/segment.c
> > @@ -2178,7 +2178,7 @@ void f2fs_clear_prefree_segments(struct f2fs_sb_i=
nfo *sbi,
> > =A0 =A0 =A0 =A0 =A0}
> > =A0 =A0 =A0 =A0 =A0mutex_unlock(&dirty_i->seglist_lock);
> >  =

> > - =A0 =A0 =A0 =A0if (!f2fs_block_unit_discard(sbi))
> > + =A0 =A0 =A0 =A0if (!f2fs_block_unit_discard(sbi) || !force)
> =

> If we don't handle the discard entries here, dcc->entry_list will still h=
ave them,
> so stale discard entries may be handled by trim, causing incorrect discar=
ds to be issued.
> Therefore, I think this patch should also prevent the creation of discard=
 entries
> in add_discard_addrs(), unless it is a checkpoint caused by trim.
> This would further reduce the latency caused by the creation of a discard=
 entry.

I found this causes some objects were not reclaimed when removing the modul=
e.
Hence I'm testing v2.

> =

> Thanks,
> Daejun
> =



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
