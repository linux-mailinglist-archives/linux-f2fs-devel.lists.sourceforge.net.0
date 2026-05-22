Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHZMAMDUD2rIQAYAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 May 2026 06:00:00 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A607E5AE6B9
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 May 2026 05:59:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pGh/Nqy0CLQR9PunREiE26g0CAlGP3lGVOqj+aqceKo=; b=bH/hMniAaJ+/Ot3BP/DSWYq2qC
	tgWNZfxwanewWN1oyb4osn3Lh4hebBQVrHcEPNu8MIsH+yH3G0aK6iUfvqiRd775RncQXbRtRyhCT
	XU53NhgXYaPfIEzcgBuZCDGyiXMkKREFtXO8nvlvUulSRgpF/NSn6v/6bHXjVEannhUk=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wQH3F-00069a-Al;
	Fri, 22 May 2026 03:59:54 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1wQH3E-00069S-6j
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 May 2026 03:59:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H/gaClVuyqlkbt2yK/hC2NqGH4xbGZ4Tk12L6ljTkqY=; b=Q59Cx0dhSUYuJgnowOUs/vuDEk
 SGIR18rmgVmwlGGyu8hsTitVuV/qB5H99qYgWWabmYQjByYAyvbQbm2RcPGBZewVjum6U3+FDnEfv
 Kowhtt1BDgLlhYxYneaq0uJosjy7hcakzztlV9NU3wbV6a2n8AnHGlN3xbnkT0NK4kng=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=H/gaClVuyqlkbt2yK/hC2NqGH4xbGZ4Tk12L6ljTkqY=; b=gEDoAOMBqfBlXQQ2ixp1I5jkZ0
 viEMw3e0cvDweJb9J460Ji/QiepiTzUzHteeL1kGWlfxgHl6AbJ2UQKfwQcXUx5jwUH4JeKS//LtW
 +5vEp7OeDP/GvHPYTXfg+ovXht8Vl9ZwJsb7WUFUgNrM+sPJn0yT3PI7cghmbxj8NCgA=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wQH3A-0005f7-Rv for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 May 2026 03:59:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id E111E41AE6;
 Fri, 22 May 2026 03:59:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D00C1F000E9;
 Fri, 22 May 2026 03:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1779422387;
 bh=H/gaClVuyqlkbt2yK/hC2NqGH4xbGZ4Tk12L6ljTkqY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=TY0ImQzydhJitS5Ddrvd57wmJkpFKQRHHejclNNLrSp/Pt3ZjbuAZXZ6t/deQEjPo
 B6RG70234GDvgoN2I1JfdyuZjEp7N7PcfGq56V+OZOfrgX/Kj3BGrDRD6gMp7QdGaZ
 3XwaJGMmhDnnGJ9avnNUQFntrpWJ2DEMUmgcarvpvvrVDL+W/u+6c95VquTHO8Ly9L
 YhjfG/p75Pd4tjFa4tixP2g+M6KlXSRuVMElS1m+U1YdvCaX4tSQDzEzY1TnKgRNIH
 2N5F82yOOXvzqrpGDeJFwkB/Mn2fFSJD/5ZgU9X/duY2SuPkz1gG+tRoDpon4nQWBc
 dSLeX2oApTWMQ==
Date: Fri, 22 May 2026 03:59:45 +0000
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <ag_UsW_OrlXD9dWX@google.com>
References: <20260409134538.3692605-1-jaegeuk@kernel.org>
 <adhPZxtbZxgU-37v@google.com> <ad30g9xMs9wNJhFb@infradead.org>
 <ad_AVHe7RMnGrGTb@google.com>
 <ad_HwhzlNPUEKQi6@casper.infradead.org>
 <ag7HfNryTmQ-bVIS@infradead.org>
 <20260521155748.GA79343@macsyma-wired.lan>
 <ag9D6_7dttbDGHZ6@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ag9D6_7dttbDGHZ6@casper.infradead.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 05/21, Matthew Wilcox wrote: > On Thu, May 21, 2026 at
 11:57:48AM -0400, Theodore Tso wrote: > > So let me get this straight. This
 is a magic xattr interface which is > > not even persisted in the [...] 
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
X-Headers-End: 1wQH3A-0005f7-Rv
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
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:willy@infradead.org,m:tytso@mit.edu,m:linux-api@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:hch@infradead.org,m:linux-mm@kvack.org,m:linux-fsdevel@vger.kernel.org,m:akailash@google.com,m:christian@brauner.io,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Queue-Id: A607E5AE6B9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 05/21, Matthew Wilcox wrote:
> On Thu, May 21, 2026 at 11:57:48AM -0400, Theodore Tso wrote:
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
> I mean, yes, this API is horrendous.  But it's just another example of
> f2fs thinking it's somehow special and not just enabling large folios
> like other filesystems do.  This hurts everyone, not just people who use
> f2fs.

From the production viewpoint, I raised a concern on setting large folio by
default, since that exhausts lots of high-order pages, which were needed for
essential system services and critical apps.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
