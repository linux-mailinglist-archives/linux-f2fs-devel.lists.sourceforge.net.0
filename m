Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 561C0E0B03
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Oct 2019 19:53:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iMyLj-00039j-71; Tue, 22 Oct 2019 17:53:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <qkrwngud825@gmail.com>) id 1iMyLh-00039b-Ic
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Oct 2019 17:53:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pR0WH5wwXvIemAaaZ4BSrKMIJIPAZiTVQJ50D3XmWCg=; b=gohKtDvbq1WL+SjmH4IUz8Q981
 yOjAhvCMIgN81rH247tX8kdcnIHdlS9jimHUlLkPitXTBddCMsGOZladdOuaOwU027KUkUvXtUH1h
 5PPwOHrf00Y4Yreml5TiiplkmFbdeqjStiRMw2Vd1F9aLZN+fMM4NKLPwiXKVAA4Tgzc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pR0WH5wwXvIemAaaZ4BSrKMIJIPAZiTVQJ50D3XmWCg=; b=nCHoZyDpgRLTDn6qROFvhEl3dV
 DXbf9URMWsUQCQrDoomaB0anGWfWMyn10MywOj247yoIJ5wE6hVYbC5JUA/hsAdlEPzQsNSznS/8w
 1azS3DtRkH5WhgTtvFGIEil3XRcANu+4c8aX65U5i7cq9JEmYMcTCiAnTmL3ft84Y6u8=;
Received: from mail-ua1-f66.google.com ([209.85.222.66])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iMyLf-00Gy2K-UT
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Oct 2019 17:53:37 +0000
Received: by mail-ua1-f66.google.com with SMTP id r25so5186278uam.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 22 Oct 2019 10:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pR0WH5wwXvIemAaaZ4BSrKMIJIPAZiTVQJ50D3XmWCg=;
 b=ZhMJtmaH2ftR+twf7WZNhYmRTLYCDyPECM9OgdzB1TqJJ7VlXaU52kfUZlKOpfIocu
 Nf21eRyq5cjllaRjZdYA6bHDHJgQKfsNMYZhqlJFlHY7HtWYbvX6YSXfGenJ09PqMrra
 oXs4Nck8E2bSV5k0PXw4miMFXizqXeYOvnPPjnl/Jq2MwFNhOWEsnIBlFqu1m3pTJjwY
 ryya6+F13YdIgEf4kUd9Gthn2JAcWT32TFSZdjvDZw5rZeifhyQVwyj2z1dYpTY1koV7
 f0486voqxtGP4S5VcJb5XBZr/QuLlnS1khCao79DmpW3nSh09mvr9p5X3XzWCFs++QTz
 8GRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pR0WH5wwXvIemAaaZ4BSrKMIJIPAZiTVQJ50D3XmWCg=;
 b=nLLDoy5tXZh/OqN3x+o80PodN8vseyon7QVgSb/CdB/MuZ1A9OZh91R1JJg5LVacH1
 awfMNqhLAFoess/6LxhqXu6fmf+55eBp7WBid6QFtNFDYCy9vICE4YyX4C9+kjhygGlH
 jQYixO6dYAjDrG3Zt4N/lEb8/Za8HwtQuUuPKKRn4CW2X4fzP3OBSHPvbGhW12MNfZNL
 JLYqlRd6BCW1jQBSAvLO+dt8715/IS3sTHXvEx19zZN5OTzkhVEu23dkc6mt6Jb2/ZR1
 Td/6CEKAAecSuSzu+Gf+DI5vPcYl4ytUiFkqFctDSoVYK799ZTA33zN07lOQtaUUsM7V
 oszA==
X-Gm-Message-State: APjAAAUynPV9vmTKwtXnxAaCVo+xGehJzChu7xBjF4CDrpST5TmK2zwr
 paialnbL3OWa0qe7BDyg6RF/oY4lmRuywv/b+Cnb+vPz
X-Google-Smtp-Source: APXvYqw4KxqpOOE57nAZxXgUQSun9pQjxMmSxPfJ3V8tRUuENHWHcBjHG9Wh8OgNcrFzd7qK8C0slIDIot4ctjrEJbI=
X-Received: by 2002:a9f:2126:: with SMTP id 35mr2791960uab.97.1571766809458;
 Tue, 22 Oct 2019 10:53:29 -0700 (PDT)
MIME-Version: 1.0
References: <20191022171602.93637-1-jaegeuk@kernel.org>
 <20191022171602.93637-2-jaegeuk@kernel.org>
In-Reply-To: <20191022171602.93637-2-jaegeuk@kernel.org>
From: Ju Hyung Park <qkrwngud825@gmail.com>
Date: Wed, 23 Oct 2019 02:53:18 +0900
Message-ID: <CAD14+f3CH7=JTvsvFKzoZCX=GL5W9qs0LD0i-o+gHO39aW7-kw@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>
X-Spam-Score: 1.8 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 1.0 HK_RANDOM_FROM         From username looks random
 0.6 HK_RANDOM_ENVFROM      Envelope sender username looks random
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (qkrwngud825[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.222.66 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.66 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (qkrwngud825[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1iMyLf-00Gy2K-UT
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: support data compression
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Jaegeuk and Chao,

Nice to see this finally getting into shape :) Great work
I'm excited to see possible use-cases for this in the future.

Would f2fs compress files automatically like how btrfs' "compress" option works?
Or is it per-extension basis for now?

On Wed, Oct 23, 2019 at 2:16 AM Jaegeuk Kim <jaegeuk@kernel.org> wrote:
> +compress_algorithm=%s  Control compress algorithm, currently f2fs supports "lzo"
> +                       and "lz4" algorithm.

I see absolutely no reason to support regular lzo variant at this time.
Everyone should use lz4 instead of lzo. If one wants zlib-level
compression, they should use zstd.

However, there's recent conversation on new lzo-rle and how it could
be a better candidate than lz4.

Since the mainline now have lz4, zstd and lzo-rle, I don't think
supporting lzo is a good idea.

> diff --git a/fs/f2fs/Kconfig b/fs/f2fs/Kconfig
> index 652fd2e2b23d..c12854c3b1a1 100644
> --- a/fs/f2fs/Kconfig
> +++ b/fs/f2fs/Kconfig
> @@ -6,6 +6,10 @@ config F2FS_FS
>         select CRYPTO
>         select CRYPTO_CRC32
>         select F2FS_FS_XATTR if FS_ENCRYPTION
> +       select LZO_COMPRESS
> +       select LZO_DECOMPRESS
> +       select LZ4_COMPRESS
> +       select LZ4_DECOMPRESS

This is a bad idea.
This unnecessarily increases kernel binary image when no the user
intends to change the defaults.

For example, my Android kernel doesn't use lzo anywhere and this
wouldn't be welcome.

> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> new file mode 100644
> index 000000000000..f276d82a67aa
> --- /dev/null
> +++ b/fs/f2fs/compress.c
> @@ -0,0 +1,1066 @@
> +static unsigned int offset_in_cluster(struct compress_ctx *cc, pgoff_t index)
> +static unsigned int cluster_idx(struct compress_ctx *cc, pgoff_t index)
> +static unsigned int start_idx_of_cluster(struct compress_ctx *cc)

Looks like these would be better if they were explicitly marked as inline.

> +static void f2fs_init_compress_ops(struct f2fs_sb_info *sbi)
> +{
> +       sbi->cops[COMPRESS_LZO] = &f2fs_lzo_ops;
> +       sbi->cops[COMPRESS_LZ4] = &f2fs_lz4_ops;
> +}

Would it be possible for f2fs to use generic crypto compression APIs?
Hardcoding for lzo/lz4 would make it harder to venture future different options.

Have a look at mm/zswap.c:__zswap_pool_create_fallback().

> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index c681f51e351b..775c96291490 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -155,6 +163,7 @@ struct f2fs_mount_info {
>  #define F2FS_FEATURE_VERITY            0x0400
>  #define F2FS_FEATURE_SB_CHKSUM         0x0800
>  #define F2FS_FEATURE_CASEFOLD          0x1000
> +#define F2FS_FEATURE_COMPRESSION       0x2000

How would older versions of f2fs behave if an image was used by the
latest f2fs and have compressed pages?
I hope fail-safes are in place.

Thanks.

> --
> 2.19.0.605.g01d371f741-goog
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
