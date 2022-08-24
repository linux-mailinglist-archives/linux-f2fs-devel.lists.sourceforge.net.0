Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB4C59FDB6
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Aug 2022 17:01:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oQrsY-0003In-8J;
	Wed, 24 Aug 2022 15:01:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <rjwysocki@gmail.com>) id 1oQrsW-0003Id-3M
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Aug 2022 15:01:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=w/neHTaTWq1ptoHqjo7z/PdpJgw6jeoMDrumR+964UM=; b=UF7biiqYP0H1FcbRtAR+05d5qK
 Xzyno7/wxHeT97qNBVz1s2X1hvmkVP2sS+yQ5yP9lF7d0T7Vau+E5Vwforrn3hGw+oQkIUKblkjSS
 kI5pjDxCi9yz3i00s6/L+ptDfk7Zmq0iCRwwGl2Am+t8AqX8lV+mqXY5d5H75PSLhm7E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=w/neHTaTWq1ptoHqjo7z/PdpJgw6jeoMDrumR+964UM=; b=O/NZwYNVdy/ydGogBZmYMT4J1q
 NTsDte7R71hQ38eKfhPWPsMIxhHcwJpdNWtXRCWDbdV4X9GiPD8lv+cGPGAjYdOIQwqyRDCMSR1h1
 OixtqwJohU6e3Xo2C1wyewVju0yezUaR2QjrwYXgCD/lW6gy0/NkvDaM4mxRjx0NzrCA=;
Received: from mail-yw1-f169.google.com ([209.85.128.169])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oQrsR-0000Nd-34 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Aug 2022 15:01:11 +0000
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-3375488624aso438080637b3.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 24 Aug 2022 08:01:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=w/neHTaTWq1ptoHqjo7z/PdpJgw6jeoMDrumR+964UM=;
 b=OfS2QLZ12uhZfBTbFKxRybPwGJntHMxVNzZgKuQRxM1W8fXn7jp620I1zS6/IEbnGv
 OCUcU0hyVoaRnww2FxsMZXTZcFT2rpu42KL0i8Gy11TBectHzs4yBx5QI7PuGQHu52yW
 mTvJyoAVesLbTSLPisCSK04ex/XPuDZfimcvHjLezzMrp8F0EzNkXGpJ6Z7SNscFhBW9
 EWppcj1s55qgHUwB4w4ik5qQRIeU+NoGbump1Wb4xEnd+NMdx1JDXFMmQUhMpmjG4dxO
 3Aup+cK6R3JX7RD+MHB5Ioe58XfKyPotwVqJbDkzBNhzlC00NTMLG3nzFSAiEzjhnxVM
 y7LQ==
X-Gm-Message-State: ACgBeo0GbKUfb7dkehrWKldVgoprRT/or1qt+6ogZWyNBK9Tz/oFbuhY
 Sf/JAee97Pq2P93esna+7gqjIL4DkC7YncMw5/c=
X-Google-Smtp-Source: AA6agR6/lAmWch493Semg1Kd4FFp/bUFNZNfcthgZaX2pgKcypwxarkt1Qr548YVHjI6HNTUbTAocunJffuYpdMzP2I=
X-Received: by 2002:a25:b749:0:b0:68f:171f:96bd with SMTP id
 e9-20020a25b749000000b0068f171f96bdmr29627443ybm.137.1661353261244; Wed, 24
 Aug 2022 08:01:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220824044013.29354-1-qkrwngud825@gmail.com>
 <CAJZ5v0jmDeGn-L6U-=JOxOHVy3CRS8T5Y_06F50cL9bjUhgbPQ@mail.gmail.com>
 <CAD14+f1YEoqdnM8eTd2hUHSy+M4+AKQp6_FjV03TK=TSDxPfYw@mail.gmail.com>
In-Reply-To: <CAD14+f1YEoqdnM8eTd2hUHSy+M4+AKQp6_FjV03TK=TSDxPfYw@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 24 Aug 2022 17:00:49 +0200
Message-ID: <CAJZ5v0hXAgA2xfYfvXk1GZgu6h+ZVOv_XwgzVS5cpmkiChm7gw@mail.gmail.com>
To: Juhyung Park <qkrwngud825@gmail.com>
X-Spam-Score: 0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Aug 24,
 2022 at 3:36 PM Juhyung Park <qkrwngud825@gmail.com>
 wrote: > > Hi Rafael, > > On Wed, Aug 24, 2022 at 10:11 PM Rafael J. Wysocki
 <rafael@kernel.org> wrote: > > > > On Wed, Aug 24, 202 [...] 
 Content analysis details:   (0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [rjwysocki[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.169 listed in wl.mailspike.net]
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1oQrsR-0000Nd-34
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
 Linux PM <linux-pm@vger.kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, Kalesh Singh <kaleshsingh@google.com>,
 linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Aug 24, 2022 at 3:36 PM Juhyung Park <qkrwngud825@gmail.com> wrote:
>
> Hi Rafael,
>
> On Wed, Aug 24, 2022 at 10:11 PM Rafael J. Wysocki <rafael@kernel.org> wrote:
> >
> > On Wed, Aug 24, 2022 at 6:41 AM Juhyung Park <qkrwngud825@gmail.com> wrote:
> > >
> > > Commit 2fd77fff4b44 ("PM / suspend: make sync() on suspend-to-RAM build-time
> > > optional") added an option to skip sync() on suspend entry to avoid heavy
> > > overhead on platforms with frequent suspends.
> > >
> > > Years later, commit 261e224d6a5c ("pm/sleep: Add PM_USERSPACE_AUTOSLEEP
> > > Kconfig") added a dedicated config for indicating that the kernel is subject to
> > > frequent suspends.
> > >
> > > While SUSPEND_SKIP_SYNC is also available as a knob that the userspace can
> > > configure, it makes sense to enable this by default if PM_USERSPACE_AUTOSLEEP
> > > is selected already.
> > >
> > > Signed-off-by: Juhyung Park <qkrwngud825@gmail.com>
> > > ---
> > >  kernel/power/Kconfig | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/kernel/power/Kconfig b/kernel/power/Kconfig
> > > index 60a1d3051cc7..5725df6c573b 100644
> > > --- a/kernel/power/Kconfig
> > > +++ b/kernel/power/Kconfig
> > > @@ -23,6 +23,7 @@ config SUSPEND_SKIP_SYNC
> > >         bool "Skip kernel's sys_sync() on suspend to RAM/standby"
> > >         depends on SUSPEND
> > >         depends on EXPERT
> > > +       default PM_USERSPACE_AUTOSLEEP
> >
> > Why is this better than selecting SUSPEND_SKIP_SYNC from PM_USERSPACE_AUTOSLEEP?
>
> That won't allow developers to opt-out from SUSPEND_SKIP_SYNC when
> they still want PM_USERSPACE_AUTOSLEEP.

I see.

It is not particularly clear, so at least please mention it in the changelog.


> (Can't think of a valid reason
> for this though, as PM_USERSPACE_AUTOSLEEP is only used by Android and
> probably Chromium, afaik.)
>
> I don't think SUSPEND_SKIP_SYNC is critical enough to enforce when
> PM_USERSPACE_AUTOSLEEP is enabled, but I don't have a strong opinion
> on this either.
> (We could do `imply SUSPEND_SKIP_SYNC` from PM_USERSPACE_AUTOSLEEP,
> but that doesn't look good semantically imho.)
>
> If you want, I can send a v2 with 'PM_USERSPACE_AUTOSLEEP select
> SUSPEND_SKIP_SYNC'.

Personally, I would use "select" and I would amend the
PM_USERSPACE_AUTOSLEEP help text to say that it will disable sync on
suspend by default explicitly.

IMV otherwise it is more confusing than it needs to be.

I'm also wondering about a particular use case addressed by this
change.  Is there any?


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
