Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B8F599A6F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 19 Aug 2022 13:12:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oOzuw-0001Bl-6j;
	Fri, 19 Aug 2022 11:11:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <fmdefrancesco@gmail.com>) id 1oOzuv-0001Bf-BA
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 Aug 2022 11:11:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cgcveKfalu9bGwjWhdphSsPeVH0HyR/9XPCDpoeXKuw=; b=F5zu17SYQmIkPhMcZHwBT7ueKP
 eHnhsmKfzwph3zdYYX6BD7bEUXfDOdnZi8fqDQTtzh/Ga7nesaLo+ZplPvAz5hLakXHyTV5yCOwRj
 Um7OQXDMaGpJnLll4Gj41etv/9aLzDfFUPss7n3CA08gZqmZppSwcwBA5/WNdzlLx+O8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cgcveKfalu9bGwjWhdphSsPeVH0HyR/9XPCDpoeXKuw=; b=leeRud/OqDsrVzVx710Pi1IWcn
 BNDlw/5bAusad2wmSr0vH4oHgwUQJt4uyky1ENgK3dwHKUUJSkXVUJDxpC4cVs8SENC8GdQIuYD46
 lnJ9vUEQN/H8PLRri14DFUkayB+WAg7bR37TdbAF0dRoysXXs4Urzkxg3HpuzBEX+s8g=;
Received: from mail-ed1-f54.google.com ([209.85.208.54])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oOzur-00969g-4J for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 Aug 2022 11:11:57 +0000
Received: by mail-ed1-f54.google.com with SMTP id q2so3121262edb.6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 19 Aug 2022 04:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=cgcveKfalu9bGwjWhdphSsPeVH0HyR/9XPCDpoeXKuw=;
 b=p6SchWPgQxCXLwQjgG57ICVW6yFu7NROZezkyPjTiirjSBTVDVoYBv+20hH+i2uF8L
 tFVkfOHHdO+Z9Vq2IeDZYPABFyvcaOVMaN3aRDXfhpqkLdR4ljyQkUlXKYQnFX/aWi0Q
 6s/uFmtViCK34glr7OStVo7q3mBZuRYSY0FGcOdLN5LkQoej2oBrK7mF7VXWYLOd42NY
 CanKFXuxo2g/+n7MMKStZ9VytQnbeuBBlo5HQ6aS8qeCnMYtUs6Roq81wyDkrWqN/uko
 dr5F/4kvk5ImzLAvmkVI3t70QOq+eqO29E6DyNga0s1cmVfzfRr8yiGJwdO347XV2Frh
 B7yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=cgcveKfalu9bGwjWhdphSsPeVH0HyR/9XPCDpoeXKuw=;
 b=t+dhqD5tglOIV22kgCcGR3uiKdV1a7FsDb5IQ9Gu+0gimM0scn+FT0rxoD+Jd9+JbY
 msr+ntxeciF1p+b1tLBq6sljBL3ndkQhq3dYjmDP7bE2HZUVE6wee0PTJle3Um+ai/x3
 RDL/oWuNv9GOi0WlmClJrJvSEdhsp2D6Sc4+d8/AJpzpk4oSfEhgWI6HrAT3dvj80FKW
 xbY2qELY2otaHlTsctYxlscFo6IoBbaVwwpbEdpAZsja676RkhbVa82P6GDC9OEKUXLk
 ocskfHU7OZe9thxRVjGv4CNU91BphOxFD9DKt2LaxZYKplQ+il6yFIbJnYDmyiXkqv4r
 AKbg==
X-Gm-Message-State: ACgBeo0Y1SdEGn7qShPnwInUtb1dJwjAfOMObTZCePsmBhI/q276Spmx
 ZZqmT0XKy2DOC6M4Tz/dFxsh8yi1/Lc=
X-Google-Smtp-Source: AA6agR6sqNw8K9BDAGKYodlVIVE4ZcURxhL1wDas7RWlI/VD+3/1wZh2ScK1Q0lFI4JUQqOdJThosA==
X-Received: by 2002:aa7:cc97:0:b0:445:afab:2634 with SMTP id
 p23-20020aa7cc97000000b00445afab2634mr5852947edt.54.1660907505893; 
 Fri, 19 Aug 2022 04:11:45 -0700 (PDT)
Received: from localhost.localdomain
 (host-87-17-106-94.retail.telecomitalia.it. [87.17.106.94])
 by smtp.gmail.com with ESMTPSA id
 r5-20020a056402018500b00445f8e0a86esm2869497edv.75.2022.08.19.04.11.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 04:11:43 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>
Date: Fri, 19 Aug 2022 13:11:41 +0200
Message-ID: <4743896.GXAFRqVoOG@localhost.localdomain>
In-Reply-To: <20220818225450.84090-1-ebiggers@kernel.org>
References: <20220818225450.84090-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Friday, August 19,
 2022 12:54:50 AM CEST Eric Biggers wrote:
 > From: Eric Biggers > > This is simpler, and as a side effect it replaces
 several uses of > kmap_atomic() with its recommended replac [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [fmdefrancesco[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.54 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.208.54 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1oOzur-00969g-4J
Subject: Re: [f2fs-dev] [PATCH] f2fs: use memcpy_{to,
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

On Friday, August 19, 2022 12:54:50 AM CEST Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> This is simpler, and as a side effect it replaces several uses of
> kmap_atomic() with its recommended replacement kmap_local_page().
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  fs/f2fs/inline.c |  7 ++-----
>  fs/f2fs/super.c  | 10 ++--------
>  fs/f2fs/verity.c | 10 ++--------
>  3 files changed, 6 insertions(+), 21 deletions(-)
> 
> diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
> index bf46a7dfbea2fc..69bfd3b08645af 100644
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
> @@ -74,11 +73,9 @@ void f2fs_do_read_inline_data(struct page *page, struct 
page *ipage)
>  	zero_user_segment(page, MAX_INLINE_DATA(inode), PAGE_SIZE);
>  
>  	/* Copy the whole inline data block */
> -	src_addr = inline_data_addr(inode, ipage);
> -	dst_addr = kmap_atomic(page);
> -	memcpy(dst_addr, src_addr, MAX_INLINE_DATA(inode));
> +	memcpy_to_page(page, 0, inline_data_addr(inode, ipage),
> +		       MAX_INLINE_DATA(inode));
>  	flush_dcache_page(page);

flush_dcache_page() is redundant here. memcpy_to_page() takes care to call it.

> -	kunmap_atomic(dst_addr);
>  	if (!PageUptodate(page))
>  		SetPageUptodate(page);
>  }
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 2451623c05a7a8..c9f9269a4e88f3 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -2465,7 +2465,6 @@ static ssize_t f2fs_quota_read(struct super_block *sb, 
int type, char *data,
>  	size_t toread;
>  	loff_t i_size = i_size_read(inode);
>  	struct page *page;
> -	char *kaddr;
>  
>  	if (off > i_size)
>  		return 0;
> @@ -2498,9 +2497,7 @@ static ssize_t f2fs_quota_read(struct super_block *sb, 
int type, char *data,
>  			return -EIO;
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
*sb, int type,
>  	size_t towrite = len;
>  	struct page *page;
>  	void *fsdata = NULL;
> -	char *kaddr;
>  	int err = 0;
>  	int tocopy;
>  
> @@ -2541,9 +2537,7 @@ static ssize_t f2fs_quota_write(struct super_block 
*sb, int type,
>  			break;
>  		}
>  
> -		kaddr = kmap_atomic(page);
> -		memcpy(kaddr + offset, data, tocopy);
> -		kunmap_atomic(kaddr);
> +		memcpy_to_page(page, offset, data, tocopy);
>  		flush_dcache_page(page);

Same here.

>  
>  		a_ops->write_end(NULL, mapping, off, tocopy, tocopy,
> diff --git a/fs/f2fs/verity.c b/fs/f2fs/verity.c
> index 7b8f2b41c29b12..97ec60f39d6960 100644
> --- a/fs/f2fs/verity.c
> +++ b/fs/f2fs/verity.c
> @@ -47,16 +47,13 @@ static int pagecache_read(struct inode *inode, void 
*buf, size_t count,
>  		size_t n = min_t(size_t, count,
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
void *buf, size_t count,
>  				 PAGE_SIZE - offset_in_page(pos));
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
> 
> 

It looks like you forgot a conversion from kmap_atomic() in fs/f2fs/inline.c 
at line 266.

The rest looks good to me.

Thanks,

Fabio




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
