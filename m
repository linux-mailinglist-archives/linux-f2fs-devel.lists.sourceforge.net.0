Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 634826D711A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  5 Apr 2023 02:10:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pjqjB-00062a-JO;
	Wed, 05 Apr 2023 00:10:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <david@fromorbit.com>) id 1pjqjA-00062U-Pz
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Apr 2023 00:10:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=M/r2yyBxa2UjizT7DIESb3jdVn4T1vcr3JZCxz3Un80=; b=Q4VKrb2n8nhax1AvSr0+wRDhtJ
 2YWAXqbw35Nd+/gc+X+52oZi5xUYMEnQjvr8FBuM99PTQf4gvjbOm9bu2D/aDOO4FPBJTavWJDLqD
 AIsAMLythJ3ixi9/LiflD6l1SGbgAKMdjZ5AA+xAH4fK1P0r4/WQ7Cs44yfYO2DAw5RI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=M/r2yyBxa2UjizT7DIESb3jdVn4T1vcr3JZCxz3Un80=; b=bklCYVEMEbHGVlhgPSipg9sIwm
 kRjx2rCBVkEUr/8NL6TDYO8PiaWOaVmiFnc2IH+YQuTynVs67GmDaHSU8sCmyCoy6x4xRqrby4Sbd
 fTODBwx+fS+IMGC6l4NWTyv+eXUdRTNKDpaa8LI+PTqrw4BgUy7QOr2eZ8qbL/vrcDUE=;
Received: from mail-pl1-f179.google.com ([209.85.214.179])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pjqj3-00FV6S-65 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Apr 2023 00:10:17 +0000
Received: by mail-pl1-f179.google.com with SMTP id f22so28768489plr.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 04 Apr 2023 17:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fromorbit-com.20210112.gappssmtp.com; s=20210112; t=1680653403;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=M/r2yyBxa2UjizT7DIESb3jdVn4T1vcr3JZCxz3Un80=;
 b=16h9ftkx363dFwpnpTR7TyruTDXpxlaazKR9mDJeoyDk9FUKA2YE558q+d+TSH2xSa
 bj0YsbkSbnIY4wLXaCxkRMLE2z+2iPHFUmcm/bL5dAnl8Dj8o359hnhgdOxro0j8SfxT
 Rh3vt+PYAS67Cg2vfzTZVzyr1ENw7ygewK66KYchq9XiW9gWzh8pVRkZMCNvfq70J4gl
 UQft+4UtTrLTnWDawQiqMoRdBZamPWxVNkMGtMBggYvAWVsHbkj9H1ofSLRWRkWSKkUa
 RULy0kw/G6AjzZZamraljLs0Z1P/HWG1xUpL9OTIoqbtkVcUWl4LDjeB4ju4GD1z7iiu
 F0dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680653403;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M/r2yyBxa2UjizT7DIESb3jdVn4T1vcr3JZCxz3Un80=;
 b=bbtBIjExB7fnpvAOUKiL17sXG7Ror83tQVL6jNIGiaOj5inBuvaBuCjfbJhS1ZOWot
 O7oF5kcgvIrrDdL9gmEbifgTXrSLqEmjbj5T7fb6KqeWNya2sgabNRA/8gKfDlQwUL66
 jW5uokZRupF8hikkhNHN7XPyghIpjt5trLAaxMR578WhYEY5uiOT62iSxozC+1WOtIiB
 wgNhP4yIGTgZlErxpiKwxU2oFe5Ra6fsVwjCouayIc9dccXIWW4ISXCEq7d0IY6Q6P0I
 GSIfr0Fu3BDxFAxNLg3i4gyYi+6uy74n3Rjhpe/51TubigKI2f3rl0lBCd/aippvkYWz
 BKsg==
X-Gm-Message-State: AAQBX9fol01S0UniAr3cKLQdJuCZdjSolP9bKxsiYzcXY4EKV5HdJGdm
 4wIrUX7SWlsCHGLTrwhPs0zwuF5I16q2E7o/F6I=
X-Google-Smtp-Source: AKy350aGtUyDc7dXm54tao9SO1Z52DtK7YHUJoaBCaBA1TXOYmz5/48+4yE+r2PZyPM8LNhcT3l0sw==
X-Received: by 2002:a17:902:fb8c:b0:1a1:c945:4b23 with SMTP id
 lg12-20020a170902fb8c00b001a1c9454b23mr3916070plb.65.1680651635730; 
 Tue, 04 Apr 2023 16:40:35 -0700 (PDT)
Received: from dread.disaster.area (pa49-181-91-157.pa.nsw.optusnet.com.au.
 [49.181.91.157]) by smtp.gmail.com with ESMTPSA id
 q18-20020a170902b11200b001a216d44440sm8856651plr.200.2023.04.04.16.40.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 16:40:29 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1pjqGB-00H7Og-Tt; Wed, 05 Apr 2023 09:40:19 +1000
Date: Wed, 5 Apr 2023 09:40:19 +1000
To: Andrey Albershteyn <aalbersh@redhat.com>
Message-ID: <20230404234019.GM3223426@dread.disaster.area>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
 <20230404145319.2057051-7-aalbersh@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230404145319.2057051-7-aalbersh@redhat.com>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Apr 04, 2023 at 04:53:02PM +0200, Andrey Albershteyn
 wrote: > Allow filesystem to make additional processing on verified pages
 > instead of just dropping a reference. This will be used by XFS [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.179 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.179 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1pjqj3-00FV6S-65
Subject: Re: [f2fs-dev] [PATCH v2 06/23] fsverity: add drop_page() callout
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
From: Dave Chinner via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Dave Chinner <david@fromorbit.com>
Cc: fsverity@lists.linux.dev, linux-xfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, agruenba@redhat.com, hch@infradead.org,
 djwong@kernel.org, damien.lemoal@opensource.wdc.com,
 linux-f2fs-devel@lists.sourceforge.net, ebiggers@kernel.org,
 cluster-devel@redhat.com, dchinner@redhat.com, rpeterso@redhat.com,
 xiang@kernel.org, jth@kernel.org, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Apr 04, 2023 at 04:53:02PM +0200, Andrey Albershteyn wrote:
> Allow filesystem to make additional processing on verified pages
> instead of just dropping a reference. This will be used by XFS for
> internal buffer cache manipulation in further patches. The btrfs,
> ext4, and f2fs just drop the reference.
> 
> Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
> ---
>  fs/btrfs/verity.c         | 12 ++++++++++++
>  fs/ext4/verity.c          |  6 ++++++
>  fs/f2fs/verity.c          |  6 ++++++
>  fs/verity/read_metadata.c |  4 ++--
>  fs/verity/verify.c        |  6 +++---
>  include/linux/fsverity.h  | 10 ++++++++++
>  6 files changed, 39 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/btrfs/verity.c b/fs/btrfs/verity.c
> index c5ff16f9e9fa..4c2c09204bb4 100644
> --- a/fs/btrfs/verity.c
> +++ b/fs/btrfs/verity.c
> @@ -804,10 +804,22 @@ static int btrfs_write_merkle_tree_block(struct inode *inode, const void *buf,
>  			       pos, buf, size);
>  }
>  
> +/*
> + * fsverity op that releases the reference obtained by ->read_merkle_tree_page()
> + *
> + * @page:  reference to the page which can be released
> + *
> + */
> +static void btrfs_drop_page(struct page *page)
> +{
> +	put_page(page);
> +}
> +
>  const struct fsverity_operations btrfs_verityops = {
>  	.begin_enable_verity     = btrfs_begin_enable_verity,
>  	.end_enable_verity       = btrfs_end_enable_verity,
>  	.get_verity_descriptor   = btrfs_get_verity_descriptor,
>  	.read_merkle_tree_page   = btrfs_read_merkle_tree_page,
>  	.write_merkle_tree_block = btrfs_write_merkle_tree_block,
> +	.drop_page		 = &btrfs_drop_page,
>  };

Ok, that's a generic put_page() call.

....
> diff --git a/fs/verity/verify.c b/fs/verity/verify.c
> index f50e3b5b52c9..c2fc4c86af34 100644
> --- a/fs/verity/verify.c
> +++ b/fs/verity/verify.c
> @@ -210,7 +210,7 @@ verify_data_block(struct inode *inode, struct fsverity_info *vi,
>  		if (is_hash_block_verified(vi, hpage, hblock_idx)) {
>  			memcpy_from_page(_want_hash, hpage, hoffset, hsize);
>  			want_hash = _want_hash;
> -			put_page(hpage);
> +			inode->i_sb->s_vop->drop_page(hpage);
>  			goto descend;

			fsverity_drop_page(hpage);

static inline void
fsverity_drop_page(struct inode *inode, struct page *page)
{
	if (inode->i_sb->s_vop->drop_page)
		inode->i_sb->s_vop->drop_page(page);
	else
		put_page(page);
}

And then you don't need to add the functions to each of the
filesystems nor make an indirect call just to run put_page().

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
