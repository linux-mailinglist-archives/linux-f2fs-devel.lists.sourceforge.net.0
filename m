Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 75EE32D183F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Dec 2020 19:13:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kmL0q-0008J8-Oj; Mon, 07 Dec 2020 18:13:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kmL0p-0008J1-NH
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Dec 2020 18:13:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0BshWBmeSejK819DyzjjqY2Z/07/5z+4u5gQuDy13vU=; b=Ss4tN1D9vEqHV9xbQEvpMr80i5
 XjuziR2gMIaPtEpDCcciibaFNkmgN6TyGpFFdbUW2jdi58EaRWHTM/Pg638L6TNokt/dsqwrgG+vO
 EuHvLeANO7iHmWeo9GcymqwODdzsOHDdTLdzcixY1vKNFeYTvvDiV14BXq5OeL+sDaf8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0BshWBmeSejK819DyzjjqY2Z/07/5z+4u5gQuDy13vU=; b=Ul5dYBDj5goJ3+GnKpcLvp3BqR
 j8YwQrFv52Q79dB1fvB/BPo9d6mg5wblysuaYCUt2d/guObnEVq9srwYAvze+5mShqanjyn9Ku1dD
 JEdnbICtsb3soabZJxfpmaiawIWzwtQDddFtqyDnFH8FK8InAf0JLYGLeBLW8kcUROI0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kmL0b-005dsL-6F
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Dec 2020 18:13:27 +0000
Date: Mon, 7 Dec 2020 10:13:06 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607364787;
 bh=WA4Z5WMSDn1c5FX1KInte6wma4gAm1WZIUR0t0bLAeA=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=MDj6p9550nh/kmo2eBV+sSK1bKA6XsgWLdqpQDky9RqdxoFAv8T07+xDVmGRAgFRi
 sAE23IFyV5G70emWahdMg6pl7bTorbHxpSFQ4SdLFqb7ll5p7fm5ZD8TqqOsGZ8Fqs
 GmjC9SmJHqh6E9KmujPd4tY+RCjeW+mRr4R27jqzV5d6Ql5gekLjwqjgAmtGlubt26
 mc2ysCjWRr9BG37SWFZAuog1V8aFIqjnxlztPkxRK3KvMmM/j5VoTlb7YsEwPOoL+N
 CH18aO/t3ffpDw39PptLXRYbl7qzaDMx8bIfUVLxIx3H5A1xFNuIj/dST+Mcv2iMaD
 jPH2t3GO84VrQ==
From: Eric Biggers <ebiggers@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <X85wshahXe4nR+N6@gmail.com>
References: <20201207095220.73093-1-yuchao0@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201207095220.73093-1-yuchao0@huawei.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kmL0b-005dsL-6F
Subject: Re: [f2fs-dev] [PATCH v5 RESEND] f2fs: compress: add compress_inode
 to cache compressed blocks
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Dec 07, 2020 at 05:52:20PM +0800, Chao Yu wrote:
> diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
> index dae15c96e659..fd413d319e93 100644
> --- a/Documentation/filesystems/f2fs.rst
> +++ b/Documentation/filesystems/f2fs.rst
> @@ -268,6 +268,9 @@ compress_mode=%s	 Control file compression mode. This supports "fs" and "user"
>  			 choosing the target file and the timing. The user can do manual
>  			 compression/decompression on the compression enabled files using
>  			 ioctls.
> +compress_cache		 Support to use address space of inner inode to cache
> +			 compressed block, in order to improve cache hit ratio of
> +			 random read.

What is an "inner inode"?  Mount options should be understandable without
understanding filesystem implementation details.

> +const struct address_space_operations f2fs_compress_aops = {
> +	.releasepage = f2fs_release_page,
> +	.invalidatepage = f2fs_invalidate_page,
> +};
> +
> +struct address_space *COMPRESS_MAPPING(struct f2fs_sb_info *sbi)
> +{
> +	return sbi->compress_inode->i_mapping;
> +}
> +
> +void invalidate_compress_page(struct f2fs_sb_info *sbi, block_t blkaddr)
> +{
> +	if (!sbi->compress_inode)
> +		return;
> +	invalidate_mapping_pages(COMPRESS_MAPPING(sbi), blkaddr, blkaddr);
> +}

Global functions should have the "f2fs_" prefix.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
