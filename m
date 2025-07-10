Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 46305B00531
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Jul 2025 16:26:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fyUOGmdyoiY7C1oaH2KbPn/uzrbGYVEmmTwDNP2KYFQ=; b=R8ngtrmYjPaiwUfLEZoVcAd//i
	PAwOX0fECikboeIQbtqm76eHBAmt+bda/3Vt2fo/FsaTVD91xRmz18zpmeLjNRWIT8fnrqx5kSifV
	VdymSywd8LXYccczT+VRE5HYnN1pT9T8RiXiObkZQe2lp7inNtIz3FR2pq6oTtsMGJS8=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZsEa-0005sZ-Lw;
	Thu, 10 Jul 2025 14:26:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1uZsEZ-0005sR-2V
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Jul 2025 14:26:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0XXQ0CyvwzUphx5QxTNvf//JvGRg/TNzMExJiYovkYA=; b=aepi2VRysWsmwzgnTJiY6gBYcX
 ajVVShB/yPomxoNuBNCUc9B/XwkR8g/tTnJGExgczN+8NkOWs7HhC/pnYgSeUnfxc9BXdP93ZCCKQ
 vAWt+5x4BlcXg7JF6445A6sINXTS6RzTkwV2KVSsrMAi+yYxCHuqbSIghwxLgIhS6dvM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0XXQ0CyvwzUphx5QxTNvf//JvGRg/TNzMExJiYovkYA=; b=KkT+0PLhrkTHH+DweiqhmphN3f
 cSJRMmBqT3RcKNQaehX/VndNbEzpqWZegc6KfeThhlVD1RFUmHdJYDDqvVEbXp6PaPUreao+Y6OI+
 Z4sDMEhLejqdZ4dg8JWIs2Syh3UkLYVl/HCactYC5f90eDKSOwYQSjM54IklKIdIhp9s=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZsEX-0000HT-ST for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Jul 2025 14:26:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7C1905C4C9F;
 Thu, 10 Jul 2025 14:26:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF374C4CEE3;
 Thu, 10 Jul 2025 14:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752157600;
 bh=y7y/n/lbP5p1Mhyo9ICE4LSsULATO697OeoGKbocUjw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Lsuph2be6bg2CFbf17Rfua5VksJBwoAzCeLeQ1M+JRZHzOGlYLjNUcL2DuORoCAdU
 Xw0SVuenvn865tAx4xupjM282/sd8HiyWbG5mViQbmtjgSpm+vC85LZfbMYsVyYIG8
 3EwrFdDlakeamY21LaV+8/MxeR6vnBLhWoxDE0c7K7sgG4lXZFn/6HHSsiH6l9XrcS
 sius+4vVDqlRFtiknj2wJSG6MR0Tqttot7pJOg8zvxc3rzhaR0Jt5gJiyjZP1m0mLC
 mEMWSRK1DGf98OYRVqXDPY4dL8cbn+9gcAbKJfz5WwLJaDNYZBaRIOpCeZGkRxReHw
 nfvicmcvcrCaA==
Date: Thu, 10 Jul 2025 14:26:38 +0000
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <aG_NntbzliX0WUGB@google.com>
References: <202507101412.50ND2WEX-lkp@intel.com>
 <aG_Gr8NvCiXC4SyU@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aG_Gr8NvCiXC4SyU@casper.infradead.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 07/10, Matthew Wilcox wrote: > On Thu, Jul 10, 2025 at
 03:17:28PM +0800, kernel test robot wrote: > > >> fs/f2fs/data.c:58:56: error:
 passing 'const struct folio *' to parameter of type 'struct fol [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uZsEX-0000HT-ST
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
> On Thu, Jul 10, 2025 at 03:17:28PM +0800, kernel test robot wrote:
> > >> fs/f2fs/data.c:58:56: error: passing 'const struct folio *' to parameter of type 'struct folio *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
> >       58 |                 return folio_test_f2fs_gcing(fscrypt_pagecache_folio(folio));
> >          |                                                                      ^~~~~
> >    include/linux/fscrypt.h:527:67: note: passing argument to parameter 'bounce_folio' here
> >      527 | static inline struct folio *fscrypt_pagecache_folio(struct folio *bounce_folio)
> 
> Ah; I changed only one of the definitions of fscrypt_pagecache_folio.
> 
> Jaegeuk, can you fold in this fix?

Will this break ext4?

In ext4,
		struct folio *folio = fi.folio;
		...

		if (fscrypt_is_bounce_folio(folio)) {
			io_folio = folio;
			folio = fscrypt_pagecache_folio(folio);
		}

> 
> diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
> index b334c0538864..8d9127a0fdb3 100644
> --- a/include/linux/fscrypt.h
> +++ b/include/linux/fscrypt.h
> @@ -524,7 +524,8 @@ static inline bool fscrypt_is_bounce_folio(const struct folio *folio)
>  	return false;
>  }
>  
> -static inline struct folio *fscrypt_pagecache_folio(struct folio *bounce_folio)
> +static inline
> +struct folio *fscrypt_pagecache_folio(const struct folio *bounce_folio)
>  {
>  	WARN_ON_ONCE(1);
>  	return ERR_PTR(-EINVAL);


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
