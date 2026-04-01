Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNTnMvObzWkrfQYAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 02 Apr 2026 00:28:03 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FAF380F15
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 02 Apr 2026 00:28:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i0MbL1F2vDAMDSFkZ3/3pFteFBy7cbqP882lOrL/nno=; b=N12ZvdITJwdsy4FBqU47Dn2QBH
	6nh086aZKki9HAFTQEgR07dHVIXBG3sYsveN0ZXT8qukxlcDwkeP0M9gwhvjMYozFgjJ3gSVcQKWl
	74n5t94vAFfg5W1n8ey2Y20sij9Cde2h+hxHmjiTumwyRYpoAXk5fpNDxxNAItLAqZtE=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w842U-00021Y-Tb;
	Wed, 01 Apr 2026 22:27:54 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1w8426-00021A-7M
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 01 Apr 2026 22:27:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=k7HMgCpPVzoOCNhuAjZVYKMRt2o3N6/Rn9+h+RyHgJc=; b=SsL+MAbmWtLIipWn7hxZixSqzQ
 RWjgUE1ax76jmApLU0mO2XZuXL5hNOnXpVgNqs4WtCJbRLDn2IPdWmjfnWTLvM6TzNTw+r1Qe64Fn
 VS7icwSArorNHkB5SOV+51lwgmXBvKu/SYddcRAV+wcQx3ta+ofj6u9UIT+tVYE+AVDw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=k7HMgCpPVzoOCNhuAjZVYKMRt2o3N6/Rn9+h+RyHgJc=; b=Q1JPpOIEYJvv7B9uwl7W6ym5Ry
 UbSRtKagLEoXHXxvBIWLG0EdJaN6HZICqWyd4YR6ietp7pUHHkZOKMtVlWEGcKqPvCEKqbl073oxi
 zX2L8gLvz0VfT6aQVLZwHtIKzbMg4Xabk2ueJadofixAilEmcEjsfYfAbC0g+wfXySJ0=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w8425-0003ev-Nx for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 01 Apr 2026 22:27:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6391143B79;
 Wed,  1 Apr 2026 22:27:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E65FBC4CEF7;
 Wed,  1 Apr 2026 22:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1775082439;
 bh=SYq0ujua23qXK/LmWqJZytMbuhwswv6VTuzwYXfuOO0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B5PXSPnM0g7dK54PuwCSAWqQJYwrb9QuFC3fNTXETKKaPEJa0LN6Qb71B1NKfCgkg
 zJ0YjonIndei8PlYKBNx5dFcfXhWpE+WBZbDACHmNuwim4lfvEmA3bvnNrqmY9fahl
 Rl9nb+RqNpAaOMAysgc+seVnfv95Xj1Oym+k9JlAwQFods4T+I06Kf50gAfdZgcbkj
 GbdbrTPPg+Vkh1rA4vuOIcDNMaHtAZoEjic2ruqY4tQldFn4TygR5eXvCGwAXISi6S
 kJWerpbb33PgwTewr82iGadRDTJWVbaKtQFxcemStEAmZQ7+vEhxTr9EO0FxOa60bl
 ti4gyubWkuz8Q==
Date: Wed, 1 Apr 2026 15:27:17 -0700
To: Andrey Albershteyn <aalbersh@kernel.org>
Message-ID: <20260401222717.GH2466@quark>
References: <20260331212827.2631020-1-aalbersh@kernel.org>
 <20260331212827.2631020-4-aalbersh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260331212827.2631020-4-aalbersh@kernel.org>
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Mar 31, 2026 at 11:28:04PM +0200, Andrey Albershteyn
 wrote: > Compute the hash of one filesystem block's worth of zeros. A
 filesystem
 > implementation can decide to elide merkle tree blocks co [...] 
 Content analysis details:   (-0.7 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1w8425-0003ev-Nx
Subject: Re: [f2fs-dev] [PATCH v6 03/22] fsverity: generate and store
 zero-block hash
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
Cc: fsverity@lists.linux.dev, djwong@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org, hch@lst.de,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
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
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS(0.00)[m:aalbersh@kernel.org,m:fsverity@lists.linux.dev,m:djwong@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
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
	HAS_REPLYTO(0.00)[ebiggers@kernel.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: 03FAF380F15
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 11:28:04PM +0200, Andrey Albershteyn wrote:
> Compute the hash of one filesystem block's worth of zeros. A filesystem
> implementation can decide to elide merkle tree blocks containing only
> this hash and synthesize the contents at read time.
> 
> Let's pretend that there's a file containing six data blocks and whose
> merkle tree looks roughly like this:
> 
> root
>  +--leaf0
>  |   +--data0
>  |   +--data1
>  |   `--data2
>  `--leaf1
>      +--data3
>      +--data4
>      `--data5
> 
> If data[0-2] are sparse holes, then leaf0 will contain a repeating
> sequence of @zero_digest.  Therefore, leaf0 need not be written to disk
> because its contents can be synthesized.
> 
> A subsequent xfs patch will use this to reduce the size of the merkle
> tree when dealing with sparse gold master disk images and the like.
> 
> Add a helper to pre-fill folio with hashes of empty blocks. This will be
> used by iomap to synthesize blocks full of zero hashes on the fly.
> 
> Signed-off-by: Darrick J. Wong <djwong@kernel.org>
> Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
> ---
>  fs/verity/fsverity_private.h |  3 +++
>  fs/verity/open.c             |  3 +++
>  fs/verity/pagecache.c        | 22 ++++++++++++++++++++++
>  include/linux/fsverity.h     |  8 ++++++++
>  4 files changed, 36 insertions(+)

Acked-by: Eric Biggers <ebiggers@kernel.org>

The example given in the commit message is a bit misleading, though.
Usually there are actually 128 hashes per block, and a block of hashes
covers 512 KiB.  So this optimization applies only where there is a hole
in the file's data of size (at least) 512 KiB, aligned to the same
amount.

It's also worth noting that this optimization is being done only for the
first level.  The levels above that are still being stored.  So, this
doesn't really enable e.g. exabyte sized sparse regions, as a block will
still be stored for each 64 MiB (instead of every 512 KiB).

I'm okay with this if you want to do this, but I just want to make sure
its limitations are well-understood.

> +	/* the hash of a merkle block-sized buffer of zeroes */
> +	u8 zero_digest[FS_VERITY_MAX_DIGEST_SIZE];

"the hash of an all-zeroes block" would be clearer.  This is the hash
from fsverity_hash_block() which includes the optional salt, not the
hash from fsverity_hash_buffer() which does not include the salt.

> +/**
> + * fsverity_fill_zerohash() - fill folio with hashes of zero data block
> + * @folio:	folio to fill
> + * @poff:	offset in the folio to start
> + * @plen:	length of the range to fill with hashes

Maybe go with (len, offset) for consistency with
fsverity_verify_blocks().  (I assume the "p" prefix stands for "page",
which is misleading since this works with a folio.)

> +void fsverity_fill_zerohash(struct folio *folio, size_t poff, size_t plen,
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

This could be done more efficiently, especially on HIGHMEM.  Probably
fine for now though, especially since the intersection of anyone wanting
XFS && fsverity && HIGHMEM is likely to be extremely small.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
