Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C69C859FB7A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Aug 2022 15:36:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oQqYP-0006FG-Uz;
	Wed, 24 Aug 2022 13:36:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qkrwngud825@gmail.com>) id 1oQqYO-0006FA-9q
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Aug 2022 13:36:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YJF/VwA2mzDN6MSkPG2T+mKWxJTEYBZ1TSfzmhRiSak=; b=KjzEpm5UNo+0zPc0xIJ1Cjjabm
 6rcB1trMUw0Z16fiXMzqNxxIpMhUv1srHdw00qBl73NlBHdUnN/uLZWfnO34TDxbFR2p6oejrrpiH
 yZZs5eA8LwFQ3Gs4Qk6rFK8HtHn4sgf1ZKgDW9b7P9eJVbAVd7BpeXfprWnbleFrlW98=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YJF/VwA2mzDN6MSkPG2T+mKWxJTEYBZ1TSfzmhRiSak=; b=OOuIqsZsmjZu8a3mkUwG2sHdBX
 CRrtkghxLT3YQ/h1DM9phFac1Lu5Bds+I2K9sByrHQd1RZUiyaLBUnBPpyVai58pYfy2ujvLO3sA2
 2UrvLXxWRjmEnfdb3D4icPvxIKrTxQUxOSFMUQ1uoypbaMiEKN1+bntUZSIk4KixBJ+g=;
Received: from mail-ej1-f47.google.com ([209.85.218.47])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oQqY7-0000JP-5l for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Aug 2022 13:36:20 +0000
Received: by mail-ej1-f47.google.com with SMTP id u15so24897050ejt.6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 24 Aug 2022 06:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=YJF/VwA2mzDN6MSkPG2T+mKWxJTEYBZ1TSfzmhRiSak=;
 b=R9gl5wXeQfCG8uiYehnAeR3v/OEYCuTPDmd/1TNe0sotS6OatzHswNMV+vpydDeuZ+
 Nry6Uw7h6RaXcLOXUdUP1JO3/cqsz8UaaPA3D9ek55/RD3uHWHAz3nmJ4sfnx/uRPS57
 FsNKpwySB94vkx6KFQlV1JRnY1hoWZziD1C8HUquIpxYa0DNSP/np0MVmb9NzrMi/FNt
 H/p29EYX8l8mNG3XdMcZz8XTPlfHM8MP9K2VLaWA7J1trYkBBmpGqkrlqXCGoCQuTm0c
 ek833ROccmN71xDurLvPkf5+d06+GDQnhcXcvyGV5i0MKsyfz2nUo6Es5k1kjReVjE1t
 H71Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=YJF/VwA2mzDN6MSkPG2T+mKWxJTEYBZ1TSfzmhRiSak=;
 b=hSjhpyc/YmoTwAWt/aNWLTVp+8+DJ6jkL9aflkT5r8FOpP8JG36mg2Mh16TePmlUs6
 L921MokBhCL4duyvDmPVQnuNx3wIltwzO5IpjulyOuk9+l1w7TUR+PH7SRz5CKAFOeuJ
 Y0Oy9pY/9IxJjzz15aCIXSyMJETEynb7oRRVnubbUNpFSKybzC+T34h9b7o6T6iTXgul
 3YxCUFm3cj61wo79/lL/jt1ofv6hgd50Bf38Ie8f3lYPsUVIfi57Fpm0LvFGm9tDG9sY
 CClvq54Y8aT9TVlh3J4D8imEjax3nW/dJEmnRgrhwT/2uj+GxD9zEt3p55+gFx6+R11f
 Sjzw==
X-Gm-Message-State: ACgBeo2JwuqVMyD1tz7/Kh+gTW8T3+MiMKA5awXo0P84R6t+UcUMDItC
 IP0+lNMmFmGbDqoUu9neZlk9vM/k5B4zpIXST6o=
X-Google-Smtp-Source: AA6agR7lw/fobBjH73PzZWmf8nrsUxZFGAqZHhPw1j17fQTgk9/IfDwNCuXesiIgyvgw7r26L2bSENsYjKb7Qm06zF0=
X-Received: by 2002:a17:907:60c7:b0:731:2be4:f72d with SMTP id
 hv7-20020a17090760c700b007312be4f72dmr3004924ejc.639.1661348156634; Wed, 24
 Aug 2022 06:35:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220824044013.29354-1-qkrwngud825@gmail.com>
 <CAJZ5v0jmDeGn-L6U-=JOxOHVy3CRS8T5Y_06F50cL9bjUhgbPQ@mail.gmail.com>
In-Reply-To: <CAJZ5v0jmDeGn-L6U-=JOxOHVy3CRS8T5Y_06F50cL9bjUhgbPQ@mail.gmail.com>
From: Juhyung Park <qkrwngud825@gmail.com>
Date: Wed, 24 Aug 2022 22:35:45 +0900
Message-ID: <CAD14+f1YEoqdnM8eTd2hUHSy+M4+AKQp6_FjV03TK=TSDxPfYw@mail.gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
X-Spam-Score: 2.0 (++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Rafael, On Wed, Aug 24, 2022 at 10:11 PM Rafael J. Wysocki
 wrote: > > On Wed, Aug 24, 2022 at 6:41 AM Juhyung Park wrote: > > > > Commit
 2fd77fff4b44 ("PM / suspend: make sync() on suspend-to-RAM build-ti [...]
 Content analysis details:   (2.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 HK_RANDOM_FROM         From username looks random
 1.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.218.47 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [qkrwngud825[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [qkrwngud825[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.218.47 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1oQqY7-0000JP-5l
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

Hi Rafael,

On Wed, Aug 24, 2022 at 10:11 PM Rafael J. Wysocki <rafael@kernel.org> wrote:
>
> On Wed, Aug 24, 2022 at 6:41 AM Juhyung Park <qkrwngud825@gmail.com> wrote:
> >
> > Commit 2fd77fff4b44 ("PM / suspend: make sync() on suspend-to-RAM build-time
> > optional") added an option to skip sync() on suspend entry to avoid heavy
> > overhead on platforms with frequent suspends.
> >
> > Years later, commit 261e224d6a5c ("pm/sleep: Add PM_USERSPACE_AUTOSLEEP
> > Kconfig") added a dedicated config for indicating that the kernel is subject to
> > frequent suspends.
> >
> > While SUSPEND_SKIP_SYNC is also available as a knob that the userspace can
> > configure, it makes sense to enable this by default if PM_USERSPACE_AUTOSLEEP
> > is selected already.
> >
> > Signed-off-by: Juhyung Park <qkrwngud825@gmail.com>
> > ---
> >  kernel/power/Kconfig | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/kernel/power/Kconfig b/kernel/power/Kconfig
> > index 60a1d3051cc7..5725df6c573b 100644
> > --- a/kernel/power/Kconfig
> > +++ b/kernel/power/Kconfig
> > @@ -23,6 +23,7 @@ config SUSPEND_SKIP_SYNC
> >         bool "Skip kernel's sys_sync() on suspend to RAM/standby"
> >         depends on SUSPEND
> >         depends on EXPERT
> > +       default PM_USERSPACE_AUTOSLEEP
>
> Why is this better than selecting SUSPEND_SKIP_SYNC from PM_USERSPACE_AUTOSLEEP?

That won't allow developers to opt-out from SUSPEND_SKIP_SYNC when
they still want PM_USERSPACE_AUTOSLEEP. (Can't think of a valid reason
for this though, as PM_USERSPACE_AUTOSLEEP is only used by Android and
probably Chromium, afaik.)

I don't think SUSPEND_SKIP_SYNC is critical enough to enforce when
PM_USERSPACE_AUTOSLEEP is enabled, but I don't have a strong opinion
on this either.
(We could do `imply SUSPEND_SKIP_SYNC` from PM_USERSPACE_AUTOSLEEP,
but that doesn't look good semantically imho.)

If you want, I can send a v2 with 'PM_USERSPACE_AUTOSLEEP select
SUSPEND_SKIP_SYNC'.

Thanks.

>
> >         help
> >           Skip the kernel sys_sync() before freezing user processes.
> >           Some systems prefer not to pay this cost on every invocation
> > --


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
