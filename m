Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D0193896E2C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  3 Apr 2024 13:26:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rryku-0000IV-Lk;
	Wed, 03 Apr 2024 11:26:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1rryks-0000IK-Oy
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 03 Apr 2024 11:26:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=54XuIdUwF3kNBca8B3d+4aw8AC5z3K/ax7Sw1nc33og=; b=QLnOTyBUdTchc8UYnwqk6cCRej
 XBIYg7ax2CVbr5M3UzlmwzOX/xOHhq4KQGp7IzSVGexbwz4Vnx0KtxKjhjy53mPEdvMdWZVycl1lG
 285UEtBo1g1k2T99mS7axT2QY6w2pArUnHmfPkKNtZYzW9VXr8qPBByi+dZ+CEWFcw8s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=54XuIdUwF3kNBca8B3d+4aw8AC5z3K/ax7Sw1nc33og=; b=EQdqIlfwEeCX1UyMUYrH5wMpuD
 a6ChtO5X2EK/33NcXlDp+R/t1ftlgtXaQLlgTlfcNCFDB6jY9/UjDSfg+6/BJjR6pHtSczmdEOLn+
 YQMSVZ53eOEXK/hQkWD4sexxH0KLeNK0Bme1EwN6ze/NIAsdC2jmwEqRfgb7am2yeK0I=;
Received: from smtp-out1.suse.de ([195.135.223.130])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rrykr-0001tn-Qm for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 03 Apr 2024 11:26:10 +0000
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CBCBE35299;
 Wed,  3 Apr 2024 11:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1712143563; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=54XuIdUwF3kNBca8B3d+4aw8AC5z3K/ax7Sw1nc33og=;
 b=V6ezk5MnIOqz3bzeAZk3jMav5NApJuUwfgsrdqb/bT5QyNgBI4m8t7INejzbjsNHs3YsLQ
 8Qh8+VrfFymHsI+c1Aj+fI2zL5ma1coKb03PCGQeABW2vQjs623sx+Zgj+joEAiHbGdMMO
 CRZiMBcYYNwKLhjdBZPhSlksKWWTe7A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1712143563;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=54XuIdUwF3kNBca8B3d+4aw8AC5z3K/ax7Sw1nc33og=;
 b=oHe68SjyGtvEBCK+yhyWBnBmmLpoNa+Xyp4nigoxHletQHBaiGGyitBS8+Jv8W8+DuhYpP
 xPMLUCz5BgUl6uCg==
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id C04C81331E;
 Wed,  3 Apr 2024 11:26:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id lIruLss8DWYiIgAAn2gu4w
 (envelope-from <jack@suse.cz>); Wed, 03 Apr 2024 11:26:03 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 81366A0814; Wed,  3 Apr 2024 13:25:55 +0200 (CEST)
Date: Wed, 3 Apr 2024 13:25:55 +0200
From: Jan Kara <jack@suse.cz>
To: Sweet Tea Dorminy <sweettea-kernel@dorminy.me>
Message-ID: <20240403112555.nj2l5jw2xjrsud3y@quack3>
References: <cover.1712126039.git.sweettea-kernel@dorminy.me>
 <0b492e10a9034c8fb08ca654c06471575e8bb96d.1712126039.git.sweettea-kernel@dorminy.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0b492e10a9034c8fb08ca654c06471575e8bb96d.1712126039.git.sweettea-kernel@dorminy.me>
X-Spam-Score: -3.71
X-Spamd-Result: default: False [-3.71 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-0.999]; RCPT_COUNT_TWELVE(0.00)[20];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; MID_RHS_NOT_FQDN(0.50)[];
 RCVD_TLS_ALL(0.00)[]; BAYES_HAM(-2.91)[99.60%]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed 03-04-24 03:22:51,
 Sweet Tea Dorminy wrote: > Signed-off-by:
 Sweet Tea Dorminy <sweettea-kernel@dorminy.me> > --- > fs/ocfs2/extent_map.c
 | 6 ++++-- > 1 file changed, 4 insertions(+), 2 deletio [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.cz]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.223.130 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1rrykr-0001tn-Qm
Subject: Re: [f2fs-dev] [PATCH v3 10/13] ocfs2: fiemap: return correct
 extent physical length
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
Cc: linux-bcachefs@vger.kernel.org, Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, linux-btrfs@vger.kernel.org,
 Brian Foster <bfoster@redhat.com>, Kent Overstreet <kent.overstreet@linux.dev>,
 linux-doc@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>,
 linux-kernel@vger.kernel.org, Chris Mason <clm@fb.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@meta.com, =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed 03-04-24 03:22:51, Sweet Tea Dorminy wrote:
> Signed-off-by: Sweet Tea Dorminy <sweettea-kernel@dorminy.me>
> ---
>  fs/ocfs2/extent_map.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/ocfs2/extent_map.c b/fs/ocfs2/extent_map.c
> index eabdf97cd685..229ea45df37b 100644
> --- a/fs/ocfs2/extent_map.c
> +++ b/fs/ocfs2/extent_map.c
> @@ -705,7 +705,9 @@ static int ocfs2_fiemap_inline(struct inode *inode, struct buffer_head *di_bh,
>  	unsigned int id_count;
>  	struct ocfs2_dinode *di;
>  	u64 phys;
> -	u32 flags = FIEMAP_EXTENT_DATA_INLINE|FIEMAP_EXTENT_LAST;
> +	u32 flags = (FIEMAP_EXTENT_DATA_INLINE|
> +		     FIEMAP_EXTENT_HAS_PHYS_LEN|
> +		     FIEMAP_EXTENT_LAST);
>  	struct ocfs2_inode_info *oi = OCFS2_I(inode);
>  
>  	di = (struct ocfs2_dinode *)di_bh->b_data;
> @@ -782,7 +784,7 @@ int ocfs2_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
>  			continue;
>  		}
>  
> -		fe_flags = 0;
> +		fe_flags = FIEMAP_EXTENT_HAS_PHYS_LEN;
>  		if (rec.e_flags & OCFS2_EXT_UNWRITTEN)
>  			fe_flags |= FIEMAP_EXTENT_UNWRITTEN;
>  		if (rec.e_flags & OCFS2_EXT_REFCOUNTED)

Again, we should be passing non-zero phys_len if we set
FIEMAP_EXTENT_HAS_PHYS_LEN flag AFAIU.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
