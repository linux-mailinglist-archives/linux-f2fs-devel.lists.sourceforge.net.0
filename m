Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 892FD34AD5B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Mar 2021 18:31:03 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lPqIP-0002Gn-KG; Fri, 26 Mar 2021 17:30:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1lPqIO-0002GU-2e
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 26 Mar 2021 17:30:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7KakKf8y/pe3MXzB49ZNfmJhGAOB5JpA1V5GeSJp4+E=; b=CJepglmwO48d97WqDFqz4KmsP9
 sEabKQf3XcyLpm9Kv6Q41sLhy/lcINSOusuzh6kUow1z8VO1wx5s2Wq6HGugUPldtPT6q77Wq55pf
 1pIce0wTMBETFsVtPMHy+CMkTYFAM16CxE6ynF49GugW3CYn6S/at+wpeTVt/N+FmDbA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7KakKf8y/pe3MXzB49ZNfmJhGAOB5JpA1V5GeSJp4+E=; b=PmX38w20PsVZIwlNWAoxBLgMno
 DLj0zOnO1bvnqU013tTtM0TBSm4QT7laDBqLrwrO8OPSdvhXZmvbwAIy32Sv3ZsTBHuWs73X38zxu
 9pcgHly1CIz7yBg+31j6O2Ck1hmt+EwvrG2ASYvCUcZFetDJX9QShmTi2GMT7iuWKmgM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lPqHw-0000ri-OF
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 26 Mar 2021 17:30:51 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6551461999;
 Fri, 26 Mar 2021 17:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616779815;
 bh=eWlM2lnbwbQVyDrsp6UryCIrw7BBYtzLoxP7VjitbaY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DJ/xTQqV8YZzHorUDvsuXD3Gvj1kluOXzg6A2CDunucl99TY4WtLt2aCG9+CMCCRb
 6MKU5EGNNuJ34X19rjxlEnzcpeO9UzPYezPHSpVCZiJI2XeZd3ohi5eqc0l1sUzZn9
 3Fgzmw9wnFfhn62/GZFoO1Ch4DgXBfDLpPYhhdurL3fDUMCCjM4V386OXb75w7P+o2
 aQBVLku+2LRZvMRK+ideJaJ3vIoDrvNmPm+HYDUWbzlkBnQIXAnKdpz8FMPOumywFN
 mw9+Xd9BEd2GioGVyKqFHOh8H6bVgm2FHNYdxIpLhmlBJPQ7PmYuVOa7MsLJyIb7Tn
 Y00SMt4HUqKbg==
Date: Fri, 26 Mar 2021 10:30:13 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <YF4aJYVwOVtWsAbH@google.com>
References: <20210323064155.12582-1-yuchao0@huawei.com>
 <YFo16ADpWJ7OUAvK@google.com>
 <107e671d-68ea-1a74-521e-ab2b6fe36416@huawei.com>
 <YFq+aQW7eihFuSst@google.com>
 <c5850f4b-ebe8-bc34-10c6-ab27d562d621@huawei.com>
 <YFvA6uzDLeD7dRdY@google.com>
 <8b0b0782-a667-9edc-5ee9-98ac9f67b7b7@huawei.com>
 <c1e48546-f61b-5db9-13b6-6430ce368661@huawei.com>
 <YF02sFKa778eomr9@google.com>
 <84688aac-75da-1226-df4d-47ac97087c51@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <84688aac-75da-1226-df4d-47ac97087c51@huawei.com>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 TIME_LIMIT_EXCEEDED    Exceeded time limit / deadline
X-Headers-End: 1lPqHw-0000ri-OF
Subject: Re: [f2fs-dev] [PATCH] Revert "f2fs: give a warning only for
 readonly partition"
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 03/26, Chao Yu wrote:
> On 2021/3/26 9:19, Jaegeuk Kim wrote:
> > On 03/26, Chao Yu wrote:
> > > On 2021/3/25 9:59, Chao Yu wrote:
> > > > On 2021/3/25 6:44, Jaegeuk Kim wrote:
> > > > > On 03/24, Chao Yu wrote:
> > > > > > On 2021/3/24 12:22, Jaegeuk Kim wrote:
> > > > > > > On 03/24, Chao Yu wrote:
> > > > > > > > On 2021/3/24 2:39, Jaegeuk Kim wrote:
> > > > > > > > > On 03/23, Chao Yu wrote:
> > > > > > > > > > This reverts commit 938a184265d75ea474f1c6fe1da96a5196163789.
> > > > > > > > > > 
> > > > > > > > > > Because that commit fails generic/050 testcase which expect failure
> > > > > > > > > > during mount a recoverable readonly partition.
> > > > > > > > > 
> > > > > > > > > I think we need to change generic/050, since f2fs can recover this partition,
> > > > > > > > 
> > > > > > > > Well, not sure we can change that testcase, since it restricts all generic
> > > > > > > > filesystems behavior. At least, ext4's behavior makes sense to me:
> > > > > > > > 
> > > > > > > > 	journal_dev_ro = bdev_read_only(journal->j_dev);
> > > > > > > > 	really_read_only = bdev_read_only(sb->s_bdev) | journal_dev_ro;
> > > > > > > > 
> > > > > > > > 	if (journal_dev_ro && !sb_rdonly(sb)) {
> > > > > > > > 		ext4_msg(sb, KERN_ERR,
> > > > > > > > 			 "journal device read-only, try mounting with '-o ro'");
> > > > > > > > 		err = -EROFS;
> > > > > > > > 		goto err_out;
> > > > > > > > 	}
> > > > > > > > 
> > > > > > > > 	if (ext4_has_feature_journal_needs_recovery(sb)) {
> > > > > > > > 		if (sb_rdonly(sb)) {
> > > > > > > > 			ext4_msg(sb, KERN_INFO, "INFO: recovery "
> > > > > > > > 					"required on readonly filesystem");
> > > > > > > > 			if (really_read_only) {
> > > > > > > > 				ext4_msg(sb, KERN_ERR, "write access "
> > > > > > > > 					"unavailable, cannot proceed "
> > > > > > > > 					"(try mounting with noload)");
> > > > > > > > 				err = -EROFS;
> > > > > > > > 				goto err_out;
> > > > > > > > 			}
> > > > > > > > 			ext4_msg(sb, KERN_INFO, "write access will "
> > > > > > > > 			       "be enabled during recovery");
> > > > > > > > 		}
> > > > > > > > 	}
> > > > > > > > 
> > > > > > > > > even though using it as readonly. And, valid checkpoint can allow for user to
> > > > > > > > > read all the data without problem.
> > > > > > > > 
> > > > > > > > > >       		if (f2fs_hw_is_readonly(sbi)) {
> > > > > > > > 
> > > > > > > > Since device is readonly now, all write to the device will fail, checkpoint can
> > > > > > > > not persist recovered data, after page cache is expired, user can see stale data.
> > > > > > > 
> > > > > > > My point is, after mount with ro, there'll be no data write which preserves the
> > > > > > > current status. So, in the next time, we can recover fsync'ed data later, if
> > > > > > > user succeeds to mount as rw. Another point is, with the current checkpoint, we
> > > > > > > should not have any corrupted metadata. So, why not giving a chance to show what
> > > > > > > data remained to user? I think this can be doable only with CoW filesystems.
> > > > > > 
> > > > > > I guess we're talking about the different things...
> > > > > > 
> > > > > > Let me declare two different readonly status:
> > > > > > 
> > > > > > 1. filesystem readonly: file system is mount with ro mount option, and
> > > > > > app from userspace can not modify any thing of filesystem, but filesystem
> > > > > > itself can modify data on device since device may be writable.
> > > > > > 
> > > > > > 2. device readonly: device is set to readonly status via 'blockdev --setro'
> > > > > > command, and then filesystem should never issue any write IO to the device.
> > > > > > 
> > > > > > So, what I mean is, *when device is readonly*, rather than f2fs mountpoint
> > > > > > is readonly (f2fs_hw_is_readonly() returns true as below code, instead of
> > > > > > f2fs_readonly() returns true), in this condition, we should not issue any
> > > > > > write IO to device anyway, because, AFAIK, write IO will fail due to
> > > > > > bio_check_ro() check.
> > > > > 
> > > > > In that case, mount(2) will try readonly, no?
> > > > 
> > > > Yes, if device is readonly, mount (2) can not mount/remount device to rw
> > > > mountpoint.
> > > 
> > > Any other concern about this patch?
> > 
> > Indeed we're talking about different things. :)
> > 
> > This case is mount(ro) with device(ro) having some data to recover.
> > My point is why not giving a chance to mount(ro) to show the current data
> > covered by a valid checkpoint. This doesn't change anything in the disk,
> Got your idea.
> 
> IMO, it has potential issue in above condition:
> 
> >>>>>>> Since device is readonly now, all write to the device will fail, checkpoint can
> >>>>>>> not persist recovered data, after page cache is expired, user can see stale data.
> 
> e.g.
> 
> Recovery writes one inode and then triggers a checkpoint, all writes fail

I'm confused. Currently we don't trigger the roll-forward recovery.

> due to device is readonly, once inode cache is reclaimed by vm, user will see
> old inode when reloading it, or even see corrupted fs if partial meta inode's
> cache is expired.
> 
> Thoughts?
> 
> Thanks,
> 
> > and in the next time, it allows mount(rw|ro) with device(rw) to recover
> > the data seamlessly.
> > 
> > > 
> > > Thanks,
> > > 
> > > > 
> > > > Thanks,
> > > > 
> > > > > 
> > > > > # blockdev --setro /dev/vdb
> > > > > # mount -t f2fs /dev/vdb /mnt/test/
> > > > > mount: /mnt/test: WARNING: source write-protected, mounted read-only.
> > > > > 
> > > > > > 
> > > > > >     		if (f2fs_hw_is_readonly(sbi)) {
> > > > > > -			if (!is_set_ckpt_flags(sbi, CP_UMOUNT_FLAG)) {
> > > > > > -				err = -EROFS;
> > > > > > +			if (!is_set_ckpt_flags(sbi, CP_UMOUNT_FLAG))
> > > > > >     				f2fs_err(sbi, "Need to recover fsync data, but write access unavailable");
> > > > > > -				goto free_meta;
> > > > > > -			}
> > > > > > -			f2fs_info(sbi, "write access unavailable, skipping recovery");
> > > > > > +			else
> > > > > > +				f2fs_info(sbi, "write access unavailable, skipping recovery");
> > > > > >     			goto reset_checkpoint;
> > > > > >     		}
> > > > > > 
> > > > > > For the case of filesystem is readonly and device is writable, it's fine
> > > > > > to do recovery in order to let user to see fsynced data.
> > > > > > 
> > > > > > Thanks,
> > > > > > 
> > > > > > > 
> > > > > > > > 
> > > > > > > > Am I missing something?
> > > > > > > > 
> > > > > > > > Thanks,
> > > > > > > > 
> > > > > > > > > 
> > > > > > > > > > 
> > > > > > > > > > Fixes: 938a184265d7 ("f2fs: give a warning only for readonly partition")
> > > > > > > > > > Signed-off-by: Chao Yu <yuchao0@huawei.com>
> > > > > > > > > > ---
> > > > > > > > > >       fs/f2fs/super.c | 8 +++++---
> > > > > > > > > >       1 file changed, 5 insertions(+), 3 deletions(-)
> > > > > > > > > > 
> > > > > > > > > > diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> > > > > > > > > > index b48281642e98..2b78ee11f093 100644
> > > > > > > > > > --- a/fs/f2fs/super.c
> > > > > > > > > > +++ b/fs/f2fs/super.c
> > > > > > > > > > @@ -3952,10 +3952,12 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
> > > > > > > > > >       		 * previous checkpoint was not done by clean system shutdown.
> > > > > > > > > >       		 */
> > > > > > > > > >       		if (f2fs_hw_is_readonly(sbi)) {
> > > > > > > > > > -			if (!is_set_ckpt_flags(sbi, CP_UMOUNT_FLAG))
> > > > > > > > > > +			if (!is_set_ckpt_flags(sbi, CP_UMOUNT_FLAG)) {
> > > > > > > > > > +				err = -EROFS;
> > > > > > > > > >       				f2fs_err(sbi, "Need to recover fsync data, but write access unavailable");
> > > > > > > > > > -			else
> > > > > > > > > > -				f2fs_info(sbi, "write access unavailable, skipping recovery");
> > > > > > > > > > +				goto free_meta;
> > > > > > > > > > +			}
> > > > > > > > > > +			f2fs_info(sbi, "write access unavailable, skipping recovery");
> > > > > > > > > >       			goto reset_checkpoint;
> > > > > > > > > >       		}
> > > > > > > > > > -- 
> > > > > > > > > > 2.29.2
> > > > > > > > > .
> > > > > > > > > 
> > > > > > > .
> > > > > > > 
> > > > > .
> > > > > 
> > > > 
> > > > 
> > > > _______________________________________________
> > > > Linux-f2fs-devel mailing list
> > > > Linux-f2fs-devel@lists.sourceforge.net
> > > > https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> > > > .
> > > > 
> > .
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
