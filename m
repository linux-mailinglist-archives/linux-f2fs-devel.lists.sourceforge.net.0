Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2C5ED0D7
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  2 Nov 2019 23:10:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Date:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TC3gmS+qPWFFzoeo6Ohiy+9nJ4Yatl/9wQj2AuZcje0=; b=ih2vB0ZIcnc3XBZb2Ds+yClocM
	lzho3R8jUJyHPeeE2gprlWA50uZTufNmoW7q7cZP36IPcA4i43g2DSoXI8/qpJpp2smuEhTkLQ97r
	D4gqh6KydNAxOo+SXKoUxJWEhj+fMs9On2dhUxM9YcHaCdB00kqU1KhFZdeRjk/c5lNk=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iR1bW-0007Gf-Ro; Sat, 02 Nov 2019 22:10:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <groeck@google.com>) id 1iR1bV-0007GJ-6m
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 02 Nov 2019 22:10:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=a/y/UNWsWFAphECmr0SKpq/uUSIVYd2blpeaPLFHhBw=; b=BMHtefSLmAg6wag/HPrWz8m0sD
 PD92P5ttBITwCLl3uprzAvR1hMEaeR9inZx4KXmzdT70XWdaLk3jeC5tgycccBDzfubN9IY176WYW
 4NAB2y/eZiqpvHlSox65F9Oplz+0I44eadZP70evAKzKmRGHwYOfx239rAvMYCliX/5c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=a/y/UNWsWFAphECmr0SKpq/uUSIVYd2blpeaPLFHhBw=; b=iizQ2TJ90JSkkKbfN8gaqhuST4
 Z7s+b1QUyjtl9H/6i8uJu3f58gwra8SnXLaqQMdSeoCBHRs91kYpTBB72tUOj3X1WdosseEtrYcHE
 SXBskPdWB9AKVfRCHdD+UlE7otGKDRCWJGJ7iVmaiOFKMHF0LyOyCLeVluU/rgI06dHo=;
Received: from mail-yw1-f67.google.com ([209.85.161.67])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iR1bQ-00FUNQ-7e
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 02 Nov 2019 22:10:41 +0000
Received: by mail-yw1-f67.google.com with SMTP id r134so5542501ywg.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 02 Nov 2019 15:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a/y/UNWsWFAphECmr0SKpq/uUSIVYd2blpeaPLFHhBw=;
 b=heUXVQ4VgTO2ElG0gwd7XEzTo2CN6hCnU2BwMj5n6t4b0IWTHitB6uFFkGY0EwRr+J
 QzeSddu3NhLjytmiCRz81gR54305JeZxa4iJHjUf/oW3uEftSlC7P3BhNQq1TkY9s7c6
 Z3tOkQFsryaKooRNEBI927kcGnXx4EmX295Cv8V2u7mTFBwFMG8Ur6ZS7Z+W4HVf61mg
 vAV321FuHNBjpO5nLg0r/KIhhBxTYq1GkZWAQtbAH9MxFoxj7l3NdEeeZOFkFIpAVMVr
 MFPWeapVqOj60ExILuL5ZjoMmNcabvxXt1zlAp6u1vK9XuBGPWNRCPhb0VFOAh+7QCUU
 c0uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a/y/UNWsWFAphECmr0SKpq/uUSIVYd2blpeaPLFHhBw=;
 b=Vps0JFpqVW/B7UEzqB46kR9CWfGV4WpspaICuT3I6OOx62ihszEt1j/Z5Q9DDgzH1r
 wK4HkErDZzAxGd/vB6xqCqin9kBuWyKz2Pw3HEELHU6o//Hwa3G+FDVi2DBSfpCRWP5h
 Ot4ahYajUhtLUTX0cGUegUOTCWGHQspTvi61WGUIDHC7iIjsGgKsV7B9nF4hVTzdcTd8
 tqeD3dq5FTMxiW/PV15t+GF4779wfGIzC+ZQ2HtkcNcK5XpTHycSvYkIWdQUYYfk5k/5
 xqfR0GanCBuvoQ6hIiWfe1zXaBC1HgSmkzHAFvy+KhblxIG+JyhvcoJAdVyk672gU/8O
 tjlQ==
X-Gm-Message-State: APjAAAX7nhR9BT127W/tQlJaG9mCAcTXPHZAKgk/0tFz5AQdRVbBo+Ql
 OmokNv7ZHaAvw35HY/g/4bxYnEHq6wifgOfMFIv/qQ==
X-Google-Smtp-Source: APXvYqxINNb17LJVAwLl2mdJpih2iAqY6Ts1EsT3XUgN7FVa5da8FtQWRDFu1/Q1pN84nIHPSiNi6XxLe3W7pyY/XV4=
X-Received: by 2002:a81:8486:: with SMTP id
 u128mr14394653ywf.337.1572732628718; 
 Sat, 02 Nov 2019 15:10:28 -0700 (PDT)
MIME-Version: 1.0
References: <20191030100618.1.Ibf7a996e4a58e84f11eec910938cfc3f9159c5de@changeid>
 <20191030173758.GC693@sol.localdomain>
 <CAD=FV=Uzma+eSGG1S1Aq6s3QdMNh4J-c=g-5uhB=0XBtkAawcA@mail.gmail.com>
 <20191030190226.GD693@sol.localdomain>
 <20191030205745.GA216218@sol.localdomain>
 <CAD=FV=X6Q3QZaND-tfYr9mf-KYMeKFmJDca3ee-i9roWj+GHsQ@mail.gmail.com>
 <CAD=FV=URZX4t-TB2Ne8y5ZfeBGoyhsPZhcncQ0yPe3cRXi=1gw@mail.gmail.com>
 <20191101043620.GA703@sol.localdomain>
 <CABXOdTddU2Kn8hJyofAC9eofZHAA4ddBhjNXc8GwC5dm3beMZA@mail.gmail.com>
In-Reply-To: <CABXOdTddU2Kn8hJyofAC9eofZHAA4ddBhjNXc8GwC5dm3beMZA@mail.gmail.com>
Date: Sat, 2 Nov 2019 15:10:17 -0700
Message-ID: <CABXOdTeu3KdT=arT+AKAOiPPM0U45krUfmDx6NH5nmDZ0pPa=A@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: -15.6 (---------------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: googlesource.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.161.67 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.161.67 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF white-list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL Match
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iR1bQ-00FUNQ-7e
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

On Fri, Nov 1, 2019 at 11:17 AM Guenter Roeck <groeck@google.com> wrote:
[ ... ]
> > Ah, I think I found it:
> >
> > https://chromium.googlesource.com/chromiumos/overlays/chromiumos-overlay/+/2cbdedd5eca0a57d9596671a99da5fab8e60722b/sys-apps/upstart/files/upstart-1.2-dircrypto.patch
> >
> > The init process does EXT4_IOC_GET_ENCRYPTION_POLICY on /, and if the error is
> > EOPNOTSUPP, it skips creating the "dircrypto" keyring.  So then cryptohome can't
> > add keys later.  (Note the error message you got, "Error adding dircrypto key".)
> >
> > So it looks like the kernel patch broke both that and
> > ext4_dir_encryption_supported().
> >
>
> ext4_dir_encryption_supported() was already changed to use the sysfs
> file, and changing the upstart code to check the sysfs file does
> indeed fix the problem for good. I'll do some more tests and push the
> necessary changes into our code base if I don't hit some other issue.
>

This change is now in our code base:

https://chromium.googlesource.com/chromiumos/overlays/chromiumos-overlay/+/5c5b06fded399013b9cce3d504c3d968ee84ab8b

If the revert has not made it upstream, I would suggest to hold it off
for the time being. I'll do more testing next week, but as it looks
like it may no longer be needed, at least not from a Chrome OS
perspective.

Guenter


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
