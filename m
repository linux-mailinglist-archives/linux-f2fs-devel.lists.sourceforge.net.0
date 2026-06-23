Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +l40N/EWO2p7QQgAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Jun 2026 01:29:53 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A856BA968
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Jun 2026 01:29:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=Q5sg4k4A;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=VrffJlL+;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=K2kiGK2C;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b="GofQy6/y";
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Aeo2N4fvdCOayjUbQ8F6DlgaucHyZAyJWpqqsX+t2Ss=; b=Q5sg4k4AzFe9uHkvbQA3crE/0F
	P/BFBmTLSpauh9pe7kp1MW9zkLEVADzDA5VRJ0d6siaqdIddK0ccIosIyu8q2kkpwo/ZW/vO2tIdh
	Yvg5E2a2Nvnzgj8dmg6Pglq/Jk+X8niCbjhPnt8lAgQA6DStb36Do5oJcc+56jIDMFzw=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wcAYo-0003IW-GM;
	Tue, 23 Jun 2026 23:29:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1wcAYk-0003IO-US
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Jun 2026 23:29:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MG2chgvKp3NnapFIMPyD3yJcnZQlz6w1e1Zp8agMT60=; b=VrffJlL+9hdc4VNY5JxQOiA4ea
 PsdEteRm2XzUFOmsn/Upfyx1JIHFUiUSvNVF5PqmrrA3VE9cd0pLwICow+VG5ppIzHwpJOQqQTHjV
 rtRq59/vmsaERGu9Xg6EWzZhB5Yt+7RbhKJf0BHrsx22cwuKi8yAz9XL5GgzpU+u7tTI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MG2chgvKp3NnapFIMPyD3yJcnZQlz6w1e1Zp8agMT60=; b=K2kiGK2CkB9JIztMVGpJW9pQyw
 Qkaaf4waiIVmlrc7GaHeXPa5PllwyVrP/ok/WSyp40ogLPZS2XYeR//VYzzaBD3tipGw3AKp9QCma
 ONLJXfV7mHklkgwc86riL3zbzlFqnGIvEhOxHNcWhnYAWSrSB3h79NIs2wsWdNzHah1Y=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wcAYk-0006JM-Ha for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Jun 2026 23:29:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 829F841A6C;
 Tue, 23 Jun 2026 23:29:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 339361F00A3A;
 Tue, 23 Jun 2026 23:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782257368;
 bh=MG2chgvKp3NnapFIMPyD3yJcnZQlz6w1e1Zp8agMT60=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=GofQy6/y8GikkwOWVw5H5BvZjXigBICa+iuINQbxMtOxZhvOT2Ls1H+bXY62xMScp
 IBNOI99ejbAtCzGAB3IorEp9ZZznV7VQoZ+Uz4EwmHsqssyJIEaUMCdoeMPlhw4LUx
 VZDXpwRqth7ttisI7nevSg4tJfBFGmBIhsGf3SnNndqSgb93wrvlkG0iX6UXaXGR3E
 14TTbmzrDGsBwmlrBpeZn2JZMBaJIZPRD8JMlX2PeqaBQMCnK58AXDLKpyx+XQW17u
 nA5DuOixt7eSEYiI8fJWOzRnPygC1m+p5Kzd4ozPK5x+9G5ptisx5a/xbqXP01gkak
 6t4u3kM2zU5qA==
Date: Tue, 23 Jun 2026 16:29:26 -0700
To: Chao Yu <chao@kernel.org>
Message-ID: <20260623232926.GA7864@quark>
References: <20260622011539.2292553-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260622011539.2292553-1-chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jun 22, 2026 at 01:15:39AM +0000, Chao Yu wrote: >
 As part of the linux kernel's migration to folio-based APIs, introduce >
 fscrypt_finalize_bounce_folio() as the folio equivalent of > fscrypt [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1wcAYk-0006JM-Ha
Subject: Re: [f2fs-dev] [PATCH] fscrypt,
 f2fs: introduce fscrypt_finalize_bounce_folio() for cleanup
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
Cc: jaegeuk@kernel.org, linux-fscrypt@vger.kernel.org,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net
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
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:linux-fscrypt@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quark:mid,infradead.org:email];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[ebiggers@kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 70A856BA968

On Mon, Jun 22, 2026 at 01:15:39AM +0000, Chao Yu wrote:
> As part of the linux kernel's migration to folio-based APIs, introduce
> fscrypt_finalize_bounce_folio() as the folio equivalent of
> fscrypt_finalize_bounce_page(), and clean up f2fs codes with this new
> helper.
> 
> Suggested-by: Matthew Wilcox <willy@infradead.org>
> Cc: Eric Biggers <ebiggers@kernel.org>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
> 
> Is it worth to introduce fscrypt_finalize_bounce_folio(), then try to
> do clean in f2fs_write_end_bio() first, and then replace
> fscrypt_finalize_bounce_page() later?

I'm working on making ext4 and f2fs always do file contents
en/decryption using fscrypt_set_bio_crypt_ctx(), which already supports
large folios and doesn't require the filesystem to manage bounce
buffers.  I don't think these minor tweaks to the other implementation
(which don't actually make it support large folios) accomplish anything
useful, and we should focus on removing it instead.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
