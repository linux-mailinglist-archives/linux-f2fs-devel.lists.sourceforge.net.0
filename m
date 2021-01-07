Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CCE2EE81E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  7 Jan 2021 23:06:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kxdQD-0000ox-Nz; Thu, 07 Jan 2021 22:06:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kxdQB-0000op-Sg
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 07 Jan 2021 22:06:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tBoAJQ9Yzi2QWKvEmHmm5FaqxpY6U+vGAC/l5UhiAUk=; b=TUR+0JA5o8r1P2OYYtpwFoeFGC
 DbB/dGPNJ1uqH5a0402mVogBh5UMHldwuT9v3QPhrW0XzYxNsNjuglKWXvhsvtRIWldqPhqfpAuRp
 SEWsLbukeW9uoWBaSUJ+yo+yr/OorErabTj6qc2f7jtXMgOAsvI4afYk82H2U1ACjmYM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tBoAJQ9Yzi2QWKvEmHmm5FaqxpY6U+vGAC/l5UhiAUk=; b=g3EAFEv2dxMKYdBwfuyi/sdaks
 1vHq6wXc6+7oks7xdQSDOoknVZX7yxM8Kx7C0Lp5loWEy/zC4zyD8WAPz6tZiBWYv0updaC3450eg
 ZTnhIlLOriu0ZujZkWdX7hSGtHYVNzE6JBm6yppJnlgb4NqZ0OPlBp1SuNPIfBzn5FHY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kxdQ4-006x1q-9g
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 07 Jan 2021 22:06:19 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 61A192343B;
 Thu,  7 Jan 2021 22:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610057159;
 bh=8/Njk5My/xo58SgY5AEYrWu0cHTtA/f6rh9KDGGIO84=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YqvO6VLFRUXCMoC7PXsrFxiGKcSo5KFcmgW+yA1wydzR95Nm9jMb/qeuHCgJDgfgt
 q3nqfHHT5HSRkqUn4PlHxsRBI1KHccRyxUPjcI0LRC7kPMKYLaY3UebB/ga+Mh/YLE
 pM2QS0Ers4Kun38cgeylE0HUj5Q9XblXT6D6smj9++abKWGB1WYFj+Yssy/xlhR53O
 jMlwicEjdSSeDCtmHU+T8iqA31cq6bDE2u9ioKmR4bYPPNqj+IntLOTGjkS22CX47O
 WZonqErVNV+e4n3zroK91TJ0+s+PFGcQIW5j/TZRfEap218U9aediX2r+c63ocXeEF
 2oIGzJyMeAEiQ==
Date: Thu, 7 Jan 2021 14:05:57 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Jan Kara <jack@suse.cz>
Message-ID: <X/eFxSh3ac6EGdYI@gmail.com>
References: <20210105005452.92521-1-ebiggers@kernel.org>
 <20210105005452.92521-12-ebiggers@kernel.org>
 <20210107140228.GF12990@quack2.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210107140228.GF12990@quack2.suse.cz>
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
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kxdQ4-006x1q-9g
Subject: Re: [f2fs-dev] [PATCH 11/13] fs: add a lazytime_expired method
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
Cc: Theodore Ts'o <tytso@mit.edu>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jan 07, 2021 at 03:02:28PM +0100, Jan Kara wrote:
> On Mon 04-01-21 16:54:50, Eric Biggers wrote:
> > From: Eric Biggers <ebiggers@google.com>
> > 
> > Add a lazytime_expired method to 'struct super_operations'.  Filesystems
> > can implement this to be notified when an inode's lazytime timestamps
> > have expired and need to be written to disk.
> > 
> > This avoids any potential ambiguity with
> > ->dirty_inode(inode, I_DIRTY_SYNC), which can also mean a generic
> > dirtying of the inode, not just a lazytime timestamp expiration.
> > In particular, this will be useful for XFS.
> > 
> > If not implemented, then ->dirty_inode(inode, I_DIRTY_SYNC) continues to
> > be called.
> > 
> > Note that there are three cases where we have to make sure to call
> > lazytime_expired():
> > 
> > - __writeback_single_inode(): inode is being written now
> > - vfs_fsync_range(): inode is going to be synced
> > - iput(): inode is going to be evicted
> > 
> > In the latter two cases, the inode still needs to be put on the
> > writeback list.  So, we can't just replace the calls to
> > mark_inode_dirty_sync() with lazytime_expired().  Instead, add a new
> > flag I_DIRTY_TIME_EXPIRED which can be passed to __mark_inode_dirty().
> > It's like I_DIRTY_SYNC, except it causes the filesystem to be notified
> > of a lazytime expiration rather than a generic I_DIRTY_SYNC.
> > 
> > Signed-off-by: Eric Biggers <ebiggers@google.com>
> 
> Hum, seeing this patch I kind of wonder: Why don't we dirty the inode after
> expiring the lazytime timestamps with I_DIRTY_SYNC | I_DIRTY_TIME_EXPIRED
> and propagate I_DIRTY_TIME_EXPIRED even to ->dirty_inode() where XFS can
> catch it and act? Functionally it would be the same but we'd save a bunch
> of generic code and ->lazytime_expired helper used just by a single
> filesystem...
> 

Yes, that would be equivalent to what this patch does.

Either way, note that if we also use your suggestion for patch #1, then that
already fixes the XFS bug, since i_state will start containing I_DIRTY_TIME when
->dirty_inode(I_DIRTY_SYNC) is called.  So xfs_fs_dirty_inode() will start
working as intended.

That makes introducing ->lazytime_expired (or equivalently I_DIRTY_TIME_EXPIRED)
kind of useless since it wouldn't actually fix anything.

So I'm tempted to just drop it.

The XFS developers might have a different opinion though, as they were the ones
who requested it originally:

	https://lore.kernel.org/r/20200312143445.GA19160@infradead.org
	https://lore.kernel.org/r/20200325092057.GA25483@infradead.org
	https://lore.kernel.org/r/20200325154759.GY29339@magnolia
	https://lore.kernel.org/r/20200312223913.GL10776@dread.disaster.area

Any thoughts from anyone about whether we should still introduce a separate
notification for lazytime expiration, vs. just using ->dirty_inode(I_DIRTY_SYNC)
with I_DIRTY_TIME in i_state?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
