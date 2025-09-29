Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 16231BA91F2
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Sep 2025 13:51:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SgC91fR+G4kRQvCXnVKBr3+9wAmkQk9qcbdcIpgZssE=; b=LpMrdVnlh43Grb68P21ZqJOvt/
	CfVTbqQ6QjlVOhAQtVPsMQWIUqy0fOysf61aAKQjmkjs0vy3pR5L8hUEoA08HQifPOmO2I+KG4W4j
	4UPwdRezGPp1Oc0Co55k4o1sNHdoN+qpQtFfBCpdc/arCK6emclO6gb5CxtFWyO95AAI=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v3CPH-0001Oi-Pw;
	Mon, 29 Sep 2025 11:51:03 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1v3COX-0001Ni-Gk
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Sep 2025 11:50:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mhU1lqYXGXju5aeAWCfAkcmAEShO+lmEqPcT3URjaMo=; b=c5QXS+it1uAq3oyfDcTswrffzn
 ahw58Wox44oirIfHZkLHqq0s7X9odJyXmWLP7DPmrY1HUCSE9t/MR8+AM7OVvLr1SkRfAcRBtvs2N
 lB3r1Jv1QjknlhVXw3zJGiA5o0jLAo41/cxx99oqWtm/2nLt5Gkfk3jwMZXBxyGluTRg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mhU1lqYXGXju5aeAWCfAkcmAEShO+lmEqPcT3URjaMo=; b=Q9gfGdbZGdqanCfgvRfSnw4J4c
 Hplz4qws9h+WWggQbuvVIwh/A/g6XyJxp+rP5qNaKULbMOqa+vgXlXzEMFVPBlt+dCni8evtGvTjP
 Pi4ce1yrjpU6cjU2fi1m+hEJ2UkV48vqOC+rdzqB569Fk3hCOj3Hy2jBgiWbSpPgkPY0=;
Received: from smtp-out2.suse.de ([195.135.223.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1v3COW-00053r-QT for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Sep 2025 11:50:17 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2361A31AF3;
 Mon, 29 Sep 2025 11:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1759146609; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mhU1lqYXGXju5aeAWCfAkcmAEShO+lmEqPcT3URjaMo=;
 b=x7XE9PkW9wQizwWe9LaNBRgqIZz17riSNCIn9Q9RnwOrAklEvW5ERjTJ9AuQSkibGT+l9d
 psN9vSNirJxSyMtJe1YOL/9+WshUo7EmJB6v/s5i/tTppxHQdQ49drNU3fBbcsiw8bDAC2
 UItS76CngkZDV5kZz4sQ8LscEl/J5RA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1759146609;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mhU1lqYXGXju5aeAWCfAkcmAEShO+lmEqPcT3URjaMo=;
 b=Wot1Z8VSPEtL8dVJWulj7w4q79zowLcGsJughLOgRdcw506Kveu5SNU1EWMps3R9hUb5pv
 mrrmdGF39r+PurDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1759146609; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mhU1lqYXGXju5aeAWCfAkcmAEShO+lmEqPcT3URjaMo=;
 b=x7XE9PkW9wQizwWe9LaNBRgqIZz17riSNCIn9Q9RnwOrAklEvW5ERjTJ9AuQSkibGT+l9d
 psN9vSNirJxSyMtJe1YOL/9+WshUo7EmJB6v/s5i/tTppxHQdQ49drNU3fBbcsiw8bDAC2
 UItS76CngkZDV5kZz4sQ8LscEl/J5RA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1759146609;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mhU1lqYXGXju5aeAWCfAkcmAEShO+lmEqPcT3URjaMo=;
 b=Wot1Z8VSPEtL8dVJWulj7w4q79zowLcGsJughLOgRdcw506Kveu5SNU1EWMps3R9hUb5pv
 mrrmdGF39r+PurDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1035713A21;
 Mon, 29 Sep 2025 11:50:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id FnXuA3Fy2mjAdwAAD6G6ig
 (envelope-from <jack@suse.cz>); Mon, 29 Sep 2025 11:50:09 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id B51B2A0A96; Mon, 29 Sep 2025 13:50:08 +0200 (CEST)
Date: Mon, 29 Sep 2025 13:50:08 +0200
From: Jan Kara <jack@suse.cz>
To: Julian Sun <sunjunchao@bytedance.com>
Message-ID: <77x7h6m5klki4pish2i3fhza26i6mhjw3cx66cpokg5kopthzk@7umq2wu7hyol>
References: <20250929111349.448324-1-sunjunchao@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250929111349.448324-1-sunjunchao@bytedance.com>
X-Spam-Level: 
X-Spamd-Result: default: False [-3.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_RHS_NOT_FQDN(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 MISSING_XM_UA(0.00)[]; MIME_TRACE(0.00)[0:+];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCPT_COUNT_TWELVE(0.00)[18]; RCVD_COUNT_THREE(0.00)[3];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[vger.kernel.org,lists.sourceforge.net,fb.com,suse.com,redhat.com,gmail.com,mit.edu,dilger.ca,kernel.org,infradead.org,suse.cz];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_TLS_LAST(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,suse.com:email]
X-Spam-Flag: NO
X-Spam-Score: -3.80
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon 29-09-25 19:13:49, Julian Sun wrote: > The logic in
 wbc_to_tag() is widely used in file systems, so modify this > function to
 be inline and use it in file systems. > > This patch has only passe [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1v3COW-00053r-QT
Subject: Re: [f2fs-dev] [PATCH v2] fs: Make wbc_to_tag() inline and use it
 in fs.
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

On Mon 29-09-25 19:13:49, Julian Sun wrote:
> The logic in wbc_to_tag() is widely used in file systems, so modify this
> function to be inline and use it in file systems.
> 
> This patch has only passed compilation tests, but it should be fine.
> 
> Signed-off-by: Julian Sun <sunjunchao@bytedance.com>

Looks good. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/btrfs/extent_io.c      | 5 +----
>  fs/ceph/addr.c            | 6 +-----
>  fs/ext4/inode.c           | 5 +----
>  fs/f2fs/data.c            | 5 +----
>  fs/gfs2/aops.c            | 5 +----
>  include/linux/writeback.h | 7 +++++++
>  mm/page-writeback.c       | 6 ------
>  7 files changed, 12 insertions(+), 27 deletions(-)
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
> index a2848d731a46..dde77d13a200 100644
> --- a/include/linux/writeback.h
> +++ b/include/linux/writeback.h
> @@ -240,6 +240,13 @@ static inline void inode_detach_wb(struct inode *inode)
>  	}
>  }
>  
> +static inline xa_mark_t wbc_to_tag(struct writeback_control *wbc)
> +{
> +	if (wbc->sync_mode == WB_SYNC_ALL || wbc->tagged_writepages)
> +		return PAGECACHE_TAG_TOWRITE;
> +	return PAGECACHE_TAG_DIRTY;
> +}
> +
>  void wbc_attach_fdatawrite_inode(struct writeback_control *wbc,
>  		struct inode *inode);
>  
> diff --git a/mm/page-writeback.c b/mm/page-writeback.c
> index 3e248d1c3969..ae1181a46dea 100644
> --- a/mm/page-writeback.c
> +++ b/mm/page-writeback.c
> @@ -2434,12 +2434,6 @@ static bool folio_prepare_writeback(struct address_space *mapping,
>  	return true;
>  }
>  
> -static xa_mark_t wbc_to_tag(struct writeback_control *wbc)
> -{
> -	if (wbc->sync_mode == WB_SYNC_ALL || wbc->tagged_writepages)
> -		return PAGECACHE_TAG_TOWRITE;
> -	return PAGECACHE_TAG_DIRTY;
> -}
>  
>  static pgoff_t wbc_end(struct writeback_control *wbc)
>  {
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
