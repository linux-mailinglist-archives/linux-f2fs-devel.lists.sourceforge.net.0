Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFYgKJQ3dWkqCQEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 24 Jan 2026 22:20:20 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D71F17F057
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 24 Jan 2026 22:20:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iAz7NFN3qMIcbJ0oECssvHHmPlQuAaAeH1+/hLXbXL0=; b=lOJSiVQsDuHk4pjqAe8Ip5a1kO
	Qusbi7mzFh3s+habLrvqQJG/2MTbmicQgqSjv0oL7PvzlLRXUGMJCedvnOcjGmA1tvG5MdPypgIBy
	tgWJJsr4Z1w+I7Eo+opXXiuSVSrQwDGRaQIcyIfjdePGALR4ojkQfHYz5x7E1ADedMMc=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vjl3F-0007NO-4W;
	Sat, 24 Jan 2026 21:20:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1vjl3D-0007NI-Sh
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 24 Jan 2026 21:20:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=33od168mFhXauAgjQqwXth1skObIHMKdVKwrC1IyA80=; b=hlfl5qyXU4O3ozXywDgeAp4NDU
 91VKxkKKotP30FRN8/edaupqSFVB5h5M9Hb9MTyBQd8Pw99UWUlWLZmoPEyZx2Wh2MZRpDfgFiBOP
 gVSRQGet41iiR/uVhVI8Qd2QOMxBxiPHUHooIrlwTcI/ric0PO0ezSGP1939EqdWDkwc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=33od168mFhXauAgjQqwXth1skObIHMKdVKwrC1IyA80=; b=lBiCLIhey0X5QByB5zqubXF79R
 YLsExueWmlMtGUHYXbPnfmQSF8x2UwMmgLUS2OfoZVv8S4TJUHYuiOHBUOCJPeQfCRGayzfcC7jxb
 QRg51/Bp/l5HQ6c4YJLhBgQkaHtdYswY6Fsy1pJo4k+CJ54SH0FKHY7Rg9+K7vUcPqXk=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vjl3C-00086j-CT for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 24 Jan 2026 21:20:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B875960018;
 Sat, 24 Jan 2026 21:20:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE05BC116D0;
 Sat, 24 Jan 2026 21:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769289604;
 bh=oI+uA3O35prux956Vzu7Z1UUlwDa0yJcLaD0R2S8IsY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tx3PHjVFa71TMA8P2jVrrQzZkrnzrpZqil3kd3DaCVTplbq9iK6DlJ8qsql1thPAv
 UNjuW1nfiRVWAbZf+LRjOeoUGh4XP+zmVrTNSc8g7amTOCb4vyFpcPWGiqIIenq2dB
 vft8MwRjbFKObQYd0ghcaHYdAZbM58IwoBylA9FvOa/jgLOmx9LjHJvNd36n4Pcm2R
 L8QHWrN4AT/1gM+82FP1MC53CTF2OW1OSsDNz1AatHjk7o4UTRUS+VrtUNfKt2GK58
 xob/cAfD4zqAwb+w2F7IClIn40cu37XDMKbfm3FWH+cSbAYgtbkiZuLzAG63322rOw
 Mk5sbTrl4k/7w==
Date: Sat, 24 Jan 2026 13:19:56 -0800
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20260124211956.GF2762@quark>
References: <20260122082214.452153-1-hch@lst.de>
 <20260122082214.452153-7-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260122082214.452153-7-hch@lst.de>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jan 22, 2026 at 09:22:02AM +0100, Christoph Hellwig
 wrote: > Pass a struct fsverity_info to the verification and readahead helpers,
 > and push the lookup into the callers. Right now this is a [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [172.105.4.254 listed in list.dnswl.org]
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vjl3C-00086j-CT
Subject: Re: [f2fs-dev] [PATCH 06/11] fsverity: push out fsverity_info lookup
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
Cc: fsverity@lists.linux.dev, Christian Brauner <brauner@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, Andrey Albershteyn <aalbersh@redhat.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 Al Viro <viro@zeniv.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>,
 David Sterba <dsterba@suse.com>, Jan Kara <jack@suse.cz>,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-7.71 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:fsverity@lists.linux.dev,m:brauner@kernel.org,m:tytso@mit.edu,m:aalbersh@redhat.com,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fsdevel@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:jaegeuk@kernel.org,m:dsterba@suse.com,m:jack@suse.cz,m:linux-ext4@vger.kernel.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCPT_COUNT_TWELVE(0.00)[14];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[ebiggers@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:email]
X-Rspamd-Queue-Id: D71F17F057
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 09:22:02AM +0100, Christoph Hellwig wrote:
> Pass a struct fsverity_info to the verification and readahead helpers,
> and push the lookup into the callers.  Right now this is a very
> dumb almost mechanic move that open codes a lot of fsverity_info_addr()
> calls int the file systems.  The subsequent patches will clean this up.
> 
> This prepares for reducing the number of fsverity_info lookups, which
> will allow to amortize them better when using a more expensive lookup
> method.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/btrfs/extent_io.c     |  4 +++-
>  fs/buffer.c              |  4 +++-
>  fs/ext4/readpage.c       | 11 ++++++++---
>  fs/f2fs/compress.c       |  4 +++-
>  fs/f2fs/data.c           | 15 +++++++++++----
>  fs/verity/verify.c       | 26 ++++++++++++++------------
>  include/linux/fsverity.h | 24 +++++++++++++++---------
>  7 files changed, 57 insertions(+), 31 deletions(-)

This patch introduces another bisection hazard by adding calls to
fsverity_info_addr() when CONFIG_FS_VERITY=n.  fsverity_info_addr() has
a definition only when CONFIG_FS_VERITY=y.

Maybe temporarily add a CONFIG_FS_VERITY=n stub for fsverity_info_addr()
that returns NULL, and also ensure that it's dereferenced only when it's
known that fsverity verification is needed.  Most of the call sites look
okay, but the second one in ext4_mpage_readpages() needs to be fixed.

> @@ -430,6 +431,7 @@ EXPORT_SYMBOL_GPL(fsverity_verify_blocks);
>  #ifdef CONFIG_BLOCK
>  /**
>   * fsverity_verify_bio() - verify a 'read' bio that has just completed
> + * @vi: fsverity_info for the inode to be read
>   * @bio: the bio to verify
>   *
>   * Verify the bio's data against the file's Merkle tree.  All bio data segments
> @@ -442,13 +444,13 @@ EXPORT_SYMBOL_GPL(fsverity_verify_blocks);
>   * filesystems) must instead call fsverity_verify_page() directly on each page.
>   * All filesystems must also call fsverity_verify_page() on holes.
>   */
> -void fsverity_verify_bio(struct bio *bio)
> +void fsverity_verify_bio(struct fsverity_info *vi, struct bio *bio)
>  {
>  	struct inode *inode = bio_first_folio_all(bio)->mapping->host;
>  	struct fsverity_verification_context ctx;
>  	struct folio_iter fi;
>  
> -	fsverity_init_verification_context(&ctx, inode);
> +	fsverity_init_verification_context(&ctx, inode, vi);

Note that fsverity_info has a back-pointer to the inode.  So,
fsverity_init_verification_context() could just take the vi and set
ctx->inode to vi->inode.

Then it wouldn't be necessary to get the inode from
bio_first_folio_all(bio)->mapping->host (in fsverity_verify_bio()) or
folio->mapping->host (in fsverity_verify_blocks()).
Similarly in fsverity_readahead() too.

(It might make sense to handle this part as a separate patch.)

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
