Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6C018FE7C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Mar 2020 21:13:01 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jGTRL-00065e-MM; Mon, 23 Mar 2020 20:12:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <graysky@archlinux.us>) id 1jGTR7-00064r-Qw
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Mar 2020 20:12:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zTpPCp7Nhx1fPfC7diG6rpJ08dQiP3WnHwoiWd+KCqo=; b=II/vfMcZDDHr/t/lmHMPUR35fA
 7hdDdR84y+tPp0zl16Anb1w7uidnBPP+LxgpT8RdRhHTPINCiT6/1LJlx37/4dOPO9QVj1Os5rcsW
 06cunP2uYxCKiX4QPb87y0QBRGpP9WAzTSLwF2r/eQWreV2cVJ5vaiwbAeOyVPo2leCk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zTpPCp7Nhx1fPfC7diG6rpJ08dQiP3WnHwoiWd+KCqo=; b=bJBL4oCnovne9IhDnTCLasbYjv
 NZAjYiV01rV9n0m1/VXDWc7oUv1iK2unqEHAuaHJXKVlbIuEt3DEKLW/De6ewwN074eB+122u9Ou7
 UOEBhO6Bht9k3co5f1mQWi/F1BvE5mpmIeXjPouKvlruRl/FSiIMT4GkmTAY/WkAJN7Q=;
Received: from mail-wm1-f50.google.com ([209.85.128.50])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jGTR3-001Gzr-DE
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Mar 2020 20:12:37 +0000
Received: by mail-wm1-f50.google.com with SMTP id c81so829867wmd.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 23 Mar 2020 13:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=archlinux-us.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zTpPCp7Nhx1fPfC7diG6rpJ08dQiP3WnHwoiWd+KCqo=;
 b=qtn5om1oUNLne4J8WrmsUXkVjfp+uGNS+g59UNXn+TWI0qmcGxJadVt6a2TmjlzVmo
 NqbWqQ2cqR0qs9mGiaKL5ZD3ynrEXPTMPAagRwZS2zxLJGnOqfUtkkpj1KdxUZWCTM+C
 nZYxakRM4L6xj2fXBZbzOBcPpZOaoxCdksNoEuQIrDn1lfUGXCVgEiYn1d2SuO4xdHkp
 9Bh2zdn0M5fJbpqaP6Te3CvVKvhnkza22xC6lYXOnzyjQZ+ERdQIiRHj5MgRrG90ZrSU
 EsW+Pw3BtkiEn3RVI6ZchZhlKM03q58VuASMGpAbKEX7YeFjxf/m0q7SugV/67OqAKh/
 PjiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zTpPCp7Nhx1fPfC7diG6rpJ08dQiP3WnHwoiWd+KCqo=;
 b=bvbbkAXo24iUOPVXjFX0ndq7WAe2qJnIolAbr02rs5cFE8gMzJLen3ge0W7TdI22ak
 wpA25kgz+bER7T+oabk4mPZEFyZJj0Dk8KQ24IsJNUN++ZO+w7kB7BgHieUFCiy+ZOcj
 Ya1NqFIipmV3lPQIIStTMNY2x0nSY1WgJPfqPHB1RsU0wVNGd63FIkTkaihh/an5Lx3t
 MUcT5RIkdN3I9l9Hq8lIWu52v9XSHYt/R/HiGq9+9YkkeUmn5jEZ7VlahamlARHT9ELn
 ELeStreSV8knruNKOQ4+lupvfEdpOKX12mfks24kNIVOtQnbDoU1Avb+DtSr3mP6bg1K
 70Pg==
X-Gm-Message-State: ANhLgQ3ilTnAoXminV4Q2VMhJjjM4NX52yBLyMtqrBm9+al0WNKILXGH
 JzUyc65Hc5X7LrkHallYU9xq6keUxNblukC/AvcLtg==
X-Google-Smtp-Source: ADFU+vtNx+ZOQNXaQpgp3IyYdmqBI/tm2W9VlY1nmUUYxGdgLE95DtnkmL3kZXx4ohLwlCaGAoqf6tthW2ixJSu5ZnQ=
X-Received: by 2002:a1c:c3c3:: with SMTP id t186mr1240250wmf.118.1584994342744; 
 Mon, 23 Mar 2020 13:12:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAO_nJAYw+-+n584gg2-rRp3KoAsPT5mpD5yRCrwM7hiDMD=PJg@mail.gmail.com>
 <78bdaf48-9699-3a04-efec-95e1a670bfe4@huawei.com>
 <CAO_nJAZ_bW1Bor-sUb8Ouz4VQV28KPZR23njH4VV+eH=BgwR=Q@mail.gmail.com>
 <418f4ee8-14ed-bdfa-d16c-f68c2992f234@huawei.com>
 <CAO_nJAYTbPqWKAnG1+i2J1jnEKN6QtiMV_CxVyranZ-AWK9Agg@mail.gmail.com>
 <20200323041143.GC147648@google.com>
 <CAO_nJAYEGp1129PsFwMdU0ZdjC75DoL60nXhY7KaATgSPz-2DA@mail.gmail.com>
 <20200323150205.GA119787@google.com>
In-Reply-To: <20200323150205.GA119787@google.com>
From: John <graysky@archlinux.us>
Date: Mon, 23 Mar 2020 16:12:11 -0400
Message-ID: <CAO_nJAbyEcTR4wFytJp1HQmQBDzpwycKhA_-FUwo39WVMceuZw@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.50 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.50 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jGTR3-001Gzr-DE
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

On Mon, Mar 23, 2020 at 11:02 AM Jaegeuk Kim <jaegeuk@kernel.org> wrote:
> > /dev/mapper/media-crypt /mnt/media f2fs
> > rw,lazytime,relatime,background_gc=on,discard,no_heap,user_xattr,inline_xattr,acl,inline_data,inline_dentry,flush_merge,extent_cache,mode=adaptive,active_logs=6,alloc_mode=default,fsync_mode=posix
>
> - media-crypt means dm-crypt? Any chance to try raw sda?

Yes, it is dm-crypt.

> Could you try this?
> - mount -o remount,nodiscard
>  : The reason is, as f2fs uses async discard feature with -o discard, it doesn't
>    give 0 bytes on fstrim sometimes.

I can confirm it is mounted now with the nodiscard option, but fstrim
still claims discard is not supported.

% mount | grep crypt
/dev/mapper/media-crypt on /mnt/media type f2fs
(rw,relatime,lazytime,background_gc=on,nodiscard,no_heap,user_xattr,inline_xattr,acl,inline_data,inline_dentry,flush_merge,extent_cache,mode=adaptive,active_logs=6,alloc_mode=default,fsync_mode=posix,x-systemd.automount)

# fstrim -v /mnt/media
fstrim: /mnt/media: the discard operation is not supported


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
