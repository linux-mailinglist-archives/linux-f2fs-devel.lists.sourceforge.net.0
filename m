Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EF18064F6F1
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 17 Dec 2022 03:06:28 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p6Mao-0008U7-Qb;
	Sat, 17 Dec 2022 02:06:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <luca.boccassi@gmail.com>) id 1p6Mal-0008Tz-DE
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 17 Dec 2022 02:06:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZKc6CEuQzPI93BCDJ+XZTxYCZmLQ7juv1HMMaSYki58=; b=BljFdVystc3S7OiWzf1BBb5Q0q
 dGpS9l1M6VbJLwKv3ATxXnf1lFJcgRH/j47A/XpUx8moP1SC/7woisB7ovwQsQWMc2zoOM7qN2vEg
 wdMx0Jp4GRxp9r9QSkkqGjX5Z99wNypTludbpU0WXa3U4q8mO12mC3EIDtbB1hiDJuxU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZKc6CEuQzPI93BCDJ+XZTxYCZmLQ7juv1HMMaSYki58=; b=QXSSsf5/N8OHPKDthguJtZe/GC
 mwoFWg5Ys9Vmu1g3/czHwaJx1azSs0XONtYf2zUNLaKlc2kx3Q8CIO13OmcW3WSxLfAA7zhDDlpoV
 PyYDbf/nQm+FlZpMJUNKiGQ2osfPenChdrB8WakjICUUvHl2l1baKZ5+ElGTsNCB23ag=;
Received: from mail-qt1-f173.google.com ([209.85.160.173])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1p6Maj-001yHk-Jo for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 17 Dec 2022 02:06:23 +0000
Received: by mail-qt1-f173.google.com with SMTP id s9so4203264qtx.6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 16 Dec 2022 18:06:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZKc6CEuQzPI93BCDJ+XZTxYCZmLQ7juv1HMMaSYki58=;
 b=RB8J55E5C9NK5WTmkWS0eo3Uphg9ilDNqww2b11Tz+zUozblBZqCWpNUReBO+9jU9p
 ILaD194aPy0dl7i1/nBHskqGkXb2r8fG6enZtUqf3KdPGrZwuC7lPr0wYaXA0L0dfrmy
 EvHNEyIvCFw0Kd45hcsM99Dc0fZrF/UMv4MkfCNxVyCP0SDSdKC3UA8ausF8L6YcqaxW
 yDKy7KzOWwzCFX2tiPqMRosSzPNMj1D2oQ9Q9OFioHCsrz5CkxEBPz9O1XqQXi9OOGWl
 9sSRfdMz9MViFF7ejPl5CCq3tMbuiF5OlIuuA4tINBC5W7Oi8xNyU0jnz6Ql66OCiNtn
 WTBg==
X-Gm-Message-State: ANoB5ploE0tfDWc48kfpMRxVJv478/Ouq+8vxU6tC2uuoM+7VXj1j5ga
 v0J26baLg61XWjfpD+tV0FyZpIYVh2RTNg==
X-Google-Smtp-Source: AA0mqf5eaaKRoNkERbPdShk3jeHDrIBaqXgYYpuWpRvKrzAj2ilFBXPydQpaHwp8r95L6uDVTesUbQ==
X-Received: by 2002:ac8:6711:0:b0:3a8:9d1:4b5e with SMTP id
 e17-20020ac86711000000b003a809d14b5emr38685428qtp.53.1671242775643; 
 Fri, 16 Dec 2022 18:06:15 -0800 (PST)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com.
 [209.85.219.169]) by smtp.gmail.com with ESMTPSA id
 d14-20020ac8668e000000b0039492d503cdsm2278727qtp.51.2022.12.16.18.06.15
 for <linux-f2fs-devel@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 18:06:15 -0800 (PST)
Received: by mail-yb1-f169.google.com with SMTP id e141so4273701ybh.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 16 Dec 2022 18:06:15 -0800 (PST)
X-Received: by 2002:a25:bac8:0:b0:6d8:186:aac8 with SMTP id
 a8-20020a25bac8000000b006d80186aac8mr88282764ybk.23.1671242775020; Fri, 16
 Dec 2022 18:06:15 -0800 (PST)
MIME-Version: 1.0
References: <20221208033523.122642-1-ebiggers@kernel.org>
 <CAMw=ZnQUmeOWQkMM9Kn5iYaT4dyDQ3j1K=dUgk9jFNcHPxxHrg@mail.gmail.com>
 <Y5zd6ucBc20CV7Le@sol.localdomain>
In-Reply-To: <Y5zd6ucBc20CV7Le@sol.localdomain>
From: Luca Boccassi <bluca@debian.org>
Date: Sat, 17 Dec 2022 02:06:04 +0000
X-Gmail-Original-Message-ID: <CAMw=ZnS5mXpQYtGHEK7-Q-VEojhooXiQVsGPT3e8NCW8uxnWyA@mail.gmail.com>
Message-ID: <CAMw=ZnS5mXpQYtGHEK7-Q-VEojhooXiQVsGPT3e8NCW8uxnWyA@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: 0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, 16 Dec 2022 at 21:06,
 Eric Biggers <ebiggers@kernel.org>
 wrote: > > On Thu, Dec 08, 2022 at 08:42:56PM +0000, Luca Boccassi wrote:
 > > On Thu, 8 Dec 2022 at 03:35, Eric Biggers <ebiggers@kerne [...] 
 Content analysis details:   (0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [luca.boccassi[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.160.173 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.173 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
X-Headers-End: 1p6Maj-001yHk-Jo
Subject: Re: [f2fs-dev] [PATCH] fsverity: don't check builtin signatures
 when require_signatures=0
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
Cc: stable@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, linux-integrity@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, 16 Dec 2022 at 21:06, Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Thu, Dec 08, 2022 at 08:42:56PM +0000, Luca Boccassi wrote:
> > On Thu, 8 Dec 2022 at 03:35, Eric Biggers <ebiggers@kernel.org> wrote:
> > >
> > > From: Eric Biggers <ebiggers@google.com>
> > >
> > > An issue that arises when migrating from builtin signatures to userspace
> > > signatures is that existing files that have builtin signatures cannot be
> > > opened unless either CONFIG_FS_VERITY_BUILTIN_SIGNATURES is disabled or
> > > the signing certificate is left in the .fs-verity keyring.
> > >
> > > Since builtin signatures provide no security benefit when
> > > fs.verity.require_signatures=0 anyway, let's just skip the signature
> > > verification in this case.
> > >
> > > Fixes: 432434c9f8e1 ("fs-verity: support builtin file signatures")
> > > Cc: <stable@vger.kernel.org> # v5.4+
> > > Signed-off-by: Eric Biggers <ebiggers@google.com>
> > > ---
> > >  fs/verity/signature.c | 18 ++++++++++++++++--
> > >  1 file changed, 16 insertions(+), 2 deletions(-)
> >
> > Acked-by: Luca Boccassi <bluca@debian.org>
>
> So if I can't apply
> https://lore.kernel.org/linux-fscrypt/20221208033548.122704-1-ebiggers@kernel.org
> ("fsverity: mark builtin signatures as deprecated") due to IPE, wouldn't I not
> be able to apply this patch either?  Surely IPE isn't depending on
> fs.verity.require_signatures=1, given that it enforces the policy itself?

I'm not sure what you mean? Skipping verification when this syscfg is
disabled makes sense to me, as you noted it doesn't serve any purpose
in that case.

Kind regards,
Luca Boccassi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
