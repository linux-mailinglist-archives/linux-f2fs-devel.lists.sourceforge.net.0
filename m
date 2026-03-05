Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6IBjLn6PqWni/gAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 05 Mar 2026 15:13:18 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D64E21312C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 05 Mar 2026 15:13:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7GyNaZ3luBHJgwos3G4AnosnYcRbZlO6pu0gq6AaQLE=; b=f1ZWgkSV/0Evhc2u5w84dBV9b3
	AWErGcMil1P93hNcqDyc595M8nQ0lbxgj6T+yxZLo3YWzmLQDLCHQTocHIwJQ4D+wvWhcK+OApd/W
	SSSliat0HtOuCuimJu/GrCxcqDb6xExPJWpSby0YcXg1TO0R5HH5mKrz9Cd+e0p0j/lg=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vy9Ro-0003ZU-2q;
	Thu, 05 Mar 2026 14:13:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+2e11e6930e970eb8572e+8229+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1vy9Rl-0003ZO-VJ for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Mar 2026 14:13:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IO6QMfBHH8sMK+gsIVCR4BlKaz4fOls25p0dmnSxTg0=; b=gfsi96qHis5bcVIYYiQTbWbT3T
 rSNJnNshYAsyzmTReMQiCOrnZTpf/Z3HupIyDY6+1UJY/mzSPk+CeHEwlgmJZxGTwGQGR2P3ZH8xy
 IuX8RydASYzs0eMH8loaTKMkTzEfmEF5+yaNuNFS4dnwANERDktRgnD5Vr2OULapuItY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IO6QMfBHH8sMK+gsIVCR4BlKaz4fOls25p0dmnSxTg0=; b=Tv5Etk3F/l/AsStHpwbylQOIl+
 q88QgllwNQZz2v1Tq/fcWt7tvBC+mvKXVXF4iv9kDwnxGEWH3tPgfKz/wXLZa3w4oO9CUY2VBPTu8
 Tle4zEorwtY2WnaTAOqeqqcylj3lMZwwUiFlbaDMoOLV4SlhkZQK88fBldpMjHE9o2H8=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vy9Rl-0003Yb-6r for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Mar 2026 14:13:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=IO6QMfBHH8sMK+gsIVCR4BlKaz4fOls25p0dmnSxTg0=; b=EM5q36QGse8Eo0rdRyuwEK0kug
 POFFSpf0FFYzOJTVE5uLbRO3DCfB160ZZqk4rXNER8kLMqP6pjdqRGQdu3Wv1bUUUnJLpRiAL9/HQ
 jgUBJGbLO5UZ4bZSerntEBKkY/QRv4PNEv07OkOuskyR2pRgnsJjo9LBHTLEqBL/FNGQHc6Nm1cC/
 nNV8/XRfxLaZQunjXq1DcQwxccMR0XQVDaXcaBuvmW4zOUzPW16fx3b9qiKQmFTNVoxv9bekfTegc
 XUwq7ye1qckYMF7lOie+IMOP3XtMbX/ahMAqSi5tuPvP/4OSsf9HoHYYQJxRdS2F7Oobc9Lbh0x05
 uVpsHBRw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1vy9RZ-00000001vWO-2ZpE;
 Thu, 05 Mar 2026 14:12:49 +0000
Date: Thu, 5 Mar 2026 06:12:49 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <aamPYU19Qdh-6R8m@infradead.org>
References: <20260304190424.291743-1-agruenba@redhat.com>
 <20260304190424.291743-2-agruenba@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260304190424.291743-2-agruenba@redhat.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Mar 04, 2026 at 08:04:06PM +0100, Andreas Gruenbacher
 wrote: > Since commit 9da3d1e912f3 ("block: Add core atomic write support"),
 > there is a gap in the blk_status_t codes and block status c [...] 
 Content analysis details:   (-0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1vy9Rl-0003Yb-6r
Subject: Re: [f2fs-dev] [PATCH 1/4] block: consecutive blk_status_t error
 codes
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
Cc: Jens Axboe <axboe@kernel.dk>, dm-devel@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
 drbd-dev@lists.linbit.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 6D64E21312C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.01 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[infradead.org : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[hch@infradead.org,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,infradead.org:s=bombadil.20210309];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:agruenba@redhat.com,m:axboe@kernel.dk,m:dm-devel@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-block@vger.kernel.org,m:linux-bcache@vger.kernel.org,m:drbd-dev@lists.linbit.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[hch@infradead.org,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,infradead.org:-];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:email,infradead.org:mid,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 08:04:06PM +0100, Andreas Gruenbacher wrote:
> Since commit 9da3d1e912f3 ("block: Add core atomic write support"),
> there is a gap in the blk_status_t codes and block status code 18 is
> unused.  This causes blk_status_to_errno() and blk_status_to_str() to
> return incorrect values for that code.  Make the blk_status_t codes
> consecutive again to avoid that.

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
