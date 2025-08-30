Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A7EB3D03D
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 31 Aug 2025 01:56:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qt1ysJK6FyAqvpvpI8bsOHVZQ3a0AnRV3grxNrF4xGE=; b=kYqhxNBqiiVrSU7XRe/F09metX
	HEOroZFwo7JWF0wnblXAwI9/BIWYdic6dOupVNrN1KuB9SkqOMPiN3O42GRDNNnvhhnfZtH5FJOsG
	gfQIVwzIHO3wmx7AOd2USV9XYzSKmgf+U/2zjZ5XqWQfqSCZCMoYRmkQY3jFXO2ENJo0=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1usVQz-0003Py-M5;
	Sat, 30 Aug 2025 23:56:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1usVQx-0003Po-G5
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 30 Aug 2025 23:56:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NWF603CkTZF9BPoQaTHfZIvVfco0vJjuhlH6lM1qpzc=; b=nJtCjqg+uBU7uRe6QFUQ/Cc4uy
 6hcTLXKQg/l40YSVwlAgtDcUHO+9K0LZlFUQ8Xt7w0IUIGnBNJqg0zkjduikE+j1zb6HqYgVcQCdo
 u/yYKvN5bUSQRwFykvXspNZUsSH+tCXB87aZoPmop61owKbzpNjUf4yC6MB1RMc7ZaCw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NWF603CkTZF9BPoQaTHfZIvVfco0vJjuhlH6lM1qpzc=; b=LZHqg51Q8P6qmt2zBC6HnTs+Mk
 dqQLM5rz/XcidJAH9e+oVj1SC57Y5516cQRx7rqJZkmHwy7/6zn6JcsT4Y8mcQmtZ9puEWGHT3Z/0
 TIKEprFs1esNz1veZGcbFHDZMNx9mg3G5JKkTbOp+1+FAzHRql/vqmzUslFmFOAiJrno=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1usVQw-0001jx-Vr for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 30 Aug 2025 23:56:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5223B60147;
 Sat, 30 Aug 2025 23:56:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 897B8C4CEEB;
 Sat, 30 Aug 2025 23:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756598188;
 bh=HcA7hQOCanekiWRbytTisPxE68CIh4YqbIk883mOrU0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c4wQYuTVeU6pZgntmAIEg+Ilxrkg83c7N6YNsJQXHIiFve1f6+ynSSNKTY+xkFLhU
 ikJhara5FWPaIbNvvqfYM4ZFCziBmigjIcinPmiH4cP0iz58jpXjHoTGVtnFNGVqOj
 UMRWRMVAzZu7BsiZ/6aM/RXPmDT/XatbZXvxZuw++N5mR96pjTazlg8Uvtds7e1MzM
 j5qDfK3zjFuEJuvHTJFgYZw6ZJERm31oTo+QHJ0GfdkRD+PJN7KSFOeg+oJfV7EjKc
 0aNEaiguPrB5vIlX+dyTzx92k8j8/7O77ty0Zs+tidUanbzvoL9Qhxrput143LZj5y
 3Xr4Xi2+lwJUg==
Date: Sat, 30 Aug 2025 23:56:27 +0000
To: Jonathan Corbet <corbet@lwn.net>
Message-ID: <aLOPq_zLap9PuMrW@google.com>
References: <20250820043432.22509-1-bagasdotme@gmail.com>
 <87qzwt3glo.fsf@trenco.lwn.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87qzwt3glo.fsf@trenco.lwn.net>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 08/29,
 Jonathan Corbet wrote: > Bagas Sanjaya <bagasdotme@gmail.com>
 writes: > > > Hi, > > > > Here are documentation formatting cleanup for f2fs.
 This also includes > > docs retitle at the end of [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1usVQw-0001jx-Vr
Subject: Re: [f2fs-dev] [PATCH 0/6] f2fs: documentation formatting cleanup
 and improvements
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Daeho Jeong <daehojeong@google.com>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Yangtao Li <frank.li@vivo.com>,
 Linux F2FS <linux-f2fs-devel@lists.sourceforge.net>,
 Bagas Sanjaya <bagasdotme@gmail.com>, Yuanye Ma <yuanye.ma20@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 08/29, Jonathan Corbet wrote:
> Bagas Sanjaya <bagasdotme@gmail.com> writes:
> 
> > Hi,
> >
> > Here are documentation formatting cleanup for f2fs. This also includes
> > docs retitle at the end of series ([6/6]) as a bonus.
> >
> > This series is based on docs-next tree.
> >
> > Enjoy!
> >
> > Bagas Sanjaya (6):
> >   Documentation: f2fs: Separate errors mode subtable
> >   Documentation: f2fs: Format compression level subtable
> >   Documentation: f2fs: Span write hint table section rows
> >   Documentation: f2fs: Wrap snippets in literal code blocks
> >   Documentation: f2fs: Indent compression_mode option list
> >   Documentation: f2fs: Reword title
> >
> >  Documentation/filesystems/f2fs.rst | 88 +++++++++++++++++-------------
> >  1 file changed, 50 insertions(+), 38 deletions(-)
> 
> Jaegeuk, are you going to pick this up, or would you like me to?

Hi, I applied them in the f2fs tree, if you don't mind.

> 
> Thanks,
> 
> jon


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
