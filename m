Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B592D184F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Dec 2020 19:17:13 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kmL4R-0002ag-MB; Mon, 07 Dec 2020 18:17:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kmL4P-0002aP-PR
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Dec 2020 18:17:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XWch1CcUVJFQ8lKjEqn6cSVVNs3MN8Sn6hJ/XwLMzOY=; b=FN86UoFPyfn0suuOPk97eQ6K29
 bQOScN4p04yjJOB8W1F/cV4+o8PmYaZfiZnajF9+oIpCYA4j04QarSshq6sfVdwg2hGFu3Gt5RvfF
 gByyiM3NX2fguHTA9rzpUGMiowfqEVv3Nv1E619eedetYdCoxi4janQdQLz8uWF463Lc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XWch1CcUVJFQ8lKjEqn6cSVVNs3MN8Sn6hJ/XwLMzOY=; b=ZlytA5fFTH4FSYmx0qLI7Z8gqy
 fASt9s2QQBdoWEBM2dH5TsEKMO4NoahNe65kvB/LTALo1g0FCHZ7xAsH4BrG7RrVA82wGHM6evUux
 cP5BFxpCHjvrpY+NNpQNhf91wi5Jjq6+BIEfW0OepIe+tN7zunHEDUHapaM6YdbxCpxY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kmL4L-002LTG-Jr
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Dec 2020 18:17:09 +0000
Date: Mon, 7 Dec 2020 10:16:53 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607365015;
 bh=le8vfxceC05Tky48BN1v0WaIn5E3rrFNOOcF0AF1HL4=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=VRvuvDQVG1PXt8E3Pc3u2I3v3PG+NTgsIULlnokT5ZIij6isspvvrH9tQ9Pp57O8w
 MCZ2cx7Fcypat1dqvCbepSXIQOcD2uMmw4m1NpKiqaECFcbgeQPcc3dVy2+4bpsfKl
 BPK7YZkcDuvN1aIjYIVRPaWP4f3EsrSDjhsxn4cfsBR5NAuyNOlX3P1aAlGtWk7AgZ
 maZmLyldh4UpG8YVt+OH5Ifd5QxVz/QMGKUU7RZjdTMcXGeoIlI/w12ZELNlRjA1e8
 URI1KhV4Sb94eNQRbeZN486oF3xVrrdi5aE93A/3qBNsyqOn6fxU7Lp6tg1WlwlHem
 ahSPnDha6IQrw==
From: Eric Biggers <ebiggers@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <X85xlc2Q0gnBywBE@gmail.com>
References: <20201207095609.73825-1-yuchao0@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201207095609.73825-1-yuchao0@huawei.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kmL4L-002LTG-Jr
Subject: Re: [f2fs-dev] [PATCH RESEND] f2fs: compress: deny setting
 unsupported compress algorithm
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

On Mon, Dec 07, 2020 at 05:56:09PM +0800, Chao Yu wrote:
> If kernel doesn't support certain kinds of compress algorithm, deny to set
> them as compress algorithm of f2fs via 'compress_algorithm=%s' mount option.
> 
> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> ---
> no changes, just rebase on dev branch.

This doesn't apply to the dev branch anymore.

>  fs/f2fs/super.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index e0fe72f1d2c8..662e59f32645 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -936,9 +936,14 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
>  			if (!name)
>  				return -ENOMEM;
>  			if (!strcmp(name, "lzo")) {
> +#ifdef CONFIG_F2FS_FS_LZO
>  				F2FS_OPTION(sbi).compress_algorithm =
>  								COMPRESS_LZO;
> +#else
> +				f2fs_info(sbi, "Image doesn't support lzo compression");
> +#endif

These info messages don't make sense.  It's not the filesystem image that
doesn't support the algorithm, but rather the kernel that doesn't.

Also, shouldn't these be warnings instead of "info"?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
