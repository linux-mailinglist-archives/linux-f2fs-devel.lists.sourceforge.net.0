Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFERFxxqr2nzYAIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Mar 2026 01:47:24 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D175B2431C4
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Mar 2026 01:47:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RfsDvDYYPYgLGWetdXh/CumLisqZ3vMh0m6ZiViyteY=; b=gRwoqWFoXPWIw6hDsHkBAeaPv6
	81iCqlq9CcEetya2eBZpvQu2g82VA6whQJICkbblSo0oXSe0VOfUXy1bw4muZ85D8MqmA9Q3U5Qxz
	+FLoOUV/esr0ZVUu3cecrb05BWTCOwVYkupFfCGohahvrLZCY6nKVmQgZTMlx/qS0GjY=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vzlFq-0000Hj-BY;
	Tue, 10 Mar 2026 00:47:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1vzlFo-0000Hd-OY
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Mar 2026 00:47:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=a6Ra1Tnfh1GVQP7DFFtAyBFGZJ8rqZ5wSqgMTabyoMQ=; b=IgSuWcS3naRV2YsAa8yuCRT4/u
 2v1wNhmStAC5Kg5ceiOLovvQe6pgHwOb8lvsv8HsFAeJaeE5RTu5QedaUrb78LnaKgj81kj5j7hj2
 dPYKNALrqqu4Yb2HznCllCi1+yVgfPe24SEz886LbVC4ghF9JwEPW+uOdhQa9d8f7PQk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=a6Ra1Tnfh1GVQP7DFFtAyBFGZJ8rqZ5wSqgMTabyoMQ=; b=OBfzjdLZacmRk13FrphqEvaq1+
 lFx7v37nWLVRT38+CKfrWQ1WjdoaGZh7P/Cj2laZd1YKfiE6BmQeft2m9DCh9R79+p3rDi8AKlI72
 akxJdlnQsjpt2Qx2aDon8Cmrrhs47wVatNu7LjUx9AGEpsNQfnQeLy6IpRbyYoZEm9a0=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vzlFo-0006QG-AR for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Mar 2026 00:47:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id BEF0E600B0;
 Tue, 10 Mar 2026 00:47:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68F21C2BC9E;
 Tue, 10 Mar 2026 00:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773103634;
 bh=YeLZxMDoZgvRF0++QZ8HZfV0ZARN8oRvq+jsJMMmY90=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KU2eQlK0UC+rvlXiIchmhHWSks78KArmkAPWXgK5bqiD2Q/EIcNzB4OiMIvb6sA71
 yA6L+qs8aGwaQT5KoJsw4+B0DfQoUxt4B6h7f/gwqXGp8abCPR8NHe67LCQxdbXmt2
 /Hj7cMCDwNy9oWlE75wKURW+r9G7kLMm/nh33zgvBHg56AMb3zyL/AP1+YY9W7oB1o
 tu1lSZdnA7ogwB8AheYYwRcZIhRc14MPVYBuY6h7s69Rrj71diJvFM1N8M5r/q+KsL
 ejowd2fp8rM0fETHkUwre1RjwzZFfcfD8ykIIpRcfNNy9UTD2mHGVmhQblQepYr9U6
 QNhb+cTvuiuEg==
Date: Mon, 9 Mar 2026 17:47:13 -0700
To: Andrey Albershteyn <aalbersh@kernel.org>
Message-ID: <20260310004713.GW6033@frogsfrogsfrogs>
References: <20260309192355.176980-1-aalbersh@kernel.org>
 <20260309192355.176980-5-aalbersh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260309192355.176980-5-aalbersh@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Mar 09, 2026 at 08:23:19PM +0100, Andrey Albershteyn
 wrote: > Helper to pre-fill folio with hashes of empty blocks. This will
 be used > by iomap to synthesize blocks full of zero hashes on the [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vzlFo-0006QG-AR
Subject: Re: [f2fs-dev] [PATCH v4 04/25] fsverity: introduce
 fsverity_folio_zero_hash()
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
From: "Darrick J. Wong via Linux-f2fs-devel"
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: "Darrick J. Wong" <djwong@kernel.org>
Cc: fsverity@lists.linux.dev, ebiggers@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org, hch@lst.de,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: D175B2431C4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:aalbersh@kernel.org,m:fsverity@lists.linux.dev,m:ebiggers@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[djwong@kernel.org]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 08:23:19PM +0100, Andrey Albershteyn wrote:
> Helper to pre-fill folio with hashes of empty blocks. This will be used
> by iomap to synthesize blocks full of zero hashes on the fly.
> 
> Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>

Looks good to me,
Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>

--D

> ---
>  fs/verity/pagecache.c    | 22 ++++++++++++++++++++++
>  include/linux/fsverity.h |  2 ++
>  2 files changed, 24 insertions(+)
> 
> diff --git a/fs/verity/pagecache.c b/fs/verity/pagecache.c
> index 1819314ecaa3..1d94bf73f38c 100644
> --- a/fs/verity/pagecache.c
> +++ b/fs/verity/pagecache.c
> @@ -2,6 +2,7 @@
>  /*
>   * Copyright 2019 Google LLC
>   */
> +#include "fsverity_private.h"
>  
>  #include <linux/export.h>
>  #include <linux/fsverity.h>
> @@ -56,3 +57,24 @@ void generic_readahead_merkle_tree(struct inode *inode, pgoff_t index,
>  		folio_put(folio);
>  }
>  EXPORT_SYMBOL_GPL(generic_readahead_merkle_tree);
> +
> +/**
> + * fsverity_folio_zero_hash() - fill folio with hashes of zero data block
> + * @folio:	folio to fill
> + * @poff:	offset in the folio to start
> + * @plen:	length of the range to fill with hashes
> + * @vi:		fsverity info
> + */
> +void fsverity_folio_zero_hash(struct folio *folio, size_t poff, size_t plen,
> +			      struct fsverity_info *vi)
> +{
> +	size_t offset = poff;
> +
> +	WARN_ON_ONCE(!IS_ALIGNED(poff, vi->tree_params.digest_size));
> +	WARN_ON_ONCE(!IS_ALIGNED(plen, vi->tree_params.digest_size));
> +
> +	for (; offset < (poff + plen); offset += vi->tree_params.digest_size)
> +		memcpy_to_folio(folio, offset, vi->tree_params.zero_digest,
> +				vi->tree_params.digest_size);
> +}
> +EXPORT_SYMBOL_GPL(fsverity_folio_zero_hash);
> diff --git a/include/linux/fsverity.h b/include/linux/fsverity.h
> index 8ba7806b225e..b490b2c8a393 100644
> --- a/include/linux/fsverity.h
> +++ b/include/linux/fsverity.h
> @@ -321,5 +321,7 @@ void fsverity_cleanup_inode(struct inode *inode);
>  struct page *generic_read_merkle_tree_page(struct inode *inode, pgoff_t index);
>  void generic_readahead_merkle_tree(struct inode *inode, pgoff_t index,
>  				   unsigned long nr_pages);
> +void fsverity_folio_zero_hash(struct folio *folio, size_t poff, size_t plen,
> +			      struct fsverity_info *vi);
>  
>  #endif	/* _LINUX_FSVERITY_H */
> -- 
> 2.51.2
> 
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
