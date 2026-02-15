Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLXcEdZHkWk1hAEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 15 Feb 2026 05:13:10 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D52EF13DFC6
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 15 Feb 2026 05:13:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YlNGXi1mxVw6NS8nyBcBP4obQyyXbqjOwg5YC++YJEE=; b=gu+6toTjtT/fnNyh3KXr6gGyAT
	gQ8Hhhqng1XLy3zZJhTsy5S2bR9Ejn2DFM4WETBMRC4R4s+eHMb5Km7MgcCTQPOxYXx8fSXcRugRq
	axbxKYoX3N3UCe8/6lS1HaIHqwg4A50sgIaVLtLxlhW18yLmrR5jMBZKBxd1NdyhGe3o=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vrTVD-0000jA-GB;
	Sun, 15 Feb 2026 04:12:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1vrTUv-0000ip-Rt
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 15 Feb 2026 04:12:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rTQGK68ArTdHQkGuob0yRHqOEv6xGXwDZpTCEh/Lp2o=; b=XEydblI7/diAoy35qXG/LPYHn5
 fIVMffZSp6MMf/O99N6f6U+w/PaFQJI6Fjkt1jyhez/q+44CQfc2yLsX1DOsip+VQIzkkQ6igNbR/
 9WnGRIRk8WOxv2E6SSEthigkMIWJIQojoy1VPTNlHbHIYG+ztfG72bDJ/myESvg7249U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rTQGK68ArTdHQkGuob0yRHqOEv6xGXwDZpTCEh/Lp2o=; b=O8bMoYgD/+VqXZhdumMufJeuEl
 f9+H6u+iA8H/VkaGbR1aSQwsZ1TTCRHQWSjoxvphUBQnJ7Whcj9rf6728fas2GtOpCOgGch4IAfGH
 Ic9TNICP6C0ZRm/GphiUJ944wboUH3fYyidQz8pBnZOGWX/qc8eZZptfeduktu50Nh7o=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vrTUv-0007pZ-8Y for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 15 Feb 2026 04:12:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4E1EA6001D;
 Sun, 15 Feb 2026 04:12:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CE5CC4CEF7;
 Sun, 15 Feb 2026 04:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771128749;
 bh=telMDwDPYXHk0p8H0dvNwmjCHle76BNL6efnVxd1yE0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Em1nwyyZfplfO493edWfqF6KMKAJDtrqRdpWxquXEZ8GiawBrZxK2D8RWa5ZPgdUC
 rvFJOAF4YgbgWv6UWhU+BAKq0WLlcoZM5XlBjipTi5dmnnT2QCRGWNRD4iedkINvsa
 Ndcc6UKHw9lQgFXtdUj5oQi7cqhiXoIbNROHkdU6skhV4NIYAooQXHQnX9Su7Xp2i8
 3jf3yI5ItLVXjqjZaUlVHW7SGTn6HNsKnrsKZ7P2nzOGdCbRo5aJ5UX2hBVFKu4bld
 2fHdbxaX+/W/E2MNsKr8DgGikX5pmQM5tH5GrP3yV18hrcXp444KOj2/O4dsD+sfd+
 q8app8lKVU8/A==
Date: Sat, 14 Feb 2026 20:11:44 -0800
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20260215041144.GA2872@sol>
References: <20260214211830.15437-1-ebiggers@kernel.org>
 <20260214211830.15437-2-ebiggers@kernel.org>
 <20260214215008.GA15997@quark>
 <aZE_rKsOAgYqTjZ_@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aZE_rKsOAgYqTjZ_@casper.infradead.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sun, Feb 15, 2026 at 03:38:20AM +0000,
 Matthew Wilcox wrote:
 > On Sat, Feb 14, 2026 at 01:50:08PM -0800, Eric Biggers wrote: > > On Sat,
 Feb 14, 2026 at 01:18:29PM -0800, Eric Biggers wrote: > > > [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vrTUv-0007pZ-8Y
Subject: Re: [f2fs-dev] [PATCH v2 1/2] f2fs: use fsverity_verify_blocks()
 instead of fsverity_verify_page()
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
Cc: fsverity@lists.linux.dev, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:willy@infradead.org,m:fsverity@lists.linux.dev,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fsdevel@vger.kernel.org,m:jaegeuk@kernel.org,m:torvalds@linux-foundation.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[ebiggers@kernel.org]
X-Rspamd-Queue-Id: D52EF13DFC6
X-Rspamd-Action: no action

On Sun, Feb 15, 2026 at 03:38:20AM +0000, Matthew Wilcox wrote:
> On Sat, Feb 14, 2026 at 01:50:08PM -0800, Eric Biggers wrote:
> > On Sat, Feb 14, 2026 at 01:18:29PM -0800, Eric Biggers wrote:
> > > +++ b/fs/f2fs/compress.c
> > > @@ -1811,15 +1811,19 @@ static void f2fs_verify_cluster(struct work_struct *work)
> > >  	int i;
> > >  
> > >  	/* Verify, update, and unlock the decompressed pages. */
> > >  	for (i = 0; i < dic->cluster_size; i++) {
> > >  		struct page *rpage = dic->rpages[i];
> > > +		struct folio *rfolio;
> > > +		size_t offset;
> > >  
> > >  		if (!rpage)
> > >  			continue;
> > > +		rfolio = page_folio(rpage);
> > > +		offset = folio_page_idx(rfolio, rpage) * PAGE_SIZE;
> > >  
> > > -		if (fsverity_verify_page(dic->vi, rpage))
> > > +		if (fsverity_verify_blocks(dic->vi, rfolio, PAGE_SIZE, offset))
> > >  			SetPageUptodate(rpage);
> 
> Yeah, no.
> 
> 		if (fsverity_verify_blocks(dic->vi, rfolio,
> 				folio_size(rfolio), 0));
> 			folio_mark_uptodate(rfolio);
> 
> > >  		else
> > >  			ClearPageUptodate(rpage);
> 
> This never needed to be here.  The folio must already be !uptodate.
> Just delete these two lines.
> 
> > >  		unlock_page(rpage);
> 
> folio_unlock(rfolio);

Sure.  This kind of scope creep is why I wanted to just do the
straightforward conversion for now.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
