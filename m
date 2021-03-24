Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5B9347076
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Mar 2021 05:22:27 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lOv2C-0002AW-RM; Wed, 24 Mar 2021 04:22:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <jaegeuk@kernel.org>) id 1lOv2A-0002AM-3T
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 24 Mar 2021 04:22:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=41t+0XxoZcRTvp5msaJ+40jeQNA2lKYfXZeN4M9XPqw=; b=ffrEUuOszt+L+OSiiA5pDSI0LK
 6fKR633jitzqBAXabP+GoL8dF/6CsRlogXBARFNO/iU//7pHew8npoe8D4gqZMbkP/gSI+LtFtoac
 5jWknmEbsH74uVz7K/XbXDPPPBhTRpxyFFQMB577CrM9/G3LOt3MK0BxO70ab5OjoQsE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=41t+0XxoZcRTvp5msaJ+40jeQNA2lKYfXZeN4M9XPqw=; b=bR5D5Jqii9z9AYiujV0RQRdwxT
 3b95PLm7538JXeGhB8JJPPqJBKQcvKqGoplfP0XM1P7s3Ytj1WoOyvmgxUjXM6g50VGqDK6ssmsTo
 DNznnHdIdoPvjhWvaPd48jSbqpqw1QqFTDgswVlRXgD08pW1Wr6TbFLNVjU/mTvi3GUM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lOv26-0000qn-Ry
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 24 Mar 2021 04:22:18 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D22F6619E0;
 Wed, 24 Mar 2021 04:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616559723;
 bh=JUMOPNlFXenu8b+jfOqqANM0mC2Z8hnowz+qX2OCQdI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=u/J8/9w3HYkY1/vsmGH+9h6jcA1zy3y25aSDyz4I4wUoL5y/zey99NLVk1yYkJkQI
 of247FptTlN+R34Mu9VPMAZKEq8/mfAcuLWgN8WL0agEMIXPG+T9xVNmQ6HMFKsfuc
 pg40odZ7IjHy1+QTBIZEb0zqTZ89tGsVNql0c2vLqwlV0N2Q1sjHhWG1Ht+HaEk7Xm
 dxqbm5XgjoqBfHZtnIP1cl+LjnObf8dyyL1VNYwaZcdDbdhgfyC8eyaWBTw2BqJjpR
 9YIBf/StAB1L9Wxi1RTGi2iOHuiWkUpnuJ9w9QmZJslLnA2UbW3jxc1cyL5FsB64fW
 Sj6qTqC+r6ftg==
Date: Tue, 23 Mar 2021 21:22:01 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <YFq+aQW7eihFuSst@google.com>
References: <20210323064155.12582-1-yuchao0@huawei.com>
 <YFo16ADpWJ7OUAvK@google.com>
 <107e671d-68ea-1a74-521e-ab2b6fe36416@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <107e671d-68ea-1a74-521e-ab2b6fe36416@huawei.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lOv26-0000qn-Ry
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

On 03/24, Chao Yu wrote:
> On 2021/3/24 2:39, Jaegeuk Kim wrote:
> > On 03/23, Chao Yu wrote:
> > > This reverts commit 938a184265d75ea474f1c6fe1da96a5196163789.
> > > 
> > > Because that commit fails generic/050 testcase which expect failure
> > > during mount a recoverable readonly partition.
> > 
> > I think we need to change generic/050, since f2fs can recover this partition,
> 
> Well, not sure we can change that testcase, since it restricts all generic
> filesystems behavior. At least, ext4's behavior makes sense to me:
> 
> 	journal_dev_ro = bdev_read_only(journal->j_dev);
> 	really_read_only = bdev_read_only(sb->s_bdev) | journal_dev_ro;
> 
> 	if (journal_dev_ro && !sb_rdonly(sb)) {
> 		ext4_msg(sb, KERN_ERR,
> 			 "journal device read-only, try mounting with '-o ro'");
> 		err = -EROFS;
> 		goto err_out;
> 	}
> 
> 	if (ext4_has_feature_journal_needs_recovery(sb)) {
> 		if (sb_rdonly(sb)) {
> 			ext4_msg(sb, KERN_INFO, "INFO: recovery "
> 					"required on readonly filesystem");
> 			if (really_read_only) {
> 				ext4_msg(sb, KERN_ERR, "write access "
> 					"unavailable, cannot proceed "
> 					"(try mounting with noload)");
> 				err = -EROFS;
> 				goto err_out;
> 			}
> 			ext4_msg(sb, KERN_INFO, "write access will "
> 			       "be enabled during recovery");
> 		}
> 	}
> 
> > even though using it as readonly. And, valid checkpoint can allow for user to
> > read all the data without problem.
> 
> >>   		if (f2fs_hw_is_readonly(sbi)) {
> 
> Since device is readonly now, all write to the device will fail, checkpoint can
> not persist recovered data, after page cache is expired, user can see stale data.

My point is, after mount with ro, there'll be no data write which preserves the
current status. So, in the next time, we can recover fsync'ed data later, if
user succeeds to mount as rw. Another point is, with the current checkpoint, we
should not have any corrupted metadata. So, why not giving a chance to show what
data remained to user? I think this can be doable only with CoW filesystems.

> 
> Am I missing something?
> 
> Thanks,
> 
> > 
> > > 
> > > Fixes: 938a184265d7 ("f2fs: give a warning only for readonly partition")
> > > Signed-off-by: Chao Yu <yuchao0@huawei.com>
> > > ---
> > >   fs/f2fs/super.c | 8 +++++---
> > >   1 file changed, 5 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> > > index b48281642e98..2b78ee11f093 100644
> > > --- a/fs/f2fs/super.c
> > > +++ b/fs/f2fs/super.c
> > > @@ -3952,10 +3952,12 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
> > >   		 * previous checkpoint was not done by clean system shutdown.
> > >   		 */
> > >   		if (f2fs_hw_is_readonly(sbi)) {
> > > -			if (!is_set_ckpt_flags(sbi, CP_UMOUNT_FLAG))
> > > +			if (!is_set_ckpt_flags(sbi, CP_UMOUNT_FLAG)) {
> > > +				err = -EROFS;
> > >   				f2fs_err(sbi, "Need to recover fsync data, but write access unavailable");
> > > -			else
> > > -				f2fs_info(sbi, "write access unavailable, skipping recovery");
> > > +				goto free_meta;
> > > +			}
> > > +			f2fs_info(sbi, "write access unavailable, skipping recovery");
> > >   			goto reset_checkpoint;
> > >   		}
> > > -- 
> > > 2.29.2
> > .
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
