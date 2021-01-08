Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E102EEF2A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  8 Jan 2021 10:11:03 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kxnnM-0005xd-Pv; Fri, 08 Jan 2021 09:10:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <hch@lst.de>) id 1kxnnI-0005xO-2B
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 Jan 2021 09:10:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9a3ViyxTrkZcaeAEmwjzXZxQfdA0ohtTnQ+xJKGn41w=; b=TqDHLM06SokC+2ySsZZZyFtd5n
 Vnk5iD/NT4utUbUyFiyPAFvtEVZ6cHMX2siIM6MLEqx7SmLAZw86IKyIwH2bc5veUEO+0uKc0H07X
 oLVYO/vMS2zf4y1i7qxfg3tNa5Zbce0dkiSThV3BtVNJOn8JgihxyPYZJ1PNRYihFRpo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9a3ViyxTrkZcaeAEmwjzXZxQfdA0ohtTnQ+xJKGn41w=; b=A1G3GhbL1ZnyFmILd6Y897AxLU
 FnI2UmKF8CbCk+2K2lvf8V4zdIFFxiMl20PioBCiB4KYcmQJOWUOoUuM7uQHc4yYc0eEN5FX8FPad
 PUhaXz34wcQBCpJESyrgwkgx9Z/bDJ6ORM/ZlOpaXkRPPM+41du2AaBkBxKUB81btnt0=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kxnnE-00GpYA-VQ
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 Jan 2021 09:10:52 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id E6BBB67373; Fri,  8 Jan 2021 09:54:32 +0100 (CET)
Date: Fri, 8 Jan 2021 09:54:32 +0100
From: Christoph Hellwig <hch@lst.de>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20210108085432.GA1438@lst.de>
References: <20210105005452.92521-1-ebiggers@kernel.org>
 <20210105005452.92521-2-ebiggers@kernel.org>
 <20210107144709.GG12990@quack2.suse.cz> <X/eBPZ+kLGuz2NDC@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <X/eBPZ+kLGuz2NDC@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1kxnnE-00GpYA-VQ
Subject: Re: [f2fs-dev] [PATCH 01/13] fs: avoid double-writing inodes on
 lazytime expiration
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
Cc: Jan Kara <jack@suse.cz>, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jan 07, 2021 at 01:46:37PM -0800, Eric Biggers wrote:
> It looks like that's going to work, and it fixes the XFS bug too.
> 
> Note that if __writeback_single_inode() is called from writeback_single_inode()
> (rather than writeback_sb_inodes()), then the inode might not be queued for
> sync, in which case mark_inode_dirty_sync() will move it to a writeback list.
> 
> That's okay because afterwards, writeback_single_inode() will delete the inode
> from any writeback list if it's been fully cleaned, right?  So clean inodes
> won't get left on a writeback list.
> 
> It's confusing because there are comments in writeback_single_inode() and above
> __writeback_single_inode() that say that the inode must not be moved between
> writeback lists.  I take it that those comments are outdated, as they predate
> I_SYNC_QUEUED being introduced by commit 5afced3bf281 ("writeback: Avoid
> skipping inode writeback")?

Yes.  I think we need to update the comment as well.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
