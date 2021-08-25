Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FB03F7DBE
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Aug 2021 23:32:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mJ0V4-0005G3-15; Wed, 25 Aug 2021 21:31:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1mJ0V3-0005Ft-67
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 Aug 2021 21:31:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=E0BfCWlxmBxiYxsShj2Ri+js269TVuCmn7ZykqJ+rXQ=; b=J0qkOEqfzmx31Lx+BalOEu7EJu
 effEHUHFnvgzwzxcmwCYkmJ4/EVsdajadyOiLh3sE2Geoh0osM2mz1DH6IU3sEmsY2MvXNDgIj6O0
 rSS4Vvl87hRLRiTP/38vRJWlCEZEyONoTES5FjU91JahHeTM+ZYLeZxHuhkPQiMZKuqU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=E0BfCWlxmBxiYxsShj2Ri+js269TVuCmn7ZykqJ+rXQ=; b=enxYCmkp4R6OOECTCHZA7NHfwX
 BQ3iN8pJ71IZbhhf67OnA5ilPRosJprztcHVux72aAb9U6WwXmAy72WvP7zMG35A2yvDWbGwsnl3W
 QUnLPdPbdGfbk23HgrKMx19+VId1LeHwaZ46M5IlgqeDJmwSQa28kSFMpQg9VuN7RxVM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mJ0V1-0011DE-Py
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 Aug 2021 21:31:57 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5593F610A1;
 Wed, 25 Aug 2021 21:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629927105;
 bh=GQpaLXOeTre1tnsmkfBCzjL/6oulqKgM/Nfy5gJGBlM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LeTFnAR42dMEaeLmLllAJtGnnuzmOTJ2zuduQj1EvtxFxgbK1UB8lG+6GyHEg6I+t
 cDe8Lssni0jvQce61VRK6rx2/ZjiKIQLgCCStezU1EXnHH4ON4miFWP4wni7blVQFC
 mRbQ/9f8/ECcFAFrPDCOMOPWF3HJHiJtslKIUGiu/9tL7afKYrOxmoPA385+pha4cG
 g1moZrSG/jIBFYHiwc9R/tcFozpBOiqeNT7Fcnl70vYRsFrU/5EMPXwe9pYkhvBJGM
 ENHEoI0x43sGo5BF7gLD4bij8B7W1lfmjpTwJh7QtHfhvqITuryuL0JfOOC4nc/TZi
 KYHc77utMzp3Q==
Date: Wed, 25 Aug 2021 14:31:43 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <YSa2v7oLMAWZP+b5@google.com>
References: <20210823170151.1434772-1-jaegeuk@kernel.org>
 <baa8a361-1a22-76a0-423d-4378178f7073@kernel.org>
 <YSUn1j22s/kc+hWS@google.com>
 <d0a48947-e4df-9b0f-735e-6b306a64c4fe@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d0a48947-e4df-9b0f-735e-6b306a64c4fe@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 08/25, Chao Yu wrote: > On 2021/8/25 1:09, Jaegeuk Kim
 wrote: > > On 08/24, Chao Yu wrote: > > > On 2021/8/24 1:01, Jaegeuk Kim wrote:
 > > > > We must flush dirty pages when calling fsync() during [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mJ0V1-0011DE-Py
Subject: Re: [f2fs-dev] [PATCH] f2fs: don't ignore writing pages on fsync
 during checkpoint=disable
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

On 08/25, Chao Yu wrote:
> On 2021/8/25 1:09, Jaegeuk Kim wrote:
> > On 08/24, Chao Yu wrote:
> > > On 2021/8/24 1:01, Jaegeuk Kim wrote:
> > > > We must flush dirty pages when calling fsync() during checkpoint=disable.
> > > > Returning zero makes inode being clear, which fails to flush them when
> > > > enabling checkpoint back even by sync_inodes_sb().
> > > 
> > > Without this patch, file can be persisted via checkpoint=enable as well, my
> > > testcase:
> > > 
> > > - mount -t f2fs -o checkpoint=disable,checkpoint_nomerge /dev/pmem0 /mnt/f2fs/
> > > - cp file /mnt/f2fs/
> > > - xfs_io /mnt/f2fs/file -c "fdatasync"
> > > - mount -o remount,checkpoint=enable /dev/pmem0 /mnt/f2fs/
> > > - umount /mnt/f2fs
> > > - mount /dev/pmem0 /mnt/f2fs
> > > - md5sum file /mnt/f2fs/file
> > > chksum values are the same.
> > > 
> > > Am I missing something?
> > 
> > I'm trying to address one subtle issue where a file has only NEW_ADDR by the
> 
> Oh, I doubt that we may failed to flush data of all inodes due to failures during
> sync_inodes_sb(), additionally, how about adding retry logic for sync_inodes_sb()
> if there is still any F2FS_DIRTY_DATA reference counts in f2fs_enable_checkpoint()
> to mitigate this issue, e.g.:
> 
> f2fs_enable_checkpoint()
> 
> 	do {
> 		sync_inode_sb();
> 		congestion_wait();
> 		cond_resched();
> 	} while (get_pages(sbi, F2FS_DIRTY_DATA) && retry_count--)
> 
> 	if (get_pages(sbi, F2FS_DIRTY_DATA))
> 		f2fs_warm("");

Agreed. Sent v2.

> 
> Thanks,
> 
> > checkpoint=disable test. I don't think this hurts anything but can see
> > some mitigation of the issue.
> > 
> > > 
> > > Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
