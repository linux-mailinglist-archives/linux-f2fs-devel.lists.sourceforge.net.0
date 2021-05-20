Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E82938B6A6
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 20 May 2021 21:03:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ljnxX-0006Lv-1S; Thu, 20 May 2021 19:03:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <rdunlap@infradead.org>) id 1ljnxV-0006Lo-Om
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 20 May 2021 19:03:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=V+JOfDgV7psnkj9YIO5jH92IC9XuEYZaAjsGKe0XexU=; b=dOAlpNIj395gth8f1SZyOiJsDZ
 8VDwDdmTARksxnQtiyDpL1bJH866+HW9G9jhqUXeUmP+sNBFprCePtpY5eKQrQR1k0OxjyygVlX8X
 oIcrn3l1mP99XLZC8mQfK2mkvTHWvRBmcTXNxUQfVbKL2aWKgZ5bDYyghDvADHiWzjZU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=V+JOfDgV7psnkj9YIO5jH92IC9XuEYZaAjsGKe0XexU=; b=Uf4G46O7VoXMUs3nXTACXncL2o
 jEJBw6mGW9sFdw4aak24c+gi3tvzgNwTCFDCqPTfzVNa9mK3f0UM2slBaIQRQtP2CBI4FdQu92XAF
 kXo8R7YYCwxd9AH+VDuaysK0lq0AoUjGWYKLcj6/UzEuoaGqpsDoFzroyzRCr2B//OX0=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1ljnxP-0002Nc-G5
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 20 May 2021 19:03:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=V+JOfDgV7psnkj9YIO5jH92IC9XuEYZaAjsGKe0XexU=; b=xTP5O2cQQJsLksrvH79y45+Bkv
 V3Q2iFmUSM/LouF/+t/bmVFzQeKVSNHXIlfXo1Jr92T4rRrsQaTLADiY45CIz2GaX6gdQO6DTxHbX
 0yndj/n79FqynwJupu6W4GEVL7VFRF6Xm460otL4s6Gz1J/L66YIzPRWylOMkS0PODnR1RM+t9NiT
 k6c6yNfsp4nAjTevHLoYByTs+MOWfIkOX62J86cagaD5m1Q3VvH5gSs3F75LDZHJX+20TAYUkDc4O
 g59DKwmjMI8JC+NaRRO/WTZS5HSdN34JxKrM5ob9p1lfWJbeEJLcUTi7E03hjpGvaxfljBWdZL2PJ
 AAzICuOg==;
Received: from [2601:1c0:6280:3f0::7376]
 by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1ljnVY-00GZnc-28; Thu, 20 May 2021 18:34:56 +0000
To: Aditya Srivastava <yashsri421@gmail.com>, jaegeuk@kernel.org
References: <20210520182933.31965-1-yashsri421@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <d1e7aaa1-4f59-2480-003d-5a5a37443c75@infradead.org>
Date: Thu, 20 May 2021 11:34:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210520182933.31965-1-yashsri421@gmail.com>
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
X-Headers-End: 1ljnxP-0002Nc-G5
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix kernel-doc syntax in file header
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

On 5/20/21 11:29 AM, Aditya Srivastava wrote:
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
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

Even better would be to remove the filename from the file.

Thanks.

> ---
>  include/linux/f2fs_fs.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
> index 5487a80617a3..028d1b18f0e7 100644
> --- a/include/linux/f2fs_fs.h
> +++ b/include/linux/f2fs_fs.h
> @@ -1,5 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0
> -/**
> +/*
>   * include/linux/f2fs_fs.h
>   *
>   * Copyright (c) 2012 Samsung Electronics Co., Ltd.
> 


-- 
~Randy



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
