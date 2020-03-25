Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F98193263
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Mar 2020 22:13:51 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jHDLH-0003SL-2L; Wed, 25 Mar 2020 21:13:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <graysky@archlinux.us>) id 1jHDLF-0003S3-6F
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 Mar 2020 21:13:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kkmsD+9tO7DE2iZbVJ2pJc0AXJ/eL1Mb4R9Wh96t9vg=; b=dk/quH/kgGS7T6OnaRu8Sni4+M
 lOq46iZFwiN3tWvbBWR06IcbeP3PiYdS2f+jfTQWsFiblwq2hmKmjDdwIa/xKQaxvyb7jW6yi8zBh
 181z0JdsGrbPquyuxo6LD1G4E2H6PHxoQCSCynsfd2KJkc0OjEYN3Ik/bkYL2Zl0Jyms=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kkmsD+9tO7DE2iZbVJ2pJc0AXJ/eL1Mb4R9Wh96t9vg=; b=XoFyO9mJbzl4B7SPD092E9pWxb
 nQatgg1XtBuZ7HQ/QaHrQH8VSmI0p+hJQX645bPuy++ExsNV/wvgppTpdDe5sOiyzrCz71tYAPucI
 BNzCMwa+lf+MU8nitrGKiM0yOvxKCfoFtqdnacb6PHIXK0/cQ0K9LpnyhqHEfJA8gVfg=;
Received: from mail-wm1-f66.google.com ([209.85.128.66])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jHDLA-003kAM-M4
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 Mar 2020 21:13:37 +0000
Received: by mail-wm1-f66.google.com with SMTP id c81so4273960wmd.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 25 Mar 2020 14:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=archlinux-us.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kkmsD+9tO7DE2iZbVJ2pJc0AXJ/eL1Mb4R9Wh96t9vg=;
 b=eVpZgiDxBXwFvP9YQAQLOYucIsbxaHeNGuLwU7iyuD3bSjdNssxXl6NlYmpeXABr/r
 E0+EcQ0wMBQgBnxV9TVrHQQdX1+HXe3lQdtifpUwg2lrnEPwitKY7mZI0KoFmjUZ8ICC
 vTmgtRHm6Mpkciq4Sl6iSvAphfTQ/Ho8ek0N0EcxbmuyKjGtnsvrYpjqUEkXms9DL2aT
 q9lWB59vdgSujKHe7rH/nNck3s2gyF6XgTdEVSmiL/VfR3Q/t0Q23vmxzxji1vhXLju/
 aTMFOI/ff4RHIj+Ypz5nvZ5ZP0vNMayqcgNLw1ziEM5dZJvXWXYWplMOCeKSvwFaRb7T
 p7ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kkmsD+9tO7DE2iZbVJ2pJc0AXJ/eL1Mb4R9Wh96t9vg=;
 b=FZxPGCONd4CCDToF0VJeTJZLMlWH0K6Hvf+3TXfmKKxSPZLd7LRsmDIDvfNRqfb8KH
 hxJFPZXb8NX41xlSKhsh+DmZ5Ckr1Il4VSIhUFQYfBAg/T7yeJypfU/LpzRJ2TnU8V3u
 guqNCeY4rLwCq0plLd35SB+0ot0qPg1rmiMiXSRVVfCPdbnS5dCsTbSHGAs93RP43Bls
 l75uteJOh4lUJwwFUGe1/JcpJVCmW7eiLK+2Vl+1zJBwnIdezBMjjFmSZ42B/7uQOHev
 0fTO8IqPLgengxdpuCH1xmFuk3x+HIFsDuxzx5daWPjO+Pfq23V+gtRmf1CEoqYuwiMA
 QUnA==
X-Gm-Message-State: ANhLgQ0CHaqJp5zgn4knOQb8SJRjMzEGEjE3YlBztQGNSXY9bimokeK/
 gTO73lhUfqGPMxs/8DGwnFlzsuuSgDwGCpHmDZhBEw==
X-Google-Smtp-Source: ADFU+vseKJBOvoef/3eWQA6nHeJf6LMQAkV6QAQsx+bBwR8FmIlarLbB//HurYN2OnguVKj9n1sGn93SLT3Thy774kY=
X-Received: by 2002:a1c:c3c3:: with SMTP id t186mr5578650wmf.118.1585170806017; 
 Wed, 25 Mar 2020 14:13:26 -0700 (PDT)
MIME-Version: 1.0
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
 <20200325195919.GA200530@google.com>
In-Reply-To: <20200325195919.GA200530@google.com>
From: John <graysky@archlinux.us>
Date: Wed, 25 Mar 2020 17:13:14 -0400
Message-ID: <CAO_nJAZZzaGeNMGA7uEGdG2R3KV20J4OoTroOFquhkiinDw=-w@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.66 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.66 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jHDLA-003kAM-M4
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

On Wed, Mar 25, 2020 at 3:59 PM Jaegeuk Kim <jaegeuk@kernel.org> wrote:
> > Is it normal to return 0 bytes trimmed for F2FS partitions?  By
>
> It's normal, and that's why I asked -o nodiscard. The reason is F2FS creates
> asynchronous discard thread to alleviate long discarding latency among RW IOs.
> It keeps candidates in memory, and the thread issues them in idle time.

That is really good information.  Thanks for sharing it.  How long
does the async discard thread wait before it decides to check for idle
and does the actual discard operation?  I assume this mode is the
recommended way to use F2FS since you guys have it setup by default.
Please correct me if I am mistaken.

> In that mode, when you do fstrim, F2FS collects all the discard candidates given
> address space, and returns zero, since it didn't issue any discard command at
> the moment.
>
> But, if you set -o nodiscard, you can see the actual trimmed size, since F2FS
> disabled the async discard thread and issue discard rightaway if device supports
> it.

Also, I wanted to thank both you and and Chao for your helpful replies
in troubleshooting this.  So in summary for others happening across
this, discard/trim is disabled on LUKS by default; be sure to read the
Arch Wiki page I linked a few replies ago for details and for ways you
can enable it if you understand the security risks of doing so.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
