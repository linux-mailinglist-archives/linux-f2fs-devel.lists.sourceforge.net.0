Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 89418EB666
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 31 Oct 2019 18:52:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iQEcl-0000FN-GA; Thu, 31 Oct 2019 17:52:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1iQEck-0000FB-L7
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 31 Oct 2019 17:52:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mxV+2q76TOXqdkYGmWgrFX3noerT+2XT5stD2pDGxy4=; b=YfFrA7w5GLW1PiG41clKitue/g
 NEuRpCKrLby6pRpWGIBLFphp4y59HumJJtcwoajAvmODN9mUuxodcB5FjrsZ2XF2YWugrsKf1grHu
 I0/zY1gcYPBDjVCAZHKc8W5hcu6pWoC7cgipGJSe1rjt/tS0CzFSFCvXRYEPqMWSwpIc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mxV+2q76TOXqdkYGmWgrFX3noerT+2XT5stD2pDGxy4=; b=LcLv2aAdhIfVTdKRxoTbD2AALd
 Moo9nhWq/wHo4ZslZTUBu6tgyh7I23JsvuYwSXMUrT8I6dPaulqsb2nSB8ZbN20SoOcDOFHv444UC
 vZBAS8KdQs1yd0aWkHy2ilAIVa3VquYvFDd2Q4mm/eKtD3gE/nK/p+cZBT3sy5Ui4RwA=;
Received: from mail-io1-f66.google.com ([209.85.166.66])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iQEci-00Cr8Y-4C
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 31 Oct 2019 17:52:42 +0000
Received: by mail-io1-f66.google.com with SMTP id c11so7681605iom.10
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 31 Oct 2019 10:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mxV+2q76TOXqdkYGmWgrFX3noerT+2XT5stD2pDGxy4=;
 b=D6C1yVuRrDhf4QkrhECxb4poSSgofQd6d8y3lwuDnDDo8D10nO6Ax5FRjL4ps/cBH2
 kibSwzCfBDl1f7CMhlXY1kciz6oFkW7LsIrytUSfdoT6ANPyz6PU14U40ImfzEl2fu5d
 06UoCcfFhGpPMpgbOenFHbl2nIwNSPRnbySfc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mxV+2q76TOXqdkYGmWgrFX3noerT+2XT5stD2pDGxy4=;
 b=oI8AOcaSRaRxnWonYWPPg3LURQ851+MRkU/oR8t4CgDgQ7XIsAkkmSS9A6l9TQQHzv
 /CyG3/cPDTVN0EdhZ0rq446WPvkft0BV6FAufpUCf31JND3roPlOuvNYMu391QoYcFgA
 8f1Um7kmfouIAcw/DaztXZ1Sss7R+1MWt3sRuk1QL5DuTGeAjimY0mp47Ah2BOvaFwBH
 iwx2/ERuh+xObs8d/hNELKaymnQ4Zmc3V8+EZckPPmwINm5ACj8ix6He2GtpFecYmOB5
 1KqknAcX4MmxaTl0duiqqNCfUTo4I+HHXGYz6peoruXtBL2hDmJ15KqmEC0RGKY7LU9I
 3bnQ==
X-Gm-Message-State: APjAAAXmNgYGgJ+lF0GjiKJdFAO9fTT5oR/3iNMrOHHguL+nqZLKlUHr
 XhNpJVkRowIRRICtDEOFNdC/skHsxEE=
X-Google-Smtp-Source: APXvYqwDSm6YdKvmDnT3kuz1jGw4uM4ixN79/6ee4Lai5tysdlcznr+X8FT62UCqd9QEhL4ICDSqUw==
X-Received: by 2002:a5d:9b0f:: with SMTP id y15mr5950018ion.35.1572544354050; 
 Thu, 31 Oct 2019 10:52:34 -0700 (PDT)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com.
 [209.85.166.177])
 by smtp.gmail.com with ESMTPSA id d197sm359860iog.15.2019.10.31.10.52.32
 for <linux-f2fs-devel@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Oct 2019 10:52:33 -0700 (PDT)
Received: by mail-il1-f177.google.com with SMTP id t9so3899722ils.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 31 Oct 2019 10:52:32 -0700 (PDT)
X-Received: by 2002:a92:ba1b:: with SMTP id o27mr7815343ili.269.1572544351933; 
 Thu, 31 Oct 2019 10:52:31 -0700 (PDT)
MIME-Version: 1.0
References: <20191030100618.1.Ibf7a996e4a58e84f11eec910938cfc3f9159c5de@changeid>
 <20191030173758.GC693@sol.localdomain>
 <CAD=FV=Uzma+eSGG1S1Aq6s3QdMNh4J-c=g-5uhB=0XBtkAawcA@mail.gmail.com>
 <20191030190226.GD693@sol.localdomain>
 <20191030205745.GA216218@sol.localdomain>
 <CAD=FV=X6Q3QZaND-tfYr9mf-KYMeKFmJDca3ee-i9roWj+GHsQ@mail.gmail.com>
In-Reply-To: <CAD=FV=X6Q3QZaND-tfYr9mf-KYMeKFmJDca3ee-i9roWj+GHsQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 31 Oct 2019 10:52:19 -0700
X-Gmail-Original-Message-ID: <CAD=FV=URZX4t-TB2Ne8y5ZfeBGoyhsPZhcncQ0yPe3cRXi=1gw@mail.gmail.com>
Message-ID: <CAD=FV=URZX4t-TB2Ne8y5ZfeBGoyhsPZhcncQ0yPe3cRXi=1gw@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.66 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.66 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1iQEci-00Cr8Y-4C
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
Cc: Jonathan Corbet <corbet@lwn.net>, Gwendal Grignou <gwendal@chromium.org>,
 linux-ext4@vger.kernel.org, Ryo Hashimoto <hashimoto@chromium.org>,
 linux-doc@vger.kernel.org, Vadim Sukhomlinov <sukhomlinov@google.com>,
 linux-f2fs-devel@lists.sourceforge.net, LKML <linux-kernel@vger.kernel.org>,
 linux-fscrypt@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Guenter Roeck <groeck@chromium.org>,
 "Theodore Y. Ts'o" <tytso@mit.edu>, apronin@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi,

On Wed, Oct 30, 2019 at 2:59 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Wed, Oct 30, 2019 at 1:57 PM Eric Biggers <ebiggers@kernel.org> wrote:
> >
> > FWIW, from reading the Chrome OS code, I think the code you linked to isn't
> > where the breakage actually is.  I think it's actually at
> > https://chromium.googlesource.com/chromiumos/platform2/+/refs/heads/master/chromeos-common-script/share/chromeos-common.sh#375
> > ... where an init script is using the error message printed by 'e4crypt
> > get_policy' to decide whether to add -O encrypt to the filesystem or not.
> >
> > It really should check instead:
> >
> >         [ -e /sys/fs/ext4/features/encryption ]
>
> OK, I filed <https://crbug.com/1019939> and CCed all the people listed
> in the cryptohome "OWNERS" file.  Hopefully one of them can pick this
> up as a general cleanup.  Thanks!

Just to follow-up: I did a quick test here to see if I could fix
"chromeos-common.sh" as you suggested.  Then I got rid of the Revert
and tried to login.  No joy.

Digging a little deeper, the ext4_dir_encryption_supported() function
is called in two places:
* chromeos-install
* chromeos_startup

In my test case I had a machine that I'd already logged into (on a
previous kernel version) and I was trying to log into it a second
time.  Thus there's no way that chromeos-install could be involved.
Looking at chromeos_startup:

https://chromium.googlesource.com/chromiumos/platform2/+/refs/heads/master/init/chromeos_startup

...the function is only used for setting up the "encrypted stateful"
partition.  That wasn't where my failure was.  My failure was with
logging in AKA with cryptohome.  Thus I think it's plausible that my
original commit message pointing at cryptohome may have been correct.
It's possible that there were _also_ problems with encrypted stateful
that I wasn't noticing, but if so they were not the only problems.

It still may be wise to make Chrome OS use different tests, but it
might not be quite as simple as hoped...

-Doug


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
