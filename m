Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7995BED8
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  1 Jul 2019 16:58:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hhxlU-0007WA-O5; Mon, 01 Jul 2019 14:58:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <arndbergmann@gmail.com>) id 1hhxlS-0007Vd-Q9
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Jul 2019 14:58:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wYPUdrH4rwqGcTGw5ZdGUH3QSotQNpnBmXpSrhpI2OY=; b=dUsyrqTWfku5N0qJjZqicO4ccp
 Y01dP3QaUyTtZJCZW4SzZGqLUMbII76yl/py8s80GqzgOMmEET/ELfxaaTlg19/vaOQj3isO/Ttz+
 6mG7H3OoU6xvTZopB/ZSs6D/H1IEqrFqf0/VjxdvXMlnIgtST5KceP6/9lUGVidXU0fM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wYPUdrH4rwqGcTGw5ZdGUH3QSotQNpnBmXpSrhpI2OY=; b=KoMRt3q2ZCG2UAlKDBaKWRTjbP
 LjyJ4+Aj58e5zDhf1NNQsPQqZSxFy1F1ZbQj3qqIUEm2esfbhEpLwZe0uWLA6NdEoJSOfnU4BgVF2
 v3BAAwxFzBzowcU9HCljczga1DMwojqRqpc4Cu9y5Z8X2zl8HElSLhI0k4PufMZH+kug=;
Received: from mail-qk1-f194.google.com ([209.85.222.194])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hhxlV-003D9D-Gj
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Jul 2019 14:58:47 +0000
Received: by mail-qk1-f194.google.com with SMTP id m14so11199946qka.10
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 01 Jul 2019 07:58:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wYPUdrH4rwqGcTGw5ZdGUH3QSotQNpnBmXpSrhpI2OY=;
 b=W6Qc2+J9fhtAJyoON1030lZmF6RmtI9wBNFk+NF+wsD1UaKshulXhzsSNhc31KAby6
 n+ySU17l8Iftsy5udEPKHJ//shs3dFFa9n5d751BRZQ0MZ7Vm3jD/hFGl+Tl0Uhvk965
 MWE1ggE0TtHaCgYfDpIZALL8YTc8zPUofjKog8Q8FC22kz78cQQ9bXU6L+ui45iOIXBU
 eYhLdYlC8sK07Y5IFmyAMhgBZo2YfSr4LR76hS9bedYxY0m5yDgn10IvQNdb/fDuyE5V
 GCKAgYuU47m+rzZAQnfB4Tb5G2y3xMCTAbB+CphDVC2WamGvFghtOy1ogl9/ZvE4qeXd
 +ZyA==
X-Gm-Message-State: APjAAAWZMC8HRV9AWMrJkuX1DkLJNSBWjCoFOzPapsK1sblcIsDVeyoo
 d2M5gkmxvwcQHrpROkdi8Xsu2f/4p0BJByJNf0c=
X-Google-Smtp-Source: APXvYqzW0scNhmgaP30TW42l5BV3v+F8ylQUDtigpiOBj0tUz731pKZzDIRDVYOsVfehdePPdz5cnTvDfz2jjGCBE0I=
X-Received: by 2002:a37:76c5:: with SMTP id
 r188mr20631949qkc.394.1561993119317; 
 Mon, 01 Jul 2019 07:58:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190628104007.2721479-1-arnd@arndb.de>
 <20190628124422.GA9888@infradead.org>
 <CAK8P3a1jwPQvX6f+eMZLdnF2ZawDB9obF3hjk2P9RJxDr6HUQA@mail.gmail.com>
 <20190628131738.GA994@infradead.org>
 <CAK8P3a0t+vGge8uDOuwex6j+ddaUqovxCXoJOO8Ec3z6_brvsg@mail.gmail.com>
 <20190628175835.hwzfrgrtwphi6kka@shell.armlinux.org.uk>
In-Reply-To: <20190628175835.hwzfrgrtwphi6kka@shell.armlinux.org.uk>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 1 Jul 2019 16:58:23 +0200
Message-ID: <CAK8P3a1AdseCGhg2aNkvtfCd-Wn2-rG9Z_LbvkkheGnbpT8EWA@mail.gmail.com>
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (arndbergmann[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.222.194 listed in list.dnswl.org]
 -0.1 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.194 listed in wl.mailspike.net]
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and EnvelopeFrom
 freemail headers are different
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hhxlV-003D9D-Gj
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix 32-bit linking
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
Cc: Eric Biggers <ebiggers@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Wang Shilong <wangshilong1991@gmail.com>, "Linux F2FS DEV,
 Mailing List" <linux-f2fs-devel@lists.sourceforge.net>,
 Christoph Hellwig <hch@infradead.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Qiuyang Sun <sunqiuyang@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jun 28, 2019 at 7:58 PM Russell King - ARM Linux admin
<linux@armlinux.org.uk> wrote:
>
> On Fri, Jun 28, 2019 at 04:46:14PM +0200, Arnd Bergmann wrote:
> > On Fri, Jun 28, 2019 at 3:17 PM Christoph Hellwig <hch@infradead.org> wrote:
> > >
> > > On Fri, Jun 28, 2019 at 03:09:47PM +0200, Arnd Bergmann wrote:
> > > > I came across this on arm-nommu (which disables
> > > > CONFIG_CPU_SPECTRE) during randconfig testing.
> > > >
> > > > I don't see an easy way to add this in there, short of rewriting the
> > > > whole __get_user_err() function. Any suggestions?
> > >
> > > Can't we just fall back to using copy_from_user with a little wrapper
> > > that switches based on sizeof()?
> >
> > I came up with something now. It's not pretty, but seems to satisfy the
> > compiler. Not a proper patch yet, but let me know if you find a bug.
>
> Have you checked what the behaviour is when "ptr" is a pointer to a
> pointer?  I think you'll end up with a compiler warning for every
> case, complaining about casting an unsigned long long to a pointer.

I have built lots of kernels using this patch as a test, though my autobuilder
is currently configured to use clang-8, and other compilers or versions
might show more warnings.

> >         uaccess_restore(__ua_flags);                                    \
> > -       (x) = (__typeof__(*(ptr)))__gu_val;                             \
> > +       (x) = __builtin_choose_expr(sizeof(*(ptr)) == 8,                \
> > +               (__typeof__(*(ptr)))__gu_val8,                          \
> > +               (__typeof__(*(ptr)))__gu_val);                          \
> >  } while (0)

The __builtin_choose_expr() here is supposed to take care of the case
of a pointer type, gcc and clang should both ignore the non-taken
branch and only produce warnings for the case they actually use.

       Arnd


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
