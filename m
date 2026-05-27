Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AA+nAxUVF2ok3wcAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 27 May 2026 18:00:21 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 313085E7581
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 27 May 2026 18:00:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eolY87L7sxZzYADH1qBvTdDKCBAk0vD+rxM0KW5Mif8=; b=Ky+rGzPCDEZVCpvhoanajaOFxe
	InYK6DGhSfeFSKiNC2XJev1QHZzNSyQ+FsQNy1RlFU+hfet+o2jNlxNFXNkL5D24t/M4efuyehGdG
	Vq4J+3cdughgJZozHYQ1tNyfD8fAP6TGjYT5QvpuRMhJQCMbJJlNKtHNNbKuvrbzIJ6g=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wSGfv-0004Xc-Cu;
	Wed, 27 May 2026 16:00:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1wSGfd-0004Vj-Dh
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 27 May 2026 15:59:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ky5x6VV8bGsiRibL4Mbeireh2/3HHtZ2G1qotL6tKkE=; b=Pc/FKZ2hO4FtujTnTtKg59tFu6
 8LzbMxEqI4JTtEp6ejdZfpwcLQVnjMDPAQ4gKSZLy3pqgEsWbsVSRyqC5RtqO9cIfjXApI1SCMbJC
 oszYci1GWeQcFPQIfUVJLvbzHuqTkT2vWIkzqYQSYpcIlB7zNK6M4hStUET1Nz75OkQQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ky5x6VV8bGsiRibL4Mbeireh2/3HHtZ2G1qotL6tKkE=; b=CFlFYctT9Bmc74EhmR3uGoRLip
 6CPjdOgUeZTi6Ae+oiVyRg/1X5h8jD6S0AhKXLO6WwR/IvbE0ELIIn1p5hVnjQsYMYdN34O1rQu0f
 d7QV1gf9tUhZkYBn1JoNNHEAiSYXbU9cBKvwAyqZuYECIfsGfq1Tl0mIGo/EyX/iSqIc=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wSGfc-0005e3-9S for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 27 May 2026 15:59:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 210486021C;
 Wed, 27 May 2026 15:59:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6866E1F000E9;
 Wed, 27 May 2026 15:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1779897577;
 bh=ky5x6VV8bGsiRibL4Mbeireh2/3HHtZ2G1qotL6tKkE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=RYqc0BD/c9Rk6VG80/Ku4juq+/5NhEA9655oRwH1Wmuep9DRWmqdGxTBZaGOAbx4c
 tAWp51YEvq1+8lth6riLToTePL3f5jhd0A9B+eajyaSW8fHPYWYjSs9849zYuwPqKi
 SkmrQ1Sj73F1X2nwofk44uZKbCtcjtNxLKSdqk50qPKRabEVz9ZGdCeRb9P/jUX7Gp
 ROw64V0uXEJeCATrY80FENgdTyVVifxFzRe5FtVsGqwU6po13npcbonInSgIoCh8L0
 uwTj53KmkgZ1MFEdp8hsLXFebtZo4DHZROQbE1pFiS8JcRGFroxsy56nkfPhdv80xj
 RmK8vLj9DyWvQ==
Date: Wed, 27 May 2026 15:59:35 +0000
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <ahcU5xbVy7xjps02@google.com>
References: <ag7HfNryTmQ-bVIS@infradead.org>
 <20260521155748.GA79343@macsyma-wired.lan>
 <ag_OVwPF49LSZ7rz@google.com>
 <20260522141115.GA8258@macsyma-wired.lan>
 <ahCNmWbcd_2lAJyk@google.com>
 <20260522224108.GA18663@macsyma-wired.lan>
 <ahTzHyHBL8t0iNBR@google.com>
 <ybmbjekuvzmaw4hmlxd7nxs546dqtwmxqxwyali74d6m3u7tat@b4q3japqnhrl>
 <f4e521ac-2381-49ca-8dcc-3cb3cf3ffaea@acm.org>
 <ahaPDHiXcJoVShPv@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ahaPDHiXcJoVShPv@infradead.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 05/26, Christoph Hellwig wrote: > On Tue, May 26, 2026
 at 09:14:52AM -0700, Bart Van Assche wrote: > > On 5/26/26 6:42 AM, Theodore
 Tso wrote: > > > It seems... surprising that the additional I/O o [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1wSGfc-0005e3-9S
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
Cc: Theodore Tso <tytso@mit.edu>, Bart Van Assche <bvanassche@acm.org>,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
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
	FORGED_RECIPIENTS(0.00)[m:hch@infradead.org,m:tytso@mit.edu,m:bvanassche@acm.org,m:linux-api@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-mm@kvack.org,m:linux-fsdevel@vger.kernel.org,m:akailash@google.com,m:christian@brauner.io,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 313085E7581
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 05/26, Christoph Hellwig wrote:
> On Tue, May 26, 2026 at 09:14:52AM -0700, Bart Van Assche wrote:
> > On 5/26/26 6:42 AM, Theodore Tso wrote:
> > > It seems... surprising that the additional I/O operations are actually
> > > throttloing UFS device bandwidth by 2x (4GB/s vs 2GB/s).  Have you dug
> > > into why this is happening, and whether there is anything that can be
> > > optimized below the file system?
> > The layers below the filesystem (block, SCSI, UFS) is what I'm
> > responsible for in the Pixel team and I can assure you that these are
> > highly optimized.
> > 
> > Since the transfer size used in Jaegeuk's tests is much larger than 4
> > KiB, how many CPU cycles are used per IO by the layers below the
> > filesystem is not limiting the transfer bandwidth.
> 
> I'm honestly not sure what discussion we have here.  Larger I/O is
> pretty much always more efficient.  If you submit smaller I/O you
> need more merging to build it back up larger, and more I/Os.

F2FS merges bios before submit_bio, regardless of small or large folios,
since the block addresses are consecutive. So, I think IO subsystem was
working in full speed.

> 
> Which is exaxtly why we need large folio support everywhere, as it
> makes a huge difference in I/O performance.
> 
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
