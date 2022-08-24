Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9D659FAEB
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Aug 2022 15:11:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oQqAI-0008Bj-K0;
	Wed, 24 Aug 2022 13:11:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <rjwysocki@gmail.com>) id 1oQqAF-0008BT-Pz
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Aug 2022 13:11:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PBMgiKITqVFe9ipKJMfcHRkx37YurSW2KouZuSOxvmo=; b=KQHPa7xA1CrOf9Toi8D0uPkcKJ
 vMxyIcMMq4hnPoem2OHZVl59hZV5A03+8AJ49Wo95vBIMbJIaYaC0ZWYYSv15AEEVexOS3Sm7J3vW
 a4W0zirpxH8yZhltNYwfe0jkz5QM2UAoKQ5od7rP+jvxGtRs3hk3BqoxtKhE2IM7VXXY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PBMgiKITqVFe9ipKJMfcHRkx37YurSW2KouZuSOxvmo=; b=O2GAPZl57PVyk9ULcNtTnz+XwS
 jZtmBL64TwsE4jDsdu61VC5Nz555HOYiUW/+Q3XbCZ+Fk9AL7BhmMXceUdmtjOrLAI+jSxoHBLdDu
 11zzzPiFQ5C2yphDT5m+g+kSkreZgZvUhXpNW7hdiI672tmuHCjwhs0c6qLGsddnjb3w=;
Received: from mail-yw1-f169.google.com ([209.85.128.169])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oQqA4-0006gW-Ne for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Aug 2022 13:11:23 +0000
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-3375488624aso429302397b3.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 24 Aug 2022 06:11:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=PBMgiKITqVFe9ipKJMfcHRkx37YurSW2KouZuSOxvmo=;
 b=tYDoamU6UV6Pm7R9DLEMbLJxZpzgmRQjA5E4Ojuo+w39OT4zYRtYK+XtwgbbMlg4am
 OR9iPm7NLCmpilyHdkYMzflwzAWvdpxpyGHtgvxJMJ8LhTuHoqED19wirFkYnJeZo0bG
 ibMsWPag6Q9o3T3NN5Gc+0/Bd6T6JXWCjarF7GwssnnhHJszRY1lDTkhCQm9DN7EorSi
 K/n5FHniEqCCiJ8MTcn9Ut/U373DcBRJ8YE41zOutuyqd8D/v0hIZI2w8Refw+YkR8cE
 ZLY4qK2b5caM/n7qFZd5Hs53wq8XYeV+1I8Xi6sqRi4eREaIY11ZlcIdGjmC+m2oyuWJ
 RveA==
X-Gm-Message-State: ACgBeo00zHMWWmMN8mrryX0jGlAwKriBRXMchngIoxh2nEDsbGaWOFmT
 fsPMl27Mk1MbDYrvRr2fXBHLPZlW2HY8ByF/uq4=
X-Google-Smtp-Source: AA6agR62tJ8S9HOpJZQz5VLSfKhkCpn7RiNHfYE77AQwGBkfA6rm8VSjZhA9q+pokze+xAMH6HUruQA79TgT4Qa34xo=
X-Received: by 2002:a0d:da83:0:b0:329:9c04:fe6d with SMTP id
 c125-20020a0dda83000000b003299c04fe6dmr31037608ywe.196.1661346667024; Wed, 24
 Aug 2022 06:11:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220824044013.29354-1-qkrwngud825@gmail.com>
In-Reply-To: <20220824044013.29354-1-qkrwngud825@gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 24 Aug 2022 15:10:54 +0200
Message-ID: <CAJZ5v0jmDeGn-L6U-=JOxOHVy3CRS8T5Y_06F50cL9bjUhgbPQ@mail.gmail.com>
To: Juhyung Park <qkrwngud825@gmail.com>
X-Spam-Score: 0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Aug 24,
 2022 at 6:41 AM Juhyung Park <qkrwngud825@gmail.com>
 wrote: > > Commit 2fd77fff4b44 ("PM / suspend: make sync() on suspend-to-RAM
 build-time > optional") added an option to skip sync() [...] 
 Content analysis details:   (0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.169 listed in wl.mailspike.net]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [rjwysocki[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
X-Headers-End: 1oQqA4-0006gW-Ne
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

On Wed, Aug 24, 2022 at 6:41 AM Juhyung Park <qkrwngud825@gmail.com> wrote:
>
> Commit 2fd77fff4b44 ("PM / suspend: make sync() on suspend-to-RAM build-time
> optional") added an option to skip sync() on suspend entry to avoid heavy
> overhead on platforms with frequent suspends.
>
> Years later, commit 261e224d6a5c ("pm/sleep: Add PM_USERSPACE_AUTOSLEEP
> Kconfig") added a dedicated config for indicating that the kernel is subject to
> frequent suspends.
>
> While SUSPEND_SKIP_SYNC is also available as a knob that the userspace can
> configure, it makes sense to enable this by default if PM_USERSPACE_AUTOSLEEP
> is selected already.
>
> Signed-off-by: Juhyung Park <qkrwngud825@gmail.com>
> ---
>  kernel/power/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/kernel/power/Kconfig b/kernel/power/Kconfig
> index 60a1d3051cc7..5725df6c573b 100644
> --- a/kernel/power/Kconfig
> +++ b/kernel/power/Kconfig
> @@ -23,6 +23,7 @@ config SUSPEND_SKIP_SYNC
>         bool "Skip kernel's sys_sync() on suspend to RAM/standby"
>         depends on SUSPEND
>         depends on EXPERT
> +       default PM_USERSPACE_AUTOSLEEP

Why is this better than selecting SUSPEND_SKIP_SYNC from PM_USERSPACE_AUTOSLEEP?

>         help
>           Skip the kernel sys_sync() before freezing user processes.
>           Some systems prefer not to pay this cost on every invocation
> --


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
