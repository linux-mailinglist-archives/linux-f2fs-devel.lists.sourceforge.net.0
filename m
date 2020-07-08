Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E7B2184A7
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  8 Jul 2020 12:05:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jt6xR-000483-Qo; Wed, 08 Jul 2020 10:05:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <gregkh@linuxfoundation.org>) id 1jt6xP-00045j-Ue
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Jul 2020 10:05:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oJKfhpS2TAv3dfAMEih1hdrRNJEaMuKN0Xzg9BWeoSo=; b=e9Yg7u+aBgFflqQgzT4GWFiYym
 rULnohbwh80HYOv41rI0pZVmAxqIzyaFw5+hzqVmiIpvNFN++eKVbx8xe3jDSgDbEct0CmQsJCsOj
 LUDXk2O0OItsKVmdu3j4KRMpZvk50QX//nfqw/obAEru982PmiXZK1qr+4qE0/mwx6OM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oJKfhpS2TAv3dfAMEih1hdrRNJEaMuKN0Xzg9BWeoSo=; b=fX9lsDrFCERteebNLEi43SpVnE
 f1P0IFjW7OgqdfzlL4ukJy/qrtw4L7OxJISEh5Ac0Lj3TGXfDWe6KMq8XT0Zxg7N5MOuG7bKHa9XZ
 DRsgruovmMBe65qdithtGKaJ7T0QpSODNnitfrhV7F7EE0L9yYjvvcBtrbBDsgcliPmU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jt6xO-00B3dO-7O
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Jul 2020 10:05:39 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8B6CA204EC;
 Wed,  8 Jul 2020 10:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594202731;
 bh=yTKUIgGMoXAh3uS6fiL+0DHrR3iq2vwf7Im4h1Eez5A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O8OClbpMbY9OCMuHPR8z/AuEAjgWpqOX7j8VzUdtfTaahbtr4MtPYKhaOBXiw6sg+
 MWc3Jgcpu1fCrkNyH5b7QbY3pkYE3aNGJGn/l1f6N0H7EGaVSbdJjdk9D6xJg7dinV
 ecIALBSNJXAlmjN1/7LbgOjOH8YdGRKqMCebod6w=
Date: Wed, 8 Jul 2020 12:05:27 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <20200708100527.GA448589@kroah.com>
References: <20200703065420.3544269-1-daeho43@gmail.com>
 <20200703141359.GA2953162@kroah.com>
 <CACOAw_yweR--34vBXBV07xEGxGhO2r9o_XYVw6h9dMP=C6zp5Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACOAw_yweR--34vBXBV07xEGxGhO2r9o_XYVw6h9dMP=C6zp5Q@mail.gmail.com>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jt6xO-00B3dO-7O
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: add symbolic link to kobject in
 sysfs
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

On Mon, Jul 06, 2020 at 08:47:07AM +0900, Daeho Jeong wrote:
> > No Documentation/ABI/ entry for your new sysfs file/link?
> 
> This is for adding a symbolic link to a pre-existed
> /sys/fs/f2fs/<disk> directory and it means /sys/fs/f2fs/<mount> points
> to /sys/fs/f2fs/<disk>. I already added the description of this in
> Documentation/filesystems/f2fs.rst.

Ok, but that's not the standard location for sysfs file documentation.

> > And what does this help with?
> 
> Some system daemons in Android access with the pre-defined sysfs entry
> name in the json file. So whenever the project changes and the
> partition layout is changed, we have to follow up the changes and
> modify /sys/fs/f2fs/<disk> name in the json file accordingly.

That's what partition names are for, you should never depend on a
"random number".

> This will help them access all the f2fs sysfs entries consistently
> without requiring to know those changes.

No, please use a partition name, that is the only way to always know you
are mounting the correct partition.  You have created a random number
here that might, or might not, change between boots depending on the
order of the filesystem being mounted.  It is not persistant or
deterministic at all, please do not treat it as such.

> > If it's really needed, why don't we do this for all filesystem types?
> 
> This is for the daemon to change the mode of only F2FS with the power
> hint of Android.

Again, the point is that a filesystem type is not unique, this, if
really really needed, should be an attribute for ALL filesystem types,
f2fs is not special here at all.

Please do not rely on this number ever being the same across boots,
because your code is such that you can not guarantee that.

And again, if you really want to know the partition you are mounting
really is the partition you think you are mounting, use the partition
label name, that is what it is there for, and is why we have been
relying on that for decades.  A new special per-filesystem-attribute
that is semi-random is not the correct solution for the problem you are
describing as far as I can determine.

thanks,

greg k-h


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
