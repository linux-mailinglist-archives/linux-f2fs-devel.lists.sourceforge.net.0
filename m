Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E42D21C6448
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  6 May 2020 01:06:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jW6dp-00065H-Jw; Tue, 05 May 2020 23:06:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jW6do-000656-8m
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 May 2020 23:06:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4Z7mJ6bN/CmngZBaANbQ32K0HDTtu/qt8k8LmwghV50=; b=GXIoMd7SBg6jMdHZ8GyzErbJ+i
 bRuX1MxGuKJdDZk0vHCmcvyQR4k0JI1b+VfP0tkdGXrhJxSkzVU3ZTQEhWujNNhiJ3Ucm1ZVV3O9j
 FXNVG+3bqWf7RTIeD30NazVACp9PC+ZG2TkzY4npJAhfJstfSoYd58KPayWK0ZKT39c4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4Z7mJ6bN/CmngZBaANbQ32K0HDTtu/qt8k8LmwghV50=; b=bOdvipRi5YtVAogupndo0dI5Zv
 z71O4kpm0axpxAmgvQpUCD2KeJuzpNlJifeLTvEQq8o8HC1paDdYUebEkDVRa3R7z3UOgJ8dQunDA
 736K+Cdy3CcEooQAl2UmG0tGwlq+f6VCY/ReFc7TcJECeJquVvqaGl6c3DyH5BqkLsgI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jW6dj-00F58v-0V
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 May 2020 23:06:20 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8E68420658;
 Tue,  5 May 2020 23:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588719959;
 bh=PNbwCvW8rBgUyy4cSZedXBMUal8bA25Ko1sv2PzKrbU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o0oW0T0rIrr4DOBGJsvU1rN5sR2bB9IgnwHUf7LfKJ/z/xSNZ0+w60U6Vpoo/IqOK
 srPE+BquCr0CQJNmqk+wni0ty2ZiHPiuBVVAG6hR5nB38Fwl4IYaxL9G79RzMJetLi
 n1BzgsqYqW6MsARJZReLj7yQP+AcaigeH3fnZq7s=
Date: Tue, 5 May 2020 16:05:59 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <20200505230559.GA203407@google.com>
References: <20200504143039.155644-1-jaegeuk@kernel.org>
 <7177aab9-630e-e077-7005-0023c93134b3@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7177aab9-630e-e077-7005-0023c93134b3@kernel.org>
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jW6dj-00F58v-0V
Subject: Re: [f2fs-dev] [PATCH] f2fs: change maximum zstd compression buffer
 size
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
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 05/05, Chao Yu wrote:
> On 2020-5-4 22:30, Jaegeuk Kim wrote:
> > From: Daeho Jeong <daehojeong@google.com>
> > 
> > Current zstd compression buffer size is one page and header size less
> > than cluster size. By this, zstd compression always succeeds even if
> > the real compression data is failed to fit into the buffer size, and
> > eventually reading the cluster returns I/O error with the corrupted
> > compression data.
> 
> What's the root cause of this issue? I didn't get it.
> 
> > 
> > Signed-off-by: Daeho Jeong <daehojeong@google.com>
> > ---
> >  fs/f2fs/compress.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> > index 4c7eaeee52336..a9fa8049b295f 100644
> > --- a/fs/f2fs/compress.c
> > +++ b/fs/f2fs/compress.c
> > @@ -313,7 +313,7 @@ static int zstd_init_compress_ctx(struct compress_ctx *cc)
> >  	cc->private = workspace;
> >  	cc->private2 = stream;
> > 
> > -	cc->clen = cc->rlen - PAGE_SIZE - COMPRESS_HEADER_SIZE;
> > +	cc->clen = ZSTD_compressBound(PAGE_SIZE << cc->log_cluster_size);
> 
> In my machine, the value is 66572 which is much larger than size of dst
> buffer, so, in where we can tell the real size of dst buffer to zstd
> compressor? Otherwise, if compressed data size is larger than dst buffer
> size, when we flush compressed data into dst buffer, we may suffer overflow.

Could you give it a try compress_log_size=2 and check decompression works?

> 
> >  	return 0;
> >  }
> > 
> > @@ -330,7 +330,7 @@ static int zstd_compress_pages(struct compress_ctx *cc)
> >  	ZSTD_inBuffer inbuf;
> >  	ZSTD_outBuffer outbuf;
> >  	int src_size = cc->rlen;
> > -	int dst_size = src_size - PAGE_SIZE - COMPRESS_HEADER_SIZE;
> > +	int dst_size = cc->clen;
> >  	int ret;
> > 
> >  	inbuf.pos = 0;
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
