Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPRxMr4MxGk+vgQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Mar 2026 17:26:38 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DE821328F51
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Mar 2026 17:26:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aqmu2Yu+gw+T8SVqvQSM91CvNBBJ2qNoLcx2SFP1R2c=; b=Vjubdqa51r1JEalMEWC6KFHoH+
	J0MiGtPIO57979VmRjVRPDr2EjE8mbAoVQuI8loGMmwkTAB81qkQjXHJaCzl8wTA8uysBdsG6dV8J
	1L0unS5fG0hLX+1EVfZKhEsZWJpOFYeUYalwIyJbe0iwaRXuflqeumQ+2vvphT04hx0w=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w5R3t-0004vh-Lq;
	Wed, 25 Mar 2026 16:26:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1w5R3b-0004vE-9e
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Mar 2026 16:26:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rewysob7eA3CIB8fZ4Q2j5ub7wvmIkwsByKo0KjdZgM=; b=M16+bBT2A7blD0WC1LGWUG3wyh
 gIDbVUDYjSa8U97f/9+m1h45/dQOCRLHbVM4qNhaJzxfrjYtqm3Gb5EBgft5opgbEODYpGsJwvCfz
 2cJcRnubYZ3i+wooN+8BHyqddwyc+odkqPhNMI4+rQsOeDMMoJ8zPFyuDWy85zfINInw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rewysob7eA3CIB8fZ4Q2j5ub7wvmIkwsByKo0KjdZgM=; b=dK/hmDtAXH58HgEurlvmorxng5
 YKwot/2O2qZFk7RwV1qKZIHpwjUcSRCm0y3bv5AoNCEIzDHYpig3prCR8n++pIL4vTxNpzRy4nuBJ
 fwKJMJPZGKfi+Qfuz/j1IjTZOyCDIZ9NDHHuTZyZDgMFS/F70IxMcjYbHmjOsQdtj0hU=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w5R3a-0005sx-9h for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Mar 2026 16:26:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9DE7C600AC;
 Wed, 25 Mar 2026 16:26:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44ED5C4CEF7;
 Wed, 25 Mar 2026 16:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1774455964;
 bh=D1i5YPn3nepsXs93Y3yzjR5xi7srB1NJEGzhg5tNUh8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=H451FRpvxj6W/wUJepeJeqwD2HaLpYiOjcnAFQFLYd1zrf0tNxBCMYib/8sbgTnDl
 E9XUS9V2npYvDxkZZS6wzjIebTHBCFot6rljh7KiordjLkgymLg4Su5kHgItNO7aDw
 Mq+00OcZ5O9/oSXtH8GJeoRn5w26Yi67/PA75L1n1aedt/eCRnhwN1P7eOTPTbzUHv
 AhFtsLlxuOyxOpQkogHPmr6WejMj9icfWk7dvcHA5nuwykYzarrJPhz8yrZWyFU6uA
 JFRvSYFRKLnZZh1kx0utkkrbkptYIooI1udWvhMIXFVpEr92XBC84YrjaLmUDESEKj
 njVh1bSJYvbXw==
Date: Wed, 25 Mar 2026 09:26:03 -0700
To: Andrey Albershteyn <aalbersh@redhat.com>
Message-ID: <20260325162603.GV6223@frogsfrogsfrogs>
References: <20260319170231.1455553-1-aalbersh@kernel.org>
 <20260319170231.1455553-8-aalbersh@kernel.org>
 <20260325080021.GF952@lst.de>
 <std5dib2mf5nfd2gf3jbrhujvqr2tytczplopwfy4zrxrrmrgj@py7g4alrifbi>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <std5dib2mf5nfd2gf3jbrhujvqr2tytczplopwfy4zrxrrmrgj@py7g4alrifbi>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Mar 25, 2026 at 01:38:07PM +0100, Andrey Albershteyn
 wrote: > On 2026-03-25 09:00:21, Christoph Hellwig wrote: > > > @@ -353,9
 +353,16 @@ static inline bool iomap_block_needs_zeroing(const str [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1w5R3a-0005sx-9h
Subject: Re: [f2fs-dev] [PATCH v5 07/25] iomap: introduce IOMAP_F_FSVERITY
 and teach writeback to handle fsverity
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
From: "Darrick J. Wong via Linux-f2fs-devel"
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: "Darrick J. Wong" <djwong@kernel.org>
Cc: fsverity@lists.linux.dev, ebiggers@kernel.org,
 Andrey Albershteyn <aalbersh@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:aalbersh@redhat.com,m:fsverity@lists.linux.dev,m:ebiggers@kernel.org,m:aalbersh@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[djwong@kernel.org]
X-Rspamd-Queue-Id: DE821328F51
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 25, 2026 at 01:38:07PM +0100, Andrey Albershteyn wrote:
> On 2026-03-25 09:00:21, Christoph Hellwig wrote:
> > > @@ -353,9 +353,16 @@ static inline bool iomap_block_needs_zeroing(const struct iomap_iter *iter,
> > >  {
> > >  	const struct iomap *srcmap = iomap_iter_srcmap(iter);
> > >  
> > > -	return srcmap->type != IOMAP_MAPPED ||
> > > -		(srcmap->flags & IOMAP_F_NEW) ||
> > > -		pos >= i_size_read(iter->inode);
> > > +	if (srcmap->type != IOMAP_MAPPED)
> > > +		return true;
> > > +
> > > +	if (srcmap->flags & IOMAP_F_NEW)
> > > +		return true;
> > > +
> > > +	if (srcmap->flags & IOMAP_F_FSVERITY)
> > > +		return false;
> > > +
> > > +	return pos >= i_size_read(iter->inode);
> > 
> > This might be a good time to document the various reasons for needing
> > zeroing.
> 
> something like this?
> 
> --- a/fs/iomap/buffered-io.c
> +++ b/fs/iomap/buffered-io.c
> @@ -344,9 +344,27 @@ static inline bool iomap_block_needs_zeroing(const struct iomap_iter *iter,
>  {
>         const struct iomap *srcmap = iomap_iter_srcmap(iter);
>  
> -       return srcmap->type != IOMAP_MAPPED ||
> -               (srcmap->flags & IOMAP_F_NEW) ||
> -               pos >= i_size_read(iter->inode);
> +       /*
> +        * If this block is not mapped, we don't have any backing blocks to read
> +        * yet

	/* If this block has not been written, there's nothing to read */

> +        */
> +       if (srcmap->type != IOMAP_MAPPED)
> +               return true;
> +
> +       /*
> +        * This block just got allocated and does not contain any meaningful data
> +        */

	/* Newly allocated blocks have not been written */

Otherwise looks good to me.

--D

> +       if (srcmap->flags & IOMAP_F_NEW)
> +               return true;
> +
> +       /*
> +        * fsverity metadata is stored past i_size, we need to read it instead of
> +        * zeroing
> +        */
> +       if (srcmap->flags & IOMAP_F_FSVERITY)
> +               return false;
> +
> +       return pos >= i_size_read(iter->inode);
>  }
> 
> > 
> > > +/*
> > > + * IO happens beyond inode EOF, fsverity metadata is stored there
> > > + */
> > > +#define IOMAP_F_FSVERITY	(1U << 10)
> > 
> > This comment feels a bit too sparse.  Here is my interpretation of what
> > this flag does:
> > 
> > /*
> >  * Indicates reads and writes of fsverity metadata.
> >  *
> >  * Fsverity metadata is stored after the regular file data and thus beyond
> >  * i_size.
> >  */
> 
> Thanks! I will update it
> 
> -- 
> - Andrey
> 
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
