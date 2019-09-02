Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECB3A5E14
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Sep 2019 01:28:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i4vk1-0002Mu-JJ; Mon, 02 Sep 2019 23:28:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1i4vk0-0002Mn-Oj
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 02 Sep 2019 23:28:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EEXiUTmJxzpCpf9GmrJYcF1rMBXqa1gFbN76q6qw5Gk=; b=jjN+C9dI/XFayak5ahY/E3jW50
 sSsa1cbm7XhIRV90ufk/HJB2otyJCfjZr8K9Ox/tThL4N9DReSuZYfRl5Y0WGqOK/YbC2JjZWcit/
 bGgvC/JrU5PZjJcC+DBNoyE3P5yjDYCDZIYJiGagOf001pOTZTt85hVZlIydXRBzHudw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EEXiUTmJxzpCpf9GmrJYcF1rMBXqa1gFbN76q6qw5Gk=; b=ACn8rjxR95dPNs0FJTrXK4rcI2
 jA39JXo26Q6CZgLeN9IGrIUBtezOWTTV/JYn6DgC5hhEdYw+SFrZhz+WJeLFfol+p81su9uUnlvwJ
 /7piPzaoDZRRbJRBMUe0eeA4cM45hlzShsGJ4bU+6B9VX5JqcV3b3B70ZsJYbTM1p2/o=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i4vjz-007DJ3-Dd
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 02 Sep 2019 23:28:08 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C55DE22CF7;
 Mon,  2 Sep 2019 23:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567466881;
 bh=HMpmOmYIi6Joxissrqn3ZWzfK5sRb0J/7Jzs4KuUThQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JZXSapXnDBSL0dsUKIyZPQQF9TvE8zx5TewyTeouszun7JM0sMz1lmryvBJwPTaGy
 bcRa97O2PAYzxfcuIMoOitH2Fa2Wqnc5iiYhzz+DT/tTsEu+t+MIs7nW3VHo2odvl3
 /PyeHuP4ZmneUv1mW55uuwI8Qe1sOfZO3ok3AC1k=
Date: Mon, 2 Sep 2019 16:28:01 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20190902232801.GF71929@jaegeuk-macbookpro.roam.corp.google.com>
References: <dcaa1e31-f47f-1570-f870-6d4d975e6067@slint.fr>
 <9f3e2172-8c8f-9f83-cb8f-ecaf6a8c6682@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9f3e2172-8c8f-9f83-cb8f-ecaf6a8c6682@huawei.com>
User-Agent: Mutt/1.8.2 (2017-04-18)
X-Spam-Score: -0.1 (/)
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
X-Headers-End: 1i4vjz-007DJ3-Dd
Subject: Re: [f2fs-dev] Which kind of devices would benefit of f2fs?
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Didier,

On 09/02, Chao Yu wrote:
> Hello,
> 
> On 2019/9/2 7:20, Didier Spaier wrote:
> > Hello,
> > 
> > I plan to provide a more "newbie friendly" installer for the Slint Linux
> > distribution that I maintain.

Cool, very interesting.

> > 
> > It will include an "auto" feature intended for newbies, that will
> > partition a whole drive and install filesystems with a minimum of user
> > input. It would install ext4 file systems in case of hard drives (but
> > the ESP and the Bios Boot partition, that is), or f2fs when
> > appropriate, without asking.
> > 
> > I am trying to determine for which kinds of devices f2fs should be
> > preferred over ext4 (or maybe xfs, I have yet to choose)
> > 
> > I understand that I should target devices equipped of a NAND flash
> > memory and interfaced with a FTL.
> > 
> > I think that nowadays most devices of types eMMC, SSD (both SATA and
> > PCIe connected, aka NVMe), SD card and flash drives (aka USB sticks)
> > have these characteristics thus are good candidates for f2fs.
> > 
> > Simply put, that loks like "everything but hard drives".
> > 
> > Is this correct?
> 
> I do believe that in those devices, in addition SMR (Shingled Magnetic
> Recording) drvier, f2fs can behaves better on performance, but for conventional
> hard driver, I got no evidence to show f2fs will perform better (since I didn't
> do such test on hard driver and never got related report like that).

F2FS supports HM-SMR by default. For HDD or HA-SMR, I've seen some performance
gains w/ ceph. Of course, it depends on user workload tho, if user generates #
of random writes, F2FS can give better throughput, since it's log-structured
file system. OTHO, if user wants to read out lots of file's data randomly, it'd
be better to use conventional disk-based filesystems, since it originally
allocated blocks to avoid disk seek time as much as possible.

> > 
> > If yes, I could just check the value of
> > /sys/block/<device name>/queue/rotational or the ROTA field of lsblk.
> > 
> > However, I understand that not all flash drives and SSD are based on
> > NAND and not all these devices interfaced through a NTL.
> > 
> > Thus my questions are:
> > 1. Is the assumption "all devices but hards disks" are potential
> > candidate for using f2fs valid?

I may be able to say "all devices for laptop", and "flash storages and SMR
drives for desktop/server".

> 
> I'm okay with that assumption by default. :)
> 
> > 2. If this assumption is not valid, what are the drawbacks using f2fs
> > for all, in terms of performances and security?

F2FS now supports fscrypt and will support fsverity, hardware inline encryption,
and per-file compression. :)

> > 3. Is there a way to tell for a given device if it would benefit of
> > using f2fs, that could be implemented in a distribution installer,
> > without human intervention?
> 
> IMO, flash based device can be benefit from aspects of:
> - better random write performance (inherit gene's advantage from LFS architecture)
> - well SQLite performance (SQLite has started to support to use f2fs atomic
> write interface officially in its persist mode)
> - recoverable performance (background GC)
> - longevity (less writes)
> - less performance regression during handling discard command (tuned async
> discard policy)

Good summary. :P

> 
> > 
> > Thanks for any clue. and if this is the wrong list for such questions,
> > please tell me where I should ask them.
> > 
> > Best regards,
> > 
> > Didier
> > 
> > PS I ship currently a kernel 4.19.x. Is this OK?
> 
> I'm okay with that.
> 
> Also I recommend to use our private stable tree below in where we backport most
> upstreamed codes, and the codes in that stable tree are used on Android now.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-stable.git/

Side note: this will provide all the f2fs/fscrypt backports to android common
kernel. It'd be great to sync this with your distro kernel as much as possible.

> 
> BTW please note that:
> - DON'T try corrupted feature via mkfs.f2fs -i with the version <= 1.12.0.
> - tune overprivsion rate with a proper value to avoid performance regression
> when there is no more space in the device.
> 
> > 
> > 
> > _______________________________________________
> > Linux-f2fs-devel mailing list
> > Linux-f2fs-devel@lists.sourceforge.net
> > https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> > .
> > 
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
