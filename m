Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3017814C2
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 18 Aug 2023 23:29:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qX726-0005Vy-8a;
	Fri, 18 Aug 2023 21:29:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1qX724-0005Vr-UX
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 18 Aug 2023 21:29:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4aM34xvQlrfuNgvvNrW1wi9MoqAGmTN5pIAyMPsix40=; b=AcfzyfJ1V1eCqZVA+z6rjTEfNK
 Rv/Ans/qsSfAXty0O1y6xA9Xdtuz+92o+10n7uJSOrDtWXRdZTPDiUOhbGQ0pEuz3vPZEGD3hF/+9
 /WIMtgiM75RsK+5XxXOLR/wA1LY7t6owLQFqTKe1f6mVdaY4tj3mXJtR90YV91TlCofQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4aM34xvQlrfuNgvvNrW1wi9MoqAGmTN5pIAyMPsix40=; b=F4jy7afzbw+CRdWt6D0lbsIUoB
 BSzg1XQNzXTssbncb/Ym3mrfqHmATt0zXRpyiwRqHGcH9+S52lawSBw65HlE8cjLwGxC5hmmazm/V
 NSMujd44ZiuIwLZtDX7QkZKS5jHdCdeCH6FyliPDCmb+EYcAtQrMI194E9SFDC4H97WM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qX725-009268-9K for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 18 Aug 2023 21:29:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9D1AE60F7C
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 18 Aug 2023 21:29:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFCFEC433C7;
 Fri, 18 Aug 2023 21:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692394159;
 bh=Ld7OvNcBpdhDtYB6f5Vz2x6nCNmcy7lhHr3Kic6B/hI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CdAbnkEQIJAwW5HV+oFMSJO1NKurSvFQc7LHdf1Z/6mDnoRZIVDanq6kS+jJsqRVc
 Z1M7/HZubi/mWQOxJHILU90DflKCD4Dn5/L+ommWPPE61ri1u3l0srGwGVpBBzfd4S
 nwS3G++AYJ4wo19KPjkwIoX4EkrJY4i6aIQsdFi6I+pBPE72jm0xfowSpzZgBVFZ7V
 QaAfW2d86sj8T5ODEF+qLmkKmk+3u5l7YNrNyCkjSbgf1xsVZNmE9rLa4ztIvUI9s0
 YYmzhsS39Z+922hMPLTUTVuq5Wi9IE6RjlOYQSyeMMX4V6Hbt0LpA0oj479R1HDHW6
 5iMHHxtG4jSNw==
Date: Fri, 18 Aug 2023 14:29:17 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <ZN/ira/IW3Qm6NvY@google.com>
References: <20230730142552.3918623-1-chao@kernel.org>
 <90ccff97-5c2e-3dd0-8f96-05c6f3402334@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <90ccff97-5c2e-3dd0-8f96-05c6f3402334@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Let me apply this and see what'll happen later, since no luck
 to reproduce. On 08/17, Chao Yu wrote: > Ping, > > On 2023/7/30 22:25, Chao
 Yu wrote: > > The description of max_small_discards is out-of-update in below
 two > > aspects, fix it. > > - it is disabled by default > > [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qX725-009268-9K
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: doc: fix description of
 max_small_discards
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

Let me apply this and see what'll happen later, since no luck to reproduce.

On 08/17, Chao Yu wrote:
> Ping,
> 
> On 2023/7/30 22:25, Chao Yu wrote:
> > The description of max_small_discards is out-of-update in below two
> > aspects, fix it.
> > - it is disabled by default
> > - small discards will be issued during checkpoint
> > 
> > Signed-off-by: Chao Yu <chao@kernel.org>
> > ---
> >   Documentation/ABI/testing/sysfs-fs-f2fs | 6 +++---
> >   1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
> > index ad3d76d37c8b..36c3cb547901 100644
> > --- a/Documentation/ABI/testing/sysfs-fs-f2fs
> > +++ b/Documentation/ABI/testing/sysfs-fs-f2fs
> > @@ -102,9 +102,9 @@ What:		/sys/fs/f2fs/<disk>/max_small_discards
> >   Date:		November 2013
> >   Contact:	"Jaegeuk Kim" <jaegeuk.kim@samsung.com>
> >   Description:	Controls the issue rate of discard commands that consist of small
> > -		blocks less than 2MB. The candidates to be discarded are cached until
> > -		checkpoint is triggered, and issued during the checkpoint.
> > -		By default, it is disabled with 0.
> > +		blocks less than 2MB. The candidates to be discarded are cached during
> > +		checkpoint, and issued by issue_discard thread after checkpoint.
> > +		It is enabled by default.
> >   What:		/sys/fs/f2fs/<disk>/max_ordered_discard
> >   Date:		October 2022


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
