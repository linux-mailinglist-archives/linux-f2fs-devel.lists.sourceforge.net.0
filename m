Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D61481520B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 Dec 2023 22:46:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rEG0Y-0003hj-RB;
	Fri, 15 Dec 2023 21:46:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <josef@toxicpanda.com>) id 1rEG0X-0003hX-Ot
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Dec 2023 21:46:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Voo/Qo5neoICI5TEYLgUqQlKmAzhYFSB0CPj59btfKQ=; b=PcihQlLpklxMnQvZzofsruROpY
 djTnYTidcKzxHWUR+fzgEgAsydvwq2cXgFbMEp1kzzRfyxLhkPVmUfKb5GWV5MJu6L5kUDIOltGi/
 CJUByhSo9cVy93V0h9vJ1y6mELjxnXWdkyDuwpAQ1p9fzcSCyD5Vg8OF92yt8hjIzXuE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Voo/Qo5neoICI5TEYLgUqQlKmAzhYFSB0CPj59btfKQ=; b=lO9UFBLKyf1sgW9BMaebJwI9PP
 Q6xMAfGiBS6fUjtk5h//6KNGCLcsogTsjaaUmW2/vqwf5hDLGZOTAHZ2dGjERtLaxJd5RStaGEa8W
 D30xZc9Dgf98Ch0qS/aLAoo9YmdWCSTc5DiT9JbivVHoHN4xUoZqKxFyiII1+5+np5NE=;
Received: from mail-yw1-f174.google.com ([209.85.128.174])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rEG0Q-00033h-Jl for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Dec 2023 21:46:10 +0000
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-5e248b40c97so10807437b3.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 15 Dec 2023 13:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=toxicpanda-com.20230601.gappssmtp.com; s=20230601; t=1702676752; x=1703281552;
 darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Voo/Qo5neoICI5TEYLgUqQlKmAzhYFSB0CPj59btfKQ=;
 b=2eyEm8jZeUFydkRuyK4B+8oTULrxdT5Wtpdbwd/XzRHBpVp/REWH1ClVsZQyxSSwXz
 3V14hSQGjk/kX85hO4S45cHeVGvHEyZMQf9vUbpjGzDjmssT0EE7/eA8z6p6Jhxo4eB8
 +NsOSrKxzqxMTYg8E835ieUN6oUdvNFyXZpZ72rdrSZ8of/14OOKUlPNWuQEkriBsv9I
 UHFOuAjDbQno04Nm61oxQ0y8xlwGw/NbzTOqey6iEQM0Tw6EeFfewAxh+Il0N9PtcNbZ
 S8/IjjFGtICtI4vD3OsT7V6AOug2vm+CtjcCbi+uMRJvLu8Dcy2U1FWLX9J5CVvDRnlP
 K9QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702676752; x=1703281552;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Voo/Qo5neoICI5TEYLgUqQlKmAzhYFSB0CPj59btfKQ=;
 b=LGdL9EQW7VgLIlx+Vzwq763Jd4GxSSi5Q99y6+dJLBqQXinsud3f3Z7YYDPAD9eW93
 BLJTpHSjBBq7TKaE2j2U/o3DWO1SFE9+TjLhHi4FkA6pFK2uzj4NKHUq1jq+UKaiE2l8
 P47NcFEkWhXe71QYtyvdFIZRh447RIIWM4flCbQW7HinHVt/NcipCOz1qA1ugj+uN+4e
 Dl0QHnALSXOean0hfkKV9mORbx8Vx48ltFSxn2zoUWCJAREgBYQbkntFag3cs6cqHMLH
 alu+QfTIfSUs6CN3e2j0SRZ5/4PXjwTUX21IM9Dn2IJqS5XN0JLdwwgwZuBb1LuoxXzB
 N16Q==
X-Gm-Message-State: AOJu0YyWuFKStqzFpCLivRicq+YiTYf9z0hm+Sacm1FriR6/kcLA6olH
 86PvjoHzXsGGrNPuaGyZdZkbng==
X-Google-Smtp-Source: AGHT+IGn2gXyZ44rH0GdttHxI9BDGa6muaa1HTZ9b5XYSMgUKOgwNkucKhJf+BqCcDPHEJOxXfTXxQ==
X-Received: by 2002:a0d:d9cc:0:b0:5e3:3bcc:c344 with SMTP id
 b195-20020a0dd9cc000000b005e33bccc344mr3671813ywe.33.1702676751819; 
 Fri, 15 Dec 2023 13:45:51 -0800 (PST)
Received: from localhost (076-182-020-124.res.spectrum.com. [76.182.20.124])
 by smtp.gmail.com with ESMTPSA id
 b80-20020a0dd953000000b005e2ca09e751sm2443263ywe.110.2023.12.15.13.45.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Dec 2023 13:45:50 -0800 (PST)
Date: Fri, 15 Dec 2023 16:45:50 -0500
From: Josef Bacik <josef@toxicpanda.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20231215214550.GB883762@perftesting>
References: <20231213040018.73803-1-ebiggers@kernel.org>
 <20231213040018.73803-2-ebiggers@kernel.org>
 <20231213084123.GA6184@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231213084123.GA6184@lst.de>
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Dec 13, 2023 at 09:41:23AM +0100, Christoph Hellwig
 wrote: > On Tue, Dec 12, 2023 at 08:00:16PM -0800, Eric Biggers wrote: >
 > From: Christoph Hellwig <hch@lst.de> > > > > blkdev_put must not [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.174 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rEG0Q-00033h-Jl
Subject: Re: [f2fs-dev] [PATCH 1/3] btrfs: call btrfs_close_devices from
 ->kill_sb
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
Cc: Christian Brauner <brauner@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Dec 13, 2023 at 09:41:23AM +0100, Christoph Hellwig wrote:
> On Tue, Dec 12, 2023 at 08:00:16PM -0800, Eric Biggers wrote:
> > From: Christoph Hellwig <hch@lst.de>
> > 
> > blkdev_put must not be called under sb->s_umount to avoid a lock order
> > reversal with disk->open_mutex once call backs from block devices to
> > the file system using the holder ops are supported.  Move the call
> > to btrfs_close_devices into btrfs_free_fs_info so that it is closed
> > from ->kill_sb (which is also called from the mount failure handling
> > path unlike ->put_super) as well as when an fs_info is freed because
> > an existing superblock already exists.
> 
> Thanks, this looks roughly the same to what I have locally.
> 
> I did in fact forward port everything missing from the get_super
> series yesterday, but on my test setup btrfs/142 hangs even in the
> baseline setup.  I went back to Linux before giving up for now.
> 
> Josef, any chane you could throw this branch:
> 
>     git://git.infradead.org/users/hch/misc.git btrfs-holder
> 
> into your CI setup and see if it sticks?  Except for the trivial last
> three patches this is basically what you reviewed already, although
> there was some heavy rebasing due to the mount API converison.

I ran it through, you broke a test that isn't upstream yet to test the old mount
api double mount thing that I have a test for

https://github.com/btrfs/fstests/commit/2796723e77adb0f9da1059acf13fc402467f7ac4

In this case we end up leaking a reference on the fs_devices.  If you add this
fixup to "btrfs: call btrfs_close_devices from ->kill_sb" it fixes that failure.
I'm re-running with that fixup applied, but I assume the rest is fine.  Thanks,

Josef


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
