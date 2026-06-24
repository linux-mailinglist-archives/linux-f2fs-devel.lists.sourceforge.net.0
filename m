Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ffFGL1SLO2oJZggAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Jun 2026 09:46:28 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 634FB6BC487
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Jun 2026 09:46:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=gDHezCza;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=U6eiMPfV;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=FSmpWHdK;
	dkim=fail ("body hash did not verify") header.d=infradead.org header.s=bombadil.20210309 header.b=wsrZS24e;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=infradead.org (policy=none)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oi4gfclK/aCpJcfIzmVbD/VmM/I0w3VJJux8z3DP9cA=; b=gDHezCzaLHXnveQrg1bcjeh/fN
	SOPsae1xLxRnTz1h/NYimqIOiVSzplLKj+Gpkb6o9ZcKYnKdo8WXd8Jvv923b5npTGKc+m+9il/XZ
	xEHSlLyopjsvD6qWWwqXsWvDP7yTji/M2DA14oQ6wCsZt/cxLkxfmOS0UKdRAso/ykY4=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wcIJP-0006bB-Tg;
	Wed, 24 Jun 2026 07:46:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+41526429243acde27946+8340+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1wcIJN-0006b5-2E for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Jun 2026 07:46:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5SQ2ceOLmQorTQ/rIGAZVtdIP0obDHikYx9CZqlXZ4w=; b=U6eiMPfVyhZ/24qSs88QxVemxe
 e605pSrTuYj0segcmQ42umuApmqD8k+8M67GJDFkDVHBZcK1cd9tdvUsX1Nh2OO1W/C3NMDHS0imF
 6YK1LZi2HPSThpNAAehKNOxkGWaMCZS8RNVK6v65fp//FAKNclAHfQ85FT8MCcAxTaak=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5SQ2ceOLmQorTQ/rIGAZVtdIP0obDHikYx9CZqlXZ4w=; b=FSmpWHdKH9pBA16bOL1hGFquSK
 3MTsC+YWuMzyeO20j+G9EgTeBc0NypktPgRQT3E5DjAJmj32k3OLYKLkHxbPMigY243yGTAyd9iaW
 d7faGnm7/ttrj3Uls5eKls6rzBMxeT1moGBYD75VxRvBk4J2wwJPWDgtjWAkSWfRqOmQ=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wcIJI-0002Yz-8E for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Jun 2026 07:46:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=5SQ2ceOLmQorTQ/rIGAZVtdIP0obDHikYx9CZqlXZ4w=; b=wsrZS24efcnk+Bk5fbKf9298JM
 Lphj2FrgoMJ5q3B9K2UimUGJPyIJSTULUUMaMpUp6t9EeMdEspHBVVZC+NOv0fj+WYnvNXnDY8Bku
 3CnmLqPpMAibDC9/WId1ReugEhQLevVKe0DRgKsFqD8x76tVO4+ck1kk3ghVw1hAnrqol2KobwRTw
 /4Zg0F5BVJZ6TpWzB8hgVCnvEhL3FhG+CEJDQdnoJtwjogHleJAgnHcc0go0GXTohWBhetUpFuxdU
 lJyf9I/yY5P0wM0WrQG8WOBnyiwXsiWjq1eH5MvYiLrH5B9dJ1Nzq7YEQmHWyvPr29K507+blCJ9A
 VG0l0r5A==;
Received: from hch by bombadil.infradead.org with local (Exim 4.99.1 #2 (Red
 Hat Linux)) id 1wcIJ7-00000007LHS-3i7c;
 Wed, 24 Jun 2026 07:46:01 +0000
Date: Wed, 24 Jun 2026 00:46:01 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Jan Prusakowski <jprusakowski@google.com>
Message-ID: <ajuLORVplOvEXvnI@infradead.org>
References: <20260622070438.1542638-1-jprusakowski@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260622070438.1542638-1-jprusakowski@google.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jun 22, 2026 at 07:04:38AM +0000, Jan Prusakowski
 wrote: > On F2FS, generic/064 fails with "extents mismatched before = 1 after
 = > 50" following multiple fcollapse (collapse range) operations [...] 
 Content analysis details:   (-0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URI: infradead.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1wcIJI-0002Yz-8E
Subject: Re: [f2fs-dev] [PATCH] generic/064: allow 50 extents on F2FS after
 fcollapse
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
Cc: jaegeuk@kernel.org, zlang@kernel.org, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.01 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[infradead.org : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jprusakowski@google.com,m:jaegeuk@kernel.org,m:zlang@kernel.org,m:fstests@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[hch@infradead.org,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,infradead.org:s=bombadil.20210309];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,infradead.org:-];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hch@infradead.org,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	DKIM_MIXED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:mid,infradead.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 634FB6BC487

On Mon, Jun 22, 2026 at 07:04:38AM +0000, Jan Prusakowski wrote:
> On F2FS, generic/064 fails with "extents mismatched before = 1 after =
> 50" following multiple fcollapse (collapse range) operations.
> 
> To ensure crash consistency and checkpoint integrity, F2FS forbids
> in-place SSR (Summary Standalone Replacement) overwrites on valid
> checkpointed blocks. When collapse range shifts blocks, F2FS allocates
> new data pages in LFS mode (out-of-place log writes). As a result,
> sequential collapse range calls rewrite shifted blocks at new log
> locations, intentionally leaving the file with 50 extents.

This sounds odd.  The test allocates a contigous range and then just does
insert/collapse on it, which should not lead to any new data block
allocations.  Given that the test works fine on zoned XFS and btrfs
with strict out of place write policies we know it does not require
overwriting blocks to work as well.

So I think something is fishy in f2fs if needs to allocate data blocks
here.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
