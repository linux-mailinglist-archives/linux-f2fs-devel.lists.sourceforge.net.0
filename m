Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6422D5A07CC
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Aug 2022 06:19:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oR4Ky-0005aV-9S;
	Thu, 25 Aug 2022 04:19:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qkrwngud825@gmail.com>) id 1oR4Kw-0005aK-Rz
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Aug 2022 04:19:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Rf7A1N3M8eXRQTfFVYNwPPvk6e2z76n204IQCLMe0go=; b=VGbx7qDxrgeATsVwFvBN+YBYfP
 hcZuepY8OCLe0vTx8ginTs0ASMcwNHO+bpC+AZBfVRqhsn1mip7SH0FSuSEGEL5uzap47nZd1Erkh
 W0VZL2hzSApnHPFFZEJ/egh6DMe8izZfO6THKi10au3SV4NXMQmmgbRilPkKYEVvJR+A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Rf7A1N3M8eXRQTfFVYNwPPvk6e2z76n204IQCLMe0go=; b=U39bPHF5Pa/8hPGFnScm3sKvKZ
 gpYAskHMEvS2T7y4sNX/yj2UFOQ0BQOR/X+R5E7vdkkdJ1j/3Pl+FnKe4EfZpB757sNonD6DLg13/
 HNVUD1CTepYY+D38No+RifnpK8T+aylrRgfa9n6Yhr4Qx1N2Cu2C3mBKr5PiTeExGViU=;
Received: from mail-ed1-f44.google.com ([209.85.208.44])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oR4Kw-0004NX-4H for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Aug 2022 04:19:22 +0000
Received: by mail-ed1-f44.google.com with SMTP id t5so24506416edc.11
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 24 Aug 2022 21:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=Rf7A1N3M8eXRQTfFVYNwPPvk6e2z76n204IQCLMe0go=;
 b=HfJjtGl1KtGKSrwt4GbSOLfKxPC1KxIVcSho7oaeTgJr2KYTfDPQPIx99inKyesWLS
 YZG1kDI9s8fNFkXuKAELT/oebz0Ta97HJPiil0S9Af2pWd1YQ7pW547xDPvVDwLwNN4z
 4jNn2dzeKtTWPlZ7RYy4ysJcb7VSFLsExikkCeI/pwruJUsbea695pDyb7MKHEiCsn/m
 JJkEqKz58tj4yJ1gBgmr3RsxSoSMhGbQcF03PCD4kWyNxj/w6JnfpQ83p7DkT3zs7J6v
 OOrB9Ko8YCOKypd6vEqv1GgrilMC6YaLyDj0ylGDZFpfmystH69A7aTJXLRRoM7OHDs1
 YfIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=Rf7A1N3M8eXRQTfFVYNwPPvk6e2z76n204IQCLMe0go=;
 b=ykoN+oxfd+YjC6blDSXo/9BulIX7Vs3F6tafc8l6AMubRK+wCsfwO075lQCwZrnKLb
 UFq77ADBgi1qFGWwGsUoAqgmZi+rMc7MCuuEzdPCrzlL0pyTI+pY0rPtGs+mvXH8NDzX
 bHKWTUuRQrOXV876d6V4/2gRWpBi/7xapdz8yAC0d0RUgsYKawwe+56lDiPpLMudcMGJ
 7Z0tdqHIrXpCv9WkZxUBe3c19nsLK9iD3p7v4Cg1x56GvqSIQn02fGSwxicOlYTgHbAF
 +dKY3M6WCml6ZvyV9VATRkzbqD66CVEDQj1dWIKfWiTln1ecuJxIvJ//SIWGB50hEKo4
 dnZg==
X-Gm-Message-State: ACgBeo1asIOKEMCFCUTSzl86DiTlmR9BJY2hlrqm+r+w7D0NtvKSTZKL
 9rHIXVe5CKi2RzhYPzluf4U2PqMpTNymR14N+yU=
X-Google-Smtp-Source: AA6agR64o0dGJm1wGkJEebsAJmMWu3uZGUy52q4NvZOd0SKpY+lDQOoltvzUhV0MyBid91Sn6q6/kAyE5Ti5DNyI1UY=
X-Received: by 2002:a05:6402:328c:b0:446:bcc8:bf49 with SMTP id
 f12-20020a056402328c00b00446bcc8bf49mr1633351eda.309.1661401155587; Wed, 24
 Aug 2022 21:19:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220824044013.29354-1-qkrwngud825@gmail.com>
 <CAJZ5v0jmDeGn-L6U-=JOxOHVy3CRS8T5Y_06F50cL9bjUhgbPQ@mail.gmail.com>
 <CAD14+f1YEoqdnM8eTd2hUHSy+M4+AKQp6_FjV03TK=TSDxPfYw@mail.gmail.com>
 <CAJZ5v0hXAgA2xfYfvXk1GZgu6h+ZVOv_XwgzVS5cpmkiChm7gw@mail.gmail.com>
In-Reply-To: <CAJZ5v0hXAgA2xfYfvXk1GZgu6h+ZVOv_XwgzVS5cpmkiChm7gw@mail.gmail.com>
From: Juhyung Park <qkrwngud825@gmail.com>
Date: Thu, 25 Aug 2022 13:19:03 +0900
Message-ID: <CAD14+f0D4j_76vuPTpGZ+aYKKD3W3NC+reW8vMh=hDHP=wp-SA@mail.gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
X-Spam-Score: 1.3 (+)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Aug 25, 2022 at 12:01 AM Rafael J. Wysocki wrote:
 > > On Wed, Aug 24, 2022 at 3:36 PM Juhyung Park wrote: > > > > Hi Rafael,
 > > > > On Wed, Aug 24, 2022 at 10:11 PM Rafael J. Wysocki wr [...] 
 Content analysis details:   (1.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
 0.3 HK_RANDOM_FROM         From username looks random
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [qkrwngud825[at]gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [qkrwngud825[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.208.44 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.44 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1oR4Kw-0004NX-4H
Subject: Re: [f2fs-dev] [PATCH] PM: suspend: select SUSPEND_SKIP_SYNC too if
 PM_USERSPACE_AUTOSLEEP is selected
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
Cc: chrome-platform@lists.linux.dev, Len Brown <len.brown@intel.com>,
 Linux PM <linux-pm@vger.kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 Kalesh Singh <kaleshsingh@google.com>, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Aug 25, 2022 at 12:01 AM Rafael J. Wysocki <rafael@kernel.org> wrote:
>
> On Wed, Aug 24, 2022 at 3:36 PM Juhyung Park <qkrwngud825@gmail.com> wrote:
> >
> > Hi Rafael,
> >
> > On Wed, Aug 24, 2022 at 10:11 PM Rafael J. Wysocki <rafael@kernel.org> wrote:
> > >
> > > On Wed, Aug 24, 2022 at 6:41 AM Juhyung Park <qkrwngud825@gmail.com> wrote:
> > > >
> > > > Commit 2fd77fff4b44 ("PM / suspend: make sync() on suspend-to-RAM build-time
> > > > optional") added an option to skip sync() on suspend entry to avoid heavy
> > > > overhead on platforms with frequent suspends.
> > > >
> > > > Years later, commit 261e224d6a5c ("pm/sleep: Add PM_USERSPACE_AUTOSLEEP
> > > > Kconfig") added a dedicated config for indicating that the kernel is subject to
> > > > frequent suspends.
> > > >
> > > > While SUSPEND_SKIP_SYNC is also available as a knob that the userspace can
> > > > configure, it makes sense to enable this by default if PM_USERSPACE_AUTOSLEEP
> > > > is selected already.
> > > >
> > > > Signed-off-by: Juhyung Park <qkrwngud825@gmail.com>
> > > > ---
> > > >  kernel/power/Kconfig | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/kernel/power/Kconfig b/kernel/power/Kconfig
> > > > index 60a1d3051cc7..5725df6c573b 100644
> > > > --- a/kernel/power/Kconfig
> > > > +++ b/kernel/power/Kconfig
> > > > @@ -23,6 +23,7 @@ config SUSPEND_SKIP_SYNC
> > > >         bool "Skip kernel's sys_sync() on suspend to RAM/standby"
> > > >         depends on SUSPEND
> > > >         depends on EXPERT
> > > > +       default PM_USERSPACE_AUTOSLEEP
> > >
> > > Why is this better than selecting SUSPEND_SKIP_SYNC from PM_USERSPACE_AUTOSLEEP?
> >
> > That won't allow developers to opt-out from SUSPEND_SKIP_SYNC when
> > they still want PM_USERSPACE_AUTOSLEEP.
>
> I see.
>
> It is not particularly clear, so at least please mention it in the changelog.

Will do.

>
>
> > (Can't think of a valid reason
> > for this though, as PM_USERSPACE_AUTOSLEEP is only used by Android and
> > probably Chromium, afaik.)
> >
> > I don't think SUSPEND_SKIP_SYNC is critical enough to enforce when
> > PM_USERSPACE_AUTOSLEEP is enabled, but I don't have a strong opinion
> > on this either.
> > (We could do `imply SUSPEND_SKIP_SYNC` from PM_USERSPACE_AUTOSLEEP,
> > but that doesn't look good semantically imho.)
> >
> > If you want, I can send a v2 with 'PM_USERSPACE_AUTOSLEEP select
> > SUSPEND_SKIP_SYNC'.
>
> Personally, I would use "select" and I would amend the
> PM_USERSPACE_AUTOSLEEP help text to say that it will disable sync on
> suspend by default explicitly.
>
> IMV otherwise it is more confusing than it needs to be.

Agreed.

>
> I'm also wondering about a particular use case addressed by this
> change.  Is there any?

I've personally manually enabled SUSPEND_SKIP_SYNC for all my Android
kernels for the past 7-8 years (even before SUSPEND_SKIP_SYNC was
implemented upstream) as it was quite apparent that the sync() path
during suspend was quite expensive, more so when the phone was under a
"suspend storm" which tries to enter suspend dozens of times per
second but was aborted/awakened due to devices with spurious
interrupts or suspend code path failures.

Do note that I do not represent any vendor at this moment.

Also, I think I'll have to mention that Google's Android kernel
(GKI/ACK) currently does not enable SUSPEND_SKIP_SYNC by default while
some OEMs do (can't think of which ones to be specific). So this
changes the default Android behavior, which is why I cc'ed Kalesh and
f2fs folks. I do not know if SUSPEND_SKIP_SYNC on Android was simply
overlooked or was consciously disabled. Android userspace also doesn't
change this via sysfs knob.

I still think this patch makes enough sense, but I'd love to hear
others' thoughts.

Thanks.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
