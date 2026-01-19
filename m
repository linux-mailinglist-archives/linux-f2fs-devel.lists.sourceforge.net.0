Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B87BD3A2B9
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jan 2026 10:21:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1tTOSY3lmBg48qgkFKxAP8C9Ps7Yh4ZLeOpPw1S0MaU=; b=GyeY8lUJoqpEuKr1Rc0X/5KDbL
	Cevith5nEK7auLWJAO+71OpeNlzBtZgFLBDCxA2gJVMf2L5CWSpE6KSYTdTbvxRr8frszlzZVbwtv
	/fD0sKoWcCrVT+n70tz/FTxWXK2enL+CwmuaBwgehHsqMeqhXLGUQKlHW2svTat2ZYOo=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vhlRd-0003Nx-Hs;
	Mon, 19 Jan 2026 09:21:09 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1vhlRb-0003Nq-K0
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jan 2026 09:21:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Kov4TxJ75N/pNeC/fZMYG2YU8YoOuyYPf6L+iQt/4AE=; b=MMzqyi5GB3U3h9fx8rE+ZPG/7c
 ZkjuZpF+QtY5LQn6GKNk+cz4tMGepZP148TtYAbAQkd8bVEkNl4ahO+/Rd+bFbf550+T8rYo82TVc
 XpcNdOhFjld5UXt6bSxj6PR9ofVh7xuI459EynV13S5jZVCH9AK8IZqMiEja80tUnhJY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Kov4TxJ75N/pNeC/fZMYG2YU8YoOuyYPf6L+iQt/4AE=; b=TveEO9YwdBOVtHZJ+Pg94YY1c3
 ItQbQNyXFjwC2hCdxPCPKPoaeVArXF6oHe3jZsUk4yavXJWph6vrT3+umxjOw0sEVYKc96jCqWITp
 BGFwXx8bIs6eEFgw2RBHh+5rQ0KxUTJTVVVhsoeWgu0TL9UERRyE6JH0rKm0/wiDewic=;
Received: from smtp-out1.suse.de ([195.135.223.130])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vhlRb-0008U8-1T for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jan 2026 09:21:07 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9D470336FE;
 Mon, 19 Jan 2026 09:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1768814460; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Kov4TxJ75N/pNeC/fZMYG2YU8YoOuyYPf6L+iQt/4AE=;
 b=muNJLIIWILm2zOOIfaF7GR0O61mgNXJDJxnhNkE/G7EP8d9R0bWUntUoOBk5YnEVIFTGW3
 RYJS6rE/OlyL02VXTD8v1X88IXrhOUPZedSf9xRpDPozNj5/6+hn2NohF/eG66JYWT2/zR
 iLXqPdDl8J0Mg5gX2hBgvP6QKiph8aE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1768814460;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Kov4TxJ75N/pNeC/fZMYG2YU8YoOuyYPf6L+iQt/4AE=;
 b=1mvLXEdGWwlXE1uRbDC3588tOtZSw/ezk3rT1XW+sAst3tauFVLQc4m70Cs0wksJzUrN8G
 EGWYIUtJX+m68uDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1768814460; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Kov4TxJ75N/pNeC/fZMYG2YU8YoOuyYPf6L+iQt/4AE=;
 b=muNJLIIWILm2zOOIfaF7GR0O61mgNXJDJxnhNkE/G7EP8d9R0bWUntUoOBk5YnEVIFTGW3
 RYJS6rE/OlyL02VXTD8v1X88IXrhOUPZedSf9xRpDPozNj5/6+hn2NohF/eG66JYWT2/zR
 iLXqPdDl8J0Mg5gX2hBgvP6QKiph8aE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1768814460;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Kov4TxJ75N/pNeC/fZMYG2YU8YoOuyYPf6L+iQt/4AE=;
 b=1mvLXEdGWwlXE1uRbDC3588tOtZSw/ezk3rT1XW+sAst3tauFVLQc4m70Cs0wksJzUrN8G
 EGWYIUtJX+m68uDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 925DC3EA63;
 Mon, 19 Jan 2026 09:21:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id hTi1I3z3bWnzSgAAD6G6ig
 (envelope-from <jack@suse.cz>); Mon, 19 Jan 2026 09:21:00 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 60DD6A0A29; Mon, 19 Jan 2026 10:21:00 +0100 (CET)
Date: Mon, 19 Jan 2026 10:21:00 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <z4652hoxetll645hgpfuhy3pogm5y32ealgydlaz4kwve6qc2g@bl6ilzut2ybp>
References: <20260119062250.3998674-1-hch@lst.de>
 <20260119062250.3998674-5-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260119062250.3998674-5-hch@lst.de>
X-Spam-Score: -3.80
X-Spamd-Result: default: False [-3.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_RHS_NOT_FQDN(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MISSING_XM_UA(0.00)[]; FROM_HAS_DN(0.00)[];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[15]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCVD_COUNT_THREE(0.00)[3]; TO_DN_SOME(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 RCVD_TLS_LAST(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:email]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon 19-01-26 07:22:45, Christoph Hellwig wrote: > Use the
 kernel's resizable hash table to find the fsverity_info. This > way file
 systems that want to support fsverity don't have to bloat > every [...] 
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
X-Headers-End: 1vhlRb-0008U8-1T
Subject: Re: [f2fs-dev] [PATCH 4/6] fsverity: use a hashtable to find the
 fsverity_info
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
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 Jaegeuk Kim <jaegeuk@kernel.org>, David Sterba <dsterba@suse.com>,
 Theodore Ts'o <tytso@mit.edu>, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon 19-01-26 07:22:45, Christoph Hellwig wrote:
> Use the kernel's resizable hash table to find the fsverity_info.  This
> way file systems that want to support fsverity don't have to bloat
> every inode in the system with an extra pointer.  The tradeoff is that
> looking up the fsverity_info is a bit more expensive now, but the main
> operations are still dominated by I/O and hashing overhead.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

...

> diff --git a/fs/verity/enable.c b/fs/verity/enable.c
> index 95ec42b84797..91cada0d455c 100644
> --- a/fs/verity/enable.c
> +++ b/fs/verity/enable.c
> @@ -264,9 +264,24 @@ static int enable_verity(struct file *filp,
>  		goto rollback;
>  	}
>  
> +	/*
> +	 * Add the fsverity_info into the hash table before finishing the
> +	 * initialization.  This ensures we don't have to undo the enabling when
> +	 * memory allocation for the hash table fails.  This is safe because
> +	 * looking up the fsverity_info always first checks the S_VERITY flag on
> +	 * the inode, which will only be set at the very end of the
> +	 * ->end_enable_verity method.
> +	 */
> +	err = fsverity_set_info(vi);
> +	if (err)
> +		goto rollback;

OK, but since __fsverity_get_info() is just rhashtable_lookup_fast() what
prevents the CPU from reordering the hash table reads before the S_VERITY
check? I think you need a barrier in fsverity_get_info() to enforce the
proper ordering. The matching ordering during setting of S_VERITY is
implied by cmpxchg used to manipulate i_flags so that part should be fine.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
