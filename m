Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B2459AAA2
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 20 Aug 2022 04:08:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oPDue-0004S7-JT;
	Sat, 20 Aug 2022 02:08:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <fmdefrancesco@gmail.com>) id 1oPDuc-0004S1-JT
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 20 Aug 2022 02:08:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=S5HX3yQxHZsdBOSDLucjhTh9DK0BKP1yB69LdNKCN/8=; b=geGTxSutOAXL3CrwIoyEG3nBf3
 3mPYvBtAyroLDrUm6F/zBMu2qdMd4ReSZ58MS/LZ/yTjOjuOY5n+G5tyOObI223GxPQW2TjMAaA0T
 wSuVTQEgWJbqInRxpswbjmg2lnihWErjid6PL4DBPw5BToW/AXtQp+MAnHalKQNVER8w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=S5HX3yQxHZsdBOSDLucjhTh9DK0BKP1yB69LdNKCN/8=; b=SpK9OvC6KwnCr8A3Iwcv0npKt0
 bwS0zVBQgVupNpsWL4/j4XVQg+VKCoUT30lVsCamJ+4q6cKQZ62MG5Ssg9QsVkpvOqUXYW7CnilCb
 fzE+JwzZjffKFczHgM3Y3w8j581S+1qMtcUZEcGCCP9rrL30Q9kl4Z9eGEKPhiiyS4q0=;
Received: from mail-ej1-f44.google.com ([209.85.218.44])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oPDuY-00012t-KL for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 20 Aug 2022 02:08:34 +0000
Received: by mail-ej1-f44.google.com with SMTP id a7so11881292ejp.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 19 Aug 2022 19:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=S5HX3yQxHZsdBOSDLucjhTh9DK0BKP1yB69LdNKCN/8=;
 b=IOUC4tPa0CY67LIUu8g6TGtR9bQztFvfU4xeiSNigSjCUoNvxd/6dDt2OOgJGxcv2u
 JCQT8Tb8zcwpQBi//KAmiyDw0NaCD84pV+ctbfwnIhq/q02WthnVysWs9elgPBqdQO3Z
 HLu3zlr6yqWxDbCB62BXm7HDtbClrirP3O+K35ItwLSzRRVZHQRikiD6Mfm6IBDhx/Tf
 Ir9hGOLcOf4ss0d7ncuUuDf2HVNjZN3y64s6VM0+HiC6+3YW0J90GpGZ2bkc9sV/sVi2
 p6j7zXVzWDUEUuZ1oJIzzM+L5wC8jE1dOeE8kJA0lWzK2ty2Gb8w5ur4hOVibOnRIxzi
 PkCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=S5HX3yQxHZsdBOSDLucjhTh9DK0BKP1yB69LdNKCN/8=;
 b=Bj8TtXid4OfWf2dEwMxtaNvPrjKTJ6VeYYgymrBf66qaTij0H5pEsGg+9h0GDiRtgz
 iL3GwSaUXQPeHqAq/qgFvu2xPwVxCxW3gKam4fsSUeqRjWYbiMAZsmvmWEnye6H2CW7W
 dCcVtUPi1DbifTqJOkUgUiIAAPmYqahan0XQKApQwjAvtTYqMqQmYYab9Yp/IeHv02oT
 LJAcDPAzR69bvsDVBp5umWZ8Rr4Q4ydNr2GL1XcHV5G+1IruXOcHCSunYP3M81ce+2zW
 zSYPX4j93oHlm/POzmE9IYD9zMwihGBhV90jIxKLSX1+oMcZmQz3kr3vlwcDv+/ooYS/
 cFIw==
X-Gm-Message-State: ACgBeo1Fl95bdNpjuaAYPtH3UGohR7wCjj4pY1po5c30ucH1kZapqrs9
 BjwbiruOd9QkHLiSWXvG0tO2TvvmP/Y=
X-Google-Smtp-Source: AA6agR5d4eTzJdLWWCiu455rus1vo4fBpTkfAGLlz0WFRgspFqMvdB4VlwTZWyV5ZCjlQbQ+Xcyl4A==
X-Received: by 2002:a17:906:9749:b0:730:c005:5d59 with SMTP id
 o9-20020a170906974900b00730c0055d59mr6459790ejy.419.1660961303489; 
 Fri, 19 Aug 2022 19:08:23 -0700 (PDT)
Received: from opensuse.localnet (host-87-17-106-94.retail.telecomitalia.it.
 [87.17.106.94]) by smtp.gmail.com with ESMTPSA id
 y14-20020a1709063a8e00b0073a644ef803sm3011448ejd.101.2022.08.19.19.08.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 19:08:22 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>
Date: Sat, 20 Aug 2022 04:08:19 +0200
Message-ID: <4750218.GXAFRqVoOG@opensuse>
In-Reply-To: <20220819223300.9128-1-ebiggers@kernel.org>
References: <20220819223300.9128-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On sabato 20 agosto 2022 00:33:00 CEST Eric Biggers wrote:
 > From: Eric Biggers > > This is simpler, and as a side effect it replaces
 several uses of > kmap_atomic() with its recommended replacement [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.218.44 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.218.44 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [fmdefrancesco[at]gmail.com]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1oPDuY-00012t-KL
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: use memcpy_{to,
 from}_page() where possible
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
Cc: linux-fsdevel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On sabato 20 agosto 2022 00:33:00 CEST Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> This is simpler, and as a side effect it replaces several uses of
> kmap_atomic() with its recommended replacement kmap_local_page().
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
> 
> v2: remove unneeded calls to flush_dcache_page(),
>     and convert the kmap_atomic() in f2fs_write_inline_data().
> 
>  fs/f2fs/inline.c | 15 ++++-----------
>  fs/f2fs/super.c  | 11 ++---------
>  fs/f2fs/verity.c | 10 ++--------
>  3 files changed, 8 insertions(+), 28 deletions(-)

It looks good to me...

Reviewed-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>

Thanks,

Fabio

> diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
> index bf46a7dfbea2fc..73da9331803696 100644
> --- a/fs/f2fs/inline.c
> +++ b/fs/f2fs/inline.c
> @@ -64,7 +64,6 @@ bool f2fs_may_inline_dentry(struct inode *inode)
>  void f2fs_do_read_inline_data(struct page *page, struct page *ipage)
>  {
>  	struct inode *inode = page->mapping->host;
> -	void *src_addr, *dst_addr;
> 
>  	if (PageUptodate(page))
>  		return;
> @@ -74,11 +73,8 @@ void f2fs_do_read_inline_data(struct page *page, struct
> page *ipage) zero_user_segment(page, MAX_INLINE_DATA(inode), PAGE_SIZE);
> 
>  	/* Copy the whole inline data block */
> -	src_addr = inline_data_addr(inode, ipage);
> -	dst_addr = kmap_atomic(page);
> -	memcpy(dst_addr, src_addr, MAX_INLINE_DATA(inode));
> -	flush_dcache_page(page);
> -	kunmap_atomic(dst_addr);
> +	memcpy_to_page(page, 0, inline_data_addr(inode, ipage),
> +		       MAX_INLINE_DATA(inode));
>  	if (!PageUptodate(page))
>  		SetPageUptodate(page);
>  }
> @@ -246,7 +242,6 @@ int f2fs_convert_inline_inode(struct inode *inode)
> 
>  int f2fs_write_inline_data(struct inode *inode, struct page *page)
>  {
> -	void *src_addr, *dst_addr;
>  	struct dnode_of_data dn;
>  	int err;
> 
> @@ -263,10 +258,8 @@ int f2fs_write_inline_data(struct inode *inode, struct
> page *page) f2fs_bug_on(F2FS_I_SB(inode), page->index);
> 
>  	f2fs_wait_on_page_writeback(dn.inode_page, NODE, true, true);
> -	src_addr = kmap_atomic(page);
> -	dst_addr = inline_data_addr(inode, dn.inode_page);
> -	memcpy(dst_addr, src_addr, MAX_INLINE_DATA(inode));
> -	kunmap_atomic(src_addr);
> +	memcpy_from_page(inline_data_addr(inode, dn.inode_page),
> +			 page, 0, MAX_INLINE_DATA(inode));
>  	set_page_dirty(dn.inode_page);
> 
>  	f2fs_clear_page_cache_dirty_tag(page);
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 2451623c05a7a8..3e5743b2538240 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -2465,7 +2465,6 @@ static ssize_t f2fs_quota_read(struct super_block *sb,
> int type, char *data, size_t toread;
>  	loff_t i_size = i_size_read(inode);
>  	struct page *page;
> -	char *kaddr;
> 
>  	if (off > i_size)
>  		return 0;
> @@ -2498,9 +2497,7 @@ static ssize_t f2fs_quota_read(struct super_block *sb,
> int type, char *data, return -EIO;
>  		}
> 
> -		kaddr = kmap_atomic(page);
> -		memcpy(data, kaddr + offset, tocopy);
> -		kunmap_atomic(kaddr);
> +		memcpy_from_page(data, page, offset, tocopy);
>  		f2fs_put_page(page, 1);
> 
>  		offset = 0;
> @@ -2522,7 +2519,6 @@ static ssize_t f2fs_quota_write(struct super_block 
*sb,
> int type, size_t towrite = len;
>  	struct page *page;
>  	void *fsdata = NULL;
> -	char *kaddr;
>  	int err = 0;
>  	int tocopy;
> 
> @@ -2541,10 +2537,7 @@ static ssize_t f2fs_quota_write(struct super_block 
*sb,
> int type, break;
>  		}
> 
> -		kaddr = kmap_atomic(page);
> -		memcpy(kaddr + offset, data, tocopy);
> -		kunmap_atomic(kaddr);
> -		flush_dcache_page(page);
> +		memcpy_to_page(page, offset, data, tocopy);
> 
>  		a_ops->write_end(NULL, mapping, off, tocopy, tocopy,
>  						page, fsdata);
> diff --git a/fs/f2fs/verity.c b/fs/f2fs/verity.c
> index 7b8f2b41c29b12..97ec60f39d6960 100644
> --- a/fs/f2fs/verity.c
> +++ b/fs/f2fs/verity.c
> @@ -47,16 +47,13 @@ static int pagecache_read(struct inode *inode, void 
*buf,
> size_t count, size_t n = min_t(size_t, count,
>  				 PAGE_SIZE - offset_in_page(pos));
>  		struct page *page;
> -		void *addr;
> 
>  		page = read_mapping_page(inode->i_mapping, pos >> 
PAGE_SHIFT,
>  					 NULL);
>  		if (IS_ERR(page))
>  			return PTR_ERR(page);
> 
> -		addr = kmap_atomic(page);
> -		memcpy(buf, addr + offset_in_page(pos), n);
> -		kunmap_atomic(addr);
> +		memcpy_from_page(buf, page, offset_in_page(pos), n);
> 
>  		put_page(page);
> 
> @@ -85,16 +82,13 @@ static int pagecache_write(struct inode *inode, const 
void
> *buf, size_t count, PAGE_SIZE - offset_in_page(pos));
>  		struct page *page;
>  		void *fsdata;
> -		void *addr;
>  		int res;
> 
>  		res = aops->write_begin(NULL, mapping, pos, n, &page, 
&fsdata);
>  		if (res)
>  			return res;
> 
> -		addr = kmap_atomic(page);
> -		memcpy(addr + offset_in_page(pos), buf, n);
> -		kunmap_atomic(addr);
> +		memcpy_to_page(page, offset_in_page(pos), buf, n);
> 
>  		res = aops->write_end(NULL, mapping, pos, n, n, page, 
fsdata);
>  		if (res < 0)
> 
> base-commit: 568035b01cfb107af8d2e4bd2fb9aea22cf5b868
> --
> 2.37.1






_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
