Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4589CAE8D37
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Jun 2025 20:58:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F5FFVj3yRPBueKzVO3xXfIvoM6e05g4BOrMl2CCM2Ts=; b=RnHCVa0z0QbyJfnlyEcjmWyVCS
	doZ98E4C1Imb2U8c1mPrObORVADznneI89PGWrOw8kpluVd0nM6wNf56SWGWgDHgG6ZJd574WlHsC
	oy1KTmhG6geb5YMg8gXdcxUm5CazzOz7ekP80UYBkzat1iloOAC8JY3NHtcFNuzqpXxw=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uUVJx-0008E6-2A;
	Wed, 25 Jun 2025 18:58:09 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1uUVJv-0008Dy-Dx
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Jun 2025 18:58:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QXyg1Ib/6j8TP3rOYjegDVt2+35XOIJRA7qhwJlPLq0=; b=FENZktORfBsuSit3H9gFOMCE1d
 pGqJ6XRI6xDl6IEwa//hPoDEZG1EE2RghbuvnYqLUt+2ya2evrH79nAaqk8EsXi/Az1cj3yjbOky6
 XPgIl8UHkh54jOAL+Cq5T6FNk+DcsVkY7a+I5lRmwxd9CAv4Wpy9ai8VAFRzU9RPp8Zg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QXyg1Ib/6j8TP3rOYjegDVt2+35XOIJRA7qhwJlPLq0=; b=cfg/fhfDM1jzCIaY+PLP1Uxm8k
 Yxw6d1Wf+o4MWf7oHbp+GMGG1cYbXXk4MeSMSIW+/desnsxCPULUJJVzZ3PdYKqurjT0E8xEMK4JG
 uCoUtpicbsBLcm1toP9oACl3wufUu7vforLy84xZQwCtLigN/tdShIAo8l4/uYPvejOA=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uUVJu-00014C-W2 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Jun 2025 18:58:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A4CD94370D;
 Wed, 25 Jun 2025 18:57:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47806C4CEF0;
 Wed, 25 Jun 2025 18:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750877876;
 bh=9dMCTDJZVMzbS/zBD503nWWVWKm2FovKnQMyh9fpcro=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RfXX4gyzdrSzcJwCnXlcD7dGqdLurOrI0ukuDS2ni26iDSAkow3zKchchRI+UwGL1
 CVKaafO3G5sw5GHlEXIh3Nd6XqMu1XckZgzUk0fTVra8Q6hu2OyuukS/LyKTM99iQ0
 GU2vTn4zkFANEHPM7nlTTgGrUFfu7jYUY1z36LgXLui0nbyr5/AcWl2u2YAECr2NSc
 NhAF455t2SLxIKM4WhoJQbgB2AKEVaCyIXCBcGKejkf6AvfaxoxjTBZWNaOA7ihAlm
 rGX+iUEeloK2dGYQQToMRuwVDS6n9Jc0QxIW8RytzIg/Rs/1sFMntTZ5pnUBMgDuyL
 pIg6KkFWyV51A==
Date: Wed, 25 Jun 2025 11:57:21 -0700
To: Maxime MERE <maxime.mere@foss.st.com>
Message-ID: <20250625185721.GB1703@sol>
References: <20250611205859.80819-1-ebiggers@kernel.org>
 <8f4c2f36-71af-4c84-bcee-2554cea991d0@foss.st.com>
 <20250613144239.GA1287@sol>
 <c1671c5e-d824-4131-861e-470d09371e05@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c1671c5e-d824-4131-861e-470d09371e05@foss.st.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Jun 25, 2025 at 06:29:17PM +0200, Maxime MERE wrote:
 > > > On 6/13/25 16:42, Eric Biggers wrote: > > Honestly, the responses to
 this thread so far have made it even more clear that > > this pa [...] 
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
X-Headers-End: 1uUVJu-00014C-W2
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

On Wed, Jun 25, 2025 at 06:29:17PM +0200, Maxime MERE wrote:
> 
> 
> On 6/13/25 16:42, Eric Biggers wrote:
> > Honestly, the responses to this thread so far have made it even more clear that
> > this patch is the right decision.
> 
> The chaining system I previously presented is just an example intended to
> demonstrate the value of hardware drivers in the context of ST platforms.
> 
> The key point is that our hardware IP allows us to securely embed encryption
> keys directly in hardware, making sure they are never visible or accessible
> from Linux, which runs in a non-secure environment. Our software
> architectures rely on a Secure OS running in parallel with Linux, similar to
> what is done on Android. This Secure OS is responsible for sensitive
> cryptographic operations.
> 
> This Secure OS can manages the keys with a dedicated hardware peripheral
> (SAES). The Linux side never sees the keys directly. Instead, the Secure OS
> prepares the keys and shares them securely with the cryptographic engine
> (CRYP) through a dedicated hardware bus.
> 
> This architecture improves security boundary: keys isolated from the
> non-secure Linux environment. But decryption can be processed by the linux
> kernel.

Can you please stop hijacking this thread with what is basically an irrelevant
marketing blurb?  The STM32 driver actually just stores the keys in memory.  See
stm32_cryp_ctx::key in drivers/crypto/stm32/stm32-cryp.c, and struct
stm32_hash_ctx::key in drivers/crypto/stm32/stm32-hash.c.

So even if the STM32 crypto engine technically supports hardware keys, the
potential benefits of that are not actually being realized in Linux.

And for applications like fscrypt that derive a large number of keys, it isn't
actually possible to use hardware keys even if the driver supported it, without
key wrapping and proper integration with the key hierarchy.  (FWIW, the
hardware-wrapped inline encryption keys feature does do that, but that is very
different from what we're talking about here.)

Also, the STM32 driver does not actually fully support any of fscrypt's file
contents encryption modes.  It does support AES-256-ECB and AES-128-CBC, so it
can be used for AES-256-XTS and AES-128-CBC-ESSIV when the CPU handles the XTS
masking or IV encryption respectively.  But to do that, the CPU needs access to
part of the secret keys.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
