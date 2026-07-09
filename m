Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id G/wuGqlmT2oTgAIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 09 Jul 2026 11:15:21 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C13172EC85
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 09 Jul 2026 11:15:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=ZJfUoi5j;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=jhfPA+np;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=ZoZgi0rC;
	dkim=fail ("body hash did not verify") header.d=suse.cz header.s=susede2_rsa header.b=UHPw56Oy;
	dkim=fail ("body hash did not verify") header.d=suse.cz header.s=susede2_ed25519 header.b=IA7TR7wq;
	dkim=fail ("body hash did not verify") header.d=suse.cz header.s=susede2_rsa header.b=UHPw56Oy;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0U1fM4iU6yolHjm2CHH38nJRrTeLy+L4zP/xYvv8Exg=; b=ZJfUoi5jssati/B0Fh/uhciq2g
	5A7Yq84l5iLDPTgoeWZ6babhoXa9V9wFpxj36xW3H62bYusQLBvyVwNwBEdFgqyEG2Mp808S2XS7x
	jHZuDU0Xq61/3cn+aI4BIEfcjCJ+vwDelNjIe2MHckHMoWssJeX4wb241F4nnHX3AuAM=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1whkqe-0001pr-4K;
	Thu, 09 Jul 2026 09:15:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1whkqR-0001oT-Vw
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 Jul 2026 09:15:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ay+n3JYalJzW9RHZobonYNYRCZVSzmMR1IGHyNCWzyY=; b=jhfPA+npp8UgU2LaTz7Pte7Qmk
 J6zE1FCgKIQq/2mr4ResnuZoGFqdtB+MOCZF6nl1E0SH2sAO/eIu+WEq1mAaxEsX3g1+5GqU1hxdu
 zi6fgcOzk888tsLL53chLNdVu9ZzyUhKtxYFOgVqQgKVwrSX8C9jzRgx++uM20jMKEpo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ay+n3JYalJzW9RHZobonYNYRCZVSzmMR1IGHyNCWzyY=; b=ZoZgi0rC2+NYJFwjklqFGGGUj0
 YeAWUng4P7UMKjibAqc3ewk0GRzUc2YPpXoRSFOJPXiXepaD0rsyktEfTV/fGGM37YOEIoF2Fro20
 FZoPolo8IFJrAW1NJ8AfHNwDroWgBAfvAaSOm1dv2QbQBRPvLu1CiWzLpkVrjH6Yp2xU=;
Received: from smtp-out1.suse.de ([195.135.223.130])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1whkqQ-0007Vv-RU for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 Jul 2026 09:15:00 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3501F7609E;
 Thu,  9 Jul 2026 09:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1783588492; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ay+n3JYalJzW9RHZobonYNYRCZVSzmMR1IGHyNCWzyY=;
 b=UHPw56OyPmIjWA+2nG7gQU0hzHfzejIpg4uq9GjDmPFCk4bR3mdzIyAkSg/3eNos7ROXLz
 ENHztyCFutKlONYqBVszG7usJBWEhYg0vWAHWdVYg+VC97ed9rKMPdboMhTg/yC2oP9aNE
 ORoYQUf1OXjTBCNPffkjBfYcLkpilKQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1783588492;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ay+n3JYalJzW9RHZobonYNYRCZVSzmMR1IGHyNCWzyY=;
 b=IA7TR7wqvGR4RJHVc0YWNq4bzAOoEHUQx3XnyccXR22re+Pj9Z7TBoPaIME4o0d2iquKWo
 SEIiuus8l2UVxCBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1783588492; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ay+n3JYalJzW9RHZobonYNYRCZVSzmMR1IGHyNCWzyY=;
 b=UHPw56OyPmIjWA+2nG7gQU0hzHfzejIpg4uq9GjDmPFCk4bR3mdzIyAkSg/3eNos7ROXLz
 ENHztyCFutKlONYqBVszG7usJBWEhYg0vWAHWdVYg+VC97ed9rKMPdboMhTg/yC2oP9aNE
 ORoYQUf1OXjTBCNPffkjBfYcLkpilKQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1783588492;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ay+n3JYalJzW9RHZobonYNYRCZVSzmMR1IGHyNCWzyY=;
 b=IA7TR7wqvGR4RJHVc0YWNq4bzAOoEHUQx3XnyccXR22re+Pj9Z7TBoPaIME4o0d2iquKWo
 SEIiuus8l2UVxCBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2BD86779AA;
 Thu,  9 Jul 2026 09:14:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id FJusCoxmT2paMgAAD6G6ig
 (envelope-from <jack@suse.cz>); Thu, 09 Jul 2026 09:14:52 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id C4D2BA12D7; Thu, 09 Jul 2026 11:14:47 +0200 (CEST)
Date: Thu, 9 Jul 2026 11:14:47 +0200
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <neamg3phll7hjwd765ddtqebtxasdvkoskff75dqzmgzv2xy5i@mf4agr6yoizn>
References: <20260708011843.1036846-1-kbusch@meta.com>
 <20260709071352.GA20180@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260709071352.GA20180@lst.de>
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -4.01
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu 09-07-26 09:13:52, Christoph Hellwig wrote: > On Tue, 
 Jul 07, 2026 at 06:18:43PM -0700, Keith Busch wrote: > > + u32 dio_align
 = ext4_dio_alignment(inode); > > + > > + if (dio_align != 0) { > > [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1whkqQ-0007Vv-RU
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
 linux-block@vger.kernel.org, Keith Busch <kbusch@kernel.org>, tytso@mit.edu,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, linux-ext4@vger.kernel.org,
 Eric Biggers <ebiggers@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.61 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DMARC_NA(0.00)[suse.cz];
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:axboe@kernel.dk,m:linux-xfs@vger.kernel.org,m:brauner@kernel.org,m:jack@suse.cz,m:kbusch@meta.com,m:cem@kernel.org,m:aalbersh@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-block@vger.kernel.org,m:kbusch@kernel.org,m:tytso@mit.edu,m:linux-fsdevel@vger.kernel.org,m:jaegeuk@kernel.org,m:linux-ext4@vger.kernel.org,m:ebiggers@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jack@suse.cz,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:from_mime,mf4agr6yoizn:mid,suse.com:email];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jack@suse.cz,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,suse.cz:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8C13172EC85

On Thu 09-07-26 09:13:52, Christoph Hellwig wrote:
> On Tue, Jul 07, 2026 at 06:18:43PM -0700, Keith Busch wrote:
> > +		u32 dio_align = ext4_dio_alignment(inode);
> > +
> > +		if (dio_align != 0) {
> 
> 
> > +			struct block_device *bdev = inode->i_sb->s_bdev;
> > +
> > +			if (dio_align == 1) {
> > +				fa->fsx_dio_mem_align = bdev_dma_alignment(bdev) + 1;
> > +				fa->fsx_dio_offset_align = bdev_logical_block_size(bdev);
> > +				fa->fsx_dio_read_offset_align = bdev_logical_block_size(bdev);
> > +			} else {
> > +				fa->fsx_dio_mem_align = dio_align;
> > +				fa->fsx_dio_offset_align = dio_align;
> > +				fa->fsx_dio_read_offset_align = dio_align;
> > +			}
> 
> Call bdev_fileattr and override the relevant field as needed?
> 
> Question to the ext4 maintainers: why does ext4_dio_alignment
> affect the in-memory alignment?  If it does so, it should probably
> also affect the virt boundry alignment..

I guess that is mostly a historical accident. ext4_dio_alignment() returns
1 (iomap alignment is used and that's different for memory and file offset
alignment), 0 (dio not supported, memory and file offset alignment is
indeed the same), and blocksize (a special case which can happen for
fscrypt if it supports dio and where I believe memory alignment
requirements may be in fact different). I'm adding Eric to CC to answer
what actual requirements fscrypt has for memory buffers for direct IO. I'd
expect with inline encryption we would have the same requirements as
ordinary iomap direct IO and for other code paths I'm not sure... Eric?

								Honza

-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
