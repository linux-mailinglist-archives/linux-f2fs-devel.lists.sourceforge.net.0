Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B40B2CDEFF
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Dec 2020 20:33:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kkuLg-0007Bd-PB; Thu, 03 Dec 2020 19:33:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kkuLf-0007BC-4f
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Dec 2020 19:33:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oRUrQ9NDModKSNTUVouivJQb2JQyPSwe+vRQNWtVy4o=; b=QCS00n2MePg8oQHG8NWy9myK+g
 uEvj7WRvBaKYmbAF4sT6yGPiBgXSgR4Y/5uWD0GuMHi/S0aBVy0hUmcVAF0JVp1RJfd26yway4Z5g
 3Gc9ARxnE0q5i6NU3BidlNxRD2/DLGj1b783kEfNMIIk/xWotNjvX52IP5Ruk/IyuBfs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oRUrQ9NDModKSNTUVouivJQb2JQyPSwe+vRQNWtVy4o=; b=HBIhyFYBdRU9Efs4lHtwtTVdib
 SjlWfill3P9HbzocTA3Q1B31aIBDgmEAZHmFxo0htyMz2A+NF9JQqrQGN05QqgdC00gEsOHrN7LKO
 EZpBz0Er34mkFkf77mE1dICU4t6i6iynWGZosWm3tnlITqadDT2LLwUepwP5h28FdB4E=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kkuLW-00DwM1-0q
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Dec 2020 19:33:02 +0000
Date: Thu, 3 Dec 2020 11:32:34 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607023956;
 bh=G81b7sAQkDFZGaWOTLOclHTz9c5GLdvtf0TzZVW7prg=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=LdJ+jcDzFI72yCDHKCUEwqPWu7KQONp/q26z8c0MOUsVFnfSnaiSnDuRfScnIR8G6
 V5yZK8sti/fes59TgG+MqANLcXzDFwwqAmtrjgGUmDCw7Qo4AU6xGcBgZhpFN6M5Tv
 PBxjOxlrga5pI/Q9AnPGqkChZFQAfpoUIVyRwsk5/jl2kLGFehgm4QkYHGZ+We/8pS
 yhd+lA3U68dwZI86furD8bDekC5Pt3rarIrgGyAfj158PfGNk+0obf4j0wRv+qKrJg
 F159Ga6F6tRstcpPGtqEt6OuauGSh3BKOVNEbjIZKwf276zl26BSHsnOM0osmiy+u2
 m3vv0vM2bWRDw==
From: Eric Biggers <ebiggers@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <X8k9UoUKcyThlJNU@gmail.com>
References: <20201203061715.60447-1-yuchao0@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201203061715.60447-1-yuchao0@huawei.com>
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kkuLW-00DwM1-0q
Subject: Re: [f2fs-dev] [PATCH v6] f2fs: compress: support compress level
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

On Thu, Dec 03, 2020 at 02:17:15PM +0800, Chao Yu wrote:
> +config F2FS_FS_LZ4HC
> +	bool "LZ4HC compression support"
> +	depends on F2FS_FS_COMPRESSION
> +	depends on F2FS_FS_LZ4
> +	select LZ4HC_COMPRESS
> +	default y
> +	help
> +	  Support LZ4HC compress algorithm, if unsure, say Y.
> +

It would be helpful to mention that LZ4HC is on-disk compatible with LZ4.

>  static int lz4_compress_pages(struct compress_ctx *cc)
>  {
>  	int len;
>  
> +#ifdef CONFIG_F2FS_FS_LZ4HC
> +	return lz4hc_compress_pages(cc);
> +#endif

This looks wrong; it always calls lz4hc compression even for regular lz4.

>  static int parse_options(struct super_block *sb, char *options, bool is_remount)
>  {
>  	struct f2fs_sb_info *sbi = F2FS_SB(sb);
> @@ -886,10 +939,22 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
>  			if (!strcmp(name, "lzo")) {
>  				F2FS_OPTION(sbi).compress_algorithm =
>  								COMPRESS_LZO;
> -			} else if (!strcmp(name, "lz4")) {
> +			} else if (!strncmp(name, "lz4", 3)) {

strcmp() is fine, no need for strncmp().

> @@ -1547,6 +1612,9 @@ static inline void f2fs_show_compress_options(struct seq_file *seq,
>  	}
>  	seq_printf(seq, ",compress_algorithm=%s", algtype);
>  
> +	if (!F2FS_OPTION(sbi).compress_level)
> +		seq_printf(seq, ":%d", F2FS_OPTION(sbi).compress_level);
> +

This looks wrong; it only prints compress_level if it is 0.

> diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
> index 55be7afeee90..2dcc63fe8494 100644
> --- a/include/linux/f2fs_fs.h
> +++ b/include/linux/f2fs_fs.h
> @@ -275,6 +275,9 @@ struct f2fs_inode {
>  			__u8 i_compress_algorithm;	/* compress algorithm */
>  			__u8 i_log_cluster_size;	/* log of cluster size */
>  			__le16 i_compress_flag;		/* compress flag */
> +						/* 0 bit: chksum flag
> +						 * [10,15] bits: compress level
> +						 */

What is the use case for storing the compression level on-disk?

Keep in mind that compression levels are an implementation detail; the exact
compressed data that is produced by a particular algorithm at a particular
compression level is *not* a stable interface.  It can change when the
compressor is updated, as long as the output continues to be compatible with the
decompressor.

So does compression level really belong in the on-disk format?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
