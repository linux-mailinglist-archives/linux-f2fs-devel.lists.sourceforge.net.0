Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oIfxE5iPqWni/gAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 05 Mar 2026 15:13:44 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C5E213161
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 05 Mar 2026 15:13:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ofrahNIYevUqU0nqXcODtr7/vnfmrSMMUQcPIXF18wQ=; b=cUCvvgW6ny06WndqadhStrNVOg
	LEJhBTNYkHL3osMIQbaE469Dvh6AJZTJiv2bqmGzhIATt+IgE/YOgtG3bIlB7VHZybzPrSr07hb6l
	db7W/KwEwGJmMe3WDSHC2a5Gy7jZzaZm5y0MgJPuojiCnBuwK2R93AgGBc6S7LOUW1TI=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vy9SQ-00029J-0q;
	Thu, 05 Mar 2026 14:13:42 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+2e11e6930e970eb8572e+8229+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1vy9SN-00029D-NQ for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Mar 2026 14:13:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TJHqUqNeTMnXyeDzlG2Ut7/dGbTr+YA33QxUyT5WrQw=; b=MjFOKtFEr2t7f2Wq1Z5lgJdjRs
 UalHXTabSCBlU5j16IztP9/ehKapwHRtobpBGgXUNmaKMOkFNpRRrT4/eCBrNoXLco1clqX9gBUQ2
 W8QscHeryrfUYZ3h1FDrvHu+LRdC3taFzJO1AoNWzuT6Ajr3Vx2CztvbY8gLAOYixKw4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TJHqUqNeTMnXyeDzlG2Ut7/dGbTr+YA33QxUyT5WrQw=; b=d3p/vDQMLVpdfdIq7I3nzXqdZL
 UMp9I4QJJMNgNw/yHGbnDZxhCXs5253UaDNjGcj1XYNUAf+eiNSHC+gjxqv32GxTCubUivUwC4fFI
 9FQqZ1vhNFmjHPRJtwehf8x2pl351bEDEfXWn09i9ESv/K/wgLpBOKdyq/Yp6x+pD4Vo=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vy9SN-0003aF-Dh for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Mar 2026 14:13:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=TJHqUqNeTMnXyeDzlG2Ut7/dGbTr+YA33QxUyT5WrQw=; b=JZFHlKMrZ1roVh1G0oP4L2vexm
 FrZLBd0jy6czxnRKQ/Lp3Npu1Qkrd7nbareKkkH2li+1DxXvSs8mlSnt2tdCuiE4YnjL/3vgEJ6CJ
 m9GkA7a20axqbOCR/1dnVqK9zB5Z3dhfQkuoOK3kNxyT6XDzbneSodjsnP1MlYd/5Z2L9eUpBHMQJ
 pzhwzOFNoBtT+4onbzGRsbncLY5EMgD8EEesXVvOH3CyEFYYFOfMKFZKt4m86vEcMuEuh+INhV23+
 H/NL9mqTOZOo53eCjEvvM5LdzVOUt2x4shKhcQqbcqy4upmn6LNgg8Exm0P0vds/XCM8XadKBu7QI
 +e3ZJO5w==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1vy9SH-00000001vXu-2o3v;
 Thu, 05 Mar 2026 14:13:33 +0000
Date: Thu, 5 Mar 2026 06:13:33 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <aamPjXeF0qHlhJZu@infradead.org>
References: <20260304190424.291743-1-agruenba@redhat.com>
 <20260304190424.291743-3-agruenba@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260304190424.291743-3-agruenba@redhat.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Mar 04, 2026 at 08:04:07PM +0100, Andreas Gruenbacher
 wrote: > Change blk_status_to_str() to be consistent with
 blk_status_to_errno()
 > and return "I/O" for undefined status codes. > > With th [...] 
 Content analysis details:   (-0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1vy9SN-0003aF-Dh
Subject: Re: [f2fs-dev] [PATCH 2/4] block: get rid of blk_status_to_{errno,
 str} inconsistency
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
X-Rspamd-Queue-Id: 45C5E213161
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.01 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	DMARC_POLICY_SOFTFAIL(0.10)[infradead.org : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:agruenba@redhat.com,m:axboe@kernel.dk,m:dm-devel@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-block@vger.kernel.org,m:linux-bcache@vger.kernel.org,m:drbd-dev@lists.linbit.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[hch@infradead.org,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,infradead.org:s=bombadil.20210309];
	MIME_TRACE(0.00)[0:+];
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

On Wed, Mar 04, 2026 at 08:04:07PM +0100, Andreas Gruenbacher wrote:
> Change blk_status_to_str() to be consistent with blk_status_to_errno()
> and return "I/O" for undefined status codes.
> 
> With that, the fallback case in the blk_errors array can be removed with
> no change in behavior.

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

While you're at it: blk_status_to_str is exported, but as no modular
users, can you also drop the export?



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
