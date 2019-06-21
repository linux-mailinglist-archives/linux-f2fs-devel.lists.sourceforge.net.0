Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDE24F099
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 22 Jun 2019 00:00:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1heRZx-0001P9-0g; Fri, 21 Jun 2019 22:00:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1heRZv-0001P2-Vd
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Jun 2019 22:00:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DAz33CmX+qeQfzoLlMnOdqzeWcDDa/RxJp8TPD4IV44=; b=msp923iPYk8wSUAt8fUod5MtnN
 JT7GN1byQs3ewjSJRi7aAo4915QBLH+R3jjjrZaR1J9jyHZU8Axfq+3IBbs9GBf1qgm2AGA38rdB6
 k/14u8nvAUNvb/HLS1BKL0uOpwiPg2F9lSxOiy4J6Jg165gzqUFr3G6t7HCQekS9pWHI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DAz33CmX+qeQfzoLlMnOdqzeWcDDa/RxJp8TPD4IV44=; b=cvbQH5nWX0B9tR8CdxQhLYxfaE
 hK56Sk+tt9mgqw4zQiJCRcqLRgKhCFLHiHA2ll/d9mtnWev9sWM/MssMa59iKCdhJzc1h9GwH2wqY
 brK+H2Me9od3DB44rYy12MN4QjlHn7iIbK1ZWMbFnGjgYQqd+mjjCNbEwGd1WYbv5WmE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1heRZw-008CYL-ME
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Jun 2019 22:00:17 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 05E6120679;
 Fri, 21 Jun 2019 22:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561154410;
 bh=hUnaoo5Fb3iD0gMCezjWig2sF2hiXRU9hbzHDO5W2lA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tSfkN83sBckuomdVEtOy4k3noQiM89Lmivj0BzVuvFLSEdTbiw7IaDsGirwrQerw/
 MW4Dqx+UYmefgeEdCRAP32VCR2cAaFOlIb2y53zDI6KZ6fMGMqL3UjvZ0vDOk6EUWj
 9gQs/C4xiuuXjWZ+2QiLjWqlFcg60PmwhQ8pcMYw=
Date: Fri, 21 Jun 2019 15:00:08 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Chandan Rajendra <chandan@linux.ibm.com>
Message-ID: <20190621220007.GE167064@gmail.com>
References: <20190616160813.24464-1-chandan@linux.ibm.com>
 <20190616160813.24464-4-chandan@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190616160813.24464-4-chandan@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 2.4 (++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 3.8 FSL_HELO_FAKE          No description available.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -1.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1heRZw-008CYL-ME
Subject: Re: [f2fs-dev] [PATCH V3 3/7] fscrypt: remove struct fscrypt_ctx
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
Cc: tytso@mit.edu, linux-f2fs-devel@lists.sourceforge.net, hch@infradead.org,
 linux-fscrypt@vger.kernel.org, adilger.kernel@dilger.ca,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sun, Jun 16, 2019 at 09:38:09PM +0530, Chandan Rajendra wrote:
> -/**
> - * fscrypt_get_ctx() - Get a decryption context
> - * @gfp_flags:   The gfp flag for memory allocation
> - *
> - * Allocate and initialize a decryption context.
> - *
> - * Return: A new decryption context on success; an ERR_PTR() otherwise.
> - */
> -struct fscrypt_ctx *fscrypt_get_ctx(gfp_t gfp_flags)
> -{
> -	struct fscrypt_ctx *ctx;
> -	unsigned long flags;
> -
> -	/*
> -	 * First try getting a ctx from the free list so that we don't have to
> -	 * call into the slab allocator.
> -	 */
> -	spin_lock_irqsave(&fscrypt_ctx_lock, flags);
> -	ctx = list_first_entry_or_null(&fscrypt_free_ctxs,
> -					struct fscrypt_ctx, free_list);
> -	if (ctx)
> -		list_del(&ctx->free_list);
> -	spin_unlock_irqrestore(&fscrypt_ctx_lock, flags);
> -	if (!ctx) {
> -		ctx = kmem_cache_zalloc(fscrypt_ctx_cachep, gfp_flags);
> -		if (!ctx)
> -			return ERR_PTR(-ENOMEM);
> -		ctx->flags |= FS_CTX_REQUIRES_FREE_ENCRYPT_FL;
> -	} else {
> -		ctx->flags &= ~FS_CTX_REQUIRES_FREE_ENCRYPT_FL;
> -	}
> -	return ctx;
> -}
> -EXPORT_SYMBOL(fscrypt_get_ctx);

FS_CTX_REQUIRES_FREE_ENCRYPT_FL is no longer used, so should be removed.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
