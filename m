Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id xxvZK0AvD2pSHgYAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 21 May 2026 18:13:52 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D51495A9018
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 21 May 2026 18:13:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p9lsx1cMiYE7+yMEAw19ymd4piF81dG45K87xJsW6KE=; b=SLyh+F4ze/yYABcvQMvGAXzspY
	RLmamRr1N+P2xY6hKxTYnaeWqPHEU6uP/Xz4D6QpGOM4+4n2ZAdGM636vdib6PtWnZg+lSBj120LZ
	HDNlnx6DRkRryinRhOqXjSBXtFakCmF8e3P4twUSt83M90kKTvx9UpD1heZSGpAJyNdU=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wQ61d-0002aO-Tz;
	Thu, 21 May 2026 16:13:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <tytso@mit.edu>) id 1wQ61T-0002aA-Fu
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 21 May 2026 16:13:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wTn+GnhNxMudbQm4gD4f9vF/cA4/h1qk9LUl7mxlP9c=; b=JZyg5Opea+LCLaDHJO+RYVQY/3
 8OaWA/GAzCa1Y8HgLjpX+Q9G3twaXAs++4BSS+PGzNVK1LpcUMtqjH4w9GBzlnyZlv0LnyIpAnEyG
 yIYqETBYHRfeeohgXCYfPRy+gWqG/poUlMkD6fQ7VtUoxVbm8PcJ62FtxX1HX9P8j8Ck=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wTn+GnhNxMudbQm4gD4f9vF/cA4/h1qk9LUl7mxlP9c=; b=k/OIT1dadiFjMSGAik69lo8ie5
 M9nSTyhY0HDxRmZmPZuLTE2lC8ND4OcQSluY0pK/rO1UVqGGW3iJyC9G/hK0slYjeEkzYSt5ZVTnC
 bsNsf8vvSA+yY5UkySjAsE79Oe7DDhiyP/fniAIFR9yOxo6n7efijVBTStHeWgEJtbk4=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wQ61N-0006kx-C7 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 21 May 2026 16:13:20 +0000
Received: from macsyma.thunk.org (pool-173-48-82-210.bstnma.fios.verizon.net
 [173.48.82.210]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 64LFwmMB027517
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 May 2026 11:58:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
 t=1779379133; bh=wTn+GnhNxMudbQm4gD4f9vF/cA4/h1qk9LUl7mxlP9c=;
 h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
 b=LeZnGv0Jw0KN2cpmFMusUp0BDqatOhD1eCiQmfJGgSNLUg5e9ogcoxiH08zwQBTnF
 Isbjbd75Ih/THtpbE0NzEbyaBqEOHUW4oMUAPZPfhEWCT/lNsgyTmJtMnmgy8PrfuW
 BfCE6Xd2aINXdkFM8v9YmztLozt2nQYwXF14OzBCSVWMM5JRHZmHy/ORKwcER/zpdO
 wp+kflSZAS/eIj4l6at6x2ZNDzQvltChJnap/adzvNaQwU8bEhffLchG+vErQwXj6h
 m03OA6B5NP9+kyki85Fnak+wng+fBb1/bKnpG7j7sNwn/cnhlJS0EskvLMdv4PcJeS
 kgtMjFEiFg6Rg==
Received: by macsyma.thunk.org (Postfix, from userid 15806)
 id 6B3A2697D19B; Thu, 21 May 2026 11:57:48 -0400 (EDT)
Date: Thu, 21 May 2026 11:57:48 -0400
From: "Theodore Tso" <tytso@mit.edu>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20260521155748.GA79343@macsyma-wired.lan>
References: <20260409134538.3692605-1-jaegeuk@kernel.org>
 <adhPZxtbZxgU-37v@google.com> <ad30g9xMs9wNJhFb@infradead.org>
 <ad_AVHe7RMnGrGTb@google.com>
 <ad_HwhzlNPUEKQi6@casper.infradead.org>
 <ag7HfNryTmQ-bVIS@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ag7HfNryTmQ-bVIS@infradead.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, May 21, 2026 at 01:51:08AM -0700, Christoph Hellwig
 wrote: > > You haven't sent a proposal. This is a reply to a reply to a reply
 of a > > patch. There's no justification for why f2fs is so sp [...] 
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
X-Headers-End: 1wQ61N-0006kx-C7
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
 linux-mm@kvack.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-fsdevel@vger.kernel.org, Akilesh Kailash <akailash@google.com>,
 Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-1.01 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[mit.edu : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,mit.edu:s=outgoing];
	FORGED_SENDER(0.00)[tytso@mit.edu,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hch@infradead.org,m:linux-api@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-mm@kvack.org,m:jaegeuk@kernel.org,m:linux-fsdevel@vger.kernel.org,m:akailash@google.com,m:christian@brauner.io,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	DKIM_MIXED(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,mit.edu:-];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[tytso@mit.edu,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: D51495A9018
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 21, 2026 at 01:51:08AM -0700, Christoph Hellwig wrote:
> > You haven't sent a proposal.  This is a reply to a reply to a reply of a
> > patch.  There's no justification for why f2fs is so special that it
> > needs this.  What the hell is going on?  You know this is not the way to
> > get code merged into Linux.
> 
> None of this got properly answers, and this broken interface now landed
> in linux-next. IT is offloading a user.* xattr which is free-form
> user data with semantics that are weird to say it very nicely.
> 
> All this was done against the advice in the mailing list discussion.

So let me get this straight.  This is a magic xattr interface which is
not even persisted in the file system, but instead sets a 32-bit
bitmask in the struct inode which disappears once the inode gets
flushed from the inode stack.  And it uses a generic xattr name,
"user.fadvise".

There's no way in *hell* any other file system is likely to adopt such
a broken interface, so why didn't you just use an ioctl to set this
magic f2fs-specific flag?

> I think at some point we just need to stop taking f2fs updates likes
> this.

Well, that's ultiamtely up to Linus.  I'll say that if I were Linus
(and I'm glad I'm not :-), and I saw this in a pull request, I'd
reject it out of hand.  But whether it's worth making a huge fuss and
asking escalating this mess to Linus, we probably should get a bit
more community consensus before taking such a drastic step.

Christian, since you're one of the VFS maintaienrs, what's your
opinion about escalating this to Linus?

					- Ted


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
