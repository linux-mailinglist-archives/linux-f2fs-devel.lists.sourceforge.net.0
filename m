Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wATsK9+JeWkqxgEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 28 Jan 2026 05:00:31 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C18439CE7A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 28 Jan 2026 05:00:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ISmiEgR93VFzEQPEZeBJeGhFOTDPzD/1Hjseyvmg4BE=; b=AOvGxC2xjfnHcDol1tjvNrqJ43
	J3MbNUBZ43fAd4D3JRlnE2qUztF/8OkwvtoV8/PP6QobEkS9Hd5mKqNBS6mi41vneeijyfZSQwjdW
	2rmAS3WrPCPWNTGvyPu4e7q2LtyTa2m+/PwrvB/2F8aQko9HPyTigQcTmhgi54KadyRs=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vkwjB-0008NF-33;
	Wed, 28 Jan 2026 04:00:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1vkwin-0008MB-1h
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Jan 2026 04:00:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IJ1TdEu2x7gOc2J+b2bClaA4lPcrtqigaaX6qFVQOH4=; b=M6e1Aen7vR/cgXaOwjo0c3LXN+
 e1eezkcRKIsAIOrG5O0yx/Yq4CfAyUgQoA47TitsS6qCWDS4AhBjvyHx8dX8LtW/wK9rsiYbpzuV9
 W+NggJ62OaHmOqtV5fH8FvL0uw1SHOcjP9eCVKyUa5gj16/GbEb+ykHY2jwpWuVm2Oyc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IJ1TdEu2x7gOc2J+b2bClaA4lPcrtqigaaX6qFVQOH4=; b=d1rZ9oiE0vAED3RcQwkJte1UI6
 E+GJURXo7DJNTX00JEYSqTq6NOo2d8tbRbBMjIUAqNYO/lht02lU4G6mb3eO2GsVwNXnDrHJus91O
 EcPti/5m6ooqMJVbTgDjtLyjuih2qpgFm6Pjuuuj0LeDUhSjLdhB2CsFfnmIe8fmm0LQ=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vkwim-0001vI-Fl for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Jan 2026 04:00:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C27B760007;
 Wed, 28 Jan 2026 03:59:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BA30C4CEF1;
 Wed, 28 Jan 2026 03:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769572794;
 bh=KN33KA8IhAJueLHNP+j8dBhI4ybmkf2zt2MgVF8LMVU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=u7CsrT+r2m6K7KYhX/d3UhuDJaMed3HVYTI7HZ7VPvZR1nrTY+f3mfoxbWZM6N7y2
 19ZURMQ3RY3J3YT4AOi6jnCP1zKx7oR9zX1RF94rFmwzBskxAh92OGcHNnMFVPxYje
 8QdLNncWQnVLxR300bucB4AkwyZi3ccNWj4ARaF60JNMbYqaKupTeqcE/zOlFLpnb+
 qFWRirO6WC75aVF1HmJChMyg44YqubHKFeW7Thq6CkDZxuHzWxM7ipbq6YYcUN7ls2
 5pKJJJllMiiJuIf3gG/y0JhxSYO0wYZX+PZR1LD+RhMVKJaU7RUTjbaP07AwODFJxu
 gLewy77vI9faA==
Date: Tue, 27 Jan 2026 19:59:21 -0800
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20260128035921.GE2718@sol>
References: <20260126045212.1381843-1-hch@lst.de>
 <20260126045212.1381843-17-hch@lst.de> <20260128032817.GB2718@sol>
 <20260128033519.GB30830@lst.de> <20260128034405.GD2718@sol>
 <20260128034838.GB31178@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260128034838.GB31178@lst.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Jan 28, 2026 at 04:48:38AM +0100, Christoph Hellwig
 wrote: > On Tue, Jan 27, 2026 at 07:44:05PM -0800, Eric Biggers wrote: >
 > On Wed, Jan 28, 2026 at 04:35:19AM +0100, Christoph Hellwig wrote [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vkwim-0001vI-Fl
Subject: Re: [f2fs-dev] [PATCH 16/16] fsverity: use a hashtable to find the
 fsverity_info
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
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
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
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns]
X-Rspamd-Queue-Id: C18439CE7A
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 04:48:38AM +0100, Christoph Hellwig wrote:
> On Tue, Jan 27, 2026 at 07:44:05PM -0800, Eric Biggers wrote:
> > On Wed, Jan 28, 2026 at 04:35:19AM +0100, Christoph Hellwig wrote:
> > > > Is there a reason for this function in particular to be __always_inline?
> > > > fsverity_get_info() is just inline.
> > > 
> > > Without the __always_inline some gcc versions on sparc fail to inline it,
> > > and cause a link failure due to a reference to fsverity_readahead in
> > > f2fs_mpage_readpages for non-verity builds.  (reported by the buildbot)
> > 
> > The relevant code is:
> > 
> >     vi = f2fs_need_verity(inode, folio->index);              
> >     if (vi)                                                  
> >             fsverity_readahead(vi, folio, nr_pages); 
> > 
> > Where:
> > 
> >     f2fs_need_verity()
> >         => fsverity_get_info()
> >             => fsverity_active()
> > 
> > If fsverity_active() needs __always_inline, why don't the other two
> > functions in the call chain need it?
> 
> I wish I knew.  compiler inlining decisions are a big of black magic.
> If you prefer I can use __always_inline for the entire chain.

Relying on the compiler to always correctly perform three levels of
inlining and dead code elimination isn't going to be all that reliable,
as it seems you've already seen.  Using __always_inline for all levels
might be good enough, though it's possible the call chain will need to
be simplified by (re)introducing CONFIG_FS_VERITY=n stubs as well.
Notably, fsverity_get_info() currently has a CONFIG_FS_VERITY=n stub
that just consists of 'return NULL;', but this patch removes it.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
