Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CII9M2oRgWnmDwMAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Feb 2026 22:04:42 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C0DD1709
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Feb 2026 22:04:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YPvP8yGbO2hoc65TAaFCKhfYCqsnBhRVzdxW8o8vhbg=; b=eZ/1J4jbycv09WdJRvgkF2ER3k
	2K4g8BGB72iSnSi5NMhwvFGuSMhrwPfNwBjFJIqZJlj5Mk0bWHuKRGPZPkma/tqLJ9OYuwkcDYdXj
	nUUxr8mDi8+wwPmpuc4BYtLqJz+Cfp2xirLxiDNMs1k4nmxVApZNrcRmbKlmQTsKi194=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vn15s-00038j-IA;
	Mon, 02 Feb 2026 21:04:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1vn15r-00038d-HG
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Feb 2026 21:04:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PBcL48l4p0jVU22zlz8h0CmSJlzg8wNOT5+P559Vc8E=; b=OSKCzt7hCBYeMZb2Ek8X8Our7h
 d5yDjJNKosdd+9B7U1i7vkeTKv//sosLVtcSd4hEX7H7z4aj6l/I1VXNvYd3jRVXpso/b60uAuxAd
 nusw7tOqNXnvYkQMezYF1sHqwOxIlcZKIrmGk53Bn7esdE+z/K4+iuY6h8AkXFTbvSg4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PBcL48l4p0jVU22zlz8h0CmSJlzg8wNOT5+P559Vc8E=; b=FfueP/kbK8Sxo1mRFG9RnM4PBp
 8fU0xwA4koEaia603EPdz7xefOktTsfAUQKAr7IZSO3FICQwhAX2RMGZ2NhtGZzuAwDgFSSvryw30
 D7kOlwJk1F8Yx+2eUsvfPcfng6vq7GkiyVqUv2AXCkfL0qCXdp7MmtohsYd9rI6erinw=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vn15q-0004oV-A2 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Feb 2026 21:04:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A3209600B0;
 Mon,  2 Feb 2026 21:04:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A01EFC116C6;
 Mon,  2 Feb 2026 21:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770066256;
 bh=XRzlzAwIzrWwQQCJu0yYDI/QY/MD+z952CyEosMvgJ4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=akopJkb3IJUb0UY+zPkONhlRaYXvL+MBanv8EvQ06eGrkuDIIuCdgXqTMQwBLD923
 rovYpMsNDFP0Hy2s/XpuQC0hETgCjQM8VsLjBGubzj9cmy3x7SAavwwSswydbABffE
 nQgDK2NgJceLQRNmpX/wCLHbRRbnQMpKSd0k+xQOsDXFGBRvwxepCTL98xtrMKKtmD
 xRObm8348BVZvMzN/0zXNq712b9oUL2DK9aAFWEg1IGYpqY3dcYQ1ESkgRqJKW/r+f
 WEN9bmXfY4GVeFGziTXeBgEov43XNehyJMtQXXHS8H231V4Iha289/VQoJHffUNblu
 KFkHwgDfhwarQ==
Date: Mon, 2 Feb 2026 13:04:13 -0800
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20260202210413.GA4838@quark>
References: <20260202060754.270269-1-hch@lst.de>
 <20260202060754.270269-3-hch@lst.de>
 <aYC-set6OAK9F9GE@casper.infradead.org>
 <20260202151755.GA22756@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260202151755.GA22756@lst.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Feb 02, 2026 at 04:17:55PM +0100, Christoph Hellwig
 wrote: > On Mon, Feb 02, 2026 at 03:11:45PM +0000, Matthew Wilcox wrote:
 > > On Mon, Feb 02, 2026 at 07:06:31AM +0100, Christoph Hellwig wro [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vn15q-0004oV-A2
Subject: Re: [f2fs-dev] [PATCH 02/11] readahead: push invalidate_lock out of
 page_cache_ra_unbounded
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
Cc: fsverity@lists.linux.dev, Christian Brauner <brauner@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, Andrey Albershteyn <aalbersh@redhat.com>,
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 Jaegeuk Kim <jaegeuk@kernel.org>, David Sterba <dsterba@suse.com>,
 Jan Kara <jack@suse.cz>, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-7.71 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:fsverity@lists.linux.dev,m:brauner@kernel.org,m:tytso@mit.edu,m:aalbersh@redhat.com,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fsdevel@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:jaegeuk@kernel.org,m:dsterba@suse.com,m:jack@suse.cz,m:linux-ext4@vger.kernel.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCPT_COUNT_TWELVE(0.00)[14];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[ebiggers@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns]
X-Rspamd-Queue-Id: 02C0DD1709
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 04:17:55PM +0100, Christoph Hellwig wrote:
> On Mon, Feb 02, 2026 at 03:11:45PM +0000, Matthew Wilcox wrote:
> > On Mon, Feb 02, 2026 at 07:06:31AM +0100, Christoph Hellwig wrote:
> > > +++ b/fs/f2fs/file.c
> > > @@ -4418,7 +4418,9 @@ static int redirty_blocks(struct inode *inode, pgoff_t page_idx, int len)
> > >  	pgoff_t redirty_idx = page_idx;
> > >  	int page_len = 0, ret = 0;
> > >  
> > > +	filemap_invalidate_lock_shared(mapping);
> > >  	page_cache_ra_unbounded(&ractl, len, 0);
> > > +	filemap_invalidate_unlock_shared(mapping);
> > 
> > Why is f2fs calling page_cache_ra_unbounded() here?
> 
> From tracing the callers is seems to be able to be called from the
> garbage collector, which might have to move fsverity files.  Not sure if
> that was the reason or is incidental.
> 
> (using the pagecache for GC is generally a very bad idea, and there is
> at least one academic paper showing it is a huge performance problem in
> f2fs, and my initial attempts at using the pagecache for GC in zoned XFS
> also showed horrible results)
> 
> > >  	unsigned int nofs = memalloc_nofs_save();
> > >  
> > > +	lockdep_assert_held_read(&mapping->invalidate_lock);
> > 
> > Hm, why are we asserting that it's not write-locked?  For the
> > purposes of this function, I'd think we want to just
> > lockdep_assert_held()?
> 
> Fine with me.
> 
> > In the tree I'm looking at, there are also calls to
> > page_cache_ra_unbounded() in fs/ext4/verity.c and fs/f2fs/verity.c
> > which probably need the lock taken too?
> 
> I consolidated those into the single call in fs/verity/pagecache.c
> in the previous iteration of this series, and Eric merged the
> first few patches including that one into the fsverity tree.

I changed both instances of lockdep_assert_held_read() to
lockdep_assert_held() when applying.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
