Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BB949BE47
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Jan 2022 23:14:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nCU5D-0000l3-HP; Tue, 25 Jan 2022 22:14:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1nCU5C-0000kx-Bg
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 25 Jan 2022 22:14:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=r2sq8NNfQfbWI8wK6CCJvSQBlG7rZ5GBhPXi5DbZCSQ=; b=FkLT8FKQz6WgvRMbVjaXtDWCgK
 9fkPO2wr5YVtPunZbw3wQzpV+FwlWkbJL3ofyfCJJ22/Ua7RvETREJTPKsw+HyK594ynwWRLXc6lV
 sn4+u2prU2w4lhYZjiMXUGI6g3Tn7ygubB5rTduVoFyvm+xPt72ijY2ltH9T2FTSRVgs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=r2sq8NNfQfbWI8wK6CCJvSQBlG7rZ5GBhPXi5DbZCSQ=; b=gXCGR1fvuExcODepF11LBQKtD1
 Yc+6UiVlY9+kHn/QQWZ+SjtKIA8mZgUjU8Yp5fewV3uY0uvQNm9wO+w2oM6A3qNBdVhAv6/D9hwAA
 OzMxhG/InDdSRw6mUL8BAeFbTzR9hSI5+a+J2LZD9Z4ZuBnX9ewRbKeMfLDH1QYv8iCs=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1nCU56-0001P9-OI
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 25 Jan 2022 22:14:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A61F0B81AC6;
 Tue, 25 Jan 2022 22:14:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56ED3C340E0;
 Tue, 25 Jan 2022 22:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643148856;
 bh=wzQ7De1OASBwcj3eJi86mBXPWkiGQw8ikhGXdFZuX4s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CD6N+fucU5W+Oe0l9yslZOos70un8YyAOxgmEVyiljOD5LNiUrrshae3qKmqz/UfW
 zRo5ffiEfJbWjIcVeOeKFBVlfi8vThLQ4Dp7jTb25WDhtEwOg+GO8zQJV0sgnYoc7B
 zUBR3soAR5Uil1cGxJO4zU/P2+yKngc3sDIJFNcBvovrpmW1Iv9kvRVwMBCQVDwATl
 hF6ATYuwsiQq+b8Tc4GiWzJMQISjrXzgNWvEqpruia1PUZaQu8HmvOW10mpVu3jwoz
 Oo1lIDqQOZbnTen10a52SgQm6goBIQ4PCtwIU9xzZ5vRJTkrP6ydheCM6WG71/qvO3
 j2hYTsaW5tIcg==
Date: Tue, 25 Jan 2022 22:13:58 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Harry Austen <harryausten@hotmail.co.uk>
Message-ID: <YfB2Jqs3RGRnH63R@gmail.com>
References: <AM6PR10MB2838873D61CE1C0DB91EEDB9FA5C9@AM6PR10MB2838.EURPRD10.PROD.OUTLOOK.COM>
 <Ye79OLCFLR3H+GnY@gmail.com>
 <AM6PR10MB2838705554FCB6ACE86F12BBFA5F9@AM6PR10MB2838.EURPRD10.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AM6PR10MB2838705554FCB6ACE86F12BBFA5F9@AM6PR10MB2838.EURPRD10.PROD.OUTLOOK.COM>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Jan 25, 2022 at 10:01:49PM +0000, Harry Austen wrote:
 > On Monday, 24 January 2022 19:25:44 GMT Eric Biggers wrote: > > On Sat,
 Jan 22, 2022 at 12:59:03PM +0000, Harry Austen wrote: > > > FS_I [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nCU56-0001P9-OI
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix fileattr_set unsupported attribute
 handling
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Jan 25, 2022 at 10:01:49PM +0000, Harry Austen wrote:
> On Monday, 24 January 2022 19:25:44 GMT Eric Biggers wrote:
> > On Sat, Jan 22, 2022 at 12:59:03PM +0000, Harry Austen wrote:
> > > FS_IOC_SETFLAGS ioctl should return EOPNOTSUPP if the file attribute
> > > (e.g. FS_NOCOW_FL) is not supported, rather than silently ignoring it
> > > and returning success.
> > > 
> > > Fixes: 9b1bb01c8ae7 (f2fs: convert to fileattr)
> > > Signed-off-by: Harry Austen <harryausten@hotmail.co.uk>
> > > ---
> > > 
> > >  fs/f2fs/file.c | 3 +--
> > >  1 file changed, 1 insertion(+), 2 deletions(-)
> > > 
> > > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > > index 92ec2699bc85..061bf35c2582 100644
> > > --- a/fs/f2fs/file.c
> > > +++ b/fs/f2fs/file.c
> > > @@ -3085,9 +3085,8 @@ int f2fs_fileattr_set(struct user_namespace
> > > *mnt_userns,> 
> > >  		return -EIO;
> > >  	
> > >  	if (!f2fs_is_checkpoint_ready(F2FS_I_SB(inode)))
> > >  	
> > >  		return -ENOSPC;
> > > 
> > > -	if (fsflags & ~F2FS_GETTABLE_FS_FL)
> > > +	if (fsflags & ~F2FS_SETTABLE_FS_FL)
> > > 
> > >  		return -EOPNOTSUPP;
> > > 
> > > -	fsflags &= F2FS_SETTABLE_FS_FL;
> > > 
> > >  	if (!fa->flags_valid)
> > >  	
> > >  		mask &= FS_COMMON_FL;
> > 
> > This is intentional, and matches what ext4 does; see the comment in the ext4
> > implementation of this:
> > 
> >         /*
> >          * chattr(1) grabs flags via GETFLAGS, modifies the result and
> >          * passes that to SETFLAGS. So we cannot easily make SETFLAGS
> >          * more restrictive than just silently masking off visible but
> >          * not settable flags as we always did.
> >          */
> 
> Ah, my apologies. I thought it looked a little too obvious. Clearly I
> should have looked at the ext4 code. Please disregard this patch.
> 
> Is there anything else that could be done to improve unsettable
> attribute handling? For example, is there a reason FS_NOCOW_FL is
> gettable but not settable? Could it be added to the settable list?

A lot of flags are gettable by FS_IOC_GETFLAGS but not settable by
FS_IOC_SETFLAGS, typically because they can only be set through a dedicated
interface.  For example, the encrypt flag can only be set using
FS_IOC_SET_ENCRYPTION_POLICY, or via inheritance.

> > 
> > Also, even if this patch was correct, the Fixes tag is wrong.
> 
> Having looked at this a bit more, I assume you are saying this due to
> the missing double quotes around the commit summary? (just so I know for
> next time as this is my first attempt at sending a kernel patch)
> 

There's that, but more importantly the commit you listed is wrong.  The relevant
code was added by an earlier commit, and that commit just moved it.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
