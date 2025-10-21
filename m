Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF55BF63DC
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Oct 2025 13:58:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0BxLqLFXEKAJP/MHAVKsKg3/xcw7JqKFVgTgulQHQ8I=; b=VRiuXXsj+AuKDKMrmpPKC7kD7L
	oQhoDau/NMXBJQb5Jsy+cx4nGSQvp2J1CXttL9/zteX4peaagXzoIE4dhBj3Dv2t1l6pplqCUqG3K
	/FljgSn+ZJVsiJhqtnwHWDdSkY9KI3kqZE/34mHKylQ0astmXdui/PV43iD2+Ph5tP6o=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vBB0q-0002kH-O0;
	Tue, 21 Oct 2025 11:58:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1vBB0q-0002kB-9O
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Oct 2025 11:58:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tEww2G9x0lKOM7ivqmlX5OtWAigQPdROrOD7TaZz5TA=; b=nPBviVr64o8bS6RxZnPYRyNp/n
 xytsQCEsIrq6qoLGMBxJdpaRrMHEAuy8hKyNhe0A4p8RGYhbHOC/N1cv/55DnPTsR1cwe0OIjvVAu
 cGr4TYr3rqMbueMHdMLtJZNQyRsXeaDliE+VUbkbU2W68YAEhGlNsQ0nfkw6dZFIW7fc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tEww2G9x0lKOM7ivqmlX5OtWAigQPdROrOD7TaZz5TA=; b=eje+Sz2LJC0sm+l6G/gw4DN9A0
 1MLUlxbi29Eu5WAE//ZxfvmB4oGhjvsYTKZtAZR68WmeE1GlnzBs/8w+YACLfPfgP5x/+YNddoYey
 AK8LNLw5DyyYa4GByDQ+Q+CvDWM4+Il5p5GULv9Mr4p2VG8OBCKS01DeCSQKj652eRhQ=;
Received: from smtp-out2.suse.de ([195.135.223.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vBB0p-0004VH-ID for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Oct 2025 11:58:48 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BE0231F80A;
 Tue, 21 Oct 2025 11:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1761047911; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tEww2G9x0lKOM7ivqmlX5OtWAigQPdROrOD7TaZz5TA=;
 b=p/+neJoD7KoCtxs8pIRmXmFUD1fj6h56bLZid3spXVpwharkjHE+pbTk1OwZrd7H1EW5dO
 caNqMovRzswwIvdTut8ufB6+iRH5TV8hSWrk6frIlaJBzabC5Z6vh8bF5+wB8smCdy89LH
 DI6St98SPttCmxVqLiGVORnyjvOJhew=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1761047911;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tEww2G9x0lKOM7ivqmlX5OtWAigQPdROrOD7TaZz5TA=;
 b=sMxtdMZzRSuyEWY7c33DhYcPpK5f+LhGESlgz9TLbEe4F7dsF47dTrOaC3SijrcIZtpIRO
 Jb0MrFRBEe3VmKBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1761047907; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tEww2G9x0lKOM7ivqmlX5OtWAigQPdROrOD7TaZz5TA=;
 b=Yu86RcU8X3HgjkfWtFKr+9wbl0XnSkqSIwowKYNi9zWWz/Dmk35DsVgpt1p3/2jvse1ovF
 Sy5fvFh1ln/L27ybVy///25Q17Zd8RIzm2F7+G5ereBrb21oERr5W28EC5XjX4FPUTykwT
 xQl1UEd2aKwIHIm5HQv6OkBogkdUkSg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1761047907;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tEww2G9x0lKOM7ivqmlX5OtWAigQPdROrOD7TaZz5TA=;
 b=8ibScNkF0lHsQyxTRT2H/t+/PKopVVGOYY12f/SBRnQqcNPipm4uHYTTd76Pohde/Pwjv0
 CwDAzU4drECX3wBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AF61F139B1;
 Tue, 21 Oct 2025 11:58:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id TQ7PKmN192ihWwAAD6G6ig
 (envelope-from <jack@suse.cz>); Tue, 21 Oct 2025 11:58:27 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 6368FA0990; Tue, 21 Oct 2025 13:58:19 +0200 (CEST)
Date: Tue, 21 Oct 2025 13:58:19 +0200
From: Jan Kara <jack@suse.cz>
To: Kundan Kumar <kundan.kumar@samsung.com>
Message-ID: <p7mc3a7upsebbipxrredqhtazwt3tvyn4qt5jtsn3wb43orew2@6jzeodvk4tli>
References: <20251014120845.2361-1-kundan.kumar@samsung.com>
 <CGME20251014121031epcas5p37b0c4e23a7ad2d623ba776498f795fb0@epcas5p3.samsung.com>
 <20251014120845.2361-5-kundan.kumar@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251014120845.2361-5-kundan.kumar@samsung.com>
X-Spamd-Result: default: False [-2.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MID_RHS_NOT_FQDN(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; RCVD_VIA_SMTP_AUTH(0.00)[];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+]; TO_DN_SOME(0.00)[];
 MISSING_XM_UA(0.00)[]; RCPT_COUNT_TWELVE(0.00)[31];
 TAGGED_RCPT(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 R_RATELIMIT(0.00)[to_ip_from(RLkd9wktknm683nrx6wbi4qz63)];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[kernel.org,zeniv.linux.org.uk,suse.cz,szeredi.hu,redhat.com,linux-foundation.org,infradead.org,meta.com,fromorbit.com,gmail.com,kernel.dk,lst.de,stgolabs.net,vivo.com,lists.sourceforge.net,vger.kernel.org,lists.linux.dev,kvack.org,samsung.com];
 RCVD_COUNT_THREE(0.00)[3]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_TLS_LAST(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo, samsung.com:email,
 suse.com:email]
X-Spam-Flag: NO
X-Spam-Score: -2.30
X-Spam-Level: 
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue 14-10-25 17:38:33, Kundan Kumar wrote: > Affine inode
 to a writeback context. This helps in minimizing the > filesytem fragmentation
 due to inode being processed by different > threads. > > To [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URI: suse.cz]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1vBB0p-0004VH-ID
Subject: Re: [f2fs-dev] [PATCH v2 04/16] writeback: affine inode to a
 writeback ctx within a bdi
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

On Tue 14-10-25 17:38:33, Kundan Kumar wrote:
> Affine inode to a writeback context. This helps in minimizing the
> filesytem fragmentation due to inode being processed by different
> threads.
> 
> To support parallel writeback, wire up a new superblock operation
> get_inode_wb_ctx(). Filesystems can override this callback and select
> desired writeback context for a inode. FS can use the wb context based
> on its geometry and also use 64 bit inode numbers.
> 
> If a filesystem doesn't implement this callback, it defaults to
> DEFALT_WB_CTX = 0, maintaining its original behavior.
> 
> An example implementation for XFS is provided, where XFS selects the
> writeback context based on its Allocation Group number.
> 
> Signed-off-by: Anuj Gupta <anuj20.g@samsung.com>
> Signed-off-by: Kundan Kumar <kundan.kumar@samsung.com>

As Christoph asked in other patch. Please introduce generic writeback
changes in one patch and then provide xfs implementation of
xfs_get_inode_wb_ctx() in another patch. Thanks.

								Honza

> ---
>  fs/fs-writeback.c           |  3 ++-
>  fs/xfs/xfs_super.c          | 13 +++++++++++++
>  include/linux/backing-dev.h |  5 ++++-
>  include/linux/fs.h          |  1 +
>  4 files changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/fs-writeback.c b/fs/fs-writeback.c
> index 0715a7617391..56c048e22f72 100644
> --- a/fs/fs-writeback.c
> +++ b/fs/fs-writeback.c
> @@ -265,7 +265,8 @@ void __inode_attach_wb(struct inode *inode, struct folio *folio)
>  {
>  	struct backing_dev_info *bdi = inode_to_bdi(inode);
>  	struct bdi_writeback *wb = NULL;
> -	struct bdi_writeback_ctx *bdi_writeback_ctx = bdi->wb_ctx[0];
> +	struct bdi_writeback_ctx *bdi_writeback_ctx =
> +						fetch_bdi_writeback_ctx(inode);
>  
>  	if (inode_cgwb_enabled(inode)) {
>  		struct cgroup_subsys_state *memcg_css;
> diff --git a/fs/xfs/xfs_super.c b/fs/xfs/xfs_super.c
> index bb0a82635a77..b3ec9141d902 100644
> --- a/fs/xfs/xfs_super.c
> +++ b/fs/xfs/xfs_super.c
> @@ -53,6 +53,7 @@
>  #include <linux/magic.h>
>  #include <linux/fs_context.h>
>  #include <linux/fs_parser.h>
> +#include <linux/backing-dev.h>
>  
>  static const struct super_operations xfs_super_operations;
>  
> @@ -1294,6 +1295,17 @@ xfs_fs_show_stats(
>  	return 0;
>  }
>  
> +static struct bdi_writeback_ctx *
> +xfs_get_inode_wb_ctx(
> +	struct inode		*inode)
> +{
> +	struct xfs_inode *ip = XFS_I(inode);
> +	struct backing_dev_info *bdi = inode_to_bdi(inode);
> +	xfs_agino_t agno = XFS_INO_TO_AGNO(ip->i_mount, ip->i_ino);
> +
> +	return bdi->wb_ctx[agno % bdi->nr_wb_ctx];
> +}
> +
>  static const struct super_operations xfs_super_operations = {
>  	.alloc_inode		= xfs_fs_alloc_inode,
>  	.destroy_inode		= xfs_fs_destroy_inode,
> @@ -1310,6 +1322,7 @@ static const struct super_operations xfs_super_operations = {
>  	.free_cached_objects	= xfs_fs_free_cached_objects,
>  	.shutdown		= xfs_fs_shutdown,
>  	.show_stats		= xfs_fs_show_stats,
> +	.get_inode_wb_ctx       = xfs_get_inode_wb_ctx,
>  };
>  
>  static int
> diff --git a/include/linux/backing-dev.h b/include/linux/backing-dev.h
> index 951ab5497500..59bbb69d300c 100644
> --- a/include/linux/backing-dev.h
> +++ b/include/linux/backing-dev.h
> @@ -148,6 +148,7 @@ static inline bool mapping_can_writeback(struct address_space *mapping)
>  	return inode_to_bdi(mapping->host)->capabilities & BDI_CAP_WRITEBACK;
>  }
>  
> +#define DEFAULT_WB_CTX 0
>  #define for_each_bdi_wb_ctx(bdi, wbctx) \
>  	for (int __i = 0; __i < (bdi)->nr_wb_ctx \
>  		&& ((wbctx) = (bdi)->wb_ctx[__i]) != NULL; __i++)
> @@ -157,7 +158,9 @@ fetch_bdi_writeback_ctx(struct inode *inode)
>  {
>  	struct backing_dev_info *bdi = inode_to_bdi(inode);
>  
> -	return bdi->wb_ctx[0];
> +	if (inode->i_sb->s_op->get_inode_wb_ctx)
> +		return inode->i_sb->s_op->get_inode_wb_ctx(inode);
> +	return bdi->wb_ctx[DEFAULT_WB_CTX];
>  }
>  
>  #ifdef CONFIG_CGROUP_WRITEBACK
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index 754fec84f350..5199b0d49fa5 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -2379,6 +2379,7 @@ struct super_operations {
>  	 */
>  	int (*remove_bdev)(struct super_block *sb, struct block_device *bdev);
>  	void (*shutdown)(struct super_block *sb);
> +	struct bdi_writeback_ctx *(*get_inode_wb_ctx)(struct inode *inode);
>  };
>  
>  /*
> -- 
> 2.25.1
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
