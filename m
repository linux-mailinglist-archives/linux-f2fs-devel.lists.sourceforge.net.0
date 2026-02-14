Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6KtCGrbfkGk+dgEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 14 Feb 2026 21:48:54 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EE41413D2F2
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 14 Feb 2026 21:48:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UndW1QuekQnOPXDLNIj4OTWSFKEESKcfKE/sh+mkNlo=; b=LByi39713xujn7rcUmTy30iVrD
	CD3CBr9W6Bu6fdtP9+fkgYsN03GvKmGJtQsOdmbR60YZJ3ylYW75dOAsQfbcLy4U8XhM8DOdulKgY
	xuG4C0rhI7HFkrjqNHA4K4ijxYP28T9MN8K5p1kMxlOq5nh3wC7OzZUIwBClR2aLmI5Y=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vrMZN-00038j-F4;
	Sat, 14 Feb 2026 20:48:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1vrMZM-00038d-BG
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 14 Feb 2026 20:48:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bO5Dij7NUY4IKwk40A7wfX0dG7BPcag5Lc3RFhibB2g=; b=dGCXs9sKGGtc2GDAN7iRxdVzFz
 b8MhbLXZnCBtOrecWV0rLDThpdIYkMF3l9i38BrXWEyFZPk8Q1GEqE0CowRs0cQZy/DhhNp+G0uiL
 sQE3yuWBOIqmbxQ0/hAtJb6iIqhEJI3Fg97hGjKwbOK0EOFOC/zGUuFn9ZcTQr9KQfIg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bO5Dij7NUY4IKwk40A7wfX0dG7BPcag5Lc3RFhibB2g=; b=F3QA7ThkmkD8pKqcd1zaE3It6j
 XxKxrvSluf5uLkWLD4nHjh4IgE7cvuUvXKUEiSCE4pXFRZqrU8Anr52uqO1K+mgty1gX9QMKIp8ha
 CLb18C109fvmEuWvX4AkT9A5vfg/YdH8f77H2tlxEtbh39MxjKMClMXgk8fPzedkb43c=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vrMZL-0003Q0-Vk for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 14 Feb 2026 20:48:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 49256600BB;
 Sat, 14 Feb 2026 20:48:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35E08C19421;
 Sat, 14 Feb 2026 20:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771102117;
 bh=EDS7m6q/kT345PyBZ/yeEIm7Ek5/88xXMcyOBouQNZs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OD+zjyX5AZcv79MsQ/wEdyE3EhwZUTPKTuO1QznR8wcgpXKy9kCAygsdoBpuRt4B4
 EqK4EEFy1DDE9hORrnoN04ySBK4rrl1Y3Ql4MNn+jJ2Gn6zmKAIHgBKY1Lm8vlEMtO
 31wkctzS+JhQWUNx6TGOgVOOkpO7XdPZEdw6cgzxLRHpwsfBusUqmhi1yYcOVzPttk
 EBBcZKLWgkoc3eYBvYK5FJ8c658WV9dl4cZz3zmvbozNZU/aG4RFEoJ0H1Zin+Fkhr
 fnDgzxv5i1xf2iUB9yd1Ebuu4+YjpaJvbtshMOysWseK/4aP0p3df8Ly7nP+noo3wb
 aiXJfwr+72HBQ==
Date: Sat, 14 Feb 2026 12:48:33 -0800
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20260214204833.GA10472@quark>
References: <20260214203311.9759-1-ebiggers@kernel.org>
 <20260214203311.9759-2-ebiggers@kernel.org>
 <CAHk-=wi60UWZ=kVayGKfrGURiX4aN6P4J_bNMOw_pSvUrxw1jw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHk-=wi60UWZ=kVayGKfrGURiX4aN6P4J_bNMOw_pSvUrxw1jw@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat, Feb 14, 2026 at 12:39:22PM -0800,
 Linus Torvalds wrote:
 > On Sat, 14 Feb 2026 at 12:33, Eric Biggers <ebiggers@kernel.org> wrote:
 > > > > - if (fsverity_verify_page(dic->vi, rpage)) > > + if ( [...] 
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
X-Headers-End: 1vrMZL-0003Q0-Vk
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: use fsverity_verify_blocks()
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
Cc: fsverity@lists.linux.dev, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:torvalds@linux-foundation.org,m:fsverity@lists.linux.dev,m:linux-fsdevel@vger.kernel.org,m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
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
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[ebiggers@kernel.org]
X-Rspamd-Queue-Id: EE41413D2F2
X-Rspamd-Action: no action

On Sat, Feb 14, 2026 at 12:39:22PM -0800, Linus Torvalds wrote:
> On Sat, 14 Feb 2026 at 12:33, Eric Biggers <ebiggers@kernel.org> wrote:
> >
> > -               if (fsverity_verify_page(dic->vi, rpage))
> > +               if (fsverity_verify_blocks(dic->vi, page_folio(rpage),
> > +                                          PAGE_SIZE, 0))
> 
> This really is very wrong. It may be equivalent to the old code, but
> the old code was *also* wrong.
> 
> If you use "page_folio()", you need to do the proper offsetting of the
> page inside the folio, unless the filesystem is purely using the old
> legacy "folio is the same as page", which is simply not true in f2fs.
> 
> It might be true in this particular case, but considering that it was
> *NOT* true in another case I fixed up, I really don't want to see this
> same mistake done over and over again.
> 
> So either it's the whole folio, in which case PAGE_SIZE is wrong.
> 
> Or it really is PAGE_SIZE, in which case you need to use the proper
> offset within the folio.
> 
> Don't take the old buggy garbage that was fsverity_verify_page() and
> repeat the bug when you remove it.

The reason I went with the direct conversion is that
f2fs_verify_cluster() clearly assumes small folios already, and indeed
it's called only with small folios.  But sure, we can make that specific
line in it large-folio-aware.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
