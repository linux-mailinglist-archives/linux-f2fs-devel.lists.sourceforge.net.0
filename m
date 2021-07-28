Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0283D3D85E1
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 28 Jul 2021 04:29:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m8ZKB-0001fI-Be; Wed, 28 Jul 2021 02:29:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1m8ZK9-0001fB-Nr
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 28 Jul 2021 02:29:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Yx+5tdhuHbXfw/ArYZcCPT6UYJDRIwqb5Y6vdBT+JUU=; b=dWFN9nj1Fx1vlhoz7LDQaIAkWN
 OHAo5DFGeQjSMoRWRF4iXQBQ2leYGiSARWFeQqToJ02IyDY3H0vsMCB1Ci7ASrzB9F1jTE7zGkcE4
 qbgbeVqyK7wu5LEheOfBDm56BaPWCzDz70XtI/xgRsu9n2iHvHkxzxLWP6EHbi14+ibA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Yx+5tdhuHbXfw/ArYZcCPT6UYJDRIwqb5Y6vdBT+JUU=; b=dsxxAWdApuLGp87YwUxnVxbhG5
 ua9unfFcSrpag25Q6rr48YmaDRXUxEH8kiTi8ZCUsHt1h+JE58ue5YTBdiuHb8/3C3y+/Nd2MTboC
 AR+fSrO8v4Wvzcm30wcIteEZaLt4/SL429JQcsgjEyq68zHh9e4wQHTz4RkjlU7oeEwk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m8ZK8-004x6M-Hk
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 28 Jul 2021 02:29:33 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7069F60F9D;
 Wed, 28 Jul 2021 02:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627439364;
 bh=92/QU5E2eSQ6Mi3MNPH50dd6V05Hb7i5VrQtXsDNLTo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sngqlEFdZ1mpdSmM5PMlNOmlefHphaw0iNtvYJjbHzNcP7420wr+CKetnrlksePur
 aejSQgZbvhFwgqUm6+p1O054oZMR+q6GVxJzE+RiSgaJiP1Z87znO7NMDCVXBtANAT
 oWEL9N7F5jY+1NJ9qwJthdTmYyMvnhD3CX9CXBS60bn8k7UPy+BwFzXyI6s7JdxBue
 mN+YTqXdHR5rDvjH3CuS7qsjthNPZPeTpCs4GCtSpaBbG8sWzyEvUupdBjkUpsoLCe
 GZzHTlnLkHEbDv9iUKo+0likZYp16Bs2oyrEJkd+nJEs1vbL4e9NfKyTi3+KHBzb0V
 fvfy9XVBs+gYw==
Date: Tue, 27 Jul 2021 19:29:23 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <YQDBA2xqbIQPPivQ@google.com>
References: <20210716143919.44373-1-ebiggers@kernel.org>
 <20210716143919.44373-4-ebiggers@kernel.org>
 <14782036-f6a5-878a-d21f-e7dd7008a285@kernel.org>
 <YP2l+1umf9ct/4Sp@sol.localdomain> <YP9oou9sx4oJF1sc@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YP9oou9sx4oJF1sc@google.com>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1m8ZK8-004x6M-Hk
Subject: Re: [f2fs-dev] [PATCH 3/9] f2fs: rework write preallocations
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
Cc: Satya Tangirala <satyaprateek2357@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Matthew Bobrowski <mbobrowski@mbobrowski.org>,
 Changheun Lee <nanich.lee@samsung.com>, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 07/26, Jaegeuk Kim wrote:
> On 07/25, Eric Biggers wrote:
> > On Sun, Jul 25, 2021 at 06:50:51PM +0800, Chao Yu wrote:
> > > On 2021/7/16 22:39, Eric Biggers wrote:
> > > > From: Eric Biggers <ebiggers@google.com>
> > > > 
> > > > f2fs_write_begin() assumes that all blocks were preallocated by
> > > > default unless FI_NO_PREALLOC is explicitly set.  This invites data
> > > > corruption, as there are cases in which not all blocks are preallocated.
> > > > Commit 47501f87c61a ("f2fs: preallocate DIO blocks when forcing
> > > > buffered_io") fixed one case, but there are others remaining.
> > > 
> > > Could you please explain which cases we missed to handle previously?
> > > then I can check those related logic before and after the rework.
> > 
> > Any case where a buffered write happens while not all blocks were preallocated
> > but FI_NO_PREALLOC wasn't set.  For example when ENOSPC was hit in the middle of
> > the preallocations for a direct write that will fall back to a buffered write,
> > e.g. due to f2fs_force_buffered_io() or page cache invalidation failure.
> > 
> > > 
> > > > -			/*
> > > > -			 * If force_buffere_io() is true, we have to allocate
> > > > -			 * blocks all the time, since f2fs_direct_IO will fall
> > > > -			 * back to buffered IO.
> > > > -			 */
> > > > -			if (!f2fs_force_buffered_io(inode, iocb, from) &&
> > > > -					f2fs_lfs_mode(F2FS_I_SB(inode)))
> > > > -				goto write;
> > > 
> > > We should keep this OPU DIO logic, otherwise, in lfs mode, write dio
> > > will always allocate two block addresses for each 4k append IO.
> > > 
> > > I jsut test based on codes of last f2fs dev-test branch.
> > 
> > Yes, I had misread that due to the weird goto and misleading comment and
> > translated it into:
> > 
> >         /* If it will be an in-place direct write, don't bother. */
> >         if (dio && !f2fs_lfs_mode(sbi))
> >                 return 0;
> > 
> > It should be:
> > 
> >         if (dio && f2fs_lfs_mode(sbi))
> >                 return 0;
> 
> Hmm, this addresses my 250 failure. And, I think the below commit can explain
> the case.

In addition to this, I got failure on generic/263, and the below change fixes
it. (I didn't take a look at deeply tho.)

--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -4344,8 +4344,13 @@ static int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *iter)
                        return ret;
        }

-       map.m_lblk = (pos >> inode->i_blkbits);
-       map.m_len = ((pos + count - 1) >> inode->i_blkbits) - map.m_lblk + 1;
+       map.m_lblk = F2FS_BLK_ALIGN(pos);
+       map.m_len = F2FS_BYTES_TO_BLK(pos + count);
+       if (map.m_len > map.m_lblk)
+               map.m_len -= map.m_lblk;
+       else
+               map.m_len = 0;
+


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
