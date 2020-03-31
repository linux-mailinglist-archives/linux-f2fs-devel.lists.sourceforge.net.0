Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7D5198ACB
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 31 Mar 2020 06:04:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jJ88A-0008Fz-PM; Tue, 31 Mar 2020 04:04:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jJ88A-0008Fo-3c
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 31 Mar 2020 04:04:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XDf+kqDDVEFXs6TsXozAT1gy5/K7eJxIA1sIqwhwtxQ=; b=KfTVwV78N61KRTeNgYI9X98Fva
 KY9FGuo5YrU8WjiISTnhflwYp8SwnhNtVXS+GBl06+BfDCSDJo8y3+Ibai3XJkyXZM1paR2P0+0I6
 ZJnuEvq+4iXiZtwltcSM4xJT+0s3Pie3qvghobXPcugKZ7OEa0moUGQHFZYAyuLobRu8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XDf+kqDDVEFXs6TsXozAT1gy5/K7eJxIA1sIqwhwtxQ=; b=K3PEm9priDsFRASedOXvoOlrJM
 /dwy77I7IvxqmHXjEdchHqDp+Lo7Q23khLPB7w3vkZQqMzvqMgClFYtUX+2y6oy5B+YSziBQjShgA
 V2OsnBDbYTMni5PO2OjFQaqfmYttI/ztCPrg5/i58zTnk2NbVWXWKl5Yju/Z4AfletvE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jJ887-00GItq-MV
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 31 Mar 2020 04:04:02 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 01AB92072D;
 Tue, 31 Mar 2020 04:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585627434;
 bh=p3Qz2J4rIxBKZEqPRdLQzPrQKkLaMFFftPymaLaOj9k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PSeYgVXbdjfswIbjzyVgsq3gOjQBSCgQdFVUmCZTv7vOYds8m2Mfe89kMVNJlqadF
 rlchqV8rzNtjQPnbgEc8V4bA3taxom5Es2lJlMomSLK1549qd8W5x9jWxWOt8/9Y8v
 SITXoPzQe6fK2c779Sze+HXSEvaUQPg9zVvB6IP8=
Date: Mon, 30 Mar 2020 21:03:53 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20200331040353.GD79749@google.com>
References: <20200330192524.8931-1-jaegeuk@kernel.org>
 <20200330195143.GB108564@gmail.com>
 <20200330201846.GA212732@google.com>
 <20200330203749.GC108564@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200330203749.GC108564@gmail.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1jJ887-00GItq-MV
Subject: Re: [f2fs-dev] [PATCH] f2fscrypt: show more information of policy
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

On 03/30, Eric Biggers wrote:
> On Mon, Mar 30, 2020 at 01:18:46PM -0700, Jaegeuk Kim wrote:
> > On 03/30, Eric Biggers wrote:
> > > On Mon, Mar 30, 2020 at 12:25:24PM -0700, Jaegeuk Kim wrote:
> > > > From: Jaegeuk Kim <jaegeuk@google.com>
> > > > 
> > > > This patch gives more information of encryption policy.
> > > > 
> > > > Signed-off-by: Jaegeuk Kim <jaegeuk@google.com>
> > > > Change-Id: I04a6826aa4497554ce79d884d495b3dda1b64fac
> > > > ---
> > > >  tools/f2fscrypt.c | 34 ++++++++++++++++++++++++++++++++++
> > > >  1 file changed, 34 insertions(+)
> > > > 
> > > > diff --git a/tools/f2fscrypt.c b/tools/f2fscrypt.c
> > > > index fe3e0ff..bb3e70f 100644
> > > > --- a/tools/f2fscrypt.c
> > > > +++ b/tools/f2fscrypt.c
> > > 
> > > I'm a little confused why the f2fscrypt tool even exists?  Who is using it?  It
> > > looks like this code was all copied from e4crypt, which is no longer being
> > > maintained either as there are now better filesystem-independent tools:
> > > 
> > > - https://github.com/google/fscrypt
> > > - https://github.com/google/fscryptctl
> > > - https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git/tree/io/encrypt.c
> > > 
> > > Would one of those work for you instead?
> > 
> > I'm using it occasionally in Android. I think it'd be great to add it in f2fs_io
> > likewise xfs_io tho, it'd be also okay to add one of projects in AOSP, if you
> > have some bandwidth. If you have any plan, I'd okay to remove f2fscrypt in
> > f2fs-tools.
> > 
> 
> Does it actually need to be part of the Android source tree, or would it suffice
> to build it locally?

Well, it's upto you. I just prefer to get the binary from AOSP build simply.

> 
> Either way, building xfs_io for Android might be difficult, so fscryptctl might
> be the best option.
> 
> Note that fscryptctl doesn't yet support v2 encryption policies, but I'll
> probably add it eventually.  I don't have any plans to update e4crypt and
> f2fscrypt too.

Okay.

> 
> - Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
