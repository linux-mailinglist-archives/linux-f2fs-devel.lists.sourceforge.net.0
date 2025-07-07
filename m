Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 912F8AFBE9C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jul 2025 01:31:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M+QyBDE8+wesjS51bVD7FTBpR/Cm79PXw4/qA9Howgc=; b=lASRrTl3WvsTOi4FS84VoQc8qS
	d5HV/pn3Wtda6D0JsD8MEOxgxLs4GZfqwrGeU7qh6z8p8ZANGAbp9lDtZK+0/u7FQehejOu+bcJKU
	BIM+54i5pABGZu2G/Mbn9PxiW1iRSOHX38ypxZ77mXk7o4Y1iZpeXD2/n9bzOsSVwW6I=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uYvIn-0000WM-EU;
	Mon, 07 Jul 2025 23:31:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <david@fromorbit.com>) id 1uYvIm-0000WG-Eq
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Jul 2025 23:31:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c4pktmlF1vRQduNDQ1SA6N8TiSZQUsg3NAWNf5AHgsY=; b=bX9urX19tzmPN/o9M1pp4EQbsM
 1XaMo9EqCBeoFUcaH9wd0JtqZ2lSNLPo1i7kSO5O3PsIsjHcLqYrtionU6eVcSlzSLdla5tlKvR6C
 k4je11WQFoEUMEyRpe8MwdUeHiGJUDprt3YER2xRe+ZdumUmryCJs9CNXHuIln/bGxE4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=c4pktmlF1vRQduNDQ1SA6N8TiSZQUsg3NAWNf5AHgsY=; b=CFfYoc30pKBqot2KTfEyuJerVX
 JFvVmIRdep9HM/4QQiuOmq6FinYuhAd6fXk2uEvxNhhbDU+qDXWxy45q4q3WSNWjvKoHrtHDlHGPM
 o032TA74XDsQqT9+CrjYN43Ckw306bBDVwnNVjSDwMJhU01eJABx6tN7lTi3mjGUXcHY=;
Received: from mail-qv1-f49.google.com ([209.85.219.49])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uYvIi-0001Rm-76 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Jul 2025 23:31:12 +0000
Received: by mail-qv1-f49.google.com with SMTP id
 6a1803df08f44-700fee04941so36839626d6.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 07 Jul 2025 16:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1751931057; x=1752535857;
 darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=c4pktmlF1vRQduNDQ1SA6N8TiSZQUsg3NAWNf5AHgsY=;
 b=2vZXUNqhwa7NOazbH9xnK135aA9mSXC3zBUYVi0RrSpnH1nLdlMtzMCJbbwn246LjY
 FmMSVQVonMtaj2DcMof/doNeI87K5fj5nSPrIrmOe6G+z5SHnc9cUOetKMVmtt7fAYFL
 CcBYWa/qkZSVzQmUbYi+lyF+0LUwGREll2kY0h3uHk8mXqZmGp2pKSqEsxq80ZIalv79
 ycAGIy9xVYR82cnDBfw0k0W/t/mK1jzrdH/UGhcwao8QMn21SM0f6onq8ti8TtVxSfyq
 ZmvcqGucPIDTzoPUr2XigH+P3SIorW7v+naAROZiW6q+r6Y9AKX8QNS/zErQpmNUkFMm
 oLsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751931057; x=1752535857;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c4pktmlF1vRQduNDQ1SA6N8TiSZQUsg3NAWNf5AHgsY=;
 b=scmBL+A685wkzoiJrFPg17nCPi8hXpTyIE6ka72I9bPynsaYsz/QTRz4RFTyR8qUqi
 KNvuPvFAA0ALS3aoHFgLzIOE6BeheiukKgDBUn/hLbYrmP6PrUyJ37lHhMZUiPI2Qv0c
 mRoC4YPz0aHXrTDs0alVBUnUCPp2ONj4q/FoIQYV0eCKH1pxtrjz22a/33QJeDznrXMc
 t2B8HI6u12Z6glOFcfmm43tF5Uf/KFixKvfYckPrg8+kQKdDJfrgdNGMf6f8TyAOhd65
 gyzd4hU+nAJjiHZ4RFkwvnWPhbIGv9vXCj2eeYkSpBRRBHhYLuPmr2AuC3LKusbZKGFf
 QmAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+hj+Hs4awXT9C9CIssnbBU5UyjwneiMyC0cJ1+KaPsaoGcOVTvoCndUeejS/Mx01Ulh2CH3Wk3IHZx4shmCBu@lists.sourceforge.net
X-Gm-Message-State: AOJu0YynPdGJE86goZw97pC+meC4vCvfZ9Ge2kBZNOGPSccUea3baTO8
 Xn1rbZAFLy4b6AgQnnRx8Jaya0T40CUfQ5zYzlNVHS6vqeo5DArn1+LgaHXWfyxp6hWAlEBCm8W
 I9RLg
X-Gm-Gg: ASbGncu7z+0FbdxGQbGFRXSdJDkoEdHi1eyD5wFRX2MLmtRBgNgkxGkbpTC8+LWm6UJ
 vhjKv3E0Gn7PU9yeMZ177XZ1wM+zbm/OvOXSv9AEwmrZVF1xICuKN6VlMzyeylDVNirYZoB/wLN
 +wFK+OsK0YA+tNx9ZzuhkBa4L23lwgPr4g/c9W8POXi07SCvDS1J4Fn7l4wMN5CuWmXkqhxrGgM
 P1QugrS/F7I1gCKdj5Lp+S2KxapapbA/Ac6954UpkUMnsFGZz6zBNDCbG1xwN9rwXIivCE/4Vnk
 jgbTW3WV8xhI5ZI0yoCbEB6vCpppsE0PwBPscb8AIoHFebooWyibNfreuEwUuUCM6iDPfRNg8Hx
 Aonslxw6oKnkzM2nFabJJwp8NKcML2JLkvOJRcQ==
X-Google-Smtp-Source: AGHT+IEmTi6zrkNyOcS4BN99ZoRqMQGa5CBIfG1MgDs1BPtD4rrI5GMD5dIJM6aSPlLP7bK+loeCfw==
X-Received: by 2002:a17:902:ce10:b0:234:8ec1:4ad3 with SMTP id
 d9443c01a7336-23dd1d5cc19mr6352555ad.40.1751929375710; 
 Mon, 07 Jul 2025 16:02:55 -0700 (PDT)
Received: from dread.disaster.area (pa49-180-184-88.pa.nsw.optusnet.com.au.
 [49.180.184.88]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23c8431a1f0sm102785765ad.32.2025.07.07.16.02.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jul 2025 16:02:55 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.98.2)
 (envelope-from <david@fromorbit.com>) id 1uYurM-00000008CeO-1qLV;
 Tue, 08 Jul 2025 09:02:52 +1000
Date: Tue, 8 Jul 2025 09:02:52 +1000
To: Qu Wenruo <wqu@suse.com>
Message-ID: <aGxSHKeyldrR1Q0T@dread.disaster.area>
References: <cover.1751589725.git.wqu@suse.com>
 <de25bbdb572c75df38b1002d3779bf19e3ad0ff6.1751589725.git.wqu@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <de25bbdb572c75df38b1002d3779bf19e3ad0ff6.1751589725.git.wqu@suse.com>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Jul 04, 2025 at 10:12:29AM +0930, Qu Wenruo wrote:
 > Currently all the filesystems implementing the >
 super_opearations::shutdown()
 callback can not afford losing a device. > > Thus fs_bdev_ma [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.49 listed in wl.mailspike.net]
X-Headers-End: 1uYvIi-0001Rm-76
Subject: Re: [f2fs-dev] [PATCH v4 1/6] fs: enhance and rename shutdown()
 callback to remove_bdev()
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
From: Dave Chinner via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Dave Chinner <david@fromorbit.com>
Cc: brauner@kernel.org, ntfs3@lists.linux.dev, jack@suse.cz,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jul 04, 2025 at 10:12:29AM +0930, Qu Wenruo wrote:
> Currently all the filesystems implementing the
> super_opearations::shutdown() callback can not afford losing a device.
> 
> Thus fs_bdev_mark_dead() will just call the shutdown() callback for the
> involved filesystem.
> 
> But it will no longer be the case, with multi-device filesystems like
> btrfs and bcachefs the filesystem can handle certain device loss without
> shutting down the whole filesystem.
> 
> To allow those multi-device filesystems to be integrated to use
> fs_holder_ops:
> 
> - Replace super_opearation::shutdown() with
>   super_opearations::remove_bdev()
>   To better describe when the callback is called.

This conflates cause with action.

The shutdown callout is an action that the filesystem must execute,
whilst "remove bdev" is a cause notification that might require an
action to be take.

Yes, the cause could be someone doing hot-unplug of the block
device, but it could also be something going wrong in software
layers below the filesystem. e.g. dm-thinp having an unrecoverable
corruption or ENOSPC errors.

We already have a "cause" notification: blk_holder_ops->mark_dead().

The generic fs action that is taken by this notification is
fs_bdev_mark_dead().  That action is to invalidate caches and shut
down the filesystem.

btrfs needs to do something different to a blk_holder_ops->mark_dead
notification. i.e. it needs an action that is different to
fs_bdev_mark_dead().

Indeed, this is how bcachefs already handles "single device
died" events for multi-device filesystems - see
bch2_fs_bdev_mark_dead().

Hence Btrfs should be doing the same thing as bcachefs. The
bdev_handle_ops structure exists precisly because it allows the
filesystem to handle block device events in the exact manner they
require....

> - Add a new @bdev parameter to remove_bdev() callback
>   To allow the fs to determine which device is missing, and do the
>   proper handling when needed.
> 
> For the existing shutdown callback users, the change is minimal.

Except for the change in API semantics. ->shutdown is an external
shutdown trigger for the filesystem, not a generic "block device
removed" notification.

Hooking blk_holder_ops->mark_dead means that btrfs can also provide
a ->shutdown implementation for when something external other than a
block device removal needs to shut down the filesystem....

-Dave.
-- 
Dave Chinner
david@fromorbit.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
