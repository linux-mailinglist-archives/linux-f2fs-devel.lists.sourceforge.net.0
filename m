Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4589B37FFB8
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 13 May 2021 23:18:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lhIic-0003LN-M8; Thu, 13 May 2021 21:18:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1lhIib-0003LG-IF
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 13 May 2021 21:18:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Qpwb4OjVudAPFCttI4yVcnXGtIfVuFbrGNUH/fmq+C8=; b=azUjcgojSTHnQHptqppKupfJO+
 zx2fzfDDRyZgh8MNIUwurvWDtLvaLeEj5hjEE6IS+3zpM5iVcNFQaump6JgpzqOv/HO8ziibXcHjp
 5FA6QrSkiOJCAPv2OG6Z7XUNBgLs0ixNU0artCaHGOUD2A5jqiIv5WdI6rFNxuFNp/Vw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Qpwb4OjVudAPFCttI4yVcnXGtIfVuFbrGNUH/fmq+C8=; b=JJL9O8dYNIdt79QC4XCdWvw0xA
 +rdNym48XFuDD9EF3D2BkJTvqMzL1wtcY6CqLMxABGEiUYf6c9S2LqTkFR7VDF0bH5o9QmsJgUAPY
 smAyi/WTkNSqJI0vWntP2SaSRNQjvlhgvfif9kqMhVa0aazki9LX0zA5tKDMV4MIsiZM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lhIiT-007I7T-Ui
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 13 May 2021 21:18:07 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 271E56109F;
 Thu, 13 May 2021 21:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620940672;
 bh=C/vA6v0EUiCQEQIel2pyxQ4EYG6c84hz1Bjk8UaVs2g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YPLbE6T2z2pugvFxK+LgtNSR4RdcZH+tRQRDAJwnA/YbICh1cGKmYzBRhvr07s/rR
 fKhYzjMFI7MhAlMmjljXSROoHuberojf7753ftqueyoYL1/6sxrXnTKLIta1P4W+Pe
 tG+cu68CLou4xz0eHy9RUpIg0BwpKtZdwN9JRDy1COqUxn3U+1tT2b7AlITGBFc/QI
 7oZEk1FATzEZNXrPo8QLx+W/9Ut9MiXnhDRkIeo5qQ1AcPrW2mR07Ki1zspEDJhpKZ
 Dj5CvzH0Jo6yn3NQbX6gvmTl0OIZ9QpqL+M69nrZWezUw6yev4zyuekSbzBiNqElbt
 UL62kMwJBOtYg==
Date: Thu, 13 May 2021 14:17:50 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <YJ2Xflx6eF2P89Km@gmail.com>
References: <20210507094455.1695-1-changfengnan@vivo.com>
 <YJlUpHJLONlORWWl@google.com>
 <000b01d74656$518e96f0$f4abc4d0$@vivo.com>
 <YJr8PuZlOBqb+Qv1@google.com>
 <15efccda-b8e3-80bc-13b7-b2d62a1cac15@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <15efccda-b8e3-80bc-13b7-b2d62a1cac15@huawei.com>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lhIiT-007I7T-Ui
Subject: Re: [f2fs-dev] =?utf-8?b?562U5aSNOiBbUEFUQ0ggdjRdIGYyZnM6IGNvbXBy?=
 =?utf-8?q?ess=3A_avoid_unnecessary_check_in_f2fs=5Fprepare=5Fcompress=5Fo?=
 =?utf-8?q?verwrite?=
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, changfengnan@vivo.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, May 12, 2021 at 09:52:19AM +0800, Chao Yu wrote:
> On 2021/5/12 5:50, Jaegeuk Kim wrote:
> > On 05/11, changfengnan@vivo.com wrote:
> > > Hi Jaegeuk:
> > > 
> > > If there're existing clusters beyond i_size, may cause data corruption, but
> > > will this happen in normal? maybe some error can cause this, if i_size is
> > > error the data beyond size still can't handle properly.  Is there normal
> > > case can casue existing clusters beyond i_size?
> > 
> > We don't have a rule to sync between i_size and i_blocks.
> 
> I can't image a case that compressed cluster may cross filesize, it looks it's
> a bug if that happened, but I'm not sure I have considered all cases. So, I
> prefer to add a check condition as below, then testing w/ xfstest/por_fsstress
> for a while.
> 
> Subject: [PATCH] f2fs: compress: compressed cluster should not cross i_size
> 
> ---
>  fs/f2fs/data.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 06d1e58d3882..9acca358d578 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -3325,6 +3325,8 @@ static int f2fs_write_begin(struct file *file, struct address_space *mapping,
>  			err = ret;
>  			goto fail;
>  		} else if (ret) {
> +			f2fs_bug_on(sbi, index >=
> +				DIV_ROUND_UP(i_size_read(inode), PAGE_SIZE));
>  			return 0;
>  		}
>  	}

If a file has both fs-verity and compression enabled, it can have compressed
clusters past i_size.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
