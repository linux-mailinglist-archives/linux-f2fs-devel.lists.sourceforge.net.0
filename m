Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GCWVKHdaFmo9lgcAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 27 May 2026 04:44:07 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BF29E5DEA78
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 27 May 2026 04:44:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PPEZKmxNNkh5mwCSfHzTQ4h7Wx0bqkczn2lm9UuT5Z4=; b=HhjWqRbAmNutvvdf6/eXOU89iC
	akiuBU0ze5uT/8BUqOVld+IiPQqnBfID8FlubTOKE4bsY9pZfNwO8VIMXqvhXzjv0DO3h8Pi8eY0y
	ndrSHuBoi+sx3HXdWJLFuj4x14drE3nrcUcaZ4JRDWl22WxlBAbVxFdBqsRvoCiQRpc0=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wS4FM-0003Qs-Ot;
	Wed, 27 May 2026 02:43:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1wS4F0-0003QS-5R
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 27 May 2026 02:43:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=C1nuBMQZPJBWHgqL9hyljvS48WOhQs90dDmj4KPjIbg=; b=WYghG8B3beZzBEy3d59tKoOPDr
 t9jFR8cAMwW3Izqok9XMIsfFnfGo5U8gRCy70V0cdWnj36F9vd0J8TH9Hp1+s8rs59HGwLhj3yoET
 P8sbpnMMIX1mufYlkJ2PYMmNyj7eImz3znPltMRJNUf8bQxZT4l0wnWLCGN9u2K/nGnk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=C1nuBMQZPJBWHgqL9hyljvS48WOhQs90dDmj4KPjIbg=; b=hBISX5WlVpHEcAFjcqBhQA6rcl
 IC6Ks+4Xml2HxBIwdfw0t/eWiNUM8d5gijJa/NsCagWyhsQc1f8OIPG9SU+lzg5u/u9JvqC1LsXP/
 2cBELA6ew290KudacWNCPlSIBhFqNj9CePbZHQZmqV0ypSq44BlVQoO316toa9crW4vE=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wS4Ey-00039N-Pq for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 27 May 2026 02:43:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id EF0DC42A1E;
 Wed, 27 May 2026 02:43:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78CA51F000E9;
 Wed, 27 May 2026 02:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1779849803;
 bh=C1nuBMQZPJBWHgqL9hyljvS48WOhQs90dDmj4KPjIbg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=ny26pDgZPCLs9v4CxCOQAP2MxRb1/9vILo0qN0dihOg/EM1zL3/oRCluBSuR6mtPi
 5hvm7I4KGLzcVR+d1mGv3Zt+10kmq3xDjtX/SHpb8KWDw7DU7tUHphnmIGJTZlfget
 gnjSWNW3CcLdV+cnIBQwjIov5NpUalxlLjipXZk3ahldlukmbxICwRuyEtFn3QUP7k
 aL8zMpEbxIQ1FXKEii/QhwHDuz8i7V1lo+C9CROKUs97zZQ3U2chXrmlrTj7XNCxSx
 EOVIZ/vhWPcQxZqIB2ch0EmweOMkTmxBW1eXMQudMS48bPNsdDlm/v6K6GztH6O8x6
 TepsgLundZL8w==
Date: Wed, 27 May 2026 02:43:21 +0000
To: Theodore Tso <tytso@mit.edu>
Message-ID: <ahZaScMpx19ZLQi4@google.com>
References: <ag7HfNryTmQ-bVIS@infradead.org>
 <20260521155748.GA79343@macsyma-wired.lan>
 <ag_OVwPF49LSZ7rz@google.com>
 <20260522141115.GA8258@macsyma-wired.lan>
 <ahCNmWbcd_2lAJyk@google.com>
 <20260522224108.GA18663@macsyma-wired.lan>
 <ahTzHyHBL8t0iNBR@google.com>
 <ybmbjekuvzmaw4hmlxd7nxs546dqtwmxqxwyali74d6m3u7tat@b4q3japqnhrl>
 <ahYWKH9-ybDlZuJd@google.com>
 <psj3kr2gcze2yll5xdbvyyzxwcwhds5gh55poobpkfxrkpbgr7@ljdindismzd4>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <psj3kr2gcze2yll5xdbvyyzxwcwhds5gh55poobpkfxrkpbgr7@ljdindismzd4>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 05/26, Theodore Tso wrote: > On Tue, May 26,
 2026 at 09:52:40PM
 +0000, Jaegeuk Kim wrote: > > > It seems... surprising that the additional
 I/O operations are actually > > > throttloing UFS device b [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1wS4Ey-00039N-Pq
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
Cc: linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
 Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, Akilesh Kailash <akailash@google.com>,
 Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tytso@mit.edu,m:linux-api@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:hch@infradead.org,m:linux-mm@kvack.org,m:linux-fsdevel@vger.kernel.org,m:akailash@google.com,m:christian@brauner.io,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[jaegeuk@kernel.org]
X-Rspamd-Queue-Id: BF29E5DEA78
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 05/26, Theodore Tso wrote:
> On Tue, May 26, 2026 at 09:52:40PM +0000, Jaegeuk Kim wrote:
> > > It seems... surprising that the additional I/O operations are actually
> > > throttloing UFS device bandwidth by 2x (4GB/s vs 2GB/s).  Have you dug
> > > into why this is happening, and whether there is anything that can be
> > > optimized below the file system?
> > 
> > I can't tell the exact size tho, roughly it's between 1GB and
> > 4GB. And, per lots of test results with various tunings, it turned
> > out memory allocation speed was the culprit. If we use 4KB page, we
> > couldn't get the full bandwidth unless we set the biggest core
> > running the highest frequency.
> 
> OK, if we assume that the model file that you want to load is is 2GB
> then the number of 4k pages that you need is a bit over half a million
> (524288).  So if it take 1 second with large folios (2 GB/s as you
> stated above), and half-second without (4 GB/s), then you're basically
> saying that it was costing you half-second to allocate 524288
> singleton pages.  And the whole point of this exercise is to save that
> half second?
> 
> And I assume that these timing was using a performance cores, and part
> of the goal here is to be able to use an efficiency core instead.
> 
> Did I get that right?

Yes, right.

> 
> > > But the problem with using small folios is that if you want to
> > > actually *use* the memory, unless you want to segment out the memory
> > > so it can't be used for anything other than the AI models (e.g., by
> > > using somthing like hugetlbfs) it's just going to break up the memory
> > > into smaller folios.  So that's not actually going to *help* in actual
> > > real life use cases.  It might help for your artificial benchmarks /
> > > experiments, but in the real life case where Android applications are
> > > running and fragmenting all of the device memory, the large folios
> > > won't be available *anyway*.
> > 
> > Agreed it's hard to get this done perfectly tho, as the best effort on this
> > particular AI model case, I focused on two timings when loading the models:
> > 1) right after device boot, 2) dynamic loading when required. To secure high
> > order pages, for 1), I disabled the large folio consumed by EROFS, while for
> > 2), I tried to call compact_memory before loading the model. Both of cases,
> > I could observe we could get fair amount of large folios. Yes, not 100% tho.
> 
> If (1) is a common case in real life, the thing to do would be grab
> 2GB of large folios early in the startup sequence, and then letting
> erofs do its thing --- and then at the end of the startup, right before you
> load the model, you can release the 2GB worth of large folios.
> 
> (That being said, I'm guessing #1 is actually not that interesting,
> since as a percentage of the time that it takes for an Android device
> to startup, is adding an extra half-second *really* going to be
> noticeable by the user?)
> 
> But for case #2, that's the much more challenging case.  If you don't
> call compact_memory() you're going to burn half a second to allocate
> the 4k pages, since the large folios won't be available.  But if you
> *do* call compact_memory() in a production ROM, depending fragmented the
> memory is and how much memory have, calling compat_memory() could take
> **minutes**.  So what's the point?
> 
> The bottom line is if it's right after device boot, there are simple
> techniques that don't require hacking up the f2fs.  But in the
> demand-loaded case, calling compact_memory() is the last thing you'll
> want to do.  You're better either asking the mm to allocate the 4k
> pages, or do whatever compaction it can do to just free up 2GB worth
> of folios.  (Calling compact_memory() is overkill, and only makes
> sense in the context of benchmark / proof of concept demo.)
> 
> Either way, trying to get file systems to avoid using large folios in
> the hopes that this will speed up large AI model loading.... doesn't
> seem to make sense.
> 
> If the problem is fundamentally about making 2GB worth of large folios
> available in a way that takes significantly less time that just
> allocating the model using half-million 4k pages, that's the question
> that we should be asking Matthew and the mm folks.  Which is why it
> was too bad we didn't raise this issue at LSF/MM earlier this month.

Thanks for the context. To clarify a piece I missed earlier: the model pages
are also utilized for inference. Our data shows that larger chunks yield
higher inference speeds. Consequently, I required high-order pages to optimize
both read throughput and inference latency. I will halt my current efforts
and wait for alternative suggestions.

> 
> > Indeed, I was off from LSF/MM for years due to various product issues, not
> > related F2FS tho. Let me make some effort to attend upcoming ones like LPC,
> > if I can get the budget from company.
> 
> Next time, as a suggestion, feel free to raise the issue when the
> LSF/MM CFP goes out, even if you don't think it's likely you will get
> an invite.  Indeed, with a sufficiently interesting topic, that's the
> way to *get* an invitation.  It will require breaking down the
> technical requires as you and I have done for the last few messages on
> this thread.
> 
> Even if you can't attend LSF/MM due to time or budget reasons, there
> are a number of your colleagues who are attending, who could raise the
> question on your behalf.  I've been known to do that once or twice on
> behalf of other Google teams.  But it does require that you approach
> the usual LSF/MM suspects a good 2-3 months before the conference so
> we can help you craft the an appropriate response to the CFP.

Thanks for the suggestion. Will definitely do.

> 
> Cheers,
> 
> 					- Ted
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
