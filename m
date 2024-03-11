Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5815E87898D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 Mar 2024 21:37:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rjmOi-0000ID-2Z;
	Mon, 11 Mar 2024 20:37:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1rjmOg-0000Hv-9R
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 11 Mar 2024 20:37:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=E6KtBtO5D54TAizWr5liUPW0e0XxdxHYOo+otWMZ9+Q=; b=jrKhhu3v99LAh0r1QIeRtxF8Df
 l0yYaWtP/6OTCp/OFdioEreSDlkoa1Gbd32rIPyrYExzxLhhPP4N0CrsxWc/AzM812ocXj4dtJSCM
 W8OvFtWu6O48fSXGy+mfxe75T51RkIwuS3ulezMc+xItqtgj3NvMQJkvb8Cfu04IKrAk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=E6KtBtO5D54TAizWr5liUPW0e0XxdxHYOo+otWMZ9+Q=; b=lY9q6ADiz8E/zvhpj7dvIrRCF6
 BRqNJjb591Goik54dd8qVik+OYDwUBAfGwTc49IL414CVWDLOCxXawiTQKmSCGsKYwsYyP7Too/pc
 qbNdk5RX1LA6nMMNC5Y99osoeu3scMKepXhivRRjnW4MPI/DOS+UDtnE5xLmYhTXGKso=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rjmOW-0005dN-48 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 11 Mar 2024 20:37:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 64523CE1275;
 Mon, 11 Mar 2024 20:37:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64348C433C7;
 Mon, 11 Mar 2024 20:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710189425;
 bh=p40CMsQzYqWdqXPJqvX5xweH+iWvW3fcgjpwVX0YcIw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Yq0UvV+DnaMfrkFiCDvshg0uUt2WjDP33BK0WMWjsxDBQtXlhF2DOPrqfKz33Z2ou
 Cxqdb9NrOV8DmngHlfZ9QDLBQDcVnqrq1leODKsC7DGfiQ0uaTrQdogJonsKqgbgvm
 f6bnvI0PQrSmT1cSI9p7+X8OpKD+7SGMbIxVcc54jdR5mqUwOd8ou7GvDASZT2zoOM
 RvnHIk9btgd+yGGzSRMGGPjX5y0qQMra8eZbHhMOGYtCFKbm7wvN8EG3veEmgzxCR4
 xvK/HCQvIwb5pkj5wx0uzZ9hs+SveyEv31T4F7kV07omN11vQ15JrRS5dDqjFs1BRN
 t8+ArApkXZG9g==
Date: Mon, 11 Mar 2024 13:37:03 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: David Laight <David.Laight@aculab.com>
Message-ID: <Ze9rb0dRKt98kK54@google.com>
References: <20240305080943.6922-1-r.smirnov@omp.ru>
 <b4f9780714e243a6af9f77ab00593ec1@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b4f9780714e243a6af9f77ab00593ec1@AcuMS.aculab.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 03/10, David Laight wrote: > From: Roman Smirnov > > Sent:
 05 March 2024 08:10 > > > > Cast expression type to unsigned long in
 __count_extent_cache()
 > > to prevent integer overflow. > > > > Found [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rjmOW-0005dN-48
Subject: Re: [f2fs-dev] [PATCH] f2fs: Cast expression type to unsigned long
 in __count_extent_cache()
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
Cc: Sergey Shtylyov <s.shtylyov@omp.ru>,
 "lvc-project@linuxtesting.org" <lvc-project@linuxtesting.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Karina Yankevich <k.yankevich@omp.ru>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, 'Roman Smirnov' <r.smirnov@omp.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 03/10, David Laight wrote:
> From: Roman Smirnov
> > Sent: 05 March 2024 08:10
> > 
> > Cast expression type to unsigned long in __count_extent_cache()
> > to prevent integer overflow.
> > 
> > Found by Linux Verification Center (linuxtesting.org) with Svace.
> 
> Another broken analysis tool :-)
> 
> > Signed-off-by: Roman Smirnov <r.smirnov@omp.ru>
> > Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> > ---
> >  fs/f2fs/shrinker.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/fs/f2fs/shrinker.c b/fs/f2fs/shrinker.c
> > index 83d6fb97dcae..bb86a06c5d5e 100644
> > --- a/fs/f2fs/shrinker.c
> > +++ b/fs/f2fs/shrinker.c
> > @@ -33,7 +33,7 @@ static unsigned long __count_extent_cache(struct f2fs_sb_info *sbi,
> >  {
> >  	struct extent_tree_info *eti = &sbi->extent_tree[type];
> > 
> > -	return atomic_read(&eti->total_zombie_tree) +
> > +	return (unsigned long)atomic_read(&eti->total_zombie_tree) +
> >  				atomic_read(&eti->total_ext_node);
> 
> Makes diddly-squit difference.
> 
> Both total_zombie_tree and totat_ext_node are 'int'.
> If they are large enough that their sum wraps then the values
> can individually wrap (to negative values).
> 
> You really don't want to cast 'int' to 'unsigned long' here
> at all - implicitly or explicitly.
> The cast will first promote 'int' to 'signed long'.
> So a negative value will get sign extended to a very big value.

I thought, since total_zombie_tree won't get overflowed theoritically, the first
cast to (unsigned long) could expand the space to cover the following
total_ext_node.

> 
> The best you can hope for is a 33bit result from wrapped 32bit
> signed counters.
> To get that you need to convert 'int' => 'unsigned int' => 'unsigned long'.
> One way would be:
> 	return (atomic_read(&eti->total_zombie_tree) + 0u + 0ul) +
> 		(atomic_read(&eti->total_ext_node) + 0u);
> 
> Although changing the return type to 'unsigned int' would probably
> be better.
> I don't know what the values are, but if they are stats counters
> then that would give a value that nicely wraps at 2^32 rather
> that the strange wrap that the sum of two wrapping 32bit counters
> has.
> 
> OTOH it may be that they are counts - and just can't get any where
> near that big.
> 
> 	David
> 
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
