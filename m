Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D73AFF01B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Jul 2025 19:49:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AupaKM2Ik2Gzakxk0w0lEKBBFKx8b6mpyG77wf1CLHs=; b=V2gHboous4qf8LG7GYNIILgbQp
	uvF3m5k5Qka1yNCRMyPMiq4TVgJ3dswFpO6+SHsj6T9+nS26CfNxdiTkxAXAeyI80xMTp8ypd0Tvt
	KGI/gSpTNBpZEhSRCG3yVYfD0TO9fmSC5u63FjhyYVuisnamjTC1+ZeZtcWv5YhCsloc=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZYvM-0003g8-UI;
	Wed, 09 Jul 2025 17:49:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <kent.overstreet@linux.dev>) id 1uZYvL-0003g2-Al
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 09 Jul 2025 17:49:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hqDUS4BBDM+csIlPWx+TszLLC9bq/xJu9mUJf/EWg0s=; b=R9nFEDUlJqrq7SSfcGpLVNGRRQ
 GZRZwSQLUSQYvPTGB4bgfMTc8rIHLmpLinN0+dl16BQ1Mr+jLVTSpoj9jWUeMusKy9mVVZ4Wv7pXn
 x7JQkw2M0g9zWDZiIhBuHFyjvVS6Y2BS5RrVP9ccPUJIcZg46d6tfpDEiYR8ZAxH45Uc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hqDUS4BBDM+csIlPWx+TszLLC9bq/xJu9mUJf/EWg0s=; b=QaV8AJ3ADKTOny5OqstlVGkTZC
 P/A0RJdSqEl9eqiNy6YrklHvLu+jZK/AyOJ881u5y7RKQLjDDN+/0VUzv2UEFx8HQMGgVRntulmYJ
 jcj2zi48NhcDMVXodSeToD8shmSqLQMTXrc8LxL2t6MGoqgy0H3rV9f7AJ3wEUDW7i4U=;
Received: from out-171.mta0.migadu.com ([91.218.175.171])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZYvK-0008HV-4G for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 09 Jul 2025 17:49:39 +0000
Date: Wed, 9 Jul 2025 13:49:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1752083364;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hqDUS4BBDM+csIlPWx+TszLLC9bq/xJu9mUJf/EWg0s=;
 b=nxOYpGdfTMPJVXG5huvcmm3wX800iKwgvi9EibH7o8WPbGD0IbJnuT8Xfh49BzCs2NNRiI
 l7YWbWGNS8/XY+4jyd7qjYN5zK+VF2fi6LvcD3n2iQlxfIicgfoo+0Ab8aH3ZqPTI1/j4M
 /GaxGdzpYELaL0glMe+tv7VhZuKHsRo=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Jan Kara <jack@suse.cz>
Message-ID: <y2rpp6u6pksjrzgxsn5rtcsl2vspffkcbtu6tfzgo7thn7g23p@7quhaixfx5yh>
References: <343vlonfhw76mnbjnysejihoxsjyp2kzwvedhjjjml4ccaygbq@72m67s3e2ped>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <343vlonfhw76mnbjnysejihoxsjyp2kzwvedhjjjml4ccaygbq@72m67s3e2ped>
X-Migadu-Flow: FLOW_OUT
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Jul 09, 2025 at 07:23:07PM +0200, Jan Kara wrote:
 > On Wed 09-07-25 08:59:42, Dave Chinner wrote: > > This means that device
 removal processing can be performed > > without global filesystem/V [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1uZYvK-0008HV-4G
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
Cc: Christian Brauner <brauner@kernel.org>, ntfs3@lists.linux.dev,
 "Darrick J. Wong" <djwong@kernel.org>, Dave Chinner <david@fromorbit.com>,
 Qu Wenruo <quwenruo.btrfs@gmx.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-bcachefs@vger.kernel.org,
 Qu Wenruo <wqu@suse.com>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org,
 viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Jul 09, 2025 at 07:23:07PM +0200, Jan Kara wrote:
> On Wed 09-07-25 08:59:42, Dave Chinner wrote:
> > This means that device removal processing can be performed
> > without global filesystem/VFS locks needing to be held. Hence issues
> > like re-entrancy deadlocks when there are concurrent/cascading
> > device failures (e.g. a HBA dies, taking out multiple devices
> > simultaneously) are completely avoided...
> 
> Funnily enough how about:
> 
> bch2_fs_bdev_mark_dead()		umount()
>   bdev_get_fs()
>     bch2_ro_ref_tryget() -> grabs bch_fs->ro_ref
>     mutex_unlock(&bdev->bd_holder_lock);
> 					deactivate_super()
> 					  down_write(&sb->s_umount);
> 					  deactivate_locked_super()
> 					    bch2_kill_sb()
> 					      generic_shutdown_super()
> 					        bch2_put_super()
> 						  __bch2_fs_stop()
> 						    bch2_ro_ref_put()
> 						    wait_event(c->ro_ref_wait, !refcount_read(&c->ro_ref));
>   sb = c->vfs_sb;
>   down_read(&sb->s_umount); -> deadlock
> 
> Which is a case in point why I would like to have a shared infrastructure
> for bdev -> sb transition that's used as widely as possible. Because it
> isn't easy to get the lock ordering right given all the constraints in the
> VFS and block layer code paths for this transition that's going contrary to
> the usual ordering sb -> bdev. And yes I do realize bcachefs grabs s_umount
> not because it itself needs it but because it calls some VFS helpers
> (sync_filesystem()) which expect it to be held so the pain is inflicted
> by VFS here but that just demostrates the fact that VFS and FS locking are
> deeply intertwined and you can hardly avoid dealing with VFS locking rules
> in the filesystem itself.

Getting rid of the s_umount use looks like the much saner and easier
fix - like the comment notes, it's only taken to avoid the warning in
sync_filesystem, we don't actually need it.

Locking gets easier when locks are private to individual subsystems,
protecting specific data structures that are private to those
subsystems.

> > It also avoids the problem of ->mark_dead events being generated
> > from a context that holds filesystem/vfs locks and then deadlocking
> > waiting for those locks to be released.
> > 
> > IOWs, a multi-device filesystem should really be implementing
> > ->mark_dead itself, and should not be depending on being able to
> > lock the superblock to take an active reference to it.
> > 
> > It should be pretty clear that these are not issues that the generic
> > filesystem ->mark_dead implementation should be trying to
> > handle.....
> 
> Well, IMO every fs implementation needs to do the bdev -> sb transition and
> make sb somehow stable. It may be that grabbing s_umount and active sb
> reference is not what everybody wants but AFAIU btrfs as the second
> multi-device filesystem would be fine with that and for bcachefs this
> doesn't work only because they have special superblock instantiation
> behavior on mount for independent reasons (i.e., not because active ref
> + s_umount would be problematic for them) if I understand Kent right.
> So I'm still not fully convinced each multi-device filesystem should be
> shipping their special method to get from device to stable sb reference.

Honestly, the sync_filesystem() call seems bogus.

If the block device is truly dead, what's it going to accomplish?

It's not like we get callbacks for "this device is going to be going
away soon", we only get that in reaction to something that's already
happened.

> > > The shutdown method is implemented only by block-based filesystems and
> > > arguably shutdown was always a misnomer because it assumed that the
> > > filesystem needs to actually shut down when it is called.
> > 
> > Shutdown was not -assumed- as the operation that needed to be
> > performed. That was the feature that was *required* to fix
> > filesystem level problems that occur when the device underneath it
> > disappears.
> > 
> > ->mark_dead() is the abstract filesystem notification from the block
> > device, fs_bdfev_mark_dead() is the -generic implementation- of the
> > functionality required by single block device filesystems. Part of
> > that functionality is shutting down the filesystem because it can
> > *no longer function without a backing device*.
> > 
> > multi-block device filesystems require compeltely different
> > implementations, and we already have one that -does not use active
> > superblock references-. IOWs, even if we add ->remove_bdev(sb)
> > callout, bcachefs will continue to use ->mark_dead() because low
> > level filesystem device management isn't (and shouldn't be!)
> > dependent on high level VFS structure reference counting....
> 
> I have to admit I don't get why device management shouldn't be dependent on
> VFS refcounts / locking. IMO it is often dependent although I agree with
> multiple devices you likely have to do *additional* locking. And yes, I can
> imagine VFS locking could get in your way but the only tangible example we
> have is bcachefs and btrfs seems to be a counter example showing even multi
> device filesystem can live with VFS locking. So I don't think the case is
> as clear as you try to frame it.

Individual devices coming and going has nothing to do with the VFS. If a
single device goes away and we're continuing in RW mode, _no_ VFS state
is affected whatsoever.

The only thing that's needed is a ref to prevent the filesystem from
going away, not a lock. But again given that a bch_fs doesn't
necessarily even have a VFS superblock it's not something we'd use
directly in .mark_dead, that synchronization is handled directly via
kill_sb -> generic_shutdown_super -> and all that...

We don't want bch_fs to outlive the VFS superblock if we do have a VFS
sb, because asynchronous shutdown and releasing of resources causes very
real problems (which already exist for other reasons...)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
