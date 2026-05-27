Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOARC1VHFmofkQcAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 27 May 2026 03:22:29 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D3D5DE387
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 27 May 2026 03:22:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TJd8D/ilIQ2ZX2Cog6WPj3ioOrpBMznTaM6H8BmpXik=; b=Enxd+BZhG8V/L7wssEx0LWXvo4
	crndS1K9kzW+B3ewHIUfH0a9mOWZL3Q41CT6pBHzN6lwnVPd/TV01FxamPCI3x5+qHGJiobuNPCqR
	QP2P/d8jQwV7gr6Jbcy44v4kM5BS5J216UZ7bxdfZ4ezI6EJDpBH08MLApyPHxo1p6j4=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wS2yO-0005xz-5u;
	Wed, 27 May 2026 01:22:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <tytso@mit.edu>) id 1wS2yN-0005xm-5G
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 27 May 2026 01:22:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DJFkDvXxR0DjYA3xWYda2p1KUsjgyfsXRLcTLMKtZ+c=; b=HZkyvFanQgmbgU1107A1w4Lf/v
 Wj/zNClSSvbYmOAH2GFeiqJKxQTVa/KEfH42uXUDdWLcxqMFCZfvtSbY3JigTLbcwQm0eLCWloay0
 lAYACYillyOUevk7SvPuT7CvgOtlq5c4KguBA/LaviigevL8gtBWwBolleAV2gFQxcpo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DJFkDvXxR0DjYA3xWYda2p1KUsjgyfsXRLcTLMKtZ+c=; b=mYXHM4RyB7r6v00JkLcslCxwq2
 ud9D1OI325mJXWZSeppWr5xGt6a/0T2embd3F+uYBKD5NlbkpsVrNyA2wh4UCNb07eRl4xn5ra7Kb
 losKrvzTX9oQ1EPtXJ6wQIVRGCD1wGp9/svkt+PW602h6Izlr0gRb0HlDlNd/+FZ3UpE=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wS2yM-0002Sj-K0 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 27 May 2026 01:22:15 +0000
Received: from macsyma.thunk.org (c-73-9-28-129.hsd1.il.comcast.net
 [73.9.28.129]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 64R1LhpE022642
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 May 2026 21:21:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
 t=1779844907; bh=DJFkDvXxR0DjYA3xWYda2p1KUsjgyfsXRLcTLMKtZ+c=;
 h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
 b=PSWDr8l0xAxG+aO7NY0TUEScHYUAT3V1K6PjCEMN0Gxn7ksMEmUXWMzBHgXAR6Fz3
 l9s+D8e3P0cM9uziJ/JcbbMnKrNZoaNK4EBsYi4ljiRX2KtqtM3uf4WRB2i0lzbZYr
 qR3FneqDQww/s0jVBh1GakrN+rkZR+JGoW+N7YIaCJogB1WUuqkEIg++rTq1UfabQt
 wln2UkUGPyOtKsWY7VWaMsjiZdy7GzUZlr1Jg1XiGUDgoblMJSzf06/8g0PvJ29Pf1
 J6US3QBSYQDRI8t8isI8KP6cS+bC7W7MidFp7vFb96gFpK4GLP1P6dC3UlEMI3OgP+
 Yij0XC/BpJXfQ==
Received: by macsyma.thunk.org (Postfix, from userid 15806)
 id 84D236B384FE; Tue, 26 May 2026 20:21:43 -0500 (CDT)
Date: Tue, 26 May 2026 20:21:43 -0500
From: "Theodore Tso" <tytso@mit.edu>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <psj3kr2gcze2yll5xdbvyyzxwcwhds5gh55poobpkfxrkpbgr7@ljdindismzd4>
References: <ad_HwhzlNPUEKQi6@casper.infradead.org>
 <ag7HfNryTmQ-bVIS@infradead.org>
 <20260521155748.GA79343@macsyma-wired.lan>
 <ag_OVwPF49LSZ7rz@google.com>
 <20260522141115.GA8258@macsyma-wired.lan>
 <ahCNmWbcd_2lAJyk@google.com>
 <20260522224108.GA18663@macsyma-wired.lan>
 <ahTzHyHBL8t0iNBR@google.com>
 <ybmbjekuvzmaw4hmlxd7nxs546dqtwmxqxwyali74d6m3u7tat@b4q3japqnhrl>
 <ahYWKH9-ybDlZuJd@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ahYWKH9-ybDlZuJd@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, May 26, 2026 at 09:52:40PM +0000, Jaegeuk Kim wrote:
 > > It seems... surprising that the additional I/O operations are actually
 > > throttloing UFS device bandwidth by 2x (4GB/s vs 2GB/s). Hav [...] 
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
X-Headers-End: 1wS2yM-0002Sj-K0
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
Cc: linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
 Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, Akilesh Kailash <akailash@google.com>,
 Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-0.51 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	DMARC_POLICY_SOFTFAIL(0.10)[mit.edu : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:linux-api@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:hch@infradead.org,m:linux-mm@kvack.org,m:linux-fsdevel@vger.kernel.org,m:akailash@google.com,m:christian@brauner.io,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[tytso@mit.edu,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,mit.edu:s=outgoing];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[tytso@mit.edu,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,mit.edu:-];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Queue-Id: 67D3D5DE387
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 26, 2026 at 09:52:40PM +0000, Jaegeuk Kim wrote:
> > It seems... surprising that the additional I/O operations are actually
> > throttloing UFS device bandwidth by 2x (4GB/s vs 2GB/s).  Have you dug
> > into why this is happening, and whether there is anything that can be
> > optimized below the file system?
> 
> I can't tell the exact size tho, roughly it's between 1GB and
> 4GB. And, per lots of test results with various tunings, it turned
> out memory allocation speed was the culprit. If we use 4KB page, we
> couldn't get the full bandwidth unless we set the biggest core
> running the highest frequency.

OK, if we assume that the model file that you want to load is is 2GB
then the number of 4k pages that you need is a bit over half a million
(524288).  So if it take 1 second with large folios (2 GB/s as you
stated above), and half-second without (4 GB/s), then you're basically
saying that it was costing you half-second to allocate 524288
singleton pages.  And the whole point of this exercise is to save that
half second?

And I assume that these timing was using a performance cores, and part
of the goal here is to be able to use an efficiency core instead.

Did I get that right?

> > But the problem with using small folios is that if you want to
> > actually *use* the memory, unless you want to segment out the memory
> > so it can't be used for anything other than the AI models (e.g., by
> > using somthing like hugetlbfs) it's just going to break up the memory
> > into smaller folios.  So that's not actually going to *help* in actual
> > real life use cases.  It might help for your artificial benchmarks /
> > experiments, but in the real life case where Android applications are
> > running and fragmenting all of the device memory, the large folios
> > won't be available *anyway*.
> 
> Agreed it's hard to get this done perfectly tho, as the best effort on this
> particular AI model case, I focused on two timings when loading the models:
> 1) right after device boot, 2) dynamic loading when required. To secure high
> order pages, for 1), I disabled the large folio consumed by EROFS, while for
> 2), I tried to call compact_memory before loading the model. Both of cases,
> I could observe we could get fair amount of large folios. Yes, not 100% tho.

If (1) is a common case in real life, the thing to do would be grab
2GB of large folios early in the startup sequence, and then letting
erofs do its thing --- and then at the end of the startup, right before you
load the model, you can release the 2GB worth of large folios.

(That being said, I'm guessing #1 is actually not that interesting,
since as a percentage of the time that it takes for an Android device
to startup, is adding an extra half-second *really* going to be
noticeable by the user?)

But for case #2, that's the much more challenging case.  If you don't
call compact_memory() you're going to burn half a second to allocate
the 4k pages, since the large folios won't be available.  But if you
*do* call compact_memory() in a production ROM, depending fragmented the
memory is and how much memory have, calling compat_memory() could take
**minutes**.  So what's the point?

The bottom line is if it's right after device boot, there are simple
techniques that don't require hacking up the f2fs.  But in the
demand-loaded case, calling compact_memory() is the last thing you'll
want to do.  You're better either asking the mm to allocate the 4k
pages, or do whatever compaction it can do to just free up 2GB worth
of folios.  (Calling compact_memory() is overkill, and only makes
sense in the context of benchmark / proof of concept demo.)

Either way, trying to get file systems to avoid using large folios in
the hopes that this will speed up large AI model loading.... doesn't
seem to make sense.

If the problem is fundamentally about making 2GB worth of large folios
available in a way that takes significantly less time that just
allocating the model using half-million 4k pages, that's the question
that we should be asking Matthew and the mm folks.  Which is why it
was too bad we didn't raise this issue at LSF/MM earlier this month.

> Indeed, I was off from LSF/MM for years due to various product issues, not
> related F2FS tho. Let me make some effort to attend upcoming ones like LPC,
> if I can get the budget from company.

Next time, as a suggestion, feel free to raise the issue when the
LSF/MM CFP goes out, even if you don't think it's likely you will get
an invite.  Indeed, with a sufficiently interesting topic, that's the
way to *get* an invitation.  It will require breaking down the
technical requires as you and I have done for the last few messages on
this thread.

Even if you can't attend LSF/MM due to time or budget reasons, there
are a number of your colleagues who are attending, who could raise the
question on your behalf.  I've been known to do that once or twice on
behalf of other Google teams.  But it does require that you approach
the usual LSF/MM suspects a good 2-3 months before the conference so
we can help you craft the an appropriate response to the CFP.

Cheers,

					- Ted


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
