Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 324391C7A0E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  6 May 2020 21:16:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jWPWx-0007wn-H1; Wed, 06 May 2020 19:16:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jWPWu-0007wR-Ls
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 06 May 2020 19:16:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ulSUYx7ZjegD+oTS6cBVUEO4A/wK+Jxxywwgfcb628Y=; b=OAS8oCy5VAH7yuWZ95n38+oPVv
 piCpPPJDnfCx14FZLuY8BPNsubZg04Hj1WrevE8h/wNsaL4FdEX0kUbadivbYOAwifPT1FZf70dkm
 Jc+6ITXB+saja6AChyqb8zP5g+fu/xgI3j5P5Ox4UVw0w3rtlphIiAg8mO2JN9shCRTw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ulSUYx7ZjegD+oTS6cBVUEO4A/wK+Jxxywwgfcb628Y=; b=QBotdU7ZkDH+PPNEoxOTvl6jHZ
 ahlmdqYdcv0oRunUYbnd3L525gpxRgqWgnz5pmxpu3GNsYQmLfhxMVMYd557OOFndaEmeTmnpsOSR
 OvhPF/KAaN9Ly1ya6bgsd2dx9H0lWiCAY7eVRsL9ldRlYxMgslJbVKjwg/e5m7wSOpL8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jWPWt-00Gd4z-GU
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 06 May 2020 19:16:28 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 49C9E2075A;
 Wed,  6 May 2020 19:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588792575;
 bh=THl2Lpu9sfzGxpEl85CqvltCNIh7W5yIuzClFt9bv4U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bjYUPi2pTno6Scq4ERj8iiHIh0GEoMacr7jaA2J4s/5IsEU1LWt5+o/FCoeLtkmFK
 DxxtXGvfDR1GG96aaJqEqyebWNFBkIFPkxTQQzxoqE1ij9FvnN6vpdfeXvcarR2rp6
 V5nPvdyZqzQ0PF6fqZkn4/A5yvF/qrA1pH9uGbDY=
Date: Wed, 6 May 2020 12:16:13 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Gao Xiang <hsiangkao@gmx.com>
Message-ID: <20200506191613.GB842@sol.localdomain>
References: <20200505153139.201697-1-jaegeuk@kernel.org>
 <20200505165847.GA98848@gmail.com>
 <20200505181323.GA55221@google.com>
 <20200505181941.GC98848@gmail.com>
 <20200506001403.GA2101@hsiangkao-HP-ZHAN-66-Pro-G1>
 <20200506012428.GG128280@sol.localdomain>
 <20200506015813.GA9256@hsiangkao-HP-ZHAN-66-Pro-G1>
 <20200506064709.GA25482@hsiangkao-HP-ZHAN-66-Pro-G1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200506064709.GA25482@hsiangkao-HP-ZHAN-66-Pro-G1>
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
X-Headers-End: 1jWPWt-00Gd4z-GU
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

On Wed, May 06, 2020 at 02:47:19PM +0800, Gao Xiang wrote:
> On Wed, May 06, 2020 at 09:58:22AM +0800, Gao Xiang wrote:
> > On Tue, May 05, 2020 at 06:24:28PM -0700, Eric Biggers wrote:
> > > On Wed, May 06, 2020 at 08:14:07AM +0800, Gao Xiang wrote:
> > > > >
> > > > > Actually, I think this is wrong because the fsync can be done via a file
> > > > > descriptor that was opened to a now-deleted link to the file.
> > > >
> > > > I'm still confused about this...
> > > >
> > > > I don't know what's wrong with this version from my limited knowledge?
> > > >  inode itself is locked when fsyncing, so
> > > >
> > > >    if the fsync inode->i_nlink == 1, this inode has only one hard link
> > > >    (not deleted yet) and should belong to a single directory; and
> > > >
> > > >    the only one parent directory would not go away (not deleted as well)
> > > >    since there are some dirents in it (not empty).
> > > >
> > > > Could kindly explain more so I would learn more about this scenario?
> > > > Thanks a lot!
> > >
> > > i_nlink == 1 just means that there is one non-deleted link.  There can be links
> > > that have since been deleted, and file descriptors can still be open to them.
> >
> > Thanks for your inspiration. You are right, thanks.
> >
> > Correct my words... I didn't check f2fs code just now, it seems f2fs doesn't
> > take inode_lock as some other fs like __generic_file_fsync or ubifs_fsync.
> >
> > And i_sem locks nlink / try_to_fix_pino similarly in some extent. It seems
> > no race by using d_find_alias here. Thanks again.
> >
> 
> (think more little bit just now...)
> 
>  Thread 1:                                           Thread 2 (fsync):
>   vfs_unlink                                          try_to_fix_pino
>     f2fs_unlink
>        f2fs_delete_entry
>          f2fs_drop_nlink  (i_sem, inode->i_nlink = 1)
> 
>   (...   but this dentry still hashed)                  i_sem, check inode->i_nlink = 1
>                                                         i_sem d_find_alias
> 
>   d_delete
> 
> I'm not sure if fsync could still use some wrong alias by chance..
> completely untested, maybe just noise...
> 

Right, good observation.  My patch makes it better, but it's still broken.

I don't know how to fix it.  If we see i_nlink == 1 and multiple hashed
dentries, there doesn't appear to be a way to distingush which one corresponds
to the remaining link on-disk (if any; it may not even be in the dcache), and
which correspond to links that vfs_unlink() has deleted from disk but hasn't yet
done d_delete() on.

One idea would be choose one, then take inode_lock_shared(dir) and do
__f2fs_find_entry() to check if the dentry is really still on-disk.  That's
heavyweight and error-prone though, and the locking could cause problems.

I'm wondering though, does f2fs really need try_to_fix_pino() at all, and did it
ever really work?  It never actually updates the f2fs_inode::i_name to match the
new directory.  So independently of this bug with deleted links, I don't see how
it can possibly work as intended.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
