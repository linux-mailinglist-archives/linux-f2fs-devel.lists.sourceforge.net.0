Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B150F18683D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 16 Mar 2020 10:53:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jDmR1-00063u-14; Mon, 16 Mar 2020 09:53:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <graysky@archlinux.us>) id 1jDmR0-00063f-9q
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 16 Mar 2020 09:53:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=twSEtXbUemdMzWY6Y7Kk95s0Z4mOKO25AFjditd+24U=; b=Wb6LMF/cJtnl21ZOKaLgy/gbir
 Gshf3UIvMifqupCmxuRxMLtG+j9YudIiUWtZWTQbUL9ccz037g/vxCZNhLWXsKjfpwE/BddxsiOv9
 GCnW6V3j6hA6Dzs8izvcGo4YX2mKRgjYI/cU90PYwUzZkBMuZCTQINaEANVVLLzpog0E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=twSEtXbUemdMzWY6Y7Kk95s0Z4mOKO25AFjditd+24U=; b=aChrTL9bhsMf/7qjvvXvpUMfkf
 cLesmIZ+sZuBAaGifp4uylQMp7+we6kR8Z5NT1VEdqqks9vQy69UqcvTf85qA6RdZHaSTZ/1RiDy9
 uZTYqdaCrtIB4kv/nPO02Jd6Mkmup1DuadVjIat8pGo7La4wffF1EVws3p3MTPXFs2q8=;
Received: from mail-wr1-f67.google.com ([209.85.221.67])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jDmQu-002ogv-25
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 16 Mar 2020 09:53:22 +0000
Received: by mail-wr1-f67.google.com with SMTP id r15so20334713wrx.6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 16 Mar 2020 02:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=archlinux-us.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=twSEtXbUemdMzWY6Y7Kk95s0Z4mOKO25AFjditd+24U=;
 b=LWZ9jx91NQ50Cl9UJsNpzvnLzmBoJ2OUwkmplEZXZPja0LhDVOKrMSaR3k8GmOGEeT
 3z6+g4ipiKWRPeRp+z/MMFYcC6MZEoiiT72D9Rl79tptAE3cThoPPNLhYKIlUfiqobb2
 mO15luplaaCfp1nlVAbpUT1mnuNVZoRQFb4V2J5WZiX9kk3dzp1idifkhShIGstnZv8y
 G7WaUud2LLWlTsHHF9McxuwUHUC22rVa6GUAYL9kdlUTmotXlgz9d7U+XgGxDWmny1T5
 Pue0HlXWOGgEOKPThI92dTvZc1tqGzBj9isEZCXzpSeEgSZkvTD7Fs98PxM0+SAAxhT0
 UBww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=twSEtXbUemdMzWY6Y7Kk95s0Z4mOKO25AFjditd+24U=;
 b=hhuTfad/soig3YfUqRbcCrWz2YtdifhEQbDrgs7FZ7zyT3929AXZT0CAAWf+eYgbhu
 SZ0Hv3k1aKdxSDptRH4+yXc27+fxXAGhg2VuHlcNS2bZ94BGsXZr1z3H17iHB7JcIJuW
 N2vhZfCGBcvJ5qrs1eWyOLjYTpgA0m5DYx+iZLTbRTJXhrA/lzzrit7Zh36/bI9IFmLq
 2DOD04A5ZPHM2ehfzK8pFAqy8G84K7BM5dsephEp3bbLuoG1ErZ9eSqvZ3ilwaQ/AdbU
 O+s9V5KMWv6xRxvwMf51pvKN61v4EEO4f81V0a/Je7uktBuzcBQsi36/PHZ/MM7riMjs
 redg==
X-Gm-Message-State: ANhLgQ1RChhC+2WPcVyXmgCJfgtB+h6fPY82fpKL2BaesTdt9UV0ylw8
 6aCC5/FtBF/SyPMMpdqmmb48IRHPQ/oQRimkWBQy6j3BJqE=
X-Google-Smtp-Source: ADFU+vt6murA7L85KGhzXZmhqfegrQT64cx86nXeWj3MeUkcauoMooK3kqtuNl/DLlhE4EbK0x6q6zaqHH48FPcseaM=
X-Received: by 2002:adf:e94a:: with SMTP id m10mr4107654wrn.218.1584352389089; 
 Mon, 16 Mar 2020 02:53:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAO_nJAYw+-+n584gg2-rRp3KoAsPT5mpD5yRCrwM7hiDMD=PJg@mail.gmail.com>
 <78bdaf48-9699-3a04-efec-95e1a670bfe4@huawei.com>
In-Reply-To: <78bdaf48-9699-3a04-efec-95e1a670bfe4@huawei.com>
From: John <graysky@archlinux.us>
Date: Mon, 16 Mar 2020 05:52:58 -0400
Message-ID: <CAO_nJAZ_bW1Bor-sUb8Ouz4VQV28KPZR23njH4VV+eH=BgwR=Q@mail.gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.67 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.67 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jDmQu-002ogv-25
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sun, Mar 15, 2020 at 9:24 PM Chao Yu <yuchao0@huawei.com> wrote:
>
> What's your mount option and mkfs option on those two partitions, and what's
> your kernel version?

I am mounting the partitions with systemd like so (/etc/fstab entry):
  LABEL=incoming         /incoming     f2fs  noauto,x-systemd.automount  0 0

But I can reproduce this if I totally remove the entries within
/etc/fstab, reboot, and mount manually like this:
  mount LABEL=incoming /incoming

Inspecting my shell history, I created them both with this command:
  mkfs.f2fs -l incoming /dev/sdb2

I am running 5.5.9 on Arch Linux, but I believe I experienced this
under previous 5.5.x series as well.

If you create a F2FS partition using the latest stable release of
f2fs-tools (1.13.0) are you able to reproduce the inability to trim?

Thank you for the consideration!

> I checked the code, only place where we give 'not supported' is as below
> by checking whether underlying device supports discard.
>
> f2fs_ioc_fitrim()
>
>         if (!f2fs_hw_support_discard(F2FS_SB(sb)))
>                 return -EOPNOTSUPP;
>
> So this should not happen that two partitions locates in one device have
> inconsistent discard support status.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
