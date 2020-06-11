Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBAE1F5EFE
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 11 Jun 2020 02:00:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jjAeJ-0008PK-Ta; Thu, 11 Jun 2020 00:00:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jjAeJ-0008OZ-5o
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 11 Jun 2020 00:00:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Icv4+KDxh0xdgHt1Oajk+9qefWlOLQw14cIP2Kpgj5w=; b=Un5qmzaR0nbsK8xR5kUh2DN6XZ
 gYw0iF1rob/Avmld2XmdE3mfFR2u7efb0RDQTLrZIfLgly0YnPFr8xhf736s9WDv6uuL4QGRcsviZ
 F/+WiLzGPRQdRxV2chOWLnyIqequxsgm5R8XmQrq54r2p73tDCtxBujM9HrFdhAa3wSE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Icv4+KDxh0xdgHt1Oajk+9qefWlOLQw14cIP2Kpgj5w=; b=X20u1nqFLoSIA5zRVenSqKJHbw
 fHaIxrrPrFqFK5cJnowFVcgoIoUYsbSlD0/YrVfgrB08t99pGvI3qKgkXCGSDLDZ/mO8FhCKtG005
 aPhZVSnvo/LYIFXYmTnIyBTNqlP6eLc6+85jUEPEUubgzCVzRZBvk+CivdQe3rmeILjs=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jjAeH-00G6q8-6R
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 11 Jun 2020 00:00:51 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B7F5C20747;
 Thu, 11 Jun 2020 00:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591833638;
 bh=5sGHU0TXkJgqIou25g8bOOckwAZ4up5Cw9usUbqqcE0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YL76uirKlAFVeJnBYKcm15iNePJ5NPoXXfgvDSo41XH9Qgq87gpdK0QlQeib2YKyM
 UUGnZeY7N7fl6hixkdG98ddnzmSNL2RngUOgq3Sz7hZSAWjy12Yz+n+mvU/0JyLqLG
 Q1iWCUgphwz4qbEDSQ+sqzaH3BtQKmmc34jSryIg=
Date: Wed, 10 Jun 2020 17:00:37 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <20200611000037.GC1339@sol.localdomain>
References: <20200609060137.143501-1-daeho43@gmail.com>
 <20200609165107.GA228564@gmail.com>
 <CACOAw_xEZ+au9yhFerq9amkRO62Dzxj7h71gEc=i16ReYu5xrg@mail.gmail.com>
 <20200610031532.GA6286@sol.localdomain>
 <CACOAw_wErOPC=Kf3UU8nFGhWRy84ZnCeJbsyPhSCcXv51B_XxQ@mail.gmail.com>
 <CACOAw_zka6d06RxFOUTwEV7B6o8A2-_6FvqWh_A1nJ0+7FU9yQ@mail.gmail.com>
 <CACOAw_yc4hxdyxyO+Lb4MArHek1tP4wxCq0tezWOocgqvK+tqg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACOAw_yc4hxdyxyO+Lb4MArHek1tP4wxCq0tezWOocgqvK+tqg@mail.gmail.com>
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
X-Headers-End: 1jjAeH-00G6q8-6R
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

On Thu, Jun 11, 2020 at 08:53:10AM +0900, Daeho Jeong wrote:
> > > > > Using FMODE_WRITE is more proper for this case, since we're going to
> > > > > modify the data. But I think mnt_want_write_file() is still required
> > > > > to prevent the filesystem from freezing or something else.
> > > >
> > > > Right, the freezing check is actually still necessary.  But getting write access
> > > > to the mount is not necessary.  I think you should use file_start_write() and
> > > > file_end_write(), like vfs_write() does.
> >
> > I've checked this again.
> >
> > But I think mnt_want_write_file() looks better than the combination of
> > checking FMODE_WRITE and file_start_write(), because
> > mnt_want_write_file() handles all the things we need.
> > It checks FMODE_WRITER, which is set in do_dentry_open() when
> > FMODE_WRITE is already set, and does the stuff that file_start_write()
> > is doing. This is why the other filesystem system calls use it.
> >
> > What do you think?
> 
> Hmm, we still need FMODE_WRITE check.
> But mnt_want_write_file() looks better, because it'll call
> mnt_clone_write() internally, if the file is open for write already.

There's no need to get write access to the mount if you already have a writable
fd.  You just need file_start_write() for the freeze protection.  Again, see
vfs_write().

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
