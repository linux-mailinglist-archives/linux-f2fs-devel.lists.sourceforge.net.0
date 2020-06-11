Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EE05B1F5FC3
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 11 Jun 2020 03:57:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jjCSk-00071i-PQ; Thu, 11 Jun 2020 01:57:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jjCSi-00071R-Q2
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 11 Jun 2020 01:57:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rCEELQ10cAEaYFE3jTuOOYH4NFcDNsZP5Kog6izu/lA=; b=OpGAm5c4y7U2O9Ygju92RqZef6
 54bwQkNwVl1NazJtxZJOESZHgKW4nVwiy7Jfk9R39Pqd63sP3o9M4l98Vr8aRljDStek/b7F5mXUM
 oay4CHpaNFstHVd8NG8ppwyq1hBl7WANyJn81W/uTuDd1drmuACez34ESkGV1VKsQtxo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rCEELQ10cAEaYFE3jTuOOYH4NFcDNsZP5Kog6izu/lA=; b=Hrn32vCKOZ487Fts+Osp9J+0gG
 Avao5y53WvDtL5TtIT4vRfrOQKgMPohXcdFmJD7+Iiw1e+kqSOJeXBQQVXYxhIYn+MGdXFFVnzmxq
 rvssUtUeCseMDvjVcJHEgs5qqn/DCFhFqm7ppUWtYtY2xiEYfGipHTYJi8Kis3SQbht4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jjCSh-001ZpG-HW
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 11 Jun 2020 01:57:00 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5A1A2206FA;
 Thu, 11 Jun 2020 01:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591840612;
 bh=beGVc6bpHeiEA8//p9B6LnBQfT/NH139uiChyIVI8JM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ENNLJwPCrxED6GSeVc0lD6UMH8JWHDkxknOIE9Liy/jbqoCAuPZvUb2lHh+7Hi11g
 lpQyL9iP/WG0xcg97vS2Zl+6LgrB7/hJXnWZ2g8ocl6qMmFfXLuMayp2HXHZk/IAwB
 oc570nKJrn8AsZfX6H9xyEsZVETqdz6tHAvtUJY4=
Date: Wed, 10 Jun 2020 18:56:51 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <20200611015651.GD1339@sol.localdomain>
References: <20200609060137.143501-1-daeho43@gmail.com>
 <20200609165107.GA228564@gmail.com>
 <CACOAw_xEZ+au9yhFerq9amkRO62Dzxj7h71gEc=i16ReYu5xrg@mail.gmail.com>
 <20200610031532.GA6286@sol.localdomain>
 <CACOAw_wErOPC=Kf3UU8nFGhWRy84ZnCeJbsyPhSCcXv51B_XxQ@mail.gmail.com>
 <CACOAw_zka6d06RxFOUTwEV7B6o8A2-_6FvqWh_A1nJ0+7FU9yQ@mail.gmail.com>
 <CACOAw_yc4hxdyxyO+Lb4MArHek1tP4wxCq0tezWOocgqvK+tqg@mail.gmail.com>
 <20200611000037.GC1339@sol.localdomain>
 <CACOAw_xqHnL0MthPykSrKJ8OXez-XigCFgC-vwm_keEZh_g8zw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACOAw_xqHnL0MthPykSrKJ8OXez-XigCFgC-vwm_keEZh_g8zw@mail.gmail.com>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jjCSh-001ZpG-HW
Subject: Re: [f2fs-dev] [PATCH] f2fs: add F2FS_IOC_SEC_TRIM_FILE ioctl
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jun 11, 2020 at 09:23:23AM +0900, Daeho Jeong wrote:
> Yes, I saw the implementation in vfs_write().
> But if we use mnt_want_write_file() here, it'll call mnt_clone_write()
> internally if the file is already open in write mode.
> Don't you think the below thing is needed? We can increase the counter
> each of them, open and ioctl, like other filesystems such as ext4.
> 
> int mnt_clone_write(struct vfsmount *mnt)
> {
>         /* superblock may be r/o */
>         if (__mnt_is_readonly(mnt))
>                 return -EROFS;
>         preempt_disable();
>         mnt_inc_writers(real_mount(mnt));
>         preempt_enable();
>         return 0;
> }

No, this seems to be left over from when mnt_want_write_file() was paired with
mnt_drop_write() instead of mnt_drop_write_file().  I sent a patch to remove it:
https://lkml.kernel.org/r/20200611014945.237210-1-ebiggers@kernel.org

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
