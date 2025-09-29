Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A48BA8DCB
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Sep 2025 12:18:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fEEk/Ye/icyGikjSfYCzub6t0Jb4efZnkuetAttbkys=; b=Dq7OhmaFdkeN0+aAkzXOTHz1v5
	QiVMlXhf2wfsxp/ckO1Gps0C69xS/OAsJYznQ3AiSwqe41DcP1TzAYnBKcppCh5Yi2nR/P+1/CFd/
	d/k2r1+dDKmoJJ500p+M4Oa+w5vAtO52xYT2swu0SD1tXFvgLN3fuFOW1RqjMXKlKDO4=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v3Axk-0004ZY-Cn;
	Mon, 29 Sep 2025 10:18:32 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1v3Axj-0004ZS-4T
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Sep 2025 10:18:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=O2yBKi9Fq0nOViIKZg3SIh9QmVDk29CqUOt+SEIPUkE=; b=J/fFKwrEpGPG/rzT5MRgd8Kq+/
 Hty2PS7Vl2kwjUazvDtAO4wzeJQz7nzB6NUab6IlsBbbKRPs4dN6i6eD3X8JWpu9Xo/QSPHxXRIvK
 jpuuuDZI2i6bazUMOVRfknz9b/heJO+DRz3C4g51zrGIctnlYMT0TccVc57N/dA5xzJA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=O2yBKi9Fq0nOViIKZg3SIh9QmVDk29CqUOt+SEIPUkE=; b=cEn4D8st6CawdaOJl3AH70xU26
 UX4VHKB8V+q7jxRqzUVqpYEDjw5YSAURHm8PC0ICBcDGa6dRxQ7WhNYB0axzplgs4nLsAU3USgaW/
 i5pXhqQHhNWsgOOfsJff+9GWRTOroQypfQufSdxRSLdvknF1JdzfIZJDJCi12oZFe7EU=;
Received: from smtp-out2.suse.de ([195.135.223.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1v3Axi-00080K-7A for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Sep 2025 10:18:31 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A1EE330DC9;
 Mon, 29 Sep 2025 10:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1759141098; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O2yBKi9Fq0nOViIKZg3SIh9QmVDk29CqUOt+SEIPUkE=;
 b=ze0uavD5fcj6zgsYfAAoXp3CaBdBChk073NpR64CDwUZ9V3HqLcpul8tg4dL6/zYb/G16n
 58fgcgV4xECQEjgKIgp7hrExw3Yp1t/g/cUq72DiJpGcz1ttJTFgP6Bbxxa6OgagyGGFIX
 XC5T0aPkQmua+WyHwC7wBaA+Ur/bgDE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1759141098;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O2yBKi9Fq0nOViIKZg3SIh9QmVDk29CqUOt+SEIPUkE=;
 b=kx+H4A4QTF4A4FST6e8sO/r5cOZxgOnk95kb9xh3cRBunKnQCDM+e9GImfLaMKpNmdnzj/
 KDpDB8t+RtbDASCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1759141098; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O2yBKi9Fq0nOViIKZg3SIh9QmVDk29CqUOt+SEIPUkE=;
 b=ze0uavD5fcj6zgsYfAAoXp3CaBdBChk073NpR64CDwUZ9V3HqLcpul8tg4dL6/zYb/G16n
 58fgcgV4xECQEjgKIgp7hrExw3Yp1t/g/cUq72DiJpGcz1ttJTFgP6Bbxxa6OgagyGGFIX
 XC5T0aPkQmua+WyHwC7wBaA+Ur/bgDE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1759141098;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O2yBKi9Fq0nOViIKZg3SIh9QmVDk29CqUOt+SEIPUkE=;
 b=kx+H4A4QTF4A4FST6e8sO/r5cOZxgOnk95kb9xh3cRBunKnQCDM+e9GImfLaMKpNmdnzj/
 KDpDB8t+RtbDASCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 91FC613A21;
 Mon, 29 Sep 2025 10:18:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id tYCaI+pc2mjOWAAAD6G6ig
 (envelope-from <jack@suse.cz>); Mon, 29 Sep 2025 10:18:18 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 3412BA0A96; Mon, 29 Sep 2025 12:18:14 +0200 (CEST)
Date: Mon, 29 Sep 2025 12:18:14 +0200
From: Jan Kara <jack@suse.cz>
To: Julian Sun <sunjunchao@bytedance.com>
Message-ID: <jvryicw6lssdnji4y42rblchxt3procns2otfa4bdc6spekyh7@e6xqcjfpirck>
References: <20250929095544.308392-1-sunjunchao@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250929095544.308392-1-sunjunchao@bytedance.com>
X-Spamd-Result: default: False [-3.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_RHS_NOT_FQDN(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-0.999]; MIME_GOOD(-0.10)[text/plain];
 RCVD_COUNT_THREE(0.00)[3]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 RCPT_COUNT_TWELVE(0.00)[18]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; TO_DN_SOME(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RCVD_TLS_LAST(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FREEMAIL_CC(0.00)[vger.kernel.org,lists.sourceforge.net,fb.com,suse.com,redhat.com,gmail.com,mit.edu,dilger.ca,kernel.org,infradead.org,suse.cz];
 MISSING_XM_UA(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,bytedance.com:email]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -3.80
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon 29-09-25 17:55:44, Julian Sun wrote: > The logic in
 wbc_to_tag() is widely used in file systems, so modify this > function to
 be extern and use it in file systems. > > This patch has only passe [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1v3Axi-00080K-7A
Subject: Re: [f2fs-dev] [PATCH] fs: Make wbc_to_tag() extern and use it in
 fs.
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
Cc: brauner@kernel.org, xiubli@redhat.com, tytso@mit.edu, agruenba@redhat.com,
 jack@suse.cz, willy@infradead.org, linux-f2fs-devel@lists.sourceforge.net,
 clm@fb.com, dsterba@suse.com, jaegeuk@kernel.org,
 linux-fsdevel@vger.kernel.org, adilger.kernel@dilger.ca,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org, idryomov@gmail.com,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon 29-09-25 17:55:44, Julian Sun wrote:
> The logic in wbc_to_tag() is widely used in file systems, so modify this
> function to be extern and use it in file systems.
> 
> This patch has only passed compilation tests, but it should be fine.
> 
> Signed-off-by: Julian Sun <sunjunchao@bytedance.com>

Yeah, good idea. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/btrfs/extent_io.c      | 5 +----
>  fs/ceph/addr.c            | 6 +-----
>  fs/ext4/inode.c           | 5 +----
>  fs/f2fs/data.c            | 5 +----
>  fs/gfs2/aops.c            | 5 +----
>  include/linux/writeback.h | 1 +
>  mm/page-writeback.c       | 2 +-
>  7 files changed, 7 insertions(+), 22 deletions(-)
> 
> diff --git a/fs/btrfs/extent_io.c b/fs/btrfs/extent_io.c
> index b21cb72835cc..0fea58287175 100644
> --- a/fs/btrfs/extent_io.c
> +++ b/fs/btrfs/extent_io.c
> @@ -2390,10 +2390,7 @@ static int extent_write_cache_pages(struct address_space *mapping,
>  			       &BTRFS_I(inode)->runtime_flags))
>  		wbc->tagged_writepages = 1;
>  
> -	if (wbc->sync_mode == WB_SYNC_ALL || wbc->tagged_writepages)
> -		tag = PAGECACHE_TAG_TOWRITE;
> -	else
> -		tag = PAGECACHE_TAG_DIRTY;
> +	tag = wbc_to_tag(wbc);
>  retry:
>  	if (wbc->sync_mode == WB_SYNC_ALL || wbc->tagged_writepages)
>  		tag_pages_for_writeback(mapping, index, end);
> diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
> index 322ed268f14a..63b75d214210 100644
> --- a/fs/ceph/addr.c
> +++ b/fs/ceph/addr.c
> @@ -1045,11 +1045,7 @@ void ceph_init_writeback_ctl(struct address_space *mapping,
>  	ceph_wbc->index = ceph_wbc->start_index;
>  	ceph_wbc->end = -1;
>  
> -	if (wbc->sync_mode == WB_SYNC_ALL || wbc->tagged_writepages) {
> -		ceph_wbc->tag = PAGECACHE_TAG_TOWRITE;
> -	} else {
> -		ceph_wbc->tag = PAGECACHE_TAG_DIRTY;
> -	}
> +	ceph_wbc->tag = wbc_to_tag(wbc);
>  
>  	ceph_wbc->op_idx = -1;
>  	ceph_wbc->num_ops = 0;
> diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
> index 5b7a15db4953..196eba7fa39c 100644
> --- a/fs/ext4/inode.c
> +++ b/fs/ext4/inode.c
> @@ -2619,10 +2619,7 @@ static int mpage_prepare_extent_to_map(struct mpage_da_data *mpd)
>  	handle_t *handle = NULL;
>  	int bpp = ext4_journal_blocks_per_folio(mpd->inode);
>  
> -	if (mpd->wbc->sync_mode == WB_SYNC_ALL || mpd->wbc->tagged_writepages)
> -		tag = PAGECACHE_TAG_TOWRITE;
> -	else
> -		tag = PAGECACHE_TAG_DIRTY;
> +	tag = wbc_to_tag(mpd->wbc);
>  
>  	mpd->map.m_len = 0;
>  	mpd->next_pos = mpd->start_pos;
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 7961e0ddfca3..101e962845db 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -3003,10 +3003,7 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
>  		if (wbc->range_start == 0 && wbc->range_end == LLONG_MAX)
>  			range_whole = 1;
>  	}
> -	if (wbc->sync_mode == WB_SYNC_ALL || wbc->tagged_writepages)
> -		tag = PAGECACHE_TAG_TOWRITE;
> -	else
> -		tag = PAGECACHE_TAG_DIRTY;
> +	tag = wbc_to_tag(wbc);
>  retry:
>  	retry = 0;
>  	if (wbc->sync_mode == WB_SYNC_ALL || wbc->tagged_writepages)
> diff --git a/fs/gfs2/aops.c b/fs/gfs2/aops.c
> index 47d74afd63ac..12394fc5dd29 100644
> --- a/fs/gfs2/aops.c
> +++ b/fs/gfs2/aops.c
> @@ -311,10 +311,7 @@ static int gfs2_write_cache_jdata(struct address_space *mapping,
>  			range_whole = 1;
>  		cycled = 1; /* ignore range_cyclic tests */
>  	}
> -	if (wbc->sync_mode == WB_SYNC_ALL || wbc->tagged_writepages)
> -		tag = PAGECACHE_TAG_TOWRITE;
> -	else
> -		tag = PAGECACHE_TAG_DIRTY;
> +	tag = wbc_to_tag(wbc);
>  
>  retry:
>  	if (wbc->sync_mode == WB_SYNC_ALL || wbc->tagged_writepages)
> diff --git a/include/linux/writeback.h b/include/linux/writeback.h
> index a2848d731a46..884811596e10 100644
> --- a/include/linux/writeback.h
> +++ b/include/linux/writeback.h
> @@ -370,6 +370,7 @@ int do_writepages(struct address_space *mapping, struct writeback_control *wbc);
>  void writeback_set_ratelimit(void);
>  void tag_pages_for_writeback(struct address_space *mapping,
>  			     pgoff_t start, pgoff_t end);
> +xa_mark_t wbc_to_tag(struct writeback_control *wbc);
>  
>  bool filemap_dirty_folio(struct address_space *mapping, struct folio *folio);
>  bool folio_redirty_for_writepage(struct writeback_control *, struct folio *);
> diff --git a/mm/page-writeback.c b/mm/page-writeback.c
> index 3e248d1c3969..243808e19445 100644
> --- a/mm/page-writeback.c
> +++ b/mm/page-writeback.c
> @@ -2434,7 +2434,7 @@ static bool folio_prepare_writeback(struct address_space *mapping,
>  	return true;
>  }
>  
> -static xa_mark_t wbc_to_tag(struct writeback_control *wbc)
> +xa_mark_t wbc_to_tag(struct writeback_control *wbc)
>  {
>  	if (wbc->sync_mode == WB_SYNC_ALL || wbc->tagged_writepages)
>  		return PAGECACHE_TAG_TOWRITE;
> -- 
> 2.39.5
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
