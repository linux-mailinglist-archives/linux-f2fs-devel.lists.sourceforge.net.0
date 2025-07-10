Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 30121B0063C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Jul 2025 17:16:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oyHzHyBxekFhcrunfYUuKSLLMFc0zZZZbKNdYAU4yrQ=; b=d4pXAodhVcs55Ad7j3URSA6KZp
	S2VMgHXYrZAoPHGcXj8HZ3Bp2U66hf+jewSe8HcK69cT4kqoffmd9X+zEBhz/i/um0IwAciW1X2P3
	2xubTHbFNjvrcPc+ZnYgPpEjMA8+KnONGMlk4DlJUSPkeLI0BmUtbmJN5KnI9fRp6DUw=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZt0j-0006wY-Od;
	Thu, 10 Jul 2025 15:16:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1uZt0g-0006wO-D6
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Jul 2025 15:16:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dCyye3w36JnUFiPIq95/oWrAw2cPUnmqpcC331RPtaI=; b=evNyqNxooPN6v9icj7eyjc7mYF
 hsbPw6JOEcp/E90vijuQ+xt8x5NBxlpJHtVqmawsaz5tfIHMMPqbOKqlf3NQXSQbydswQxjH2oNpY
 6wJa0mCuViTzh8DpJQPWqLbjThEKSdqXsN74juyAJwLm2FNJbIvOx0lb/IjcOuLj+64w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dCyye3w36JnUFiPIq95/oWrAw2cPUnmqpcC331RPtaI=; b=P6ElXu7ZD/v54s34Eafe/6dmRI
 bev7PIteSYKSo34jsVmmNgE3gTDqSGNO+CCeR38NJEvD8H3/Ycv85xRuTAvqmj9aZnwsVhT2adWQa
 X7gaXECHctQ7fA8gSisdOExnYWuLyGWmeIYSSGGS4kNNPHMuD4ggNrx4Ryof7CikIaJo=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZt0g-0002f8-37 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Jul 2025 15:16:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=dCyye3w36JnUFiPIq95/oWrAw2cPUnmqpcC331RPtaI=; b=bKn1V6oq8IRD2nhci8CIPiHFMX
 G11Y0urNFT3GBPLjgs0IEKnFVv2GNn0v39ayvH371pC3fRAR/9cUFvJkg5+bpXFWcJrGjcfS9R3zU
 jcBrQPxgBtnPImqTQAZUqgq3rZHeZWA310FXAJPTlq2qdyibN9RSHPxZl97QXsi0pO8oIMlXx43B0
 XCOT5O+dEvMMJ9j0pN5vl6TTslHLLFG+r0cpvJzyptrXhlFDZXo7HJqr7QwTuXFD/B0afnknpVmQi
 tdQzAM41NyNzncADRjh/PUGMjdmaEdXr0XqF0ubiXPUWtYVQpRb2lEVp0OXYIlY4DqPMPGhqVL2r8
 haf4u0UA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uZt0T-00000009N9c-1d6B;
 Thu, 10 Jul 2025 15:16:17 +0000
Date: Thu, 10 Jul 2025 16:16:17 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <aG_ZQYONhf9UQJDq@casper.infradead.org>
References: <202507101412.50ND2WEX-lkp@intel.com>
 <aG_Gr8NvCiXC4SyU@casper.infradead.org>
 <aG_NntbzliX0WUGB@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aG_NntbzliX0WUGB@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jul 10, 2025 at 02:26:38PM +0000, Jaegeuk Kim wrote:
 > On 07/10, Matthew Wilcox wrote: > > On Thu, Jul 10, 2025 at 03:17:28PM
 +0800, kernel test robot wrote: > > > >> fs/f2fs/data.c:58:56: err [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1uZt0g-0002f8-37
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
Cc: llvm@lists.linux.dev, linux-f2fs-devel@lists.sourceforge.net,
 kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jul 10, 2025 at 02:26:38PM +0000, Jaegeuk Kim wrote:
> On 07/10, Matthew Wilcox wrote:
> > On Thu, Jul 10, 2025 at 03:17:28PM +0800, kernel test robot wrote:
> > > >> fs/f2fs/data.c:58:56: error: passing 'const struct folio *' to parameter of type 'struct folio *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
> > >       58 |                 return folio_test_f2fs_gcing(fscrypt_pagecache_folio(folio));
> > >          |                                                                      ^~~~~
> > >    include/linux/fscrypt.h:527:67: note: passing argument to parameter 'bounce_folio' here
> > >      527 | static inline struct folio *fscrypt_pagecache_folio(struct folio *bounce_folio)
> > 
> > Ah; I changed only one of the definitions of fscrypt_pagecache_folio.
> > 
> > Jaegeuk, can you fold in this fix?
> 
> Will this break ext4?
> 
> In ext4,
> 		struct folio *folio = fi.folio;
> 		...
> 
> 		if (fscrypt_is_bounce_folio(folio)) {
> 			io_folio = folio;
> 			folio = fscrypt_pagecache_folio(folio);
> 		}

No, you can pass a mutable folio to a function which takes a const
folio.  Just not the other way around.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
