Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6684ABF64DB
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Oct 2025 14:06:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hz0dXKUQ1hrSmF26SlvnraEiXmCY9jxaqJJ2fTIHFxQ=; b=Yl6/V3gJTbd/qhSwAIh+rBPhax
	HvdUY98bxSYW82mhAWvHtMwBZwPADhUXkBokLH1ri6flRYrnQ4N003GfgCjCAh/vODbfPmBqvZTcJ
	Zk80RS2p0ONcuVbjqPSX6kn6rLblCd6VgY2NCt/RhKdsi/0ZtRdKzqDyB+v382VZQoZA=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vBB7j-0005nP-S7;
	Tue, 21 Oct 2025 12:05:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1vBB7g-0005nC-JF
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Oct 2025 12:05:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ceJbKSzKfwLTY9oVjq75SsrcC00Yrx2qzu9C8Sz+9mY=; b=fZhz58D3sxdqOG2FyCk5x1pSOj
 Q1yvfMI30kt5aGFWPIbmcxeu1zSIw9t4ds/6kYyBKrjqe1z78Aw4ScXtUp39kd+PSYvYTWug0nCKY
 3I5PRzlJSs6gJ4AMPfACikaE+G2NG7O7uoNf0zS2ZQvK8Edua/UILlVzgJqVLGPgy6F8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ceJbKSzKfwLTY9oVjq75SsrcC00Yrx2qzu9C8Sz+9mY=; b=Kf6XIy+HdP6eQ6kiUWO/7oDVip
 F+S7yixxangkEQ3DvB/VdJYeZloEuFOyk1rsEDx4UAFEZ8dJ9xMWtCMrhKYWLl7Ol6lRQ1Q2U7i/o
 TFntzn1Sp4XxcdQtO0yiQyHD0CbNP42zj9mdlmUPdX/8GfAVRWOycIhvG224MZfC7vHE=;
Received: from smtp-out2.suse.de ([195.135.223.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vBB7g-0004pF-0l for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Oct 2025 12:05:52 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 74C1C1F78F;
 Tue, 21 Oct 2025 12:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1761048341; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ceJbKSzKfwLTY9oVjq75SsrcC00Yrx2qzu9C8Sz+9mY=;
 b=stj/Mbe+6r2rUr/tvdKO5hySyKd5RmpIXuQ7aXJ3HWP+U74Cb54fgwUdSV4bhkTy56aeoB
 D5NdbulzXUTgsTutzUf2OlLRFIZ8IqzC+LqHTmOYiJBot0Ofs6uzN/LWnGHPkksUD3KkSs
 kkqI4JuQJYvK81qUN3qYfoHs/WvQaZI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1761048341;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ceJbKSzKfwLTY9oVjq75SsrcC00Yrx2qzu9C8Sz+9mY=;
 b=IKov9Km0o1N1o3ILTPYyFXew/n/UtiynTAtvNDo0UFsb/cZwcNZk+JVFysx2s+AwTGJK0X
 z/2Q8F17ZSzaVRCQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b="V3/CNZYa";
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=K9ZOwBEY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1761048337; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ceJbKSzKfwLTY9oVjq75SsrcC00Yrx2qzu9C8Sz+9mY=;
 b=V3/CNZYaxRAjiSulkmeeU8UEjq7b3lhR0d4F00ykyOjsMiiSnzYFC6mms2ojCl/Hd9hLbM
 coQfSRywd5tfOZEujy2jXCI6nkGt6UAGYLi72eX3mUVR4fQe1KMcLy8XiSWA2guRPl+2aG
 NVT2HlElAR06YOFbUNyIAlltGlLkJn0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1761048337;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ceJbKSzKfwLTY9oVjq75SsrcC00Yrx2qzu9C8Sz+9mY=;
 b=K9ZOwBEYR606q7TpYxTUVmas8J+sWi0rNh29oDd2kPYUJBgVHUP7w1CILoXhAeOQPNvReh
 PwYgJob5oFN462BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 671A0139B1;
 Tue, 21 Oct 2025 12:05:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id aEsqGRF392hgYgAAD6G6ig
 (envelope-from <jack@suse.cz>); Tue, 21 Oct 2025 12:05:37 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 25CF4A0990; Tue, 21 Oct 2025 14:05:33 +0200 (CEST)
Date: Tue, 21 Oct 2025 14:05:33 +0200
From: Jan Kara <jack@suse.cz>
To: Kundan Kumar <kundan.kumar@samsung.com>
Message-ID: <64svwwe2zosyjibtzmhxj4fvffhzlmntrf2fsxlh7jhj33c5wl@h3vqsl74fihv>
References: <20251014120845.2361-1-kundan.kumar@samsung.com>
 <CGME20251014121036epcas5p17c607955db032d076daa2e5cfecfe8ea@epcas5p1.samsung.com>
 <20251014120845.2361-6-kundan.kumar@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251014120845.2361-6-kundan.kumar@samsung.com>
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 74C1C1F78F
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-2.51 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MID_RHS_NOT_FQDN(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 MIME_GOOD(-0.10)[text/plain]; MX_GOOD(-0.01)[];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
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
 DBL_BLOCKED_OPENRESOLVER(0.00)[samsung.com:email, imap1.dmz-prg2.suse.org:rdns,
 imap1.dmz-prg2.suse.org:helo, suse.com:email, suse.cz:dkim]
X-Spam-Score: -2.51
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue 14-10-25 17:38:34, Kundan Kumar wrote: > Since we have
 multiple cgwb per bdi, embedded in writeback_ctx now, we > iterate over all
 of them to find the associated writeback. > > Signed-off-by: K [...] 
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
X-Headers-End: 1vBB7g-0004pF-0l
Subject: Re: [f2fs-dev] [PATCH v2 05/16] writeback: modify bdi_writeback
 search logic to search across all wb ctxs
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

On Tue 14-10-25 17:38:34, Kundan Kumar wrote:
> Since we have multiple cgwb per bdi, embedded in writeback_ctx now, we
> iterate over all of them to find the associated writeback.
> 
> Signed-off-by: Kundan Kumar <kundan.kumar@samsung.com>
> Signed-off-by: Anuj Gupta <anuj20.g@samsung.com>
> ---
>  fs/fs-writeback.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/fs-writeback.c b/fs/fs-writeback.c
> index 56c048e22f72..93f8ea340247 100644
> --- a/fs/fs-writeback.c
> +++ b/fs/fs-writeback.c
> @@ -1090,7 +1090,8 @@ int cgroup_writeback_by_id(u64 bdi_id, int memcg_id,
>  {
>  	struct backing_dev_info *bdi;
>  	struct cgroup_subsys_state *memcg_css;
> -	struct bdi_writeback *wb;
> +	struct bdi_writeback *wb = NULL;
> +	struct bdi_writeback_ctx *bdi_wb_ctx;
>  	struct wb_writeback_work *work;
>  	unsigned long dirty;
>  	int ret;
> @@ -1114,7 +1115,11 @@ int cgroup_writeback_by_id(u64 bdi_id, int memcg_id,
>  	 * And find the associated wb.  If the wb isn't there already
>  	 * there's nothing to flush, don't create one.
>  	 */
> -	wb = wb_get_lookup(bdi->wb_ctx[0], memcg_css);
> +	for_each_bdi_wb_ctx(bdi, bdi_wb_ctx) {
> +		wb = wb_get_lookup(bdi_wb_ctx, memcg_css);
> +		if (wb)
> +			break;
> +	}

This is wrong. We need to run writeback for all bdi_writeback structures
for given memcg_css. Not just for the one we found first. Otherwise
cgroup_writeback_by_id() wouldn't properly relieve the dirty pages pressure
from a foreign dirtying of a memcg (see the big comment before
mem_cgroup_track_foreign_dirty_slowpath() for more background on why
cgroup_writeback_by_id() exists).

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
