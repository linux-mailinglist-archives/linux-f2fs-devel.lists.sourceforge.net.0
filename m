Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 051972097AD
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Jun 2020 02:36:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1joFrx-0001Cs-2v; Thu, 25 Jun 2020 00:35:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1joFrv-0001Ci-19
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 25 Jun 2020 00:35:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sGG+VAkdXEMKn+z9CcSnjOrNdzj17nH/Eh18dsMEtII=; b=D34zvBdCoYPG9ctg3LpQsjkb+R
 sPwGa3Klyo5NKvZXkFWcqUx4HwD4dKTlW882gsHC15r+EAcxv1ajbksXEtKLdp8OkphOnC8blk7Ei
 +4ZcnmXqfZFhZCbTMrxKJ4RLEw9oUVJsobLAiRIqUO8CJGLy/VgeoO9/re9cGK02IrQ0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sGG+VAkdXEMKn+z9CcSnjOrNdzj17nH/Eh18dsMEtII=; b=FDxYuxV+4j1JxpdR0mzAtOwjRd
 zOFw1xhBQZk2K/d4r0MGJkC56Vw18MyrOJYCWLc7aS5S/eUwgcAsiAy8rNYids3HjmB/xDXjYtNe8
 sNqHuE3Kz5GZgmViHR32ccGkSK1833HrL4yZLuc72RrJI1jKe6dMK1KktdDjEE2Odg58=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1joFrs-00HCoy-3D
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 25 Jun 2020 00:35:54 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0EF892078D;
 Thu, 25 Jun 2020 00:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593045344;
 bh=9/yif0uED8r0mBA3VK8O5YzprCAsTE6sgzq4YVVCc/M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gDskKqXpfqJhDcdBBjy0d6SJy1+sv2YszPkTe5/AvZu1ZdygZFbm2BbwFTP6fHN7O
 25lPKfWryj4fxscB0Ngo9WI0El14RmKXS1wyXw6bFWK7YFuLtRd6jMqXpw7e4XYMm6
 NYdlqYXMoI0FK1FOE/9MluFCxpsH2Hym2YuGQSz0=
Date: Wed, 24 Jun 2020 17:35:43 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Didier Spaier <didier@slint.fr>
Message-ID: <20200625003543.GA34187@google.com>
References: <13e19af7-69d5-6db3-441e-3be4921983de@slint.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <13e19af7-69d5-6db3-441e-3be4921983de@slint.fr>
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
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1joFrs-00HCoy-3D
Subject: Re: [f2fs-dev] Questions about using f2fs to format the root
 partition during Slint installation.
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

Hi,

On 06/25, Didier Spaier wrote:
> Hello list,
> 
> this email is a follow-up of:
> https://www.mail-archive.com/linux-f2fs-devel@lists.sourceforge.net/msg14390.html
> 
> I will number the questions Q1, Q2 etc.
> 
> To summarize the context and goal: I want that the Slint installer
> format the root partition with f2fs when appropriate, if possible
> without asking questions to the user about the device.
> 
> I target usage of f2fs for the root file system in cases of USB flash
> drives aka USB sticks, SD cards, eMMC, as if I understand correctly
> these kinds of devices benefit the most of wear minimization and
> increase of performance when using f2fs. I plan to use ext4 for SSD
> (including NVMe) and hard disks.
> 
> This leads to several questions:
> 
> Q1: Comments about this choice of target devices for f2fs, knowing that
> I favor security over performances and that the "auto" option of the
> installer is intended for your grand-mother? I am a grand father myself
> <smile>.

Which security and performance feature do you want to use in the system?
For example, mkfs.f2fs requires some options like:
- fscrypt : -O encrypt
- quota : -O quota
- fsverity : -O verity
- compression : -O compression -O extra_attr
- casefolding : -O casefold -C utf8

> 
> Q2. How-to determine if the drive fall in one of the types listed above
> without asking the user if possible?
> 
> I have considered using the output of lsblk and/or "udevadm info" but
> that doesn't seem to provide enough information on the device.
> 
> As an aside, I have seen rota=1 for an USB boot stick. ??? 

I don't have a good idea to detect this. Maybe by measuring write bandwidth
and checking IO interface?

> 
> Q3. What would be the safest options to include in the relevant line of
> /etc/fstab forthe root partition using f2fs?

default + any features that you're interested in?
We've been using the below option for several years in Android.
https://android.googlesource.com/device/google/coral/+/refs/heads/master/fstab.hardware#11

> 
> Q4. do you confirm the statement below? it is a quote of web page:
> https://wiki.gentoo.org/wiki/F2FS
> > When using f2fs > When using f2fs as rootfs fsck fails on boot.
> > Solutions are either disabling fsck in /etc/fstab (setting the last
> > number to 0) or enabling the force-flag for fsck in /etc/conf.d/fsck.
> > See bug #671786

Yes, likewise e2fsprogs, fsck.f2fs doesn't allow to open ro-mounted disk
with "-a". But we added a patch to allow it with "-f".

> 
> Q5. I am correct f2fs can be expanded but not shrinked. Is it still
> true? Will it planned to bring this feature?

That can be done by ioctl() in runtime since v5.3.
https://lore.kernel.org/linux-f2fs-devel/20190711171336.GA66396@jaegeuk-macbookpro.roam.corp.google.com/#r

> 
> Q6. Currently we ship a 4.19 kernel. Would it be preferable to ship a
> 5.4 one instead shipped in Slackware-current at time of writing, knowing
> that we ship an no patched (aka vanilla) kernel and what would be the
> benefit of doing so wrt f2fs?

v5.4 would be better, and if you have some time, it'd be great to sync
my backporting patches from the below branches. These are all mirrored to
Android common kernels as well.

https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-stable.git/log/?h=linux-5.4.y
https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-stable.git/log/?h=linux-4.19.y
https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-stable.git/log/?h=linux-4.14.y

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
