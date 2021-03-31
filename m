Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE7B34F66B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 31 Mar 2021 03:58:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lRQ7d-00020q-2Q; Wed, 31 Mar 2021 01:58:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1lRQ7b-00020c-M8
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 31 Mar 2021 01:58:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5YfCydSS5GAHJLQmddLvMt1Yn/MzSsuxECm0rigLPk8=; b=PgjkNhmWEB/zg3XATP4lRbeeIu
 GBtwGQlcGcDJha/CkqAd531a1giU0M/buzQec8wsYoFoCJtRSIaQqGJ55Y4Mwkx3yyz5oC0Q2kjlf
 SMi1lZekRjA0zYkDxPiA4iw4m4R44MK51RpH3nNaCW9ACI47Z35LRmTG+7Sz7xxNdnEQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5YfCydSS5GAHJLQmddLvMt1Yn/MzSsuxECm0rigLPk8=; b=Exdm6GEmaGqQMx366F5EBUJNZl
 MqksBfxX5UST0Cit4Hz3iorriB0J8orR9QYiLKe1fPCWcug877mzTFd2t9KKQgYFpV0/eIDDSe1UW
 uoCNT78HLmose4ZAk64qhpFqwtUPBqyxKIFS2VPrquCc2MrpCb8VTflDD9owbqkOmNQk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lRQ7R-00F6pr-J8
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 31 Mar 2021 01:58:15 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DF1D2619B1;
 Wed, 31 Mar 2021 01:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617155876;
 bh=w65uvHVY+51Wt+ySuWN/EFojpBAJPntcBukMYf783d0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jOX7tJyuD97xAvcSdXtFiV8VZNVDWlfo3jX0RHeCGGT+VVgdYpOMev3tqml/eF0uf
 RD7cRJ0t8lcVL5Sl2TlqUQVVKkMGXgK+yqt/iCvSvIPdrB6pQ46X1PhOifTT5OTTm8
 42vp7Vh7Nznniut02LA4XylPuLDrrpUC4FASscF5Jl/OM7srQO/htXNSpq6GVOLa2J
 zgxilLZkpko0inT3zmAR5YuUvPJadzh4P7cJJnPVeHiOJuuOUgVmIf4DGROK8dfTRC
 utzGjaNlFmgLzoz1rC9jTNawnvbPIysmCv4toeThygthEcqmdSpZhNOv2kjkfRGRGB
 MkUtYHVDCWFuA==
Date: Tue, 30 Mar 2021 18:57:54 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <YGPXIhdqWHAysqeY@google.com>
References: <YFq+aQW7eihFuSst@google.com>
 <c5850f4b-ebe8-bc34-10c6-ab27d562d621@huawei.com>
 <YFvA6uzDLeD7dRdY@google.com>
 <8b0b0782-a667-9edc-5ee9-98ac9f67b7b7@huawei.com>
 <c1e48546-f61b-5db9-13b6-6430ce368661@huawei.com>
 <YF02sFKa778eomr9@google.com>
 <84688aac-75da-1226-df4d-47ac97087c51@huawei.com>
 <YF4aJYVwOVtWsAbH@google.com>
 <4b64099b-064d-43a8-461d-b54007f2c16c@huawei.com>
 <dad9c2df-02af-5df5-1dd1-9ee1fe91d229@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dad9c2df-02af-5df5-1dd1-9ee1fe91d229@huawei.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lRQ7R-00F6pr-J8
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

On 03/27, Chao Yu wrote:
> On 2021/3/27 9:52, Chao Yu wrote:
> > On 2021/3/27 1:30, Jaegeuk Kim wrote:
> > > On 03/26, Chao Yu wrote:
> > > > On 2021/3/26 9:19, Jaegeuk Kim wrote:
> > > > > On 03/26, Chao Yu wrote:
> > > > > > On 2021/3/25 9:59, Chao Yu wrote:
> > > > > > > On 2021/3/25 6:44, Jaegeuk Kim wrote:
> > > > > > > > On 03/24, Chao Yu wrote:
> > > > > > > > > On 2021/3/24 12:22, Jaegeuk Kim wrote:
> > > > > > > > > > On 03/24, Chao Yu wrote:
> > > > > > > > > > > On 2021/3/24 2:39, Jaegeuk Kim wrote:
> > > > > > > > > > > > On 03/23, Chao Yu wrote:
> > > > > > > > > > > > > This reverts commit 938a184265d75ea474f1c6fe1da96a5196163789.
> > > > > > > > > > > > > 
> > > > > > > > > > > > > Because that commit fails generic/050 testcase which expect failure
> > > > > > > > > > > > > during mount a recoverable readonly partition.
> > > > > > > > > > > > 
> > > > > > > > > > > > I think we need to change generic/050, since f2fs can recover this partition,
> > > > > > > > > > > 
> > > > > > > > > > > Well, not sure we can change that testcase, since it restricts all generic
> > > > > > > > > > > filesystems behavior. At least, ext4's behavior makes sense to me:
> > > > > > > > > > > 
> > > > > > > > > > > 	journal_dev_ro = bdev_read_only(journal->j_dev);
> > > > > > > > > > > 	really_read_only = bdev_read_only(sb->s_bdev) | journal_dev_ro;
> > > > > > > > > > > 
> > > > > > > > > > > 	if (journal_dev_ro && !sb_rdonly(sb)) {
> > > > > > > > > > > 		ext4_msg(sb, KERN_ERR,
> > > > > > > > > > > 			 "journal device read-only, try mounting with '-o ro'");
> > > > > > > > > > > 		err = -EROFS;
> > > > > > > > > > > 		goto err_out;
> > > > > > > > > > > 	}
> > > > > > > > > > > 
> > > > > > > > > > > 	if (ext4_has_feature_journal_needs_recovery(sb)) {
> > > > > > > > > > > 		if (sb_rdonly(sb)) {
> > > > > > > > > > > 			ext4_msg(sb, KERN_INFO, "INFO: recovery "
> > > > > > > > > > > 					"required on readonly filesystem");
> > > > > > > > > > > 			if (really_read_only) {
> > > > > > > > > > > 				ext4_msg(sb, KERN_ERR, "write access "
> > > > > > > > > > > 					"unavailable, cannot proceed "
> > > > > > > > > > > 					"(try mounting with noload)");
> > > > > > > > > > > 				err = -EROFS;
> > > > > > > > > > > 				goto err_out;
> > > > > > > > > > > 			}
> > > > > > > > > > > 			ext4_msg(sb, KERN_INFO, "write access will "
> > > > > > > > > > > 			       "be enabled during recovery");
> > > > > > > > > > > 		}
> > > > > > > > > > > 	}
> > > > > > > > > > > 
> > > > > > > > > > > > even though using it as readonly. And, valid checkpoint can allow for user to
> > > > > > > > > > > > read all the data without problem.
> > > > > > > > > > > 
> > > > > > > > > > > > >         		if (f2fs_hw_is_readonly(sbi)) {
> > > > > > > > > > > 
> > > > > > > > > > > Since device is readonly now, all write to the device will fail, checkpoint can
> > > > > > > > > > > not persist recovered data, after page cache is expired, user can see stale data.
> > > > > > > > > > 
> > > > > > > > > > My point is, after mount with ro, there'll be no data write which preserves the
> > > > > > > > > > current status. So, in the next time, we can recover fsync'ed data later, if
> > > > > > > > > > user succeeds to mount as rw. Another point is, with the current checkpoint, we
> > > > > > > > > > should not have any corrupted metadata. So, why not giving a chance to show what
> > > > > > > > > > data remained to user? I think this can be doable only with CoW filesystems.
> > > > > > > > > 
> > > > > > > > > I guess we're talking about the different things...
> > > > > > > > > 
> > > > > > > > > Let me declare two different readonly status:
> > > > > > > > > 
> > > > > > > > > 1. filesystem readonly: file system is mount with ro mount option, and
> > > > > > > > > app from userspace can not modify any thing of filesystem, but filesystem
> > > > > > > > > itself can modify data on device since device may be writable.
> > > > > > > > > 
> > > > > > > > > 2. device readonly: device is set to readonly status via 'blockdev --setro'
> > > > > > > > > command, and then filesystem should never issue any write IO to the device.
> > > > > > > > > 
> > > > > > > > > So, what I mean is, *when device is readonly*, rather than f2fs mountpoint
> > > > > > > > > is readonly (f2fs_hw_is_readonly() returns true as below code, instead of
> > > > > > > > > f2fs_readonly() returns true), in this condition, we should not issue any
> > > > > > > > > write IO to device anyway, because, AFAIK, write IO will fail due to
> > > > > > > > > bio_check_ro() check.
> > > > > > > > 
> > > > > > > > In that case, mount(2) will try readonly, no?
> > > > > > > 
> > > > > > > Yes, if device is readonly, mount (2) can not mount/remount device to rw
> > > > > > > mountpoint.
> > > > > > 
> > > > > > Any other concern about this patch?
> > > > > 
> > > > > Indeed we're talking about different things. :)
> > > > > 
> > > > > This case is mount(ro) with device(ro) having some data to recover.
> > > > > My point is why not giving a chance to mount(ro) to show the current data
> > > > > covered by a valid checkpoint. This doesn't change anything in the disk,
> > > > Got your idea.
> > > > 
> > > > IMO, it has potential issue in above condition:
> > > > 
> > > > > > > > > > > Since device is readonly now, all write to the device will fail, checkpoint can
> > > > > > > > > > > not persist recovered data, after page cache is expired, user can see stale data.
> > > > 
> > > > e.g.
> > > > 
> > > > Recovery writes one inode and then triggers a checkpoint, all writes fail
> > > 
> > > I'm confused. Currently we don't trigger the roll-forward recovery.
> > 
> > Oh, my miss, sorry. :-P
> > 
> > My point is in this condition we can return error and try to notice user to
> > mount with disable_roll_forward or norecovery option, then at least user can
> > know he should not expect last fsynced data in newly mounted image.
> > 
> > Or we can use f2fs_recover_fsync_data() to check whether there is fsynced data,
> > if there is no such data, then let mount() succeed.
> 
> Something like this, maybe:
> 
> ---
>  fs/f2fs/super.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 954b1fe97d67..5e1a1caf412d 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -3966,10 +3966,19 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>  		 * previous checkpoint was not done by clean system shutdown.
>  		 */
>  		if (f2fs_hw_is_readonly(sbi)) {
> -			if (!is_set_ckpt_flags(sbi, CP_UMOUNT_FLAG))
> -				f2fs_err(sbi, "Need to recover fsync data, but write access unavailable");
> -			else
> -				f2fs_info(sbi, "write access unavailable, skipping recovery");
> +			if (!is_set_ckpt_flags(sbi, CP_UMOUNT_FLAG)) {
> +				err = f2fs_recover_fsync_data(sbi, true);

Can we do like this?

				if (err > 0) {
					err = -EROFS;
					f2fs_err(sbi, "Need to recover fsync data, but "
						"write access unavailable, please try "
						"mount w/ disable_roll_forward or norecovery");
				}
				if (err < 0)
					goto free_meta;
			}
			f2fs_info(sbi, "write access unavailable, skipping recovery");
			goto reset_checkpoint;

> +				if (!err)
> +					goto reset_checkpoint;
> +				else if (err < 0)
> +					goto free_meta;
> +				err = -EROFS;
> +				f2fs_err(sbi, "Need to recover fsync data, but "
> +					"write access unavailable, please try "
> +					"mount w/ disable_roll_forward or norecovery");
> +				goto free_meta;
> +			}
> +			f2fs_info(sbi, "write access unavailable, skipping recovery");
>  			goto reset_checkpoint;
>  		}
> 
> -- 
> 2.29.2
> 
> Thanks,
> 
> > 
> > Thanks,
> > 
> > > 
> > > > due to device is readonly, once inode cache is reclaimed by vm, user will see
> > > > old inode when reloading it, or even see corrupted fs if partial meta inode's
> > > > cache is expired.
> > > > 
> > > > Thoughts?
> > > > 
> > > > Thanks,
> > > > 
> > > > > and in the next time, it allows mount(rw|ro) with device(rw) to recover
> > > > > the data seamlessly.
> > > > > 
> > > > > > 
> > > > > > Thanks,
> > > > > > 
> > > > > > > 
> > > > > > > Thanks,
> > > > > > > 
> > > > > > > > 
> > > > > > > > # blockdev --setro /dev/vdb
> > > > > > > > # mount -t f2fs /dev/vdb /mnt/test/
> > > > > > > > mount: /mnt/test: WARNING: source write-protected, mounted read-only.
> > > > > > > > 
> > > > > > > > > 
> > > > > > > > >       		if (f2fs_hw_is_readonly(sbi)) {
> > > > > > > > > -			if (!is_set_ckpt_flags(sbi, CP_UMOUNT_FLAG)) {
> > > > > > > > > -				err = -EROFS;
> > > > > > > > > +			if (!is_set_ckpt_flags(sbi, CP_UMOUNT_FLAG))
> > > > > > > > >       				f2fs_err(sbi, "Need to recover fsync data, but write access unavailable");
> > > > > > > > > -				goto free_meta;
> > > > > > > > > -			}
> > > > > > > > > -			f2fs_info(sbi, "write access unavailable, skipping recovery");
> > > > > > > > > +			else
> > > > > > > > > +				f2fs_info(sbi, "write access unavailable, skipping recovery");
> > > > > > > > >       			goto reset_checkpoint;
> > > > > > > > >       		}
> > > > > > > > > 
> > > > > > > > > For the case of filesystem is readonly and device is writable, it's fine
> > > > > > > > > to do recovery in order to let user to see fsynced data.
> > > > > > > > > 
> > > > > > > > > Thanks,
> > > > > > > > > 
> > > > > > > > > > 
> > > > > > > > > > > 
> > > > > > > > > > > Am I missing something?
> > > > > > > > > > > 
> > > > > > > > > > > Thanks,
> > > > > > > > > > > 
> > > > > > > > > > > > 
> > > > > > > > > > > > > 
> > > > > > > > > > > > > Fixes: 938a184265d7 ("f2fs: give a warning only for readonly partition")
> > > > > > > > > > > > > Signed-off-by: Chao Yu <yuchao0@huawei.com>
> > > > > > > > > > > > > ---
> > > > > > > > > > > > >         fs/f2fs/super.c | 8 +++++---
> > > > > > > > > > > > >         1 file changed, 5 insertions(+), 3 deletions(-)
> > > > > > > > > > > > > 
> > > > > > > > > > > > > diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> > > > > > > > > > > > > index b48281642e98..2b78ee11f093 100644
> > > > > > > > > > > > > --- a/fs/f2fs/super.c
> > > > > > > > > > > > > +++ b/fs/f2fs/super.c
> > > > > > > > > > > > > @@ -3952,10 +3952,12 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
> > > > > > > > > > > > >         		 * previous checkpoint was not done by clean system shutdown.
> > > > > > > > > > > > >         		 */
> > > > > > > > > > > > >         		if (f2fs_hw_is_readonly(sbi)) {
> > > > > > > > > > > > > -			if (!is_set_ckpt_flags(sbi, CP_UMOUNT_FLAG))
> > > > > > > > > > > > > +			if (!is_set_ckpt_flags(sbi, CP_UMOUNT_FLAG)) {
> > > > > > > > > > > > > +				err = -EROFS;
> > > > > > > > > > > > >         				f2fs_err(sbi, "Need to recover fsync data, but write access unavailable");
> > > > > > > > > > > > > -			else
> > > > > > > > > > > > > -				f2fs_info(sbi, "write access unavailable, skipping recovery");
> > > > > > > > > > > > > +				goto free_meta;
> > > > > > > > > > > > > +			}
> > > > > > > > > > > > > +			f2fs_info(sbi, "write access unavailable, skipping recovery");
> > > > > > > > > > > > >         			goto reset_checkpoint;
> > > > > > > > > > > > >         		}
> > > > > > > > > > > > > -- 
> > > > > > > > > > > > > 2.29.2
> > > > > > > > > > > > .
> > > > > > > > > > > > 
> > > > > > > > > > .
> > > > > > > > > > 
> > > > > > > > .
> > > > > > > > 
> > > > > > > 
> > > > > > > 
> > > > > > > _______________________________________________
> > > > > > > Linux-f2fs-devel mailing list
> > > > > > > Linux-f2fs-devel@lists.sourceforge.net
> > > > > > > https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> > > > > > > .
> > > > > > > 
> > > > > .
> > > > > 
> > > .
> > > 
> > 
> > 
> > _______________________________________________
> > Linux-f2fs-devel mailing list
> > Linux-f2fs-devel@lists.sourceforge.net
> > https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> > .
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
