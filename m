Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 163CFAD67FD
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Jun 2025 08:26:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9/3cxQOwf4IjjRPdKSX51Pzev82dZaA0d2r/ftjn6MI=; b=PsG+SgMhuCPFipI9lL+WWlSEwH
	RjqQmBqoF1lLJdjMtm9tdJom+GY8XIETyZBiVLWH7lVlziZyCi+7LSTW5jUv2JTqmp5RvojMrvO12
	6N+TWqH9A+cnmxS1TU7Bry/RlCnyZNDfJfUIwP0aomc6N4C5VE7D7ZKadJfikfiTBn34=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uPbO7-0006am-Fd;
	Thu, 12 Jun 2025 06:26:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1uPbNu-0006aO-6A
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Jun 2025 06:25:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+FNJQs610jqlp+z9C6Y2u/xna4LeENKfsB8TPuxqba4=; b=PXfMlzAhnlQAwrv8id6Pis1Oda
 QOu9PBySOKOL7iR2UigWAQI6d6nLaNvqJXFc4u5YOs+u81yJq7ZGR5Ypjg8pNMuikfHTOVDsWieRr
 BBy6LpX/ueO8U3OEHV2VSrVTbP+4ryaw/6TqHPpHbeOW++7/gIx8C9oqJnD+OHLFipd8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+FNJQs610jqlp+z9C6Y2u/xna4LeENKfsB8TPuxqba4=; b=bGN3E4TVQXqgAXgGPCdZ57rS+b
 gdym9QdqcJpoRpC+nPV2DO8SL74UTL9FsDF2pMcRWCmeIvbmGgLLx3PgPP9Y/KIbQm1YrlzDDnBMZ
 JY6DBKRzKTM/NdcdS4u7j4tFxBUOva49fx6IIb5VQRuReKq6JwUSvYPYJey5XWCViRIo=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uPbNt-0004Rv-OQ for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Jun 2025 06:25:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B050D5C0E0E;
 Thu, 12 Jun 2025 06:23:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C556AC4CEEA;
 Thu, 12 Jun 2025 06:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749709547;
 bh=M9CxTHdXT5WrEkUahJ2svzM+9WFZHYH6PnfsJfmp96g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JKL18zgaAsvyau0vg8RznAF41pnRn29ke6AvxA2D7Mw7V5apl+KttEkVoHd6d/tnL
 Tuo1iauSla5SB1LKgm+CI852NO9cSM9ti1JUQsc/o7dMziPmdWh9ZdbdQ2+TqECf72
 tKe6h029giSgUjLMox+O2hYJKhtS6lMpSEfXLsJfJnNduiMUk/nc06zKPQ6Xuo/CLw
 gDfzldMCEdbHvb9VdubI943kkJgzbIHMo9wMyw6AZYo1x8aI4EOPR+sgVoGrwCPBtm
 IjKOYTe5ai8875DlouqZWShNo2Danpn8JLN4tG1KOtY8p69UDDT8P0t64FjMsOusx5
 x4gCYIr9ucEUA==
Date: Wed, 11 Jun 2025 23:25:21 -0700
To: Simon Richter <Simon.Richter@hogyros.de>
Message-ID: <20250612062521.GA1838@sol>
References: <20250611205859.80819-1-ebiggers@kernel.org>
 <7f63be76-289b-4a99-b802-afd72e0512b8@hogyros.de>
 <20250612005914.GA546455@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250612005914.GA546455@google.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jun 12, 2025 at 12:59:14AM +0000, Eric Biggers wrote:
 > On Thu, Jun 12, 2025 at 09:21:26AM +0900, Simon Richter wrote: > > Hi,
 > > > > On 6/12/25 05:58, Eric Biggers wrote: > > > > > But > > > [...] 
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
X-Headers-End: 1uPbNt-0004Rv-OQ
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

On Thu, Jun 12, 2025 at 12:59:14AM +0000, Eric Biggers wrote:
> On Thu, Jun 12, 2025 at 09:21:26AM +0900, Simon Richter wrote:
> > Hi,
> > 
> > On 6/12/25 05:58, Eric Biggers wrote:
> > 
> > > But
> > > otherwise this style of hardware offload is basically obsolete and has
> > > been superseded by hardware-accelerated crypto instructions directly on
> > > the CPU as well as inline storage encryption (UFS/eMMC).
> > 
> > For desktop, yes, but embedded still has quite a few of these, for example
> > the STM32 crypto offload engine

By the way, I noticed you specifically mentioned STM32.  I'm not sure if you
looked at the links I had in my commit message, but one of them
(https://github.com/google/fscryptctl/issues/32) was actually for the STM32
driver being broken and returning the wrong results, which broke filename
encryption.  The user fixed the issue by disabling the STM32 driver, and they
seemed okay with that.

That doesn't sound like something useful, IMO.  It sounds more like something
actively harmful to users.

Here's another one I forgot to mention:
https://github.com/google/fscryptctl/issues/9

I get blamed for these issues, because it's fscrypt that breaks.

FWIW, here's what happens if you try to use the Intel QAT driver with dm-crypt:
https://lore.kernel.org/r/CACsaVZ+mt3CfdXV0_yJh7d50tRcGcRZ12j3n6-hoX2cz3+njsg@mail.gmail.com/
https://lore.kernel.org/r/0171515-7267-624-5a22-238af829698f@redhat.com/

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
