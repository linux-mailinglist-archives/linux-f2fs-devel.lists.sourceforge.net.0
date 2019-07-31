Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8817CB20
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 31 Jul 2019 19:58:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hssrV-0006hk-Gf; Wed, 31 Jul 2019 17:58:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <natechancellor@gmail.com>) id 1hssrS-0006hI-QN
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 31 Jul 2019 17:58:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T31WwXYsxgU8fO97C5XG4W+sh6cfy84Mun+fk+tA2/o=; b=a1Fz4nBl7wCmd88nfcdtgeqwMi
 seOa+vnh9Ou598ZRP5vCfp0bXJbL9wWLgMzRV5O9Bq+O41XU1TWYbZWYGud4TTVZ37eAJsBRAu34y
 CW0TV1B2aIryysOEvp8NDSg48kMz3ixzmAw/DB5gwd1PkZ/sdT15nKY3BPS3hnD29ybc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=T31WwXYsxgU8fO97C5XG4W+sh6cfy84Mun+fk+tA2/o=; b=QgisN++5WwSMFpXH4cxz6y4HIa
 XrA1ISAHWNhtajABAhTkjdn/Ep7oR5gI78gYs4XtKqXYb4GgZMUTWYlfX0dks+wyctBome1h0p8zy
 qiZrELJ1aVeCREqVa8JiAZNMdSlDWPyXItXUGaoDBqkwRkzDZV1kYUL8djGyFdi7541Y=;
Received: from mail-wm1-f65.google.com ([209.85.128.65])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hssrN-005VY6-Vd
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 31 Jul 2019 17:58:01 +0000
Received: by mail-wm1-f65.google.com with SMTP id a15so61761682wmj.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 31 Jul 2019 10:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=T31WwXYsxgU8fO97C5XG4W+sh6cfy84Mun+fk+tA2/o=;
 b=sX/iidQk0dUvgAG6y3YxYqtNQUGhiSU4kesR+IvEkmGd43zb5yH6iziI4AciHJLuB8
 jq27iR560vhwkgZCmbqw2Je1yW+Glpfp0dKwf5KLywXz2ZSn8Li2tBGqOqePW+xGWTT9
 9zRVLdAq1jm2GwIvZDS6GGhcZ4E66o84q9qvMCvAkS7epxWPvj9ObnL1irGDJ5nSAuSD
 b/ugzxNL8zkMW5ROxvQLKq3Ijn6bhJJUPFv/M3qXMItq8ZqEPNdPSP05qYSRkm46NAXH
 ZbgOwyH25TbHMsHaiGcmUGz54DBcaBKXGptYzB76c6vs524bh+5aO3gkpwluOh9QpN6/
 b7qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=T31WwXYsxgU8fO97C5XG4W+sh6cfy84Mun+fk+tA2/o=;
 b=Xno8PdMsp7WbpE4t7qHeLCHZlOEouRstv1Ak2S94lUUZ7aOjPFckak56QowQlhNr27
 w86ppdpgQOVCE2EF18CU66WLVJFVS1PdO/YWQ1i93lxVZNZG/Avh63B4UeY7R6+guDwz
 8de4K5EVJxzYPX7SbF2FUGOXmuutBqqWVbVIZ2iJsbjGp1OGOlm5Wda+epdS55JHpflA
 P3ml2KbVu/RIwMd2ozgq7ddyznJt9gyuffJCV5hzOnnezuwahwoV0+oaYiyl1Ah2xfXs
 w/grpKKPsOgrFSW3f92uu3N2b+wDpgNpKKgHtBZ9fDmE+tTkf3YWuVOnzusNrF2P0IYg
 kyTw==
X-Gm-Message-State: APjAAAWMSMgtMKRtyA6lhcFmwhueao+eEyQ3lu4r+hPJwcjgOGi087Os
 XUyPFLdR7mu4xQHSyCflWW2rQSYjgF692w==
X-Google-Smtp-Source: APXvYqws+uruLILu52nsmChy6L/7Y5vDVpAORnwVLHjBO84u5ZfNuvY1CLOr83vx9GkjBUtLI/QOlw==
X-Received: by 2002:a7b:c081:: with SMTP id r1mr62622176wmh.76.1564595871090; 
 Wed, 31 Jul 2019 10:57:51 -0700 (PDT)
Received: from archlinux-threadripper ([2a01:4f8:222:2f1b::2])
 by smtp.gmail.com with ESMTPSA id c6sm70486993wma.25.2019.07.31.10.57.50
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 10:57:50 -0700 (PDT)
Date: Wed, 31 Jul 2019 10:57:48 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Daniel Rosenberg <drosen@google.com>
Message-ID: <20190731175748.GA48637@archlinux-threadripper>
References: <20190723230529.251659-1-drosen@google.com>
 <20190723230529.251659-4-drosen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190723230529.251659-4-drosen@google.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (natechancellor[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.65 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1hssrN-005VY6-Vd
Subject: Re: [f2fs-dev] [PATCH v4 3/3] f2fs: Support case-insensitive file
 name lookups
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
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi all,

<snip>

> diff --git a/fs/f2fs/hash.c b/fs/f2fs/hash.c
> index cc82f142f811f..99e79934f5088 100644
> --- a/fs/f2fs/hash.c
> +++ b/fs/f2fs/hash.c
> @@ -14,6 +14,7 @@
>  #include <linux/f2fs_fs.h>
>  #include <linux/cryptohash.h>
>  #include <linux/pagemap.h>
> +#include <linux/unicode.h>
>  
>  #include "f2fs.h"
>  
> @@ -67,7 +68,7 @@ static void str2hashbuf(const unsigned char *msg, size_t len,
>  		*buf++ = pad;
>  }
>  
> -f2fs_hash_t f2fs_dentry_hash(const struct qstr *name_info,
> +static f2fs_hash_t __f2fs_dentry_hash(const struct qstr *name_info,
>  				struct fscrypt_name *fname)
>  {
>  	__u32 hash;
> @@ -103,3 +104,35 @@ f2fs_hash_t f2fs_dentry_hash(const struct qstr *name_info,
>  	f2fs_hash = cpu_to_le32(hash & ~F2FS_HASH_COL_BIT);
>  	return f2fs_hash;
>  }
> +
> +f2fs_hash_t f2fs_dentry_hash(const struct inode *dir,
> +		const struct qstr *name_info, struct fscrypt_name *fname)
> +{
> +#ifdef CONFIG_UNICODE
> +	struct f2fs_sb_info *sbi = F2FS_SB(dir->i_sb);
> +	const struct unicode_map *um = sbi->s_encoding;
> +	int r, dlen;
> +	unsigned char *buff;
> +	struct qstr *folded;
> +
> +	if (name_info->len && IS_CASEFOLDED(dir)) {
> +		buff = f2fs_kzalloc(sbi, sizeof(char) * PATH_MAX, GFP_KERNEL);
> +		if (!buff)
> +			return -ENOMEM;
> +
> +		dlen = utf8_casefold(um, name_info, buff, PATH_MAX);
> +		if (dlen < 0) {
> +			kvfree(buff);
> +			goto opaque_seq;
> +		}
> +		folded->name = buff;
> +		folded->len = dlen;
> +		r = __f2fs_dentry_hash(folded, fname);
> +
> +		kvfree(buff);
> +		return r;
> +	}
> +opaque_seq:
> +#endif
> +	return __f2fs_dentry_hash(name_info, fname);
> +}

Clang now warns:

fs/f2fs/hash.c:128:3: warning: variable 'folded' is uninitialized when used here [-Wuninitialized]
                folded->name = buff;
                ^~~~~~
fs/f2fs/hash.c:116:21: note: initialize the variable 'folded' to silence this warning
        struct qstr *folded;
                           ^
                            = NULL
1 warning generated.

I assume that it wants to be initialized with f2fs_kzalloc as well but
I am not familiar with this code and what it expects to do.

Please look into this when you get a chance!
Nathan


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
