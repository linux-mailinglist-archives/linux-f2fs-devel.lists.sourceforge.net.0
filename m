Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PIKsOFTTVGqNfQAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Jul 2026 14:00:20 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8672C74AA64
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Jul 2026 14:00:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=ZrCXTjFA;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=E7EOIpGl;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=amPfWIqp;
	dkim=fail ("body hash did not verify") header.d=infradead.org header.s=bombadil.20210309 header.b=dCaEjrZ6;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=infradead.org (policy=none)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cRTqO8vBHemVrYoX0QUCHosw5P78eYA1d7Rut2nCrPI=; b=ZrCXTjFAG4SxfrjIiQ3F3h+nNO
	vCAuaaIXTvqst+0p5itWP+Rg0KDgQjxff2tA/me6NFZMSjv2jSg+u67zOHG/EA7GvtYQAb9j3zEsW
	BORw/1LFsy9MLiEESNxnPBVZaXGPZeFomSb8DwXHGzfOM1A2zWmPwCdYPnpPiIBoyhd8=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wjFKY-0000lG-VS;
	Mon, 13 Jul 2026 12:00:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+55c33cd1421391a2a6eb+8359+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1wjFKW-0000l8-Ju for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Jul 2026 12:00:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tQYMjoiTYjYW1olQ44tmxQBfF3EMsN52ax3nXVxNLJk=; b=E7EOIpGl0cVfAdbDtzOTWV+rBQ
 ajQxyOsa9pX24QcdW+/3mBr5NNQgtbcqxVDzR2bi+Nk6mn06vrFXDPcBvwXd6o9o9yDvK4wqFje4H
 ZqVdgIefSB16ELdUjSCkMeMWmXytiiFtnglRTwVuGHLHirqDY26jEloW4Z05nIHbk9xA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tQYMjoiTYjYW1olQ44tmxQBfF3EMsN52ax3nXVxNLJk=; b=amPfWIqpoOBOzU8vxjw7PR7uVv
 wPDk6wF3hdR7dRCpkN40gicP7ylLYerCXnx+vUmAgO+2LdG5AoqesX4xvDgf31Zzbc1yuEaY93Div
 SUCOKcNFUdRE6BBlXaZv9SyBOJB4+TPj6A8cdt090jgWgBwchq7sY0aXwsVW4/+v6FcM=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wjFKV-0000XJ-Io for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Jul 2026 12:00:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=tQYMjoiTYjYW1olQ44tmxQBfF3EMsN52ax3nXVxNLJk=; b=dCaEjrZ6fLHwI0XLAxmjHgIYZa
 1IBSKVZzD0flrK2WUENb+JAbS3Rf02/YVO+5rgeQPlYKpYOvM9aK7/3JyShsIq2HX4RfbczOToBAM
 lRdB60hf8h2XcdDZehKZqEBoiFuKqe2Ew0jscy71bjR4ya1leGMkKBpbMU7YNLHFl3rEvU3uRdq6R
 eKTAfppC2AtOLbEy0ijYImRsh8dcqH0bojGZqwbdn5oXNLUtW8P59VEt4yRBq9KsLlvG+qY27oBh6
 5lRKqIx1aVStoEZXh182roeTFj3Bm4Ec+TMUIT8eQvcIkTjKgfeNpinZ6Jd9HVYNL690yV30dTqLD
 tLExMRHw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.99.1 #2 (Red
 Hat Linux)) id 1wjFKQ-000000096Qi-0M9M;
 Mon, 13 Jul 2026 12:00:06 +0000
Date: Mon, 13 Jul 2026 05:00:06 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Keith Busch <kbusch@meta.com>
Message-ID: <alTTRoOEglwuf4vg@infradead.org>
References: <20260710210646.3576365-1-kbusch@meta.com>
 <20260710210646.3576365-4-kbusch@meta.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260710210646.3576365-4-kbusch@meta.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Jul 10, 2026 at 02:06:44PM -0700, Keith Busch wrote:
 > +static void > +xfs_fill_fsxattr_dio( > + struct xfs_inode *ip, > + int
 whichfork, > + struct file_kattr *fa) > +{ > + struct xfs_buftarg [...] 
 Content analysis details:   (-0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1wjFKV-0000XJ-Io
Subject: Re: [f2fs-dev] [PATCHv2 3/5] xfs: report direct io attributes
 through file_getattr
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
Cc: axboe@kernel.dk, linux-xfs@vger.kernel.org, brauner@kernel.org,
 jack@suse.cz, cem@kernel.org, aalbersh@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 Keith Busch <kbusch@kernel.org>, tytso@mit.edu, linux-fsdevel@vger.kernel.org,
 jaegeuk@kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.01 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[infradead.org : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kbusch@meta.com,m:axboe@kernel.dk,m:linux-xfs@vger.kernel.org,m:brauner@kernel.org,m:jack@suse.cz,m:cem@kernel.org,m:aalbersh@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-block@vger.kernel.org,m:kbusch@kernel.org,m:tytso@mit.edu,m:linux-fsdevel@vger.kernel.org,m:jaegeuk@kernel.org,m:linux-ext4@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[hch@infradead.org,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,infradead.org:s=bombadil.20210309];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hch@infradead.org,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,infradead.org:-];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:from_smtp,lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim,infradead.org:from_mime,infradead.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8672C74AA64

On Fri, Jul 10, 2026 at 02:06:44PM -0700, Keith Busch wrote:
> +static void
> +xfs_fill_fsxattr_dio(
> +	struct xfs_inode	*ip,
> +	int			whichfork,
> +	struct file_kattr	*fa)
> +{
> +	struct xfs_buftarg *target;

Same alignment for the variables as for the arguments.

> +
> +	if (whichfork != XFS_DATA_FORK || !S_ISREG(VFS_I(ip)->i_mode))
> +		return;

Move this check to th caller?  Although this and similar check in
the other file system patches miss block device nodes, for which we'd
need a special case, or one in the caller to override the attrs.

Or maybe using the file attr for this isn't actually a good idea,
and we should do an ioctl instead which automatically gets routed to
the block device fops?

> +	target = xfs_inode_buftarg(ip);

.. and initialize the variable at declaration time?



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
