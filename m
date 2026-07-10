Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7H3QNVZiUWqBDgMAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Jul 2026 23:21:26 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE4B73EC2A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Jul 2026 23:21:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=aAWZKKct;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b="lN0O7W/0";
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=QSBsvJN2;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=KvOgHlBC;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CEAJs7ZrHet6mciq8icV9aLf6pmmnZGLtVibFP7jg88=; b=aAWZKKctT6vMdraY2GlUNo+aV8
	dKKVNaj9HmcpoWAoilHiJ6HssSKLpcTt2LTjxsXc8KiE5BhY/oh7kIkUuNSJIctrbdbhIZeFFcWF1
	pzTvXVNvqsw1fkkQPpwS3qf2gn0ykDCRUOD2ATQ05ckz77tloMuA134HNW3h+Rx99xgk=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wiIer-0007Gr-Os;
	Fri, 10 Jul 2026 21:21:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1wiIeq-0007Gk-OO
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Jul 2026 21:21:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5BQm0+FF2Y11s+9pd0PZFqqp7gSzrclRG7lcSdtnYbk=; b=lN0O7W/0efmaom1yqki0NIS/UN
 MchKAzMAAzWqJVwapvAugYCOJcK2JtjBL6a4MQ1dNTPgOfpwQvLxljmG1R8iITLCxoWUWlYWCsVIA
 V6GpURKpWSIe7tm1K+gw0HHCuDTr2ldSsI6ZQupNkrRDEw9Ekt7xr37x/cOMQFJrTi4U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5BQm0+FF2Y11s+9pd0PZFqqp7gSzrclRG7lcSdtnYbk=; b=QSBsvJN2XP6v9OJvxhbQZfnmcd
 vwY4tyT758/VB2QdHjw49POucQqhN0EkFkoR6Z+ZPbxogO2vZ1r9oPww8IwFfdTYG5W1yjgfjr7wW
 HZflJcAjpMm+H2CxgcrAgJts5Ll8mfRbQbC+AWKdSVV3J+G8VsndRUrOd4nVRPQgDEg0=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wiIem-00076M-P7 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Jul 2026 21:21:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id E541561377;
 Fri, 10 Jul 2026 21:21:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A08441F00A3A;
 Fri, 10 Jul 2026 21:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1783718461;
 bh=5BQm0+FF2Y11s+9pd0PZFqqp7gSzrclRG7lcSdtnYbk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=KvOgHlBCxTMds7JGf88d1FDy0YLjxJWrUGe88FDcoMMVE9ACDdP836QVj9SdrDLaH
 9oUVKLK6vXnvpxnivKL9c6lrKEiPWPpdbMBJZPqEeKxpqwG/8BAWbw7nVEXp+KPTOX
 eoAFUhz46f8RgCfAXENpOQlQNb1JLoeB4yEBoMpc13GxbJGSN2zDQUzRE1NhB6942E
 ofjSvALajEVdj5j4mr5F0fZpHsGbErhJ3tLVtzm15rlBKvdS9gBbV2Va18Le0QcA1i
 xxPB08sFruQQkl7l26toezxuDsEf5GWHmXZRKwawskj8LrmxLPaV01HDJDMS1xGgEM
 vCYHjd3jA1Gxw==
Date: Fri, 10 Jul 2026 17:20:58 -0400
To: Jan Kara <jack@suse.cz>
Message-ID: <20260710212058.GA1911@quark>
References: <20260708011843.1036846-1-kbusch@meta.com>
 <20260709071352.GA20180@lst.de>
 <neamg3phll7hjwd765ddtqebtxasdvkoskff75dqzmgzv2xy5i@mf4agr6yoizn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <neamg3phll7hjwd765ddtqebtxasdvkoskff75dqzmgzv2xy5i@mf4agr6yoizn>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jul 09, 2026 at 11:14:47AM +0200, Jan Kara wrote:
 > On Thu 09-07-26 09:13:52, Christoph Hellwig wrote: > > On Tue, Jul 07, 2026
 at 06:18:43PM -0700, Keith Busch wrote: > > > + u32 dio_align = [...] 
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
X-Headers-End: 1wiIem-00076M-P7
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
From: Eric Biggers via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Biggers <ebiggers@kernel.org>
Cc: axboe@kernel.dk, linux-xfs@vger.kernel.org, brauner@kernel.org,
 aalbersh@kernel.org, Keith Busch <kbusch@meta.com>, cem@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 Keith Busch <kbusch@kernel.org>, tytso@mit.edu, linux-fsdevel@vger.kernel.org,
 jaegeuk@kernel.org, linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>
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
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jack@suse.cz,m:axboe@kernel.dk,m:linux-xfs@vger.kernel.org,m:brauner@kernel.org,m:aalbersh@kernel.org,m:kbusch@meta.com,m:cem@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-block@vger.kernel.org,m:kbusch@kernel.org,m:tytso@mit.edu,m:linux-fsdevel@vger.kernel.org,m:jaegeuk@kernel.org,m:linux-ext4@vger.kernel.org,m:hch@lst.de,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCPT_COUNT_TWELVE(0.00)[15];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[ebiggers@kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EDE4B73EC2A

On Thu, Jul 09, 2026 at 11:14:47AM +0200, Jan Kara wrote:
> On Thu 09-07-26 09:13:52, Christoph Hellwig wrote:
> > On Tue, Jul 07, 2026 at 06:18:43PM -0700, Keith Busch wrote:
> > > +		u32 dio_align = ext4_dio_alignment(inode);
> > > +
> > > +		if (dio_align != 0) {
> > 
> > 
> > > +			struct block_device *bdev = inode->i_sb->s_bdev;
> > > +
> > > +			if (dio_align == 1) {
> > > +				fa->fsx_dio_mem_align = bdev_dma_alignment(bdev) + 1;
> > > +				fa->fsx_dio_offset_align = bdev_logical_block_size(bdev);
> > > +				fa->fsx_dio_read_offset_align = bdev_logical_block_size(bdev);
> > > +			} else {
> > > +				fa->fsx_dio_mem_align = dio_align;
> > > +				fa->fsx_dio_offset_align = dio_align;
> > > +				fa->fsx_dio_read_offset_align = dio_align;
> > > +			}
> > 
> > Call bdev_fileattr and override the relevant field as needed?
> > 
> > Question to the ext4 maintainers: why does ext4_dio_alignment
> > affect the in-memory alignment?  If it does so, it should probably
> > also affect the virt boundry alignment..
> 
> I guess that is mostly a historical accident. ext4_dio_alignment() returns
> 1 (iomap alignment is used and that's different for memory and file offset
> alignment), 0 (dio not supported, memory and file offset alignment is
> indeed the same), and blocksize (a special case which can happen for
> fscrypt if it supports dio and where I believe memory alignment
> requirements may be in fact different). I'm adding Eric to CC to answer
> what actual requirements fscrypt has for memory buffers for direct IO. I'd
> expect with inline encryption we would have the same requirements as
> ordinary iomap direct IO and for other code paths I'm not sure... Eric?

Please see Documentation/filesystems/fscrypt.rst:

    The I/O request must be fully aligned to the filesystem block size.
    This means that the file position the I/O is targeting, the lengths
    of all I/O segments, and the memory addresses of all I/O buffers
    must be multiples of this value.  Note that the filesystem block
    size may be greater than the logical block size of the block device.

We go over this about once a year, whenever someone suggests that the
memory alignment requirement is not needed.  blk-crypto-fallback needs
it, the block layer itself needs it, and at least some storage drivers
need it.

To support less memory alignment, we'd need to:

   - Make some fairly complex updates to blk-crypto-fallback to support
     en/decrypting data units split across pages.  Note that there's no
     way to do this with zero overhead on other requests.

   - Update the block layer to not split crypto data units across bvecs,
     regardless of memory alignment.  This also would add more overhead
     to all requests.

   - Test the hardware support on each eMMC and UFS host controller
     individually and opt in the ones that actually correctly handle
     crypto data units split across DMA segments.  We already know it
     does *not* work on at least one.

   - And finally update the filesystems as the last step, not the first.

So far I haven't seen the point.  Yes, applications can benefit from the
lower alignment in theory.  But especially with encryption/decryption,
it isn't at all easy to support.  This has apparently been getting
learned the hard way, as (for example) alignment was initially relaxed
for dm-crypt without testing it, and it had to be reverted
(https://lore.kernel.org/dm-devel/20221103152559.1909328-1-kbusch@meta.com/).

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
