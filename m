Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kKxOMzwylmktcAIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Feb 2026 22:42:20 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C47F15A544
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Feb 2026 22:42:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PCH+q8jA7eBB3oNyLxTD0Pc/ZqXv8kwWGP5Ojxe1+i8=; b=fv88sQtOcSV8R+eGcui9H6XTMZ
	xb8BpDyICduQ4iWF4JiZaxcl49WpqDRg18aDzdk4ffh/gwCOwrdx97kB28Ek59Wn+k0RDdqWQ5ZGg
	l4TBZuq3ZMMmBcc43eae+TLV/HOxT1rxX4N+q5XpsyhhGYXUN2CFgsMPFAVIwUN4qkkg=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vspJD-0004ok-8d;
	Wed, 18 Feb 2026 21:42:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1vspJB-0004oV-Tw
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Feb 2026 21:42:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=521yaJqiIzGlz5e8zhXr+9dObmbYxow6lheOu8Bao0I=; b=eUAFnpmCybB6aVA4AqLk7N7orD
 y6+2BQpOkFbtY6XV50EBFRFX/EWSlkKXb4NC/gXhth/hPWX/YFRONn3c5Q7ZGQ361Pizaaq430U/J
 nYEFQkjo4R6/HHPD3Ba7lZitLIg+AK/rdfr6PEFYjL7F4k2z1hH5RnJ0LQbvPaDbvta8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=521yaJqiIzGlz5e8zhXr+9dObmbYxow6lheOu8Bao0I=; b=HVyhVBwWr2s5YPX4EhPo2q1rSE
 OR18qM5tGWicAkPbt+UqPSqa+CQ1IjI9TSxEVMVeVQxSkeUnElZzeemFF9tvEWgzyd/oxYpltjWdI
 rNX4TXDBI3bO156hjT95Mql1SqOGN9wO6/QGrop3FSevfvrx56VZ1DmOd+5ztVrJgFls=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vspJC-00087k-7h for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Feb 2026 21:42:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id EE7D743B8F;
 Wed, 18 Feb 2026 21:41:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 749DCC19421;
 Wed, 18 Feb 2026 21:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771450919;
 bh=ukY7bBo0chcEMVe4h46kGLrEvBD0TG31XgNzOAIIpjE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sAV0VI9YYrPVxmpE0YEZQDaiS/GThY+EiN9okF03OiSoQEFNDzSjQAVDJFHAR1Po8
 2/cn6AMbnwiDQajsutF53HZLyIFt4f7wvBOVtxDbHCQIqV5j/Z6UjDr6VQL1YdLq10
 2i6ShygnIT71xROjGChmEZ7j/DOhl0g6IWkB66DORzFTkykBO8q7WvbreR/zRsHa2O
 69LLGSRZ8C72AFBWWUl692vOPh9Yfp6FrHTJ/zksKLGiEoSKr4SKALjUiMoTEBrnt5
 smTET6azZvSaWLuaxGz/BV21YNL/zyDk+7wuu42SNtdWABgc6nFlFn8ktILAo6ypYb
 M+WtGtnt9M/DQ==
Date: Wed, 18 Feb 2026 13:41:57 -0800
To: fsverity@lists.linux.dev
Message-ID: <20260218214157.GC2128@quark>
References: <20260218010630.7407-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260218010630.7407-1-ebiggers@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Feb 17, 2026 at 05:06:27PM -0800, Eric Biggers wrote:
 > This series removes the non-large-folio-aware function >
 fsverity_verify_page(), 
 which is no longer needed. > > Changed in v4: > - Split [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vspJC-00087k-7h
Subject: Re: [f2fs-dev] [PATCH v4 0/3] fsverity: remove
 fsverity_verify_page()
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
Cc: Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:fsverity@lists.linux.dev,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fsdevel@vger.kernel.org,m:jaegeuk@kernel.org,m:torvalds@linux-foundation.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[ebiggers@kernel.org]
X-Rspamd-Queue-Id: 8C47F15A544
X-Rspamd-Action: no action

On Tue, Feb 17, 2026 at 05:06:27PM -0800, Eric Biggers wrote:
> This series removes the non-large-folio-aware function
> fsverity_verify_page(), which is no longer needed.
> 
> Changed in v4:
>     - Split ClearPageUptodate removal into a separate patch
> 
> Changed in v3:
>     - Additional scope creep: verify the entire folio, switch to
>       several more folio functions, and stop clearing PG_uptodate
> 
> Changed in v2:
>     - Made one specific part of f2fs_verify_cluster() large-folio-aware
> 
> Eric Biggers (3):
>   f2fs: remove unnecessary ClearPageUptodate in f2fs_verify_cluster()
>   f2fs: make f2fs_verify_cluster() partially large-folio-aware
>   fsverity: remove fsverity_verify_page()
> 
>  fs/f2fs/compress.c       | 11 +++++------
>  fs/verity/verify.c       |  4 ++--
>  include/linux/fsverity.h |  6 ------
>  3 files changed, 7 insertions(+), 14 deletions(-)

Applied to https://git.kernel.org/pub/scm/fs/fsverity/linux.git/log/?h=for-next

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
