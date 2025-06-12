Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD3EAD64D9
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Jun 2025 02:59:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0+RSqsRY9zSeUINIWynKRgEZYyvg32U67vSIiNthevc=; b=SGN9zp4iDwg/u2DA9waviLXBGI
	h3ULy0iO1CAMvJ8c7cgdQ49tURQOfzEa7fArrx+rAubnfmoC1Vvy4oW3GwRbjxs5kUjZPp8HZiThH
	DcraYhbUY3iYGY/bUsFvk9dko3RN+8VzKg9k3C7fobNm4bz6AcATRgCa8v2YYgEzYvhw=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uPWHt-0006NG-7s;
	Thu, 12 Jun 2025 00:59:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1uPWHr-0006N9-8G
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Jun 2025 00:59:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VgdA/brGVKWRJ3BiUx7Nubq9TxbIqGAD4o6ifrXDSYk=; b=NrfFW6ETLEcvCXpybelxAHfwPB
 LBu/+1JRpvNUZPWM/7O4rVTEk9XNY8zsa4TRMXxzGSN/36jVP8xnNBKu0We/0DPYj69vN2a9Tw9KI
 hoHwVls74g0IlGX0n1p8dTSx4w+GJVa7F5/EnLCCapfYyXOS2LGeWC06KuH6oSATFfWo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VgdA/brGVKWRJ3BiUx7Nubq9TxbIqGAD4o6ifrXDSYk=; b=TO5EG7XFbeTFcO/rwuwx7WpYKP
 WuJVLWxMIoPou8M5ZY8PWtBFZHe1e2t3HJp36OlCEKwAEl8mXabgQv2JHCsZkmOQZ2J7ElZ4iKZyj
 WwTkD0p/0kMk04geOTNxayfA/CTfZCwG4j2NW/+MM5Xg3dQ0UhWF5qsjaikkfGVAv0L8=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uPWHq-0007ng-PI for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Jun 2025 00:59:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 94871629E6;
 Thu, 12 Jun 2025 00:59:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03066C4CEE3;
 Thu, 12 Jun 2025 00:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749689956;
 bh=1pLf5bk/3PFIluwpReZ5mviAqg4CGwb1cCQQmcLw6f0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kn8RsBx4W5wwKgjX2bn2GPL7w7pbuxS4bXmDFzdgWA+KONs14NmKhmdJn+9//1d2a
 U2/Kgaq61LJNRw8jMvkf4uuYNdcYZYbu5E+O60TZXvsvNQ7wT7YrPZUrelkhOW+wAN
 Xy4kBVI1wepj/dFanHYyWK6/6/i0/d1i+/QhVo9b/rG0Xb9jNoDgkijJvYExFr7dwj
 Y6UevZfed66WMmM3EFdMAmC1ngqx06O96BHAbNL6wlbVp6LW3w7GkeJKZz9M+LSMyL
 WAnmQ488J49VwokEuqF6q/94k3A/56jKE7K5zazfC8qQE2LLdby/S/Sdex/T3xWbx8
 ZwyP9Yt+uFe7A==
Date: Thu, 12 Jun 2025 00:59:14 +0000
To: Simon Richter <Simon.Richter@hogyros.de>
Message-ID: <20250612005914.GA546455@google.com>
References: <20250611205859.80819-1-ebiggers@kernel.org>
 <7f63be76-289b-4a99-b802-afd72e0512b8@hogyros.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7f63be76-289b-4a99-b802-afd72e0512b8@hogyros.de>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jun 12, 2025 at 09:21:26AM +0900,
 Simon Richter wrote:
 > Hi, > > On 6/12/25 05:58, Eric Biggers wrote: > > > But > > otherwise this
 style of hardware offload is basically obsolete and has > > [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uPWHq-0007ng-PI
Subject: Re: [f2fs-dev] [PATCH] fscrypt: don't use hardware offload Crypto
 API drivers
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
From: Eric Biggers via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-crypto@vger.kernel.org, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jun 12, 2025 at 09:21:26AM +0900, Simon Richter wrote:
> Hi,
> 
> On 6/12/25 05:58, Eric Biggers wrote:
> 
> > But
> > otherwise this style of hardware offload is basically obsolete and has
> > been superseded by hardware-accelerated crypto instructions directly on
> > the CPU as well as inline storage encryption (UFS/eMMC).
> 
> For desktop, yes, but embedded still has quite a few of these, for example
> the STM32 crypto offload engine, and I expect quite a few FPGA based
> implementations exist, so this would require vendors to maintain a fork to
> keep their out-of-tree drivers functional when updating the kernel.
> 
> POWER also has an asynchronous offload engine with AES, SHA and gzip
> support, these are significantly faster than the CPU.

Do you know if anyone is actually still using a legacy-style accelerator with
fscrypt, and if so what specific performance improvements are they getting?

Arguing that legacy-style crypto acceleration could theoretically be useful in
general isn't really relevant here.  What's relevant here is whether it's
actually useful and worthwhile with this specific kernel subsystem.

As I mentioned, fscrypt has never been optimized for legacy-style accelerators
anyway, and no one has ever tried to do so.  It just hasn't been relevant.

Meanwhile, the real feedback I *do* get from users is that these drivers are
causing problems for users, since the Crypto API (unwisely) enables them by
default and thus fscrypt uses them by default.

There are people who do care about some of these drivers, but they tend to be
the manufacturer of the hardware, not the users.  To me it seems like more of a
check-box exercise than something that is actually worth using in practice.

> If a buggy engine passes self-test, can this simply be fixed by adding more
> tests? :>

The crypto self-tests are disabled by default, just like any other kernel
subsystem.  They are supposed to be run before a kernel is released, but for
most of the drivers they aren't, since people don't have the hardware.  Thus, a
lot of drivers in-tree don't even pass the tests we do have.

Some distros do enable the crypto self-tests in production kernels, but only the
fast tests; the full set of tests is too slow to enable in production.  But even
the full tests don't properly test the hardware offload drivers, which have
unique challenges that do not exist in software code.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
