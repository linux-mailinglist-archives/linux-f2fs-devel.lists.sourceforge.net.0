Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C7843229D51
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 22 Jul 2020 18:44:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jyHqk-0007QT-5C; Wed, 22 Jul 2020 16:44:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jyHqi-0007QM-Pe
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 Jul 2020 16:44:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Zk6F4uVbnUf2oeUv7IyzfV0lTr1Y6rY+tsb9k25LoDE=; b=msTlbJlINtpElLSWKEr5vG3zRE
 OSsZ9i34wQa3WSqEPWLXHWzAsBsjN+veNa8Q7MQtM5YyDo/vYciBDfCdp8Xa4NaPAskobP459COoB
 vSLD7JhX4OCBM0UZNbyDiA8FoFeED/19zLRBKfPwFzml6Ql49r98F9a0Orxgptsc67eM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Zk6F4uVbnUf2oeUv7IyzfV0lTr1Y6rY+tsb9k25LoDE=; b=kOlnzSeAddJaNK1a7tBzJBDxAE
 b1xIDW8OLv373nl3WeWgQXBbYWpz/+FCtJw3olc+X5LZ/Z1cTrlXlJlKiKyVnD9fnLqqP45RI3waO
 E2FBQjNU0XaIgVgH+3FDyY60xjd08A3sXjH7K3dr5D/kuMoijASSaARpFYIHA82O9PkI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jyHqh-004yHu-MD
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 Jul 2020 16:44:08 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8D04C206C1;
 Wed, 22 Jul 2020 16:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595436236;
 bh=NWmgMsYz/UjEHMAobNjaiLofiShGglCnNsamdsb/4Rc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Pr3QGSqDxjAvr5aSuvlajCCX0H8+kOeWvKsF32hJUChoXnX2+zQhaEqT51FsiyMl+
 QLaeEso28PHOmuS30c82ZfXTzIOb5GnXtq3aqJehFW3rr3TY3PShXks9vry8e4pDJi
 vhAajRuY/QG1uuNzvGDLZHSu7wgR+RnkLbA1z/Lw=
Date: Wed, 22 Jul 2020 09:43:56 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Message-ID: <20200722164356.GA3912099@google.com>
References: <20200719054409.3050516-1-daeho43@gmail.com>
 <20200719151640.GA301791@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200719151640.GA301791@kroah.com>
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
X-Headers-End: 1jyHqh-004yHu-MD
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: add sysfs symbolic link to kobject
 with volume name
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

On 07/19, Greg KH wrote:
> On Sun, Jul 19, 2020 at 02:44:08PM +0900, Daeho Jeong wrote:
> > From: Daeho Jeong <daehojeong@google.com>
> > 
> > Added a symbolic link directory pointing to its device name
> > directory using the volume name of the partition in sysfs.
> > (i.e., /sys/fs/f2fs/vol_#x -> /sys/fs/f2fs/sda1)
> 
> No, please no.
> 
> That is already created today for you in /dev/disk/  The kernel does not
> need to do this again.
> 
> If your distro/system/whatever does not provide you with /dev/disk/ and
> all of the symlinks in there, then work with your distro/system/whatever
> to do so.

I don't get the point, since /dev/disk points device node, not any sysfs entry.
Do you mean we need to create symlink to /sys/fs/f2fs/dm-X in /dev/disk?

> 
> Again, no need to do this on a per-filesystem-basis when we already have
> this around for all filesystems, and have had it for 15+ years now.

Could you point out where we can get this? And, the label support depends
on per-filesystem design. I'm not sure how this can be generic enough.

> 
> thanks,
> 
> greg k-h


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
