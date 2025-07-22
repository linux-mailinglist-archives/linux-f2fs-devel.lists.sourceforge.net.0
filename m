Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DE7B0D222
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Jul 2025 08:55:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hMSpG/6XfSgGDfeYRFLWo8H/QHnzUNLMkrkRCIYvcoc=; b=GkKN2jQ/uj7eS2WYKUy0jECWlL
	B3WM+zQXRSauxgSQipXM9KcnpmeSNKDm4ZkM2UosaEJZMFkwrK1XagwyX04LfUf69G6Riud2gPhWt
	tn9drXFj9Tc66xIk+OpKwa1+n2j8Sy3z+JJUzPouO2zVqW+mh4uNX1zCfdDJPVcMxuHY=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ue6tv-0008SS-GF;
	Tue, 22 Jul 2025 06:55:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ue6tu-0008SI-Pr
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 22 Jul 2025 06:54:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DxQ0kRgKAJPaaJErn5K7typ0G0qcUUSe7zTe2vioZcE=; b=BRZJS95A333tWTJtzt+jPS3af3
 9vQhf4uRJ/Vk621NhEMhoxeFajnvpyZz+Z4kKYZeuOf2T4OhQ4vNSgFipu2Uge2lBMOEqyhPIxHrQ
 kqoJEvWLVQLhJ1glg4nmyLx61wzxp6fvft2ihsEiiqq0/GB1/5HWelU/kIaRT5qwIhOc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DxQ0kRgKAJPaaJErn5K7typ0G0qcUUSe7zTe2vioZcE=; b=PmMYoRfP8r6M+f1xf620gEZ8xs
 4C/6dhdK4dYhvLTGabh6JA3eI+kbLHCX6vCol3NSO1z46u2LmjuzBeTquZk+VUY5FRHF0ndwTmdSx
 7P2GpyhuTD7ay0MHfrLa6pqC+d9FvTRaPKiiv4PgYiaXJDXGxBByb5WQJBm2IVO1oadk=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ue6tu-0005YX-VY for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 22 Jul 2025 06:54:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5A4CBA54D2B;
 Tue, 22 Jul 2025 06:54:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2004BC4CEEB;
 Tue, 22 Jul 2025 06:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753167288;
 bh=KyRyZmC4mLiyZck/87Wyh+paP12J3fjblh2kZnZ9W4E=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=I/ROoF4e3n/N6D+6Wv2hmWi6DUpnt+otEPWgem9SDfDge6dVMWJG6PNDPyrZGrpiZ
 31QbQemZGNd9zvQG9z7Bh4gRPQgH9JKu65fPjbBtzD0c1LvUnqIfcwx9GcjwdeB1nv
 RbtMhGiRmAJZ2iqDbT2q3yhGtrtUwdyeeg1P7rwYb00Op/KwnbtvtAWChD2BV7ImNV
 c84q2LL+BpkEViemDSCAY3/FJsfaJBXTb5GK+dCE5XEgCjtKW+Dch7PyA16at0+dkS
 Wng43P2DkAN1glvov9VRmg5jC17jgDfazkvNLbMdnzYpuS0fP3z+n5aaiYihDF4yoo
 7GziNr/I91BZQ==
Message-ID: <439ea53a-f91e-421a-b497-340d2c306b43@kernel.org>
Date: Tue, 22 Jul 2025 14:54:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20250708170359.111653-1-willy@infradead.org>
 <20250708170359.111653-50-willy@infradead.org>
Content-Language: en-US
In-Reply-To: <20250708170359.111653-50-willy@infradead.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 7/9/25 01:03, Matthew Wilcox (Oracle) wrote: > All callers
 now have a folio so pass it in. Also remove the test for > the private flag;
 it is redundant with checking folio->private for being > NULL [...] 
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
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [147.75.193.91 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ue6tu-0005YX-VY
Subject: Re: [f2fs-dev] [PATCH 49/60] f2fs: Pass a folio to
 f2fs_is_compressed_page()
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 7/9/25 01:03, Matthew Wilcox (Oracle) wrote:
> All callers now have a folio so pass it in.  Also remove the test for
> the private flag; it is redundant with checking folio->private for being
> NULL.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  fs/f2fs/compress.c | 14 ++++++--------
>  fs/f2fs/data.c     | 10 +++++-----
>  fs/f2fs/f2fs.h     |  4 ++--
>  3 files changed, 13 insertions(+), 15 deletions(-)
> 
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index 5847d22a5833..24c7489b7427 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -71,17 +71,15 @@ static pgoff_t start_idx_of_cluster(struct compress_ctx *cc)
>  	return cc->cluster_idx << cc->log_cluster_size;
>  }
>  
> -bool f2fs_is_compressed_page(struct page *page)
> +bool f2fs_is_compressed_page(struct folio *folio)
>  {
> -	if (!PagePrivate(page))
> +	if (!folio->private)
>  		return false;
> -	if (!page_private(page))
> -		return false;
> -	if (page_private_nonpointer(page))
> +	if (folio_test_f2fs_nonpointer(folio))

Hi Matthew,

Is this indicate if folio->private is non-zero, Private flag must have been
set in the folio?

Something like below function, if folio->private is true, we don't need to
set Private flag again after update folio->private, since it assumes it
should have been set previously? Is my understanding correct?

+static inline void folio_set_f2fs_##name(struct folio *folio)		\
+{									\
+	unsigned long v = (1UL << PAGE_PRIVATE_NOT_POINTER) |		\
+			     (1UL << PAGE_PRIVATE_##flagname);		\
+	if (!folio->private)						\
+		folio_attach_private(folio, (void *)v);			\
+	else {								\
+		v |= (unsigned long)folio->private;			\
+		folio->private = (void *)v;				\
+	}								\
+}									\

Thanks,

>  		return false;
>  
> -	f2fs_bug_on(F2FS_P_SB(page),
> -		*((u32 *)page_private(page)) != F2FS_COMPRESSED_PAGE_MAGIC);
> +	f2fs_bug_on(F2FS_F_SB(folio),
> +		*((u32 *)folio->private) != F2FS_COMPRESSED_PAGE_MAGIC);
>  	return true;
>  }
>  
> @@ -1478,7 +1476,7 @@ void f2fs_compress_write_end_io(struct bio *bio, struct folio *folio)
>  	struct f2fs_sb_info *sbi = bio->bi_private;
>  	struct compress_io_ctx *cic = folio->private;
>  	enum count_type type = WB_DATA_TYPE(folio,
> -				f2fs_is_compressed_page(page));
> +				f2fs_is_compressed_page(folio));
>  	int i;
>  
>  	if (unlikely(bio->bi_status != BLK_STS_OK))
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index cf2c146944bf..116482adf591 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -142,7 +142,7 @@ static void f2fs_finish_read_bio(struct bio *bio, bool in_task)
>  	bio_for_each_folio_all(fi, bio) {
>  		struct folio *folio = fi.folio;
>  
> -		if (f2fs_is_compressed_page(&folio->page)) {
> +		if (f2fs_is_compressed_page(folio)) {
>  			if (ctx && !ctx->decompression_attempted)
>  				f2fs_end_read_compressed_page(folio, true, 0,
>  							in_task);
> @@ -186,7 +186,7 @@ static void f2fs_verify_bio(struct work_struct *work)
>  		bio_for_each_folio_all(fi, bio) {
>  			struct folio *folio = fi.folio;
>  
> -			if (!f2fs_is_compressed_page(&folio->page) &&
> +			if (!f2fs_is_compressed_page(folio) &&
>  			    !fsverity_verify_page(&folio->page)) {
>  				bio->bi_status = BLK_STS_IOERR;
>  				break;
> @@ -239,7 +239,7 @@ static void f2fs_handle_step_decompress(struct bio_post_read_ctx *ctx,
>  	bio_for_each_folio_all(fi, ctx->bio) {
>  		struct folio *folio = fi.folio;
>  
> -		if (f2fs_is_compressed_page(&folio->page))
> +		if (f2fs_is_compressed_page(folio))
>  			f2fs_end_read_compressed_page(folio, false, blkaddr,
>  						      in_task);
>  		else
> @@ -337,7 +337,7 @@ static void f2fs_write_end_io(struct bio *bio)
>  		}
>  
>  #ifdef CONFIG_F2FS_FS_COMPRESSION
> -		if (f2fs_is_compressed_page(&folio->page)) {
> +		if (f2fs_is_compressed_page(folio)) {
>  			f2fs_compress_write_end_io(bio, folio);
>  			continue;
>  		}
> @@ -561,7 +561,7 @@ static bool __has_merged_page(struct bio *bio, struct inode *inode,
>  			if (IS_ERR(target))
>  				continue;
>  		}
> -		if (f2fs_is_compressed_page(&target->page)) {
> +		if (f2fs_is_compressed_page(target)) {
>  			target = f2fs_compress_control_folio(target);
>  			if (IS_ERR(target))
>  				continue;
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 68535b917a3a..48b15e44a41c 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -4474,7 +4474,7 @@ enum cluster_check_type {
>  	CLUSTER_COMPR_BLKS, /* return # of compressed blocks in a cluster */
>  	CLUSTER_RAW_BLKS    /* return # of raw blocks in a cluster */
>  };
> -bool f2fs_is_compressed_page(struct page *page);
> +bool f2fs_is_compressed_page(struct folio *folio);
>  struct folio *f2fs_compress_control_folio(struct folio *folio);
>  int f2fs_prepare_compress_overwrite(struct inode *inode,
>  			struct page **pagep, pgoff_t index, void **fsdata);
> @@ -4543,7 +4543,7 @@ void f2fs_invalidate_compress_pages(struct f2fs_sb_info *sbi, nid_t ino);
>  		sbi->compr_saved_block += diff;				\
>  	} while (0)
>  #else
> -static inline bool f2fs_is_compressed_page(struct page *page) { return false; }
> +static inline bool f2fs_is_compressed_page(struct folio *folio) { return false; }
>  static inline bool f2fs_is_compress_backend_ready(struct inode *inode)
>  {
>  	if (!f2fs_compressed_file(inode))



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
