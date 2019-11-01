Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0165CEBCD9
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  1 Nov 2019 05:36:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iQOfy-0005js-P9; Fri, 01 Nov 2019 04:36:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1iQOfx-0005jm-QO
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 01 Nov 2019 04:36:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BnBATtwIXsja3OGor+dgPIAxhVrcupyyV+GWP0YG2pE=; b=fyXUPuLFacw2fzBRbdFG1fnkf3
 6cGo6z4L/lDAHTFYfW4SekFibw2IswDDc2szBLQ5tgZVcUQQPNapVEqc/K/gvORtv8BCQDSRTnKzj
 LeUUu9COF0iQJRIgXxa1gqiPZHsVdCk8XqIdCaPSNbPM5/Y+GZb0TXWKj7N6EtTiq4PA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BnBATtwIXsja3OGor+dgPIAxhVrcupyyV+GWP0YG2pE=; b=VccGDEVc3XRSIdgsiqhkTDoaOW
 UmVnK1Ho9kYWDkLA2LTk/sNY9WO9Wfyp1KNcMvDtVguU1Y/XySyAzOpYwKoTwV1rPXgbH2wVZQHaP
 z/n9Kbtk8Y4/5ohWy9/olxp3C5ZTatReJz5kq4WBgKuF+F19o1BkIB5+kAb405kGFAjA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iQOfs-00DRSa-BZ
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 01 Nov 2019 04:36:41 +0000
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
 [24.5.143.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 33E9F208CB;
 Fri,  1 Nov 2019 04:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1572582982;
 bh=IApEQ8cOoKKUT4dlrwrwKT0dtfSlZL/Pzu10k24ZQzo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EPJo+iUYSOqSex//thgdLs5Lz5fKD2heNME2eDIPq9ybb2bN3iorTFtTCutulnndZ
 GALoNt31mGtWx7JHv//z8oAk/4SnyW6T5d92TEs8gtkAEAsggCpORJV8DeRVcn23AX
 Ap6bUAuvPnP8SZyau9kBl/CTa8RGicnMSnBfjD6Q=
Date: Thu, 31 Oct 2019 21:36:20 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Message-ID: <20191101043620.GA703@sol.localdomain>
Mail-Followup-To: Doug Anderson <dianders@chromium.org>,
 Gwendal Grignou <gwendal@chromium.org>, Chao Yu <chao@kernel.org>,
 Ryo Hashimoto <hashimoto@chromium.org>,
 Vadim Sukhomlinov <sukhomlinov@google.com>,
 Guenter Roeck <groeck@chromium.org>, apronin@chromium.org,
 linux-doc@vger.kernel.org,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 "Theodore Y. Ts'o" <tytso@mit.edu>,
 Jonathan Corbet <corbet@lwn.net>,
 LKML <linux-kernel@vger.kernel.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-fscrypt@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
References: <20191030100618.1.Ibf7a996e4a58e84f11eec910938cfc3f9159c5de@changeid>
 <20191030173758.GC693@sol.localdomain>
 <CAD=FV=Uzma+eSGG1S1Aq6s3QdMNh4J-c=g-5uhB=0XBtkAawcA@mail.gmail.com>
 <20191030190226.GD693@sol.localdomain>
 <20191030205745.GA216218@sol.localdomain>
 <CAD=FV=X6Q3QZaND-tfYr9mf-KYMeKFmJDca3ee-i9roWj+GHsQ@mail.gmail.com>
 <CAD=FV=URZX4t-TB2Ne8y5ZfeBGoyhsPZhcncQ0yPe3cRXi=1gw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=URZX4t-TB2Ne8y5ZfeBGoyhsPZhcncQ0yPe3cRXi=1gw@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iQOfs-00DRSa-BZ
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

On Thu, Oct 31, 2019 at 10:52:19AM -0700, Doug Anderson wrote:
> Hi,
> 
> On Wed, Oct 30, 2019 at 2:59 PM Doug Anderson <dianders@chromium.org> wrote:
> >
> > Hi,
> >
> > On Wed, Oct 30, 2019 at 1:57 PM Eric Biggers <ebiggers@kernel.org> wrote:
> > >
> > > FWIW, from reading the Chrome OS code, I think the code you linked to isn't
> > > where the breakage actually is.  I think it's actually at
> > > https://chromium.googlesource.com/chromiumos/platform2/+/refs/heads/master/chromeos-common-script/share/chromeos-common.sh#375
> > > ... where an init script is using the error message printed by 'e4crypt
> > > get_policy' to decide whether to add -O encrypt to the filesystem or not.
> > >
> > > It really should check instead:
> > >
> > >         [ -e /sys/fs/ext4/features/encryption ]
> >
> > OK, I filed <https://crbug.com/1019939> and CCed all the people listed
> > in the cryptohome "OWNERS" file.  Hopefully one of them can pick this
> > up as a general cleanup.  Thanks!
> 
> Just to follow-up: I did a quick test here to see if I could fix
> "chromeos-common.sh" as you suggested.  Then I got rid of the Revert
> and tried to login.  No joy.
> 
> Digging a little deeper, the ext4_dir_encryption_supported() function
> is called in two places:
> * chromeos-install
> * chromeos_startup
> 
> In my test case I had a machine that I'd already logged into (on a
> previous kernel version) and I was trying to log into it a second
> time.  Thus there's no way that chromeos-install could be involved.
> Looking at chromeos_startup:
> 
> https://chromium.googlesource.com/chromiumos/platform2/+/refs/heads/master/init/chromeos_startup
> 
> ...the function is only used for setting up the "encrypted stateful"
> partition.  That wasn't where my failure was.  My failure was with
> logging in AKA with cryptohome.  Thus I think it's plausible that my
> original commit message pointing at cryptohome may have been correct.
> It's possible that there were _also_ problems with encrypted stateful
> that I wasn't noticing, but if so they were not the only problems.
> 
> It still may be wise to make Chrome OS use different tests, but it
> might not be quite as simple as hoped...
> 

Ah, I think I found it:

https://chromium.googlesource.com/chromiumos/overlays/chromiumos-overlay/+/2cbdedd5eca0a57d9596671a99da5fab8e60722b/sys-apps/upstart/files/upstart-1.2-dircrypto.patch

The init process does EXT4_IOC_GET_ENCRYPTION_POLICY on /, and if the error is
EOPNOTSUPP, it skips creating the "dircrypto" keyring.  So then cryptohome can't
add keys later.  (Note the error message you got, "Error adding dircrypto key".)

So it looks like the kernel patch broke both that and
ext4_dir_encryption_supported().

I don't see how it could have broken cryptohome by itself, since AFAICS
cryptohome only uses EXT4_IOC_GET_ENCRYPTION_POLICY on the partition which is
supposed to have the 'encrypt' feature set.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
