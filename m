Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 210D06E3E6A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 17 Apr 2023 06:14:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1poGFa-0008LD-4r;
	Mon, 17 Apr 2023 04:13:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <rdunlap@infradead.org>) id 1poGFY-0008L4-DC
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Apr 2023 04:13:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cjUNe41VvH2mXa4ae24CHhq9bdg04YCfwHqvB5onTgo=; b=XGnbObF8IZA7J0gtwzM906oXwW
 7hLZlu2EoxS9+/s1jxt/6a3V3MFwAai3PRkBUTyK8AbFCBObEMEFmSJdMTnby2voNjJ8pVa6Fx/Ej
 8YpHRM+TBhQIMOLNaRVQxpE+VzD/RqsSqJmJhH0bn102RD/4OnIoP3LKfpsmAcY0e6gc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cjUNe41VvH2mXa4ae24CHhq9bdg04YCfwHqvB5onTgo=; b=X3aNOe/N05ifeFArB4anjeSlRO
 SidxPxOHi+fFlotwjqJuq1NBPOPno4KncnCADNOCNTtt9nL7egwTxK0CMGCVo6daqijaY4x5tWZSA
 vx7oTIF/kcxfa68JAyJbjpDrxe2iFXH26Po2ajjAm4u0qzPL5KkNYvQzXA4F0VHF9LYI=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1poGFW-00AEWh-8e for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Apr 2023 04:13:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=cjUNe41VvH2mXa4ae24CHhq9bdg04YCfwHqvB5onTgo=; b=F0O4dzD2dLl6jnX832hST1owNY
 hhB9U224pLbhW/7lkE/7/zwx9TvcLSjPC8w1emeO4hQNAWLEthQ1zYldr7bWwII/vuYX6d4ZdsG2b
 2qFyze5Ab3iQJAwXiJWnJuRMD4i4KV6TAO+UwfnYVN4uts3a/t2PWvXZZQA1D+XS5Qn70Shn8CZ8b
 /17dbuyUHUc/udtgUyyNrC+wCTBtkgGAUjqHEof7Jx4Gl8Eiav50AVeLaeDZWFpR4pqyMQQ9EARBg
 2WiLQAFaw5VRe0C5Qi3sTYDzY8LhcCtzAUf/C6AmjfsZZqvI5g2Xw5ymAVt72gRcbFvGRkIqQbBg6
 dLA6LIvA==;
Received: from [2601:1c2:980:9ec0::2764]
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1poGFG-00Ep2u-16; Mon, 17 Apr 2023 04:13:39 +0000
Message-ID: <5961416c-e5d6-9321-3ae8-f63b70d17d63@infradead.org>
Date: Sun, 16 Apr 2023 21:13:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <chao@kernel.org>, Jonathan Corbet <corbet@lwn.net>
References: <20230417040308.46621-1-frank.li@vivo.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230417040308.46621-1-frank.li@vivo.com>
X-Spam-Score: -3.5 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, On 4/16/23 21:03, Yangtao Li wrote: > Let's descrbie it's
 read extent cache. > > Signed-off-by: Yangtao Li <frank.li@vivo.com> > ---
 > Documentation/filesystems/f2fs.rst | 4 ++-- > 1 file changed, 2 i [...]
 Content analysis details:   (-3.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1poGFW-00AEWh-8e
Subject: Re: [f2fs-dev] [PATCH] docs: f2fs: specify extent cache for read
 explicitly
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
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi,

On 4/16/23 21:03, Yangtao Li wrote:
> Let's descrbie it's read extent cache.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>  Documentation/filesystems/f2fs.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
> index c57745375edb..f68337086dec 100644
> --- a/Documentation/filesystems/f2fs.rst
> +++ b/Documentation/filesystems/f2fs.rst
> @@ -163,11 +163,11 @@ barrier			 If this option is set, cache_flush commands are allowed to be
>  fastboot		 This option is used when a system wants to reduce mount
>  			 time as much as possible, even though normal performance
>  			 can be sacrificed.
> -extent_cache		 Enable an extent cache based on rb-tree, it can cache
> +extent_cache		 Enable an read extent cache based on rb-tree, it can cache

			 Enable a read extent cache based on rb-tree. It can cache

>  			 as many as extent which map between contiguous logical

I don't know that that is trying to say. Maybe this?

			 many extents which map between contiguous logical

Does it cache many extents or all of them?  If all of them, then maybe this?

			 the extents which map between contiguous logical

>  			 address and physical address per inode, resulting in
>  			 increasing the cache hit ratio. Set by default.
> -noextent_cache		 Disable an extent cache based on rb-tree explicitly, see
> +noextent_cache		 Disable an read extent cache based on rb-tree explicitly, see

				 Disable a read extent cache based on rb-tree explicitly. See

>  			 the above extent_cache mount option.
>  noinline_data		 Disable the inline data feature, inline data feature is
>  			 enabled by default.

-- 
~Randy


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
