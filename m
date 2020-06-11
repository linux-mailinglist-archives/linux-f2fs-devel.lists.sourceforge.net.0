Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B43C71F6C12
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 11 Jun 2020 18:19:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jjPvJ-00041n-Lq; Thu, 11 Jun 2020 16:19:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jjPvH-00041c-LT
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 11 Jun 2020 16:19:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hQ6/oH6BXdgxeNManMv2lSDXH4b/FyRvt9rTjSZcj7Q=; b=RsycJ7TWfoqmOVf35VKs+aq2ew
 nFHzQYWeRChVpKfj/6Be8/1wSoBbADu9iWiMxBJtPHmD+xCGrN5Lb/widHpPBQcZ5TSjJ1eQZ3Hjc
 Od7mn0iWu1coA+yrH117bZ6FZql0cnKYDfUDjTUGGQGUjmID88fAQc26L/IBhtSBxozw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hQ6/oH6BXdgxeNManMv2lSDXH4b/FyRvt9rTjSZcj7Q=; b=SwAoT5NiSF5jI2eIWDLsQdqrux
 KpZ1rd8FMj4/qfD9ooQgh/Ssw9+yfDc/88sWXdDTZYxtZbDV7IWTHM/C0NzQesoZJ9wVsiIszhafD
 SWaUaIYCr0XSKsY0zE+lXHLoZyAym99lrVtHsMIOrKJznjtL8xoy3UxlfYgXE275RdKE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jjPvE-00Gnz4-MV
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 11 Jun 2020 16:19:23 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 21955206DC;
 Thu, 11 Jun 2020 16:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591892355;
 bh=wsH+kYUlpHN3cnHucYD34glIdihIFPxxoNjrZUi41cM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FQsgT8ChS41POrJ2L2DcuW4Puplj8vZ0UDnA2JkwL48aZ46XTeEZm5fx2Q9o2I4/d
 xunID26zloLK1DunIahtFYmMDEJkP4ED/cD3pme+/Bf+P6AoT8fwhmiMRLTA642EAg
 LaoSe/Lf6G4s31j9bhkbo7ypNF39wEVTN9WkHGVE=
Date: Thu, 11 Jun 2020 09:19:13 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <20200611161913.GA1152@sol.localdomain>
References: <20200611031652.200401-1-daeho43@gmail.com>
 <2eeaf889-da2c-0dac-c60b-fc5e68f2d402@huawei.com>
 <CACOAw_zyNFMYC3pTK3dT4yRgqp+-6yy3m2E64dkDkpNFKZicfQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACOAw_zyNFMYC3pTK3dT4yRgqp+-6yy3m2E64dkDkpNFKZicfQ@mail.gmail.com>
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
X-Headers-End: 1jjPvE-00Gnz4-MV
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: add F2FS_IOC_SEC_TRIM_FILE ioctl
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
Cc: kernel-team@android.com, Daeho Jeong <daehojeong@google.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jun 11, 2020 at 08:04:06PM +0900, Daeho Jeong wrote:
> > > +static int f2fs_sec_trim_file(struct file *filp, unsigned long arg)
> > > +{
> > > +     struct inode *inode = file_inode(filp);
> > > +     struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> > > +     struct address_space *mapping = inode->i_mapping;
> > > +     struct block_device *prev_bdev = NULL;
> > > +     pgoff_t index, pg_start = 0, pg_end;
> > > +     block_t prev_block = 0, len = 0;
> > > +     u32 flags;
> > > +     int ret = 0;
> > > +
> > > +     if (!(filp->f_mode & FMODE_WRITE))
> > > +             return -EBADF;
> > > +
> > > +     if (get_user(flags, (u32 __user *)arg))
> > > +             return -EFAULT;
> > > +     if (flags == 0 || (flags & ~F2FS_TRIM_FILE_MASK))
> > > +             return -EINVAL;
> > > +
> > > +     if ((flags & F2FS_TRIM_FILE_DISCARD) && !f2fs_hw_support_discard(sbi))
> > > +             return -EOPNOTSUPP;
> > > +
> > > +     file_start_write(filp);
> >
> > Now, I'm a little confused about when we need to call __mnt_want_write_file(),
> > you know, vfs_write() still will call this function when updating time.
> > - __generic_file_write_iter
> >  - file_update_time
> >   - __mnt_want_write_file
> >
> > And previously, f2fs ioctl uses mnt_{want,drop}_write_file() whenever there is
> > any updates on fs/file, if Eric is correct, we need to clean up most of ioctl
> > interface as well.
> 
> I also saw most filesytem codes use just mnt_{want,drop}_write_file()
> and actually it doesn't affect code working. It's a matter of doing a
> redundant job or not.
> AFAIUI, if the file is not open for writing (FMODE_WRITE), we have to
> call mnt_want_write_file() to increase mnt_writers.
> In this case, we already checked it has FMODE_WRITE flag.

If the fd isn't writable (or may not be writable), mnt_want_write_file() is
needed.  That includes all ioctls that operate (or may operate) on directories,
since directories can't be opened for writing.

But when the fd is guaranteed to be writable, incrementing mnt_writers is
pointless.  I'm trying to clean this up in the VFS:
https://lkml.kernel.org/r/20200611160534.55042-1-ebiggers@kernel.org.

mnt_want_write_file() still does the freeze protection, which file_start_write()
achieves more directly.

The only other thing that mnt_want_write_file() does is the check for emergency
remount r/o, which I doubt is very important.  It's racy, so the filesystem
needs to detect it in other places too.

I'm not sure why file_update_time() uses __mnt_want_write_file().  Either it
assumes the fd might not be writable, or it just wants the check for emergency
remount r/o, or it's just a mistake.  Note also that mtime isn't always updated,
so just because file_update_time() calls __mnt_want_write_file() doesn't mean
that write() always calls __mnt_want_write_file().

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
