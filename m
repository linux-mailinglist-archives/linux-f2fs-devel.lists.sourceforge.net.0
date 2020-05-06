Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1871C6575
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  6 May 2020 03:24:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jW8nr-0003cy-SS; Wed, 06 May 2020 01:24:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jW8np-0003cq-V4
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 06 May 2020 01:24:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Dvn17MOoQZJNj052Dfv+VO8ul21v5UP86WVBMo9KyuQ=; b=kA27EBABI3d+9pzKiDs9dSv2EM
 wJBfbgw2yE5crHjUXBu0r1W7r9YMHufTlrWIkQeYE9dfdOv7K7tUDBWtayvI9kfHP0QqvzjO+ZC3f
 4pN2vSLSwAMip1DTbZAEDysZgYHQ4n5EcqQCUstpEBL7P2jnQFJ/6NcZvAbo+3+VH4lc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Dvn17MOoQZJNj052Dfv+VO8ul21v5UP86WVBMo9KyuQ=; b=dXxFvYJMxKg1GOvjebKiYx2BIv
 /LCjaQE8nfh01I0gQ1nKimQKPI9AZH4nIFEv+T65xuyawJA+X3yjbOtrNWeRPYRJD/Vole6xEn2oE
 2beMkPpAvSjVO1Dbg3vA+1z0QjOCKyxfJUL1rhb1mxCKb9uwvItDweBvfJnkFNJj0kNI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jW8no-0090ks-0C
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 06 May 2020 01:24:49 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 38C3320721;
 Wed,  6 May 2020 01:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588728270;
 bh=0MLo2NbZMkoEikI+0ws5DDZ7FousY6/b9nnHo7P+Gjk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tXVf6TQ1Sti0iAG5VHBet6ALroDk6gYzIaC5JV+smROfEfJggD6fgeg19XW+7O8/2
 bYWn7fbiDYwRISi5X8fDqEQVdH9Z1kdp2hU8Dh38/TYjeZjSAUC6kkug7gkha0bjeZ
 VQJDeO6Ztfl/XIAlww3YDrgnB3H7htuULoFp3GfM=
Date: Tue, 5 May 2020 18:24:28 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Gao Xiang <hsiangkao@gmx.com>
Message-ID: <20200506012428.GG128280@sol.localdomain>
References: <20200505153139.201697-1-jaegeuk@kernel.org>
 <20200505165847.GA98848@gmail.com>
 <20200505181323.GA55221@google.com>
 <20200505181941.GC98848@gmail.com>
 <20200506001403.GA2101@hsiangkao-HP-ZHAN-66-Pro-G1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200506001403.GA2101@hsiangkao-HP-ZHAN-66-Pro-G1>
X-Spam-Score: -0.4 (/)
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
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jW8no-0090ks-0C
Subject: Re: [f2fs-dev] [PATCH] f2fs: get parent inode when recovering pino
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, May 06, 2020 at 08:14:07AM +0800, Gao Xiang wrote:
> >
> > Actually, I think this is wrong because the fsync can be done via a file
> > descriptor that was opened to a now-deleted link to the file.
> 
> I'm still confused about this...
> 
> I don't know what's wrong with this version from my limited knowledge?
>  inode itself is locked when fsyncing, so
> 
>    if the fsync inode->i_nlink == 1, this inode has only one hard link
>    (not deleted yet) and should belong to a single directory; and
> 
>    the only one parent directory would not go away (not deleted as well)
>    since there are some dirents in it (not empty).
> 
> Could kindly explain more so I would learn more about this scenario?
> Thanks a lot!

i_nlink == 1 just means that there is one non-deleted link.  There can be links
that have since been deleted, and file descriptors can still be open to them.

> 
> >
> > We need to find the dentry whose parent directory is still exists, i.e. the
> > parent directory that is counting towards 'inode->i_nlink == 1'.
> 
> directory counting towards 'inode->i_nlink == 1', what's happening?

The non-deleted link is the one counted in i_nlink.

> 
> >
> > I think d_find_alias() is what we're looking for.
> 
> It may be simply dentry->d_parent (stable/positive as you said before, and it's
> not empty). why need to d_find_alias()?

Because we need to get the dentry that hasn't been deleted yet, which isn't
necessarily the one associated with the file descriptor being fsync()'ed.

> And what is the original problem? I could not get some clue from the original
> patch description (I only saw some extra igrab/iput because of some unknown
> reasons), it there some backtrace related to the problem?

The problem is that i_pino gets set incorrectly.  I just noticed this while
reviewing the code.  It's not hard to reproduce, e.g.:

#include <unistd.h>
#include <fcntl.h>
#include <sys/stat.h>

int main()
{
        int fd;

        mkdir("dir1", 0700);
        mkdir("dir2", 0700);
        mknod("dir1/file", S_IFREG|0600, 0);
        link("dir1/file", "dir2/file");
        fd = open("dir2/file", O_WRONLY);
        unlink("dir2/file");
        write(fd, "X", 1);
        fsync(fd);
}

Then:

sync
echo N | dump.f2fs -i $(stat -c %i dir1/file) /dev/vdb | grep 'i_pino'
echo "dir1 (correct): $(stat -c %i dir1)"
echo "dir2 (wrong): $(stat -c %i dir2)"

i_pino will point to dir2 rather than dir1 as expected.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
