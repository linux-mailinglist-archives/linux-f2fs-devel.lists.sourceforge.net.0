Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8CBB0092A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Jul 2025 18:50:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UVDRfT46pjLP42sRW9MznEpxCUm+FeT1ZfXWIWdKQoA=; b=ECN8xTjRQTzUgsSsf2g5DOFBY0
	Y8e6UwuClyYLXFML2YP66eq7uGMcNMhsSsBYAlwPFmgr8q0q3vwSgDN4EMvfktZKcnqYa+Kf/TBni
	msdIDkACC5lRHamNNzRw9ZdGozT01EUP4dPEZYVVPT3ejnSg07a9iAhuVWvpD0mdFX3s=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZuTH-00080x-1J;
	Thu, 10 Jul 2025 16:50:07 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1uZuTG-00080q-5o
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Jul 2025 16:50:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jR8sS8X8Sh2JMQaJ5/3digIcAxR206qDBBPlp3bf1/g=; b=cycQl2EUK2H9jhguQniqfydr8/
 YGcQEJ+cM16UMQWFKSXFiNXF+S97saAf/IXR+F2BI0P+W9uVvB3JiCpjdhjDCp+0EWWLd9ZFpZQ+c
 mv+J5IsOQpZz81f0r6i5aE+g9q7hC9LBjrjZcu5WTgSKiRRRmgFGlawW9GegBR5Z3kRA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jR8sS8X8Sh2JMQaJ5/3digIcAxR206qDBBPlp3bf1/g=; b=Wev+732APv++fkCtw1nSynoclm
 gLkpPd3Y8P8uLlxJc4doYXs8hI2+hNa0Y6OGwrpDo9rKACEHHNglQTCL9CpRKPpahndegoLPf1HoI
 d9abTCH0+cDdNv9lvzylZ1GExSYhg0TxRbOZJbV3uz6ZrNlTKQsC68dyLzAci62WX1e8=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZuTF-0000Dm-Nu for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Jul 2025 16:50:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 62F9E45662;
 Thu, 10 Jul 2025 16:50:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07A2AC4CEE3;
 Thu, 10 Jul 2025 16:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752166200;
 bh=JVj9M6MgpqewVBEwA0OP1aljQ7ZGI8h2W8JgEbZoNUg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q5eAFo5p5SaWk1oMn2iYC8SqySF+GQXtvYVhHxV4aJ9WNAiGBYQQiaWY7NInL//2/
 jOwdCz9zZuC6ikRdusvNsJALjpoBJt2Pm30YEa7gbu9NkfbDu0ZlPwKcwEwkbA7+V2
 SYI7R8AN9FZdu71dLc7eyEk7v3VxgPJ/HmduCDr19Gj+ATWeuopBCXv7/QaIFmwNdH
 EgL5QQDb6qnY2W5/LkZNgJVoLpa+CTgo1HFEEQ7EydpJUelVN2hQlB6UcGes0PQk8m
 gK/0IUeAm25EBVhM++Vp2/HQOQJN5Hx/Cl9/S/CqOlPdyRPAaA++M0ggMTmKSAyoEM
 BH/X6zhJZwmZg==
Date: Thu, 10 Jul 2025 16:49:58 +0000
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <aG_vNmvrnLGVCXzj@google.com>
References: <202507101412.50ND2WEX-lkp@intel.com>
 <aG_Gr8NvCiXC4SyU@casper.infradead.org>
 <aG_NntbzliX0WUGB@google.com>
 <aG_ZQYONhf9UQJDq@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aG_ZQYONhf9UQJDq@casper.infradead.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 07/10, Matthew Wilcox wrote: > On Thu, Jul 10, 2025 at
 02:26:38PM +0000, Jaegeuk Kim wrote: > > On 07/10, Matthew Wilcox wrote: >
 > > On Thu, Jul 10, 2025 at 03:17:28PM +0800, kernel test robot wro [...]
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
X-Headers-End: 1uZuTF-0000Dm-Nu
Subject: Re: [f2fs-dev] [jaegeuk-f2fs:dev-test 65/93] fs/f2fs/data.c:58:56:
 error: passing 'const struct folio *' to parameter of type 'struct folio *'
 discards qualifiers
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
Cc: llvm@lists.linux.dev, linux-f2fs-devel@lists.sourceforge.net,
 kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 07/10, Matthew Wilcox wrote:
> On Thu, Jul 10, 2025 at 02:26:38PM +0000, Jaegeuk Kim wrote:
> > On 07/10, Matthew Wilcox wrote:
> > > On Thu, Jul 10, 2025 at 03:17:28PM +0800, kernel test robot wrote:
> > > > >> fs/f2fs/data.c:58:56: error: passing 'const struct folio *' to parameter of type 'struct folio *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
> > > >       58 |                 return folio_test_f2fs_gcing(fscrypt_pagecache_folio(folio));
> > > >          |                                                                      ^~~~~
> > > >    include/linux/fscrypt.h:527:67: note: passing argument to parameter 'bounce_folio' here
> > > >      527 | static inline struct folio *fscrypt_pagecache_folio(struct folio *bounce_folio)
> > > 
> > > Ah; I changed only one of the definitions of fscrypt_pagecache_folio.
> > > 
> > > Jaegeuk, can you fold in this fix?
> > 
> > Will this break ext4?
> > 
> > In ext4,
> > 		struct folio *folio = fi.folio;
> > 		...
> > 
> > 		if (fscrypt_is_bounce_folio(folio)) {
> > 			io_folio = folio;
> > 			folio = fscrypt_pagecache_folio(folio);
> > 		}
> 
> No, you can pass a mutable folio to a function which takes a const
> folio.  Just not the other way around.

Ah, I found it. Applied the above missing change.

https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=dev-test&id=70e71e8a0099d27857fdb9178187e72513d72141


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
