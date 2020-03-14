Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B2718562E
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 14 Mar 2020 19:33:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jDBbX-00048b-7N; Sat, 14 Mar 2020 18:33:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <graysky@archlinux.us>) id 1jDBbU-00048S-T1
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 14 Mar 2020 18:33:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:Subject:Message-ID:Date:From:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=N5bjVfru7PjYxeTK7mVAtuo91ekoPBY+CLgnOz+hK58=; b=hKuglozotMFTxmYs5tpmCnPwpb
 2zZ1uNDPtKbeoJGFyQqEAmFfwvzRhKlbNJ2q78SdSQLryHJmb+9x/Grnhr/OzgV1qG85CSTwIjt1B
 5WvCoDDG9BYRKzaYWcTL0YUO5M6SB69mOQ+gLdiHPn7juVdO/8klDhGTChnzjZ3ncrHA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:Subject:Message-ID:Date:From:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=N5bjVfru7PjYxeTK7mVAtuo91ekoPBY+CLgnOz+hK58=; b=A
 vO7Gvk2OEAHbVOoGQVIigHbgn1MH4qBmxSfFJKe0v4ZmxDGIND8kyvBY9V6XYr8jh+E5cEcT7hITj
 eFibu1dNg8h2CZ95zfZsGa7RWIldxd+UYXE0w/wBmMyDsjDdKCrXVe0LQYP47Yyuw3r3WN4e5SbBI
 GvoA79KH2DhAr1lo=;
Received: from mail-wr1-f68.google.com ([209.85.221.68])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jDBbS-007RSr-0J
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 14 Mar 2020 18:33:44 +0000
Received: by mail-wr1-f68.google.com with SMTP id b2so9986017wrj.10
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 14 Mar 2020 11:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=archlinux-us.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=N5bjVfru7PjYxeTK7mVAtuo91ekoPBY+CLgnOz+hK58=;
 b=tXcEmUXbEsvCmex87s12vVJngcFBQqgdbdMBhFRF3hOBo/2jvlCSO9PSViamy4e5O/
 IN1elt6/yW775vEbYCMiJxcpSVjJ6BTYHTiSAjEb9DTjwIj0umCFNpnvBPibOKqq/zrc
 OX84Q8G07oaS0MdBGsLhd7yYksy71bItOUXqw0jvUM7gDAS0pmzNx+hZ+XRbRVzXAojq
 E9F+v5kJFMkHhIN3yxo6zx/aWUMFUaD0F4Zpmdb8/bF4Y08ez2KfZTmfsQJTr3+/rm1W
 INCg7qGitvJL2WgnyIBOuuC86zbRLcVO+D/Z/Ji0NUGEm6i8YFX86oM3LkCeMaWMYWXV
 v14w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=N5bjVfru7PjYxeTK7mVAtuo91ekoPBY+CLgnOz+hK58=;
 b=oTK7ZFLoXvTp3PGyPmctE5hzCuXljFtzvUJxyDEgn/0+81Ws89rAwaLfD2AUTYN5Kk
 Cn7IA4Av3wsQ+I5EE9w+Dd/YMH6VheGv8clDV83GAtd5afaQYsVwRUkkBCt1o74ojUMT
 hH5gC+a4J1mQ/szt0gE4s2EmAOwVF0dT1YqnrQbqbaHrRGKoix+K4RmXGNUUtWLf/Zs0
 +380Jf0taJibNyf/1ihhGpe1Z8YTD74qnh1YqCONtT3E9mGU8L9KdmFvvTSq8vAd/GBR
 Wgz/Mni1doui0IdYltdGTnaFcCWZIfbAguhTbA0fvir9OD+k18KR5/JjsyhkPYgtuI3v
 3v/A==
X-Gm-Message-State: ANhLgQ10lncYvaSBztEeStb33prPj/345ORFpeUnOvlli231SxKUVQpi
 jccklFLvkSEBSckEUyH4GmEsOgiWK+g7YrQ+JJ6o7SqPDsA=
X-Google-Smtp-Source: ADFU+vtbLqQN7QbCGrteo1CA1S7D73QFAH7wB2c4sTTwC5LVxgxbD44py2HXCTQHAtVEP8SoPjC0UWqHBr3qjX0+3oU=
X-Received: by 2002:adf:a419:: with SMTP id d25mr26351573wra.210.1584209384665; 
 Sat, 14 Mar 2020 11:09:44 -0700 (PDT)
MIME-Version: 1.0
From: John <graysky@archlinux.us>
Date: Sat, 14 Mar 2020 14:09:33 -0400
Message-ID: <CAO_nJAYw+-+n584gg2-rRp3KoAsPT5mpD5yRCrwM7hiDMD=PJg@mail.gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.68 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.68 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jDBbS-007RSr-0J
Subject: [f2fs-dev] fstrim does not recognize FSVER=1.13 of F2FS partitions
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

Running `fstrim -a -v` is not detecting my f2fs partition that I
created just a few days ago but it does detect an older f2fs partition
and trims it as expected.  Both partitions are on the same SSD.  The
older partition is FSVER=1.12 whereas the newer one is FSVER=1.13
(reported by `lsblk -f`).

Invoking it manually on the newer one gives this:
# fstrim -v /mnt/media
fstrim: /mnt/media: the discard operation is not supported

And invoking it manually on the older one gives this:
# fstrim -v /incoming
/mnt/incoming:  1.7 GiB (1762152448 bytes) trimmed on /dev/sda2

Thanks.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
