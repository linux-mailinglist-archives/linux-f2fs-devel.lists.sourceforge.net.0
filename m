Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E4070632D5D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 21 Nov 2022 20:53:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oxCrA-0005Ig-D5;
	Mon, 21 Nov 2022 19:53:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1oxCr8-0005Ia-Oq
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Nov 2022 19:53:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Au7blebG2Z7v3oFPnLEDt4I23MCnuZkt4bQxruQ30r4=; b=YBz50BxavsG92it42BYwv1FmkJ
 adcWGH3y2HGKFaUt1tqJM3bqPmNao3SStUFf2OnS6J6ZACXWp8K948i9tZzw8VHxVQZ0cCy6B3fqG
 SFCTZmbik3u66PHVC5H2TBHBz99watjg7y60rhgvkahoAUpBAlkwVqEQBJqoj/1ESbdk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Au7blebG2Z7v3oFPnLEDt4I23MCnuZkt4bQxruQ30r4=; b=IkvVMcGfHdOmwzh1GI2YlGBzKk
 Kqed7n4oz/3DS601GqnSiqPjyQ/TAdUqItyIQ0ekVgMr9Eo/2ochUJNywS7UmhJqIKsAZ4nlMarrR
 zUI0EICb9S9dR2yD0t5Z7X20/X8hOT5EA/WjOjIezDsR3RboJR9MJA+FdJozdI1GBYSc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oxCr8-0007n3-6y for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Nov 2022 19:53:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CD35F6145C;
 Mon, 21 Nov 2022 19:53:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B19FC433D6;
 Mon, 21 Nov 2022 19:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669060400;
 bh=3dlSKEhAYmmduNklStCZmmskfXVee144acr5/2TLiuk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rqJPBshdW+noo4YH9I311IFgmabxU2tzeI3nVxV9nSRACSqc5mYCG3aAvYaUeBO3X
 ASF5j1SiRQLP8ooF6Zz7Je4aR/nsXelKewhTeKQ2vpKdqzHgSC7VAwFThnSaCYTspl
 HlEulRBtTNXBTFXXZUpIDVWJnD9GM6tjpW84Kxsnt/nac5IY6b4ai/HJ4OV9daN9Ek
 JQmiTh/rN3nxBfFfVb1WeNrL5V8YGaEbtlQG/gpKNL/s3NLkQSbON3Q6MF0Jk33by+
 FJQyFQazAeKmBzu60bzWx4xV77wmzlSlCUQG4sOtqnjPDqSGR4aJ0Jrjko2fjqvHOP
 Ssczx/D/sBtVQ==
Date: Mon, 21 Nov 2022 19:53:19 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Alexander Potapenko <glider@google.com>
Message-ID: <Y3vXL3Lw+DnVkQYC@gmail.com>
References: <20221121112134.407362-1-glider@google.com>
 <20221121112134.407362-3-glider@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221121112134.407362-3-glider@google.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Nov 21, 2022 at 12:21:32PM +0100, Alexander Potapenko
 wrote: > When aops->write_begin() does not initialize fsdata, KMSAN may report
 > an error passing the latter to aops->write_end(). > > Fix [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oxCr8-0007n3-6y
Subject: Re: [f2fs-dev] [PATCH 3/5] fs: f2fs: initialize fsdata in
 pagecache_write()
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
Cc: tytso@mit.edu, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, adilger.kernel@dilger.ca,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Nov 21, 2022 at 12:21:32PM +0100, Alexander Potapenko wrote:
> When aops->write_begin() does not initialize fsdata, KMSAN may report
> an error passing the latter to aops->write_end().
> 
> Fix this by unconditionally initializing fsdata.
> 
> Suggested-by: Eric Biggers <ebiggers@kernel.org>
> Fixes: 95ae251fe828 ("f2fs: add fs-verity support")
> Signed-off-by: Alexander Potapenko <glider@google.com>
> ---
>  fs/f2fs/verity.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/verity.c b/fs/f2fs/verity.c
> index c352fff88a5e6..3f4f3295f1c66 100644
> --- a/fs/f2fs/verity.c
> +++ b/fs/f2fs/verity.c
> @@ -81,7 +81,7 @@ static int pagecache_write(struct inode *inode, const void *buf, size_t count,
>  		size_t n = min_t(size_t, count,
>  				 PAGE_SIZE - offset_in_page(pos));
>  		struct page *page;
> -		void *fsdata;
> +		void *fsdata = NULL;
>  		int res;
>  
>  		res = aops->write_begin(NULL, mapping, pos, n, &page, &fsdata);

Reviewed-by: Eric Biggers <ebiggers@google.com>

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
