Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /OUqA9aYRmqUZgsAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 02 Jul 2026 18:59:02 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E54F6FAD1D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 02 Jul 2026 18:59:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=UzoZRmji;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=madxYZW5;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=lZVieTX3;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=CrRX4a4t;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eunSixiMsk5ZyjoNWco372Xdu9S6PMCX0pXJlDmwgJY=; b=UzoZRmji56122+cRR0cYhe67rm
	9Joc8xzENZ22gjZFizr1gGP/o8Zf/Uz7wmOgvrYUEdK+sFEc1wchDKF7AsTNnZqXimCY87osi6jIY
	pdbo3iWZgOgQVMHWiQH782ptwOzdS7kTRsZBJNuDh4kg0iP+ly3bRUqo3jLu3w08GeAE=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wfKkZ-0002tI-UE;
	Thu, 02 Jul 2026 16:58:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1wfKkZ-0002tC-5n
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 Jul 2026 16:58:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Zb5EXf2ovo6UufrOrmxA5aKxNooLmPywNDd7EorJKw0=; b=madxYZW5FHH/221dVbOU91XTAV
 9zsXMm4VFC7DAB7eYqM0gKb+SaibBktaxTDI/6OS3/Fb5oUmRQKjK+Ulabn8bY26oB+WBXP1/LupI
 tYyzsnA27ir0qr2v7dVXc1nCi2r7kcbInEbGcHU6RJJUfuQN933iPXgmyhGa1K6Qpt6c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Zb5EXf2ovo6UufrOrmxA5aKxNooLmPywNDd7EorJKw0=; b=lZVieTX3ZP94cNjNCyJnxgCRc9
 ubL/2YNd1p+TQj5RaVnXQoDX8wK96nNmmFoaNUz7e83e++7/uT0F/A8x8lXko/fwB0aRYuulDq33b
 B1pMdB3c44f3laJUF4iloy5SdOOOK+Kh273RtfNud/mRNqahcx5vQeAbMGZvyJ0/IRaI=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wfKkW-0005y2-QM for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 Jul 2026 16:58:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with UTF8SMTP id 8F52A601E3;
 Thu,  2 Jul 2026 16:58:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 1D9BD1F00A3E;
 Thu,  2 Jul 2026 16:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1783011522;
 bh=Zb5EXf2ovo6UufrOrmxA5aKxNooLmPywNDd7EorJKw0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=CrRX4a4txrvnJFsq8oC4/tLM23WGjr79R1MaXHPIntlbz2i82r3XLtXpgw8yN0y81
 uVPZwMvQWPGXeBAGsB0vu+rPz0S+03F5LZog1LWuHUbljjzyinbiqS7hwgE6pMLtni
 kIcIkwwmhVGuEVlC9PmMCFRyz83W7+dpUMYRGeF2PzLvkpPPvucfC2gc3XYHg0YTX1
 34IGxmH9rtPnDL7P3ZRRwWGXsxm4IWB5M48pvwPNmXpuadV56EWnisVxXG+RilRucL
 rWTku0kZz+GuPQWu4VyLMbxCf0ZeKbR+IM7Y8gEic3vFhVJd5LQ0CNduVtqkyxq6nk
 4aGi0F4S/+HHA==
Date: Thu, 2 Jul 2026 09:58:41 -0700
To: Joanne Koong <joannelkoong@gmail.com>
Message-ID: <20260702165841.GM9392@frogsfrogsfrogs>
References: <20260701000949.1666714-1-joannelkoong@gmail.com>
 <20260701000949.1666714-18-joannelkoong@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260701000949.1666714-18-joannelkoong@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Jun 30, 2026 at 05:09:32PM -0700, Joanne Koong wrote:
 > Now that all filesystems implement ->iomap_next() and the legacy >
 ->iomap_begin()/->iomap_end()
 fallback is gone, struct iomap_ops only [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1wfKkW-0005y2-QM
Subject: Re: [f2fs-dev] [PATCH v2 17/18] iomap: pass iomap_next_fn directly
 instead of struct iomap_ops
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
From: "Darrick J. Wong via Linux-f2fs-devel"
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: "Darrick J. Wong" <djwong@kernel.org>
Cc: "Ritesh Harjani \(IBM\)" <ritesh.list@gmail.com>, Jan Kara <jack@suse.cz>,
 Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>,
 Yuezhang Mo <yuezhang.mo@sony.com>, Carlos Maiolino <cem@kernel.org>,
 Hyunchul Lee <hyc.lee@gmail.com>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Chris Mason <clm@fb.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Ojaswin Mujoo <ojaswin@linux.ibm.com>, Baokun Li <libaokun@linux.alibaba.com>,
 Chunhai Guo <guochunhai@vivo.com>, Dan Williams <djbw@kernel.org>,
 Naohiro Aota <naohiro.aota@wdc.com>, Yue Hu <zbestahu@gmail.com>,
 Miklos Szeredi <miklos@szeredi.hu>, Zhang Yi <yi.zhang@huawei.com>,
 willy@infradead.org, hch@lst.de, hsiangkao@linux.alibaba.com,
 Gao Xiang <xiang@kernel.org>,
 "open list:EXT2 FILE SYSTEM" <linux-ext4@vger.kernel.org>,
 Namjae Jeon <linkinjeon@kernel.org>,
 "open list:BLOCK LAYER" <linux-block@vger.kernel.org>,
 Damien Le Moal <dlemoal@kernel.org>, David Sterba <dsterba@suse.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Jeffle Xu <jefflexu@linux.alibaba.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Andreas Gruenbacher <agruenba@redhat.com>, Jens Axboe <axboe@kernel.dk>,
 "open list:FUSE FILESYSTEM \[CORE\]" <fuse-devel@lists.linux.dev>,
 brauner@kernel.org, Johannes Thumshirn <jth@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>,
 "open list:NTFS3 FILESYSTEM" <ntfs3@lists.linux.dev>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:F2FS FILE SYSTEM" <linux-f2fs-devel@lists.sourceforge.net>,
 linux-xfs@vger.kernel.org, "open list:GFS2 FILE SYSTEM" <gfs2@lists.linux.dev>,
 "open list:FILESYSTEM DIRECT ACCESS \(DAX\)" <nvdimm@lists.linux.dev>,
 Hongbo Li <lihongbo22@huawei.com>, linux-fsdevel@vger.kernel.org,
 Sungjong Seo <sj1557.seo@samsung.com>,
 "open list:EROFS FILE SYSTEM" <linux-erofs@lists.ozlabs.org>,
 "open list:BTRFS FILE SYSTEM" <linux-btrfs@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-6.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[47];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:joannelkoong@gmail.com,m:ritesh.list@gmail.com,m:jack@suse.cz,m:mikulas@artax.karlin.mff.cuni.cz,m:yuezhang.mo@sony.com,m:cem@kernel.org,m:hyc.lee@gmail.com,m:almaz.alexandrovich@paragon-software.com,m:clm@fb.com,m:adilger.kernel@dilger.ca,m:ojaswin@linux.ibm.com,m:libaokun@linux.alibaba.com,m:guochunhai@vivo.com,m:djbw@kernel.org,m:naohiro.aota@wdc.com,m:zbestahu@gmail.com,m:miklos@szeredi.hu,m:yi.zhang@huawei.com,m:willy@infradead.org,m:hch@lst.de,m:hsiangkao@linux.alibaba.com,m:xiang@kernel.org,m:linux-ext4@vger.kernel.org,m:linkinjeon@kernel.org,m:linux-block@vger.kernel.org,m:dlemoal@kernel.org,m:dsterba@suse.com,m:viro@zeniv.linux.org.uk,m:jefflexu@linux.alibaba.com,m:jaegeuk@kernel.org,m:agruenba@redhat.com,m:axboe@kernel.dk,m:fuse-devel@lists.linux.dev,m:brauner@kernel.org,m:jth@kernel.org,m:tytso@mit.edu,m:ntfs3@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:gfs2@lists.linux.dev
 ,m:nvdimm@lists.linux.dev,m:lihongbo22@huawei.com,m:linux-fsdevel@vger.kernel.org,m:sj1557.seo@samsung.com,m:linux-erofs@lists.ozlabs.org,m:linux-btrfs@vger.kernel.org,m:riteshlist@gmail.com,m:hyclee@gmail.com,s:lists@lfdr.de];
	DKIM_MIXED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_TO(0.00)[gmail.com];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	FREEMAIL_CC(0.00)[gmail.com,suse.cz,artax.karlin.mff.cuni.cz,sony.com,kernel.org,paragon-software.com,fb.com,dilger.ca,linux.ibm.com,linux.alibaba.com,vivo.com,wdc.com,szeredi.hu,huawei.com,infradead.org,lst.de,vger.kernel.org,suse.com,zeniv.linux.org.uk,redhat.com,kernel.dk,lists.linux.dev,mit.edu,lists.sourceforge.net,samsung.com,lists.ozlabs.org];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[djwong@kernel.org];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[frogsfrogsfrogs:mid,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0E54F6FAD1D

On Tue, Jun 30, 2026 at 05:09:32PM -0700, Joanne Koong wrote:
> Now that all filesystems implement ->iomap_next() and the legacy
> ->iomap_begin()/->iomap_end() fallback is gone, struct iomap_ops only
> wraps a single iomap_next function pointer. Drop the struct entirely and
> pass the iomap_next_fn directly to iomap_iter() and all the iomap/dax
> entry points; filesystems pass their ->iomap_next function instead of an
> ops struct.
> 
> No functional change intended.
> 
> Signed-off-by: Joanne Koong <joannelkoong@gmail.com>

I'm gonna cut out quite a bit of this patch to reduce the reply size.

> ---
<snip>
>  fs/iomap/buffered-io.c | 38 ++++++++++++++---------------
>  fs/iomap/direct-io.c   |  8 +++---
>  fs/iomap/fiemap.c      |  8 +++---
>  fs/iomap/iter.c        |  8 +++---
>  fs/iomap/seek.c        |  8 +++---
>  fs/iomap/swapfile.c    |  4 +--
<snip>
>  fs/remap_range.c       |  6 ++---
>  fs/xfs/xfs_aops.c      |  8 +++---
>  fs/xfs/xfs_file.c      | 40 +++++++++++++++---------------
>  fs/xfs/xfs_iomap.c     | 55 +++++++++---------------------------------
>  fs/xfs/xfs_iomap.h     | 24 ++++++++++++------
>  fs/xfs/xfs_iops.c      |  4 +--
>  fs/xfs/xfs_reflink.c   |  6 ++---
>  fs/zonefs/file.c       | 22 ++++++-----------
>  include/linux/dax.h    | 18 ++++++--------
>  include/linux/fs.h     |  7 ++++--
>  include/linux/iomap.h  | 46 +++++++++++++++--------------------
>  54 files changed, 302 insertions(+), 411 deletions(-)
> 
<snip>

> diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
> index 3f0932e46fd6..0aa8abc438c1 100644
> --- a/fs/iomap/buffered-io.c
> +++ b/fs/iomap/buffered-io.c
> @@ -626,7 +626,7 @@ static int iomap_read_folio_iter(struct iomap_iter *iter,
>  	return 0;
>  }
>  
> -void iomap_read_folio(const struct iomap_ops *ops,
> +void iomap_read_folio(iomap_next_fn iomap_next,

If you took my earlier suggestion to rename the typedef to
iomap_iter_fn, then this parameter ought to be named iter_fn.

>  		struct iomap_read_folio_ctx *ctx, void *private)
>  {
>  	struct folio *folio = ctx->cur_folio;
> @@ -650,7 +650,7 @@ void iomap_read_folio(const struct iomap_ops *ops,
>  		fsverity_readahead(ctx->vi, folio->index,
>  				   folio_nr_pages(folio));
>  
> -	while ((ret = iomap_iter(&iter, ops)) > 0) {
> +	while ((ret = iomap_iter(&iter, iomap_next)) > 0) {
>  		iter.status = iomap_read_folio_iter(&iter, ctx,
>  				&bytes_submitted);
>  		iomap_read_submit(&iter, ctx);
> @@ -688,22 +688,22 @@ static int iomap_readahead_iter(struct iomap_iter *iter,
>  
>  /**
>   * iomap_readahead - Attempt to read pages from a file.
> - * @ops: The operations vector for the filesystem.
> + * @iomap_next: The iomap_next callback for the filesystem.

"The iomap iteration function for the filesystem" ?

Using the term "iomap_next" in the definition for iomap_next isn't that
helpful.

>   * @ctx: The ctx used for issuing readahead.
>   * @private: The filesystem-specific information for issuing iomap_iter.
>   *
>   * This function is for filesystems to call to implement their readahead
>   * address_space operation.
>   *
> - * Context: The @ops callbacks may submit I/O (eg to read the addresses of
> + * Context: The @iomap_next callback may submit I/O (eg to read the addresses of
>   * blocks from disc), and may wait for it.  The caller may be trying to
>   * access a different page, and so sleeping excessively should be avoided.
>   * It may allocate memory, but should avoid costly allocations.  This
>   * function is called with memalloc_nofs set, so allocations will not cause
>   * the filesystem to be reentered.
>   */
> -void iomap_readahead(const struct iomap_ops *ops,
> -		struct iomap_read_folio_ctx *ctx, void *private)
> +void iomap_readahead(iomap_next_fn iomap_next, struct iomap_read_folio_ctx *ctx,
> +		void *private)
>  {
>  	struct readahead_control *rac = ctx->rac;
>  	struct iomap_iter iter = {
> @@ -725,7 +725,7 @@ void iomap_readahead(const struct iomap_ops *ops,
>  		fsverity_readahead(ctx->vi, readahead_index(rac),
>  				readahead_count(rac));
>  
> -	while (iomap_iter(&iter, ops) > 0) {
> +	while (iomap_iter(&iter, iomap_next) > 0) {
>  		iter.status = iomap_readahead_iter(&iter, ctx,
>  					&cur_bytes_submitted);
>  		iomap_read_submit(&iter, ctx);
> @@ -1268,7 +1268,7 @@ static int iomap_write_iter(struct iomap_iter *iter, struct iov_iter *i,
>  
>  ssize_t
>  iomap_file_buffered_write(struct kiocb *iocb, struct iov_iter *i,
> -		const struct iomap_ops *ops,
> +		iomap_next_fn iomap_next,
>  		const struct iomap_write_ops *write_ops, void *private)
>  {
>  	struct iomap_iter iter = {
> @@ -1285,7 +1285,7 @@ iomap_file_buffered_write(struct kiocb *iocb, struct iov_iter *i,
>  	if (iocb->ki_flags & IOCB_DONTCACHE)
>  		iter.flags |= IOMAP_DONTCACHE;
>  
> -	while ((ret = iomap_iter(&iter, ops)) > 0)
> +	while ((ret = iomap_iter(&iter, iomap_next)) > 0)
>  		iter.status = iomap_write_iter(&iter, i, write_ops);
>  
>  	if (unlikely(iter.pos == iocb->ki_pos))
> @@ -1297,7 +1297,7 @@ iomap_file_buffered_write(struct kiocb *iocb, struct iov_iter *i,
>  EXPORT_SYMBOL_GPL(iomap_file_buffered_write);
>  
>  int iomap_fsverity_write(struct file *file, loff_t pos, size_t length,
> -		const void *buf, const struct iomap_ops *ops,
> +		const void *buf, iomap_next_fn iomap_next,
>  		const struct iomap_write_ops *write_ops)
>  {
>  	int			ret;
> @@ -1314,7 +1314,7 @@ int iomap_fsverity_write(struct file *file, loff_t pos, size_t length,
>  
>  	iov_iter_kvec(&iiter, WRITE, &kvec, 1, length);
>  
> -	ret = iomap_file_buffered_write(&iocb, &iiter, ops, write_ops, NULL);
> +	ret = iomap_file_buffered_write(&iocb, &iiter, iomap_next, write_ops, NULL);
>  	if (ret < 0)
>  		return ret;
>  	return ret == length ? 0 : -EIO;
> @@ -1586,7 +1586,7 @@ static int iomap_unshare_iter(struct iomap_iter *iter,
>  
>  int
>  iomap_file_unshare(struct inode *inode, loff_t pos, loff_t len,
> -		const struct iomap_ops *ops,
> +		iomap_next_fn iomap_next,
>  		const struct iomap_write_ops *write_ops)
>  {
>  	struct iomap_iter iter = {
> @@ -1601,7 +1601,7 @@ iomap_file_unshare(struct inode *inode, loff_t pos, loff_t len,
>  		return 0;
>  
>  	iter.len = min(len, size - pos);
> -	while ((ret = iomap_iter(&iter, ops)) > 0)
> +	while ((ret = iomap_iter(&iter, iomap_next)) > 0)
>  		iter.status = iomap_unshare_iter(&iter, write_ops);
>  	return ret;
>  }
> @@ -1710,7 +1710,7 @@ EXPORT_SYMBOL_GPL(iomap_fill_dirty_folios);
>  
>  int
>  iomap_zero_range(struct inode *inode, loff_t pos, loff_t len, bool *did_zero,
> -		const struct iomap_ops *ops,
> +		iomap_next_fn iomap_next,
>  		const struct iomap_write_ops *write_ops, void *private)
>  {
>  	struct folio_batch fbatch;
> @@ -1735,7 +1735,7 @@ iomap_zero_range(struct inode *inode, loff_t pos, loff_t len, bool *did_zero,
>  	 */
>  	range_dirty = filemap_range_needs_writeback(mapping, iter.pos,
>  					iter.pos + iter.len - 1);
> -	while ((ret = iomap_iter(&iter, ops)) > 0) {
> +	while ((ret = iomap_iter(&iter, iomap_next)) > 0) {
>  		const struct iomap *srcmap = iomap_iter_srcmap(&iter);
>  
>  		if (!(iter.iomap.flags & IOMAP_F_FOLIO_BATCH) &&
> @@ -1761,7 +1761,7 @@ EXPORT_SYMBOL_GPL(iomap_zero_range);
>  
>  int
>  iomap_truncate_page(struct inode *inode, loff_t pos, bool *did_zero,
> -		const struct iomap_ops *ops,
> +		iomap_next_fn iomap_next,
>  		const struct iomap_write_ops *write_ops, void *private)
>  {
>  	unsigned int blocksize = i_blocksize(inode);
> @@ -1770,7 +1770,7 @@ iomap_truncate_page(struct inode *inode, loff_t pos, bool *did_zero,
>  	/* Block boundary? Nothing to do */
>  	if (!off)
>  		return 0;
> -	return iomap_zero_range(inode, pos, blocksize - off, did_zero, ops,
> +	return iomap_zero_range(inode, pos, blocksize - off, did_zero, iomap_next,
>  			write_ops, private);
>  }
>  EXPORT_SYMBOL_GPL(iomap_truncate_page);
> @@ -1795,7 +1795,7 @@ static int iomap_folio_mkwrite_iter(struct iomap_iter *iter,
>  	return iomap_iter_advance(iter, length);
>  }
>  
> -vm_fault_t iomap_page_mkwrite(struct vm_fault *vmf, const struct iomap_ops *ops,
> +vm_fault_t iomap_page_mkwrite(struct vm_fault *vmf, iomap_next_fn iomap_next,
>  		void *private)
>  {
>  	struct iomap_iter iter = {
> @@ -1812,7 +1812,7 @@ vm_fault_t iomap_page_mkwrite(struct vm_fault *vmf, const struct iomap_ops *ops,
>  		goto out_unlock;
>  	iter.pos = folio_pos(folio);
>  	iter.len = ret;
> -	while ((ret = iomap_iter(&iter, ops)) > 0)
> +	while ((ret = iomap_iter(&iter, iomap_next)) > 0)
>  		iter.status = iomap_folio_mkwrite_iter(&iter, folio);
>  
>  	if (ret < 0)
> diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c
> index b485e3b191da..e299d186f743 100644
> --- a/fs/iomap/direct-io.c
> +++ b/fs/iomap/direct-io.c
> @@ -676,7 +676,7 @@ static int iomap_dio_iter(struct iomap_iter *iter, struct iomap_dio *dio)
>   */
>  struct iomap_dio *
>  __iomap_dio_rw(struct kiocb *iocb, struct iov_iter *iter,
> -		const struct iomap_ops *ops, const struct iomap_dio_ops *dops,
> +		iomap_next_fn iomap_next, const struct iomap_dio_ops *dops,
>  		unsigned int dio_flags, void *private, size_t done_before)
>  {
>  	struct inode *inode = file_inode(iocb->ki_filp);
> @@ -800,7 +800,7 @@ __iomap_dio_rw(struct kiocb *iocb, struct iov_iter *iter,
>  	inode_dio_begin(inode);
>  
>  	blk_start_plug(&plug);
> -	while ((ret = iomap_iter(&iomi, ops)) > 0) {
> +	while ((ret = iomap_iter(&iomi, iomap_next)) > 0) {
>  		iomi.status = iomap_dio_iter(&iomi, dio);
>  
>  		/*
> @@ -890,12 +890,12 @@ EXPORT_SYMBOL_GPL(__iomap_dio_rw);
>  
>  ssize_t
>  iomap_dio_rw(struct kiocb *iocb, struct iov_iter *iter,
> -		const struct iomap_ops *ops, const struct iomap_dio_ops *dops,
> +		iomap_next_fn iomap_next, const struct iomap_dio_ops *dops,
>  		unsigned int dio_flags, void *private, size_t done_before)
>  {
>  	struct iomap_dio *dio;
>  
> -	dio = __iomap_dio_rw(iocb, iter, ops, dops, dio_flags, private,
> +	dio = __iomap_dio_rw(iocb, iter, iomap_next, dops, dio_flags, private,
>  			     done_before);
>  	if (IS_ERR_OR_NULL(dio))
>  		return PTR_ERR_OR_ZERO(dio);
> diff --git a/fs/iomap/fiemap.c b/fs/iomap/fiemap.c
> index d11dadff8286..fc488f05d8ce 100644
> --- a/fs/iomap/fiemap.c
> +++ b/fs/iomap/fiemap.c
> @@ -56,7 +56,7 @@ static int iomap_fiemap_iter(struct iomap_iter *iter,
>  }
>  
>  int iomap_fiemap(struct inode *inode, struct fiemap_extent_info *fi,
> -		u64 start, u64 len, const struct iomap_ops *ops)
> +		u64 start, u64 len, iomap_next_fn iomap_next)
>  {
>  	struct iomap_iter iter = {
>  		.inode		= inode,
> @@ -73,7 +73,7 @@ int iomap_fiemap(struct inode *inode, struct fiemap_extent_info *fi,
>  	if (ret)
>  		return ret;
>  
> -	while ((ret = iomap_iter(&iter, ops)) > 0)
> +	while ((ret = iomap_iter(&iter, iomap_next)) > 0)
>  		iter.status = iomap_fiemap_iter(&iter, fi, &prev);
>  
>  	if (prev.type != IOMAP_HOLE) {
> @@ -92,7 +92,7 @@ EXPORT_SYMBOL_GPL(iomap_fiemap);
>  /* legacy ->bmap interface.  0 is the error return (!) */
>  sector_t
>  iomap_bmap(struct address_space *mapping, sector_t bno,
> -		const struct iomap_ops *ops)
> +		iomap_next_fn iomap_next)
>  {
>  	struct iomap_iter iter = {
>  		.inode	= mapping->host,
> @@ -107,7 +107,7 @@ iomap_bmap(struct address_space *mapping, sector_t bno,
>  		return 0;
>  
>  	bno = 0;
> -	while ((ret = iomap_iter(&iter, ops)) > 0) {
> +	while ((ret = iomap_iter(&iter, iomap_next)) > 0) {
>  		if (iter.iomap.type == IOMAP_MAPPED)
>  			bno = iomap_sector(&iter.iomap, iter.pos) >> blkshift;
>  		/* leave iter.status unset to abort loop */
> diff --git a/fs/iomap/iter.c b/fs/iomap/iter.c
> index 466c491bdef6..984045af310a 100644
> --- a/fs/iomap/iter.c
> +++ b/fs/iomap/iter.c
> @@ -42,7 +42,7 @@ static inline void iomap_iter_done(struct iomap_iter *iter)
>  /**
>   * iomap_iter - iterate over a ranges in a file
>   * @iter: iteration structue
> - * @ops: iomap ops provided by the file system
> + * @iomap_next: iomap_next callback provided by the file system
>   *
>   * Iterate over filesystem-provided space mappings for the provided file range.
>   *
> @@ -54,13 +54,13 @@ static inline void iomap_iter_done(struct iomap_iter *iter)
>   * of the loop body:  leave @iter.status unchanged, or set it to a negative
>   * errno.
>   */
> -int iomap_iter(struct iomap_iter *iter, const struct iomap_ops *ops)
> +int iomap_iter(struct iomap_iter *iter, iomap_next_fn iomap_next)
>  {
>  	int ret;
>  
> -	trace_iomap_iter(iter, ops, _RET_IP_);
> +	trace_iomap_iter(iter, iomap_next, _RET_IP_);
>  
> -	ret = ops->iomap_next(iter, &iter->iomap, &iter->srcmap);
> +	ret = iomap_next(iter, &iter->iomap, &iter->srcmap);
>  	iter->status = 0;
>  	if (ret > 0)
>  		iomap_iter_done(iter);
> diff --git a/fs/iomap/seek.c b/fs/iomap/seek.c
> index 6cbc587c93da..1bc5053d3fc1 100644
> --- a/fs/iomap/seek.c
> +++ b/fs/iomap/seek.c
> @@ -27,7 +27,7 @@ static int iomap_seek_hole_iter(struct iomap_iter *iter,
>  }
>  
>  loff_t
> -iomap_seek_hole(struct inode *inode, loff_t pos, const struct iomap_ops *ops)
> +iomap_seek_hole(struct inode *inode, loff_t pos, iomap_next_fn iomap_next)
>  {
>  	loff_t size = i_size_read(inode);
>  	struct iomap_iter iter = {
> @@ -42,7 +42,7 @@ iomap_seek_hole(struct inode *inode, loff_t pos, const struct iomap_ops *ops)
>  		return -ENXIO;
>  
>  	iter.len = size - pos;
> -	while ((ret = iomap_iter(&iter, ops)) > 0)
> +	while ((ret = iomap_iter(&iter, iomap_next)) > 0)
>  		iter.status = iomap_seek_hole_iter(&iter, &pos);
>  	if (ret < 0)
>  		return ret;
> @@ -73,7 +73,7 @@ static int iomap_seek_data_iter(struct iomap_iter *iter,
>  }
>  
>  loff_t
> -iomap_seek_data(struct inode *inode, loff_t pos, const struct iomap_ops *ops)
> +iomap_seek_data(struct inode *inode, loff_t pos, iomap_next_fn iomap_next)
>  {
>  	loff_t size = i_size_read(inode);
>  	struct iomap_iter iter = {
> @@ -88,7 +88,7 @@ iomap_seek_data(struct inode *inode, loff_t pos, const struct iomap_ops *ops)
>  		return -ENXIO;
>  
>  	iter.len = size - pos;
> -	while ((ret = iomap_iter(&iter, ops)) > 0)
> +	while ((ret = iomap_iter(&iter, iomap_next)) > 0)
>  		iter.status = iomap_seek_data_iter(&iter, &pos);
>  	if (ret < 0)
>  		return ret;
> diff --git a/fs/iomap/swapfile.c b/fs/iomap/swapfile.c
> index 0db77c449467..b8bb34deddfc 100644
> --- a/fs/iomap/swapfile.c
> +++ b/fs/iomap/swapfile.c
> @@ -139,7 +139,7 @@ static int iomap_swapfile_iter(struct iomap_iter *iter,
>   */
>  int iomap_swapfile_activate(struct swap_info_struct *sis,
>  		struct file *swap_file, sector_t *pagespan,
> -		const struct iomap_ops *ops)
> +		iomap_next_fn iomap_next)
>  {
>  	struct inode *inode = swap_file->f_mapping->host;
>  	struct iomap_iter iter = {
> @@ -163,7 +163,7 @@ int iomap_swapfile_activate(struct swap_info_struct *sis,
>  	if (ret)
>  		return ret;
>  
> -	while ((ret = iomap_iter(&iter, ops)) > 0)
> +	while ((ret = iomap_iter(&iter, iomap_next)) > 0)
>  		iter.status = iomap_swapfile_iter(&iter, &iter.iomap, &isi);
>  	if (ret < 0)
>  		return ret;

<snip>

> diff --git a/fs/xfs/xfs_aops.c b/fs/xfs/xfs_aops.c
> index 2a0c54256e93..91480cb6a4d8 100644
> --- a/fs/xfs/xfs_aops.c
> +++ b/fs/xfs/xfs_aops.c
> @@ -752,7 +752,7 @@ xfs_vm_bmap(
>  	 */
>  	if (xfs_is_cow_inode(ip) || XFS_IS_REALTIME_INODE(ip))
>  		return 0;
> -	return iomap_bmap(mapping, block, &xfs_read_iomap_ops);
> +	return iomap_bmap(mapping, block, xfs_read_iomap_next);
>  }
>  
>  static void
> @@ -793,7 +793,7 @@ xfs_vm_read_folio(
>  	struct iomap_read_folio_ctx	ctx = { .cur_folio = folio };
>  
>  	ctx.ops = xfs_get_iomap_read_ops(folio->mapping);
> -	iomap_read_folio(&xfs_read_iomap_ops, &ctx, NULL);
> +	iomap_read_folio(xfs_read_iomap_next, &ctx, NULL);
>  	return 0;
>  }
>  
> @@ -804,7 +804,7 @@ xfs_vm_readahead(
>  	struct iomap_read_folio_ctx	ctx = { .rac = rac };
>  
>  	ctx.ops = xfs_get_iomap_read_ops(rac->mapping),
> -	iomap_readahead(&xfs_read_iomap_ops, &ctx, NULL);
> +	iomap_readahead(xfs_read_iomap_next, &ctx, NULL);
>  }
>  
>  static int
> @@ -850,7 +850,7 @@ xfs_vm_swap_activate(
>  	sis->bdev = xfs_inode_buftarg(ip)->bt_bdev;
>  
>  	return iomap_swapfile_activate(sis, swap_file, span,
> -			&xfs_read_iomap_ops);
> +			xfs_read_iomap_next);
>  }
>  
>  const struct address_space_operations xfs_address_space_operations = {
> diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
> index 7f8bef1a9954..a987ffbf3c02 100644
> --- a/fs/xfs/xfs_file.c
> +++ b/fs/xfs/xfs_file.c
> @@ -269,7 +269,7 @@ xfs_file_dio_read(
>  		dio_ops = &xfs_dio_read_bounce_ops;
>  		dio_flags |= IOMAP_DIO_BOUNCE;
>  	}
> -	ret = iomap_dio_rw(iocb, to, &xfs_read_iomap_ops, dio_ops, dio_flags,
> +	ret = iomap_dio_rw(iocb, to, xfs_read_iomap_next, dio_ops, dio_flags,
>  			NULL, 0);
>  	xfs_iunlock(ip, XFS_IOLOCK_SHARED);
>  
> @@ -292,7 +292,7 @@ xfs_file_dax_read(
>  	ret = xfs_ilock_iocb(iocb, XFS_IOLOCK_SHARED);
>  	if (ret)
>  		return ret;
> -	ret = dax_iomap_rw(iocb, to, &xfs_read_iomap_ops);
> +	ret = dax_iomap_rw(iocb, to, xfs_read_iomap_next);
>  	xfs_iunlock(ip, XFS_IOLOCK_SHARED);
>  
>  	file_accessed(iocb->ki_filp);
> @@ -742,7 +742,7 @@ xfs_file_dio_write_aligned(
>  	struct xfs_inode	*ip,
>  	struct kiocb		*iocb,
>  	struct iov_iter		*from,
> -	const struct iomap_ops	*ops,
> +	iomap_next_fn		iomap_next,
>  	const struct iomap_dio_ops *dops,
>  	struct xfs_zone_alloc_ctx *ac)
>  {
> @@ -777,7 +777,7 @@ xfs_file_dio_write_aligned(
>  	if (mapping_stable_writes(iocb->ki_filp->f_mapping))
>  		dio_flags |= IOMAP_DIO_BOUNCE;
>  	trace_xfs_file_direct_write(iocb, from);
> -	ret = iomap_dio_rw(iocb, from, ops, dops, dio_flags, ac, 0);
> +	ret = iomap_dio_rw(iocb, from, iomap_next, dops, dio_flags, ac, 0);
>  out_unlock:
>  	xfs_iunlock(ip, iolock);
>  	return ret;
> @@ -799,7 +799,7 @@ xfs_file_dio_write_zoned(
>  	if (ret < 0)
>  		return ret;
>  	ret = xfs_file_dio_write_aligned(ip, iocb, from,
> -			&xfs_zoned_direct_write_iomap_ops,
> +			xfs_zoned_direct_write_iomap_next,
>  			&xfs_dio_zoned_write_ops, &ac);
>  	xfs_zoned_space_unreserve(ip->i_mount, &ac);
>  	return ret;
> @@ -824,16 +824,16 @@ xfs_file_dio_write_atomic(
>  	unsigned int		iolock = XFS_IOLOCK_SHARED;
>  	ssize_t			ret, ocount = iov_iter_count(from);
>  	unsigned int		dio_flags = 0;
> -	const struct iomap_ops	*dops;
> +	iomap_next_fn		dops;
>  
>  	/*
>  	 * HW offload should be faster, so try that first if it is already
>  	 * known that the write length is not too large.
>  	 */
>  	if (ocount > xfs_inode_buftarg(ip)->bt_awu_max)
> -		dops = &xfs_atomic_write_cow_iomap_ops;
> +		dops = xfs_atomic_write_cow_iomap_next;
>  	else
> -		dops = &xfs_direct_write_iomap_ops;
> +		dops = xfs_direct_write_iomap_next;

Probably ought to be called iter_fn, or at least something that isn't
"dops".

>  
>  retry:
>  	ret = xfs_ilock_iocb_for_write(iocb, &iolock);
> @@ -862,9 +862,9 @@ xfs_file_dio_write_atomic(
>  	 * possible. The REQ_ATOMIC-based method is typically not possible if
>  	 * the write spans multiple extents or the disk blocks are misaligned.
>  	 */
> -	if (ret == -ENOPROTOOPT && dops == &xfs_direct_write_iomap_ops) {
> +	if (ret == -ENOPROTOOPT && dops == xfs_direct_write_iomap_next) {
>  		xfs_iunlock(ip, iolock);
> -		dops = &xfs_atomic_write_cow_iomap_ops;
> +		dops = xfs_atomic_write_cow_iomap_next;
>  		goto retry;
>  	}
>  
> @@ -947,7 +947,7 @@ xfs_file_dio_write_unaligned(
>  		flags |= IOMAP_DIO_BOUNCE;
>  
>  	trace_xfs_file_direct_write(iocb, from);
> -	ret = iomap_dio_rw(iocb, from, &xfs_direct_write_iomap_ops,
> +	ret = iomap_dio_rw(iocb, from, xfs_direct_write_iomap_next,
>  			   &xfs_dio_write_ops, flags, NULL, 0);
>  
>  	/*
> @@ -987,7 +987,7 @@ xfs_file_dio_write(
>  	if (iocb->ki_flags & IOCB_ATOMIC)
>  		return xfs_file_dio_write_atomic(ip, iocb, from);
>  	return xfs_file_dio_write_aligned(ip, iocb, from,
> -			&xfs_direct_write_iomap_ops, &xfs_dio_write_ops, NULL);
> +			xfs_direct_write_iomap_next, &xfs_dio_write_ops, NULL);
>  }
>  
>  static noinline ssize_t
> @@ -1011,7 +1011,7 @@ xfs_file_dax_write(
>  	pos = iocb->ki_pos;
>  
>  	trace_xfs_file_dax_write(iocb, from);
> -	ret = dax_iomap_rw(iocb, from, &xfs_dax_write_iomap_ops);
> +	ret = dax_iomap_rw(iocb, from, xfs_dax_write_iomap_next);
>  	if (ret > 0 && iocb->ki_pos > i_size_read(inode)) {
>  		i_size_write(inode, iocb->ki_pos);
>  		error = xfs_setfilesize(ip, pos, ret);
> @@ -1054,7 +1054,7 @@ xfs_file_buffered_write(
>  
>  	trace_xfs_file_buffered_write(iocb, from);
>  	ret = iomap_file_buffered_write(iocb, from,
> -			&xfs_buffered_write_iomap_ops, &xfs_iomap_write_ops,
> +			xfs_buffered_write_iomap_next, &xfs_iomap_write_ops,
>  			NULL);
>  
>  	/*
> @@ -1135,7 +1135,7 @@ xfs_file_buffered_write_zoned(
>  retry:
>  	trace_xfs_file_buffered_write(iocb, from);
>  	ret = iomap_file_buffered_write(iocb, from,
> -			&xfs_buffered_write_iomap_ops, &xfs_iomap_write_ops,
> +			xfs_buffered_write_iomap_next, &xfs_iomap_write_ops,
>  			&ac);
>  	if (ret == -ENOSPC && !cleared_space) {
>  		/*
> @@ -1856,10 +1856,10 @@ xfs_file_llseek(
>  	default:
>  		return generic_file_llseek(file, offset, whence);
>  	case SEEK_HOLE:
> -		offset = iomap_seek_hole(inode, offset, &xfs_seek_iomap_ops);
> +		offset = iomap_seek_hole(inode, offset, xfs_seek_iomap_next);
>  		break;
>  	case SEEK_DATA:
> -		offset = iomap_seek_data(inode, offset, &xfs_seek_iomap_ops);
> +		offset = iomap_seek_data(inode, offset, xfs_seek_iomap_next);
>  		break;
>  	}
>  
> @@ -1883,8 +1883,8 @@ xfs_dax_fault_locked(
>  	}
>  	ret = dax_iomap_fault(vmf, order, &pfn, NULL,
>  			(write_fault && !vmf->cow_page) ?
> -				&xfs_dax_write_iomap_ops :
> -				&xfs_read_iomap_ops);
> +				xfs_dax_write_iomap_next :
> +				xfs_read_iomap_next);
>  	if (ret & VM_FAULT_NEEDDSYNC)
>  		ret = dax_finish_sync_fault(vmf, order, pfn);
>  	return ret;
> @@ -1948,7 +1948,7 @@ __xfs_write_fault(
>  	if (IS_DAX(inode))
>  		ret = xfs_dax_fault_locked(vmf, order, true);
>  	else
> -		ret = iomap_page_mkwrite(vmf, &xfs_buffered_write_iomap_ops,
> +		ret = iomap_page_mkwrite(vmf, xfs_buffered_write_iomap_next,
>  				ac);
>  	xfs_iunlock(ip, lock_mode);
>  
> diff --git a/fs/xfs/xfs_iomap.c b/fs/xfs/xfs_iomap.c
> index 4fa1a5c985db..71c4bb024f04 100644
> --- a/fs/xfs/xfs_iomap.c
> +++ b/fs/xfs/xfs_iomap.c
> @@ -1037,7 +1037,7 @@ xfs_direct_write_iomap_begin(
>  	return error;
>  }
>  
> -static int
> +int
>  xfs_direct_write_iomap_next(
>  	const struct iomap_iter *iter,
>  	struct iomap		*iomap,
> @@ -1047,10 +1047,6 @@ xfs_direct_write_iomap_next(
>  			NULL);
>  }
>  
> -const struct iomap_ops xfs_direct_write_iomap_ops = {
> -	.iomap_next		= xfs_direct_write_iomap_next,
> -};
> -
>  #ifdef CONFIG_XFS_RT
>  /*
>   * This is really simple.  The space has already been reserved before taking the
> @@ -1099,7 +1095,7 @@ xfs_zoned_direct_write_iomap_begin(
>  	return 0;
>  }
>  
> -static int
> +int
>  xfs_zoned_direct_write_iomap_next(
>  	const struct iomap_iter *iter,
>  	struct iomap		*iomap,
> @@ -1109,9 +1105,6 @@ xfs_zoned_direct_write_iomap_next(
>  			xfs_zoned_direct_write_iomap_begin, NULL);
>  }
>  
> -const struct iomap_ops xfs_zoned_direct_write_iomap_ops = {
> -	.iomap_next		= xfs_zoned_direct_write_iomap_next,
> -};
>  #endif /* CONFIG_XFS_RT */
>  
>  #ifdef DEBUG
> @@ -1294,7 +1287,7 @@ xfs_atomic_write_cow_iomap_begin(
>  	return error;
>  }
>  
> -static int
> +int
>  xfs_atomic_write_cow_iomap_next(
>  	const struct iomap_iter *iter,
>  	struct iomap		*iomap,
> @@ -1304,10 +1297,6 @@ xfs_atomic_write_cow_iomap_next(
>  			xfs_atomic_write_cow_iomap_begin, NULL);
>  }
>  
> -const struct iomap_ops xfs_atomic_write_cow_iomap_ops = {
> -	.iomap_next		= xfs_atomic_write_cow_iomap_next,
> -};
> -
>  static int
>  xfs_dax_write_iomap_end(
>  	struct inode		*inode,
> @@ -1328,7 +1317,7 @@ xfs_dax_write_iomap_end(
>  	return xfs_reflink_end_cow(ip, pos, written);
>  }
>  
> -static int
> +int
>  xfs_dax_write_iomap_next(
>  	const struct iomap_iter *iter,
>  	struct iomap		*iomap,
> @@ -1338,10 +1327,6 @@ xfs_dax_write_iomap_next(
>  			xfs_dax_write_iomap_end);
>  }
>  
> -const struct iomap_ops xfs_dax_write_iomap_ops = {
> -	.iomap_next	= xfs_dax_write_iomap_next,
> -};
> -
>  /*
>   * Convert a hole to a delayed allocation.
>   */
> @@ -2207,7 +2192,7 @@ xfs_buffered_write_iomap_end(
>  	return 0;
>  }
>  
> -static int
> +int
>  xfs_buffered_write_iomap_next(
>  	const struct iomap_iter *iter,
>  	struct iomap		*iomap,
> @@ -2218,10 +2203,6 @@ xfs_buffered_write_iomap_next(
>  			xfs_buffered_write_iomap_end);
>  }
>  
> -const struct iomap_ops xfs_buffered_write_iomap_ops = {
> -	.iomap_next		= xfs_buffered_write_iomap_next,
> -};
> -
>  static int
>  xfs_read_iomap_begin(
>  	struct inode		*inode,
> @@ -2263,7 +2244,7 @@ xfs_read_iomap_begin(
>  				 shared ? IOMAP_F_SHARED : 0, seq);
>  }
>  
> -static int
> +int
>  xfs_read_iomap_next(
>  	const struct iomap_iter *iter,
>  	struct iomap		*iomap,
> @@ -2272,10 +2253,6 @@ xfs_read_iomap_next(
>  	return iomap_process(iter, iomap, srcmap, xfs_read_iomap_begin, NULL);
>  }
>  
> -const struct iomap_ops xfs_read_iomap_ops = {
> -	.iomap_next		= xfs_read_iomap_next,
> -};
> -
>  static int
>  xfs_seek_iomap_begin(
>  	struct inode		*inode,
> @@ -2360,7 +2337,7 @@ xfs_seek_iomap_begin(
>  	return error;
>  }
>  
> -static int
> +int
>  xfs_seek_iomap_next(
>  	const struct iomap_iter *iter,
>  	struct iomap		*iomap,
> @@ -2369,10 +2346,6 @@ xfs_seek_iomap_next(
>  	return iomap_process(iter, iomap, srcmap, xfs_seek_iomap_begin, NULL);
>  }
>  
> -const struct iomap_ops xfs_seek_iomap_ops = {
> -	.iomap_next		= xfs_seek_iomap_next,
> -};
> -
>  static int
>  xfs_xattr_iomap_begin(
>  	struct inode		*inode,
> @@ -2416,7 +2389,7 @@ xfs_xattr_iomap_begin(
>  	return xfs_bmbt_to_iomap(ip, iomap, &imap, flags, IOMAP_F_XATTR, seq);
>  }
>  
> -static int
> +int
>  xfs_xattr_iomap_next(
>  	const struct iomap_iter *iter,
>  	struct iomap		*iomap,
> @@ -2425,10 +2398,6 @@ xfs_xattr_iomap_next(
>  	return iomap_process(iter, iomap, srcmap, xfs_xattr_iomap_begin, NULL);
>  }
>  
> -const struct iomap_ops xfs_xattr_iomap_ops = {
> -	.iomap_next		= xfs_xattr_iomap_next,
> -};
> -
>  int
>  xfs_zero_range(
>  	struct xfs_inode	*ip,
> @@ -2443,9 +2412,9 @@ xfs_zero_range(
>  
>  	if (IS_DAX(inode))
>  		return dax_zero_range(inode, pos, len, did_zero,
> -				      &xfs_dax_write_iomap_ops);
> +				      xfs_dax_write_iomap_next);
>  	return iomap_zero_range(inode, pos, len, did_zero,
> -			&xfs_buffered_write_iomap_ops, &xfs_iomap_write_ops,
> +			xfs_buffered_write_iomap_next, &xfs_iomap_write_ops,
>  			ac);
>  }
>  
> @@ -2460,8 +2429,8 @@ xfs_truncate_page(
>  
>  	if (IS_DAX(inode))
>  		return dax_truncate_page(inode, pos, did_zero,
> -					&xfs_dax_write_iomap_ops);
> +					xfs_dax_write_iomap_next);
>  	return iomap_truncate_page(inode, pos, did_zero,
> -			&xfs_buffered_write_iomap_ops, &xfs_iomap_write_ops,
> +			xfs_buffered_write_iomap_next, &xfs_iomap_write_ops,
>  			ac);
>  }
> diff --git a/fs/xfs/xfs_iomap.h b/fs/xfs/xfs_iomap.h
> index ebcce7d49446..01875d20fb66 100644
> --- a/fs/xfs/xfs_iomap.h
> +++ b/fs/xfs/xfs_iomap.h
> @@ -49,14 +49,22 @@ xfs_aligned_fsb_count(
>  	return count_fsb;
>  }
>  
> -extern const struct iomap_ops xfs_buffered_write_iomap_ops;
> -extern const struct iomap_ops xfs_direct_write_iomap_ops;
> -extern const struct iomap_ops xfs_zoned_direct_write_iomap_ops;
> -extern const struct iomap_ops xfs_read_iomap_ops;
> -extern const struct iomap_ops xfs_seek_iomap_ops;
> -extern const struct iomap_ops xfs_xattr_iomap_ops;
> -extern const struct iomap_ops xfs_dax_write_iomap_ops;
> -extern const struct iomap_ops xfs_atomic_write_cow_iomap_ops;
> +int xfs_buffered_write_iomap_next(const struct iomap_iter *iter,
> +		struct iomap *iomap, struct iomap *srcmap);
> +int xfs_direct_write_iomap_next(const struct iomap_iter *iter,
> +		struct iomap *iomap, struct iomap *srcmap);
> +int xfs_zoned_direct_write_iomap_next(const struct iomap_iter *iter,
> +		struct iomap *iomap, struct iomap *srcmap);
> +int xfs_read_iomap_next(const struct iomap_iter *iter, struct iomap *iomap,
> +		struct iomap *srcmap);
> +int xfs_seek_iomap_next(const struct iomap_iter *iter, struct iomap *iomap,
> +		struct iomap *srcmap);
> +int xfs_xattr_iomap_next(const struct iomap_iter *iter, struct iomap *iomap,
> +		struct iomap *srcmap);
> +int xfs_dax_write_iomap_next(const struct iomap_iter *iter, struct iomap *iomap,
> +		struct iomap *srcmap);
> +int xfs_atomic_write_cow_iomap_next(const struct iomap_iter *iter,
> +		struct iomap *iomap, struct iomap *srcmap);
>  extern const struct iomap_write_ops xfs_iomap_write_ops;
>  
>  #endif /* __XFS_IOMAP_H__*/
> diff --git a/fs/xfs/xfs_iops.c b/fs/xfs/xfs_iops.c
> index 6339f4956ecb..5c3d9a365f93 100644
> --- a/fs/xfs/xfs_iops.c
> +++ b/fs/xfs/xfs_iops.c
> @@ -1239,10 +1239,10 @@ xfs_vn_fiemap(
>  	if (fieinfo->fi_flags & FIEMAP_FLAG_XATTR) {
>  		fieinfo->fi_flags &= ~FIEMAP_FLAG_XATTR;
>  		error = iomap_fiemap(inode, fieinfo, start, length,
> -				&xfs_xattr_iomap_ops);
> +				xfs_xattr_iomap_next);
>  	} else {
>  		error = iomap_fiemap(inode, fieinfo, start, length,
> -				&xfs_read_iomap_ops);
> +				xfs_read_iomap_next);
>  	}
>  	xfs_iunlock(XFS_I(inode), XFS_IOLOCK_SHARED);
>  
> diff --git a/fs/xfs/xfs_reflink.c b/fs/xfs/xfs_reflink.c
> index a5c188b78138..2b9792626bab 100644
> --- a/fs/xfs/xfs_reflink.c
> +++ b/fs/xfs/xfs_reflink.c
> @@ -1683,7 +1683,7 @@ xfs_reflink_remap_prep(
>  				pos_out, len, remap_flags);
>  	else
>  		ret = dax_remap_file_range_prep(file_in, pos_in, file_out,
> -				pos_out, len, remap_flags, &xfs_read_iomap_ops);
> +				pos_out, len, remap_flags, xfs_read_iomap_next);
>  	if (ret || *len == 0)
>  		goto out_unlock;
>  
> @@ -1878,10 +1878,10 @@ xfs_reflink_unshare(
>  
>  	if (IS_DAX(inode))
>  		error = dax_file_unshare(inode, offset, len,
> -				&xfs_dax_write_iomap_ops);
> +				xfs_dax_write_iomap_next);
>  	else
>  		error = iomap_file_unshare(inode, offset, len,
> -				&xfs_buffered_write_iomap_ops,
> +				xfs_buffered_write_iomap_next,
>  				&xfs_iomap_write_ops);
>  	if (error)
>  		goto out;

Aside from the name bikeshedding, the logic looks solid. :)

--D


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
