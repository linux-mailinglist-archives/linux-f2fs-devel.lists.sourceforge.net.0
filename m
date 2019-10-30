Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1A6EA50E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 30 Oct 2019 21:58:01 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iPv2U-0005Q0-K9; Wed, 30 Oct 2019 20:57:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1iPv2T-0005Pt-2p
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 30 Oct 2019 20:57:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4yiNQW9mKp9n+1DyFEStTQWtQgcBpDCKOtNSoxmSrwk=; b=UndDzTEA2fk+oNKuodPFySLAzG
 jXrOQs1Cv7a/pYbKZHFVhp59/yFHvXeh8hM/LR24+dlnbI9BGtE6gsuZ1TRHjgVYgIhoIiVd9l0ZC
 TVSJCdVgYRBGXcaM6H7sZVEVYZCQcKxkQXWjNsHSsMR6yKzgIkvdIZa05cmr5TeLXfAI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4yiNQW9mKp9n+1DyFEStTQWtQgcBpDCKOtNSoxmSrwk=; b=TipKQA0GvXheqXZIHSEAyVD+wt
 UEyh6/Bh4NF5jII3EHHmbqh+uuvdyw5YLyLEVsPaY5df2txgKlD7Vgx73g5IpFFocH66RMKkFTmJj
 fG4LsFNp0Ia9/UFli42j/V0JbsYRBL+2f1x+VeNegLUXOjCDrMMoYKF83Ruv4Uyo++ak=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iPv2R-00BPQz-Ft
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 30 Oct 2019 20:57:57 +0000
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
 [24.5.143.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D381F2067D;
 Wed, 30 Oct 2019 20:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1572469067;
 bh=BGRKW4IsqzstZ7iJM8ADq5DNxw8/OYwb6Kb6GbTlTls=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=eTTxcy3rrba70gcSZp2dhnYqVvOEBLKl0Z8AQzGMq9AajMEFfWDiFNQX5tIVBb/yF
 ITe9DGLFrSH/G/N5l3Pn4Vkiop6OiwehS9+jRRe3zO50jEhF/LaH4TAkU3I7ab30jA
 bRveETI8/B8fPeiSuhYG340nNRARmv9N6Kn03W+I=
Date: Wed, 30 Oct 2019 13:57:45 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Doug Anderson <dianders@chromium.org>,
 Gwendal Grignou <gwendal@chromium.org>, Chao Yu <chao@kernel.org>,
 Ryo Hashimoto <hashimoto@chromium.org>,
 Vadim Sukhomlinov <sukhomlinov@google.com>,
 Guenter Roeck <groeck@chromium.org>, apronin@chromium.org,
 linux-doc@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 "Theodore Y. Ts'o" <tytso@mit.edu>, Jonathan Corbet <corbet@lwn.net>,
 LKML <linux-kernel@vger.kernel.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-fscrypt@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Message-ID: <20191030205745.GA216218@sol.localdomain>
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
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191030190226.GD693@sol.localdomain>
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
X-Headers-End: 1iPv2R-00BPQz-Ft
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Oct 30, 2019 at 12:02:26PM -0700, Eric Biggers wrote:
> On Wed, Oct 30, 2019 at 10:51:20AM -0700, Doug Anderson wrote:
> > Hi,
> > 
> > On Wed, Oct 30, 2019 at 10:38 AM Eric Biggers <ebiggers@kernel.org> wrote:
> > >
> > > Hi Douglas,
> > >
> > > On Wed, Oct 30, 2019 at 10:06:25AM -0700, Douglas Anderson wrote:
> > > > This reverts commit 0642ea2409f3 ("ext4 crypto: fix to check feature
> > > > status before get policy").
> > > >
> > > > The commit made a clear and documented ABI change that is not backward
> > > > compatible.  There exists userspace code [1] that relied on the old
> > > > behavior and is now broken.
> > > >
> > > > While we could entertain the idea of updating the userspace code to
> > > > handle the ABI change, it's my understanding that in general ABI
> > > > changes that break userspace are frowned upon (to put it nicely).
> > > >
> > > > NOTE: if we for some reason do decide to entertain the idea of
> > > > allowing the ABI change and updating userspace, I'd appreciate any
> > > > help on how we should make the change.  Specifically the old code
> > > > relied on the different return values to differentiate between
> > > > "KeyState::NO_KEY" and "KeyState::NOT_SUPPORTED".  I'm no expert on
> > > > the ext4 encryption APIs (I just ended up here tracking down the
> > > > regression [2]) so I'd need a bit of handholding from someone.
> > > >
> > > > [1] https://chromium.googlesource.com/chromiumos/platform2/+/refs/heads/master/cryptohome/dircrypto_util.cc#73
> > > > [2] https://crbug.com/1018265
> > > >
> > > > Fixes: 0642ea2409f3 ("ext4 crypto: fix to check feature status before get policy")
> > > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > > ---
> > > >
> > > >  Documentation/filesystems/fscrypt.rst | 3 +--
> > > >  fs/ext4/ioctl.c                       | 2 --
> > > >  2 files changed, 1 insertion(+), 4 deletions(-)
> > > >
> > > > diff --git a/Documentation/filesystems/fscrypt.rst b/Documentation/filesystems/fscrypt.rst
> > > > index 8a0700af9596..4289c29d7c5a 100644
> > > > --- a/Documentation/filesystems/fscrypt.rst
> > > > +++ b/Documentation/filesystems/fscrypt.rst
> > > > @@ -562,8 +562,7 @@ FS_IOC_GET_ENCRYPTION_POLICY_EX can fail with the following errors:
> > > >    or this kernel is too old to support FS_IOC_GET_ENCRYPTION_POLICY_EX
> > > >    (try FS_IOC_GET_ENCRYPTION_POLICY instead)
> > > >  - ``EOPNOTSUPP``: the kernel was not configured with encryption
> > > > -  support for this filesystem, or the filesystem superblock has not
> > > > -  had encryption enabled on it
> > > > +  support for this filesystem
> > > >  - ``EOVERFLOW``: the file is encrypted and uses a recognized
> > > >    encryption policy version, but the policy struct does not fit into
> > > >    the provided buffer
> > > > diff --git a/fs/ext4/ioctl.c b/fs/ext4/ioctl.c
> > > > index 0b7f316fd30f..13d97fb797b4 100644
> > > > --- a/fs/ext4/ioctl.c
> > > > +++ b/fs/ext4/ioctl.c
> > > > @@ -1181,8 +1181,6 @@ long ext4_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
> > > >  #endif
> > > >       }
> > > >       case EXT4_IOC_GET_ENCRYPTION_POLICY:
> > > > -             if (!ext4_has_feature_encrypt(sb))
> > > > -                     return -EOPNOTSUPP;
> > > >               return fscrypt_ioctl_get_policy(filp, (void __user *)arg);
> > > >
> > >
> > > Thanks for reporting this.  Can you elaborate on exactly why returning
> > > EOPNOTSUPP breaks things in the Chrome OS code?  Since encryption is indeed not
> > > supported, why isn't "KeyState::NOT_SUPPORTED" correct?
> > 
> > I guess all I know is from the cryptohome source code I sent a link
> > to, which I'm not a super expert in.  Did you get a chance to take a
> > look at that?  As far as I can tell the code is doing something like
> > this:
> > 
> > 1. If I see EOPNOTSUPP then this must be a kernel without ext4 crypto.
> > Fallback to using the old-style ecryptfs.
> > 
> > 2. If I see ENODATA then this is a kernel with ext4 crypto but there's
> > no key yet.  We should set a key and (if necessarily) enable crypto on
> > the filesystem.
> > 
> > 3. If I see no error then we're already good.
> > 
> > > Note that the state after this revert will be:
> > >
> > > - FS_IOC_GET_ENCRYPTION_POLICY on ext4 => ENODATA
> > > - FS_IOC_GET_ENCRYPTION_POLICY on f2fs => EOPNOTSUPP
> > > - FS_IOC_GET_ENCRYPTION_POLICY_EX on ext4 => EOPNOTSUPP
> > > - FS_IOC_GET_ENCRYPTION_POLICY_EX on f2fs => EOPNOTSUPP
> > >
> > > So if this code change is made, the documentation would need to be updated to
> > > explain that the error code from FS_IOC_GET_ENCRYPTION_POLICY is
> > > filesystem-specific (which we'd really like to avoid...), and that
> > > FS_IOC_GET_ENCRYPTION_POLICY_EX handles this case differently.  Or else the
> > > other three would need to be changed to ENODATA -- which for
> > > FS_IOC_GET_ENCRYPTION_POLICY on f2fs would be an ABI break in its own right,
> > > though it's possible that no one would notice.
> > >
> > > Is your proposal to keep the error filesystem-specific for now?
> > 
> > I guess I'd have to leave it up to the people who know this better.
> > Mostly I just saw this as an ABI change breaking userspace which to me
> > means revert.  I have very little background here to make good
> > decisions about the right way to move forward.
> > 
> 
> Okay, that makes sense -- cryptohome assumes that ENODATA means the kernel
> supports encryption, even if the encrypt ext4 feature flag isn't set yet.
> 
> The way it's really supposed to work (IMO) is that all fscrypt ioctls
> consistently return EOPNOTSUPP if the feature is off, and then if userspace
> really needs to know if encryption can nevertheless still be enabled and used on
> the filesystem, it can check for the presence of
> /sys/fs/ext4/features/encryption (or /sys/fs/f2fs/features/encryption).  Or the
> feature flag can just be set by configuration before any of the fscrypt ioctls
> are attempted (this is what Android does).
> 
> I guess we're stuck with the existing ext4 FS_IOC_GET_ENCRYPTION_POLICY behavior
> though, so we need to take this revert for 5.4.
> 
> For 5.5 I think we should try to make things slightly more sane by removing the
> same check from f2fs and fixing the documentation, so that at least each ioctl
> will behave consistently across filesystems and be correctly documented.
> 
> Ted, Jaegeuk, Chao, do you agree?
> 

FWIW, from reading the Chrome OS code, I think the code you linked to isn't
where the breakage actually is.  I think it's actually at
https://chromium.googlesource.com/chromiumos/platform2/+/refs/heads/master/chromeos-common-script/share/chromeos-common.sh#375
... where an init script is using the error message printed by 'e4crypt
get_policy' to decide whether to add -O encrypt to the filesystem or not.

It really should check instead:

	[ -e /sys/fs/ext4/features/encryption ]

Anyway, since something broke I think we need to revert the kernel patch anyway.
Ted, if you can provide an Acked-by, I can apply it to fscrypt.git#for-stable
and make a pull request for 5.4.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
