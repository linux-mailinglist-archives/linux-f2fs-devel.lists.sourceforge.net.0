Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 52904EC85F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  1 Nov 2019 19:18:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Date:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=56L0tvTlNZrJoOmtThoYIO2aNygqnvCdZ2HC3cRe9XY=; b=l7C7O2AqSn4Ik+FiqoEIXGUGCu
	5cWYij8VOmUk05QJUYbWdXqULcW/FcMaklu4NXoruj5KqbyX4a+epmeWcTIDMCJuQ08mVxOq0el1x
	PIZ2OOG8CE8n3S6CHFmzBA4759QqsplF2bQCuldwLHjsRya/JYc4s86KmOvuAvmveJt8=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iQbUv-0001kJ-Mi; Fri, 01 Nov 2019 18:18:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <groeck@google.com>) id 1iQbUu-0001k6-GB
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 01 Nov 2019 18:18:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=K1dOhbDvlz+VXkT92swPjrnBtSngUC8vWTfrXwwNhyY=; b=TujhBLmNjLMm3sV9HsbxcpgBDb
 +JesR+RKy40phRtwf+PmpepKBJnTVMAP3Jw37IxtduieGONnWSDEaRmZlsv7n7XBue0pqOeA8eAf5
 Ngr5UHxoTQOMGaM1XxtoG1Nz08H8VTMqWupgs4904QT3ubl3bV1RQEKDk3dt5Nd/8/Vk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=K1dOhbDvlz+VXkT92swPjrnBtSngUC8vWTfrXwwNhyY=; b=T+HE15V95gvPCg4qLDpPGgVnjh
 pZ4zGg+yPiTtwBlTOw4LkKT41/kIMYU6jVcpo0poBXsqPUXbYDlvMipMRprzhhV2PWBEHkPzCjahE
 0V5D0DhE1wyCLrYghxmXrMFuwtN65C7Xd89MBjPuMyx75d2qCkZxiIFL781S1XKwkroM=;
Received: from mail-yb1-f193.google.com ([209.85.219.193])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iQbUr-00EGYH-Ni
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 01 Nov 2019 18:18:08 +0000
Received: by mail-yb1-f193.google.com with SMTP id c13so4242440ybq.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 01 Nov 2019 11:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K1dOhbDvlz+VXkT92swPjrnBtSngUC8vWTfrXwwNhyY=;
 b=CLO5Qm/PlPPjpWrndTxBcyLtDMn89fyBXHpnWCS+nH1k4WHVUnqU8ZK4hXdXEUA+fe
 yzFHMHp8geEjZm/iQfH5Vx4Vyavb1HFA8BIQDZkPCodULlTm1UR7qPd2F3P02uahDFGM
 lRC1/Fg0B2tWwvqbhgJdzUJ6CqGyqBjPKZG0WUq31dRZ+Cf2GRNn9d5StDnhkVkHXORk
 Im3rlB1ClPvVVALs0auqckzKgNds0CIZZC49294cGrDtsrMm8DVIVcJu59EeUCCC1TDK
 POBWVCuhJp13dxhIGFRSJdyJE8u7aErOjlx3iXWcff0MMRyph0H3cnDyP0DzVyshrIty
 JJJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K1dOhbDvlz+VXkT92swPjrnBtSngUC8vWTfrXwwNhyY=;
 b=N0YBkjugEb93QMA+PpXJ/dyIDXVQ2z/W0Jp72loOo0tAWyyxt4mHETE6J4K5SfWEqK
 kcVJttLXmEvIcvTtNzp3g00uOjiO3fWjxlm8/lFbbLgiJioMilNcVBTX2HKmw+c5wzIc
 QAALVUq6KkcAuavtTEs6WD5JXaXGAmDvrn/ja5kJbwsfg3864VL64Rl4QN7xTB4aMv1j
 R6W+2k3VGExkLD+INxyhWeuAGcRXw2sUe8YbNjOac9HTgiqbuKoGUOCmHPIggwF6leB5
 A6HuIRIhuynby89nZ+SQJH1urhSDy3+FNNy77Y5Lgjvp1aobnrsgpizSuhnvF9IlbU5q
 j84g==
X-Gm-Message-State: APjAAAUS5lyv/9zw4tP+d3/zzPILJuY9Bg4U5EfRa7w7Qbu8aGjqZfJo
 ni1KIlbSbmMBMugispoSIXhiohWOPjxLytrqNv95bQ==
X-Google-Smtp-Source: APXvYqxo0mSU502NSpYWvdOeGh//uDeakjnxwpfotuR+Ml3IAbrPchH2s+feB5U1ZnKWNyEMuck/yacSnujP2IInM5w=
X-Received: by 2002:a25:cf8c:: with SMTP id f134mr10567617ybg.45.1572632278924; 
 Fri, 01 Nov 2019 11:17:58 -0700 (PDT)
MIME-Version: 1.0
References: <20191030100618.1.Ibf7a996e4a58e84f11eec910938cfc3f9159c5de@changeid>
 <20191030173758.GC693@sol.localdomain>
 <CAD=FV=Uzma+eSGG1S1Aq6s3QdMNh4J-c=g-5uhB=0XBtkAawcA@mail.gmail.com>
 <20191030190226.GD693@sol.localdomain>
 <20191030205745.GA216218@sol.localdomain>
 <CAD=FV=X6Q3QZaND-tfYr9mf-KYMeKFmJDca3ee-i9roWj+GHsQ@mail.gmail.com>
 <CAD=FV=URZX4t-TB2Ne8y5ZfeBGoyhsPZhcncQ0yPe3cRXi=1gw@mail.gmail.com>
 <20191101043620.GA703@sol.localdomain>
In-Reply-To: <20191101043620.GA703@sol.localdomain>
Date: Fri, 1 Nov 2019 11:17:47 -0700
Message-ID: <CABXOdTddU2Kn8hJyofAC9eofZHAA4ddBhjNXc8GwC5dm3beMZA@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: -15.6 (---------------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.193 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.219.193 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF white-list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL Match
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iQbUr-00EGYH-Ni
Subject: Re: [f2fs-dev] [PATCH] Revert "ext4 crypto: fix to check feature
 status before get policy"
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
From: Guenter Roeck via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Guenter Roeck <groeck@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Gwendal Grignou <gwendal@chromium.org>,
 linux-ext4 <linux-ext4@vger.kernel.org>,
 Ryo Hashimoto <hashimoto@chromium.org>, linux-doc@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Doug Anderson <dianders@chromium.org>,
 linux-f2fs-devel@lists.sourceforge.net,
 Vadim Sukhomlinov <sukhomlinov@google.com>, linux-fscrypt@vger.kernel.org,
 Andreas Dilger <adilger.kernel@dilger.ca>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Guenter Roeck <groeck@chromium.org>, "Theodore Y. Ts'o" <tytso@mit.edu>,
 Andrey Pronin <apronin@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Oct 31, 2019 at 9:36 PM Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Thu, Oct 31, 2019 at 10:52:19AM -0700, Doug Anderson wrote:
> > Hi,
> >
> > On Wed, Oct 30, 2019 at 2:59 PM Doug Anderson <dianders@chromium.org> wrote:
> > >
> > > Hi,
> > >
> > > On Wed, Oct 30, 2019 at 1:57 PM Eric Biggers <ebiggers@kernel.org> wrote:
> > > >
> > > > FWIW, from reading the Chrome OS code, I think the code you linked to isn't
> > > > where the breakage actually is.  I think it's actually at
> > > > https://chromium.googlesource.com/chromiumos/platform2/+/refs/heads/master/chromeos-common-script/share/chromeos-common.sh#375
> > > > ... where an init script is using the error message printed by 'e4crypt
> > > > get_policy' to decide whether to add -O encrypt to the filesystem or not.
> > > >
> > > > It really should check instead:
> > > >
> > > >         [ -e /sys/fs/ext4/features/encryption ]
> > >
> > > OK, I filed <https://crbug.com/1019939> and CCed all the people listed
> > > in the cryptohome "OWNERS" file.  Hopefully one of them can pick this
> > > up as a general cleanup.  Thanks!
> >
> > Just to follow-up: I did a quick test here to see if I could fix
> > "chromeos-common.sh" as you suggested.  Then I got rid of the Revert
> > and tried to login.  No joy.
> >
> > Digging a little deeper, the ext4_dir_encryption_supported() function
> > is called in two places:
> > * chromeos-install
> > * chromeos_startup
> >
> > In my test case I had a machine that I'd already logged into (on a
> > previous kernel version) and I was trying to log into it a second
> > time.  Thus there's no way that chromeos-install could be involved.
> > Looking at chromeos_startup:
> >
> > https://chromium.googlesource.com/chromiumos/platform2/+/refs/heads/master/init/chromeos_startup
> >
> > ...the function is only used for setting up the "encrypted stateful"
> > partition.  That wasn't where my failure was.  My failure was with
> > logging in AKA with cryptohome.  Thus I think it's plausible that my
> > original commit message pointing at cryptohome may have been correct.
> > It's possible that there were _also_ problems with encrypted stateful
> > that I wasn't noticing, but if so they were not the only problems.
> >
> > It still may be wise to make Chrome OS use different tests, but it
> > might not be quite as simple as hoped...
> >
>
> Ah, I think I found it:
>
> https://chromium.googlesource.com/chromiumos/overlays/chromiumos-overlay/+/2cbdedd5eca0a57d9596671a99da5fab8e60722b/sys-apps/upstart/files/upstart-1.2-dircrypto.patch
>
> The init process does EXT4_IOC_GET_ENCRYPTION_POLICY on /, and if the error is
> EOPNOTSUPP, it skips creating the "dircrypto" keyring.  So then cryptohome can't
> add keys later.  (Note the error message you got, "Error adding dircrypto key".)
>
> So it looks like the kernel patch broke both that and
> ext4_dir_encryption_supported().
>

ext4_dir_encryption_supported() was already changed to use the sysfs
file, and changing the upstart code to check the sysfs file does
indeed fix the problem for good. I'll do some more tests and push the
necessary changes into our code base if I don't hit some other issue.

> I don't see how it could have broken cryptohome by itself, since AFAICS
> cryptohome only uses EXT4_IOC_GET_ENCRYPTION_POLICY on the partition which is
> supposed to have the 'encrypt' feature set.
>
Yes, indeed it seems as if that is unrelated.

Guenter


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
