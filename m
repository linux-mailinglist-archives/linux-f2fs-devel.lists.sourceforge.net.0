Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 374FEAE771E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Jun 2025 08:34:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H+tp9TsTKRw6fF3q2KNvYCu5D2Zw811AiVwPT+EHWAI=; b=khbOoY4ZLLeR/p17Jqg1m78axy
	TViIaD2Qciq8C40r8pHu6hGKtIEKL4dF+MwKhBBC3huMNgspbE0Gqo+S9N4qTRo0yOjL3IDxPA8cP
	FnYNmK6+inPkbDmXyS6i9Bo7CQIt0xWCW0dPoJ/BRorq8meUAeGV4FATe3VfG2jRFd8E=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uUJhQ-0001MC-NP;
	Wed, 25 Jun 2025 06:33:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1uUJhN-0001Ln-Pr
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Jun 2025 06:33:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TM22rDrn62S467S7t40ymlvJvfoiq/oDBLabsD6PjGA=; b=WA+eJqeHvcDUMCBGwSxz7MtFfu
 f3UWIbjf6LULCKKXaq6/U4gh5HeXpMJbdZhaoq9jFpGHQrJi7t/i1UiDT23QGUre7wNgBO7gkzBev
 5Wj3HOFaPGT5BYSIy9uEp2CwhwdhIbh+g9+YLfxz6DGFVxD+j+luD5bhBtzDdjx5BtrI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TM22rDrn62S467S7t40ymlvJvfoiq/oDBLabsD6PjGA=; b=hrHhv6OEpbmxBMAdT0I0IMeBJ3
 LqpZQPv1tXfC5QfbWL3D88zGLFAKW3uzIyCIDmEssw3LebV7eOTSkWw18exf5HkvtgijLpkrQfWUV
 6jiwqmLrM+Etah6n4uBR4sSdcPCPHFlALOsJfdwPDCna/bggPWWK6QZufniry/x/b9P8=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uUJhN-0003Cf-5c for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Jun 2025 06:33:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 71C99A50D35;
 Wed, 25 Jun 2025 06:33:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7B4DC4CEEA;
 Wed, 25 Jun 2025 06:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750833207;
 bh=KvBZdCVe3bjcds3toNzSaotNrJRp/h1SfSaoHVQtlow=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bgakoUfAtI3aZ6TL8fY22KKltCf5IxNhnzJ2oiyuuI/GEIHZVXnwJ10tWdkSvPitL
 /7bgjo9d0xQe1/8gpM9TBWDxFi/Ea0rEL81mSYagOjUKrHIXs7lqZdbBqzmHFzyv8u
 ZWO+dWfZgHmJ/TMTmP0277ODQYtrlhMqpajvswJ8zCCo09C9Bj7uSHR7SGVz+9SwGl
 KSwIFk6u+iudkaHqeTJb2dbajWY0742z1b6HWGCzoj5/myPz3cCTRLT7guhEKxa1Ue
 qWBczEoXOLdeLmUv9Qp8JOrF2q6gevGPPGRKDXQ/LfFR2ZmiDmtFXt9weQocqTrCp1
 Hz6xQ9sygvLRQ==
Date: Tue, 24 Jun 2025 23:32:52 -0700
To: Simon Richter <Simon.Richter@hogyros.de>
Message-ID: <20250625063252.GD8962@sol>
References: <20250611205859.80819-1-ebiggers@kernel.org>
 <7f63be76-289b-4a99-b802-afd72e0512b8@hogyros.de>
 <20250612005914.GA546455@google.com> <20250612062521.GA1838@sol>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250612062521.GA1838@sol>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Jun 11, 2025 at 11:25:21PM -0700, Eric Biggers wrote:
 > On Thu, Jun 12, 2025 at 12:59:14AM +0000, Eric Biggers wrote: > > On Thu,
 Jun 12, 2025 at 09:21:26AM +0900, Simon Richter wrote: > > > H [...] 
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
X-Headers-End: 1uUJhN-0003Cf-5c
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

On Wed, Jun 11, 2025 at 11:25:21PM -0700, Eric Biggers wrote:
> On Thu, Jun 12, 2025 at 12:59:14AM +0000, Eric Biggers wrote:
> > On Thu, Jun 12, 2025 at 09:21:26AM +0900, Simon Richter wrote:
> > > Hi,
> > > 
> > > On 6/12/25 05:58, Eric Biggers wrote:
> > > 
> > > > But
> > > > otherwise this style of hardware offload is basically obsolete and has
> > > > been superseded by hardware-accelerated crypto instructions directly on
> > > > the CPU as well as inline storage encryption (UFS/eMMC).
> > > 
> > > For desktop, yes, but embedded still has quite a few of these, for example
> > > the STM32 crypto offload engine
> 
> By the way, I noticed you specifically mentioned STM32.  I'm not sure if you
> looked at the links I had in my commit message, but one of them
> (https://github.com/google/fscryptctl/issues/32) was actually for the STM32
> driver being broken and returning the wrong results, which broke filename
> encryption.  The user fixed the issue by disabling the STM32 driver, and they
> seemed okay with that.
> 
> That doesn't sound like something useful, IMO.  It sounds more like something
> actively harmful to users.
> 
> Here's another one I forgot to mention:
> https://github.com/google/fscryptctl/issues/9
> 
> I get blamed for these issues, because it's fscrypt that breaks.

Since two people were pushing the STM32 crypto engine in this thread:

I measured decryption throughput on 4 KiB messages on an STM32MP157F-DK2.  This
is an embedded evaluation board that includes an STM32 crypto engine and has an
800 MHz Cortex-A7 processor.  Cortex-A7 doesn't have AES instructions:

    AES-128-CBC-ESSIV:
        essiv(stm32-cbc-aes,sha256-arm):
            3.1 MB/s
        essiv(cbc-aes-neonbs,sha256-arm): 
            15.5 MB/s

    AES-256-XTS:
        xts(stm32-ecb-aes):
            3.1 MB/s
        xts-aes-neonbs:
            11.0 MB/s
            
    Adiantum:
        adiantum(xchacha12-arm,aes-arm,nhpoly1305-neon):
            53.1 MB/s

That was the synchronous throughput.  However, submitting multiple requests
asynchronously (which again, fscrypt doesn't actually do) barely helps.
Apparently the STM32 crypto engine has only one hardware queue.

I already strongly suspected that these non-inline crypto engines aren't worth
using.  But I didn't realize they are quite this bad.  Even with AES on a
Cortex-A7 CPU that lacks AES instructions, the CPU is much faster!

But of course Adiantum is even faster, as it was specifically designed for CPUs
that don't have AES instructions.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
