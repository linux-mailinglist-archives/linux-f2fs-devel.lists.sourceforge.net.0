Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CD670B247
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 May 2023 02:01:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q0szG-00037D-47;
	Mon, 22 May 2023 00:01:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dlemoal@kernel.org>) id 1q0szE-000377-QT
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 May 2023 00:01:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Bc2SFUlPnAI2ZKM+5CchupBEQ4vBGBqrCqPp9AWv4II=; b=cSd+UmwVxur2g5TWsVPjv7I92+
 xLsmYA1XLMTulrMjpo8OtG7KI5uSzI9AHmZle68u88hXRTxIa3VuZD4xaUtca/rTBq9uXvScmp6vv
 fq7yBdk1rRYRo2+26qfRrsLNWGcKcUP8bgu6z0WeE0uD4V6fkxdVKEtnrZUtGxbjE+U4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Bc2SFUlPnAI2ZKM+5CchupBEQ4vBGBqrCqPp9AWv4II=; b=Snrr1KsZ/Jn1sgfJz6toSgYIEI
 nM9BhRVyhXQHIaDBpGu8wwugczVhl+UMeqUPR2eU+nupbR9fsPr4bUxn6ajkzU1TEJi4tY5d2GkKT
 FCucEvXPojmivmDsV/HpgxrNTLQYlmnHrXVkx6wlMKHjDFxTo00LYDLlUqMGUhDpdTeU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q0szD-0004pT-1x for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 May 2023 00:01:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 98CB961846;
 Mon, 22 May 2023 00:01:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DC2DC433D2;
 Mon, 22 May 2023 00:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684713669;
 bh=LUd+HLV5GvAukIRTA3zMsj3Wi8CWTQ9goQe7KtJAgHQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Kk4kRfPbbTACy3HBRfR53PIciolvFXLafPUIvBzIIaJxzfuC6EFAkT4x++AFsbuaE
 UuSH1ecPhhtlnjPxykbWpj2QhKYfH+I9/+UG/FpdlLCzA+Aybo3M/TZL7hKn1etep6
 bKTf8mIm/Bqm0iwPBwy/hKYaFXNL6MBg6quCgdeyCI3/SXXIM5E3+FEa8zKs9akvd2
 ADmTIg/oK5AjJlytXI1gq43N62j17HXU1JY9EejDLMDRl+7qeYgk7r/CP1e7BguG1a
 rzyFRiE4z9v686KnqK0luN21wPha2g4uGAQRJJwbeaMhiak/4HLQBy/5ShCOhAST67
 I9tsUEuuNKaUQ==
Message-ID: <5c66fe46-13eb-d9d2-e107-cc48eb50688f@kernel.org>
Date: Mon, 22 May 2023 09:01:05 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Matthew Wilcox <willy@infradead.org>
References: <20230519093521.133226-1-hch@lst.de>
 <20230519093521.133226-8-hch@lst.de>
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20230519093521.133226-8-hch@lst.de>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/19/23 18:35, Christoph Hellwig wrote: > All callers of
 iomap_file_buffered_write need to updated ki_pos, move it > into common code.
 > > Signed-off-by: Christoph Hellwig <hch@lst.de> One nit below. 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q0szD-0004pT-1x
Subject: Re: [f2fs-dev] [PATCH 07/13] iomap: update ki_pos in
 iomap_file_buffered_write
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
Cc: "Darrick J. Wong" <djwong@kernel.org>, linux-mm@kvack.org,
 Andreas Gruenbacher <agruenba@redhat.com>, Miklos Szeredi <miklos@szeredi.hu>,
 cluster-devel@redhat.com, Ilya Dryomov <idryomov@gmail.com>,
 linux-ext4@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-block@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 Xiubo Li <xiubli@redhat.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>,
 "open list:F2FS FILE SYSTEM" <linux-f2fs-devel@lists.sourceforge.net>,
 linux-xfs@vger.kernel.org, Anna Schumaker <anna@kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 5/19/23 18:35, Christoph Hellwig wrote:
> All callers of iomap_file_buffered_write need to updated ki_pos, move it
> into common code.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

One nit below.

Acked-by: Damien Le Moal <dlemoal@kernel.org>

> diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
> index 063133ec77f49e..550525a525c45c 100644
> --- a/fs/iomap/buffered-io.c
> +++ b/fs/iomap/buffered-io.c
> @@ -864,16 +864,19 @@ iomap_file_buffered_write(struct kiocb *iocb, struct iov_iter *i,
>  		.len		= iov_iter_count(i),
>  		.flags		= IOMAP_WRITE,
>  	};
> -	int ret;
> +	ssize_t ret;
>  
>  	if (iocb->ki_flags & IOCB_NOWAIT)
>  		iter.flags |= IOMAP_NOWAIT;
>  
>  	while ((ret = iomap_iter(&iter, ops)) > 0)
>  		iter.processed = iomap_write_iter(&iter, i);
> -	if (iter.pos == iocb->ki_pos)
> +
> +	if (unlikely(ret < 0))

Nit: This could be if (unlikely(ret <= 0)), no ?

>  		return ret;
> -	return iter.pos - iocb->ki_pos;
> +	ret = iter.pos - iocb->ki_pos;
> +	iocb->ki_pos += ret;
> +	return ret;


-- 
Damien Le Moal
Western Digital Research



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
