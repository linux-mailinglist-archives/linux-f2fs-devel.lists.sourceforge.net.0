Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E7998C0C46C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 27 Oct 2025 09:21:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SCXRkS1WjW+30bEd4311ggRr+dJ3zRbJvETz8FE371w=; b=JJyl1CCQFvMg11Sw1vGFj+Sv05
	fLjJNeunrVgYB8xhKr/QAWM6M049JHT5nipGArDLjBc5+i1PrBfhGNKorJDL8jEQulN9+7izo1BTf
	erDwL2JQ6X88D6C7VLTQz2/4dXySe+59suSB2OYXImGYYDzVrHPDj8OxiG1cy1LLno64=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vDITT-0005OQ-0i;
	Mon, 27 Oct 2025 08:21:07 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vDITR-0005OK-Tv
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Oct 2025 08:21:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OS6TD8PsEzfnPxEob+PL2Yk/RxxgI7UjT/GqsIkn1fQ=; b=JffU67Lv4mRVQE5jIp9NPjaTZ0
 n7wEMJHhwINgaYCzZ0j1Bx1NB2odhnTSJB3El1GASIx6UJh3ADXTrv7ArpVtS1JhFAiwZcMS9OwMl
 D78b8VLMqkkEZ9wZN272ECWJjUHc6YLxVvm5nu1kHs+/6TcYbDN8BUw/P9QJZTi97eTg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OS6TD8PsEzfnPxEob+PL2Yk/RxxgI7UjT/GqsIkn1fQ=; b=AmnirqtpxMBruxbZk2Q+4ibRxi
 p9afqsVMG8ypsxDeqYMmDYNDclekmPKMTVBn0aBuKZq7wvhTja4VQMUqUEsV+91sv2vPuO0hCkxcA
 azg11uXaCdVk9TPTHQJeNrNVY8mWC88Yg1a94Ut7R0HQFHx7L+6wlWEivN5f0D78o+IU=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vDITR-00027L-AI for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Oct 2025 08:21:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E83B640401;
 Mon, 27 Oct 2025 08:20:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77456C4CEF1;
 Mon, 27 Oct 2025 08:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761553254;
 bh=kZEWpxSlMsmolTkD6bSUizlONiaovvY4kPkzPXEi7hE=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=RYzMOsn85iVgjJ3iChJB2ZUiI9Yna2yiIDycBc9amOk3MmceOTtH0RaNe38GKznPe
 UtE/nkjXdB0ytUa+GthGKIP7/XaVJNAOmmwMDfxR40M/63zD9Ld7FU76H7zsOgsJv1
 Tbma4IozPOX1eojb437p2zn+PGwyAzbEMDkZj2TCW13tq0BXYv6sjxnV4huYo4G8s6
 huqA64a/enk1nSg7DEzj3PmKM/DR76rh58E9McgYxRxhwMjHeveUOCScRJWC220YAM
 ddkF4sTY9V5v9PCkHvBzqtjPrVZiLASDoYJnLIBugkGqQC6wBlmUJT//7DmzjIU2ln
 LJ+aprpWGQgnw==
Message-ID: <2170f364-b48a-47ef-a8b8-f6e72027999a@kernel.org>
Date: Mon, 27 Oct 2025 16:20:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <yangyongpeng.storage@gmail.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20251024131344.144972-1-yangyongpeng.storage@gmail.com>
Content-Language: en-US
In-Reply-To: <20251024131344.144972-1-yangyongpeng.storage@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 10/24/25 21:13, Yongpeng Yang wrote: > From: Yongpeng Yang
 <yangyongpeng@xiaomi.com> > > Change the type of the unlock parameter of
 f2fs_put_page to bool. > All callers should consistently pass tru [...] 
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vDITR-00027L-AI
Subject: Re: [f2fs-dev] [PATCH] f2fs: change the unlock parameter of
 f2fs_put_page to bool
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 10/24/25 21:13, Yongpeng Yang wrote:
> From: Yongpeng Yang <yangyongpeng@xiaomi.com>
> 
> Change the type of the unlock parameter of f2fs_put_page to bool.
> All callers should consistently pass true or false. No logical change.
> 
> Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
> ---
>  fs/f2fs/compress.c |  8 ++++----
>  fs/f2fs/data.c     | 12 ++++--------
>  fs/f2fs/f2fs.h     |  2 +-
>  fs/f2fs/gc.c       |  6 +++---
>  fs/f2fs/inline.c   |  4 ++--
>  fs/f2fs/namei.c    |  4 ++--
>  6 files changed, 16 insertions(+), 20 deletions(-)
> 
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index 811bfe38e5c0..716004ba44dc 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -120,7 +120,7 @@ static void f2fs_unlock_rpages(struct compress_ctx *cc, int len)
>  }
>  
>  static void f2fs_put_rpages_wbc(struct compress_ctx *cc,
> -		struct writeback_control *wbc, bool redirty, int unlock)
> +		struct writeback_control *wbc, bool redirty, bool unlock)
>  {
>  	unsigned int i;
>  
> @@ -1202,7 +1202,7 @@ bool f2fs_compress_write_end(struct inode *inode, void *fsdata,
>  	if (copied)
>  		set_cluster_dirty(&cc);
>  
> -	f2fs_put_rpages_wbc(&cc, NULL, false, 1);
> +	f2fs_put_rpages_wbc(&cc, NULL, false, true);
>  	f2fs_destroy_compress_ctx(&cc, false);
>  
>  	return first_index;
> @@ -1605,7 +1605,7 @@ int f2fs_write_multi_pages(struct compress_ctx *cc,
>  			add_compr_block_stat(cc->inode, cc->cluster_size);
>  			goto write;
>  		} else if (err) {
> -			f2fs_put_rpages_wbc(cc, wbc, true, 1);
> +			f2fs_put_rpages_wbc(cc, wbc, true, true);
>  			goto destroy_out;
>  		}
>  
> @@ -1619,7 +1619,7 @@ int f2fs_write_multi_pages(struct compress_ctx *cc,
>  	f2fs_bug_on(F2FS_I_SB(cc->inode), *submitted);
>  
>  	err = f2fs_write_raw_pages(cc, submitted, wbc, io_type);
> -	f2fs_put_rpages_wbc(cc, wbc, false, 0);
> +	f2fs_put_rpages_wbc(cc, wbc, false, false);
>  destroy_out:
>  	f2fs_destroy_compress_ctx(cc, false);
>  	return err;
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 1f090c018f1b..daca2a42b20c 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -3621,8 +3621,7 @@ static int f2fs_write_begin(const struct kiocb *iocb,
>  		folio_lock(folio);
>  		if (folio->mapping != mapping) {
>  			/* The folio got truncated from under us */
> -			folio_unlock(folio);
> -			folio_put(folio);
> +			f2fs_folio_put(folio, true);

Yongpeng,

I prefer to not use f2fs_folio_put() here, to avoid potential null-ptr dereference
on folio->mapping via f2fs_folio_put() -> F2FS_F_SB(), as folio->mapping could be
NULL due to race w/ truncation.

>  			goto repeat;
>  		}
>  	}
> @@ -3653,8 +3652,7 @@ static int f2fs_write_begin(const struct kiocb *iocb,
>  
>  		folio_lock(folio);
>  		if (unlikely(folio->mapping != mapping)) {
> -			folio_unlock(folio);
> -			folio_put(folio);
> +			f2fs_folio_put(folio, true);

Ditto,

Thanks,

>  			goto repeat;
>  		}
>  		if (unlikely(!folio_test_uptodate(folio))) {
> @@ -3665,8 +3663,7 @@ static int f2fs_write_begin(const struct kiocb *iocb,
>  	return 0;
>  
>  put_folio:
> -	folio_unlock(folio);
> -	folio_put(folio);
> +	f2fs_folio_put(folio, true);
>  fail:
>  	f2fs_write_failed(inode, pos + len);
>  	return err;
> @@ -3722,8 +3719,7 @@ static int f2fs_write_end(const struct kiocb *iocb,
>  					pos + copied);
>  	}
>  unlock_out:
> -	folio_unlock(folio);
> -	folio_put(folio);
> +	f2fs_folio_put(folio, true);
>  	f2fs_update_time(F2FS_I_SB(inode), REQ_TIME);
>  	return copied;
>  }
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 94eb9a2d3a73..32fb2e7338b7 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -2979,7 +2979,7 @@ static inline void f2fs_folio_put(struct folio *folio, bool unlock)
>  	folio_put(folio);
>  }
>  
> -static inline void f2fs_put_page(struct page *page, int unlock)
> +static inline void f2fs_put_page(struct page *page, bool unlock)
>  {
>  	if (!page)
>  		return;
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 22fe6e2c6d5c..fd8bb0424bf3 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -1278,7 +1278,7 @@ static int ra_data_block(struct inode *inode, pgoff_t index)
>  	err = f2fs_submit_page_bio(&fio);
>  	if (err)
>  		goto put_encrypted_page;
> -	f2fs_put_page(fio.encrypted_page, 0);
> +	f2fs_put_page(fio.encrypted_page, false);
>  	f2fs_folio_put(folio, true);
>  
>  	f2fs_update_iostat(sbi, inode, FS_DATA_READ_IO, F2FS_BLKSIZE);
> @@ -1286,7 +1286,7 @@ static int ra_data_block(struct inode *inode, pgoff_t index)
>  
>  	return 0;
>  put_encrypted_page:
> -	f2fs_put_page(fio.encrypted_page, 1);
> +	f2fs_put_page(fio.encrypted_page, true);
>  put_folio:
>  	f2fs_folio_put(folio, true);
>  	return err;
> @@ -1442,7 +1442,7 @@ static int move_data_block(struct inode *inode, block_t bidx,
>  	f2fs_update_data_blkaddr(&dn, newaddr);
>  	set_inode_flag(inode, FI_APPEND_WRITE);
>  
> -	f2fs_put_page(fio.encrypted_page, 1);
> +	f2fs_put_page(fio.encrypted_page, true);
>  recover_block:
>  	if (err)
>  		f2fs_do_replace_block(fio.sbi, &sum, newaddr, fio.old_blkaddr,
> diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
> index 58ac831ef704..e5c6a08b7e4f 100644
> --- a/fs/f2fs/inline.c
> +++ b/fs/f2fs/inline.c
> @@ -287,7 +287,7 @@ int f2fs_write_inline_data(struct inode *inode, struct folio *folio)
>  	set_inode_flag(inode, FI_DATA_EXIST);
>  
>  	folio_clear_f2fs_inline(ifolio);
> -	f2fs_folio_put(ifolio, 1);
> +	f2fs_folio_put(ifolio, true);
>  	return 0;
>  }
>  
> @@ -577,7 +577,7 @@ static int f2fs_move_rehashed_dirents(struct inode *dir, struct folio *ifolio,
>  	f2fs_i_depth_write(dir, 0);
>  	f2fs_i_size_write(dir, MAX_INLINE_DATA(dir));
>  	folio_mark_dirty(ifolio);
> -	f2fs_folio_put(ifolio, 1);
> +	f2fs_folio_put(ifolio, true);
>  
>  	kfree(backup_dentry);
>  	return err;
> diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
> index 68b33e8089b0..07ceed173ffe 100644
> --- a/fs/f2fs/namei.c
> +++ b/fs/f2fs/namei.c
> @@ -1259,11 +1259,11 @@ static int f2fs_cross_rename(struct inode *old_dir, struct dentry *old_dentry,
>  	return 0;
>  out_new_dir:
>  	if (new_dir_entry) {
> -		f2fs_folio_put(new_dir_folio, 0);
> +		f2fs_folio_put(new_dir_folio, false);
>  	}
>  out_old_dir:
>  	if (old_dir_entry) {
> -		f2fs_folio_put(old_dir_folio, 0);
> +		f2fs_folio_put(old_dir_folio, false);
>  	}
>  out_new:
>  	f2fs_folio_put(new_folio, false);



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
