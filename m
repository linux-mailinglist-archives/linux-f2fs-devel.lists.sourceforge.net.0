Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CB46A525245
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 May 2022 18:15:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1npBTg-00036I-RB; Thu, 12 May 2022 16:15:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1npBTf-000365-Hg
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 May 2022 16:15:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QBtUSt4LH2Y8JbzfUWR6/VcccOE9tYBwFef3idunsSY=; b=cfnLsw9Nry9poLbuEI7MxxBr+n
 WSld7FPzQSZidECe7XKQuP+1Keny3D1FWLTZOpCY7k754Ej/istWCssof11vBBNfeC+kE4669voz8
 kmcaczOVsIoRBI1QFCtNcZCZeBcWWQPxsv8qkTiwGvbViN4nQGWvMo7ppJD2TpuvDc2g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QBtUSt4LH2Y8JbzfUWR6/VcccOE9tYBwFef3idunsSY=; b=jhjnL6sut2+WtuaSXMQVoprP6A
 y7/NIS/a7NyhG+koxg7lCTUg6Emzr8MDEJsknxmXVcBjSFdrl+NevLQIiHkO4L17S2hfOvCCqOJ6r
 vdl7R49KdNHiV79uiQY1sZ4BU8il8/y0UJSaJUf3oJPLoCxz1vaT5dqV28YwE7BBzOjU=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1npBTf-009tAv-63
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 May 2022 16:15:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 82263B8289C;
 Thu, 12 May 2022 16:15:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23E35C385B8;
 Thu, 12 May 2022 16:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652372137;
 bh=i70+uprLNQWZny9cy3ILuJ6vbMHaIKlCK36vJUzGZs4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sqN4NGF72oJUnGSThojIkUaS2ddM9sV7wTkF+bJHaMEOg0xmNG6gFJZBZYH7GREpm
 RwD4lCYTSwL1YmkAGEYrpjtGc7PG3SVskxeLrtDlar8YHDi0RAM1uf21ZIhQ3izELQ
 p0bh8qweZQtprn9NkA/M1U+6vl+L14tpFtBings7t54MNiGBFkqhhEL7Nst2CDgn/8
 2In0MBn5uSRWZC/HcTGU4dgeKCyNBv3WpdVM0LX87hO56A+LjS5GvApWjzMir2HW5S
 ZvoZHocC36qfbBkbZ7/9AqD+74uf6BJSwxSR9ThWyv2XLBlGl/FrU+UwZzJRrjiAWH
 2i5Ked+Ihrwtw==
Date: Thu, 12 May 2022 09:15:35 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Message-ID: <Yn0ypxFbz2H0u+Ay@google.com>
References: <Ynu4CGiqiU4l2vdf@kili> <Ynv0ddBz91EoyWwl@google.com>
 <20220512092043.GD29930@kadam>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220512092043.GD29930@kadam>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 05/12, Dan Carpenter wrote: > On Wed, May 11,
 2022 at 10:37:57AM
 -0700, Jaegeuk Kim wrote: > > Hi Dan, > > > > Thank you for the fix. If you
 don't mind, can I integrate this fix into > > the origin [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1npBTf-009tAv-63
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix error code in
 f2fs_ioc_start_atomic_write()
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
Cc: kernel-janitors@vger.kernel.org, Daeho Jeong <daehojeong@google.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 05/12, Dan Carpenter wrote:
> On Wed, May 11, 2022 at 10:37:57AM -0700, Jaegeuk Kim wrote:
> > Hi Dan,
> > 
> > Thank you for the fix. If you don't mind, can I integrate this fix into
> > the original patch which is in -next?
> > 
> 
> Yeah, that's not a problem.  Feel free.

Thank you~

> 
> regards,
> dan carpenter
> 
> > Thanks,
> > 
> > On 05/11, Dan Carpenter wrote:
> > > Return an error code if f2fs_iget() fails.  Currently it returns
> > > success.
> > > 
> > > Fixes: 3d7ad9c30607 ("f2fs: change the current atomic write way")
> > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > ---
> > >  fs/f2fs/file.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > > index 79d1a20fbda9..cd768fadfd67 100644
> > > --- a/fs/f2fs/file.c
> > > +++ b/fs/f2fs/file.c
> > > @@ -2047,6 +2047,7 @@ static int f2fs_ioc_start_atomic_write(struct file *filp)
> > >  	pinode = f2fs_iget(inode->i_sb, fi->i_pino);
> > >  	if (IS_ERR(pinode)) {
> > >  		f2fs_up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
> > > +		ret = PTR_ERR(pinode);
> > >  		goto out;
> > >  	}
> > >  
> > > -- 
> > > 2.35.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
