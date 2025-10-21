Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E03ECBF6332
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Oct 2025 13:53:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d912uL18X4Lw+mjYv3ODODyRPLdjzzsE07THBxGvA8M=; b=J+rHhpBfqrxXsyDRhFC0bcTkxH
	xZHlzXPUHrO6ToTibBL9TkljiNIaBLla2Pkjt9PPmz0+seYl0F3eTw6WU63N5WoJF9RkP54xykxoE
	GSoStUJqp3KH6+Y4HHUSNpH4GkA6+lWkubM8Hqz10tnIQ/f84zASZLvPt/XIwCDV7BH0=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vBAva-0007lc-Mn;
	Tue, 21 Oct 2025 11:53:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1vBAvY-0007lH-9M
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Oct 2025 11:53:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+uorp+kk4hmsZbpZpm5Gun01lSMtY2PtNzIQ7LvYx/w=; b=ZgEVPBfsbDSJPENO9Q7z/7vafZ
 QnpHsrfy1YvdjsA3vaLSWqC8O+ZTmKEXe/CQWhuGw2+KyNLw442clv3Gmx1ZGGtuFLk4+CHpGR3du
 3ZKFV2vTUF38oT2/YVuacxpt6I6nRMEcm2fKxMeWe4RRfFQMMYRcHodH21tdrhBkHms0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+uorp+kk4hmsZbpZpm5Gun01lSMtY2PtNzIQ7LvYx/w=; b=AHgxjYx0FoQ/Pcc7TD9ljKmGi3
 ONoGHINGHBDGmerXQtb5/grwpRG+fX4xsYJi1Nn0WQuAMLZj7eNRherk5EFW5W7nLPbiL0HO8X7P1
 IDSfJsYQyomoVvdGiIcwG6JIQt9bQcDNMibYjsbV9baBG0P8eCNciTzT4MOcqvw6TAgc=;
Received: from smtp-out2.suse.de ([195.135.223.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vBAvX-00046Z-IL for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Oct 2025 11:53:21 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6BECE1F7BD;
 Tue, 21 Oct 2025 11:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1761047583; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+uorp+kk4hmsZbpZpm5Gun01lSMtY2PtNzIQ7LvYx/w=;
 b=1TTkiGPkzFlXtwxDEYw356BP9xhGDO5Phqb57mvhJKszoz9QmdQb2A5TTN5MKGjBdS/Kh/
 fFs3OwV4J2tE7J0ZuzUu1QJr1atyBrylovTHFzBh0STAXYpC96e5fQjr7IVcuJkXm1o8+0
 KyIOCBaz43F8+NRSIIQ+WzrM7em2uZw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1761047583;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+uorp+kk4hmsZbpZpm5Gun01lSMtY2PtNzIQ7LvYx/w=;
 b=BuV2xgvQE2Iib51rzP7AyujX1mAs98KsVZJJic6827wuj/OWy49BLKF8TZWsof8P1/vm6u
 qkZH7vIfBLrWrRBQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=mPcYAdGf;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=1+8SUplI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1761047579; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+uorp+kk4hmsZbpZpm5Gun01lSMtY2PtNzIQ7LvYx/w=;
 b=mPcYAdGf2omVYbSV3sB9WE0ve2pyTWILXTwCYQDE+iEmiku2Zdi9/XhapA5CIYIHUzepBh
 cLHBgu8ROr3vkCN0eEvdTXKn8ppe5SB+NsOmxch3UBGDPpy9fdfTr6tuMxL42kst71l3oY
 oZwgaFdhYv2leSdox7oD3tPYj9jt/OU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1761047579;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+uorp+kk4hmsZbpZpm5Gun01lSMtY2PtNzIQ7LvYx/w=;
 b=1+8SUplIr545q5gZVapwStOD5xK3D4DwPy15AmyIF1656N/dDWe5pYkDp+rqjMfjaMn6It
 1vBH3ehUKa/BPOCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 59B92139B1;
 Tue, 21 Oct 2025 11:52:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id etngFRt092ibVgAAD6G6ig
 (envelope-from <jack@suse.cz>); Tue, 21 Oct 2025 11:52:59 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id E705AA0990; Tue, 21 Oct 2025 13:52:54 +0200 (CEST)
Date: Tue, 21 Oct 2025 13:52:54 +0200
From: Jan Kara <jack@suse.cz>
To: Kundan Kumar <kundan.kumar@samsung.com>
Message-ID: <25h6rdu2pweg6wwrfvw3n5bu34vnknqqfpotpfm47uxg267hp5@wo637wyeaxvh>
References: <20251014120845.2361-1-kundan.kumar@samsung.com>
 <CGME20251014121014epcas5p11d254fd09fcc157ea69c39bd9c5984ed@epcas5p1.samsung.com>
 <20251014120845.2361-2-kundan.kumar@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251014120845.2361-2-kundan.kumar@samsung.com>
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 6BECE1F7BD
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-2.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MID_RHS_NOT_FQDN(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 RCVD_COUNT_THREE(0.00)[3];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 ARC_NA(0.00)[]; RCPT_COUNT_TWELVE(0.00)[31];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_LAST(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; TO_DN_SOME(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 TAGGED_RCPT(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 R_RATELIMIT(0.00)[to_ip_from(RLhzk8m8dynxu9bgo74bfqqdh9)];
 MISSING_XM_UA(0.00)[];
 FREEMAIL_CC(0.00)[kernel.org,zeniv.linux.org.uk,suse.cz,szeredi.hu,redhat.com,linux-foundation.org,infradead.org,meta.com,fromorbit.com,gmail.com,kernel.dk,lst.de,stgolabs.net,vivo.com,lists.sourceforge.net,vger.kernel.org,lists.linux.dev,kvack.org,samsung.com];
 DKIM_TRACE(0.00)[suse.cz:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,
 imap1.dmz-prg2.suse.org:helo, suse.com:email, suse.cz:dkim, suse.cz:email]
X-Spam-Score: -2.51
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue 14-10-25 17:38:30, Kundan Kumar wrote: > This is a
 prep patch which introduces a new bdi_writeback_ctx structure > that enables
 us to have multiple writeback contexts for parallel > writeback. [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1vBAvX-00046Z-IL
Subject: Re: [f2fs-dev] [PATCH v2 01/16] writeback: add infra for parallel
 writeback
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
Cc: ritesh.list@gmail.com, vishak.g@samsung.com, jack@suse.cz,
 djwong@kernel.org, amir73il@gmail.com, david@fromorbit.com,
 gfs2@lists.linux.dev, linux-mm@kvack.org, clm@meta.com, hch@lst.de,
 dave@stgolabs.net, agruenba@redhat.com, miklos@szeredi.hu,
 gost.dev@samsung.com, willy@infradead.org, anuj20.g@samsung.com,
 linux-nfs@vger.kernel.org, viro@zeniv.linux.org.uk, jaegeuk@kernel.org,
 axboe@kernel.dk, brauner@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 mcgrof@kernel.org, anna@kernel.org, linux-fsdevel@vger.kernel.org,
 akpm@linux-foundation.org, trondmy@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue 14-10-25 17:38:30, Kundan Kumar wrote:
> This is a prep patch which introduces a new bdi_writeback_ctx structure
> that enables us to have multiple writeback contexts for parallel
> writeback. Each bdi now can have multiple writeback contexts, with each
> writeback context having has its own cgwb tree.
> 
> Modify all the functions/places that operate on bdi's wb, wb_list,
> cgwb_tree, wb_switch_rwsem, wb_waitq as these fields have now been moved
> to bdi_writeback_ctx.
> 
> This patch mechanically replaces bdi->wb to bdi->wb_ctx[0]->wb and there
> is no functional change.
> 
> Suggested-by: Jan Kara <jack@suse.cz>
> Signed-off-by: Anuj Gupta <anuj20.g@samsung.com>
> Signed-off-by: Kundan Kumar <kundan.kumar@samsung.com>
> ---
>  fs/f2fs/node.c                   |   4 +-
>  fs/f2fs/segment.h                |   2 +-
>  fs/fs-writeback.c                |  78 +++++++++++++--------
>  fs/fuse/file.c                   |   6 +-
>  fs/gfs2/super.c                  |   2 +-
>  fs/nfs/internal.h                |   3 +-
>  fs/nfs/write.c                   |   3 +-
>  include/linux/backing-dev-defs.h |  32 +++++----
>  include/linux/backing-dev.h      |  41 +++++++----
>  include/linux/fs.h               |   1 -
>  mm/backing-dev.c                 | 113 +++++++++++++++++++------------
>  mm/page-writeback.c              |   5 +-
>  12 files changed, 179 insertions(+), 111 deletions(-)
> 
> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> index 27743b93e186..1693da9417f9 100644
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -73,7 +73,7 @@ bool f2fs_available_free_memory(struct f2fs_sb_info *sbi, int type)
>  		if (excess_cached_nats(sbi))
>  			res = false;
>  	} else if (type == DIRTY_DENTS) {
> -		if (sbi->sb->s_bdi->wb.dirty_exceeded)
> +		if (sbi->sb->s_bdi->wb_ctx[0]->wb.dirty_exceeded)

I think this needs to be abstracted to proper helper like
bdi_dirty_exceeded() as a preparatory patch. We don't want filesystems to
mess with wb internals like this...

...

> @@ -994,18 +1003,19 @@ static long wb_split_bdi_pages(struct bdi_writeback *wb, long nr_pages)
>   * total active write bandwidth of @bdi.
>   */
>  static void bdi_split_work_to_wbs(struct backing_dev_info *bdi,
> +				  struct bdi_writeback_ctx *bdi_wb_ctx,
>  				  struct wb_writeback_work *base_work,
>  				  bool skip_if_busy)
>  {
>  	struct bdi_writeback *last_wb = NULL;
> -	struct bdi_writeback *wb = list_entry(&bdi->wb_list,
> +	struct bdi_writeback *wb = list_entry(&bdi_wb_ctx->wb_list,
>  					      struct bdi_writeback, bdi_node);
>  
>  	might_sleep();
>  restart:
>  	rcu_read_lock();
> -	list_for_each_entry_continue_rcu(wb, &bdi->wb_list, bdi_node) {
> -		DEFINE_WB_COMPLETION(fallback_work_done, bdi);
> +	list_for_each_entry_continue_rcu(wb, &bdi_wb_ctx->wb_list, bdi_node) {
> +		DEFINE_WB_COMPLETION(fallback_work_done, bdi_wb_ctx);
>  		struct wb_writeback_work fallback_work;
>  		struct wb_writeback_work *work;
>  		long nr_pages;

I think bdi_split_work_to_wbs() should stay as is (i.e., no additional
bdi_writeback_ctx) and instead it should iterate over all writeback
contexts and split work among them as well.

> @@ -2371,7 +2387,7 @@ static void __wakeup_flusher_threads_bdi(struct backing_dev_info *bdi,
>  	if (!bdi_has_dirty_io(bdi))
>  		return;
>  
> -	list_for_each_entry_rcu(wb, &bdi->wb_list, bdi_node)
> +	list_for_each_entry_rcu(wb, &bdi->wb_ctx[0]->wb_list, bdi_node)
>  		wb_start_writeback(wb, reason);
>  }
>  
> @@ -2427,7 +2443,8 @@ static void wakeup_dirtytime_writeback(struct work_struct *w)
>  	list_for_each_entry_rcu(bdi, &bdi_list, bdi_list) {
>  		struct bdi_writeback *wb;
>  
> -		list_for_each_entry_rcu(wb, &bdi->wb_list, bdi_node)
> +		list_for_each_entry_rcu(wb, &bdi->wb_ctx[0]->wb_list,
> +					bdi_node)
>  			if (!list_empty(&wb->b_dirty_time))
>  				wb_wakeup(wb);
>  	}
> @@ -2730,7 +2747,7 @@ static void __writeback_inodes_sb_nr(struct super_block *sb, unsigned long nr,
>  				     enum wb_reason reason, bool skip_if_busy)
>  {
>  	struct backing_dev_info *bdi = sb->s_bdi;
> -	DEFINE_WB_COMPLETION(done, bdi);
> +	DEFINE_WB_COMPLETION(done, bdi->wb_ctx[0]);
>  	struct wb_writeback_work work = {
>  		.sb			= sb,
>  		.sync_mode		= WB_SYNC_NONE,
> @@ -2744,7 +2761,8 @@ static void __writeback_inodes_sb_nr(struct super_block *sb, unsigned long nr,
>  		return;
>  	WARN_ON(!rwsem_is_locked(&sb->s_umount));
>  
> -	bdi_split_work_to_wbs(sb->s_bdi, &work, skip_if_busy);
> +	bdi_split_work_to_wbs(sb->s_bdi, bdi->wb_ctx[0], &work,
> +			      skip_if_busy);
>  	wb_wait_for_completion(&done);
>  }
>  
> @@ -2808,7 +2826,7 @@ EXPORT_SYMBOL(try_to_writeback_inodes_sb);
>  void sync_inodes_sb(struct super_block *sb)
>  {
>  	struct backing_dev_info *bdi = sb->s_bdi;
> -	DEFINE_WB_COMPLETION(done, bdi);
> +	DEFINE_WB_COMPLETION(done, bdi->wb_ctx[0]);
>  	struct wb_writeback_work work = {
>  		.sb		= sb,
>  		.sync_mode	= WB_SYNC_ALL,

Above places will clearly need more adaptation to work with multiple
writeback contexts (and several places below as well). That can happen in
later patches but it would be good to have some FIXME comments before them
to make it easy to verify we don't miss some place. In fact, I think it
might be easier to review if you just introduced for_each_bdi_wb_context()
macro with trivial implementation in this patch and used it where
appropriate instead of hardcoding wb_ctx[0] in places where we actually
need to iterate over all contexts. At least in the places where we don't
really need anything fancier than "call this for all writeback contexts in
the bdi" which seems to be a vast majority of cases. The complex cases can
be handled with FIXME comments and dealt with in later patches.

> diff --git a/fs/fuse/file.c b/fs/fuse/file.c
> index 4adcf09d4b01..8c823a661139 100644
> --- a/fs/fuse/file.c
> +++ b/fs/fuse/file.c
> @@ -1833,8 +1833,8 @@ static void fuse_writepage_finish(struct fuse_writepage_args *wpa)
>  		 * contention and noticeably improves performance.
>  		 */
>  		iomap_finish_folio_write(inode, ap->folios[i], 1);
> -		dec_wb_stat(&bdi->wb, WB_WRITEBACK);
> -		wb_writeout_inc(&bdi->wb);
> +		dec_wb_stat(&bdi->wb_ctx[0]->wb, WB_WRITEBACK);
> +		wb_writeout_inc(&bdi->wb_ctx[0]->wb);
>  	}
>  
>  	wake_up(&fi->page_waitq);
> @@ -2017,7 +2017,7 @@ static void fuse_writepage_args_page_fill(struct fuse_writepage_args *wpa, struc
>  	ap->descs[folio_index].offset = offset;
>  	ap->descs[folio_index].length = len;
>  
> -	inc_wb_stat(&inode_to_bdi(inode)->wb, WB_WRITEBACK);
> +	inc_wb_stat(&inode_to_bdi(inode)->wb_ctx[0]->wb, WB_WRITEBACK);
>  }
>  

These seem to be gone in current upstream kernel.

> diff --git a/fs/nfs/internal.h b/fs/nfs/internal.h
> index c0a44f389f8f..5b3c84104b5b 100644
> --- a/fs/nfs/internal.h
> +++ b/fs/nfs/internal.h
> @@ -857,7 +857,8 @@ static inline void nfs_folio_mark_unstable(struct folio *folio,
>  		 * writeback is happening on the server now.
>  		 */
>  		node_stat_mod_folio(folio, NR_WRITEBACK, nr);
> -		wb_stat_mod(&inode_to_bdi(inode)->wb, WB_WRITEBACK, nr);
> +		wb_stat_mod(&inode_to_bdi(inode)->wb_ctx[0]->wb,
> +			    WB_WRITEBACK, nr);
>  		__mark_inode_dirty(inode, I_DIRTY_DATASYNC);
>  	}
>  }
> diff --git a/fs/nfs/write.c b/fs/nfs/write.c
> index 647c53d1418a..4317b93bc2af 100644
> --- a/fs/nfs/write.c
> +++ b/fs/nfs/write.c
> @@ -865,9 +865,10 @@ static void nfs_folio_clear_commit(struct folio *folio)
>  {
>  	if (folio) {
>  		long nr = folio_nr_pages(folio);
> +		struct inode *inode = folio->mapping->host;
>  
>  		node_stat_mod_folio(folio, NR_WRITEBACK, -nr);
> -		wb_stat_mod(&inode_to_bdi(folio->mapping->host)->wb,
> +		wb_stat_mod(&inode_to_bdi(inode)->wb_ctx[0]->wb,
>  			    WB_WRITEBACK, -nr);
>  	}
>  }

Above two hunks need some helper as well so that we don't leak internal wb
details into filesystems. I think you should use fetch_bdi_writeback_ctx()
here?

> @@ -104,6 +105,7 @@ struct wb_completion {
>   */
>  struct bdi_writeback {
>  	struct backing_dev_info *bdi;	/* our parent bdi */
> +	struct bdi_writeback_ctx *bdi_wb_ctx;
>  
>  	unsigned long state;		/* Always use atomic bitops on this */
>  	unsigned long last_old_flush;	/* last old data flush */
> @@ -160,6 +162,16 @@ struct bdi_writeback {
>  #endif
>  };
>  
> +struct bdi_writeback_ctx {
> +	struct bdi_writeback wb;  /* the root writeback info for this bdi */
> +	struct list_head wb_list; /* list of all wbs */
> +#ifdef CONFIG_CGROUP_WRITEBACK
> +	struct radix_tree_root cgwb_tree; /* radix tree of active cgroup wbs */
> +	struct rw_semaphore wb_switch_rwsem; /* no cgwb switch while syncing */
> +#endif
> +	wait_queue_head_t wb_waitq;
> +};
> +
>
>  struct backing_dev_info {
>  	u64 id;
>  	struct rb_node rb_node; /* keyed by ->id */
> @@ -183,15 +195,11 @@ struct backing_dev_info {
>  	 */
>  	unsigned long last_bdp_sleep;
>  
> -	struct bdi_writeback wb;  /* the root writeback info for this bdi */
> -	struct list_head wb_list; /* list of all wbs */
> +	int nr_wb_ctx;
> +	struct bdi_writeback_ctx **wb_ctx;
>  #ifdef CONFIG_CGROUP_WRITEBACK
> -	struct radix_tree_root cgwb_tree; /* radix tree of active cgroup wbs */
>  	struct mutex cgwb_release_mutex;  /* protect shutdown of wb structs */
> -	struct rw_semaphore wb_switch_rwsem; /* no cgwb switch while syncing */
>  #endif
> -	wait_queue_head_t wb_waitq;
> -
>  	struct device *dev;
>  	char dev_name[64];
>  	struct device *owner;
...
> diff --git a/include/linux/backing-dev.h b/include/linux/backing-dev.h
> index e721148c95d0..92674543ac8a 100644
> --- a/include/linux/backing-dev.h
> +++ b/include/linux/backing-dev.h
> @@ -148,11 +148,20 @@ static inline bool mapping_can_writeback(struct address_space *mapping)
>  	return inode_to_bdi(mapping->host)->capabilities & BDI_CAP_WRITEBACK;
>  }
>  
> +static inline struct bdi_writeback_ctx *
> +fetch_bdi_writeback_ctx(struct inode *inode)
> +{
> +	struct backing_dev_info *bdi = inode_to_bdi(inode);
> +
> +	return bdi->wb_ctx[0];
> +}

I think a better name for this function would be inode_writeback_ctx().

> @@ -187,16 +196,18 @@ static inline bool inode_cgwb_enabled(struct inode *inode)
>   * Must be called under rcu_read_lock() which protects the returend wb.
>   * NULL if not found.
>   */
> -static inline struct bdi_writeback *wb_find_current(struct backing_dev_info *bdi)
> +static inline struct bdi_writeback *
> +wb_find_current(struct backing_dev_info *bdi,
> +		struct bdi_writeback_ctx *bdi_wb_ctx)

This function doesn't need bdi anymore so why do you keep passing it?

>  {
>  	struct cgroup_subsys_state *memcg_css;
>  	struct bdi_writeback *wb;
>  
>  	memcg_css = task_css(current, memory_cgrp_id);
>  	if (!memcg_css->parent)
> -		return &bdi->wb;
> +		return &bdi_wb_ctx->wb;
>  
> -	wb = radix_tree_lookup(&bdi->cgwb_tree, memcg_css->id);
> +	wb = radix_tree_lookup(&bdi_wb_ctx->cgwb_tree, memcg_css->id);
>  
>  	/*
>  	 * %current's blkcg equals the effective blkcg of its memcg.  No
> @@ -217,12 +228,13 @@ static inline struct bdi_writeback *wb_find_current(struct backing_dev_info *bdi
>   * wb_find_current().
>   */
>  static inline struct bdi_writeback *
> -wb_get_create_current(struct backing_dev_info *bdi, gfp_t gfp)
> +wb_get_create_current(struct backing_dev_info *bdi,
> +		      struct bdi_writeback_ctx *bdi_wb_ctx, gfp_t gfp)

I think functions like wb_get_create_current(), wb_get_create() etc. should
all be getting just struct bdi_writeback_ctx as argument because that
really specifies where we want the wb to be created. In some cases we do
need to get up to the struct backing_dev_info so you'll need to add struct
backing_dev_info pointer to bdi_writeback_ctx but I think that's fine.

> diff --git a/mm/backing-dev.c b/mm/backing-dev.c
> index 783904d8c5ef..8b7125349f6c 100644
> --- a/mm/backing-dev.c
> +++ b/mm/backing-dev.c
> @@ -84,13 +84,14 @@ static void collect_wb_stats(struct wb_stats *stats,
>  }
>  
>  #ifdef CONFIG_CGROUP_WRITEBACK
> +
>  static void bdi_collect_stats(struct backing_dev_info *bdi,
>  			      struct wb_stats *stats)
>  {
>  	struct bdi_writeback *wb;
>  
>  	rcu_read_lock();
> -	list_for_each_entry_rcu(wb, &bdi->wb_list, bdi_node) {
> +	list_for_each_entry_rcu(wb, &bdi->wb_ctx[0]->wb_list, bdi_node) {
>  		if (!wb_tryget(wb))
>  			continue;
>  
> @@ -103,7 +104,7 @@ static void bdi_collect_stats(struct backing_dev_info *bdi,
>  static void bdi_collect_stats(struct backing_dev_info *bdi,
>  			      struct wb_stats *stats)
>  {
> -	collect_wb_stats(stats, &bdi->wb);
> +	collect_wb_stats(stats, &bdi->wb_ctx[0]->wb);
>  }
>  #endif
>  
> @@ -149,7 +150,7 @@ static int bdi_debug_stats_show(struct seq_file *m, void *v)
>  		   stats.nr_io,
>  		   stats.nr_more_io,
>  		   stats.nr_dirty_time,
> -		   !list_empty(&bdi->bdi_list), bdi->wb.state);
> +		   !list_empty(&bdi->bdi_list), bdi->wb_ctx[0]->wb.state);
>  
>  	return 0;
>  }
> @@ -193,14 +194,14 @@ static void wb_stats_show(struct seq_file *m, struct bdi_writeback *wb,
>  static int cgwb_debug_stats_show(struct seq_file *m, void *v)
>  {
>  	struct backing_dev_info *bdi = m->private;
> +	struct bdi_writeback *wb;
>  	unsigned long background_thresh;
>  	unsigned long dirty_thresh;
> -	struct bdi_writeback *wb;
>  
>  	global_dirty_limits(&background_thresh, &dirty_thresh);
>  
>  	rcu_read_lock();
> -	list_for_each_entry_rcu(wb, &bdi->wb_list, bdi_node) {
> +	list_for_each_entry_rcu(wb, &bdi->wb_ctx[0]->wb_list, bdi_node) {
>  		struct wb_stats stats = { .dirty_thresh = dirty_thresh };
>  
>  		if (!wb_tryget(wb))
> @@ -520,6 +521,7 @@ static int wb_init(struct bdi_writeback *wb, struct backing_dev_info *bdi,
>  	memset(wb, 0, sizeof(*wb));
>  
>  	wb->bdi = bdi;
> +	wb->bdi_wb_ctx = bdi->wb_ctx[0];
>  	wb->last_old_flush = jiffies;
>  	INIT_LIST_HEAD(&wb->b_dirty);
>  	INIT_LIST_HEAD(&wb->b_io);
> @@ -643,11 +645,12 @@ static void cgwb_release(struct percpu_ref *refcnt)
>  	queue_work(cgwb_release_wq, &wb->release_work);
>  }
>  
> -static void cgwb_kill(struct bdi_writeback *wb)
> +static void cgwb_kill(struct bdi_writeback *wb,
> +		      struct bdi_writeback_ctx *bdi_wb_ctx)
>  {
>  	lockdep_assert_held(&cgwb_lock);
>  
> -	WARN_ON(!radix_tree_delete(&wb->bdi->cgwb_tree, wb->memcg_css->id));
> +	WARN_ON(!radix_tree_delete(&bdi_wb_ctx->cgwb_tree, wb->memcg_css->id));

Why don't you use wb->bdi_wb_ctx instead of passing bdi_wb_ctx as a
function argument?

> @@ -662,6 +665,7 @@ static void cgwb_remove_from_bdi_list(struct bdi_writeback *wb)
>  }
>  
>  static int cgwb_create(struct backing_dev_info *bdi,
> +		       struct bdi_writeback_ctx *bdi_wb_ctx,
>  		       struct cgroup_subsys_state *memcg_css, gfp_t gfp)
>  {

I'd pass *only* bdi_writeback_ctx here.

> @@ -813,6 +818,7 @@ struct bdi_writeback *wb_get_lookup(struct backing_dev_info *bdi,
>   * create one.  See wb_get_lookup() for more details.
>   */
>  struct bdi_writeback *wb_get_create(struct backing_dev_info *bdi,
> +				    struct bdi_writeback_ctx *bdi_wb_ctx,
>  				    struct cgroup_subsys_state *memcg_css,
>  				    gfp_t gfp)
>  {

And here as well.

> -static void cgwb_bdi_register(struct backing_dev_info *bdi)
> +static void cgwb_bdi_register(struct backing_dev_info *bdi,
> +		struct bdi_writeback_ctx *bdi_wb_ctx)

Again no need for bdi here...

>  {
>  	spin_lock_irq(&cgwb_lock);
> -	list_add_tail_rcu(&bdi->wb.bdi_node, &bdi->wb_list);
> +	list_add_tail_rcu(&bdi_wb_ctx->wb.bdi_node, &bdi_wb_ctx->wb_list);
>  	spin_unlock_irq(&cgwb_lock);
>  }
>  

								Honza

-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
