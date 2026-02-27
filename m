Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mH09L/4aoml7zQQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 27 Feb 2026 23:30:22 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C8D1BEB38
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 27 Feb 2026 23:30:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AcZnZifNQfZrQ1mLePkVwEk4SxbcdztvARpcm6EJKNg=; b=j+Mx5qmDlk9r0IhXG8lsKRRGyG
	F3ZoQE/3WuRNf9g6aaKhnNdaPHB+qOrJQ5OdGgO/+61wQC9D+Ve5QZZfWiijN8zsHvab78oI8Mw3i
	UkhS5wg/ulkJy5k7Hmko8LuBZHldLIbQDkm7yVxu5XFycleY07jvCdZaTFmAMT1Jo+fM=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vw6Lc-00085x-Mk;
	Fri, 27 Feb 2026 22:30:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1vw6La-00085q-PD
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 27 Feb 2026 22:30:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=M6cr8CSxHFCuAUapmlYdUdvLRci5dyoQf/PNgs74ooc=; b=RzYRgSDZoaL1/FWdIDoa7h7PDM
 GM6EoXHdAlKq9SVg8Bz53gRBvn1US45OckC/99O6mjU7IrApEaFzcjHpc8t6gEOjCtjK8gBAh2cD1
 0wLljHt0t5hBgzLUnh5lQyuW95FkweoeFVrFhcruUxvTiLK7CebuXrcmAJDbw5GJ79b0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=M6cr8CSxHFCuAUapmlYdUdvLRci5dyoQf/PNgs74ooc=; b=WIsiVNenzYGtqq4YhtH3DTYf+S
 EjekIhQX27TX7Jb7sA9IyliHUpJrBS6t2wcjbytKSogXxkiidxcAA42ucYYsmHTRptPuNyOk9SA0T
 JL4MO9mU6xA0lzwjoaERLebDTCYEgFsKthtM32BDowLPb6RlQwUJ3eKBVQx9U3WqeRmo=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vw6La-0002GG-DL for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 27 Feb 2026 22:30:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9EA916111B;
 Fri, 27 Feb 2026 22:29:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C41B9C116C6;
 Fri, 27 Feb 2026 22:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772231399;
 bh=qOWr/grtHIj1V1K+NCTt0HpJP/AofwCqzIkHf3d79hM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Mblv7DHD9IvkrAApTsDnl40aXVl5qo41uma3D9q78e0fmMER6HJG7Qhnm+uyDI7pP
 JoguTvkQa1p+sTVUWtrgdYZ+IjVqT4POkPlTdLyKcvMF8/Qxtmg/kJAN+lP4fWE3z8
 KZhYqMZM1bz6a0OHhjdtfx7YUgv/Ak0VWMCvvWCOavLMT+82821r+OTE7Tqm3WdHYt
 6ch7v+luemKnkTIpjkMXv2++8bcCVGZqwkd7++6ubi8YSgR04lgsm/plZDSdx7xvXD
 kD3nMYP1Xm2fIEe5HRSmnx7fM8/K13BvamUZLCAH0S9FFW/gKRIDcMIr7HyFpzblzA
 kEEB1wSHkKMXw==
Date: Fri, 27 Feb 2026 14:29:50 -0800
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20260227222950.GC5357@quark>
References: <20260226144954.142278-1-hch@lst.de>
 <20260226144954.142278-15-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260226144954.142278-15-hch@lst.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Feb 26, 2026 at 06:49:34AM -0800, Christoph Hellwig
 wrote: > + block_in_file = EXT4_PG_TO_LBLK(inode, folio->index); > + pos
 = (loff_t)block_in_file << blkbits; The EXT4_PG_TO_LBLK() expands to: 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vw6La-0002GG-DL
Subject: Re: [f2fs-dev] [PATCH 14/14] ext4: use a byte granularity cursor in
 ext4_mpage_readpages
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
Cc: Christian Brauner <brauner@kernel.org>, "Theodore Y. Ts'o" <tytso@mit.edu>,
 "Darrick J. Wong" <djwong@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
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
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:brauner@kernel.org,m:tytso@mit.edu,m:djwong@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fscrypt@vger.kernel.org,m:adilger.kernel@dilger.ca,m:linux-fsdevel@vger.kernel.org,m:jaegeuk@kernel.org,m:linux-ext4@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[ebiggers@kernel.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: 54C8D1BEB38
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 06:49:34AM -0800, Christoph Hellwig wrote:
> +		block_in_file = EXT4_PG_TO_LBLK(inode, folio->index);
> +		pos = (loff_t)block_in_file << blkbits;

The EXT4_PG_TO_LBLK() expands to:

        (((loff_t)(folio->index) << PAGE_SHIFT) >> (inode)->i_blkbits)

So it calculates the pos as an intermediate step, and we end up with the
redundant pos = (pos >> blkbits) << blkbits.

It probably would make more sense to calculate the pos first, similar to
what other places in this series do:

        pos = folio_pos(folio);                                          
        block_in_file = pos >> blkbits;

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
