Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B74D38D650
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 22 May 2021 17:15:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lkTLZ-0006cM-0L; Sat, 22 May 2021 15:15:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <rdunlap@infradead.org>) id 1lkTLX-0006c2-Jd
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 22 May 2021 15:15:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=M8xEYJUOS1PH8zqwRp4HnULXuuhN/mYcj4cUJQVCOX8=; b=Yy7ieSDqxEGs0QQXvFTIy+jped
 9s6BsTWaisDIN+/2ORLf0qUFJmggoFi1MA3cYDQPrQ1x4UWROAK7FTAPXy/S23LujTO6O0341Uwlu
 mdbDbyuCqsnB2qdxSteH6CJMdDeS5OwDRZMOiQgZEjNowfu5VxBdzV7a3HYHlQS0r8yk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=M8xEYJUOS1PH8zqwRp4HnULXuuhN/mYcj4cUJQVCOX8=; b=bqhs4I70bAV72R2JGc62gEZfb2
 wF9PoHEZQgsP9kw7TLwBUWILpGBf/UFto9IHwwvRPAy8bEkcxsbS9Tktp+MP7V7evl+5D7+WsY9eg
 PWi6N9F43ro9FyStqVEXW7joYPOc2595RmLN8V/de0R+ILpz8ZyTNWy0jm4Zr4NhODSM=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lkTLN-0008KR-Fq
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 22 May 2021 15:15:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=M8xEYJUOS1PH8zqwRp4HnULXuuhN/mYcj4cUJQVCOX8=; b=LnPT1shAR3Mz03jGrAq1VIYXDy
 wTIBxj+XN+tZ+tm3MFi0vs28hDbfUOGVK5k+GuCpdmM7nq1tDLRp8uorsCO//5d7VQq9JcgeEFuCV
 jbN9o4lXwLL/Tk0eZV1XjQ9GFxYamuRUQY5oSt1xGLmIkGXMnTlFD8yrRUl7kuxuGayIn1JdMHOO7
 1tp8IASsKV+YP/Itu4JI+2SrmNSW1fU9QTV2hi4ZCiu8c0AQgfFF9bvaYNqczbePgcKwLp8Bm7acK
 45CGZdU6/i3B2+Ur82wgfAFpxmdD+s5unpQCJBEte4O+CUmAOfBKzuNaTFQgPM7oYOKfOA37qwm37
 xXkiZVzw==;
Received: from [2601:1c0:6280:3f0::7376]
 by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lkTLG-0008dF-Em; Sat, 22 May 2021 15:15:06 +0000
To: Aditya Srivastava <yashsri421@gmail.com>, jaegeuk@kernel.org
References: <d1e7aaa1-4f59-2480-003d-5a5a37443c75@infradead.org>
 <20210522114351.9538-1-yashsri421@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <d9d527e1-f23e-c8a1-cc80-be8a445457cc@infradead.org>
Date: Sat, 22 May 2021 08:15:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210522114351.9538-1-yashsri421@gmail.com>
Content-Language: en-US
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lkTLN-0008KR-Fq
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix kernel-doc syntax and remove
 file name from file header
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
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, lukas.bulwahn@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 5/22/21 4:43 AM, Aditya Srivastava wrote:
> The opening comment mark '/**' is used for highlighting the beginning of
> kernel-doc comments.
> The header for include/linux/f2fs_fs.h follows this syntax, but the
> content inside does not comply with kernel-doc.
> 
> This line was probably not meant for kernel-doc parsing, but is parsed
> due to the presence of kernel-doc like comment syntax(i.e, '/**'), which
> causes unexpected warning from kernel-doc:
> warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>  * include/linux/f2fs_fs.h
> 
> Provide a simple fix by replacing this occurrence with general comment
> format, i.e. '/*', to prevent kernel-doc from parsing it.
> 
> Also remove the redundant file name from the comment headers.
> 
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
> Changes in v2:
> - Remove file name information from header comments, as suggested by Randy
> 
>  include/linux/f2fs_fs.h | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
> index 5487a80617a3..b5a081aa86c4 100644
> --- a/include/linux/f2fs_fs.h
> +++ b/include/linux/f2fs_fs.h
> @@ -1,7 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0
> -/**
> - * include/linux/f2fs_fs.h
> - *
> +/*
>   * Copyright (c) 2012 Samsung Electronics Co., Ltd.
>   *             http://www.samsung.com/
>   */
> 


-- 
~Randy



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
