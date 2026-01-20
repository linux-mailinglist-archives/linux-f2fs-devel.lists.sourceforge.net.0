Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6i0oCc68b2lHMQAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Jan 2026 18:35:10 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1192148A6D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Jan 2026 18:35:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i58JDAIcytP2ovNLveEioydBBBWA0W6YBxI5jw+cRr4=; b=AXSw2sFmma6WEBSrR5JlAQNh1R
	YrzJUo9qbHcZ0uUgSKuhikXc+q044ajtEUElo42fEhYafIMnrqefhj4g/KTDHzPjuJP3OsSjAToSK
	jU2bHVIC4oTszqF8PhHJRE6HgkD98N88awHCJo9osBKLLq5t3KgsxJdFkjSr2V0sZpig=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1viFdB-0004FA-8v;
	Tue, 20 Jan 2026 17:35:05 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1viFd8-0004F2-0U
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Jan 2026 17:35:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T5+OgGNESOZ98wD5pyDmlohk2HMyO4spM9Bc7EI52Zk=; b=VAIz5PQcxS00JjJiAiust/6kbk
 5dhcjvUJuvMgQUFX2dydFz7IfacI+B/nZeis1st3MRJtZd9PkushcHO/hRsvxMSd/veZRMAl4bm8r
 w/pZ/hjFDpDeoRHp/u/nGEZ+4lezdG5vAuYfRFlxDkkuWa6xWJ1c/6TKKQUL0Lnhaigc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=T5+OgGNESOZ98wD5pyDmlohk2HMyO4spM9Bc7EI52Zk=; b=SgTaExY+IoceAMwUuVCY8UWKaM
 NsLy8866GnICvIRH8piyd1UMNxASUbtQySnfWXVx+PW4h1POQd2iNmQibBH2vg/8jbnCCnfbmln7q
 4docoAQQq4Vk1Vl0sXDt7C4QwBdq522OTr0YrvODQlnKD7TpNjR4I+P32oEfvFrN1gr0=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1viFd6-0001zT-Ql for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Jan 2026 17:35:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2C2D7600CB;
 Tue, 20 Jan 2026 17:34:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA559C19421;
 Tue, 20 Jan 2026 17:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768930489;
 bh=bbwKwfsUkmuvOMgOcdbOJxj3wN5bi2yJZMEPDyyRAmk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oNwjuBdMDLfek3/xIfvCw2Cg7Igj3Yx+mB7nJya6q5iHS+aEveDCYOpcpIXMHJVHK
 VikR47aGfhbX4f8sXZN781IN6Tnv6H6+NrFAeRqI9eYH7dC/T6zqDKaX99VASDB7NQ
 hYdK2YP1hL7PpEL0dc6J3+Vbg7qJK/PhxRvT0LlNYSnZ3yGcXdu4qqN69FHgjr1xR8
 WhRvVWarLotZ+67tOStY2TysV7KIJ5HB9sNtt6pvrE5xNQ1E1VZsmmd9Ccj1uGiogm
 aCjjn3sQDEIIYBt59WkxoUxhJcd4sNgNX1xxIYKMLWJBoVCXjJrGGORZiHCczGf23V
 f+O6KVgEi7Peg==
Date: Tue, 20 Jan 2026 09:34:49 -0800
To: Andrey Albershteyn <aalbersh@redhat.com>
Message-ID: <20260120173449.GT15551@frogsfrogsfrogs>
References: <op5poqkjoachiv2qfwizunoeg7h6w5x2rxdvbs4vhryr3aywbt@cul2yevayijl>
 <aWci_1Uu5XndYNkG@casper.infradead.org>
 <20260114061536.GG15551@frogsfrogsfrogs>
 <5z5r6jizgxqz5axvzwbdmtkadehgdf7semqy2oxsfytmzzu6ik@zfvhexcp3fz2>
 <6r24wj3o3gctl3vz4n3tdrfjx5ftkybdjmmye2hejdcdl6qseh@c2yvpd5d4ocf>
 <20260119063349.GA643@lst.de> <20260119193242.GB13800@sol>
 <20260119195816.GA15583@frogsfrogsfrogs>
 <20260120073218.GA6757@lst.de>
 <5tse47xskuaofuworccgwhyftyymx5xj3mc6opwz7nfxa225u6@uvbk4gc2rktd>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5tse47xskuaofuworccgwhyftyymx5xj3mc6opwz7nfxa225u6@uvbk4gc2rktd>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Jan 20, 2026 at 12:44:19PM +0100, Andrey Albershteyn
 wrote: > On 2026-01-20 08:32:18, Christoph Hellwig wrote: > > On Mon, Jan
 19, 2026 at 11:58:16AM -0800, Darrick J. Wong wrote: > > > > > a) [...] 
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
X-Headers-End: 1viFd6-0001zT-Ql
Subject: Re: [f2fs-dev] fsverity metadata offset,
 was: Re: [PATCH v2 0/23] fs-verity support for XFS with post EOF
 merkle tree
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
Cc: fsverity@lists.linux.dev, linux-xfs@vger.kernel.org, aalbersh@kernel.org,
 david@fromorbit.com, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 jaegeuk@kernel.org, linux-fsdevel@vger.kernel.org, tytso@mit.edu,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:aalbersh@redhat.com,m:fsverity@lists.linux.dev,m:linux-xfs@vger.kernel.org,m:aalbersh@kernel.org,m:david@fromorbit.com,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:ebiggers@kernel.org,m:jaegeuk@kernel.org,m:linux-fsdevel@vger.kernel.org,m:tytso@mit.edu,m:linux-ext4@vger.kernel.org,m:hch@lst.de,s:lists@lfdr.de];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[djwong@kernel.org]
X-Rspamd-Queue-Id: 1192148A6D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 12:44:19PM +0100, Andrey Albershteyn wrote:
> On 2026-01-20 08:32:18, Christoph Hellwig wrote:
> > On Mon, Jan 19, 2026 at 11:58:16AM -0800, Darrick J. Wong wrote:
> > > > >  a) not all architectures are reasonable.  As Darrick pointed out
> > > > >     hexagon seems to support page size up to 1MiB.  While I don't know
> > > > >     if they exist in real life, powerpc supports up to 256kiB pages,
> > > > >     and I know they are used for real in various embedded settings
> > > 
> > > They *did* way back in the day, I worked with some seekrit PPC440s early
> > > in my career.  I don't know that any of them still exist, but the code
> > > is still there...
> > 
> > Sorry, I meant I don't really know how real the hexagon large page
> > sizes are.  I know about the ppcs one personally, too.
> > 
> > > > If we do need to fix this, there are a couple things we could consider
> > > > doing without changing the on-disk format in ext4 or f2fs: putting the
> > > > data in the page cache at a different offset than it exists on-disk, or
> > > > using "small" pages for EOF specifically.
> > > 
> > > I'd leave the ondisk offset as-is, but change the pagecache offset to
> > > roundup(i_size_read(), mapping_max_folio_size_supported()) just to keep
> > > file data and fsverity metadata completely separate.
> > 
> > Can we find a way to do that in common code and make ext4 and f2fs do
> > the same?
> 
> hmm I don't see what else we could do except providing common offset
> and then use it to map blocks
> 
> loff_t fsverity_metadata_offset(struct inode *inode)
> {
> 	return roundup(i_size_read(), mapping_max_folio_size_supported());
> }

Yeah, that's probably the best we can do.  Please add a comment to that
helper to state explicitly that this is the *incore* file offset of the
merkle tree if the filesystem decides to cache it in the pagecache.

--D

> -- 
> - Andrey
> 
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
