Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4BAAE9416
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Jun 2025 04:37:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q1mMG9Pr0bkXAOtPKWC6GsQfOYaliTuEYmvnVQBUpEU=; b=K5dzm3wUX6ogeTQJWblpglleSG
	ELDu+I5lWeG2DR7Bnuf6neM9sY8Cv0uF1j9IIuKu0dV0Y3mK3/buBVvr7l56alixaheq8/oc1XCBN
	v9M84DjX10MlVPx5x2P9Q7LeoclyMW4JYKmcDbeVdxTx7wNUVx554cAi/8mrdK+jZxs8=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uUcUD-0001sA-Am;
	Thu, 26 Jun 2025 02:37:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1uUcUB-0001s3-3m
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 26 Jun 2025 02:37:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DrLHINBpiAXGVQZed2Xsu188kv2qWboB+CK2AmvHaew=; b=Cvidwh+RLge/ZN5TqoHqyWcnNC
 4WF6zKIYQLvT7VGWDU3unUQLtOEvXsOOqbn11JKQfCQ0BzwDDxnynBjwLjp9qabHDkZeH+lz9KuW1
 2YH5M19bl8v+K0+rpPeKkb7N7WMHLX0vDhG3xSuZbXFsec/TNy9aTjuZXgBcSDoaDZFc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DrLHINBpiAXGVQZed2Xsu188kv2qWboB+CK2AmvHaew=; b=ixSRzDCQHFhkAg6rM1qeCQBlSZ
 TJ0U4NkIgb+qQc6aXFWHVy1tNKCKl0suk/GF1RhXHyopNX1hUQwCjssjG3rKEC3vpgnBooX7x7WyU
 deNDvasSu2pGjOj8rDPyJMdYQGRVSEu7bnfrGGpmPS6hqk3z1LzH0iImdC/typILouMo=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uUcUA-0005Jg-JP for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 26 Jun 2025 02:37:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id DBB4A617F2;
 Thu, 26 Jun 2025 02:37:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54BE1C4CEEA;
 Thu, 26 Jun 2025 02:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750905424;
 bh=3JMG6iB8TJvIJcGTwj3LS7AOTxOpDIfMUVTPuJlJB1k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q5khl0MZs0YrWvdZchwUX1U8I1eBplhj+0tYpxr8rentRjTAoVs7bPlp+FAbfTRvL
 JhCVPANA5DFDFgLXppQGBuXsjHW7Xz7xWcK709Ocg2i1mh1rJyUgd601mvbHuidnOs
 J988JDLYvhXyk48jfkHfr9MRohCkHot3o8lP0zemiipe4KzF9cFFy42mBjU+DsGfHq
 O69fJjbacyWap17eWJ+Grp8TQ/miRrSE6LaMds95gGAynho5fbgUfqKzSvfhd6EExi
 uvpSKAP/X3v6eXj9pxZTQA2xDOoqO19oLIYkdNjy7/Ij3KwUmEdHlwUSHVxEc19mOf
 p7iABbX9Eblrw==
Date: Wed, 25 Jun 2025 19:36:29 -0700
To: Maxime MERE <maxime.mere@foss.st.com>
Message-ID: <20250626023629.GA4797@sol>
References: <20250611205859.80819-1-ebiggers@kernel.org>
 <8f4c2f36-71af-4c84-bcee-2554cea991d0@foss.st.com>
 <20250613144239.GA1287@sol>
 <c1671c5e-d824-4131-861e-470d09371e05@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c1671c5e-d824-4131-861e-470d09371e05@foss.st.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Jun 25, 2025 at 06:29:17PM +0200, Maxime MERE wrote:
 > Regarding robustness and maintenance, ST ensures regular updates of its
 > drivers and can fix any reported bugs. We have conducted intern [...] 
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
X-Headers-End: 1uUcUA-0005Jg-JP
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
> Regarding robustness and maintenance, ST ensures regular updates of its
> drivers and can fix any reported bugs. We have conducted internal tests with
> dm-crypt that demonstrate the proper functioning of these drivers for this
> type of application.

In addition to the bug I mentioned earlier where the STM32 crypto driver
produced incorrect ciphertext (https://github.com/google/fscryptctl/issues/32),
the following fix shows that the STM32 crypto driver computed incorrect hash
values for years (2017 through 2023):

    https://git.kernel.org/linus/e6af5c0c4d32a27e

While these bugs may be fixed now, they show a serious lack of testing.  They
also show that these sorts of drivers are really hard to get right.

I absolutely do not want fscrypt using anything like this.  I want the crypto to
be done correctly.

(And also efficiently, which clearly these offloads don't actually do either.)

BTW, it seems all the hardware offload crypto drivers have quality issues like
this.  I gave other examples in the thread, for example the Intel QAT driver
causing data corruption.  So my intent isn't to single out the STM32 driver per
se.  (And of course this patch applies to all drivers.)  I'm just responding to
STM32 because of the people pushing it in this thread for some reason.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
