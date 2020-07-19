Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDDC225269
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 19 Jul 2020 17:17:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jxB3b-00085o-OV; Sun, 19 Jul 2020 15:16:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <gregkh@linuxfoundation.org>) id 1jxB3Z-00085T-Pe
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 19 Jul 2020 15:16:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=f+/nMC9KtprnGJTYsDKdWMQCSAEu8qFX2gEgq1WTZAo=; b=j8KPIGA55cEq6Ic71bYHO+aAvC
 Kg3gSfEF/9NxSccVmepjmtmTOl5EC9oZQE0KMzqytqNeKax+J4I3e3uVKycunYJoHjNzcb+txcLCO
 4ZVzWhgYRMUgnmzlOSohqBg6NYgTHJbn+xeaZ+C5WblglY7KDn2MFMuQlNOPUal8e514=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=f+/nMC9KtprnGJTYsDKdWMQCSAEu8qFX2gEgq1WTZAo=; b=GdJNBRvyEjBBVcPbw9j08frxNW
 kLxPPTJ6J/orq+Yj1ymqgmFuprh7cSmyxWU6h7XIQRHB4eMyhYepVLwGE2QSTsnidUoh7VWqGv+KR
 IO9NI2Joj9LNkKQ6mqvi4pVRusjZAtqDJLeDYe3FZKuwPs11RUi7OL41xQ1yDYoroLy0=;
Received: from [198.145.29.99] (helo=mail.kernel.org)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jxB3T-00FkSv-Tr
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 19 Jul 2020 15:16:49 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F344422B4D;
 Sun, 19 Jul 2020 15:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595171788;
 bh=bUHUr8f704qfasOHLj7vXLRRYUwyFmxfe3IyM5uTxcc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bDBYRNpmL2M5sfmkgiJWS3XCx5IzAXxr0VWlgyZtoZGe2ptUpbQyPKuXtyCiCUq3M
 2L0PJLwBReVvJjL9W7ykO7KHA77DAfN9b8wyEczaC5hOTi9WwPJhjaSV/wqZfN4Bpl
 TX5cv/URXmkSyvc/1cJg/VpmESwM+Ko6qhdqvfl0=
Date: Sun, 19 Jul 2020 17:16:40 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <20200719151640.GA301791@kroah.com>
References: <20200719054409.3050516-1-daeho43@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200719054409.3050516-1-daeho43@gmail.com>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 1.0 RDNS_NONE Delivered to internal network by a host with no rDNS
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -1.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jxB3T-00FkSv-Tr
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

On Sun, Jul 19, 2020 at 02:44:08PM +0900, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Added a symbolic link directory pointing to its device name
> directory using the volume name of the partition in sysfs.
> (i.e., /sys/fs/f2fs/vol_#x -> /sys/fs/f2fs/sda1)

No, please no.

That is already created today for you in /dev/disk/  The kernel does not
need to do this again.

If your distro/system/whatever does not provide you with /dev/disk/ and
all of the symlinks in there, then work with your distro/system/whatever
to do so.

Again, no need to do this on a per-filesystem-basis when we already have
this around for all filesystems, and have had it for 15+ years now.

thanks,

greg k-h


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
