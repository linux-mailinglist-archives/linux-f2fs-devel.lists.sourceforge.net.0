Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id P1LBFFcOUWoJ+wIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Jul 2026 17:23:03 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8300173C310
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Jul 2026 17:23:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=mahmT565;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=IL9uTMUq;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=DYBil2bz;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=UClDCNbC;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mPh+DFoenHsFIvcdQKyvZlswHWOX0HBtMWUULwszOlI=; b=mahmT565vuDf71L0r0/vfT2U/C
	/LJGl7P06Erj/zwFvBxNcgPlKXivpigD4VnvO8ccx4mYu4rYIwJzQ3LY/UnjQ+/wcVOKwaPuy2Yir
	CDD/0VEBzqWYtLaqWi2KL0wSBf/QKCbc4gmIlfkRWYZ/lRxqozeshyUigeaVapJ6ZkZk=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wiD3s-0000rv-DH;
	Fri, 10 Jul 2026 15:22:45 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <kbusch@kernel.org>) id 1wiD3r-0000ro-DH
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Jul 2026 15:22:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BZBmbz6+BQI2Kzh1iUDOvyORAvj/yICrOCZDo+Rp0kw=; b=IL9uTMUqhibIT3/kamhQhHc9bu
 J2b+FQKqqL534/aeRAZHSdTMGja0rVaqXmnR2QfJzjlfQv3H8Cby5taIbBEWXy6AzToUmfJxrkbkg
 6rN39IZYXDrUGSnbdyTgy5OpEZhh2/ChK9/omD9T2Epg8RYPrTNgy/XrS396fjCj1Wa4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BZBmbz6+BQI2Kzh1iUDOvyORAvj/yICrOCZDo+Rp0kw=; b=DYBil2bzgRkxLxnGT0rA0EXYKb
 Nslm20purA1e9vdOsRElLvfZ4QftWOWDlIUPpUM1rtayyjFojSC/mwDZoZzqfYJTOuyfv4f+6iKpK
 Dg+QOUbdEQEJ2zwpEmEO2dc5ZPVUab1Hdzqph8MTl3aXXMdXn0IryxwiBYJrwGsFwA78=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wiD3r-0005xM-NM for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Jul 2026 15:22:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 5D92A407E9;
 Fri, 10 Jul 2026 15:22:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B83291F000E9;
 Fri, 10 Jul 2026 15:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1783696953;
 bh=BZBmbz6+BQI2Kzh1iUDOvyORAvj/yICrOCZDo+Rp0kw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=UClDCNbCQfNVRQhm1i8d0xb29cuN0tYD1gSYn7nGQxcwS7UY+Fj+hD+7dJGoKu6Zg
 5dYucbOrXi+v7T24cB56Kj8GAb1o3zBc9NpvUvN5qN3+YfFzwGuu96lk54Lzoit87D
 P/hGUwB9WQjR82lZLQWwQitL+/Bv5Y8BZH6R/S5wyEVMfzdFEcixq45ps9RC5QDPjc
 iSoPzj/1r4B8qaXm++3azwoC4Yb8dd/t/FKEfXkTGZYSqWjTHmfxIksx4hz8WTp+TP
 xjssz+2VAgXF7xqPMcYBg54aH6eutuE3PC4QXMK3tooi3O/AVmgdjEBLUn+HPAXBxF
 9d+WnwGLCmO8A==
Date: Fri, 10 Jul 2026 09:22:31 -0600
To: Christoph Hellwig <hch@lst.de>
Message-ID: <alEON9EQ3BAX_D35@kbusch-mbp>
References: <20260708011843.1036846-1-kbusch@meta.com>
 <20260709071352.GA20180@lst.de> <ak-mQqt-a-jy6ZoV@kbusch-mbp>
 <20260710043519.GA6205@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260710043519.GA6205@lst.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Jul 10, 2026 at 06:35:19AM +0200, Christoph Hellwig
 wrote: > On Thu, Jul 09, 2026 at 07:46:42AM -0600, Keith Busch wrote: > >
 On Thu, Jul 09, 2026 at 09:13:52AM +0200, Christoph Hellwig wrote: [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1wiD3r-0005xM-NM
Subject: Re: [f2fs-dev] [PATCH] fs: report direct io constraints through
 file_getattr
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
 jack@suse.cz, Keith Busch <kbusch@meta.com>, cem@kernel.org,
 aalbersh@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, tytso@mit.edu, linux-fsdevel@vger.kernel.org,
 jaegeuk@kernel.org, linux-ext4@vger.kernel.org
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
	TO_DN_SOME(0.00)[];
	DKIM_MIXED(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCPT_COUNT_TWELVE(0.00)[14];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:axboe@kernel.dk,m:linux-xfs@vger.kernel.org,m:brauner@kernel.org,m:jack@suse.cz,m:kbusch@meta.com,m:cem@kernel.org,m:aalbersh@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-block@vger.kernel.org,m:tytso@mit.edu,m:linux-fsdevel@vger.kernel.org,m:jaegeuk@kernel.org,m:linux-ext4@vger.kernel.org,s:lists@lfdr.de];
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
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[kbusch@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kbusch-mbp:mid,lists.sourceforge.net:from_smtp,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8300173C310

On Fri, Jul 10, 2026 at 06:35:19AM +0200, Christoph Hellwig wrote:
> On Thu, Jul 09, 2026 at 07:46:42AM -0600, Keith Busch wrote:
> > On Thu, Jul 09, 2026 at 09:13:52AM +0200, Christoph Hellwig wrote:
> > > On Tue, Jul 07, 2026 at 06:18:43PM -0700, Keith Busch wrote:
> > > 
> > > > +	fa->fsx_dio_mem_align = bdev_dma_alignment(bdev) + 1;
> > > > +	fa->fsx_dio_offset_align = bdev_logical_block_size(bdev);
> > > > +	fa->fsx_dio_read_offset_align = bdev_logical_block_size(bdev);
> > > > +	fa->fsx_dio_virt_boundary_align = bdev_virt_boundary_alignment(bdev);
> > > > +	fa->fsx_max_segments = bdev_max_segments(bdev);
> > > 
> > > How is the max_segments value defined in a way that is meaningful to
> > > userspace?
> > 
> > It tells you how many sub-sector vectors you can submit in your
> > readv/writev before it needs to add up to a logical block size.
> > 
> > Ex: 4k logical block size, 4 byte DMA, 256 max segments. You can define
> > 4-byte iov's in your command, but you'll hit the max segment count
> > before you have a valid IO if they're all that small.
> 
> Ah, makes sense.  But besides the missing documentation I think
> max_segments is a bit of a misleading name for that.
> 
> Something like max_vecs_per_block (although we don't expose blocks
> in the UAPI) or max_vecs_per_granularity (I think grammar wants a word
> with me for that, though...) might be a bit more suitable.

The granularity it has to add up to is defined by the
fsx_dio_offset_align attribute. This is a bit long, but to make that
relationship clear, how about:

  fsx_dio_max_vecs_per_offset_align


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
