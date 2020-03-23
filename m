Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D467818EECF
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Mar 2020 05:12:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jGERY-0003Zp-29; Mon, 23 Mar 2020 04:12:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jGERT-0003ZM-7f
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Mar 2020 04:12:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=V6pU8/w5ss1G+1Qm2GCi6rimWE1cs1oAOZ5bO2o4S8Y=; b=Od9x036o8dC2i/CT/Y1JjKl4i5
 Akg+goZ0oSxa5K5dIaVdKTWenwviy3FfBUQhpoWnIvVykmZjHqi44HsF+S4pIP48V2J8YW0VsYyRv
 s7UVRB9w/4ACOI2agScBgln7F7sZm5/cgZjDkbqbGCJV57nMcPap34v3UPPrbNZ0dqMs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=V6pU8/w5ss1G+1Qm2GCi6rimWE1cs1oAOZ5bO2o4S8Y=; b=gGtdz2efTP89Rpzh8ru4aoG2b8
 K5FhyHTqv2nzln+PxTRgD+rvJTM4TvmB/cPHe++cJUNbif5EFfOAP1tXOeOQPanLzW9o0YSQuF7eT
 DagA9ILeUyT4ZRiVxW2HvcYmMbMXG5cTbj5GP6cpQF3Cws+8OPdvij7nf0JMKDmiQdAk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jGERQ-00DPa5-NN
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Mar 2020 04:11:59 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 06F0D206C3;
 Mon, 23 Mar 2020 04:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584936704;
 bh=DADM8VMsduu8mVDAOeA48RoYO+h/xSQwej1QUYpXsRw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ai43BOV9doo++q7t9tzDswKmOQNqLP7ZmvifOBH7FIciYqo46+pcaYiL/noJ+ZxsY
 PnPOhrGqjQzOKGOGUDGpZwxrzCEspsDTbNIKbBdA5KSNdA4obDau/j0SFMkz6wOhYK
 rtVtmIcgcWgJt2vby3FkwvmyQylrnW92kE8Jwy4o=
Date: Sun, 22 Mar 2020 21:11:43 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: John <graysky@archlinux.us>
Message-ID: <20200323041143.GC147648@google.com>
References: <CAO_nJAYw+-+n584gg2-rRp3KoAsPT5mpD5yRCrwM7hiDMD=PJg@mail.gmail.com>
 <78bdaf48-9699-3a04-efec-95e1a670bfe4@huawei.com>
 <CAO_nJAZ_bW1Bor-sUb8Ouz4VQV28KPZR23njH4VV+eH=BgwR=Q@mail.gmail.com>
 <418f4ee8-14ed-bdfa-d16c-f68c2992f234@huawei.com>
 <CAO_nJAYTbPqWKAnG1+i2J1jnEKN6QtiMV_CxVyranZ-AWK9Agg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAO_nJAYTbPqWKAnG1+i2J1jnEKN6QtiMV_CxVyranZ-AWK9Agg@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Spam-Score: -0.3 (/)
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jGERQ-00DPa5-NN
Subject: Re: [f2fs-dev] fstrim does not recognize FSVER=1.13 of F2FS
 partitions
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

On 03/18, John wrote:
> On Mon, Mar 16, 2020 at 9:44 PM Chao Yu <yuchao0@huawei.com> wrote:
> >
> > On 2020/3/16 17:52, John wrote:
> > > On Sun, Mar 15, 2020 at 9:24 PM Chao Yu <yuchao0@huawei.com> wrote:
> > >>
> > >> What's your mount option and mkfs option on those two partitions, and what's
> > >> your kernel version?
> > >
> > > I am mounting the partitions with systemd like so (/etc/fstab entry):
> > >   LABEL=incoming         /incoming     f2fs  noauto,x-systemd.automount  0 0
> > >
> > > But I can reproduce this if I totally remove the entries within
> > > /etc/fstab, reboot, and mount manually like this:
> > >   mount LABEL=incoming /incoming
> >
> > However, the directory where you trigger trim is "/mnt/media"?
> >
> > Quoted:
> > "Invoking it manually on the newer one gives this:
> > # fstrim -v /mnt/media
> > fstrim: /mnt/media: the discard operation is not supported"

Hmm, could you share cat /proc/mounts?

> >
> > Could you give more details about that? What device is behind /mnt/media?
> 
> The SSD has two partitions on it formatted to F2FS.
> LABEL=incoming was created with f2fs-tools v1.12.0
> LABEL=media was created with f2fs-tools v1.13.0
> 
> The physical device is a Samsung 860 EVO 2TB SSD.
> 
> > > Inspecting my shell history, I created them both with this command:
> > >   mkfs.f2fs -l incoming /dev/sdb2
> > >
> > > I am running 5.5.9 on Arch Linux, but I believe I experienced this
> > > under previous 5.5.x series as well.
> > >
> > > If you create a F2FS partition using the latest stable release of
> > > f2fs-tools (1.13.0) are you able to reproduce the inability to trim?
> >
> > I can't, and also there is such option in mkfs to disable trim functionality
> > during format.
> >
> 
> I might be misunderstanding.  When you said "I can't" does that mean
> when you created a partition with f2fstools v1.13.0, mounted it, and
> then ran the fstrim on it, fstrim completed successfully?  Which
> version of fstrim do you have installed?  I am using util-linux
> 2.35.1.
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
