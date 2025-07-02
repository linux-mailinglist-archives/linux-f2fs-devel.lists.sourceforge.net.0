Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F34AAF1215
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Jul 2025 12:37:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=osv8bhIXUTZ6tQ9fK7TdeG7Nyhi29sKg1eKgxYq12Fs=; b=Gu+lWkG0NEuwXG/o7qRrUNfmIS
	1kXtcdJ0CHJlkw5mkmpbDulh2AzWWxXRQcUrYrxt0WcB0cFlpn9AJUILpttY10IDZR3QVi2yGDjrG
	coLsNXNAkNo5caBL68oj3fmyUHK3ND/PPIAO08C2Py+Bk5N73HfxOXGcUlKu7Keo2jGU=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uWuqB-0006fD-LH;
	Wed, 02 Jul 2025 10:37:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <gregkh@linuxfoundation.org>) id 1uWuqA-0006f6-Fx
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Jul 2025 10:37:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/19Uo91s7ixpyK7vib1hfvWVbmJDFHSptpgMlyzDxG4=; b=M5szVaAr3hwCFqP4JWsE7OyL1g
 bndEQlUs9CIvxiTviwk9G4ARdr/MjQVGjSqYSV2ddJA1Rnjq+3csHjLs/RS623EI4a+Ur/AfXVaQh
 qJaEww6/N16Ro3g6Q1VYuCkS+1NnxqQgjUTaCS/XKvQSQqCk5wHck+mNXbYey8qwf9Vc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/19Uo91s7ixpyK7vib1hfvWVbmJDFHSptpgMlyzDxG4=; b=QUXZX6AGS/L3cQZWh/NnXsd8SW
 Zctc3ng3s1e9Y5CuyGewmxu3uSRxoOOjd3gUr8I8NqUnHGau8EdVU2CvnClYP7Si4L+AJQXeP/yp4
 0LQePFrDBzuaPINtbbqUuulERHjzBDGlnZD61dcE8m7Bz43ztCp/AOA7x5sAHGe4+VXo=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uWuq9-0007x6-UC for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Jul 2025 10:37:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 993B8A52100
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  2 Jul 2025 10:20:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C11C2C4CEED;
 Wed,  2 Jul 2025 10:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1751451633;
 bh=isVC2OxjtYeqrfimdWGEstYRYwCNvNScMRWqnkaXR5Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ldHuEhFu2SGpKZLoH1Ob+UWzanKdn4CbBABLItbBdbvqk3EYLiAREtyvVyNJVJsIO
 QrfOqR5WxC997Tn11w9ouYm+N85Vqt49rr2e9zg3opiRPnIPU9fQampZJR72A3VlTj
 zdlyJ/H5U3hvRbdazjEt7nnd6gwVcNf3kUtzYgWI=
Date: Wed, 2 Jul 2025 12:20:30 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Lee Jones <lee@kernel.org>
Message-ID: <2025070253-erased-armadillo-0984@gregkh>
References: <20250416054805.1416834-1-chao@kernel.org>
 <20250624100039.GA3680448@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250624100039.GA3680448@google.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Jun 24, 2025 at 11:00:39AM +0100, Lee Jones wrote:
 > On Wed, 16 Apr 2025, Chao Yu wrote: > > > This patch adds a new sysfs entry
 /sys/fs/f2fs/<disk>/encoding_flags, > > it is a read-only entry [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uWuq9-0007x6-UC
Subject: Re: [f2fs-dev] [STABLE 5.15+] f2fs: sysfs: add encoding_flags entry
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
Cc: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Jun 24, 2025 at 11:00:39AM +0100, Lee Jones wrote:
> On Wed, 16 Apr 2025, Chao Yu wrote:
> 
> > This patch adds a new sysfs entry /sys/fs/f2fs/<disk>/encoding_flags,
> > it is a read-only entry to show the value of sb.s_encoding_flags, the
> > value is hexadecimal.
> > 
> > ===========================      ==========
> > Flag_Name                        Flag_Value
> > ===========================      ==========
> > SB_ENC_STRICT_MODE_FL            0x00000001
> > SB_ENC_NO_COMPAT_FALLBACK_FL     0x00000002
> > ===========================      ==========
> > 
> > case#1
> > mkfs.f2fs -f -O casefold -C utf8:strict /dev/vda
> > mount /dev/vda /mnt/f2fs
> > cat /sys/fs/f2fs/vda/encoding_flags
> > 1
> > 
> > case#2
> > mkfs.f2fs -f -O casefold -C utf8 /dev/vda
> > fsck.f2fs --nolinear-lookup=1 /dev/vda
> > mount /dev/vda /mnt/f2fs
> > cat /sys/fs/f2fs/vda/encoding_flags
> > 2
> > 
> > Signed-off-by: Chao Yu <chao@kernel.org>
> > ---
> >  Documentation/ABI/testing/sysfs-fs-f2fs | 13 +++++++++++++
> >  fs/f2fs/sysfs.c                         |  9 +++++++++
> >  2 files changed, 22 insertions(+)
> 
> This patch, commit 617e0491abe4 ("f2fs: sysfs: export linear_lookup in
> features directory") upstream, needs to find its way into all Stable
> branches containing upstream commit 91b587ba79e1 ("f2fs: Introduce
> linear search for dentries"), which is essentially linux-5.15.y and
> newer.
> 
> stable/linux-5.4.y:
> MISSING:     f2fs: Introduce linear search for dentries
> MISSING:     f2fs: sysfs: export linear_lookup in features directory
> 
> stable/linux-5.10.y:
> MISSING:     f2fs: Introduce linear search for dentries
> MISSING:     f2fs: sysfs: export linear_lookup in features directory
> 
> stable/linux-5.15.y:
> b0938ffd39ae f2fs: Introduce linear search for dentries [5.15.179]
> MISSING:     f2fs: sysfs: export linear_lookup in features directory
> 
> stable/linux-6.1.y:
> de605097eb17 f2fs: Introduce linear search for dentries [6.1.129]
> MISSING:     f2fs: sysfs: export linear_lookup in features directory
> 
> stable/linux-6.6.y:
> 0bf2adad03e1 f2fs: Introduce linear search for dentries [6.6.76]
> MISSING:     f2fs: sysfs: export linear_lookup in features directory
> 
> stable/linux-6.12.y:
> 00d1943fe46d f2fs: Introduce linear search for dentries [6.12.13]
> MISSING:     f2fs: sysfs: export linear_lookup in features directory
> 
> mainline:
> 91b587ba79e1 f2fs: Introduce linear search for dentries
> 617e0491abe4 f2fs: sysfs: export linear_lookup in features directory

Great, then can someone submit these in a format we can apply them in?
or do clean cherry-picks work properly?

thanks,

greg k-h


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
