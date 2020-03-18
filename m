Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A1518A3F8
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Mar 2020 21:47:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jEfb5-0002Qe-7h; Wed, 18 Mar 2020 20:47:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <graysky@archlinux.us>) id 1jEfb4-0002QV-1j
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Mar 2020 20:47:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/gYyt3hRcetYExPMhNahsVTUi6lo6bX65s1UZ7Pn1fU=; b=HIQJBLWjxiSPjYJYdRmWZGT2fY
 fjENSHgxbBT8KJ38o927VHL5fQ5BdPZzjY9VaafoDTH9B/BOP0DrkdRJUqxLP8qbcYHkvwLX4fWTR
 B1HGv5+DtC9BC59GnCXVeVoFWvF2YkcBpqji4U3wezoK1oufb2+PqV4THCTWi/1dGsEM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/gYyt3hRcetYExPMhNahsVTUi6lo6bX65s1UZ7Pn1fU=; b=lsnVhG02ommymgZNY1s9SfsLdC
 kd32ZEkFmzfxYv0R7oNiUGggZGZpreAgpCAUAIs9Tv5ajYxudcTiRbyDVqohxSdrbkNbiwCUJxUoA
 So3c/AMlOBM+2lWJgz49G2ihG3fi1aEqDryk1/ZZMymIuy5Dlb9SWicLS9KzwWs5+WnY=;
Received: from mail-wm1-f51.google.com ([209.85.128.51])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jEfb2-00HEMh-L6
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Mar 2020 20:47:26 +0000
Received: by mail-wm1-f51.google.com with SMTP id d1so3420730wmb.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 18 Mar 2020 13:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=archlinux-us.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/gYyt3hRcetYExPMhNahsVTUi6lo6bX65s1UZ7Pn1fU=;
 b=FtD7qwuoYfn2zHhqePESsyP3JJngQtuGLdvf7GtXsCQNgCH4WRKKPq2xAewgOtSv2G
 Jqb6XW/KOBRVdjUGecnEpa0GrrQeYrHIGxBuxO1cvwRJ5zbX5W1x3HjAInpd5YB/Cy/8
 6T80wXqMpqpEUeJsJ6RRX8e+JHi4h70AK5oAAf8Qh9nSblb8AtAqUwQhIz5kTewhOQKM
 OL2KvEH9ahr4zORTJOuteUroDVs+Kf9zr+wv5I7DLnwLr8e0iERdi1VH8DKK/DdF6L1E
 rghaeuL70OLpX+hjSq0wU+Y90Coko/8cYQt5zTL9Qlf+YYzs4jfqtPm2A9ZyCTqACk9T
 c4Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/gYyt3hRcetYExPMhNahsVTUi6lo6bX65s1UZ7Pn1fU=;
 b=hgOUur1uHkegnOewFpMVMQsKYMHtAU8v0UMcPopo7LhCd3+mHMhCNuSXIVf+e0VAEU
 qdfsAwORa3CBeR1oNvT16Awiniddf4u90FgItfaiFh+LBDywQe0YF1476C0Cjbr9YbgJ
 uNIh5Xr+BE+N5QBlNe+Jo5ikEXK6XommZB84Zd9tOUuxO/laSSQM4EGQHUaiR/ht11fc
 Cx0EY2rB+dN9cB5GAJEjguRYNOjHtUt5MikWJ01g2O4S5/bFDxPZx9WnRUIx9VrlVNFI
 ItsbjWTM67d7LXCMXXdD1NC5rh/n75dASfMVczlzMuzKbHAsJla8de4xCb+Hj4Mpa9n2
 W3hA==
X-Gm-Message-State: ANhLgQ2CeIpFS/f92twAEu9JUkqVkC+1XAQWERL+7NCp8wD/kEW7G98s
 5wrgPDbQozmZpWvvL0S2QVim/S3LVvkDgEVxbI6HoT+k
X-Google-Smtp-Source: ADFU+vsPPtGSPiLGby2fS3myrgCP+xbx2wFp0BnZyVFpYaHfCl2uzo4Ix2fzYZBekHchyTCieChRGAN00/PHxh0werE=
X-Received: by 2002:a1c:c3c3:: with SMTP id t186mr7304568wmf.118.1584563135334; 
 Wed, 18 Mar 2020 13:25:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAO_nJAYw+-+n584gg2-rRp3KoAsPT5mpD5yRCrwM7hiDMD=PJg@mail.gmail.com>
 <78bdaf48-9699-3a04-efec-95e1a670bfe4@huawei.com>
 <CAO_nJAZ_bW1Bor-sUb8Ouz4VQV28KPZR23njH4VV+eH=BgwR=Q@mail.gmail.com>
 <418f4ee8-14ed-bdfa-d16c-f68c2992f234@huawei.com>
In-Reply-To: <418f4ee8-14ed-bdfa-d16c-f68c2992f234@huawei.com>
From: John <graysky@archlinux.us>
Date: Wed, 18 Mar 2020 16:25:24 -0400
Message-ID: <CAO_nJAYTbPqWKAnG1+i2J1jnEKN6QtiMV_CxVyranZ-AWK9Agg@mail.gmail.com>
To: Chao Yu <yuchao0@huawei.com>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.51 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.51 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jEfb2-00HEMh-L6
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

On Mon, Mar 16, 2020 at 9:44 PM Chao Yu <yuchao0@huawei.com> wrote:
>
> On 2020/3/16 17:52, John wrote:
> > On Sun, Mar 15, 2020 at 9:24 PM Chao Yu <yuchao0@huawei.com> wrote:
> >>
> >> What's your mount option and mkfs option on those two partitions, and what's
> >> your kernel version?
> >
> > I am mounting the partitions with systemd like so (/etc/fstab entry):
> >   LABEL=incoming         /incoming     f2fs  noauto,x-systemd.automount  0 0
> >
> > But I can reproduce this if I totally remove the entries within
> > /etc/fstab, reboot, and mount manually like this:
> >   mount LABEL=incoming /incoming
>
> However, the directory where you trigger trim is "/mnt/media"?
>
> Quoted:
> "Invoking it manually on the newer one gives this:
> # fstrim -v /mnt/media
> fstrim: /mnt/media: the discard operation is not supported"
>
> Could you give more details about that? What device is behind /mnt/media?

The SSD has two partitions on it formatted to F2FS.
LABEL=incoming was created with f2fs-tools v1.12.0
LABEL=media was created with f2fs-tools v1.13.0

The physical device is a Samsung 860 EVO 2TB SSD.

> > Inspecting my shell history, I created them both with this command:
> >   mkfs.f2fs -l incoming /dev/sdb2
> >
> > I am running 5.5.9 on Arch Linux, but I believe I experienced this
> > under previous 5.5.x series as well.
> >
> > If you create a F2FS partition using the latest stable release of
> > f2fs-tools (1.13.0) are you able to reproduce the inability to trim?
>
> I can't, and also there is such option in mkfs to disable trim functionality
> during format.
>

I might be misunderstanding.  When you said "I can't" does that mean
when you created a partition with f2fstools v1.13.0, mounted it, and
then ran the fstrim on it, fstrim completed successfully?  Which
version of fstrim do you have installed?  I am using util-linux
2.35.1.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
