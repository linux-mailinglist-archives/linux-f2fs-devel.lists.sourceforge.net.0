Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AiJyLUWNUWpAGAMAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 11 Jul 2026 02:24:37 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6FF73FD50
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 11 Jul 2026 02:24:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=Q2NZGBsT;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=ijpn056h;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=ZrNZbgKm;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=POsAX31I;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YFe5Ux6byIZBaahmbO7YLco/dOSAA4wr9oh1IMe+Piw=; b=Q2NZGBsTvNwkYLWGsWxUzBbTax
	0dpcl67GijwXXabKLPYbQXtDYHMkhi1wDPPZaea0ku4w2iUl5Q91E4rbRyvddSLAHLt0NcKJjoM5P
	PDeIEQ0eHHLXRcVoWYi2y6JZuWWz/HD0VjeiU7DNtxEO2rB+Xg/k2yw5qaBVKTTZ3ElA=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wiLW6-0000KD-C9;
	Sat, 11 Jul 2026 00:24:27 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1wiLW5-0000K6-92
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 11 Jul 2026 00:24:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KFEzUaw/g/UY9rxNioMfIoydpjuxUFKK3/1Tvh4wibs=; b=ijpn056hI6i9ki1US0lh6Oo0MC
 c0H/PSL9utVOsepMZPQz1MfPw8ieODjUyTfXuB2GO3rnUAyhKtR+bdxrnokBtv+DoFfczcPHOLP/a
 wC7zEgP4e/DFopGk79/hIF5injGeD5qYTiP+QOmgu+w3Cd+5C0BOy/ZqJ8w9FuilCVWE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KFEzUaw/g/UY9rxNioMfIoydpjuxUFKK3/1Tvh4wibs=; b=ZrNZbgKm75dJnhlp2UA0FSdVXW
 74lf9XW+gOK5FCdYetT/Y5XlATjzaTajdN4HCxkDYioRyzPb2EKpFhxE75SoOy/4DhpjGQ5cX68pS
 GbCHqTKHHhITNZ7WJy96p6Ch17W3sCOtqqq9V1jsSKXDZAcmxh6HXeoBlUqvEckDQ7JY=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wiLW5-00053w-Hf for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 11 Jul 2026 00:24:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 2C3AE43ADB;
 Sat, 11 Jul 2026 00:24:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC45D1F000E9;
 Sat, 11 Jul 2026 00:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1783729454;
 bh=KFEzUaw/g/UY9rxNioMfIoydpjuxUFKK3/1Tvh4wibs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=POsAX31IWu/ZhM35wRUyOQm/LLL5C+CsYCR/eBwvf0NnHgI3lSsEkv8g9ME3OHu+g
 5YLPzqT+WkhmOO8rKwKOdERg9WIadWU016pZySHkLwMkUZhyAgxHx5KPCcae34Vc+T
 OSfcqyfcZ1GEBpyZ81RULmKvq/ZcxNq7QHO+TFnSvZUML/6mUMAyT23+9zv6Kzei9v
 qM9lH81J0rCzK4N/EeBpMfRGOLtMOSzMlyk/CAzOv72ub0kj8eq38+9T8743cVy0be
 HWIXZvNI+wMHHulBFG4Yqv+wbdW8Jyl1VqYUdj5AyOEImaan/gQ2P6Y3WTUlEk1JlS
 DB5Zm1Ma5jTJA==
Date: Fri, 10 Jul 2026 20:24:12 -0400
To: Keith Busch <kbusch@kernel.org>
Message-ID: <20260711002412.GG1911@quark>
References: <20260710210646.3576365-1-kbusch@meta.com>
 <20260710215328.GE1911@quark> <alF5BHEZ5czyJWaY@kbusch-mbp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alF5BHEZ5czyJWaY@kbusch-mbp>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Jul 10, 2026 at 04:58:12PM -0600, Keith Busch wrote:
 > On Fri, Jul 10, 2026 at 05:53:28PM -0400, Eric Biggers wrote: > > On Fri,
 Jul 10, 2026 at 02:06:41PM -0700, Keith Busch via Linux-f2fs-de [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [172.234.252.31 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1wiLW5-00053w-Hf
Subject: Re: [f2fs-dev] [PATCHv2 0/5] direct-io file extended attributes
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
Cc: axboe@kernel.dk, linux-xfs@vger.kernel.org, brauner@kernel.org,
 aalbersh@kernel.org, Keith Busch <kbusch@meta.com>, cem@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 tytso@mit.edu, jaegeuk@kernel.org, linux-fsdevel@vger.kernel.org, jack@suse.cz,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
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
	RCPT_COUNT_TWELVE(0.00)[14];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS(0.00)[m:kbusch@kernel.org,m:axboe@kernel.dk,m:linux-xfs@vger.kernel.org,m:brauner@kernel.org,m:aalbersh@kernel.org,m:kbusch@meta.com,m:cem@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-block@vger.kernel.org,m:tytso@mit.edu,m:jaegeuk@kernel.org,m:linux-fsdevel@vger.kernel.org,m:jack@suse.cz,m:linux-ext4@vger.kernel.org,s:lists@lfdr.de];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[ebiggers@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:from_smtp,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EB6FF73FD50

On Fri, Jul 10, 2026 at 04:58:12PM -0600, Keith Busch wrote:
> On Fri, Jul 10, 2026 at 05:53:28PM -0400, Eric Biggers wrote:
> > On Fri, Jul 10, 2026 at 02:06:41PM -0700, Keith Busch via Linux-f2fs-devel wrote:
> > > From: Keith Busch <kbusch@kernel.org>
> > > 
> > > The attributes reported through statx are incomplete for applications to
> > > fully know exactly how IO construction is valid or not. The statx call
> > > can report minimum memory alignment and total granularity, but it
> > > doesn't show the underlying gap boundary requirements or max segments
> > > per granule.
> > > 
> > > This series adds the minimum to the extended file attributes through
> > > file_getattr. I hear this is the preferred interface for reporting such
> > > things over adding more fields to statx. In order to get everything
> > > under a single syscall, some of the attributes are duplicated from
> > > statx.
> > 
> > Okay, in v2 we at least now know that the existing statx UAPI was
> > considered.  Could you give a specific real-world example (with the
> > actual values of each parameter) where it's not sufficient?  Without
> > that there isn't really any way to evaluate this proposal.
> 
> Yes, we can consider nvme. This protocol supports two different transfer
> modes called PRP and SGL. PRP requires 4k aligned segments, though you
> can have an arbitrary 4-byte aligned offset at the start. SGL on the
> other hand allows completely arbitrary size and alignments for each
> segment.
> 
> statx reports information sufficient to know that you can have dword
> aligned page offsets for a virtually contiguous buffer, but it doesn't
> report PRP's boundary gap requirement, so applications can't tell if the
> file follows PRP or SGL rules for direct-io.
> 
> And if you have a device using SGL, statx doesn't report the max number
> of sub-sector segments you can submit in a single command.
> 
> This series provides both limits so user space has the complete picture.
> 
> A typical nvme that supports only PRP has a DMA alignment of 4 bytes, a
> dio offset alignment of 4k, and a virtual boundary of 4k.

So each segment's length has to be a multiple of 4k, *and* it has to end
on a 4k aligned memory address?  That implies the segment begins at a 4k
aligned memory address as well, which is just stx_dio_mem_align=4k.

What am I missing?

What is a specific example of an I/O request that you'd like to be able
to submit that the existing UAPI can't declare support for?

> If SGL were supported, there would be no virtual boundary gap, and max
> segments is 256.

Can you elaborate on why DIO users need to know max_segments?

I'm worried about the UAPI duplication, as well as it going to be very
difficult for userspace to correctly use this information.  With just
the two alignments there's at least a chance of them getting it right.
If we throw virt_boundary_mask and max_segments into the mix, I don't
think there's much chance.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
