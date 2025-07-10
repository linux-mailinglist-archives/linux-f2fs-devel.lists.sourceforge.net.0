Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D89BBAFFFBD
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Jul 2025 12:52:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6T6KaVojBJ4dEUG3Xc7lVG6nrdtUrzz3YByZzg9kR5s=; b=k/IsTyZ2aOXYeQ7OKDCz+kXMOa
	lCQVq/GMbtqHrKj6XTAAlZcXJj3/xU3bDhwVR7RnSa8+UJEWR04vGnpAz0nYcrl7GxnP0lSosEx5Z
	bDxMNTWilTqHHZDovZZpSmF3FFhaE6N6A6eLXMcoMJv9A5ivsSfvyJCIWUWiMk+UIcoY=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZotE-0006aC-Ue;
	Thu, 10 Jul 2025 10:52:32 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+2e715cd67e78fc9cab88+7991+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1uZotD-0006a4-1X for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Jul 2025 10:52:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=u1eaudNPVeAZbSLRXaRe9plXy7/FDJiKHHZiSs3H4Xc=; b=cAMSkvhCSExQMMejdpCZlBxj6v
 JhPte7Wf3ATGM4omGuITSOMrq24qETe4e0lQUjNKwC/rkChgwQW+AXx2g0BydEhFMGxO1r2mxxKge
 Ws4Vufgdwsn025XYDP1TTkc7CMa72u4nzNQFEXZkxS280+ZlAmuKX1i3Gi+Yy5Yp/aXU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=u1eaudNPVeAZbSLRXaRe9plXy7/FDJiKHHZiSs3H4Xc=; b=gfaqqk6a15akc8oHKriepSf3Ct
 VjZW46N93HR8OZC64cbiRiKglkdRyM2MWt1AtWpKEqvdqOAAuFPFJ88bW//TmMVIgKzB0BwR/VyOc
 DYDs0CPrvvKDpI3Mvf0ZXhOsONRbf0rn6VbKfd8NN9hEAzczOrOa1Qu0TFj6tbikfzSI=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZotB-000672-M0 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Jul 2025 10:52:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=u1eaudNPVeAZbSLRXaRe9plXy7/FDJiKHHZiSs3H4Xc=; b=Dm3pPM7cRSE+b6P/cXV9uhSjKt
 TMj5rh7HMRFJzT33tBZ192h5K7Y5D/Pf8ennSpCcvELyu/yLlIlrQjXiUAVN0IsYRI6XHTqITuZSJ
 JeskD+Nu9ypEbFKSU8CMoe6XoYfFDWWREYGwL5HyDasavaHZdiFpb0tuQSWILVLB8sx1wVYT8pcgi
 7dLtNOSTC0/7G8OlQX7XBTktia2te1ms+Ym7kmqgsqgybhVCiRE0WBHcyXEtw2TeSs5mSyw7raNpO
 26fL2mh8F7sJiYO35rHefsOwDKP7UzvczcJ0+eBwRmVRie5itjxAcxHuN3APM630A5CSxG2H6oN/K
 3VP0A+ig==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uZosy-0000000BXWp-1ouf;
 Thu, 10 Jul 2025 10:52:16 +0000
Date: Thu, 10 Jul 2025 03:52:16 -0700
From: Christoph Hellwig <hch@infradead.org>
To: "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <aG-bYCFix5lcPyqg@infradead.org>
References: <cover.1751589725.git.wqu@suse.com>
 <de25bbdb572c75df38b1002d3779bf19e3ad0ff6.1751589725.git.wqu@suse.com>
 <aGxSHKeyldrR1Q0T@dread.disaster.area>
 <dbd955f7-b9b4-402f-97bf-6b38f0c3237e@gmx.com>
 <20250708004532.GA2672018@frogsfrogsfrogs>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250708004532.GA2672018@frogsfrogsfrogs>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jul 07, 2025 at 05:45:32PM -0700, Darrick J. Wong
 wrote: > On second thought -- it's weird that you'd flush the filesystem and
 > shrink the inode/dentry caches in a "your device went away" han [...] 
 Content analysis details:   (-0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1uZotB-000672-M0
Subject: Re: [f2fs-dev] [PATCH v4 1/6] fs: enhance and rename shutdown()
 callback to remove_bdev()
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
Cc: brauner@kernel.org, ntfs3@lists.linux.dev, jack@suse.cz,
 Dave Chinner <david@fromorbit.com>, Qu Wenruo <quwenruo.btrfs@gmx.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Qu Wenruo <wqu@suse.com>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org,
 viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jul 07, 2025 at 05:45:32PM -0700, Darrick J. Wong wrote:
> On second thought -- it's weird that you'd flush the filesystem and
> shrink the inode/dentry caches in a "your device went away" handler.
> Fancy filesystems like bcachefs and btrfs would likely just shift IO to
> a different bdev, right?  And there's no good reason to run shrinkers on
> either of those fses, right?

No nmeed for fancy file systems, this is weird no matter what.  But it
is what Linux has done for 30+ years, so I kept it when refactoring
this code to sit in a callback.

> > Yes, the naming is not perfect and mixing cause and action, but the end
> > result is still a more generic and less duplicated code base.
> 
> I think dchinner makes a good point that if your filesystem can do
> something clever on device removal, it should provide its own block
> device holder ops instead of using fs_holder_ops.  I don't understand
> why you need a "generic" solution for btrfs when it's not going to do
> what the others do anyway.

Why?  You're most likely to get the locking wrong, and so on.

What might make sense is to move the sync_filesystem, shrink_dcache_sb
and evict_inodes into the method.  That way file systems where we

> As an aside:
> 'twould be nice if we could lift the *FS_IOC_SHUTDOWN dispatch out of
> everyone's ioctl functions into the VFS, and then move the "I am dead"
> state into super_block so that you could actually shut down any
> filesystem, not just the seven that currently implement it.

Sure.  Someone just needs to do the work..



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
