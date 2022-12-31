Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9456065A3D9
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 31 Dec 2022 12:58:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pBaVF-0004be-VL;
	Sat, 31 Dec 2022 11:58:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jeff.chua.linux@gmail.com>) id 1pBaVD-0004bY-L4
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 31 Dec 2022 11:58:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cOrnvI0ab6Sjve5sOQHxemo9n/r3kg6EiJp9vkQUJjM=; b=Y3gP6zFTMA8ejQcX8lnUkbZTPX
 xsQlp05oY/5MSuUzFx4rOIwxfaNyE4r8Q+AN39IlI4GFhU7WrqrrRhrrEre3sND9u9krWqpYN07nQ
 Bl1DSx66MZHpGjVLEEkyQFHCEYBTxFkIRD52yyPCyec0fkrmkrZfGwZPuk2t7RduXH6k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cOrnvI0ab6Sjve5sOQHxemo9n/r3kg6EiJp9vkQUJjM=; b=nCcBaOa+zvbiRnxu9BsqcOdzRu
 wCpuv+fepLAKZww1mM66urvfoGNqwq1k75Bv9YkvCZ/t+ZHL6d8JtqefuHD2vrCr95kddotcn8eQQ
 EnSoULZLjmBGjOhYcYcLxUsRYkTmaA0/Ox/crchtLXzEOirERwtboHZ1OEXhHMxqDTwo=;
Received: from mail-vs1-f41.google.com ([209.85.217.41])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pBaVD-0006f3-02 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 31 Dec 2022 11:58:15 +0000
Received: by mail-vs1-f41.google.com with SMTP id i188so23581373vsi.8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 31 Dec 2022 03:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cOrnvI0ab6Sjve5sOQHxemo9n/r3kg6EiJp9vkQUJjM=;
 b=MtKezjvPIsHhRoyFqHNbSAluvUbAQU6kH+LAM/3u5vWixb6DiaWyZerKZFFQAg0LTQ
 fuO9GKZZprt6hTT+8iQS2E4OTIg0FmmmGdjk4MehZlxsd+OTZe+QYa9n10Skw5HAJUfA
 mQ5C1IIVo/HURbj1GJZ3nezHvleoDkvknhKsnHKiof3DXn/DfRQSAF0VpY1sCLZgXzv5
 9U/uasy4pimNgWibwyjcskQFYzAKTU+GKJyPr1S4MVedrfCugz67m6ao+9ukPscUHInX
 GCg8NoPMirml/W5MORry72hXqJDdQgWYsFNtsjNv0MkAdEVCvZ2WwUSbC7P/mCGKSRlN
 hFbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cOrnvI0ab6Sjve5sOQHxemo9n/r3kg6EiJp9vkQUJjM=;
 b=xm99BJQJjYLFlkAwfM0g1sMyOCV/g577rOdf54OVFVO7XYha8CI7LUy/88dVadF8sI
 2tod552gpi2PX8XJdgTGoSpAcjvZWtjmqC3FS+l0SSysavuRROrBMbxxxEZ3gcOVDIgx
 fslYoYCEmp+7/qNExg0uUkgc0ZuzLsGFsFcynHupZBRuXaInaXzCVNWQjPW5vNqBxlJi
 xwj3MotKcHZ+07/UlNGLpduGccMW2XCRG8SFyS0uwvj6mN97WI8AItAKFtbtCBDanwGD
 MmmDolP08ftOTrTRMhr+PDPcDLJdQJlSAR4mWhtCDJho3V/bl/Oo4t+p0b8xvqFK87wz
 fNgw==
X-Gm-Message-State: AFqh2krn+0vb/OFK1CrMcoRqgrMvNDtoalJdpLjrja4U8yFal9T4Lx51
 Pb6o2NARVK9gg3yShVPAvkRj1I7Ma/7jrBBgRzk=
X-Google-Smtp-Source: AMrXdXvmrFy/BahM6IhJ/dZcwp0qFkpovr9HhfOLOhDeYWbvUZXOjO5a/9D8fhZSd28YTNZEJ7ujRNGogWc/fSYVlSE=
X-Received: by 2002:a67:ee93:0:b0:3b2:a92d:a1f0 with SMTP id
 n19-20020a67ee93000000b003b2a92da1f0mr4111536vsp.46.1672487888989; Sat, 31
 Dec 2022 03:58:08 -0800 (PST)
MIME-Version: 1.0
References: <CAAJw_Ztzyh-GNTJYpXbA0CeJv2Rz=fLZKE6_Q=7JMmM+s9yHXQ@mail.gmail.com>
 <CAAJw_Ztb0mJVkHtBhryf=9g8CA0fZZRa8HVio8GCGUSLOvqa7A@mail.gmail.com>
 <Y6bz4wOC0nwu2yGU@debian.me> <0c70ba66-ef00-7242-d198-844f803662fa@gmail.com>
 <CAAJw_Zv0iBg4rkzxQ2UOOLS9JQZ4cCmM7gSoDXec_gm-GggB6A@mail.gmail.com>
 <f500d64b-c26d-ee34-092a-421c64c69f9e@leemhuis.info>
 <Y66Hk6waTeXQDz1/@sol.localdomain>
 <3dd9808e-ffbd-7959-2111-a9f13f2031f1@kernel.org>
In-Reply-To: <3dd9808e-ffbd-7959-2111-a9f13f2031f1@kernel.org>
From: Jeff Chua <jeff.chua.linux@gmail.com>
Date: Sat, 31 Dec 2022 19:57:58 +0800
Message-ID: <CAAJw_ZsLjw=+_oju-8Mxy-nEErUYc9ZPfDyX204yiJ7mA8u5gA@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat, Dec 31, 2022 at 10:51 AM Chao Yu wrote: > > Hi Jeff, 
 > > On 2022/12/30 14:39, Eric Biggers wrote: > > If you could provide the
 mkfs and mount options you are using, and any other > > relevan [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [jeff.chua.linux[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.217.41 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.217.41 listed in wl.mailspike.net]
X-Headers-End: 1pBaVD-0006f3-02
Subject: Re: [f2fs-dev] Fwd: f2fs write error Linux v6.2
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
Cc: Linux Regressions <regressions@lists.linux.dev>,
 lkml <linux-kernel@vger.kernel.org>,
 F2FS Development <linux-f2fs-devel@lists.sourceforge.net>,
 Eric Biggers <ebiggers@kernel.org>,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 Bagas Sanjaya <bagasdotme@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sat, Dec 31, 2022 at 10:51 AM Chao Yu <chao@kernel.org> wrote:
>
> Hi Jeff,
>
> On 2022/12/30 14:39, Eric Biggers wrote:
> > If you could provide the mkfs and mount options you are using, and any other
> > relevant details, that would be helpful.  Bisection would also be very helpful,
> > as Thorsten mentioned.

I was just preparing my environment so I could hit the same issue
before I go for the bisect, so I don't need to reboot every time. Got
to a point where I could just qemu kvm + initrd ramdisk with / (f2fs)
and I could hit the problem almost every 8/10 runs just by doing
"mount -o remount /" and the system would freeze. That's good. I've a
good test case! ... and then I see Chao Yu's patch ...

> Other than that, I found some cases which can cause similar issue, so I figure
> out a patch for possible fixing, if you can have a try with it to check whether
> it can fix your issue, that would be helpful as well.
>
> https://lore.kernel.org/linux-f2fs-devel/20221230154332.5082-1-chao@kernel.org/T/#u

Ok, the patch seems to fix the problem. I'll run my qemu kvm
environment a few more times before I switch the real system. Because
it's not a that I could cause a real "mount -o remount /" freeze or
"vi /etc/passwd" fault all the time,

Will feedback soon. This would a very nice year end celebration so I
could move to 6.2.0-rc1.

Thank you!

Jeff


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
