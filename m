Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MJw4CRaXUWolGgMAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 11 Jul 2026 03:06:30 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 403E073FE80
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 11 Jul 2026 03:06:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=cyIoZjvX;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=DU6qmJkv;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=U1TALf+5;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=mMcBEoZt;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JF0ENnA424znq0FS2kHESpx4irtS+o6sJgHt+ecFBUQ=; b=cyIoZjvXNQBQ0wJRwXN5hjIAdp
	zNwl+QoA6R16GDoqqsaaUvkFMpj2+RNhCzjjv1eTGy7usxY3KpbPmUgj0IRwYqpNOjpSvO9D+o97X
	SA4v/7qL1tRQimAvZheYz2oL2uROG2lr7IWjnm9rgIkrVzTwgtko3+U06/N+dxYoLzQE=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wiMAd-0003xH-Ed;
	Sat, 11 Jul 2026 01:06:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <kbusch@kernel.org>) id 1wiMAb-0003x0-KX
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 11 Jul 2026 01:06:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Z1JsX9peK+DaHBSGxqPCV8pzR9YubUyAgMDuHcT34Uw=; b=DU6qmJkvpeDQKlM5F8nRv8d7cD
 N4NM+zIL7rN7uSZB4B/DE9rkNspQ+P87nbGwLUbl9PlOpmemAOkn4tkRdPqhoBOEhCuoDL5G0qdFg
 NQXk+Ho1yJJRVTrpfwynyQG+hUvJwIw6JOlufns2r2+8TQbZqBnDwpbMgyMZBMztcCY4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Z1JsX9peK+DaHBSGxqPCV8pzR9YubUyAgMDuHcT34Uw=; b=U1TALf+5SgJwbsYaEA0ZfGYdOR
 dnjbFXQ3h5XbcU5Ee1wdS7GrGAPDfp18EgTt34JXyVm2CIqvQIMCX+Uw3YgTsCCS2c+N8yjtjlNIc
 WDzJ+pDFckc7f3c6zCaduMs2rVLcICmKrlN/Mwns5PL5lWbYYPtt6+tN5UE6/qmLqkk0=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wiMAb-0006lb-4F for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 11 Jul 2026 01:06:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 9430A42EAF;
 Sat, 11 Jul 2026 01:06:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E78EB1F000E9;
 Sat, 11 Jul 2026 01:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1783731971;
 bh=Z1JsX9peK+DaHBSGxqPCV8pzR9YubUyAgMDuHcT34Uw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=mMcBEoZti/qlk5q85oCFNhg5hB8rgjzcrSp/g4Xr2T00+GghMjSubevYIYhM1p2wQ
 BwzqSGg0PLLZqtHYZbiWJyu5RyWKnki0m33X3fEv3MaevCjrwxQ7sVQvQq1EYzolz1
 M444jLc6MVu8hc/ctEXaimlk2Ifs/vpZPDlQmMAQxPxWvn3MdGToQCueC4DCdUfuAM
 yX3NrZfLS7JjMtvb7JXLpgbary8SVf7CON43//x9HZYY0xusUWHToLk7gGxSMXQxfX
 bzV9k7CIq7zZUx+3tzO2djkQJ5emGczx8/WnRDFLJdL8o+4b2Rx1KLg5uTxmEvQpmC
 Fxyb0jrmT9Ysw==
Date: Fri, 10 Jul 2026 19:06:09 -0600
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <alGXAan8P6mnbvvz@kbusch-mbp>
References: <20260710210646.3576365-1-kbusch@meta.com>
 <20260710215328.GE1911@quark> <alF5BHEZ5czyJWaY@kbusch-mbp>
 <20260711002412.GG1911@quark>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260711002412.GG1911@quark>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Jul 10, 2026 at 08:24:12PM -0400, Eric Biggers wrote:
 > On Fri, Jul 10, 2026 at 04:58:12PM -0600, Keith Busch wrote: > > dio offset
 alignment of 4k, and a virtual boundary of 4k. > > So each s [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1wiMAb-0006lb-4F
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
From: Keith Busch via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Keith Busch <kbusch@kernel.org>
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
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:axboe@kernel.dk,m:linux-xfs@vger.kernel.org,m:brauner@kernel.org,m:aalbersh@kernel.org,m:kbusch@meta.com,m:cem@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-block@vger.kernel.org,m:tytso@mit.edu,m:jaegeuk@kernel.org,m:linux-fsdevel@vger.kernel.org,m:jack@suse.cz,m:linux-ext4@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCPT_COUNT_TWELVE(0.00)[14];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
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
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[kbusch@kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 403E073FE80

On Fri, Jul 10, 2026 at 08:24:12PM -0400, Eric Biggers wrote:
> On Fri, Jul 10, 2026 at 04:58:12PM -0600, Keith Busch wrote:
> > dio offset alignment of 4k, and a virtual boundary of 4k.
> 
> So each segment's length has to be a multiple of 4k, *and* it has to end
> on a 4k aligned memory address?  That implies the segment begins at a 4k
> aligned memory address as well, which is just stx_dio_mem_align=4k.
> 
> What am I missing?

I'm apparently poorly explaining PRPs, but I hear this is a common
experience.

Simply put, any virtually contiguous buffer that starts at a dword
aligned address is a valid io vector, no matter how many pages it spans.
It doesn't matter where it starts or where it ends, but every page in
the middle obviously starts and ends on their page boundary.

Simple case: pread/pwrite. You can consult statx to know you can provide
any dword aligned buffer with an aligned length, and that's a valid
direct IO.

What I'm trying to enable here is the vectored preadv/pwritev type paths
for hardware that don't need to subscribe to PRP constraints.
 
> What is a specific example of an I/O request that you'd like to be able
> to submit that the existing UAPI can't declare support for?

I want to support NVMe SGL. This allows virtually *discontiguous*
segments that we currently can't distinguish with what statx reports.
I'm trying to report limits that let applications know what constraints
they're dealing with.

> > If SGL were supported, there would be no virtual boundary gap, and max
> > segments is 256.
> 
> Can you elaborate on why DIO users need to know max_segments?

 * Logical block is 4k.

 * DMA granule is 4 bytes.

 * Max segments is 256.

That's very typical NVMe device contraints under SGL capabilities with
the linux driver.

You can provide 4 byte vectors as needed, but you'll hit the max
segments limit before you have a valid IO if they're all that small.
The average size needs to be larger, so we need to communicate that
somehow.

To be clear, I'm not interested in trying to enable applications
dispatching thousands of 4-byte vectors to do an IO. That's a stupid
application. The applications I'm trying to enable have unpredictable
offsets such that a tiny fraction of vectors are indeed that small, but
that's not a typical vector for the payload. But I can't enable just
some without generically enabling all.

> I'm worried about the UAPI duplication, as well as it going to be very
> difficult for userspace to correctly use this information.  With just
> the two alignments there's at least a chance of them getting it right.
> If we throw virt_boundary_mask and max_segments into the mix, I don't
> think there's much chance.

The blktests framework test case "block/043" does this with great
success with these exact parameters, but it takes these paramters from
the sysfs attributes. The same test works with filesystems too, but I
haven't gotten around to porting it to fstests because it's gating on
having this series.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
