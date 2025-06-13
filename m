Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6ACAD8043
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Jun 2025 03:24:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SeGeHi+HZhoy8QUzzYkbbAaQw/cwTjojTeudObPL+5A=; b=VU5FtZ9JPPCL2QLay/zJmcntoq
	QIC89VR1maEl/ilU19v5bn6/ggDTV/Cr+QnSfTH8SNbdcCct2mlPMKwSsuekut5eg7bx5/uD12m6T
	xS54yRBP1MtaAt+QlY64JW2q1heF8Ngj76dz7hrFJHKYDHAWdxMcWqQsMDb6qKDyiXkM=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uPt9R-0005yc-Rc;
	Fri, 13 Jun 2025 01:24:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1uPt9Q-0005yT-E9
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Jun 2025 01:24:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XK46kPvao1SrNg9qxW4E52djug2fTrwEfHR0OG8cZmI=; b=BtZf+IgDCd0CtISNkw6YrUJSm3
 oS6TGgQ+iFx4X3rPWPupx1h31uZKUYbK9WurbpjLeB5mrVi5q47gvBKYDXgp2lqek+hGtzuhAYCqM
 gayEPcpO09uDXGHgamFJQByEMZd4oTD2PbbTQad00rO7MkNGJ73lXcVW+++G/isLqEco=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XK46kPvao1SrNg9qxW4E52djug2fTrwEfHR0OG8cZmI=; b=fHIG0rWoqqIscAMmC+ntuayrCC
 gOcLaqGaNyRg/rs7rQeBeovOL+POWQ24fUib9kyLflCk5ERGC1+DYJGvS3t0201uKYoeIbVECP0SF
 JWDq44asN040Sn0rIDHhbSiA0x47MSgJWWmGY5voSTGyGKKh0/tZj8KSGlLKF2jzKi+c=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uPt9P-0005vY-Fn for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Jun 2025 01:24:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 857A56112C;
 Fri, 13 Jun 2025 01:24:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB4CEC4CEEA;
 Fri, 13 Jun 2025 01:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749777840;
 bh=d5rHizoOE6yeSiQobFd52hpxfVk2+AkiKtye4xkZZNQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sopL9OVGaKkYBLoQ9K0Gx3mNqKCtmF6HeqAxRPeMFvJLOQNPGNCCbdfRxS2LlfLqu
 C3Drs4Qu4cFQG2+79qNVN/2U+Mp5r2Ku8fHrvgJywco1pbYG6PtA3ImiR1O4x08klz
 xDAF1Jfb3fKbHGBJ+46TYP3cVpNrl19/EEmKclh0GQCX86o255XF08PT4Rd7b6JjMQ
 0pZk7pLaqF1Q6YqyMWUL0yY5F1li1Q6ACzRmSrSgpQrt8hIvANSSWWinXiguz6euWJ
 eocxM+zUeCV/S4k5Ycq56kPx+45/tXS3yhtnvX35hipDpMVHslTEwlPdsTCo0NKkoz
 V/KcVAfBqnyXg==
Date: Fri, 13 Jun 2025 01:23:57 +0000
To: Giovanni Cabiddu <giovanni.cabiddu@intel.com>
Message-ID: <20250613012357.GA3603104@google.com>
References: <20250611205859.80819-1-ebiggers@kernel.org>
 <7f63be76-289b-4a99-b802-afd72e0512b8@hogyros.de>
 <20250612005914.GA546455@google.com> <20250612062521.GA1838@sol>
 <aEqU0iU1tBrLEYUq@gcabiddu-mobl.ger.corp.intel.com>
 <20250612155743.GA3529549@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250612155743.GA3529549@google.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jun 12, 2025 at 03:57:43PM +0000, Eric Biggers wrote:
 > On Thu, Jun 12, 2025 at 09:50:26AM +0100, Giovanni Cabiddu wrote: > > On
 Wed, Jun 11, 2025 at 11:25:21PM -0700, Eric Biggers wrote: > > [...] 
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
X-Headers-End: 1uPt9P-0005vY-Fn
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
 linux-crypto@vger.kernel.org, Simon Richter <Simon.Richter@hogyros.de>,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jun 12, 2025 at 03:57:43PM +0000, Eric Biggers wrote:
> On Thu, Jun 12, 2025 at 09:50:26AM +0100, Giovanni Cabiddu wrote:
> > On Wed, Jun 11, 2025 at 11:25:21PM -0700, Eric Biggers wrote:
> > 
> > ...
> > 
> > > FWIW, here's what happens if you try to use the Intel QAT driver with dm-crypt:
> > > https://lore.kernel.org/r/CACsaVZ+mt3CfdXV0_yJh7d50tRcGcRZ12j3n6-hoX2cz3+njsg@mail.gmail.com/
> > 
> > /s/happens/happened/
> > 
> > ... and it got fixed
> > https://lore.kernel.org/all/20220506082327.21605-1-giovanni.cabiddu@intel.com/
> 
> But it reached users in the first place, including stable kernels.  And
> apparently the issues were going on for years and were known to the authors of
> the driver
> (https://lore.kernel.org/linux-crypto/91fe9f87-54d7-4140-4d1a-eac8e2081a7c@gmail.com/).
> 
> We simply don't have issues like this with the AES-NI or VAES XTS code.
> 
> And separately, QAT was reported to be much slower than AES-NI for synchronous use
> (https://lore.kernel.org/linux-crypto/0171515-7267-624-5a22-238af829698f@redhat.com/)
> 
> Later, I added VAES accelerated AES-XTS code which is over twice as fast as
> AES-NI on the latest Intel CPUs, so that likely widened the gap even more.
> 
> Yet, the QAT driver registers its "xts(aes)" implementation with priority 4001,
> compared to priority 800 for the VAES accelerated one.  So the QAT one is the
> one that will be used by fscrypt!
> 
> That seems like a major issue even just from a performance perspective.
> 
> I expect this patch will significantly improve fscrypt performance on Intel
> servers that have QAT.

I was curious, so I actually ran a benchmark on an Intel Emerald Rapids server.
Specifically, I used a kernel module that repeatedly en/decrypted 4096-byte
messages with AES-XTS using crypto_skcipher_en/decrypt().  That's basically what
fscrypt's file contents encryption does, but here I just measured the raw crypto
performance.  I tested both xts-aes-vaes-avx512 and qat_aes_xts.  For both, the
difference between encryption and decryption was within the margin of error, so
I'll give just one number for each.

Results:

    xts-aes-vaes-avx512: 16171 MB/s
    qat_aes_xts: 289 MB/s

So, QAT is 55 times slower than the VAES-optimized software code!

It's even slower than the generic C code:
     
    xts(ecb(aes-generic)): 305 MB/s

Now, it could be argued that this is user error -- I "should" have created lots
of asynchronous crypto requests for 4K blocks, submitted them all at once, and
waited for them to complete.  Thus allowing parallel processing by QAT.

But, that's simply not what fscrypt does.  And even if it did, it could only
plausibly help for large bios.  Short bios, for which latency is really
important, would continue to be massively regressed by using QAT for them.

Even for large bios, it would have to get over 55 times faster to be worth it,
which seems (very?) tenuous.

Also, as is known from dm-crypt which does do async processing, the code that's
needed to do it is quite complex and error-prone.

In any case, async processing would be a theoretical future improvement.  It's
simply not what fscrypt does today, or has ever done.

I also found that, even though I built the QAT driver as a loadable module, it
was loaded automatically on the system and prioritized itself over the VAES-
accelerated AES-XTS.  Thus, it would be what fscrypt uses on Intel servers where
the QAT driver is enabled in kconfig, even just as 'm'.

Even disregarding the historical data corruption issues with QAT, I think this
makes it *very* clear that the QAT driver is harmful to fscrypt users.

And I've seen similar results with the Qualcomm crypto engine
(https://lore.kernel.org/r/20241203180553.16893-1-ebiggers@kernel.org/).
So this isn't even unique to this particular accelerator either.

This has gone on for long enough.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
