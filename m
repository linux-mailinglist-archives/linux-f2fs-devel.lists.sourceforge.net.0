Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CM5sMFBP2GnRbggAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Apr 2026 03:16:00 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3533D109D
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Apr 2026 03:16:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tM8pC5cmXbc85hWM06iy4mLYT61uQNuiLVrrOtqSTpM=; b=DEDbNk2p0Q0uuPz1m4ssyj51jg
	6FmhgJs/vFTQLO7WC0zg/ebw2l98GiytkmUhZFJIOiW5u5/eLxxvQd4dhPtU5s2ETbiZIhElCYP6a
	bZXjXX/FmIZlga/gVdeE4XjOvKt+lwAe3aoS2FcHyhd2HPy7irvXUB/Qp5Le7ktBlhdI=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wB0TL-0005L1-DR;
	Fri, 10 Apr 2026 01:15:47 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1wB0TK-0005Ku-24
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Apr 2026 01:15:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LNrDbGljjL6XxcePl/ySBhhGzOYbseAX/BfHZ0vVBDs=; b=Hi6Yjmp5lrv1+9oSX6EGrd86tH
 AnlsYBfCX8fVCPpZvC54W4445M2o9zKQrC2DwEgOsk580DS5T6+Qrya9cTs6zfVDI1Fz5SKhRISmj
 cywq+1+x34jpILwezAWphH77qmzh7E3Qj+p2JklUSvExMZxKL1BqV+OPoCqJzFa4vJl0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LNrDbGljjL6XxcePl/ySBhhGzOYbseAX/BfHZ0vVBDs=; b=PJWHL5ONNU+36UpZJQBzPE63ZQ
 7+FJXisiblZQtEJi8JA045GpAhnUubHg/y2Bwv/e4A4uSwNjXY8Yrrlq7S3CL+Cp3N2LUqJukqFfZ
 tOjsxtKDMNWqF25HwYMZF0p+YGLEoixQSne68CiOFtHz0CpamEvWMqVaQ7XjvkD8Kcog=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wB0TJ-0006uw-Hr for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Apr 2026 01:15:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A3FEA60103;
 Fri, 10 Apr 2026 01:15:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C8C2C4CEF7;
 Fri, 10 Apr 2026 01:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1775783734;
 bh=82GZ4KNob8JYqSsZTREpcrcft6ZYfucxtR+SCLEQTTo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Nqkeab3WAwCYXh0hgzomJb+0jNUlUxcdx/ESJpMn9jt2YiCXrMO4oVqcDnwSW0FkX
 DekQwDHj+mA6oIA31uB2wCKKXkQDU3+pWHvpzL8RvIEPRhtcvLtGER5884Un8RpVwn
 YJNiwopI15oJxtrHkrRpzV+qRrx1+wmpU+kRHsN6B5DsWGon8ceWucuyxYv2Ov6iDk
 EiSQb93ea0zpq9A5HYRbfiwirLyxw7fdejtVRhP3mLOTEbsXQDnK1B2+nyGUREu3lw
 P3reDXvVmaLVcMSs3oOm+EsZ4ABLwbkWD3V7PoJug8rewBhUj5cFT7LM/k2MYA+nU5
 i2+DB5HR8DN1A==
Date: Fri, 10 Apr 2026 01:15:32 +0000
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <adhPNLtbAlqI8F3l@google.com>
References: <20260406154940.2407853-1-jaegeuk@kernel.org>
 <adaasm42rLxRY2GN@google.com> <adc7yo1_sr_eeV33@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <adc7yo1_sr_eeV33@infradead.org>
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 04/08, Christoph Hellwig wrote: > [adding back fsdevel
 and mm to the discussion] > > On Wed, Apr 08, 2026 at 06:13:06PM +0000, Jaegeuk
 Kim wrote: > > Let's check mmap writes onto the large folio, s [...] 
 Content analysis details:   (-0.7 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1wB0TJ-0006uw-Hr
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: do not support mmap write for large
 folio
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
Cc: linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FORGED_RECIPIENTS(0.00)[m:hch@infradead.org,m:linux-fsdevel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
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
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[jaegeuk@kernel.org]
X-Rspamd-Queue-Id: 5E3533D109D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 04/08, Christoph Hellwig wrote:
> [adding back fsdevel and mm to the discussion]
> 
> On Wed, Apr 08, 2026 at 06:13:06PM +0000, Jaegeuk Kim wrote:
> > Let's check mmap writes onto the large folio, since we don't support writing
> > large folios.
> 
> What does this fix?  As state in the previous round of discussion f2fs
> only support large folios for immutable files, how do you get ->mkwrite
> called for them.

I'm approaching this as a safeguard first, since in any buggy case, this will
crash the filesystem.

> 
> The only way I can think of that is when clearing the immutable flag,
> but simply rejecting writes with SIGBUS after that seems like it's
> breaking the expected API, and I don't see handling for normal writes
> after that either.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
