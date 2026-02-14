Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gCOPHS27kGm8cgEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 14 Feb 2026 19:13:01 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F6313CC52
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 14 Feb 2026 19:13:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CQm1u4eTFtHZpuYiaRqVUdK1fHeSzC2+RwIO7c2K/rQ=; b=djEu9mYr/QbOfW9Ko/QB+nuVlu
	70uoSeoCefPeqlUfUXCKjmDbkmSEmF5hhsIWu8CWXdiZPyVNNPaVXlyn+WbQ0SBMqAuGee+kAEQ0B
	Bab0OFa2i05MtiXvYbIEbw63PbQ88Q2QNQVS1LAjvFl7nCY527dI0uqnqK6SNqYv3+Go=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vrK8Q-0002GQ-N3;
	Sat, 14 Feb 2026 18:12:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1vrK8P-0002GF-Tl
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 14 Feb 2026 18:12:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4ON9mZ+xBHn+eou9ecGRN7yfwbZ//LT27ZFzs+i2TMg=; b=lA8vN9M87UzE5SV57n/upRQcUo
 GRakKUoesB2EHTROqzzuxKBQLDKAbOBDw+QXHf4D4QpE/QAhHlT7BKRrmgr5oGW6nArkAn0QQfStR
 +Jx5e+Vf8plfTajwO00TO6R1HfjxjRSSffhqQom9rbKSCxZ6d9sr+lplE0OPPI5hTRBs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4ON9mZ+xBHn+eou9ecGRN7yfwbZ//LT27ZFzs+i2TMg=; b=T3yRWYHcB3wmvOkSan2pQDCRDw
 eDxp8vK5jgtdIqNoXU8wXWizXcGMiKC+5HeKOWkpXEjeNhAlXx+moUbSpz9tmelLPVWp/hX3rBRnO
 dzpo+/6mw5slC95/utnOpalay4DwzXW1pi53mJ6JQ4iHvp52f526Pu0D9+lk5Abrxgv8=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vrK8Q-00068o-4M for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 14 Feb 2026 18:12:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 54FC1600BB;
 Sat, 14 Feb 2026 18:12:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4BFCC16AAE;
 Sat, 14 Feb 2026 18:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771092764;
 bh=rPeKROKJyop5viRzfdkAUdhOUJvV5d8DMVxNySjaz44=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e3abS1pwhVfyVhn9u5084D5OUK5ZPFf3M0fT3LQ7dvtgTtOOrO/kZ2OkFpItu6g5i
 JGCisoe92cQZspoc8wt2SGJwEDfLM5t+3Jlnb6KQpzrjOAQ8qC76t1q3r5iQDeowtJ
 8/yzusMR5UrsXyJgoU/xT6DqK616xmguXL4LcQgv5sahNz4TLvrU+RLKMtuy74/41g
 wYAfFXYqNBNsQTDsPiTRVKVmd0m+QiJMXEe33JzJjeqbXR0fYi1aQmopcyMJ4qrAY9
 g1H7Sv5vDCYPS8YiZKXjFdtKcxxLAnOGQb3ptN06APkdksD0lAPhFM/jXKqaV+UqV5
 FuPdpWimvpyBA==
Date: Sat, 14 Feb 2026 10:11:58 -0800
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20260214181158.GA2872@sol>
References: <aY_h1URe0wsXKl84@google.com>
 <CAHk-=wiWPQdT+Gs=mHNaCfuVahCxU6eubBQ4cVwXkW9s5nMRuA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHk-=wiWPQdT+Gs=mHNaCfuVahCxU6eubBQ4cVwXkW9s5nMRuA@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat, Feb 14, 2026 at 09:50:42AM -0800,
 Linus Torvalds wrote:
 > [ Note: added fsverity people ] > > On Fri, 13 Feb 2026 at 18:45, Jaegeuk
 Kim <jaegeuk@kernel.org> wrote: > > > > git://git.kernel.org [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vrK8Q-00068o-4M
Subject: Re: [f2fs-dev] [GIT PULL] f2fs update for 7.0-rc1
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-7.71 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:torvalds@linux-foundation.org,m:jaegeuk@kernel.org,m:tytso@mit.edu,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[ebiggers@kernel.org]
X-Rspamd-Queue-Id: B8F6313CC52
X-Rspamd-Action: no action

On Sat, Feb 14, 2026 at 09:50:42AM -0800, Linus Torvalds wrote:
> [ Note: added fsverity people ]
> 
> On Fri, 13 Feb 2026 at 18:45, Jaegeuk Kim <jaegeuk@kernel.org> wrote:
> >
> >   git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-7.0-rc1
> 
> So I have pulled this, but as part of going over my conflict
> resolution with the fsverity changes, I'm a bit unhappy.
> 
> I'm not unhappy about the f2fs thing in particular - I'm unhappy about
> the fsverity integration side.
> 
> In particular, f2fs uses fsverity_verify_page() by doing
> 
>     fsverity_verify_page(folio_file_page(folio,index))
> 
> which looks fine, and now wants that
> 
>     struct fsverity_info *vi
> 
> and that was part of my conflict resolution.
> 
> But then I looked at what fsverity_verify_page() does, and that is just broken.
> 
> Because fsverity_verify_page() looks like this:
> 
>         return fsverity_verify_blocks(vi, page_folio(page), PAGE_SIZE, 0);
> 
> and that's garbage.
> 
> We just turned the folio into a page, and now it turns it back into a
> folio - but importantly it *loses* the index of the page inside the
> folio while doing so!
> 
> In other words, fsverity_verify_page() does *not* work on large
> folios. It only works when a folio is a page.
> 
> And I can't just use "fsverity_verify_folio()", because that verifies
> the *whole* folio, not just the sub-page.
> 
> So my resolution was to just fix this thing and make it use
> !fsverity_verify_blocks() directly, using the page offset within a
> folio explicitly.
> 
> But I don't actually *really* know this code at all, and I can't
> verify my resolution, and I'm unhappy with how subtle that
> fsverity_verify_page() thing is.
> 
> I was initially going to just fix fsverity_verify_page() to actually
> take the page offset into account properly, but it turns out that
> there aren't very many other users.
> 
> Anyway, I *think* fsverity_verify_page() should be either fixed or
> removed. The fix would be something like this:
> 
> -       return fsverity_verify_blocks(vi, page_folio(page), PAGE_SIZE, 0);
> +       struct folio *folio = page_folio(page);
> +       unsigned int offset = folio_page_idx(folio, page) * PAGE_SIZE;
> +       return fsverity_verify_blocks(vi, folio, PAGE_SIZE, offset);
> 
> but I didn't do that. Instead I did a hack-job in fs/f2fs/data.c,
> which also involved changing a
> 
>     fsverity_verify_page(vi, &folio->page)
> 
> into a
> 
>     fsverity_verify_folio(vi, folio)
> 
> instead, because it really looked to me like it should be the whole
> folio regardless of whether it was a large folio (broken before) or
> not (working if so).
> 
> It's entirely possible that this code only deals with small page-sized
> folios, in which case it doesn't matter. But that
> f2fs_read_data_large_folio() code is definitely about multi-page
> folios.
> 
> There's another fsverity_verify_page() use in fs/f2fs/compress.c. and
> I didn't touch that one. The code doesn't use folios at all, so maybe
> it only triggers for page == folio. I don't know, and that's when I
> just started going "Somebody who knows this code needs to fix this".
> 
> Anyway, I think that fsverity_verify_page() case should be removed
> too, and then the subtly broken function can just be deleted entirely
> instead of being fixed.
> 
> Comments? Did I mess something up? Am I just being confused?
> 
> Regardless, please verify my merge resolution, and please do
> *something* about that fsverity_verify_page() situation.

Your merge resolution looks good.  Thanks for catching this.

The history behind this is that fsverity_verify_page() came first,
before folios existed.  The functions that take a folio,
fsverity_verify_blocks() and fsverity_verify_folio(), were added later.
fsverity_verify_page() was kept around for compatibility with the
existing callers in ext4, f2fs, and btrfs.  It wasn't updated to take
the index of the page in its containing folio into account, as it was
intended for the existing non-large-folio-aware callers.

But now that only one caller of fsverity_verify_page() is left (the one
in f2fs_verify_cluster()), we should indeed convert that to use
fsverity_verify_blocks() and remove fsverity_verify_page().  I'll plan
to do that through the fsverity tree soon, if that's okay with the f2fs
folks.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
