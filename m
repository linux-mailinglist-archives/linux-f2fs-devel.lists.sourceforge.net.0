Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6HpCCqNiEGphWwYAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 May 2026 16:05:23 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF275B5CDE
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 May 2026 16:05:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y24U76ocv8tjgsmVvqDiTMsHeR8yuUusTC8TjnrGAv0=; b=jb+Cu161RGA64F8XsG/fapdNqH
	ylrMAbZU3baTjbJw5KVJjlOQfljxJi+z4spyTD6J5CF2zeuM2jrBL33nR58LJioxXX+Pi8A26WIax
	EM80B+lyCcLcHBphbB4Xj+PprITpNmchfDMF69jj8Kr3osAK/bzG5nKHjUs9S38pimNk=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wQQV0-0006f3-VN;
	Fri, 22 May 2026 14:05:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1wQQUz-0006eq-QV
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 May 2026 14:05:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6Ie8d2ZAmeBfN3v2/FX4Pbrv/H8u5AdvngzMgJa2Mf8=; b=hWYd5pxAy3AO93jDEDkioIMR0A
 X5xQsrcemrm1ipVAqnxvOQJ2vP8+Xf6LYkT963ckfBbwd42xS5DM51p54DRwXz1HHPh3nxkqqALO2
 0YwtdX4zkPX11SJnjwKhpG7mpNXz6RsFAr31/Q/O7tPhbelFHjW3O45kJeSwTUNslkOE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6Ie8d2ZAmeBfN3v2/FX4Pbrv/H8u5AdvngzMgJa2Mf8=; b=hP1jiM7ZLd3eLELpVnkDTzM71a
 w39X+3VFkKW/48DtDv+BiEujBDhmsGbTDb0R3cHaiKQxuctiV6RKKJjYm6nQMxDp8EPtowSVt7NBj
 PSqyFMqy/vwOXFonD2hAXkPqoHiXJMRmqXeOfSt/q8mVs17PsotgsZ/yw10GPw3MOVQ0=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wQQUx-0001ow-HI for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 May 2026 14:05:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id B66A5403FF;
 Fri, 22 May 2026 14:05:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 490CD1F000E9;
 Fri, 22 May 2026 14:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1779458701;
 bh=6Ie8d2ZAmeBfN3v2/FX4Pbrv/H8u5AdvngzMgJa2Mf8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=mxNBYUYpnAWw8vEEAYBoOy4sKcHYDEtI47yZ4w+/tWMhgmVlXSO42ghF4ocDrA/Aa
 qEOD7hdtIQYl+6j50auuLdIOl4bUcsbtT55PmICGuXR7SyMh2ebncRH9j18harNy5s
 qlg/hCMCHbwEcgsALFwbKABqFNiMuxZd3EMh9xh0gVby+C5KXSKR84QkV32rnI8LT2
 0bJ3nVYCp8E/zU5w0An8h/WG1g338+A/m44oNUI74RvF777xYt+qVpBF6hWgaauV0t
 7bt0Lz1+iQNY/540jiITxZLdfliZjCalbs6kr6IUzf0TtDKSgYbup6xFpsqphGMUf0
 SoRh5hhyPT4Fw==
Date: Fri, 22 May 2026 14:04:59 +0000
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <ahBii6bk0KbK_NHV@google.com>
References: <20260409134538.3692605-1-jaegeuk@kernel.org>
 <adhPZxtbZxgU-37v@google.com> <ad30g9xMs9wNJhFb@infradead.org>
 <ad_AVHe7RMnGrGTb@google.com>
 <ad_HwhzlNPUEKQi6@casper.infradead.org>
 <ag7HfNryTmQ-bVIS@infradead.org>
 <20260521155748.GA79343@macsyma-wired.lan>
 <ag9D6_7dttbDGHZ6@casper.infradead.org>
 <ag_UsW_OrlXD9dWX@google.com>
 <ahBSXyOi9b1jxNkX@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ahBSXyOi9b1jxNkX@casper.infradead.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 05/22, Matthew Wilcox wrote: > On Fri, May 22, 2026 at
 03:59:45AM +0000, Jaegeuk Kim wrote: > > On 05/21, Matthew Wilcox wrote: >
 > > On Thu, May 21, 2026 at 11:57:48AM -0400, Theodore Tso wrote: > [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1wQQUx-0001ow-HI
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
X-Rspamd-Queue-Id: 5DF275B5CDE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 05/22, Matthew Wilcox wrote:
> On Fri, May 22, 2026 at 03:59:45AM +0000, Jaegeuk Kim wrote:
> > On 05/21, Matthew Wilcox wrote:
> > > On Thu, May 21, 2026 at 11:57:48AM -0400, Theodore Tso wrote:
> > > > So let me get this straight.  This is a magic xattr interface which is
> > > > not even persisted in the file system, but instead sets a 32-bit
> > > > bitmask in the struct inode which disappears once the inode gets
> > > > flushed from the inode stack.  And it uses a generic xattr name,
> > > > "user.fadvise".
> > > > 
> > > > There's no way in *hell* any other file system is likely to adopt such
> > > > a broken interface, so why didn't you just use an ioctl to set this
> > > > magic f2fs-specific flag?
> > > 
> > > I mean, yes, this API is horrendous.  But it's just another example of
> > > f2fs thinking it's somehow special and not just enabling large folios
> > > like other filesystems do.  This hurts everyone, not just people who use
> > > f2fs.
> > 
> > >From the production viewpoint, I raised a concern on setting large folio by
> > default, since that exhausts lots of high-order pages, which were needed for
> > essential system services and critical apps.
> 
> Random fears or actual data?

This was a quick buddyinfo right after booting the device.

Before:
Node 0, zone   Normal  22684  42284  28704  16901   9515   4566   1854    673    181     36    758

After disabling EROFS large folio:
Node 0, zone   Normal   8486   4732   2175   1161    697    272     82     19      3      1    856

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
