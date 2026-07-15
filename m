Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8XpMGK8OV2r5EgEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Jul 2026 06:38:07 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0B275A7C3
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Jul 2026 06:38:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=dTb50SMl;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=OFvYtAVQ;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=YvkrXm8x;
	dkim=fail ("body hash did not verify") header.d=infradead.org header.s=bombadil.20210309 header.b=u4q7plxZ;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=infradead.org (policy=none)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mt8WLBZAzUzUfKzpGJmnE1Z84RON1gvImPZAh1jfHbY=; b=dTb50SMltMfTlFc89JgePek15l
	ebgN/oUA3velxVkfOPIUpxbZHr9aIasWAkw9BYaFtXqAkHN6OkERW5vo4yCluWVgkT+xa6mGGbBtL
	fCq4aqkRhFV0aYddxVWEofUfLGnBPwpE/d31ApC7zC8UL6qroxDr9NrUxVZHHgWiFBhc=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wjrNb-0004WG-7u;
	Wed, 15 Jul 2026 04:37:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+8a8ca38365b0e2220bfb+8361+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1wjrNZ-0004WA-WA for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 Jul 2026 04:37:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=u9l8GbK/d939mjwNaaNEQLRSf13jlumm11AfM0M2g/E=; b=OFvYtAVQqS4h3Hchb7OOXWRS7e
 reu+yD9Q1G7m3i1OppGnIr4fPRFhvSwbRyCs0dsSbi+dZJ2x2kGJRnkDAjrT2/NGNkf+HqwaZlf6x
 JtfyZd93IVj+R3g38JY9PaNd7VWtu1xxyk3Gx/K0Dd/ek/6HJS3Mfsx9Hm98gf+rgBEI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=u9l8GbK/d939mjwNaaNEQLRSf13jlumm11AfM0M2g/E=; b=YvkrXm8xGo5gCOkgj18vRLrCJG
 I7DBpuqlUgHt/F/6tBq87aAYcmW1rhVQ3THKmrxA7a7dujJ48RYBbNdyMkKzmPpDRamFqOFKY5Pfx
 CMss14qI6c1g1TktzYepNChcX2+gD2HAoYpBAg89evC81yRiNJX+x59CYdLjNarsv73o=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wjrNZ-0000Bi-Cu for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 Jul 2026 04:37:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=u9l8GbK/d939mjwNaaNEQLRSf13jlumm11AfM0M2g/E=; b=u4q7plxZwPseunwhumiGW9Hrt0
 fjsIF0kRFLxuM3vxKj9zGRJ0F9uWcOIIH7dSpCMuxRbpYcb9YMVcNn6znGTML1SNR7IsunPS4e9O/
 qZGv9rj74KEvzk07q0dkHsR4L5LPP/hHubVtiRko5ceSBc5KyuSbwxiU+ou5zWhzn1T8O2n/dyGz5
 alNkVbFQ3lSLmQIp0A0cdzN+WytTwT3LZqzA6zNHRz0B6FcHDNUE59gTXiTupBb/3uvOx15DXqsOW
 IPQmkmhkhj17fRkbI50G76w3UGXJPw5vOvU8s1H9/jNwLLL4CglkEr2ewoL8LlLFq08xEkPGJn8a/
 22ErO57A==;
Received: from hch by bombadil.infradead.org with local (Exim 4.99.1 #2 (Red
 Hat Linux)) id 1wjrNS-0000000Dk9k-41S3;
 Wed, 15 Jul 2026 04:37:46 +0000
Date: Tue, 14 Jul 2026 21:37:46 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Keith Busch <kbusch@kernel.org>
Message-ID: <alcOmorM0Sa0nHHE@infradead.org>
References: <20260710210646.3576365-1-kbusch@meta.com>
 <20260710210646.3576365-4-kbusch@meta.com>
 <alTTRoOEglwuf4vg@infradead.org> <alalpRYxjqtdJhVR@kbusch-mbp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alalpRYxjqtdJhVR@kbusch-mbp>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Jul 14, 2026 at 03:09:57PM -0600, Keith Busch wrote:
 > +void bdev_dio_align(struct block_device *bdev, struct fs_dio_align *align)
 Nit: I'd usually pass the filled in structure before the source of the
 information.
 Content analysis details:   (-0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1wjrNZ-0000Bi-Cu
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
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, brauner@kernel.org,
 jack@suse.cz, Keith Busch <kbusch@meta.com>, cem@kernel.org,
 aalbersh@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Christoph Hellwig <hch@infradead.org>, tytso@mit.edu,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.01 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[infradead.org : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kbusch@kernel.org,m:axboe@kernel.dk,m:linux-block@vger.kernel.org,m:brauner@kernel.org,m:jack@suse.cz,m:kbusch@meta.com,m:cem@kernel.org,m:aalbersh@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:hch@infradead.org,m:tytso@mit.edu,m:linux-fsdevel@vger.kernel.org,m:jaegeuk@kernel.org,m:linux-ext4@vger.kernel.org,m:linux-xfs@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:from_mime,infradead.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DA0B275A7C3

On Tue, Jul 14, 2026 at 03:09:57PM -0600, Keith Busch wrote:
> +void bdev_dio_align(struct block_device *bdev, struct fs_dio_align *align)

Nit: I'd usually pass the filled in structure before the source of the
information.

> +	case FS_IOC_GETDIOALIGN: {
> +		struct fs_dio_align align = {};
> +
> +		bdev_dio_align(bdev, &align);
> +		return copy_to_user(argp, &align, sizeof(align)) ? -EFAULT : 0;
> +	}

... and I'd probably split this into a little helper function as the
ioctl handlers sooner or later become a mess otherwise.

> +	case FS_IOC_GETDIOALIGN: {
> +		struct fs_dio_align	align = {};
> +
> +		if (!S_ISREG(inode->i_mode))
> +			return -ENOTTY;
> +		bdev_dio_align(xfs_inode_buftarg(ip)->bt_bdev, &align);
> +		if (xfs_is_cow_inode(ip))
> +			align.dio_offset_align = xfs_inode_alloc_unitsize(ip);
> +		if (copy_to_user(arg, &align, sizeof(align)))
> +			return -EFAULT;

Same here.

Otherwise this looks good to me.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
