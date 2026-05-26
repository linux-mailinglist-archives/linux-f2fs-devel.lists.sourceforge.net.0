Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6MFEIMcdFWoVSwcAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 May 2026 06:12:55 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9E55D09AA
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 May 2026 06:12:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kwZ0i3A2jGKSh8V9KzOPZDsvZ2JheQJWlfneA46ke8Q=; b=MD/8bgWlCNEjKcHAYt8fFzi1gM
	WowT1dhWI2/cy1DGSko5AqIHlNia+mbjrnzADuNxOdCcGc4oZQO+ggl86wkIcb9ouygJIoz4g681O
	OMj2s5l0SORPjU4WvdsAYCl2ofoTyn4Cb3sVDAvyJrBX4SAlERI17Y2JjF/vhWHA18Hs=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wRj9l-0004PF-3q;
	Tue, 26 May 2026 04:12:41 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1wRj9j-0004P8-Jf
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 26 May 2026 04:12:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zolLXtUNuGgMGvntuicSbuzfsAN933tYyy3XaR95l44=; b=XXBbgSN4qLYdPo0oBr0g00rQ3S
 Ww4vGPmNpviqZG1eNjpySQcvx9Naiq+jNcqjBoEid+PgD8nDpt5puhC9TzbH/AEBi+rJIl2ReqvrP
 zD2f8WFtWiz1GVzkeSpejmscRwRw51uOruepZ3rKa4nemUUPhrCPmTMgV0psC5uNTpUc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zolLXtUNuGgMGvntuicSbuzfsAN933tYyy3XaR95l44=; b=In8XYakgoc7IRd8Hyk/Psuz0BQ
 9xeYZXa+o7CbY+cZysh7se2q8DS6LpstU6sQQjf0h5+6J/cgrEhSH2qHfC3ejupjd44bZyacRgaUz
 9p6DEal2dMF9zS42NfWY8hqmyqgD9qGjUXNUeCMsBq5qeE1O0NUhgU6S3uSEgVOiklmo=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wRj9i-0008SY-Q2 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 26 May 2026 04:12:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 01FB2441AA;
 Tue, 26 May 2026 04:12:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76E571F000E9;
 Tue, 26 May 2026 04:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1779768753;
 bh=zolLXtUNuGgMGvntuicSbuzfsAN933tYyy3XaR95l44=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=lNuGG/JCaQFXm9DDXJufxSObLd3mxQYXUbJx58IGDqgyqXUXLdPw6Qum8nbATPHWY
 5y2VYItqqlemNRDU4RYHDFJSue2sXB7QuSOk6n2bmNNK5t60yWIf2XVPU2xvz9XOqB
 4tDOcHHdsg2zavU9J43B7Yf+uT1eeJgDZ5jMnzX/6kLtcAXzSv4gUknm8/CDjiFRtU
 DbMMr04HINTanf9VBY8VWy2BPeuTqj+LeaBQhVBfYlXUceVNqK2M1f81lxUHFzgjIU
 a2cniHjQE9QBikxhPJG6GvI7LUSdZmwi7xavsdN/6CaDs5RblpvPwwl+i3h6rFOHOs
 WtFijc6Mq4nMg==
Date: Tue, 26 May 2026 04:12:32 +0000
To: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <ahUdsKSVV65qSvDm@google.com>
References: <ad_AVHe7RMnGrGTb@google.com>
 <ad_HwhzlNPUEKQi6@casper.infradead.org>
 <ag7HfNryTmQ-bVIS@infradead.org>
 <20260521155748.GA79343@macsyma-wired.lan>
 <ag_OVwPF49LSZ7rz@google.com>
 <20260522141115.GA8258@macsyma-wired.lan>
 <ahCNmWbcd_2lAJyk@google.com>
 <20260522224108.GA18663@macsyma-wired.lan>
 <ahTzHyHBL8t0iNBR@google.com>
 <8a42abed-8289-44ec-a144-dfe531a4af71@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8a42abed-8289-44ec-a144-dfe531a4af71@infradead.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 05/25, Randy Dunlap wrote: > > > On 5/25/26 6:10 PM,
 Jaegeuk
 Kim wrote: > > On 05/22, Theodore Tso wrote: > >> On Fri, May 22, 2026 at
 05:08:41PM +0000, Jaegeuk Kim wrote: > >>> > >>> Thank you for [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1wRj9i-0008SY-Q2
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: another way to set large folio by
 remembering inode number
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
Cc: Theodore Tso <tytso@mit.edu>, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, Christoph Hellwig <hch@infradead.org>,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 Akilesh Kailash <akailash@google.com>,
 Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rdunlap@infradead.org,m:tytso@mit.edu,m:linux-api@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:hch@infradead.org,m:linux-mm@kvack.org,m:linux-fsdevel@vger.kernel.org,m:akailash@google.com,m:christian@brauner.io,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
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
	HAS_REPLYTO(0.00)[jaegeuk@kernel.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Queue-Id: 9F9E55D09AA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 05/25, Randy Dunlap wrote:
> 
> 
> On 5/25/26 6:10 PM, Jaegeuk Kim wrote:
> > On 05/22, Theodore Tso wrote:
> >> On Fri, May 22, 2026 at 05:08:41PM +0000, Jaegeuk Kim wrote:
> >>>
> >>> Thank you for the explanation. It seems I made a wrong assumption on the
> >>> usage of "user." prefix where each filesystem can support in different
> >>> ways.
> >>
> >> The "user." prefix is used by all userspace applications that wish to
> >> store extended attributes.  For example, user.mime_type,
> >> user.xdg.origin_url, user.charset, user.appache_handler, etc
> >>
> >> For more information, see:
> >>
> >>     https://www.freedesktop.org/wiki/CommonExtendedAttribute
> >>     https://wiki.archlinux.org/title/Extended_attributes
> >>
> >> I certainly assumed this was common knowledge across all file system
> >> maintainers, but this was apparently not true in your case.  I don't
> >> know how this could be the case given that f2fs implements extended
> >> attributes, and I would have thought you would have known that when
> >> testing that feature.
> >>
> >>> I shared some motivation when replying to Darrick's feedback [1], but yes,
> >>> it was not enough for all heads-up. The problem started that some speicific
> >>> application needs as many high-order pages as possible mostly for reads. So,
> >>> I thought we can turn on large folio on the specific files per hints. One way
> >>> for the hints was using immutable bit, but it turned out it's very hard to
> >>> manage disabling the bit whenever deleting the files. Along with limited
> >>> ioctl() and requiring inode eviction to manage large folio activation, I had
> >>> to implement this path.
> >>>
> >>> [1] https://lore.kernel.org/lkml/aeA5C8byIpXWla7f@google.com/
> >>
> >> Actually, you still haven't explained your use case, at least, not
> >> well enough for me to understand what you are trying to do.
> >>
> >> So an application wants a particular file to use as many high-order
> >> pages as possible.  Why?  What sort of guarantees do you need to
> >> provide?  What happens if they can't be provided?  What happens if a
> >> possibly malicious, or at least gready, application uses this
> >> interface to grab a lot of high-order pages?
> >>
> >> >From your patch:
> >>
> >> 1. setxattr(file, "user.fadvise", &value, sizeof(unsigned int), 0)
> >>  -> register the inode number for large folio
> >> 2. chmod(0400, file)
> >>  -> make Read-Only
> >> 3. open()
> >>  -> f2fs_iget() with large folio
> >> 4. open(WRITE), mkwrite on mmap, chmod(WRITE)
> >>  -> return error
> >> 5. iput() and open()
> >>  -> goto #3
> >> 6. unlink
> >>  -> deregister the inode number
> >>
> >> Why should making the file read-only matter?  And when you say
> >> "derigster the inode number", why should this be related to deleting
> >> the inode?
> >>
> >> This is an interface which seems to be very specific to your use case.
> >> What if those requirements change over time?  What if you want pull in
> >> a file without making it be read-only?  And what if you want to
> >> release the large-order pages without deleting the file?
> > 
> > Let me try to write more details, helped with Gemini.
> 
> [as an interested reader:]
> 
> If this idea is so good, why shouldn't it be done in the VFS/MM so that
> other filesystems could do the same thing instead of just in f2fs?

Thanks for the feedback. I'm really open, but just trying to understand it's
good or not. If it's so bad at all, I'd be really ready to drop it even the
ioctl approach, even though I already prepared its implementation.

>
> 
> -- 
> ~Randy
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
