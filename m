Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B651B81F29C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 27 Dec 2023 23:56:25 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rIcow-0001zn-Rq;
	Wed, 27 Dec 2023 22:56:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1rIcov-0001zh-B4
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 27 Dec 2023 22:56:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EGZUZU6W0tm5wD2g6qoPA1EOcPwLGhQ8XrKJRuaZvmc=; b=XX3tV6jq7L9rGgMB25bopfQdpw
 /j4WfrXMBpwyjqJzoaplV9o2q8C27cNZV8NlSFG3UrCHXqq7WIrl7VXwYiyWzv9Uq7znaAu/avPxg
 S3bsaXyhBVd6REijCJc4oQc5k+uAn5+y/hX20GLNZhKiCfdqGIRdbqb0WIR2xPjh10g0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EGZUZU6W0tm5wD2g6qoPA1EOcPwLGhQ8XrKJRuaZvmc=; b=IR8JeKlr4YgHjADJsoQJm5ttI5
 Xr4Ke2/A1SlMiulQpNk6nbWlP/mVBkBO6VL9ap6U7+JPGUdvUbOnQuyIQHoj9Bhpz9msn33OzTAzS
 Uk8o5pJT0JCqVJwpSg80OCE3pKSTLzEjPZItysWQIAyI144crYCyKHdpb1GmJ5f+ZEuI=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rIcoq-00042g-J4 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 27 Dec 2023 22:56:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id A181DCE1349
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 27 Dec 2023 22:55:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62C9AC433C8;
 Wed, 27 Dec 2023 22:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703717751;
 bh=mnJTPqwPwB6EUXseshRLDDmYsgw6t1CTmgR1m3VU4aE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UvYFtBGOGjeB/oJjzdQ+yNOCqtdNo1MVtCoD76Vuc3kd6R/yFi4vedt17wWthXZcO
 NCAsVS6W/9f7Ix3KsGe5Mh7kHI2pyFx3XJmwHNeiziEWsBZv7thg+rrP2vVNsafYcG
 bcKvpe6R7lxP8+v53OEN9aFDA/bqG1l5ymcjdFO7rDi/dKpaHViru/Ih20Apt5wG9F
 9XZrrmVj8dThT7UHphU0OaBON+HJObdPSUH/pyx7+Z9i80r9nC1g4vrWE5qhMBW9yI
 Fqcn4QjkYIMlkEepBELkqZeqNxXRBCSOAjMxsd8NvCFkadtQYiIyaUO1VxkOB+sDj2
 N64wPqHvJpFmQ==
Date: Wed, 27 Dec 2023 14:55:49 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <ZYyrddJK8KJNpKXz@google.com>
References: <20231220135934.3471407-1-chao@kernel.org>
 <ZYs_S0VLFFnV1g-3@google.com>
 <35f160e2-a9e4-4f76-af32-de00dce05fa1@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <35f160e2-a9e4-4f76-af32-de00dce05fa1@kernel.org>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/27, Chao Yu wrote: > On 2023/12/27 5:02, Jaegeuk Kim
 wrote: > > On 12/20, Chao Yu wrote: > > > If data block in compressed cluster
 is not persisted with metadata > > > during checkpoint, after S [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -2.8 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rIcoq-00042g-J4
Subject: Re: [f2fs-dev] [PATCH 1/6] f2fs: compress: fix to guarantee
 persisting compressed blocks by CP
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 12/27, Chao Yu wrote:
> On 2023/12/27 5:02, Jaegeuk Kim wrote:
> > On 12/20, Chao Yu wrote:
> > > If data block in compressed cluster is not persisted with metadata
> > > during checkpoint, after SPOR, the data may be corrupted, let's
> > > guarantee to write compressed page by checkpoint.
> > > 
> > > Fixes: 4c8ff7095bef ("f2fs: support data compression")
> > > Signed-off-by: Chao Yu <chao@kernel.org>
> > > ---
> > >   fs/f2fs/compress.c |  3 ++-
> > >   fs/f2fs/data.c     | 12 +++++++++---
> > >   fs/f2fs/f2fs.h     |  3 ++-
> > >   3 files changed, 13 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> > > index 5b076329e9bf..1122db8cc0b0 100644
> > > --- a/fs/f2fs/compress.c
> > > +++ b/fs/f2fs/compress.c
> > > @@ -1442,6 +1442,7 @@ void f2fs_compress_write_end_io(struct bio *bio, struct page *page)
> > >   	struct f2fs_sb_info *sbi = bio->bi_private;
> > >   	struct compress_io_ctx *cic =
> > >   			(struct compress_io_ctx *)page_private(page);
> > > +	enum count_type type = WB_DATA_TYPE(page);
> > >   	int i;
> > >   	if (unlikely(bio->bi_status))
> > > @@ -1449,7 +1450,7 @@ void f2fs_compress_write_end_io(struct bio *bio, struct page *page)
> > >   	f2fs_compress_free_page(page);
> > > -	dec_page_count(sbi, F2FS_WB_DATA);
> > > +	dec_page_count(sbi, type);
> > >   	if (atomic_dec_return(&cic->pending_pages))
> > >   		return;
> > > diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> > > index d28c97282e68..6c72a6e86ba8 100644
> > > --- a/fs/f2fs/data.c
> > > +++ b/fs/f2fs/data.c
> > > @@ -48,7 +48,7 @@ void f2fs_destroy_bioset(void)
> > >   	bioset_exit(&f2fs_bioset);
> > >   }
> > > -static bool __is_cp_guaranteed(struct page *page)
> > > +bool f2fs_is_cp_guaranteed(struct page *page)
> > >   {
> > >   	struct address_space *mapping = page->mapping;
> > >   	struct inode *inode;
> > > @@ -66,7 +66,7 @@ static bool __is_cp_guaranteed(struct page *page)
> > >   		return true;
> > >   	if (f2fs_is_compressed_page(page))
> > > -		return false;
> > > +		return true;
> > >   	if ((S_ISREG(inode->i_mode) && IS_NOQUOTA(inode)) ||
> > >   			page_private_gcing(page))
> > >   		return true;
> > > @@ -1007,6 +1007,7 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
> > >   	enum page_type btype = PAGE_TYPE_OF_BIO(fio->type);
> > >   	struct f2fs_bio_info *io = sbi->write_io[btype] + fio->temp;
> > >   	struct page *bio_page;
> > > +	enum count_type type;
> > >   	f2fs_bug_on(sbi, is_read_io(fio->op));
> > > @@ -1046,7 +1047,12 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
> > >   	/* set submitted = true as a return value */
> > >   	fio->submitted = 1;
> > > -	inc_page_count(sbi, WB_DATA_TYPE(bio_page));
> > > +	type = WB_DATA_TYPE(bio_page);
> > > +	/* override count type if page is compressed one */
> > > +	if (fio->compressed_page)
> > > +		type = WB_DATA_TYPE(fio->compressed_page);
> > 
> > Doesn't bio_page already point fio->compressed_page?
> 
> Please check below codes, bio_page will point to fio->encrypted_page if
> both software encryption feature and compression feature are on, for this
> case, we still need to account F2FS_WB_CP_DATA.

So, it seems you want to make F2FS_WB_CP_DATA regardless of conditions. Then,
how about making this explictly instead of implicit condition check of the page?

#define WB_DATA_TYPE(p, f) (f || __is_cp_guaranteed(p) ? F2FS_WB_CP_DATA : F2FS_WB_DATA)

	inc_page_count(sbi, WB_DATA_TYPE(bio_page, bio_page == fio->compressed_page));

	dec_page_count(sbi, WB_DATA_TYPE(page, f2fs_is_compressed_page(page)));

> 
> 	if (fio->encrypted_page)
> 		bio_page = fio->encrypted_page;
> 	else if (fio->compressed_page)
> 		bio_page = fio->compressed_page;
> 	else
> 		bio_page = fio->page;
> 
> Thanks,
> 
> > 
> > > +
> > > +	inc_page_count(sbi, type);
> > >   	if (io->bio &&
> > >   	    (!io_is_mergeable(sbi, io->bio, io, fio, io->last_block_in_bio,
> > > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > > index 76e9a8682e38..bcb3940ab5ba 100644
> > > --- a/fs/f2fs/f2fs.h
> > > +++ b/fs/f2fs/f2fs.h
> > > @@ -1092,7 +1092,7 @@ struct f2fs_sm_info {
> > >    * f2fs monitors the number of several block types such as on-writeback,
> > >    * dirty dentry blocks, dirty node blocks, and dirty meta blocks.
> > >    */
> > > -#define WB_DATA_TYPE(p)	(__is_cp_guaranteed(p) ? F2FS_WB_CP_DATA : F2FS_WB_DATA)
> > > +#define WB_DATA_TYPE(p)	(f2fs_is_cp_guaranteed(p) ? F2FS_WB_CP_DATA : F2FS_WB_DATA)
> > >   enum count_type {
> > >   	F2FS_DIRTY_DENTS,
> > >   	F2FS_DIRTY_DATA,
> > > @@ -3824,6 +3824,7 @@ void f2fs_init_ckpt_req_control(struct f2fs_sb_info *sbi);
> > >    */
> > >   int __init f2fs_init_bioset(void);
> > >   void f2fs_destroy_bioset(void);
> > > +bool f2fs_is_cp_guaranteed(struct page *page);
> > >   int f2fs_init_bio_entry_cache(void);
> > >   void f2fs_destroy_bio_entry_cache(void);
> > >   void f2fs_submit_read_bio(struct f2fs_sb_info *sbi, struct bio *bio,
> > > -- 
> > > 2.40.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
