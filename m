Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3CD19318A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Mar 2020 20:59:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jHCBe-0006RL-C3; Wed, 25 Mar 2020 19:59:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jHCBd-0006RE-7f
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 Mar 2020 19:59:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6rd9iA5/mvWejTOA8U4ycTAtHJDRh9Eqc7+SRlv6B5Y=; b=QDbbnEtnZMP7HRxc0OxJE1SPs+
 ssvg+6z1slnwEcEJMFtu/rdEeFijbG6IkojQUCCt+/BK76EMLA0Jlr4hLTElvSibMRHFSPU6v8W5f
 tiaMR6XyNW3ys1Oz8yTu2XhtWWjXykC/0ih24AeYVLEzQkHzowg8bJ8tGQASG04YVeOk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6rd9iA5/mvWejTOA8U4ycTAtHJDRh9Eqc7+SRlv6B5Y=; b=EbLBFAXU4jK/BC/yronAMyaMgB
 xq1X1zUZ5T4gMVOC+4/roo6ch3pfqe43k1VC0JV9d2ytheFaKwM0B4K0ZdSTjGFTE1E6RnDH/Vr82
 jKl16Vu4S7NKmTXQj6xZMT69vuFeQNYI+xsvCwByEPHlFN/ZSa91JPvRFRVB107arjKw=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jHCBT-00HAJ2-BN
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 Mar 2020 19:59:37 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 15CB22074D;
 Wed, 25 Mar 2020 19:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585166360;
 bh=JDPXt3GdI1SAo72zl4Gs4IOKs6qX4FkvHJh4/vVmsgE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uJFLOmaYhRl61ma2xtGohyNIzZzdluf5MGOWfuw8ODHYksf6tGBa6kU/7rAxMvdTr
 s2iTDP+ePyA4wHseLMVUENAJb9BqfiyVXbhCAzskbIURohemvpMgyl5561k7Q0zJoM
 h5a2JbgM5xWz18hYCbxY8CF2k8dSfKiWtnGTbiQ4=
Date: Wed, 25 Mar 2020 12:59:19 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: John <graysky@archlinux.us>
Message-ID: <20200325195919.GA200530@google.com>
References: <CAO_nJAYEGp1129PsFwMdU0ZdjC75DoL60nXhY7KaATgSPz-2DA@mail.gmail.com>
 <20200323150205.GA119787@google.com>
 <CAO_nJAbyEcTR4wFytJp1HQmQBDzpwycKhA_-FUwo39WVMceuZw@mail.gmail.com>
 <8b47e963-9e12-c945-e40e-a9d54a412d52@huawei.com>
 <CAO_nJAYWQWrWaQVfUmVpJGFtOeKKE76im-AkLUDTJm8DN4VAgA@mail.gmail.com>
 <2292eb8d-8357-227f-5448-d1d03b33c042@huawei.com>
 <CAO_nJAaNxRfC6SHQrr0BCDnA2H6HHkz1Pk5vJMCVfGqUSP0u1Q@mail.gmail.com>
 <20200325152859.GA65658@google.com>
 <CAO_nJAZH7smWvgTmtCvaapwKWut_OYeJzeTxmA1XrB_pGW+e8g@mail.gmail.com>
 <CAO_nJAbKHvD5YJ=PLv=Dbfi2xD6N7XX6LV7TAraKSaZ1MOx81A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAO_nJAbKHvD5YJ=PLv=Dbfi2xD6N7XX6LV7TAraKSaZ1MOx81A@mail.gmail.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: archlinux.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jHCBT-00HAJ2-BN
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

On 03/25, John wrote:
> On Wed, Mar 25, 2020 at 2:41 PM John wrote:
> > I can confirm that it is true with an encrypted ext4 partition.  I get
> > the same error, "fstrim: /mnt/test: the discard operation is not
> > supported" when I try it there on the same device.  Unless there is a
> > good reason for it, not having discard on LUKS encrypted partitions
> > seems like a pretty serious omission.  Perhaps it is intentional.
> 
> I see now from searching that this is by design,
> https://wiki.archlinux.org/index.php/Dm-crypt/Specialties#Discard/TRIM_support_for_solid_state_drives_(SSD)
> 
> I added the "discard" option to the entry in /etc/crypttab and
> rebooted. I am now able to get a successful run of fstrim on this F2FS
> partition:
> 
> # fstrim -v /mnt/media
> /mnt/media: 0 B (0 bytes) trimmed
> 
> Is it normal to return 0 bytes trimmed for F2FS partitions?  By

It's normal, and that's why I asked -o nodiscard. The reason is F2FS creates
asynchronous discard thread to alleviate long discarding latency among RW IOs.
It keeps candidates in memory, and the thread issues them in idle time.

In that mode, when you do fstrim, F2FS collects all the discard candidates given
address space, and returns zero, since it didn't issue any discard command at
the moment.

But, if you set -o nodiscard, you can see the actual trimmed size, since F2FS
disabled the async discard thread and issue discard rightaway if device supports
it.

> contrast, if I go to my test SSD, create a LUKS partition, open it
> with the --allow-discards option to cryptsetup, format it to ext4,
> mount that and then run fstrim on it, I am getting non-0 values for
> fstrim when I run it:
> 
> # fstrim -v /mnt/test_crypt_ext4
> /mnt/test_crypt_ext4: 3.9 GiB (4123463680 bytes) trimmed
> 
> So I think something still isn't quite right with F2FS over crypto_LUKS.
> 
> Thanks for the help!


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
