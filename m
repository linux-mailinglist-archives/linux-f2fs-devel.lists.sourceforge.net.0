Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id W305H5x2UGrozQIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Jul 2026 06:35:40 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF0073726C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Jul 2026 06:35:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=INnc305u;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=JsKo6JmG;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=R1a4MQa7;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=lst.de (policy=none);
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GXtz+pfrB2ub+K3Eel0LVgGsqWdk8Znd5O/MIdwTw74=; b=INnc305utPtGde7WIfqqEESsu9
	sksGerUVaRw4zof4twK42WtB7Ue30m4c1Q16sbHB8Djyps/54Wu2QBxXC6b8NHO/6J+Eu54H6u6P1
	crrY4b87x7ry3drLfM7fiBw95h5H51c0j6RVAIZP1LLpU8h2nXBJ+YMy6489onY7bjis=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wi2xU-00088l-N8;
	Fri, 10 Jul 2026 04:35:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1wi2xT-00088Y-HM
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Jul 2026 04:35:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fY5PWMggrMPn2+fm3k6S1HRDCaH2tGrS2t4uIe0DxHQ=; b=JsKo6JmGJUf7KRFzQxD0TXZEd6
 u2pk0DvxUImXCYF7t76H/91lJA5NQlvKuZPETJ/UBYEvpRyj+LWTCNScQ4XX/VcVitAgN0cVkPbLR
 2PCecHUtLh/CySz4auZ5hX3NwjXGZD9owyQILE1I5hnXVvMqg4mE+q9lskMpqPxANSS4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fY5PWMggrMPn2+fm3k6S1HRDCaH2tGrS2t4uIe0DxHQ=; b=R1a4MQa7HkGbQJ8drk8d+Sk+Hv
 KVAKK17auagjKFxCVdJjGXeXT+opNyOceytEk1Gm55zkMUpcFP5cXhWQ7io1P6LieEEnV5BxYW7eA
 s/sePowKlvFgYORbISRjrSlo0C4uKc9U2hw40DU3UNUeV8mCq1DQFvLGT4LkqVDkumWQ=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wi2xT-0005xR-Ja for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Jul 2026 04:35:28 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id B66A068B05; Fri, 10 Jul 2026 06:35:19 +0200 (CEST)
Date: Fri, 10 Jul 2026 06:35:19 +0200
From: Christoph Hellwig <hch@lst.de>
To: Keith Busch <kbusch@kernel.org>
Message-ID: <20260710043519.GA6205@lst.de>
References: <20260708011843.1036846-1-kbusch@meta.com>
 <20260709071352.GA20180@lst.de> <ak-mQqt-a-jy6ZoV@kbusch-mbp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ak-mQqt-a-jy6ZoV@kbusch-mbp>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jul 09, 2026 at 07:46:42AM -0600, Keith Busch wrote:
 > On Thu, Jul 09, 2026 at 09:13:52AM +0200, Christoph Hellwig wrote: > >
 On Tue, Jul 07, 2026 at 06:18:43PM -0700, Keith Busch wrote: > > > [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
X-Headers-End: 1wi2xT-0005xR-Ja
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
Cc: axboe@kernel.dk, linux-xfs@vger.kernel.org, brauner@kernel.org,
 jack@suse.cz, Keith Busch <kbusch@meta.com>, cem@kernel.org,
 aalbersh@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, tytso@mit.edu, linux-fsdevel@vger.kernel.org,
 jaegeuk@kernel.org, linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.01 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS(0.00)[m:kbusch@kernel.org,m:axboe@kernel.dk,m:linux-xfs@vger.kernel.org,m:brauner@kernel.org,m:jack@suse.cz,m:kbusch@meta.com,m:cem@kernel.org,m:aalbersh@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-block@vger.kernel.org,m:tytso@mit.edu,m:linux-fsdevel@vger.kernel.org,m:jaegeuk@kernel.org,m:linux-ext4@vger.kernel.org,m:hch@lst.de,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	DKIM_MIXED(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:mid,lst.de:from_mime,lists.sourceforge.net:from_smtp,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0DF0073726C

On Thu, Jul 09, 2026 at 07:46:42AM -0600, Keith Busch wrote:
> On Thu, Jul 09, 2026 at 09:13:52AM +0200, Christoph Hellwig wrote:
> > On Tue, Jul 07, 2026 at 06:18:43PM -0700, Keith Busch wrote:
> > 
> > > +	fa->fsx_dio_mem_align = bdev_dma_alignment(bdev) + 1;
> > > +	fa->fsx_dio_offset_align = bdev_logical_block_size(bdev);
> > > +	fa->fsx_dio_read_offset_align = bdev_logical_block_size(bdev);
> > > +	fa->fsx_dio_virt_boundary_align = bdev_virt_boundary_alignment(bdev);
> > > +	fa->fsx_max_segments = bdev_max_segments(bdev);
> > 
> > How is the max_segments value defined in a way that is meaningful to
> > userspace?
> 
> It tells you how many sub-sector vectors you can submit in your
> readv/writev before it needs to add up to a logical block size.
> 
> Ex: 4k logical block size, 4 byte DMA, 256 max segments. You can define
> 4-byte iov's in your command, but you'll hit the max segment count
> before you have a valid IO if they're all that small.

Ah, makes sense.  But besides the missing documentation I think
max_segments is a bit of a misleading name for that.

Something like max_vecs_per_block (although we don't expose blocks
in the UAPI) or max_vecs_per_granularity (I think grammar wants a word
with me for that, though...) might be a bit more suitable.

> > > @@ -145,6 +155,8 @@ static int file_attr_to_fileattr(const struct file_attr *fattr,
> > >  
> > >  	if (fattr->fa_xflags & ~mask)
> > >  		return -EINVAL;
> > > +	if (fattr->fa_pad)
> > > +		return -EINVAL;
> > 
> > How is this related?
> 
> I had to add a padding field to the struct to account for the implicit
> hole in 64-bit and to ensure the struct is the same size for 32-bit.
> It's a reserved field, so we have to ensure the current kernel doesn't
> support any value here in case we define this field for something else
> in the future.

Ah, right.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
