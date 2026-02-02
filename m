Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJB3NIKngGlNAAMAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Feb 2026 14:32:50 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7F0CCC33
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Feb 2026 14:32:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=59aCYIoe2DAF+OI07+V5WTOvNRmipdMa21N28gvURo4=; b=ag2ryvvOM6+zCQNlpGgsD/iKTv
	+6JPND8up5KQCNVKQGZ7QXANFOdSy4Htxq7lWYTcQ3hZSGJTWKrPWlffGmfmQMWd4q5AzQLtonhz9
	lf+2ZKEpDAA+ckkjSytUcCEZd3+8+ynhYHY7pUkAp0Fdo9lCi47d0PCYuZ2JgIEldeqQ=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vmu2m-0006Hb-Km;
	Mon, 02 Feb 2026 13:32:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1vmu2l-0006HV-FI
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Feb 2026 13:32:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5plI+HfqZziecUak4ZWGn/wnaJEmJVeBgs6AWYMzk+Q=; b=f3kWpMyzAvfb3UXHMPhi7H3y/J
 d1O9hGnphRaGri7Ief0vHP8+4Qlucb5P2rhS+LOvW0lGwagnn/RIgTGnE0DHe1q2EFMd7YtrGhkMa
 xmONDKIza79y7hsQxtRSprp/H80jmkZsoI8rzf/QJo7KKwmEmNbtOMwwRzEQiOBj/Vrc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5plI+HfqZziecUak4ZWGn/wnaJEmJVeBgs6AWYMzk+Q=; b=clA4M8lVwyGt+FF7utRznCkvqu
 cnX7ME2+8xY87hCNIjB1xGoed3clX+32t6SB9eYUslIFR1a5gJJFnMGQ97FCULioKOaMFebKoqAEJ
 fr/wqenkaVd6SWH1N+ArMHyMLCm+BBXxg+tlc6BpRJGthoG8OQCovLI9HRm5sk0uOjeU=;
Received: from smtp-out2.suse.de ([195.135.223.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vmu2k-0002id-Qj for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Feb 2026 13:32:43 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 622725BCFE;
 Mon,  2 Feb 2026 13:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1770039151; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5plI+HfqZziecUak4ZWGn/wnaJEmJVeBgs6AWYMzk+Q=;
 b=ws/xc31Ns1Vvsm9OyW8xqN+9wRVHLt/q/NsCl7KLWnFBsxyJYzrtLmSL63UeYRONzjahJA
 3ja6h1kh+614x346JBkAIIB6iMiGWAQzTGHNPigpvLxkFOQQkMG3zuP7P3qHGM22G4uSJ7
 Vpzh4sB98HKFc2q4GRNP9Twl8v6UHmw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1770039151;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5plI+HfqZziecUak4ZWGn/wnaJEmJVeBgs6AWYMzk+Q=;
 b=vJdLt/42ofHM+luzwtAdmqnRi/1JPT8d7hB/BSuh+kkdUGaocut9O908SaiqPYhvZO5Ub3
 gBAO02GvRLQM2tDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1770039151; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5plI+HfqZziecUak4ZWGn/wnaJEmJVeBgs6AWYMzk+Q=;
 b=ws/xc31Ns1Vvsm9OyW8xqN+9wRVHLt/q/NsCl7KLWnFBsxyJYzrtLmSL63UeYRONzjahJA
 3ja6h1kh+614x346JBkAIIB6iMiGWAQzTGHNPigpvLxkFOQQkMG3zuP7P3qHGM22G4uSJ7
 Vpzh4sB98HKFc2q4GRNP9Twl8v6UHmw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1770039151;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5plI+HfqZziecUak4ZWGn/wnaJEmJVeBgs6AWYMzk+Q=;
 b=vJdLt/42ofHM+luzwtAdmqnRi/1JPT8d7hB/BSuh+kkdUGaocut9O908SaiqPYhvZO5Ub3
 gBAO02GvRLQM2tDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 486103EA62;
 Mon,  2 Feb 2026 13:32:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id qkGjEW+ngGmyaAAAD6G6ig
 (envelope-from <jack@suse.cz>); Mon, 02 Feb 2026 13:32:31 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 030E6A08F8; Mon,  2 Feb 2026 14:32:30 +0100 (CET)
Date: Mon, 2 Feb 2026 14:32:30 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <dbxzia62hlrwhowtxj6nzjgfvqf6zdn7y22rwgfxha35hwltcz@ys3mms55u4lc>
References: <20260202060754.270269-1-hch@lst.de>
 <20260202060754.270269-4-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260202060754.270269-4-hch@lst.de>
X-Spam-Score: -3.80
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon 02-02-26 07:06:32, Christoph Hellwig wrote: > Keep
 all the read into pagecache code in a single file. > > Signed-off-by:
 Christoph
 Hellwig <hch@lst.de> Whatever :). Feel free to add: Reviewed-by: Jan Kara
 <jack@suse.cz> 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1vmu2k-0002id-Qj
Subject: Re: [f2fs-dev] [PATCH 03/11] ext4: move ->read_folio and
 ->readahead to readahead.c
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
Cc: fsverity@lists.linux.dev, Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>, Andrey Albershteyn <aalbersh@redhat.com>,
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
 Eric Biggers <ebiggers@kernel.org>, linux-fsdevel@vger.kernel.org,
 Al Viro <viro@zeniv.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>,
 David Sterba <dsterba@suse.com>, Theodore Ts'o <tytso@mit.edu>,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lst.de:email,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,suse.cz:email];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:fsverity@lists.linux.dev,m:brauner@kernel.org,m:jack@suse.cz,m:aalbersh@redhat.com,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:ebiggers@kernel.org,m:linux-fsdevel@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:jaegeuk@kernel.org,m:dsterba@suse.com,m:tytso@mit.edu,m:linux-ext4@vger.kernel.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	RCPT_COUNT_TWELVE(0.00)[15];
	DMARC_NA(0.00)[suse.cz];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jack@suse.cz,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jack@suse.cz,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,suse.cz:-];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2A7F0CCC33
X-Rspamd-Action: no action

On Mon 02-02-26 07:06:32, Christoph Hellwig wrote:
> Keep all the read into pagecache code in a single file.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Whatever :). Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/ext4/ext4.h     |  4 ++--
>  fs/ext4/inode.c    | 27 ---------------------------
>  fs/ext4/readpage.c | 31 ++++++++++++++++++++++++++++++-
>  3 files changed, 32 insertions(+), 30 deletions(-)
> 
> diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
> index 56112f201cac..a8a448e20ef8 100644
> --- a/fs/ext4/ext4.h
> +++ b/fs/ext4/ext4.h
> @@ -3735,8 +3735,8 @@ static inline void ext4_set_de_type(struct super_block *sb,
>  }
>  
>  /* readpages.c */
> -extern int ext4_mpage_readpages(struct inode *inode,
> -		struct readahead_control *rac, struct folio *folio);
> +int ext4_read_folio(struct file *file, struct folio *folio);
> +void ext4_readahead(struct readahead_control *rac);
>  extern int __init ext4_init_post_read_processing(void);
>  extern void ext4_exit_post_read_processing(void);
>  
> diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
> index 8c2ef98fa530..e98954e7d0b3 100644
> --- a/fs/ext4/inode.c
> +++ b/fs/ext4/inode.c
> @@ -3380,33 +3380,6 @@ static sector_t ext4_bmap(struct address_space *mapping, sector_t block)
>  	return ret;
>  }
>  
> -static int ext4_read_folio(struct file *file, struct folio *folio)
> -{
> -	int ret = -EAGAIN;
> -	struct inode *inode = folio->mapping->host;
> -
> -	trace_ext4_read_folio(inode, folio);
> -
> -	if (ext4_has_inline_data(inode))
> -		ret = ext4_readpage_inline(inode, folio);
> -
> -	if (ret == -EAGAIN)
> -		return ext4_mpage_readpages(inode, NULL, folio);
> -
> -	return ret;
> -}
> -
> -static void ext4_readahead(struct readahead_control *rac)
> -{
> -	struct inode *inode = rac->mapping->host;
> -
> -	/* If the file has inline data, no need to do readahead. */
> -	if (ext4_has_inline_data(inode))
> -		return;
> -
> -	ext4_mpage_readpages(inode, rac, NULL);
> -}
> -
>  static void ext4_invalidate_folio(struct folio *folio, size_t offset,
>  				size_t length)
>  {
> diff --git a/fs/ext4/readpage.c b/fs/ext4/readpage.c
> index 267594ef0b2c..bf84952ebf94 100644
> --- a/fs/ext4/readpage.c
> +++ b/fs/ext4/readpage.c
> @@ -45,6 +45,7 @@
>  #include <linux/pagevec.h>
>  
>  #include "ext4.h"
> +#include <trace/events/ext4.h>
>  
>  #define NUM_PREALLOC_POST_READ_CTXS	128
>  
> @@ -209,7 +210,7 @@ static inline loff_t ext4_readpage_limit(struct inode *inode)
>  	return i_size_read(inode);
>  }
>  
> -int ext4_mpage_readpages(struct inode *inode,
> +static int ext4_mpage_readpages(struct inode *inode,
>  		struct readahead_control *rac, struct folio *folio)
>  {
>  	struct bio *bio = NULL;
> @@ -394,6 +395,34 @@ int ext4_mpage_readpages(struct inode *inode,
>  	return 0;
>  }
>  
> +int ext4_read_folio(struct file *file, struct folio *folio)
> +{
> +	int ret = -EAGAIN;
> +	struct inode *inode = folio->mapping->host;
> +
> +	trace_ext4_read_folio(inode, folio);
> +
> +	if (ext4_has_inline_data(inode))
> +		ret = ext4_readpage_inline(inode, folio);
> +
> +	if (ret == -EAGAIN)
> +		return ext4_mpage_readpages(inode, NULL, folio);
> +
> +	return ret;
> +}
> +
> +void ext4_readahead(struct readahead_control *rac)
> +{
> +	struct inode *inode = rac->mapping->host;
> +
> +	/* If the file has inline data, no need to do readahead. */
> +	if (ext4_has_inline_data(inode))
> +		return;
> +
> +	ext4_mpage_readpages(inode, rac, NULL);
> +}
> +
> +
>  int __init ext4_init_post_read_processing(void)
>  {
>  	bio_post_read_ctx_cache = KMEM_CACHE(bio_post_read_ctx, SLAB_RECLAIM_ACCOUNT);
> -- 
> 2.47.3
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
