Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A49E313179C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  6 Jan 2020 19:40:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ioXIm-0007NI-8w; Mon, 06 Jan 2020 18:40:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1ioXIl-0007NC-6F
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 06 Jan 2020 18:40:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mmou7dXM3wWe+JTZkb/QQRMmirkmqCySfSXVPt2rVE8=; b=nIdL2DroX15OvV/GBbrzxmMa2r
 8is2kAnjcfvFkN0FZdHmThWXNS/MvpubG4prDnFyOJ3V1i8GKK2KZS0S3a7I7Z0YctxMz0J30jljC
 0ulqz9AN2L5I22IjB8hFsb3LgQIrV3yUzHcSgSbq2YMcyUfTFk/URQ86P/x3d+spBMbE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mmou7dXM3wWe+JTZkb/QQRMmirkmqCySfSXVPt2rVE8=; b=Rk/Bz5sLhAYFpVMbfqvDd3AMxs
 Fe0/bASqUB8f/DjFWWFtNlJtfqBMCkmSUlB5gHqShrj9ywnehEuz74JJdNo2cyW98UU58FgwHXcK9
 UGMokV/+TOoHkO+VJXfiWneYSXR/pGShzuOGevrBU8ykWX1wp5ATYGMi+sMGYiIda/l8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ioXId-00BglD-LA
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 06 Jan 2020 18:40:31 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E0D92208C4;
 Mon,  6 Jan 2020 18:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578336018;
 bh=Lk2b8isd4AKJZh0uG3znLmDlvurajw8PnaAef68wq2k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=1Bcx7rydQDjiPxZ3nYt4l5Uc9HBnHLOnDifre9sjZr/zLAFc+MgnKi8yeB3k/pEf+
 fLaGhfKkD73da0pEkrP41WLYiRuody5qYkX9xAEynZA5kgo7PQhwzmd36lsdgY8ZuR
 KGEYjUJYwYAU08342QAl3Fl9NqwGd5aiKI9iVcJM=
Date: Mon, 6 Jan 2020 10:40:17 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200106184017.GD50058@jaegeuk-macbookpro.roam.corp.google.com>
References: <4c6cf8418236145f7124ac61eb2908ad@natalenko.name>
 <2c4cafd35d1595a62134203669d7c244@natalenko.name>
 <e773d576-9458-48d7-bad4-dd4f8c61ebd3@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e773d576-9458-48d7-bad4-dd4f8c61ebd3@huawei.com>
User-Agent: Mutt/1.8.2 (2017-04-18)
X-Spam-Score: -0.2 (/)
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
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ioXId-00BglD-LA
Subject: Re: [f2fs-dev] Multidevice f2fs mount after disk rearrangement
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
Cc: linux-kernel@vger.kernel.org,
 Oleksandr Natalenko <oleksandr@natalenko.name>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 01/06, Chao Yu wrote:
> Hello,
> 
> Thanks for the report. :)
> 
> On 2020/1/5 5:52, Oleksandr Natalenko via Linux-f2fs-devel wrote:
> > Hi.
> > 
> > On 04.01.2020 17:29, Oleksandr Natalenko wrote:
> >> I was brave enough to create f2fs filesystem spanning through 2
> >> physical device using this command:
> >>
> >> # mkfs.f2fs -t 0 /dev/sdc -c /dev/sdd
> >>
> >> It worked fine until I removed /dev/sdb from my system, so f2fs devices 
> >> became:
> >>
> >> /dev/sdc -> /dev/sdb
> >> /dev/sdd -> /dev/sdc
> >>
> >> Now, when I try to mount it, I get the following:
> >>
> >> # mount -t f2fs /dev/sdb /mnt/fs
> >> mount: /mnt/fs: mount(2) system call failed: No such file or directory.
> >>
> >> In dmesg:
> >>
> >> [Jan 4 17:25] F2FS-fs (sdb): Mount Device [ 0]:             /dev/sdc,
> >>   59063,        0 -  1cd6fff
> >> [  +0,000024] F2FS-fs (sdb): Failed to find devices
> >>
> >> fsck also fails with the following assertion:
> >>
> >> [ASSERT] (init_sb_info: 908) !strcmp((char *)sb->devs[i].path, (char
> >> *)c.devices[i].path)
> >>
> >> Am I doing something obviously stupid, and the device path can be
> >> (somehow) changed so that the mount succeeds, or this is unfixable,
> >> and f2fs relies on persistent device naming?
> >>
> >> Please suggest.
> >>
> >> Thank you.
> > 
> > Erm, fine. I studied f2fs-tools code a little bit and discovered that 
> > superblock indeed had /dev/sdX paths saved as strings. So I fired up 
> > hexedit and just changed the superblock directly on the first device, 
> > substituting sdc with sdb and sdd with sdc (I did it twice; I guess 
> > there are 2 copies of superblock), and after this the mount worked.
> 
> Alright, it works if superblock checksum feature is off...
> 
> > 
> > Am I really supposed to do this manually ;)?
> 
> We'd better add that ability in tune.f2fs. And I guess we need to let
> kernel/fsck to notice that case, and give hint to run tune.f2fs to
> reconfigure primary/secondary/... device paths.

I'm thinking to add tunesb.f2fs to edit superblock explicitly, since it has
to edit it without getting superblock/checkpoint and other f2fs metadata.

For example,
# tunesb.f2fs -c /dev/sdb -c /dev/sdc /dev/sda
.. superblock info ..
.. device list ..
.. hot/cold extensions ..

Will modify the device list, if it's different from parameter.

> 
> Thanks,
> 
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
