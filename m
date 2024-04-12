Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BD08A3760
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Apr 2024 22:57:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rvNxm-0001va-1o;
	Fri, 12 Apr 2024 20:57:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1rvNxk-0001vS-P8
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Apr 2024 20:57:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YA2VHO3OyJZ4AyIoAfy2Q+30GZdKI2KAwzI622XwfJY=; b=PDzCzcXDMw0QBNYXCjInt1EpWF
 n27dGonWAt2kH3yfFeXc6rrDBkhY2wLlNv72n4HS3/4js8R8tgBm9xo/PAI6w3jS0wFczB+6G1bEX
 dE0PEw3bwU0MYHyEcM7CPfhtj7n1c+OsAjE3bh2EjrfwIh+2nsnasa7u0LRfw5tCfn6k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YA2VHO3OyJZ4AyIoAfy2Q+30GZdKI2KAwzI622XwfJY=; b=ZJT4rxMIYpP6ZXTQqytdcS73Nm
 elUzXvWXGCUukv9TdIJKyBvRa5OI1LkN8KhRZQZaeRc4CE8qRBHlQLBvihcENTJ/5u8LdCrdG2pAE
 BRD85b0WxwrjOlXmqyK4UTW83YbocacnTIGXjwyhsySryXVpk8/5ZjC/7FHZGFc+Ds38=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rvNxk-0004j2-5m for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Apr 2024 20:57:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 18C816101C
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 12 Apr 2024 20:57:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E5E5C113CC;
 Fri, 12 Apr 2024 20:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712955446;
 bh=N557OwkcMRzWWTkVtHcBibqTIxbQIgFLHLWudntz+/s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MW+cMZoosDJKSB2cOLCkq7MkRggIbRTBeKR3ycmPur4UnWRKeCgOVtYKbKZ/bfvB5
 XfIztRiqlQKc4zg5EITFk+mkch5AHSIL7EJhqRwcKvgrwgPoKHFNgQ7hDk4dCttDOz
 3vaJr22oHJHxZvYMsSw5YSdEE/KilhCMRuB8ZRIPWr5Pw1njLmhsODQWPmGHf+H1Ti
 debFilfMRLdVoNLcAj3KVYNuWRVEV8PSqvvUmHrOUQdA6kD31c8rEK9OzOzBKiOGI1
 iOYSWQpXmUXbxK+NrHyKEckrN7g9oBZ+3oA/eMr5rRpxHRsP9zTl+AUPNXQxbV0qzO
 r+nrs1TRE9uWQ==
Date: Fri, 12 Apr 2024 20:57:24 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <ZhmgNBozIPL-WFZR@google.com>
References: <20240409203411.1885121-1-jaegeuk@kernel.org>
 <20240409203411.1885121-2-jaegeuk@kernel.org>
 <59414941-a15f-4eb0-8574-3b2a27d8ae69@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <59414941-a15f-4eb0-8574-3b2a27d8ae69@kernel.org>
X-Spam-Score: -7.3 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 04/11, Chao Yu wrote: > On 2024/4/10 4:34, Jaegeuk Kim
 wrote: > > Let's stop issuing compressed writes and clear their writeback
 flags. > > > > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> > > - [...]
 Content analysis details:   (-7.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rvNxk-0004j2-5m
Subject: Re: [f2fs-dev] [PATCH 2/3] f2fs: clear writeback when compression
 failed
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

On 04/11, Chao Yu wrote:
> On 2024/4/10 4:34, Jaegeuk Kim wrote:
> > Let's stop issuing compressed writes and clear their writeback flags.
> > 
> > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > ---
> >   fs/f2fs/compress.c | 33 +++++++++++++++++++++++++++++++--
> >   1 file changed, 31 insertions(+), 2 deletions(-)
> > 
> > diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> > index d67c471ab5df..3a8ecc6aee84 100644
> > --- a/fs/f2fs/compress.c
> > +++ b/fs/f2fs/compress.c
> > @@ -1031,6 +1031,25 @@ static void set_cluster_writeback(struct compress_ctx *cc)
> >   	}
> >   }
> > +static void cancel_cluster_writeback(struct compress_ctx *cc, int submitted)
> > +{
> > +	int i;
> > +
> > +	for (i = 0; i < cc->cluster_size; i++) {
> > +		if (!cc->rpages[i])
> > +			continue;
> > +		if (i < submitted) {
> > +			if (i)
> > +				f2fs_wait_on_page_writeback(cc->rpages[i],
> > +						DATA, true, true);
> > +			inode_inc_dirty_pages(cc->inode);
> > +			lock_page(cc->rpages[i]);
> > +		}
> > +		clear_page_private_gcing(cc->rpages[i]);
> > +		end_page_writeback(cc->rpages[i]);
> > +	}
> > +}
> > +
> >   static void set_cluster_dirty(struct compress_ctx *cc)
> >   {
> >   	int i;
> > @@ -1232,7 +1251,6 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
> >   		.page = NULL,
> >   		.encrypted_page = NULL,
> >   		.compressed_page = NULL,
> > -		.submitted = 0,
> >   		.io_type = io_type,
> >   		.io_wbc = wbc,
> >   		.encrypted = fscrypt_inode_uses_fs_layer_crypto(cc->inode) ?
> > @@ -1358,7 +1376,15 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
> >   			fio.compressed_page = cc->cpages[i - 1];
> >   		cc->cpages[i - 1] = NULL;
> > +		fio.submitted = 0;
> >   		f2fs_outplace_write_data(&dn, &fio);
> > +		if (unlikely(!fio.submitted)) {
> > +			cancel_cluster_writeback(cc, i);
> > +
> > +			/* To call fscrypt_finalize_bounce_page */
> > +			i = cc->valid_nr_cpages;
> 
> *submitted = 0; ?

And, it seems this is not enough to address kernel hang on wait_on_writeback
while running fsstress + shutdown test. Stay tuned.

> 
> Thanks,
> 
> > +			goto out_destroy_crypt;
> > +		}
> >   		(*submitted)++;
> >   unlock_continue:
> >   		inode_dec_dirty_pages(cc->inode);
> > @@ -1392,8 +1418,11 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
> >   out_destroy_crypt:
> >   	page_array_free(cc->inode, cic->rpages, cc->cluster_size);
> > -	for (--i; i >= 0; i--)
> > +	for (--i; i >= 0; i--) {
> > +		if (!cc->cpages[i])
> > +			continue;
> >   		fscrypt_finalize_bounce_page(&cc->cpages[i]);
> > +	}
> >   out_put_cic:
> >   	kmem_cache_free(cic_entry_slab, cic);
> >   out_put_dnode:


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
