Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9186E3E160A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  5 Aug 2021 15:49:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mBdkh-00037C-Nb; Thu, 05 Aug 2021 13:49:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <chao@kernel.org>) id 1mBdkg-00036y-1C
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 05 Aug 2021 13:49:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=keJTNZEO3c3lqLHXjW5Vdjg3FpZbuoYOSoynSn79FNU=; b=W2eLZzsZzRquBhE6BZmo6cn+ML
 xSpT/RrzhPHiwgvyo8dnYX+XtLX0ewujKA8ViJSgpajF6QFwjHWLJGJJlmd//ADQMOkFCskRIu8dj
 uiqrcWnxjL2d0/z779Ad8tbJrYiEaGLoVMlqF8iIM++xm2A8LyvX19CUKcvK+OuCS0Ws=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=keJTNZEO3c3lqLHXjW5Vdjg3FpZbuoYOSoynSn79FNU=; b=UXafGCbOmzXwMJMjzg9e2nPwpr
 OsHeaP4XMiFqZnY++Vs4IJ9pXptPpFUuwEiC1FrdZJPljBSoX3LyuRtvmkznHkYzE9OK+jUM6V4eG
 XY4FaX76GWQE4c/db3jjro8D/ANh/Y5XjNld2aLr4QE0nJQD3Xl9xl/zGleOCv/a3CwE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mBdke-00061h-3P
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 05 Aug 2021 13:49:37 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 85C136113C;
 Thu,  5 Aug 2021 13:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628171370;
 bh=5fYdOE+SvhIaViGDce04NeXByPmfDOo0xZmV7y6rHGc=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=d0Bj0XqaaUisl1Ast872dXyKMs88fEj9Wp098dOBxbyjn0B/0dVuBe/twXdLpodq5
 5Le1eX22Gk48J+dzJX5QcxPD3fcEoAyH9T1j0iA+C97q5vl011tbWL6E6oCuGpmRhE
 biiu6/S6nb81mFwHgcEvbnDAKxn0+JpJgZu8feFuQ1IbWbFDmHirjO7NhGt5ajOSZs
 XNNMEl661b7NPgCXVWWmX1Xx1ilBA95+Nl9te+P1v8GZBAV953d+6H9zZDLrLIqQJR
 eAvmkpus7Jg1kb0hpWWcn6oTNgxz0DqasZvOz+zs5PRJqM/dhQz7oZMvsWWd4InrKE
 ddriESDVSCr3w==
To: Tiezhu Yang <yangtiezhu@loongson.cn>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <1628170224-13239-1-git-send-email-yangtiezhu@loongson.cn>
From: Chao Yu <chao@kernel.org>
Message-ID: <23f17a0a-7d0a-97c1-246f-994b8ffecc8d@kernel.org>
Date: Thu, 5 Aug 2021 21:49:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <1628170224-13239-1-git-send-email-yangtiezhu@loongson.cn>
Content-Language: en-US
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: loongson.cn]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mBdke-00061h-3P
Subject: Re: [f2fs-dev] [PATCH] f2fs: Kconfig: clean up config options about
 compression
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/8/5 21:30, Tiezhu Yang wrote:
> In fs/f2fs/Kconfig, F2FS_FS_LZ4HC depends on F2FS_FS_LZ4 and F2FS_FS_LZ4
> depends on F2FS_FS_COMPRESSION, so no need to make F2FS_FS_LZ4HC depends
> on F2FS_FS_COMPRESSION explicitly, remove the redudant "depends on", do
> the similar thing for F2FS_FS_LZORLE.
> 
> At the same time, it is better to move F2FS_FS_LZORLE next to F2FS_FS_LZO,
> it looks like a little more clear when make menuconfig, the location of
> "LZO-RLE compression support" is under "LZO compression support" instead
> of "F2FS compression feature".
> 
> Without this patch:
> 
> F2FS compression feature
>    LZO compression support
>    LZ4 compression support
>      LZ4HC compression support
>    ZSTD compression support
>    LZO-RLE compression support
> 
> With this patch:
> 
> F2FS compression feature
>    LZO compression support
>      LZO-RLE compression support
>    LZ4 compression support
>      LZ4HC compression support
>    ZSTD compression support
> 
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
