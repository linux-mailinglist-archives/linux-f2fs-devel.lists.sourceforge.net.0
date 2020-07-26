Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B4C22DB5F
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 26 Jul 2020 04:49:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jzWjD-0002A2-FA; Sun, 26 Jul 2020 02:49:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jzWjB-00029t-UE
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 26 Jul 2020 02:49:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+1a0/7JO4HqjhinhNYm+Up9n6U32nbGmWIUXYuzkBCw=; b=JT+gs16BbllxlMO+dWCr9mNKEF
 gwz4RM9KqAq8ZqGN4nLh6vvxfhCILbUtyVoSuEVEDUydwoonZj+NB74ZazvGiHWBscYM5O3krAp2z
 RWu5NUzwWmnEH27RmZaJt7B3DVq4w5Hwj32Dx9KUyHt6q1jAX8o4QshwRoqPbQv64TWg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+1a0/7JO4HqjhinhNYm+Up9n6U32nbGmWIUXYuzkBCw=; b=ifSi+/7IjJ1gJ/tA7SFpAhCfdo
 6E3EtVdy3NMejVG80HswGQEhf9Zfhthhex65yDb6WgEDZcQPiXjxfyS04rDHeLRCkLqKsZxqm4Nt9
 jksznQ107gXUOzHGGKfsv8cLqW4kQfUJDTd9fDBXnoQkbiO4Uhh7uGQu+iuVkdQVQHs0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jzWj9-002mVX-7Y
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 26 Jul 2020 02:49:29 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 95BDA205CB;
 Sun, 26 Jul 2020 02:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595731761;
 bh=NAdi/klNeTi1UKbatqqEO+YULbHx0XAXFAEJ2boRXms=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Rk0JV3yKOUVfoUzNKVR9NotJxck+84sGURjCBkcBqzTj0HgOll1QTZl7K95qYKjeU
 1+1/MouEdKh1SKByzaHGghSyQ46DxASQ8JPOOOr4iAp5aHjFmp1Wko56K2W7TZbqmp
 Ue1h8bWvDCTu45/rkYFfAsH3QAOvEe3FCGZP9Ldc=
Date: Sat, 25 Jul 2020 19:49:20 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <20200726024920.GB14321@sol.localdomain>
References: <20200724184501.1651378-1-satyat@google.com>
 <20200724184501.1651378-2-satyat@google.com>
 <20200725001441.GQ2005@dread.disaster.area>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200725001441.GQ2005@dread.disaster.area>
X-Spam-Score: -0.2 (/)
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
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jzWj9-002mVX-7Y
Subject: Re: [f2fs-dev] [PATCH v6 1/7] fscrypt: Add functions for direct I/O
 support
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
Cc: Satya Tangirala <satyat@google.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sat, Jul 25, 2020 at 10:14:41AM +1000, Dave Chinner wrote:
> > +bool fscrypt_dio_supported(struct kiocb *iocb, struct iov_iter *iter)
> > +{
> > +	const struct inode *inode = file_inode(iocb->ki_filp);
> > +	const unsigned int blocksize = i_blocksize(inode);
> > +
> > +	/* If the file is unencrypted, no veto from us. */
> > +	if (!fscrypt_needs_contents_encryption(inode))
> > +		return true;
> > +
> > +	/* We only support direct I/O with inline crypto, not fs-layer crypto */
> > +	if (!fscrypt_inode_uses_inline_crypto(inode))
> > +		return false;
> > +
> > +	/*
> > +	 * Since the granularity of encryption is filesystem blocks, the I/O
> > +	 * must be block aligned -- not just disk sector aligned.
> > +	 */
> > +	if (!IS_ALIGNED(iocb->ki_pos | iov_iter_alignment(iter), blocksize))
> > +		return false;
> 
> Doesn't this force user buffers to be filesystem block size aligned,
> instead of 512 byte aligned as is typical for direct IO?
> 
> That's going to cause applications that work fine on normal
> filesystems becaues the memalign() buffers to 512 bytes or logical
> block device sector sizes (as per the open(2) man page) to fail on
> encrypted volumes, and it's not going to be obvious to users as to
> why this happens.

The status quo is that direct I/O on encrypted files falls back to buffered I/O.

So this patch is strictly an improvement; it's making direct I/O work in a case
where previously it didn't work.

> 
> XFS has XFS_IOC_DIOINFO to expose exactly this information to
> userspace on a per-file basis. Other filesystem and VFS developers
> have said for the past 15 years "we don't need no stinking DIOINFO".
> The same people shot down adding optional IO alignment
> constraint fields to statx() a few years ago, too.
> 
> Yet here were are again, with alignment of DIO buffers being an
> issue that userspace needs to know about....
> 

A DIOINFO ioctl sounds like a good idea to me, although I'm not familiar with
previous discussions about it.

Note that there are lots of other cases where ext4 and f2fs fall back to
buffered I/O; see ext4_dio_supported() and f2fs_force_buffered_io().  So this
isn't a new problem.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
