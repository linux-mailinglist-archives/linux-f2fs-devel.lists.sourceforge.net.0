Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B448256ACA
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 30 Aug 2020 01:44:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kCAWV-0007RK-8i; Sat, 29 Aug 2020 23:44:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1kCAWU-0007Qx-3H
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 29 Aug 2020 23:44:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:Cc:References:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=83Iz99SHGFnxWdZNnURe7yKQIiJNbe/r+PVI6vGEjo4=; b=FksIOHHDmEDNNiIYUatfqhEfYw
 y2YQDboxg8TBfgdKogir499qZNIkoDm9V8tZ1JF6N9oB3/rPGX6SRCte0uLQjlHTBLfrd5pAeIAF+
 jkp/5/r3ZDLJICvM2gMPQ3LduUUfoebwIyY9TMB5EZeyw0tLjweJmi87EQWhMXP8H3zs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:Cc:References:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=83Iz99SHGFnxWdZNnURe7yKQIiJNbe/r+PVI6vGEjo4=; b=a0JrWgg4TC92VygmWH8GzzxR0F
 c1xtzbJ4vQrAUq9YiGrJfYM5JhXhAA41CxFhUfLbfx6INwLLQ+PgAWt8+Xo8yz+nlB3ab14lwABAQ
 3slyOAsNREvMzDvTBz/ngFy3JUyuuWDb6HLzWb0PwN1QpQ0lytRLWm/I1g85TRTFuHn0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kCAWO-009Yzp-27
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 29 Aug 2020 23:44:38 +0000
Received: from [192.168.0.108] (unknown [49.65.245.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A889F20776;
 Sat, 29 Aug 2020 23:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598744661;
 bh=T86btTIeJaz0WbqNY52QJxthzlK/IGB8x+5hfU2xFp8=;
 h=Subject:To:References:Cc:From:Date:In-Reply-To:From;
 b=zFklHNGvPl0pOPdTnZD3JhNvOL4h4+J49XNOxGF2GJBikhRfXdEW2W4OpoA4TR/xG
 NB3vt3NUBVzHIWKFtPd8F3Ot1VclaeQZT7ofqsEz8ZuppSFOTDZ5u/iGBD6RLTpafH
 xi9N4F8Oddy+Meu4Al3H6+Ngz/h1R1rlG9nOVZHo=
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20200828034953.354267-1-daeho43@gmail.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <44f8d9f3-9438-fdfe-bbc3-f5347a9aaa29@kernel.org>
Date: Sun, 30 Aug 2020 07:44:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20200828034953.354267-1-daeho43@gmail.com>
X-Spam-Score: -1.9 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.8 NICE_REPLY_A           Looks like a legit reply (A)
 -1.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1kCAWO-009Yzp-27
Subject: Re: [f2fs-dev] [PATCH] f2fs: make fibmap consistent with fiemap for
 compression chunk
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020-8-28 11:49, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
>
> Currently fibmap returns zero address for compression chunk. But it
> is not consistent with the output of fiemap, since fiemap returns
> real pysical block address related to the compression chunk. Therefore
> I suggest fibmap returns the same output with fiemap.

We can return real physical block address in fiemap, because we have set
FIEMAP_EXTENT_ENCODED flag in extent.fe_flags, then user can be noticed that he 
can not just read/write that block address for access/update in-there data.

Quoted from Documentation/filesystems/fiemap.rst
"
FIEMAP_EXTENT_ENCODED
   This extent does not consist of plain filesystem blocks but is
   encoded (e.g. encrypted or compressed).  Reading the data in this
   extent via I/O to the block device will have undefined results.
"

However, there is no such flag in fibmap interface, so I just return block 
address for those logical pages in non-compressed cluster.

Thanks,

>
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
>  fs/f2fs/data.c | 33 ---------------------------------
>  1 file changed, 33 deletions(-)
>
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index c1b676be67b9..8c26c5d0c778 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -3708,36 +3708,6 @@ static int f2fs_set_data_page_dirty(struct page *page)
>  	return 0;
>  }
>
> -
> -static sector_t f2fs_bmap_compress(struct inode *inode, sector_t block)
> -{
> -#ifdef CONFIG_F2FS_FS_COMPRESSION
> -	struct dnode_of_data dn;
> -	sector_t start_idx, blknr = 0;
> -	int ret;
> -
> -	start_idx = round_down(block, F2FS_I(inode)->i_cluster_size);
> -
> -	set_new_dnode(&dn, inode, NULL, NULL, 0);
> -	ret = f2fs_get_dnode_of_data(&dn, start_idx, LOOKUP_NODE);
> -	if (ret)
> -		return 0;
> -
> -	if (dn.data_blkaddr != COMPRESS_ADDR) {
> -		dn.ofs_in_node += block - start_idx;
> -		blknr = f2fs_data_blkaddr(&dn);
> -		if (!__is_valid_data_blkaddr(blknr))
> -			blknr = 0;
> -	}
> -
> -	f2fs_put_dnode(&dn);
> -	return blknr;
> -#else
> -	return 0;
> -#endif
> -}
> -
> -
>  static sector_t f2fs_bmap(struct address_space *mapping, sector_t block)
>  {
>  	struct inode *inode = mapping->host;
> @@ -3753,9 +3723,6 @@ static sector_t f2fs_bmap(struct address_space *mapping, sector_t block)
>  	if (mapping_tagged(mapping, PAGECACHE_TAG_DIRTY))
>  		filemap_write_and_wait(mapping);
>
> -	if (f2fs_compressed_file(inode))
> -		blknr = f2fs_bmap_compress(inode, block);
> -
>  	if (!get_data_block_bmap(inode, block, &tmp, 0))
>  		blknr = tmp.b_blocknr;
>  out:
>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
