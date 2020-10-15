Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A1528EBEC
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Oct 2020 06:05:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kSuVj-0005S5-Ef; Thu, 15 Oct 2020 04:05:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kSuVi-0005Rr-ED
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 15 Oct 2020 04:05:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EWEj5KWRjJiIOpXhJMkV3ajAjLi3ciMQKv+j5jRQjLA=; b=TIEEmxFkETY/pbwySBbNWN8bls
 HYLw+ejpEr7N5TZzwLWL234dDnUjuBMso7dEMvtB41pQ0xdrzdsmW/PdyxHzZQJUEXsVSDsBIXpSl
 pKGx5OmngR+5c/HSfNlfQJibOkxGegPnExpmisVXQSBedEh6/LMip9+cQusX4OqXKwQA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EWEj5KWRjJiIOpXhJMkV3ajAjLi3ciMQKv+j5jRQjLA=; b=eMGNuXxhhRy1xsjDoRzYVXMc10
 d0gdZZZ1NIDawD+v7+8o6oCAyA6zzE44I8ToMUGU62BaPrcB3Q5FDeGIyoyUMzEzi1WL0/dOBrqKE
 qLEpzqowWJlswoZ8siq64ErPiln6X9hnZdRD5unBNvcsBNmNfWZFzCs7b9Qt6BVc/le8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kSuVa-00B5XB-4A
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 15 Oct 2020 04:05:02 +0000
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
 [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 87ABD221FF;
 Thu, 15 Oct 2020 04:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602734683;
 bh=SMk+hp4oh3UF1fUl7YouAMOuc2XW5qG6kfSb2Z+uKzA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aTEkAcFC98RK8nCk0vXzifTUJ3hJP1Ne7GhKEoTJNeQrYhKuFSkhH5ub5q5ggFoEQ
 FMXHmKRyS6SFV9jCFDgUxUhSiH9uhTeHSJxOKPvlgJcC/e8+wcVqOislMv4lQalWOz
 oJVy5zu4uF2YukTH+5sZ6wtOt7jlZyCgmFDLmKZE=
Date: Wed, 14 Oct 2020 21:04:41 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <20201015040441.GA834@sol.localdomain>
References: <20201013022429.454161-1-daeho43@gmail.com>
 <20201013022429.454161-2-daeho43@gmail.com>
 <20201013061150.GC1062@sol.localdomain>
 <CACOAw_y31yAu=AGAEqvyo2Ankt-ux80E6g6m_sWnz6LyUgBXSg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACOAw_y31yAu=AGAEqvyo2Ankt-ux80E6g6m_sWnz6LyUgBXSg@mail.gmail.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kSuVa-00B5XB-4A
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: add F2FS_IOC_SET_COMPRESS_OPTION
 ioctl
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

On Wed, Oct 14, 2020 at 11:27:30AM +0900, Daeho Jeong wrote:
> > f2fs_readonly() is redundant with mnt_want_write_file().
> >
> > Also, shouldn't this require a writable file descriptor?  As-is, this ioctl can
> > be called on a file owned by another user, as long as the caller has read
> > access.
> >
> > Note: if you change this to require a writable file descriptor, then
> > f2fs_readonly(), mnt_want_write_file(), and IS_IMMUTABLE() all would no longer
> > be needed.
> 
> I agree that f2fs_readonly() is redundant.
> But, sorry, I don't get the rest. I thought mnt_want_write_file() is a
> way to check whether the caller has a proper write permission or not.
> I think just using mnt_want_write_file() is enough for this ioctl. Am
> I missing something?

mnt_want_write_file() checks for write permission to the mount, not to the file.

I think this ioctl wants what f2fs_sec_trim_file() does:

	if (!(filp->f_mode & FMODE_WRITE))
		return -EBADF;

	file_start_write(filp);
	inode_lock(inode);
	...
	inode_unlock(inode);
	file_end_write(filp);


After all you shouldn't be able to change the compression options of a file
given only read access to it, right?

> > I don't think the check for i_writecount == 1 accomplishes anything because it
> > just means there are no *other* writable file descriptors.  It doesn't mean that
> > some other thread isn't concurrently trying to write to this same file
> > descriptor.  So the lock needs to be enough.  Is it?
> 
> This is to detect any possibility of other threads mmap-ing and
> writing the file.
> Using only inode lock is not enough to prevent them from making dirty pages.

Well, as I said, i_writecount == 1 doesn't guarantee that other threads aren't
mmap'ing or writing to the file.  It just guarantees that there aren't any other
writable file descriptors.  (Actually, file descriptions.)  Multiple threads can
be using the same file descriptor (or the same file description) concurrently.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
