Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A5A65A2E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 11 Jul 2019 17:13:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hlalK-0000D6-31; Thu, 11 Jul 2019 15:13:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <qkrwngud825@gmail.com>) id 1hlalI-0000Cr-MW
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 11 Jul 2019 15:13:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Cc:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=F7aRF7kg7tOr6UXTraKlqiPr6kbmE6Nn5QKJESTb/JE=; b=ipV/GORTzdYwNjmMZdwPuVrCX
 Wsh3aGXVpHPiJomEEuTSVY9Hi6enynu056uJ9bIigkVDMz+iWEH8VRXatTjA9KND+qUeIWW4KAioT
 lEm3BXoLiTL0luO2Q/AU8UNkhSoLRhVEENzq7ezP2s/rc8w36k8UYIaxpf/AUPzbTTafI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=F7aRF7kg7tOr6UXTraKlqiPr6kbmE6Nn5QKJESTb/JE=; b=PPsobcD5ZveltXA+6qzFIbEMDx
 gZZflf+UQH+n5SpHA2QQ9KvLFemMHWYFq2XNQvcVjW4nldZ+dorjjwY8WnFyNVjHb9t/xy92V5COC
 VmShKAGGSklDkWUrYuOzgth1WOyxK6ZeNPxKPwKem9z734SNBBIU0advtby0zcW5nnzw=;
Received: from mail-vs1-f65.google.com ([209.85.217.65])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hlalH-00G8UZ-8e
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 11 Jul 2019 15:13:32 +0000
Received: by mail-vs1-f65.google.com with SMTP id a186so2809048vsd.7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 11 Jul 2019 08:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=F7aRF7kg7tOr6UXTraKlqiPr6kbmE6Nn5QKJESTb/JE=;
 b=OcNbvk+yd8iuBnYsNHNTPWe/3bG0FLsLI064h+KtkTisHOTFOidsBrGTQj50zA3NWy
 X1XYVVlX+lykCgDW/BD3fiKZY8pmmjyqe+FYg5atxWpl03mHzHfPM+QN02Qgw/PTMA7b
 EmJVeBMbU/bKhzJyJG0JETstufJq/vHrQWFPmGHJkj18deHsDOTLrYNghEjssiyrF85U
 bqL50t04Xe3/UGwrhvUu7xgwuxursT43uWc3vWm/stci3M40WA3x5+T/z4mjAmNgKLAb
 dnZtdBs13do3/oe16nE5+xU08poLjcYi/uvslTZb+RdH6jUKg9NKLc6+VzptSqDYDyMW
 876w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=F7aRF7kg7tOr6UXTraKlqiPr6kbmE6Nn5QKJESTb/JE=;
 b=P0QMPVyrkNI13+UX7Yfn0FwKQXE00Q4L+PGWhxOEyewOT8RLzB8z0RT6qgqY0qDdOA
 Wi7lD+2yi7lncQKdR2rYklfhjDZ+41MCFJCvUIawT++COB20lLh7s/MnHDmLZejCeOD1
 2NnUCts2k6Gk0tKKAaOjG1IfIYOXBGHVKHgFhuS7/maujCykzlwzRl43aY9wZ7fxNjUG
 f1K99WZ/hZ7j3taoYZlvCmnRJHaCK4CXvdR4fa7P7i5aCkBt2ZYqwEngS5uRE3dR258P
 HlKvKaHiT35jTLckOATRHC9K6YxLX7xkg4AShEeaeM72RmaLPAkmVz3AG8qn5yiA1x1j
 CkzQ==
X-Gm-Message-State: APjAAAXVl20kBAodKsIICYC5qCxPI4V6XuPs2VfMekeUgCa/omGEyk24
 8ByzY9lnP4Iva92kkM2ZgQ7/sjQnlftw1xCHJGnKFiukMgg=
X-Google-Smtp-Source: APXvYqwLZkqTA5D3iYrVNNtvoHmTHy3/I7bCvetYPmYvbB3oWzBsdI5W1uic6P1rwpRcZ7saxm6PmZZGr5nyI7JMRlc=
X-Received: by 2002:a67:79d4:: with SMTP id u203mr4929991vsc.85.1562858004890; 
 Thu, 11 Jul 2019 08:13:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190711150617.124660-1-qkrwngud825@gmail.com>
In-Reply-To: <20190711150617.124660-1-qkrwngud825@gmail.com>
From: Ju Hyung Park <qkrwngud825@gmail.com>
Date: Fri, 12 Jul 2019 00:13:13 +0900
Message-ID: <CAD14+f3pxEqC-Kqt0-9+Xb_+Jwr_=NjQmsVoLXz9YTAZJo12zg@mail.gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: 3.1 (+++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.217.65 listed in list.dnswl.org]
 1.0 HK_RANDOM_FROM         From username looks random
 0.6 HK_RANDOM_ENVFROM      Envelope sender username looks random
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (qkrwngud825[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.217.65 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (qkrwngud825[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 1.3 PDS_NO_HELO_DNS        High profile HELO but no A record
X-Headers-End: 1hlalH-00G8UZ-8e
Subject: Re: [f2fs-dev] [PATCH] f2fs: use kmem_cache pool during xattr
 lookups
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi everyone.

This is a RFC patch.

This patch introduces an even bigger problem, which is forcing all
xattr lookup memory allocations to be made in 4076B, when in reality,
4076B allocations are only made during initial mounts and the rests
are made in 204B, unnecessarily wasting memory.

In my testing, 4076B allocations are only done 4 times during mount
and the rests(millions) are in 204B.

I'd like to ask the maintainers to suggest some bright ideas on how to
tackle this correctly.
(e.g. Use kmem pool only for 204B allocations and fallback to regular
kzalloc() if (*base_size != 204)?)

Thanks.

On Fri, Jul 12, 2019 at 12:06 AM Park Ju Hyung <qkrwngud825@gmail.com> wrote:
>
> It's been observed that kzalloc() on lookup_all_xattrs() are called millions
> of times on Android, quickly becoming the top abuser of slub memory allocator.
>
> Use a dedicated kmem cache pool for xattr lookups to mitigate this.
>
> Signed-off-by: Park Ju Hyung <qkrwngud825@gmail.com>
> ---
>  fs/f2fs/f2fs.h  |  6 ++++++
>  fs/f2fs/super.c |  8 +++++++-
>  fs/f2fs/xattr.c | 33 ++++++++++++++++++++++++---------
>  3 files changed, 37 insertions(+), 10 deletions(-)
>
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 9c6388253c9d2..3046ca2ebd121 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -3510,6 +3510,12 @@ void f2fs_exit_sysfs(void);
>  int f2fs_register_sysfs(struct f2fs_sb_info *sbi);
>  void f2fs_unregister_sysfs(struct f2fs_sb_info *sbi);
>
> +/*
> + * xattr.c
> + */
> +int __init f2fs_init_xattr_caches(void);
> +void f2fs_destroy_xattr_caches(void);
> +
>  /*
>   * crypto support
>   */
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 6d262d13251cf..abb59d9e25848 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -3614,9 +3614,12 @@ static int __init init_f2fs_fs(void)
>         err = init_inodecache();
>         if (err)
>                 goto fail;
> -       err = f2fs_create_node_manager_caches();
> +       err = f2fs_init_xattr_caches();
>         if (err)
>                 goto free_inodecache;
> +       err = f2fs_create_node_manager_caches();
> +       if (err)
> +               goto fail_xattr_caches;
>         err = f2fs_create_segment_manager_caches();
>         if (err)
>                 goto free_node_manager_caches;
> @@ -3656,6 +3659,8 @@ static int __init init_f2fs_fs(void)
>         f2fs_destroy_segment_manager_caches();
>  free_node_manager_caches:
>         f2fs_destroy_node_manager_caches();
> +fail_xattr_caches:
> +       f2fs_destroy_xattr_caches();
>  free_inodecache:
>         destroy_inodecache();
>  fail:
> @@ -3673,6 +3678,7 @@ static void __exit exit_f2fs_fs(void)
>         f2fs_destroy_checkpoint_caches();
>         f2fs_destroy_segment_manager_caches();
>         f2fs_destroy_node_manager_caches();
> +       f2fs_destroy_xattr_caches();
>         destroy_inodecache();
>         f2fs_destroy_trace_ios();
>  }
> diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
> index e791741d193b8..635b50ea3e5e8 100644
> --- a/fs/f2fs/xattr.c
> +++ b/fs/f2fs/xattr.c
> @@ -22,6 +22,23 @@
>  #include "f2fs.h"
>  #include "xattr.h"
>
> +static struct kmem_cache *f2fs_xattr_cachep;
> +
> +int __init f2fs_init_xattr_caches(void)
> +{
> +       f2fs_xattr_cachep = f2fs_kmem_cache_create("xattr_entry",
> +                       VALID_XATTR_BLOCK_SIZE + XATTR_PADDING_SIZE);
> +       if (!f2fs_xattr_cachep)
> +               return -ENOMEM;
> +
> +       return 0;
> +}
> +
> +void f2fs_destroy_xattr_caches(void)
> +{
> +       kmem_cache_destroy(f2fs_xattr_cachep);
> +}
> +
>  static int f2fs_xattr_generic_get(const struct xattr_handler *handler,
>                 struct dentry *unused, struct inode *inode,
>                 const char *name, void *buffer, size_t size)
> @@ -312,7 +329,7 @@ static int lookup_all_xattrs(struct inode *inode, struct page *ipage,
>                 return -ENODATA;
>
>         *base_size = XATTR_SIZE(xnid, inode) + XATTR_PADDING_SIZE;
> -       txattr_addr = f2fs_kzalloc(F2FS_I_SB(inode), *base_size, GFP_NOFS);
> +       txattr_addr = kmem_cache_zalloc(f2fs_xattr_cachep, GFP_NOFS);
>         if (!txattr_addr)
>                 return -ENOMEM;
>
> @@ -358,7 +375,7 @@ static int lookup_all_xattrs(struct inode *inode, struct page *ipage,
>         *base_addr = txattr_addr;
>         return 0;
>  out:
> -       kvfree(txattr_addr);
> +       kmem_cache_free(f2fs_xattr_cachep, txattr_addr);
>         return err;
>  }
>
> @@ -367,13 +384,11 @@ static int read_all_xattrs(struct inode *inode, struct page *ipage,
>  {
>         struct f2fs_xattr_header *header;
>         nid_t xnid = F2FS_I(inode)->i_xattr_nid;
> -       unsigned int size = VALID_XATTR_BLOCK_SIZE;
>         unsigned int inline_size = inline_xattr_size(inode);
>         void *txattr_addr;
>         int err;
>
> -       txattr_addr = f2fs_kzalloc(F2FS_I_SB(inode),
> -                       inline_size + size + XATTR_PADDING_SIZE, GFP_NOFS);
> +       txattr_addr = kmem_cache_zalloc(f2fs_xattr_cachep, GFP_NOFS);
>         if (!txattr_addr)
>                 return -ENOMEM;
>
> @@ -401,7 +416,7 @@ static int read_all_xattrs(struct inode *inode, struct page *ipage,
>         *base_addr = txattr_addr;
>         return 0;
>  fail:
> -       kvfree(txattr_addr);
> +       kmem_cache_free(f2fs_xattr_cachep, txattr_addr);
>         return err;
>  }
>
> @@ -528,7 +543,7 @@ int f2fs_getxattr(struct inode *inode, int index, const char *name,
>         }
>         error = size;
>  out:
> -       kvfree(base_addr);
> +       kmem_cache_free(f2fs_xattr_cachep, base_addr);
>         return error;
>  }
>
> @@ -574,7 +589,7 @@ ssize_t f2fs_listxattr(struct dentry *dentry, char *buffer, size_t buffer_size)
>         }
>         error = buffer_size - rest;
>  cleanup:
> -       kvfree(base_addr);
> +       kmem_cache_free(f2fs_xattr_cachep, base_addr);
>         return error;
>  }
>
> @@ -712,7 +727,7 @@ static int __f2fs_setxattr(struct inode *inode, int index,
>         if (!error && S_ISDIR(inode->i_mode))
>                 set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_CP);
>  exit:
> -       kvfree(base_addr);
> +       kmem_cache_free(f2fs_xattr_cachep, base_addr);
>         return error;
>  }
>
> --
> 2.21.0
>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
