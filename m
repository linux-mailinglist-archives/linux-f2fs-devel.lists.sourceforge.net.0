Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D225AD8FDC
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Jun 2025 16:43:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aGGKMqFVxX2vv1w/oMaQgOjyOXm7YRqxzZQ5UQ0o6WE=; b=eXQ0kOuVtShTeq/eNr82HlzdVa
	zxvvCBjcAxD90g+TIU5MEp/OBf+rFI2Qoc6WjD05EqZKncQDbmObaXvBVsVSq3aj/MignacEz4mVW
	mwpenQss4jruZAQVjwLQntXaP7b+UZ4xVOrydF1s02zVCIWSrk9BORuDs5KwDWDF1ie4=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uQ5cl-0000J4-Lm;
	Fri, 13 Jun 2025 14:43:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1uQ5ck-0000Ix-Et
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Jun 2025 14:43:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1iUFXaWMjn1BxwLE4IziZunM+iOpwqOwockfDKOOOW0=; b=OMBkEl9uNVhzrJ1o0jbg105S7T
 2bYmqq1N8mFYuM90yxRKlIhy37kqalKeFdIPApoAoV69xMp7xCBwHIXAzVu+cnu5cBF3HbveIMPG+
 cBB0QpRkD7/4QWOtQo0+UjlcR/8STcUBZ3qOH+nBq/rHfyv29O8BoNpakHQmQZrFktjM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1iUFXaWMjn1BxwLE4IziZunM+iOpwqOwockfDKOOOW0=; b=BnbUoXs/M8waKwKzmLpBQR31Xd
 L4iMLD/rZnJf03gcIiuZzakYaSZioeiikosG2hfwfxVymkzRUp2zZKOvgFkNkDvR17dK66vx7eymv
 MxsEUaeL/jrMHt+rQIpi7Nb/G8pR8PwuDek79CsGdIyjf71O5ECW0Tl6B2sw8VLPyDWY=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uQ5cj-0004ZT-FG for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Jun 2025 14:43:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id CDDCDA511C0;
 Fri, 13 Jun 2025 14:43:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40697C4CEE3;
 Fri, 13 Jun 2025 14:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749825786;
 bh=X8uCzsD5itqoI7POYg9wvCv44Y1Bhh9aSVeaZS08ftY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cpFPf1B01lZLa94UVQa51/VgBj9RwtCQJaDlD3SVGhwXzEGZYdDlaAcrCnvBSQri7
 9DNPosHAUVOyrQMIbBB/+2Wjlt+ohCPB/fNLZk9Q9MK4uf3fMpdAqz2An/+VcoUyuX
 xKHKE1bm45MNSEB8bBx2L8WTP1QSY8pnf1lkhFMeMCcomHCxZl3A9uBXRB8jHsJjbs
 9IkOmrjHo4lZU7OafX32/ep8bZb8Mp/wowKzwXA/DF1zUYwF5qBR7tCgJKUp9eSzUx
 K8fUOcYr8aBDNj2Y1dVSRMJgqyx/oJy1V4XkrJ4m94l2lylSW2dTEnDF+6knaZvHE8
 U80TOWjguDBUg==
Date: Fri, 13 Jun 2025 07:42:39 -0700
To: Maxime MERE <maxime.mere@foss.st.com>
Message-ID: <20250613144239.GA1287@sol>
References: <20250611205859.80819-1-ebiggers@kernel.org>
 <8f4c2f36-71af-4c84-bcee-2554cea991d0@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8f4c2f36-71af-4c84-bcee-2554cea991d0@foss.st.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Jun 13, 2025 at 11:01:03AM +0200, Maxime MERE wrote:
 > Hello, > > On 6/11/25 22:58, Eric Biggers wrote: > > To protect users from
 these buggy and seemingly unhelpful drivers that I > > have no [...] 
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
X-Headers-End: 1uQ5cj-0004ZT-FG
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

On Fri, Jun 13, 2025 at 11:01:03AM +0200, Maxime MERE wrote:
> Hello,
> 
> On 6/11/25 22:58, Eric Biggers wrote:
> > To protect users from these buggy and seemingly unhelpful drivers that I
> > have no way of testing, let's make fscrypt not use them.  Unfortunately
> > there is no direct support for doing so in the Crypto API, but we can
> > achieve something very close to it by disallowing algorithms that have
> > ASYNC, ALLOCATES_MEMORY, or KERN_DRIVER_ONLY set.
> 
> I agree that software drivers are more efficient and less prone to bugs than
> hardware drivers. However, I would like to highlight the fact that certain
> ST products (the STM32MP2x series) have features that allow the loading of a
> secret key via an internal bus from a Secure OS to the CRYP peripheral
> (usable by the kernel). This enables cryptographic operations to be
> delegated to the non-secure side (the kernel) without exposing the key.
> 
> If fscrypt no longer supports hardware drivers, then this type of
> functionality could not be used, which I find unfortunate because it is
> something that might interest users.

What?  fscrypt doesn't support that anyway, and there isn't any path forward to
supporting it in a way that would actually improve security.  (Considering how
fscrypt's key derivation etc. works.)

fscrypt does support hardware wrapped *inline encryption* keys, which is
actually designed properly and does work.

Honestly, the responses to this thread so far have made it even more clear that
this patch is the right decision.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
