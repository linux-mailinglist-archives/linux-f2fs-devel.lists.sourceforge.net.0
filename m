Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D7755B0EE9F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 23 Jul 2025 11:42:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vXPndP47YA4tWpql4DLF/VeZhqSc+q4mL/s0LTMXqEM=; b=cSpR+UPQscr05l7h41mazD7s15
	K7SGu/QsFlXh/sF3pr7jA1fbV0p20cpE2PwPUKKz7no1nw+ySlItK5+m8eo/EUUnNoFx8IOHVT2C1
	tqcdjdMTQJ0p1+6dregIU84dpxaFWMkosRukoFvUaMkUgP4kL4clG5UOgCCQPyBe6j78=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ueVyt-0008W2-Tt;
	Wed, 23 Jul 2025 09:41:47 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <gregkh@linuxfoundation.org>) id 1ueVys-0008Vu-JL
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 23 Jul 2025 09:41:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QqwSLeeoU3Y51sXBR2JVmULXQNhnAOidUN8J5k/wKXc=; b=JTsETxDfRtsSCsx2GEnwq6QzkY
 nk3TjauJUrfrYK1nCKbY+1mGCgSCm3BKPziLJuuJeTOOmExGAWpCQm0oDv/B0FuasU6429ovG2j6F
 vgGmYInOLODPzPP3rm/BF3UuYmTKKAUiaXB62wZyza7hObUA9DaF9Tcb7DYWcphZYT44=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QqwSLeeoU3Y51sXBR2JVmULXQNhnAOidUN8J5k/wKXc=; b=QUdpUxbTC3uGXkXwuwPYzIAOSn
 gS677PWxHTXva4jn/bKuGen/I77/IXtWIluOjVrKjJFseUO3pQ7zG3Q1buK2OGitmDVHJv+aUr3wG
 PZdo0mSzxUIiNio1WjU9dRCApps7uBzpKCLLUeHB3EOuWvgl/e9qHdWi+z9xkIh4eQcE=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ueVys-00079K-0w for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 23 Jul 2025 09:41:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5A939601E2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 23 Jul 2025 09:41:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FF66C4CEE7;
 Wed, 23 Jul 2025 09:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1753263695;
 bh=1/lbNstEMNBJzLLuXN9FzvhMHrlDsRI79DtutyWW4Bc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=wlt4dpb8qq26vBixU70O29k4bGja5UeoLkHFEgZ9Fxl3BsjKxbU78pDfKBfzVZ+j4
 BRao6VRPDCSogF/Jzt0hoOggtg+RUHKFwEh+ymbhfnCf0nxC6xavG8PIHGkJ7wbMB2
 sAL63FkM7x5ICIzzMg83RPZnCNr4CXBVGZdsmq5Q=
Date: Wed, 23 Jul 2025 11:41:31 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Lee Jones <lee@kernel.org>
Message-ID: <2025072354-tricolor-annex-92fb@gregkh>
References: <20250416054805.1416834-1-chao@kernel.org>
 <20250624100039.GA3680448@google.com>
 <2025070253-erased-armadillo-0984@gregkh>
 <20250723082639.GP11056@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250723082639.GP11056@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Jul 23, 2025 at 09:26:39AM +0100, Lee Jones wrote:
 > On Wed, 02 Jul 2025, Greg Kroah-Hartman wrote: > > > On Tue, Jun 24, 2025
 at 11:00:39AM +0100, Lee Jones wrote: > > > On Wed, 16 Apr 2025, [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ueVys-00079K-0w
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

On Wed, Jul 23, 2025 at 09:26:39AM +0100, Lee Jones wrote:
> On Wed, 02 Jul 2025, Greg Kroah-Hartman wrote:
> 
> > On Tue, Jun 24, 2025 at 11:00:39AM +0100, Lee Jones wrote:
> > > On Wed, 16 Apr 2025, Chao Yu wrote:
> > > 
> > > > This patch adds a new sysfs entry /sys/fs/f2fs/<disk>/encoding_flags,
> > > > it is a read-only entry to show the value of sb.s_encoding_flags, the
> > > > value is hexadecimal.
> > > > 
> > > > ===========================      ==========
> > > > Flag_Name                        Flag_Value
> > > > ===========================      ==========
> > > > SB_ENC_STRICT_MODE_FL            0x00000001
> > > > SB_ENC_NO_COMPAT_FALLBACK_FL     0x00000002
> > > > ===========================      ==========
> > > > 
> > > > case#1
> > > > mkfs.f2fs -f -O casefold -C utf8:strict /dev/vda
> > > > mount /dev/vda /mnt/f2fs
> > > > cat /sys/fs/f2fs/vda/encoding_flags
> > > > 1
> > > > 
> > > > case#2
> > > > mkfs.f2fs -f -O casefold -C utf8 /dev/vda
> > > > fsck.f2fs --nolinear-lookup=1 /dev/vda
> > > > mount /dev/vda /mnt/f2fs
> > > > cat /sys/fs/f2fs/vda/encoding_flags
> > > > 2
> > > > 
> > > > Signed-off-by: Chao Yu <chao@kernel.org>
> > > > ---
> > > >  Documentation/ABI/testing/sysfs-fs-f2fs | 13 +++++++++++++
> > > >  fs/f2fs/sysfs.c                         |  9 +++++++++
> > > >  2 files changed, 22 insertions(+)
> > > 
> > > This patch, commit 617e0491abe4 ("f2fs: sysfs: export linear_lookup in
> > > features directory") upstream, needs to find its way into all Stable
> > > branches containing upstream commit 91b587ba79e1 ("f2fs: Introduce
> > > linear search for dentries"), which is essentially linux-5.15.y and
> > > newer.
> > > 
> > > stable/linux-5.4.y:
> > > MISSING:     f2fs: Introduce linear search for dentries
> > > MISSING:     f2fs: sysfs: export linear_lookup in features directory
> > > 
> > > stable/linux-5.10.y:
> > > MISSING:     f2fs: Introduce linear search for dentries
> > > MISSING:     f2fs: sysfs: export linear_lookup in features directory
> > > 
> > > stable/linux-5.15.y:
> > > b0938ffd39ae f2fs: Introduce linear search for dentries [5.15.179]
> > > MISSING:     f2fs: sysfs: export linear_lookup in features directory
> > > 
> > > stable/linux-6.1.y:
> > > de605097eb17 f2fs: Introduce linear search for dentries [6.1.129]
> > > MISSING:     f2fs: sysfs: export linear_lookup in features directory
> > > 
> > > stable/linux-6.6.y:
> > > 0bf2adad03e1 f2fs: Introduce linear search for dentries [6.6.76]
> > > MISSING:     f2fs: sysfs: export linear_lookup in features directory
> > > 
> > > stable/linux-6.12.y:
> > > 00d1943fe46d f2fs: Introduce linear search for dentries [6.12.13]
> > > MISSING:     f2fs: sysfs: export linear_lookup in features directory
> > > 
> > > mainline:
> > > 91b587ba79e1 f2fs: Introduce linear search for dentries
> > > 617e0491abe4 f2fs: sysfs: export linear_lookup in features directory
> > 
> > Great, then can someone submit these in a format we can apply them in?
> > or do clean cherry-picks work properly?
> 
> Does this work:
> 
> Please backport upstream commit:
> 
>   617e0491abe4 f2fs: sysfs: export linear_lookup in features directory
> 
> ... to all stable branches up to and including linux-5.15.y.
> 
> If there are conflicts, I can do the backport myself and submit as patches.

There are conflicts, it doesn't apply to 6.1.y or 5.15.y :(

thanks,

greg k-h


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
