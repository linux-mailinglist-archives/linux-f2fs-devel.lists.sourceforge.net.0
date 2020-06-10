Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF2D1F4BBC
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 10 Jun 2020 05:15:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jirDP-0004uG-Ja; Wed, 10 Jun 2020 03:15:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jirDO-0004u9-BD
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 10 Jun 2020 03:15:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VNv7M7JzeDP5ZGE1uGZ+wTP2q2UpSRb3t2JkltQj0og=; b=APCsy/tymOtbpRRfAMEQnNTFMr
 TGTRPNniM4xdd3gOFs785Zad14NOv4FfEHorFfTV3shJX0eraL0GeGu2TgWLjqamNTWDR8Tn966x/
 U51O3orlyDGXLIrHj0wZd6/vlkmHhiTWXrNgwA63b2rzx/uKzcmbRTkRnnWTQAuGPn/I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VNv7M7JzeDP5ZGE1uGZ+wTP2q2UpSRb3t2JkltQj0og=; b=TJrr6KZfpDOwLvKchSC3Wowsur
 GDL8NWIge9V4h+BEhScjKRoCExs5VGPJV7BXnhAMnVHP1sZSDBjErBZzmcsplFNjw3mEghpBQKZT0
 h5spyBZEdIYlcJTyaek58RB5Q/b9DYqfRMu3Or8aNPfHKkOcGJn/sGjUT4GFqg/TfAOc=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jirDM-00Ddx2-D8
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 10 Jun 2020 03:15:46 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EB39120734;
 Wed, 10 Jun 2020 03:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591758934;
 bh=SlgmI87PFCqpmWyL9oK6/1jzu0E4iRMFU98Dj5JFzPM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XGn/k6VCSvgI9gagRwQGxde4UvqpAnwNzadx5W5FnLiHaKMibfIa1whJni7Yuukf6
 Yg89/3q/gjzQjPvbzpKoBTCUnvKdBFtFa9107I73VjK5386bqB5DTtf7iaiBB66f9+
 lW7mknkH+OpciUhADsGqY0//X/zo7c9gZRBmGLJo=
Date: Tue, 9 Jun 2020 20:15:32 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <20200610031532.GA6286@sol.localdomain>
References: <20200609060137.143501-1-daeho43@gmail.com>
 <20200609165107.GA228564@gmail.com>
 <CACOAw_xEZ+au9yhFerq9amkRO62Dzxj7h71gEc=i16ReYu5xrg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACOAw_xEZ+au9yhFerq9amkRO62Dzxj7h71gEc=i16ReYu5xrg@mail.gmail.com>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jirDM-00Ddx2-D8
Subject: Re: [f2fs-dev] [PATCH] f2fs: add F2FS_IOC_SEC_TRIM_FILE ioctl
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Jun 10, 2020 at 11:05:46AM +0900, Daeho Jeong wrote:
> > > Added a new ioctl to send discard commands or/and zero out
> > > to whole data area of a regular file for security reason.
> >
> > With this ioctl available, what is the exact procedure to write and then later
> > securely erase a file on f2fs?  In particular, how can the user prevent f2fs
> > from making multiple copies of file data blocks as part of garbage collection?
> >
> 
> To prevent the file data from garbage collecting, the user needs to
> use pinfile ioctl and fallocate system call after creating the file.
> The sequence is like below.
> 1. create an empty file
> 2. pinfile
> 3. fallocate()

Is that persistent?  So the file will never be moved afterwards?

Is there a place where this is (or should be) documented?

> > > +
> > > +     if (f2fs_readonly(sbi->sb))
> > > +             return -EROFS;
> >
> > Isn't this redundant with mnt_want_write_file()?
> >
> > Also, shouldn't write access to the file be required, i.e.
> > (filp->f_mode & FMODE_WRITE)?  Then the f2fs_readonly() and
> > mnt_want_write_file() checks would be unnecessary.
> >
> 
> Using FMODE_WRITE is more proper for this case, since we're going to
> modify the data. But I think mnt_want_write_file() is still required
> to prevent the filesystem from freezing or something else.

Right, the freezing check is actually still necessary.  But getting write access
to the mount is not necessary.  I think you should use file_start_write() and
file_end_write(), like vfs_write() does.

> >
> > > +
> > > +     if (get_user(flags, (u32 __user *)arg))
> > > +             return -EFAULT;
> > > +     if (!(flags & F2FS_TRIM_FILE_MASK))
> > > +             return -EINVAL;
> >
> > Need to reject unknown flags:
> >
> >         if (flags & ~F2FS_TRIM_FILE_MASK)
> >                 return -EINVAL;
> 
> I needed a different thing here. This was to check neither discard nor
> zeroing out are not here. But we still need to check unknown flags,
> too.
> The below might be better.
> if (!flags || flags & ~F2FS_TRIM_FILE_MASK)
>        return -EINVAL;

Sure, but please put parentheses around the second clause:

	if (flags == 0 || (flags & ~F2FS_TRIM_FILE_MASK))
		return -EINVAL;

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
