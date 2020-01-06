Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 143E313178D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  6 Jan 2020 19:35:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ioXDW-0006Hg-9b; Mon, 06 Jan 2020 18:35:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1ioXDU-0006HU-8R
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 06 Jan 2020 18:35:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KD4EwqBbNbxyAEAKkvgxo7bgQxbUFdfvBsdqcM353Uo=; b=jf4LzywSZPu9VAp7BLpO1QxUNa
 VylUweviG6ddz/z83Fc9qnknYDVgaTLsRaqmqlZjkf4TdoJOEx4vKx5z9VXt4dgPJgxRszd0X64em
 CIr5udECElCKTjH74liEaB/CcmIyZYvU7DArvC800JpY6xlIMoOqNyM5Zrtu/37Wh8sg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KD4EwqBbNbxyAEAKkvgxo7bgQxbUFdfvBsdqcM353Uo=; b=XHpIPEVcXuZ+weNnbMjwKGxOVc
 716lOWe1+wziQy73rXgoLqAQwK7bzA5OfYCZ4zKDFcVQzOvNh/eMEBT7eGIHkyl4MI3fRwdDsO7Fk
 S/RdSaFaj/XTQ0619WWzW23qqIRMJBkiootz9O6bBGCf7hyvQuH+FUVX8ZuJ3pEy6CTc=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ioXDS-00BphQ-9f
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 06 Jan 2020 18:35:04 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BA7112072E;
 Mon,  6 Jan 2020 18:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578335691;
 bh=JntLi/yJ4cS9Fj9APMSIeBKJes+q3Xm+EQZItJCaOHk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M76DJxGL5Awgyq2fvLv9+VPDjy3kmhrnKoXgIa9knVhOjKWnr4iqsgJwK48shJvJ0
 KMavplXlMD0T899wAH2nlhEYqqtwalODpjq7Q5Y9ypTEFaGQyp8cW87Z0/WqxHxzMd
 Wo/XR6RGKdOI1Pfw44H/1p5Qpgt8l1cBasPJ+B/4=
Date: Mon, 6 Jan 2020 10:34:50 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Oleksandr Natalenko <oleksandr@natalenko.name>
Message-ID: <20200106183450.GC50058@jaegeuk-macbookpro.roam.corp.google.com>
References: <4c6cf8418236145f7124ac61eb2908ad@natalenko.name>
 <2c4cafd35d1595a62134203669d7c244@natalenko.name>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2c4cafd35d1595a62134203669d7c244@natalenko.name>
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
X-Headers-End: 1ioXDS-00BphQ-9f
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 01/04, Oleksandr Natalenko wrote:
> Hi.
> 
> On 04.01.2020 17:29, Oleksandr Natalenko wrote:
> > I was brave enough to create f2fs filesystem spanning through 2
> > physical device using this command:
> > 
> > # mkfs.f2fs -t 0 /dev/sdc -c /dev/sdd
> > 
> > It worked fine until I removed /dev/sdb from my system, so f2fs devices
> > became:
> > 
> > /dev/sdc -> /dev/sdb
> > /dev/sdd -> /dev/sdc
> > 
> > Now, when I try to mount it, I get the following:
> > 
> > # mount -t f2fs /dev/sdb /mnt/fs
> > mount: /mnt/fs: mount(2) system call failed: No such file or directory.
> > 
> > In dmesg:
> > 
> > [Jan 4 17:25] F2FS-fs (sdb): Mount Device [ 0]:             /dev/sdc,
> >   59063,        0 -  1cd6fff
> > [  +0,000024] F2FS-fs (sdb): Failed to find devices
> > 
> > fsck also fails with the following assertion:
> > 
> > [ASSERT] (init_sb_info: 908) !strcmp((char *)sb->devs[i].path, (char
> > *)c.devices[i].path)
> > 
> > Am I doing something obviously stupid, and the device path can be
> > (somehow) changed so that the mount succeeds, or this is unfixable,
> > and f2fs relies on persistent device naming?
> > 
> > Please suggest.
> > 
> > Thank you.
> 
> Erm, fine. I studied f2fs-tools code a little bit and discovered that
> superblock indeed had /dev/sdX paths saved as strings. So I fired up hexedit
> and just changed the superblock directly on the first device, substituting
> sdc with sdb and sdd with sdc (I did it twice; I guess there are 2 copies of
> superblock), and after this the mount worked.
> 
> Am I really supposed to do this manually ;)?

Thank you for investigating this ahead of me. :) Yes, the device list is stored
in superblock, so hacking it manually should work.

Let me think about a tool to tune that.

Thanks,

> 
> -- 
>   Oleksandr Natalenko (post-factum)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
