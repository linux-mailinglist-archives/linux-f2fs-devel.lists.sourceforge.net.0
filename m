Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B2AAE8382
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Jun 2025 15:00:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WiPho/YrNmxhKRZMswh56X3ZCDoPJEI53FXqdUvfZEc=; b=kKfZmKDYzYhBkKVTtxTKyKRYU5
	wHL3a+uQKv1woC/fSNqYfGXVLc4bUgwPf5vXUSrgfRjFZROMJF4SmrVsdaeY57EojHr1IbHrhQnJ2
	h0l3fk5hRg8wkjRlPkDlBf0zdjIt+66itQkALVxDahyMeTK0gJ/pKIc/BK7kt86oV6zQ=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uUPjc-0006H8-H2;
	Wed, 25 Jun 2025 13:00:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <tytso@mit.edu>) id 1uUPjb-0006H2-5r
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Jun 2025 13:00:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YuzEsVWBRugxMDikTUbqgddFbCJ7pRKSZLKOLwLAAAQ=; b=H/yDWNRn6SzJR1pRg7VhXcQUaX
 0tUUfMkftqawunBGpGnhwotKSRHiIGQfmPw2FQQrkcyEXEum9B/U7AS0nGG9dydbLxFleC/0AyyoM
 GBJrbxTNNRkqjT2HPW65u7+3r+VNHg8NLJT98Jcx0EbeN7HAg/Y61Jaz3h3N4M0zXFXA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YuzEsVWBRugxMDikTUbqgddFbCJ7pRKSZLKOLwLAAAQ=; b=Bd8Mx/5JGLLWWBx/NgfN3MiJMF
 1i4bm7rWkpuuo3Tx5mSYqfUc3KoaGEzndBFCigcl0XqM/loojenHnu5vofJmNNATnCVzWO/S1+3Ek
 lHkcJ38iqhPwHHjY+wek9QSgfA7u6GLT1wErD255+Xs9MJN6Uw+k5IfU99QpajEe4V7I=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uUPja-0007t7-LO for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Jun 2025 13:00:15 +0000
Received: from trampoline.thunk.org
 (pool-173-48-82-219.bstnma.fios.verizon.net [173.48.82.219])
 (authenticated bits=0) (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 55PCijuO005260
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Jun 2025 08:44:46 -0400
Received: by trampoline.thunk.org (Postfix, from userid 15806)
 id 067412E00D5; Wed, 25 Jun 2025 08:44:45 -0400 (EDT)
Date: Wed, 25 Jun 2025 08:44:45 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20250625124445.GC28249@mit.edu>
References: <20250611205859.80819-1-ebiggers@kernel.org>
 <7f63be76-289b-4a99-b802-afd72e0512b8@hogyros.de>
 <20250612005914.GA546455@google.com> <20250612062521.GA1838@sol>
 <20250625063252.GD8962@sol>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250625063252.GD8962@sol>
X-Spam-Score: 0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Jun 24, 2025 at 11:32:52PM -0700, Eric Biggers wrote:
 > > That was the synchronous throughput. However, submitting multiple requests
 > asynchronously (which again, fscrypt doesn't actually do) [...] 
 Content analysis details:   (0.4 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.4 KHOP_HELO_FCRDNS       Relay HELO differs from its IP's reverse DNS
X-Headers-End: 1uUPja-0007t7-LO
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-crypto@vger.kernel.org, Simon Richter <Simon.Richter@hogyros.de>,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Jun 24, 2025 at 11:32:52PM -0700, Eric Biggers wrote:
> 
> That was the synchronous throughput.  However, submitting multiple requests
> asynchronously (which again, fscrypt doesn't actually do) barely helps.
> Apparently the STM32 crypto engine has only one hardware queue.
> 
> I already strongly suspected that these non-inline crypto engines
> aren't worth using.  But I didn't realize they are quite this bad.
> Even with AES on a Cortex-A7 CPU that lacks AES instructions, the
> CPU is much faster!

I wonder if the primary design goal of the STM32 crypto engine is that
it might reduce power consumption --- after all, one of the primary
benchmarketing metrics that vendors care about is "hours of You Tube
watch time" --- and decryptoing a video stream doesn't require high
performance.

Given that the typical benchmarketing number which handset vendors
tend to care about is SQLite transactions per second, maybe they
wouldn't be all that eager to use the crypto engine.  :-)

    	     	      	      	     	      - Ted


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
