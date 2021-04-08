Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B4A357947
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  8 Apr 2021 03:01:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lUJ3L-00042W-98; Thu, 08 Apr 2021 01:01:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <ebiggers@kernel.org>) id 1lUJ3K-00042Q-LT
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 08 Apr 2021 01:01:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HRdOv8XWEN6pduLbv8Z++q7FZaa+QUJ6ozBiD0S8iuY=; b=JTCnl/ndLtJzYYeLuRyveT0rwb
 pc0j7Vas7CQ4CXtMnDw3VRFIfmd8/I5B1lW/NMqpKBoskZVsl9+4tsqXfj7Hvcn3+8kPBjIsl+dus
 QuGJtvhLBAU1QbZwl4dVmggbzZFOg5c54JgkLuCXD5GR8jc4Aeh0Sbxzn67qKiVq/d7Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HRdOv8XWEN6pduLbv8Z++q7FZaa+QUJ6ozBiD0S8iuY=; b=AVz4AdVj2W4cPBtrOwWgkSAsCw
 Vt5LqonL7L1CludQ7PI2jgoXYmyr21G/bEPEOdMT73POZr3+s6xtL9378b0x4sD1auw9PeA949FZf
 1PcIFiWi0BjbqdAmpPnbx56uaxit0QfejXUzuE4luKBw73tkzSTjtdZxXQa0BciSrsCw=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lUJ3E-001jBH-TN
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 08 Apr 2021 01:01:46 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id CDABE6121E;
 Thu,  8 Apr 2021 01:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617843688;
 bh=4u5tOpeCMncpEEQTHvI1+RnAHtrGNOf7zF8rhQ0eQbI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f1IAmgDh/ajJXxqKR9vXpvbxKyFaWcCycgnCj0Czvr6yiCvIbQQqLEttUcyroC3iz
 +b+B8zQ14heqrSnyfEi5fUdZyyJmW0vIMazvd2wIwAnoCcpMwd0k+tXBmDgOLi/8IJ
 +AsOkm5cNi0GdTcNjikrbtPCvU5K/55cv6csvcuPqAtWDIXFB79v9Du4F4WiuO49Go
 p0wTQekgcBuRylR/AP+Z+ncpt9dg2Ypv9RpIXnG+H3egdTZapV+MDYQLDhZ4ciHjlS
 BdGYyUCH6GZ0C2BlVAP2EUdTP7SwusqsGPZFVNO8Mpg2L54LBtBbN8FCS3M+Rlytg8
 PyJ1mhozAsknA==
Date: Wed, 7 Apr 2021 18:01:26 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Shreeya Patel <shreeya.patel@collabora.com>
Message-ID: <YG5V5l2pD3DCiyVA@gmail.com>
References: <20210407144845.53266-1-shreeya.patel@collabora.com>
 <20210407144845.53266-5-shreeya.patel@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210407144845.53266-5-shreeya.patel@collabora.com>
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lUJ3E-001jBH-TN
Subject: Re: [f2fs-dev] [PATCH v7 4/4] fs: unicode: Add utf8 module and a
 unicode layer
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
Cc: tytso@mit.edu, drosen@google.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel@collabora.com,
 adilger.kernel@dilger.ca, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 andre.almeida@collabora.com, linux-ext4@vger.kernel.org, krisman@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Apr 07, 2021 at 08:18:45PM +0530, Shreeya Patel wrote:
> diff --git a/fs/unicode/Kconfig b/fs/unicode/Kconfig
> index 2c27b9a5cd6c..0c69800a2a37 100644
> --- a/fs/unicode/Kconfig
> +++ b/fs/unicode/Kconfig
> @@ -2,13 +2,31 @@
>  #
>  # UTF-8 normalization
>  #
> +# CONFIG_UNICODE will be automatically enabled if CONFIG_UNICODE_UTF8
> +# is enabled. This config option adds the unicode subsystem layer which loads
> +# the UTF-8 module whenever any filesystem needs it.
>  config UNICODE
> -	bool "UTF-8 normalization and casefolding support"
> +	bool
> +
> +config UNICODE_UTF8
> +	tristate "UTF-8 module"
> +	select UNICODE
>  	help
> -	  Say Y here to enable UTF-8 NFD normalization and NFD+CF casefolding
> -	  support.
> +	  Say M here to enable UTF-8 NFD normalization and NFD+CF casefolding
> +	  support as a loadable module or say Y for building it into the kernel.
> +
> +	  utf8data.h_shipped has a large database table which is an
> +	  auto-generated decodification trie for the unicode normalization
> +	  functions and it is not necessary to carry this large table in the
> +	  kernel. Hence, enabling UNICODE_UTF8 as M will allow you to avoid
> +	  carrying this large table into the kernel and module will only be
> +	  loaded whenever required by any filesystem.
> +	  Please note, in this case utf8 module will only be available after
> +	  booting into the compiled kernel. If your filesystem requires it to
> +	  have utf8 during boot time then you should have it built into the
> +	  kernel by saying Y here to avoid boot failure.

This help text seems to contradict itself; it says "it is not necessary to carry
this large table in the kernel", and then later it says that in some cases it is
in fact necessary.

It would also be helpful for the help text to mention which filesystems actually
support this feature.

> diff --git a/fs/unicode/unicode-core.c b/fs/unicode/unicode-core.c
> index 730dbaedf593..d9e9e410893d 100644
> --- a/fs/unicode/unicode-core.c
> +++ b/fs/unicode/unicode-core.c
> @@ -1,228 +1,132 @@
>  /* SPDX-License-Identifier: GPL-2.0 */
>  #include <linux/module.h>
>  #include <linux/kernel.h>
> -#include <linux/string.h>
>  #include <linux/slab.h>
> -#include <linux/parser.h>
>  #include <linux/errno.h>
>  #include <linux/unicode.h>
> -#include <linux/stringhash.h>
> +#include <linux/spinlock.h>
>  
> -#include "utf8n.h"
> +DEFINE_SPINLOCK(utf8mod_lock);

This spinlock should be 'static'.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
