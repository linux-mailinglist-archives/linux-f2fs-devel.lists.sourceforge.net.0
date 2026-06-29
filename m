Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oQV3L2qfQmo5+wkAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Jun 2026 18:38:02 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 582CB6DD673
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Jun 2026 18:38:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b="S/4QANQx";
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=fGBVvItt;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=FPjGkGM3;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=a69pGlB4;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DeUddijGdANcCNj+TQK93BGaXNz5Bz0yOLhm/Hl4VYM=; b=S/4QANQxUBrnDR1LkY04aJzRd+
	8ddzhd2SJ303vtSJ53bnjm/uxzCM8Ap2SH5Pkz8n/AoqvFBzOKSgEB0lVQfR6cGV75AonIeoCmMo6
	HPvnjppt+onHnr3X8MFFfA0NysYDa4nLu03qdFmpuJtEEv5wBoGMs1lRQSkud+beZj00=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1weEzV-0004YD-BU;
	Mon, 29 Jun 2026 16:37:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@kernel.org>) id 1weEzU-0004Y7-7S
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jun 2026 16:37:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7JHewKYa5/FTTPDRStSCJXtjBGuHptHfKbTCR8wXYao=; b=fGBVvIttiGMs4tdX1iyaxCE8qg
 0ZjnStvvepEZ0ANcxywHGIWWJDfxFZPvV0OAMBVMMgnQu1l/WIGK/2piCWUVPydm0SQVDNurfb0Bh
 zhnoqNh/2EmC08ECOCMebP3467u/qbNZRxIfN8s19+Qm4vVdOXVWJ3mb8hVhaq2+Zbz0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7JHewKYa5/FTTPDRStSCJXtjBGuHptHfKbTCR8wXYao=; b=FPjGkGM36xVZXt4GcIybEJQRuZ
 HegJOCCMfgp/JDjbGUFMkpy8yb3qA9Z5Oo+S70DkS4t45v9DWWUKGZXuMB9jbZxKV8mjaZ2R/Dgi8
 o447YJVgHREDWzti5InTWiASw8NMTiv29s4SKR0ugmz7a/e11uuT9tkN3rDYYh7AdZtA=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1weEzR-0006Ji-5l for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jun 2026 16:37:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 4458443887;
 Mon, 29 Jun 2026 16:37:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDAED1F000E9;
 Mon, 29 Jun 2026 16:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782751055;
 bh=7JHewKYa5/FTTPDRStSCJXtjBGuHptHfKbTCR8wXYao=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=a69pGlB4jKPrTsc+I/siJAuw8v/xiP50xITuIxUZv7uXRzugRpCea1B0Ft9FLa01J
 3aSWZqW7Ix0lmLmF3NF9XVKH/1McKzT2BoQQAQiVeyMUYdKl0rMIaY9LVunZjUPSxZ
 vIO3uTlKlAPO84EPoNMo0wWq4aRtDwV4G4evF3ij79hy3HQSLbwMghZRdKc0LRNDcX
 56WWWmKBqEMjtzuSrAQnAv+2IIrm5JiUtd+fNzROy3jU6ie1bTwl2kvgfAmxFK2V6A
 HJiVmvcdfYS6T/oH/9gABsW75rT/07LcWgNF2fIdmju9ZtavTELMm7wgcfr7rQ1Lds
 PDY7gq6Ns8hYQ==
Date: Tue, 30 Jun 2026 00:37:29 +0800
To: Jan Prusakowski <jprusakowski@google.com>
Message-ID: <akKd2IImO7bRjVV2@zlang-mailbox>
Mail-Followup-To: Jan Prusakowski <jprusakowski@google.com>, 
 Christoph Hellwig <hch@infradead.org>, fstests@vger.kernel.org,
 jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
References: <20260622070438.1542638-1-jprusakowski@google.com>
 <ajuLORVplOvEXvnI@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ajuLORVplOvEXvnI@infradead.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Jun 24, 2026 at 12:46:01AM -0700, Christoph Hellwig
 wrote: > On Mon, Jun 22, 2026 at 07:04:38AM +0000, Jan Prusakowski wrote:
 > > On F2FS, generic/064 fails with "extents mismatched before = 1 [...] 
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
X-Headers-End: 1weEzR-0006Ji-5l
Subject: Re: [f2fs-dev] [PATCH] generic/064: allow 50 extents on F2FS after
 fcollapse
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
From: Zorro Lang via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Zorro Lang <zlang@kernel.org>
Cc: Christoph Hellwig <hch@infradead.org>, jaegeuk@kernel.org,
 fstests@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
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
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_MIXED(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	FORGED_RECIPIENTS(0.00)[m:jprusakowski@google.com,m:hch@infradead.org,m:jaegeuk@kernel.org,m:fstests@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[zlang-mailbox:mid,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[zlang@kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 582CB6DD673

On Wed, Jun 24, 2026 at 12:46:01AM -0700, Christoph Hellwig wrote:
> On Mon, Jun 22, 2026 at 07:04:38AM +0000, Jan Prusakowski wrote:
> > On F2FS, generic/064 fails with "extents mismatched before = 1 after =
> > 50" following multiple fcollapse (collapse range) operations.
> > 
> > To ensure crash consistency and checkpoint integrity, F2FS forbids
> > in-place SSR (Summary Standalone Replacement) overwrites on valid
> > checkpointed blocks. When collapse range shifts blocks, F2FS allocates
> > new data pages in LFS mode (out-of-place log writes). As a result,
> > sequential collapse range calls rewrite shifted blocks at new log
> > locations, intentionally leaving the file with 50 extents.
> 
> This sounds odd.  The test allocates a contigous range and then just does
> insert/collapse on it, which should not lead to any new data block
> allocations.  Given that the test works fine on zoned XFS and btrfs
> with strict out of place write policies we know it does not require
> overwriting blocks to work as well.
> 
> So I think something is fishy in f2fs if needs to allocate data blocks
> here.

I have the same question with Christoph. Shouldn't fcollapse in F2FS just
remap the metadata instead of allocating new data blocks?

> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
