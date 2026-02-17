Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2KUdALYKlGkb/QEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Feb 2026 07:29:10 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A4F148F82
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Feb 2026 07:29:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HL+cvmneTWuBF3zmK0NFvCPOSskPU6iIl2095BjuiPY=; b=IkCkPPvStXeDRVaCuwXIEUF5pj
	0MVaeOnXAipip8kEBIY4xI+/pzdZmnyb8Tw2s180Cl0jVE9ghN9/d6AT+YYs34k873DMtAX99tNWd
	JOe13XN/39OWSehkxPLEDaIURTweqXZFJfyPkINK7La3a7ArSZYkmfs9GiMt3oYgoWdA=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vsEZt-0004g1-QD;
	Tue, 17 Feb 2026 06:28:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+52c31190631f5c163bb1+8213+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1vsEZr-0004fp-Ip for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Feb 2026 06:28:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LQEB5qH6sGqn4N5t877calL/A3UF9/CGACxt3V+Y1E8=; b=VMQ/e8MiFYndXa3PqrQu1xJ5/Y
 qeNmkI2WYnN0OMNNuuq5FG7XNm2rd6z4WRUXfE1HiMoC5JkqM/VhxzVY97gvmoFpQcLNq8fviugOl
 hRDcc0k7YIuUfYA3gnn0caPRA3Sf2D0ZnHehS2UM7L/UX96lTiJT6eySbq3+RfQ/CfxY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LQEB5qH6sGqn4N5t877calL/A3UF9/CGACxt3V+Y1E8=; b=jkkQhCvFQrtfsFVxaHEisswWyU
 ntLFsukH+2GuE8MBUrReoFxdi3TqvLeYu5wg97+ylsmtfxOOhm26Tqq+Dlvt2HqG28WomRWBZLmpN
 0syPunFXzm5jdtaySykHgUdq52Q2m9FVjKzv0SIQwxwQPkOPGYoIkoKztEZhmaH/dEOc=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vsEZq-00008i-PJ for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Feb 2026 06:28:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=LQEB5qH6sGqn4N5t877calL/A3UF9/CGACxt3V+Y1E8=; b=0+F3pw4MxvXt2rCIDBraA++VZd
 ORMPnoIPZWkL+haiLnvZw7FGjGsFKm4CnAJ3gQlRPNpp6ht7zV7qxTzPlGrMayTPi/sW8bsk13X+Y
 n0dREQP1oEevOCNFRjKONBFZUtrgAupOei6wwSsulBKQ36AxTBQNmOWGiKjpI6sCd3OJCNzDEdtme
 9RlCWxby5PZzzGMrtfl9zGRRZqg7OPIyH0hwah2AuGzI7g3dxKRiRtIcKmNepmrkxc7rbfvtev+HK
 Pq0NbrcVJJGVKyhD2kCjd1TbD0CV/+fggmtPxMur45DtK1BGQ37UZhFh14FW5S8/C3js6JeVV94B3
 Je3ankVg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1vsEZj-00000007hu1-43Mb;
 Tue, 17 Feb 2026 06:28:47 +0000
Date: Mon, 16 Feb 2026 22:28:47 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <aZQKn2-L2Tro4OUT@infradead.org>
References: <20260215042806.13348-1-ebiggers@kernel.org>
 <20260215042806.13348-2-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260215042806.13348-2-ebiggers@kernel.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat, Feb 14, 2026 at 08:28:05PM -0800, Eric Biggers wrote:
 > In addition, remove the unnecessary clearing of the up-to-date flag. I'd
 split that into a prep patch,
 as it is not really related to the folio conversion.
 Content analysis details:   (-0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1vsEZq-00008i-PJ
Subject: Re: [f2fs-dev] [PATCH v3 1/2] f2fs: make f2fs_verify_cluster()
 partially large-folio-aware
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
Cc: fsverity@lists.linux.dev, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.01 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	DMARC_POLICY_SOFTFAIL(0.10)[infradead.org : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:fsverity@lists.linux.dev,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fsdevel@vger.kernel.org,m:jaegeuk@kernel.org,m:torvalds@linux-foundation.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[hch@infradead.org,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,infradead.org:s=bombadil.20210309];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,infradead.org:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hch@infradead.org,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	DKIM_MIXED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:mid,lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: 87A4F148F82
X-Rspamd-Action: no action

On Sat, Feb 14, 2026 at 08:28:05PM -0800, Eric Biggers wrote:
> In addition, remove the unnecessary clearing of the up-to-date flag.

I'd split that into a prep patch, as it is not really related to
the folio conversion.

Otherwise this looks good.  I actually had patchs to kill
fsverity_verify_page in my local queue, but decied to postpone
it.  Guess I should have included them..



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
