Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E79A71844D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 31 May 2023 16:10:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q4MWh-0008Gj-Pb;
	Wed, 31 May 2023 14:10:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1q4MWg-0008GU-H5
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 May 2023 14:10:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rSD2SlZQbcHX//nToIEl97vUhzQipE5m2W/GUWYVrRs=; b=Lsha3gc7UOjvVT00urCQXvBSTi
 ftp8s8c45DLDE2o4awbMR8A8Zw7JD2UvRijqPWSg2ZbDzkZ3H1ZZa6cwBosac7mB0rZhn7Yuh8I3Q
 iB85GOdK05jKk9kLUZ2093AQHxq5CxKQH2cOhRknfz+nfoiFVmN7gU6gX+0F15nxfZu0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rSD2SlZQbcHX//nToIEl97vUhzQipE5m2W/GUWYVrRs=; b=TQPm8wC6aYVadPGCL/Ypv5TGB5
 ruxsCwah7Ph8Tg5JkTVepmsCZ9PmbQ44Kb8apAj7MguAwRFt3+V1DQpFE8LEw8xEk2zJNPEFQ5in3
 mproZSWrZTGYy1ZcYsyCCA2gjBRV3ffnzA6x/XCvWjCBjtI9mdEYQAVIBhUobbKoabf0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q4MWg-0003NJ-DT for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 May 2023 14:10:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 085C563C8B;
 Wed, 31 May 2023 14:10:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E80F9C433D2;
 Wed, 31 May 2023 14:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685542204;
 bh=zj4tDmO7r3g1mCDD34R1v748dXlekfkGuK0nSfyITh0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oks+HxtCMozAFUM8zc0YtoCSSwY0G7GxaSHGf6dTHu2E/R92unLTOutBl09MfRDKE
 KIXt0zP/OACikPEmsyAT00vJZLnEMzG5R8WYncbX2ugu8RoGGhPMeC7JTys0OH5bEb
 fQwNTBW8O+dHUDTgK/MMjVtmYZmec0AynqhlGgRjab7+NPWc7daogtqP/3EyNZId9a
 0/pY9wFclvWXiSRKjN4c1urSnMmbs1ueO6L+TSR1yR4ICKC4bgLXYDcGzY2ueqvNNS
 O0XH122GfOLJj2GVKm07IlWKH47M2d7jjddfMxIkrq0Qysqy27nZJ9keLU/dFVAcqI
 0841fT6duKA3A==
Date: Wed, 31 May 2023 16:09:58 +0200
From: Christian Brauner <brauner@kernel.org>
To: Jan Kara <jack@suse.cz>
Message-ID: <20230530-seenotrettung-allrad-44f4b00139d4@brauner>
References: <20230525100654.15069-1-jack@suse.cz>
 <20230526-schrebergarten-vortag-9cd89694517e@brauner>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230526-schrebergarten-vortag-9cd89694517e@brauner>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, May 26, 2023 at 05:58:14PM +0200, Christian Brauner
 wrote: > On Thu, May 25, 2023 at 12:16:06PM +0200, Jan Kara wrote: > > Hello, 
 > > > > this patch set fixes a problem with cross directory re [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q4MWg-0003NJ-DT
Subject: Re: [f2fs-dev] [PATCH 0/6] fs: Fix directory corruption when moving
 directories
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
Cc: Ted Tso <tytso@mit.edu>, Miklos Szeredi <miklos@szeredi.hu>,
 "Darrick J. Wong" <djwong@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Al Viro <viro@ZenIV.linux.org.uk>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, May 26, 2023 at 05:58:14PM +0200, Christian Brauner wrote:
> On Thu, May 25, 2023 at 12:16:06PM +0200, Jan Kara wrote:
> > Hello,
> > 
> > this patch set fixes a problem with cross directory renames originally reported
> > in [1]. To quickly sum it up some filesystems (so far we know at least about
> > ext4, udf, f2fs, ocfs2, likely also reiserfs, gfs2 and others) need to lock the
> > directory when it is being renamed into another directory. This is because we
> > need to update the parent pointer in the directory in that case and if that
> > races with other operation on the directory (in particular a conversion from
> > one directory format into another), bad things can happen.
> > 
> > So far we've done the locking in the filesystem code but recently Darrick
> > pointed out [2] that we've missed the RENAME_EXCHANGE case in our ext4 fix.
> > That one is particularly nasty because RENAME_EXCHANGE can arbitrarily mix
> > regular files and directories and proper lock ordering is not achievable in the
> > filesystems alone.
> > 
> > This patch set adds locking into vfs_rename() so that not only parent
> > directories but also moved inodes (regardless whether they are directories or
> > not) are locked when calling into the filesystem.
> 
> This locking is trauma inducing.
> 
> So I was staring at this for a long time and the thing that bothered me
> big time was that I couldn't easily figure out how we ended up with the
> locking scheme that we have. So I went digging. Corrections and
> additions very welcome...

This kept being stuck in the back of my mind so a few
additions/corrections.

> 
> Before 914a6e0ea12 ("Import 2.3.51pre1") locking for rename was based on
> s_vfs_rename_sem and i_sem. For both within- and across-directory
> renames s_vfs_rename_sem was acquired and the i_sem on the parent
> directories was acquired but the target wasn't locked.
> 
> Then 914a6e0ea12 ("Import 2.3.51pre1") introduced an additional i_zombie
> semaphore to protect against create, link, mknod, mkdir, unlink, and
> rmdir on the target. So i_zombie had to be acquired during

If I reconstructed this correctly, then the motivation behind the
introduction of i_zombie was that locking order for i_sem was solely
based on pointer order before 1b3d7c93c6d ("[PATCH] (2.5.4"). So when it
turned out that an existing directory that was replaced during a rename
had to be locked it would've meant deadlocks:

mv /a/b /a/c/d                          rmdir /a/c/d
pointer order: a < c                    pointer order: d > c

inode_lock(a->i_sem)
inode_lock(c->i_sem)                    inode_lock(d->i_sem)

// acquired separately
// after lock on parents
inode_lock(d->i_sem)                    inode_lock(c->i_sem)

and the immediate fix was to introduce a separate i_zombie mutex that
was used to protect against concurrent removals of the target directory.

> vfs_rename_dir() on both parent and the victim but only if the source
> was a directory. Back then RENAME_EXCHANGE didn't exist so if source was
> a directory then target if it existed must've been a directory as well.
> 
> The original reasoning behind only locking the target if the source was
> a directory was based on some filesystems not being able to deal with
> opened but unlinked directories.
> 
> The i_zombie finally died in 1b3d7c93c6d ("[PATCH] (2.5.4) death of
> ->i_zombie") and a new locking scheme was introduced. The

And that locking scheme realized that the topological ordering of the
subtrees we're operating on makes it possible to lock in ancestor
order. IOW, lock parent directories before child directories and if no
ancestor relationship exists lock by pointer ordering. This allowed to
kill i_zombie...

> s_vfs_rename_sem was now only used for across-directory renames. Instead
> of having i_zombie and i_sem only i_sem was left. Now, both
> vfs_rename_dir(/* if renaming directory */) and vfs_rename_other()
> grabbed i_sem on both parents and on the target. So now the target was
> always explicitly protected against a concurrent unlink or rmdir
> as that would be done as part of the rename operation and that race
> would just been awkward to allow afaict. Probably always was.

I think the main worry making the target directory locking necessary
during rename were also scenarios like the following. Because an
existing target directory that was about to be removed during rename
wasn't locked - in contrast to an explicit rmdir - it would've meant
that the following race should've been possible:

mv /a/b /a/c/d                          touch /a/c/d/e

inode_lock(a->i_sem)
inode_lock(c->i_sem)
// now we're removing d                 // lock on d isn't held by rename
                                        inode_lock(d->i_sem) 
                                        // add new file into d

iow, this would be racing adding a new link to the directory that's
in the process of being removed.

> 
> The locking of source however is a different story. This was introduced
> in 6cedba8962f4 ("vfs: take i_mutex on renamed file") to prevent new
> delegations from being acquired during rename, link, or unlink. So now
> both source and target were locked. The target seemingly because it
> would be unlinked in the filesystem's rename method and the source to
> prevent new delegations from being acquired. So, since leases can only
> be taken on regular files vfs_setlease()/generic_setlease() directories
> were never considered for locking. So the lock never had to be acquired
> for source directories.
> 
> So in any case, under the assumption that the broad strokes are correct
> there seems to be no inherent reason why locking source and target if
> they're directories couldn't be done if the ordering is well-defined.
> Which is what originally made me hesitate. IOW, given my current
> knowledge this seems ok.
> 
> Frankly, if we end up unconditionally locking source and target we're in
> a better place from a pure maintainability perspective as far as I'm
> concerned. Even if we end up taking the lock pointlessly for e.g., NFS
> with RENAME_EXCHANGE. The last thing we need is more conditions on when
> things are locked and why.
> 
> /me goes off into the weekend


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
