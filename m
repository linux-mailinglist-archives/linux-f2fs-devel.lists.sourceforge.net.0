Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOGvGVXTD2p1QAYAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 May 2026 05:53:57 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 983FA5AE68F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 May 2026 05:53:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FGzJFq7ngC1t8QFXG7PmGlCyCZSCI9CJ6rcNtVx7Bz8=; b=aGR1dWc8OpRmJSbqCnEsxKs22G
	1vAEP692PxLdAsP43ExyQJyFyfo0L3U9L/Bz/SxHo/2Uj01hSvDUItnPvmFvFmYvDXQYvUOKBA8Gb
	aKYK24JuVtePJQJEptlTZc7PIjBIYUgLfdMQRMoch8hpxM695chJofgc7dbWRrfrkt5w=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wQGxI-0006Q9-5f;
	Fri, 22 May 2026 03:53:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1wQGxG-0006Ps-5J
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 May 2026 03:53:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kB9u/fd5oqOyzn/d56rzTMKcyf+Gut0U9mtxblKihAQ=; b=IHZsAAlg0J0a2xYNp01dd2+14s
 6ePRDWCpdf6ci8nkLzlkX/6Atqvt7Ip9T3bcPb1DTmNbxhOlSGXZryoA4KLZVtDRleuYUewvNOMl9
 ugq3vN/s60dR93ibYyYClslDF/9RevY2jupJPxNFHezgsKKAuaNpSac21smPs0VG240o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kB9u/fd5oqOyzn/d56rzTMKcyf+Gut0U9mtxblKihAQ=; b=m35C5Mw656fM3kGiZ/kXCnRJcS
 zg8toDVcRWm9gjWTzv4Yy2D6lIJJWcnBDETOuk4ZSAzDyOgXwdd/UgWisEdBRAoYslyj8jweWoUjn
 sjXX3V9899L6T2IetQuxMT5WygaRj7LaymaDXcsGn00WxpAxWwt5UHZTfTDUqGRTnBlg=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wQGxE-0005D7-Qo for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 May 2026 03:53:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 6502060136;
 Fri, 22 May 2026 03:53:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63CA61F000E9;
 Fri, 22 May 2026 03:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1779422014;
 bh=kB9u/fd5oqOyzn/d56rzTMKcyf+Gut0U9mtxblKihAQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=fld1ypw9APN84jvJm1OOVi3+ZHhpiCqzC8QK3ifg0qLQZgEH8RQwQdH9O+qgnCYrc
 Sl4P80xhdmTewu6/ueUPwz49MOXYxB6UBItK5OTQ0jNrXM+RhuWFzcbq8/AWs+iJAF
 sWwz/T9UUHbDSE6lBJmFzuV/C0rrwCCV/lVPg4G1C8T1NTPTVkDkijsvMe8RDW8nZA
 LZLL7Urvwe4SUWrAFQbjev8VcLMOGCOX2SkHENYXY+5glXf5Ca4NrlNsci9Of0Z5lp
 wuu95IWJCelZn/vv77Jo3iZBmgg6TAwqcTk9PAgwVxz35w1q73aBen2fJCrKohTcUa
 sPyncu6PC/Yqw==
Date: Thu, 21 May 2026 22:53:31 -0500
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <20260522035331.GE5937@quark>
References: <20260409134538.3692605-1-jaegeuk@kernel.org>
 <adhPZxtbZxgU-37v@google.com> <ad30g9xMs9wNJhFb@infradead.org>
 <ad_AVHe7RMnGrGTb@google.com>
 <ad_HwhzlNPUEKQi6@casper.infradead.org>
 <ag7HfNryTmQ-bVIS@infradead.org>
 <20260521155748.GA79343@macsyma-wired.lan>
 <ag_OVwPF49LSZ7rz@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ag_OVwPF49LSZ7rz@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, May 22, 2026 at 03:32:39AM +0000, Jaegeuk Kim wrote:
 > On 05/21, Theodore Tso wrote: > > On Thu, May 21, 2026 at 01:51:08AM -0700, 
 Christoph Hellwig wrote: > > > > You haven't sent a proposal. [...] 
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
X-Headers-End: 1wQGxE-0005D7-Qo
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
From: Eric Biggers via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Biggers <ebiggers@kernel.org>
Cc: Theodore Tso <tytso@mit.edu>, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, Christoph Hellwig <hch@infradead.org>,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 Akilesh Kailash <akailash@google.com>,
 Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
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
	DKIM_MIXED(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:tytso@mit.edu,m:linux-api@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:hch@infradead.org,m:linux-mm@kvack.org,m:linux-fsdevel@vger.kernel.org,m:akailash@google.com,m:christian@brauner.io,s:lists@lfdr.de];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[ebiggers@kernel.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Queue-Id: 983FA5AE68F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 03:32:39AM +0000, Jaegeuk Kim wrote:
> On 05/21, Theodore Tso wrote:
> > On Thu, May 21, 2026 at 01:51:08AM -0700, Christoph Hellwig wrote:
> > > > You haven't sent a proposal.  This is a reply to a reply to a reply of a
> > > > patch.  There's no justification for why f2fs is so special that it
> > > > needs this.  What the hell is going on?  You know this is not the way to
> > > > get code merged into Linux.
> > > 
> > > None of this got properly answers, and this broken interface now landed
> > > in linux-next. IT is offloading a user.* xattr which is free-form
> > > user data with semantics that are weird to say it very nicely.
> > > 
> > > All this was done against the advice in the mailing list discussion.
> > 
> > So let me get this straight.  This is a magic xattr interface which is
> > not even persisted in the file system, but instead sets a 32-bit
> > bitmask in the struct inode which disappears once the inode gets
> > flushed from the inode stack.  And it uses a generic xattr name,
> > "user.fadvise".
> > 
> > There's no way in *hell* any other file system is likely to adopt such
> > a broken interface, so why didn't you just use an ioctl to set this
> > magic f2fs-specific flag?
> 
> I went this route because Android heavily restricts ioctl() permissions
> and we needed broader access for this to work within the framework.

It's straightforward (2 lines I think) to update Android's SELinux
policy to allow an ioctl in all domains.  So that doesn't seem like a
reason to not use an ioctl.  In fact this is actually a reason *to* use
an ioctl, as it shows that ioctls can be allowed/denied independently as
needed, whereas xattrs just use the file write permission.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
