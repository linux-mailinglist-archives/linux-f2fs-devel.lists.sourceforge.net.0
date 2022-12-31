Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A6165A41F
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 31 Dec 2022 13:41:59 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pBbBR-0004Zk-9k;
	Sat, 31 Dec 2022 12:41:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jeff.chua.linux@gmail.com>) id 1pBbBQ-0004Zb-SR
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 31 Dec 2022 12:41:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Dhd/1RDPWdGhndisco2GPJg8lagzsvfapqotzaFZeN0=; b=aY8ZaGCwcBMKoByUGO/Zh7fkXf
 VlPBtjeTFh4x+CQOZAKu82zXlRjd5NBLh4qTjeY1MDV4j0APLc3S1guiOpU1FAhC9LejqkQLvSXHB
 Xc/wlaRlagrBkatHVdpcnVAJ+7CWbtvmU1rX+2wW75cs2Lx/B3UWHPlarbY7ff+kp7Lc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Dhd/1RDPWdGhndisco2GPJg8lagzsvfapqotzaFZeN0=; b=kMYpMIZxBMj+zoqJa4ESfWEjIJ
 inanRVAa0REqGcaRngTdV6hStii8LFLZdc+dYPLZ7UZ27Q4VoxVwcdZvWr/QMtCBzp0Pl82CiWJ/M
 KuCLX1C47Tz+zyBZnkGpZeevUO/y7gEHihbog0PRaHlD5J8o0QdFyBbY2yRtQnZDRlTE=;
Received: from mail-vs1-f44.google.com ([209.85.217.44])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pBbBP-000RRY-6e for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 31 Dec 2022 12:41:52 +0000
Received: by mail-vs1-f44.google.com with SMTP id p30so18032638vsr.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 31 Dec 2022 04:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Dhd/1RDPWdGhndisco2GPJg8lagzsvfapqotzaFZeN0=;
 b=KlA6GR9uSv47bhi4irs+lJ4qtPQXyHlhcdsEplotgdA8ieXoiqtcqMlxIAyrX/s3mH
 gvETGpe5A9WF70ZvC1D2WGI+Q65qrB891YSRIJR5/PIOhjARH4NzsHQUqMqtz1HaNCM3
 OI35+HdTcKpNWFXdH5/5nd7L5P4gYz9N6wNz5QmQfgCuuV9tCmoTlV5t+9VQTAtSCePk
 3WvXlOQaWd53SMvgvV0d2AjQpyd9ak9OAJ8vq1Az9YpailVU6xAIfeIJ8f3tgDUBlVBj
 0trUHKAazvVf2iQUTV6b8xyLM6b6/FkIpAc92DqPQve3g64iJLw2Cui6h41Fxiq9xtwA
 sTBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Dhd/1RDPWdGhndisco2GPJg8lagzsvfapqotzaFZeN0=;
 b=Ncca1JCGwzIzxQuDrSsCvvAqDD+NWav2M1Le+yu5C2usmW1BylvenfKCJDXtFrelNr
 FC4OaDOke1LHZJuEoDLa+wGDtFa+uOwawQbMdzykS3RidIY2wn+/Ovm3YbvW4t/kN5Fb
 U/aKfESTmSrGPHMnn6R/Svp98V0LppMmB7L40xG32ynwsMXoBXmp8/4UwIsKQzNly3pq
 lEfv5/g17rRUJ6f3ORjEvVsxF+PsrbztAlRNN7WgHitSQkf2wqfIV0gnVytyX5oq4TsX
 uSj68pDpLgeK3Fcw3L6fzAt96WuEqhiBpHqRX1dyTaCmiEAhSoAeO0eP6eS6snVs3u6s
 mFvg==
X-Gm-Message-State: AFqh2kqBAyw2VpQ7+y16OCLaSWmUIOvXBEtmk/697aNGQ5HvkcwkB9gH
 tUgJwWi04ZhsBacymVYq3BCMpa4jkBT6Zpq0kkY=
X-Google-Smtp-Source: AMrXdXssK+4FN6JAbwXkx/gRsPfboiOtjxI12zKDRLjV4MNwgLqRUEvHm2L2Mw5x7Vn2TeD4PxatDeWhe7wfdR2sQ7M=
X-Received: by 2002:a67:fd48:0:b0:3c9:59f7:2486 with SMTP id
 g8-20020a67fd48000000b003c959f72486mr1795232vsr.50.1672490505235; Sat, 31 Dec
 2022 04:41:45 -0800 (PST)
MIME-Version: 1.0
References: <CAAJw_Ztzyh-GNTJYpXbA0CeJv2Rz=fLZKE6_Q=7JMmM+s9yHXQ@mail.gmail.com>
 <CAAJw_Ztb0mJVkHtBhryf=9g8CA0fZZRa8HVio8GCGUSLOvqa7A@mail.gmail.com>
 <Y6bz4wOC0nwu2yGU@debian.me> <0c70ba66-ef00-7242-d198-844f803662fa@gmail.com>
 <CAAJw_Zv0iBg4rkzxQ2UOOLS9JQZ4cCmM7gSoDXec_gm-GggB6A@mail.gmail.com>
 <f500d64b-c26d-ee34-092a-421c64c69f9e@leemhuis.info>
 <Y66Hk6waTeXQDz1/@sol.localdomain>
 <3dd9808e-ffbd-7959-2111-a9f13f2031f1@kernel.org>
 <CAAJw_ZsLjw=+_oju-8Mxy-nEErUYc9ZPfDyX204yiJ7mA8u5gA@mail.gmail.com>
In-Reply-To: <CAAJw_ZsLjw=+_oju-8Mxy-nEErUYc9ZPfDyX204yiJ7mA8u5gA@mail.gmail.com>
From: Jeff Chua <jeff.chua.linux@gmail.com>
Date: Sat, 31 Dec 2022 20:41:34 +0800
Message-ID: <CAAJw_ZvFvKx+mVd+pWMPVvEnOPkmBBETMqrA_P-3wRGW5HRkDw@mail.gmail.com>
To: Chao Yu <chao@kernel.org>, Yangtao Li <frank.li@vivo.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat, Dec 31, 2022 at 7:57 PM Jeff Chua wrote: > > On Sat, 
 Dec 31, 2022 at 10:51 AM Chao Yu wrote: > > > > Hi Jeff, > > > > On 2022/12/30
 14:39, Eric Biggers wrote: > > > If you could provide th [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [jeff.chua.linux[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.217.44 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.217.44 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1pBbBP-000RRY-6e
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

On Sat, Dec 31, 2022 at 7:57 PM Jeff Chua <jeff.chua.linux@gmail.com> wrote:
>
> On Sat, Dec 31, 2022 at 10:51 AM Chao Yu <chao@kernel.org> wrote:
> >
> > Hi Jeff,
> >
> > On 2022/12/30 14:39, Eric Biggers wrote:
> > > If you could provide the mkfs and mount options you are using, and any other
> > > relevant details, that would be helpful.  Bisection would also be very helpful,
> > > as Thorsten mentioned.
>
> I was just preparing my environment so I could hit the same issue
> before I go for the bisect, so I don't need to reboot every time. Got
> to a point where I could just qemu kvm + initrd ramdisk with / (f2fs)
> and I could hit the problem almost every 8/10 runs just by doing
> "mount -o remount /" and the system would freeze. That's good. I've a
> good test case! ... and then I see Chao Yu's patch ...
>
> > Other than that, I found some cases which can cause similar issue, so I figure
> > out a patch for possible fixing, if you can have a try with it to check whether
> > it can fix your issue, that would be helpful as well.
> >
> > https://lore.kernel.org/linux-f2fs-devel/20221230154332.5082-1-chao@kernel.org/T/#u
>
> Ok, the patch seems to fix the problem. I'll run my qemu kvm
> environment a few more times before I switch the real system. Because
> it's not a that I could cause a real "mount -o remount /" freeze or
> "vi /etc/passwd" fault all the time,
>
> Will feedback soon. This would a very nice year end celebration so I
> could move to 6.2.0-rc1.

Ok, no more freeze, no more errors! All good. I'm finally on the
latest linux-6.2.0-rc1 with the patch.

Happy new year!

My best,
Jeff


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
