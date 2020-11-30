Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D58452C834F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 30 Nov 2020 12:35:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kjhT6-0004tj-S0; Mon, 30 Nov 2020 11:35:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <qkrwngud825@gmail.com>) id 1kjhT5-0004tX-MS
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 30 Nov 2020 11:35:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=q1H7z927yZ23J5c3xO26CE+FIkFj8bWHfjWGxec7I3k=; b=S/zdn87YN7NOIuQ3rR0y+uRU+Q
 FH+EpX68mjMLCUupluamxHuHtDInFk7viTAZqbXQxppIq4C+x8JJh9DaBppjYuLu/YXs+yE+gIqZn
 ArIaE3ZIrTeg9drtdCzzM1q5vhj+O9ps+Ar9jAxHVVv/NPn1+aY5luujXF2bymZfrGlo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=q1H7z927yZ23J5c3xO26CE+FIkFj8bWHfjWGxec7I3k=; b=a3ans+iIoBfUhDzro5N0oWQ6ck
 xAcEsYf4NLAukwC7hJyT5shbto7YLoj5Yz5BcmZNJ9yNK5Y7X4Hoo394UDzVforQEpyUp/qJg14P9
 +yox6dEjhn1GpxymHvY3MtDZa3bV3BUEeGROh+rmFm83FhRtZG+s6mKpt2/IwtaP47+M=;
Received: from mail-vs1-f68.google.com ([209.85.217.68])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kjhSx-006Xaw-Ae
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 30 Nov 2020 11:35:43 +0000
Received: by mail-vs1-f68.google.com with SMTP id w71so5025539vsw.9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 30 Nov 2020 03:35:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q1H7z927yZ23J5c3xO26CE+FIkFj8bWHfjWGxec7I3k=;
 b=FIXlkfrEiT5lJN9EPYs1mWKLYK17srN9XISmzJRcN20L6Dt8bvDbUs97z19G0sGHSO
 Q0eMej4BXXasTfymmOU2J5kTC80ba2GH3vLh1wVHxF9/w2feubM2gXQQ69x+VXYZBQqp
 Y4Ix29htPMNvYLRF4dg9m3ivQ5z0U8VCNfrc043fFb+WEk4tVvcpu7Kk1/3/lvOpc1Ls
 GPabQTJB6OOU/n3RgdWccyX0Oy4T4Gji0JEHRp8/mnjEA8lUVm0bQMT+76VqBGMy+TIq
 //phny+/xhhR9N/1wFJsNx63rs/1DFPIF5frwqv5qj7SdXsuMnAt/gYIW7jMS1B5Npj2
 98sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q1H7z927yZ23J5c3xO26CE+FIkFj8bWHfjWGxec7I3k=;
 b=X5YvqBpGGoSTjpgaYo9H87JSuKm9nvXuIMLeg83TRCw4J5ZX3Wiut4PyFq9AinPbw+
 06uEnTs298F/SDpdoMgfQXc2y0lpZSLH7MgzWB8uJjqdqvns19iRtEYYxt1Qv/iEoqTJ
 AEo2t5tP7hFRbOBYfCqkOzDRhTmmZbyq+YsVaYNkAXd7+DyhEJF+TihncyKiItsMIyiQ
 rw2HrmyNAZhRkyi1VW5ciqe45qw7AdynnxmhmyHp0hrPAue2SPA3B9V8/3vA2U/VKG+9
 QOnXpI3uuFOJejARCLwKQw6zllOpnLGJDHbRnSFK9FBVq+PPtI7GFKfOiX6c3vUpujM6
 lwpg==
X-Gm-Message-State: AOAM530JIyH2XrE5x9jlmHVyec288fRJITBssGtcZcvk3PNHG9/NbFRt
 iIa5e44DpK4SqknefkInwsu5s3zIvNTQo5A/wmY=
X-Google-Smtp-Source: ABdhPJyYllERaQ8TlHY4GRf8jGonZfi87otBvSEiVo++vERPvi9h3GnXQ1KS6G/5qgld57yrz7MwtNodYFICMP0YQyA=
X-Received: by 2002:a67:2484:: with SMTP id k126mr14513444vsk.13.1606736129453; 
 Mon, 30 Nov 2020 03:35:29 -0800 (PST)
MIME-Version: 1.0
References: <20201130112648.95504-1-yuchao0@huawei.com>
In-Reply-To: <20201130112648.95504-1-yuchao0@huawei.com>
From: Ju Hyung Park <qkrwngud825@gmail.com>
Date: Mon, 30 Nov 2020 20:35:18 +0900
Message-ID: <CAD14+f0b5ZqK8EPP+rgMf-NmJXCcOYnqX71QMjViOkF0Q2xsaQ@mail.gmail.com>
To: Chao Yu <yuchao0@huawei.com>
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 HK_RANDOM_FROM         From username looks random
 0.6 HK_RANDOM_ENVFROM      Envelope sender username looks random
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (qkrwngud825[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.217.68 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.217.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (qkrwngud825[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kjhSx-006Xaw-Ae
Subject: Re: [f2fs-dev] [PATCH] f2fs: compress: support lz4hc compression
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, open list <linux-kernel@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Chao.

On Mon, Nov 30, 2020 at 8:28 PM Chao Yu <yuchao0@huawei.com> wrote:
>
> Add a new mount option "compress_lz4hc_clevel=%u" to enable lz4hc compress
> algorithm and specify the compress level of lz4hc.

Wouldn't it be better to introduce a generic mount option like
"compress_level=%u" to allow other algorithms to use it as well?

Or retire compress_algorithm altogether and follow btrfs format, which
I quite like:
compress=lzo:1, compress=zstd:4, etc.

Just my two cents.

>
> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> ---
>  Documentation/filesystems/f2fs.rst |  2 ++
>  fs/f2fs/compress.c                 | 22 +++++++++++++++++-----
>  fs/f2fs/f2fs.h                     |  8 ++++++++
>  fs/f2fs/inode.c                    |  4 ++++
>  fs/f2fs/super.c                    | 15 +++++++++++++++
>  5 files changed, 46 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
> index 8830a11a11be..cda30ea124ee 100644
> --- a/Documentation/filesystems/f2fs.rst
> +++ b/Documentation/filesystems/f2fs.rst
> @@ -264,6 +264,8 @@ compress_chksum              Support verifying chksum of raw data in compressed cluster.
>  compress_cache          Support to use address space of inner inode to cache
>                          compressed block, in order to improve cache hit ratio of
>                          random read.
> +compress_lz4hc_clevel   Support to enable LZ4 high compression algorithm, compress
> +                        level range is [3, 16].
>  inlinecrypt             When possible, encrypt/decrypt the contents of encrypted
>                          files using the blk-crypto framework rather than
>                          filesystem-layer encryption. This allows the use of
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index 2ec34168adbb..233be7f71e48 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -253,17 +253,24 @@ static const struct f2fs_compress_ops f2fs_lzo_ops = {
>  #ifdef CONFIG_F2FS_FS_LZ4
>  static int lz4_init_compress_ctx(struct compress_ctx *cc)
>  {
> -       cc->private = f2fs_kvmalloc(F2FS_I_SB(cc->inode),
> -                               LZ4_MEM_COMPRESS, GFP_NOFS);
> +       unsigned int size;
> +
> +       size = F2FS_I(cc->inode)->i_lz4hc_clevel ?
> +                       LZ4HC_MEM_COMPRESS : LZ4_MEM_COMPRESS;
> +
> +       cc->private = f2fs_kvmalloc(F2FS_I_SB(cc->inode), size, GFP_NOFS);
>         if (!cc->private)
>                 return -ENOMEM;
>
>         /*
>          * we do not change cc->clen to LZ4_compressBound(inputsize) to
>          * adapt worst compress case, because lz4 compressor can handle
> -        * output budget properly.
> +        * output budget properly; for lz4hc case, keep it as it is.
>          */
> -       cc->clen = cc->rlen - PAGE_SIZE - COMPRESS_HEADER_SIZE;
> +       if (F2FS_I(cc->inode)->i_lz4hc_clevel)
> +               cc->clen = LZ4_compressBound(cc->rlen);
> +       else
> +               cc->clen = cc->rlen - PAGE_SIZE - COMPRESS_HEADER_SIZE;
>         return 0;
>  }
>
> @@ -275,9 +282,14 @@ static void lz4_destroy_compress_ctx(struct compress_ctx *cc)
>
>  static int lz4_compress_pages(struct compress_ctx *cc)
>  {
> +       unsigned char clevel = F2FS_I(cc->inode)->i_lz4hc_clevel;
>         int len;
>
> -       len = LZ4_compress_default(cc->rbuf, cc->cbuf->cdata, cc->rlen,
> +       if (clevel)
> +               len = LZ4_compress_HC(cc->rbuf, cc->cbuf->cdata, cc->rlen,
> +                                               cc->clen, clevel, cc->private);
> +       else
> +               len = LZ4_compress_default(cc->rbuf, cc->cbuf->cdata, cc->rlen,
>                                                 cc->clen, cc->private);
>         if (!len)
>                 return -EAGAIN;
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index d32065417616..d3d5583ea9e5 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -149,6 +149,7 @@ struct f2fs_mount_info {
>         /* For compression */
>         unsigned char compress_algorithm;       /* algorithm type */
>         unsigned char compress_log_size;        /* cluster log size */
> +       unsigned char lz4hc_clevel;             /* lz4hc compress level */
>         bool compress_chksum;                   /* compressed data chksum */
>         unsigned char compress_ext_cnt;         /* extension count */
>         unsigned char extensions[COMPRESS_EXT_NUM][F2FS_EXTENSION_LEN]; /* extensions */
> @@ -736,6 +737,10 @@ struct f2fs_inode_info {
>         unsigned char i_log_cluster_size;       /* log of cluster size */
>         unsigned short i_compress_flag;         /* compress flag */
>         unsigned int i_cluster_size;            /* cluster size */
> +       unsigned char i_lz4hc_clevel;           /*
> +                                                * lz4hc compress level,
> +                                                * range: 3-16, disable: 0
> +                                                */
>  };
>
>  static inline void get_extent_info(struct extent_info *ext,
> @@ -3932,6 +3937,9 @@ static inline void set_compress_context(struct inode *inode)
>                                 1 << COMPRESS_CHKSUM : 0;
>         F2FS_I(inode)->i_cluster_size =
>                         1 << F2FS_I(inode)->i_log_cluster_size;
> +       if (F2FS_I(inode)->i_compress_algorithm == COMPRESS_LZ4 &&
> +                       F2FS_OPTION(sbi).lz4hc_clevel)
> +               F2FS_I(inode)->i_lz4hc_clevel = F2FS_OPTION(sbi).lz4hc_clevel;
>         F2FS_I(inode)->i_flags |= F2FS_COMPR_FL;
>         set_inode_flag(inode, FI_COMPRESSED_FILE);
>         stat_inc_compr_inode(inode);
> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> index 39fad324ca52..98be4d87e067 100644
> --- a/fs/f2fs/inode.c
> +++ b/fs/f2fs/inode.c
> @@ -461,6 +461,10 @@ static int do_read_inode(struct inode *inode)
>                         fi->i_compress_algorithm = ri->i_compress_algorithm;
>                         fi->i_log_cluster_size = ri->i_log_cluster_size;
>                         fi->i_compress_flag = le16_to_cpu(ri->i_compress_flag);
> +                       if (fi->i_compress_algorithm == COMPRESS_LZ4 &&
> +                                       F2FS_OPTION(sbi).lz4hc_clevel)
> +                               fi->i_lz4hc_clevel =
> +                                       F2FS_OPTION(sbi).lz4hc_clevel;
>                         fi->i_cluster_size = 1 << fi->i_log_cluster_size;
>                         set_inode_flag(inode, FI_COMPRESSED_FILE);
>                 }
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index b0c6ef2df7b8..2cd7fcc400b8 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -25,6 +25,7 @@
>  #include <linux/quota.h>
>  #include <linux/unicode.h>
>  #include <linux/part_stat.h>
> +#include <linux/lz4.h>
>
>  #include "f2fs.h"
>  #include "node.h"
> @@ -148,6 +149,7 @@ enum {
>         Opt_compress_extension,
>         Opt_compress_chksum,
>         Opt_compress_cache,
> +       Opt_compress_lz4hc_clevel,
>         Opt_atgc,
>         Opt_err,
>  };
> @@ -218,6 +220,7 @@ static match_table_t f2fs_tokens = {
>         {Opt_compress_extension, "compress_extension=%s"},
>         {Opt_compress_chksum, "compress_chksum"},
>         {Opt_compress_cache, "compress_cache"},
> +       {Opt_compress_lz4hc_clevel, "compress_lz4hc_clevel=%u"},
>         {Opt_atgc, "atgc"},
>         {Opt_err, NULL},
>  };
> @@ -944,12 +947,20 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
>                 case Opt_compress_cache:
>                         set_opt(sbi, COMPRESS_CACHE);
>                         break;
> +               case Opt_compress_lz4hc_clevel:
> +                       if (args->from && match_int(args, &arg))
> +                               return -EINVAL;
> +                       if (arg < LZ4HC_MIN_CLEVEL || arg > LZ4HC_MAX_CLEVEL)
> +                               return -EINVAL;
> +                       F2FS_OPTION(sbi).lz4hc_clevel = arg;
> +                       break;
>  #else
>                 case Opt_compress_algorithm:
>                 case Opt_compress_log_size:
>                 case Opt_compress_extension:
>                 case Opt_compress_chksum:
>                 case Opt_compress_cache:
> +               case Opt_compress_lz4hc_clevel:
>                         f2fs_info(sbi, "compression options not supported");
>                         break;
>  #endif
> @@ -1543,6 +1554,10 @@ static inline void f2fs_show_compress_options(struct seq_file *seq,
>
>         if (test_opt(sbi, COMPRESS_CACHE))
>                 seq_puts(seq, ",compress_cache");
> +
> +       if (F2FS_OPTION(sbi).lz4hc_clevel)
> +               seq_printf(seq, ",compress_lz4hc_clevel=%u",
> +                               F2FS_OPTION(sbi).lz4hc_clevel);
>  }
>
>  static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
> --
> 2.26.2
>
>
>
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
