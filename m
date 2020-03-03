Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 52682176A37
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Mar 2020 02:51:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j8wiG-0007xR-8F; Tue, 03 Mar 2020 01:51:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1j8wiE-0007xK-CV
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Mar 2020 01:51:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iVgrgvdk/sIAluO6LAkr4M4izIPRt6xK2gxhb3EuUmI=; b=hYSiSy2sAnQbHMndfYv4SKzlAO
 77yUOtwKSFjUkw/7HHvHC53lJbQwMODg6veyStoAYoc/05LiI45+oMWY6LRbhWtWiGtC/S6pzTWxq
 dQGCjgAG+oJJuIvy5zQAbYl+AO48JywN+nVFFLRl2iPOoz83ZeCf3+BzFCXwoFa7XNY0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iVgrgvdk/sIAluO6LAkr4M4izIPRt6xK2gxhb3EuUmI=; b=Q6U6UcfoXYXV6ieQYvTN37Dxkd
 gQUxU4BBkAr7Reyf2dYjQfTjJiJq/HSrTFw9OtbQaGKDVrKmOyNje5cO+uGumLXQZH7ZU068osUsf
 0Ktt9MLcvhL50DWTLoZwIP7z0EQMONelPifPVsvV9781ApOA3XPNDXeuOyhIzCeaFVDQ=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j8wiA-00F7Mt-Km
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Mar 2020 01:51:10 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id D4F04A19C6B7C1797461;
 Tue,  3 Mar 2020 09:50:57 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.210) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 3 Mar 2020
 09:50:53 +0800
To: Eric Biggers <ebiggers@kernel.org>
References: <20200228111456.11311-1-yuchao0@huawei.com>
 <20200302175014.GA98133@gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <efce624c-1247-4519-576b-fd60c0a03cb0@huawei.com>
Date: Tue, 3 Mar 2020 09:50:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200302175014.GA98133@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1j8wiA-00F7Mt-Km
Subject: Re: [f2fs-dev] [PATCH] f2fs: compress: support zstd compress
 algorithm
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/3/3 1:50, Eric Biggers wrote:
> On Fri, Feb 28, 2020 at 07:14:56PM +0800, Chao Yu wrote:
>> Add zstd compress algorithm support, use "compress_algorithm=zstd"
>> mountoption to enable it.
>>
>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
>> ---
>>  Documentation/filesystems/f2fs.txt |   4 +-
>>  fs/f2fs/Kconfig                    |   9 ++
>>  fs/f2fs/compress.c                 | 151 +++++++++++++++++++++++++++++
>>  fs/f2fs/f2fs.h                     |   2 +
>>  fs/f2fs/super.c                    |   7 ++
>>  include/trace/events/f2fs.h        |   3 +-
>>  6 files changed, 173 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/filesystems/f2fs.txt b/Documentation/filesystems/f2fs.txt
>> index 4eb3e2ddd00e..b1a66cf0e967 100644
>> --- a/Documentation/filesystems/f2fs.txt
>> +++ b/Documentation/filesystems/f2fs.txt
>> @@ -235,8 +235,8 @@ checkpoint=%s[:%u[%]]     Set to "disable" to turn off checkpointing. Set to "en
>>                         hide up to all remaining free space. The actual space that
>>                         would be unusable can be viewed at /sys/fs/f2fs/<disk>/unusable
>>                         This space is reclaimed once checkpoint=enable.
>> -compress_algorithm=%s  Control compress algorithm, currently f2fs supports "lzo"
>> -                       and "lz4" algorithm.
>> +compress_algorithm=%s  Control compress algorithm, currently f2fs supports "lzo",
>> +                       "lz4" and "zstd" algorithm.
>>  compress_log_size=%u   Support configuring compress cluster size, the size will
>>                         be 4KB * (1 << %u), 16KB is minimum size, also it's
>>                         default size.
>> diff --git a/fs/f2fs/Kconfig b/fs/f2fs/Kconfig
>> index f0faada30f30..bb68d21e1f8c 100644
>> --- a/fs/f2fs/Kconfig
>> +++ b/fs/f2fs/Kconfig
>> @@ -118,3 +118,12 @@ config F2FS_FS_LZ4
>>  	default y
>>  	help
>>  	  Support LZ4 compress algorithm, if unsure, say Y.
>> +
>> +config F2FS_FS_ZSTD
>> +	bool "ZSTD compression support"
>> +	depends on F2FS_FS_COMPRESSION
>> +	select ZSTD_COMPRESS
>> +	select ZSTD_DECOMPRESS
>> +	default y
>> +	help
>> +	  Support ZSTD compress algorithm, if unsure, say Y.
>> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
>> index bd3ea01db448..c8e1175eaf4e 100644
>> --- a/fs/f2fs/compress.c
>> +++ b/fs/f2fs/compress.c
>> @@ -11,6 +11,7 @@
>>  #include <linux/backing-dev.h>
>>  #include <linux/lzo.h>
>>  #include <linux/lz4.h>
>> +#include <linux/zstd.h>
>>  
>>  #include "f2fs.h"
>>  #include "node.h"
>> @@ -291,6 +292,151 @@ static const struct f2fs_compress_ops f2fs_lz4_ops = {
>>  };
>>  #endif
>>  
>> +#ifdef CONFIG_F2FS_FS_ZSTD
>> +#define F2FS_ZSTD_DEFAULT_CLEVEL	1
>> +
>> +static int zstd_init_compress_ctx(struct compress_ctx *cc)
>> +{
>> +	return 0;
>> +}
>> +
>> +static void zstd_destroy_compress_ctx(struct compress_ctx *cc)
>> +{
>> +}
>> +
>> +static int zstd_compress_pages(struct compress_ctx *cc)
>> +{
>> +	ZSTD_parameters params;
>> +	ZSTD_CStream *stream;
>> +	ZSTD_inBuffer inbuf;
>> +	ZSTD_outBuffer outbuf;
>> +	void *workspace;
>> +	unsigned int workspace_size;
>> +	int src_size = cc->rlen;
>> +	int dst_size = src_size - PAGE_SIZE - COMPRESS_HEADER_SIZE;
>> +	int ret;
>> +
>> +	params = ZSTD_getParams(F2FS_ZSTD_DEFAULT_CLEVEL, src_size, 0);
>> +	workspace_size = ZSTD_CStreamWorkspaceBound(params.cParams);
>> +
>> +	workspace = f2fs_kvmalloc(F2FS_I_SB(cc->inode),
>> +					workspace_size, GFP_NOFS);
>> +	if (!workspace)
>> +		return -ENOMEM;
>> +
>> +	stream = ZSTD_initCStream(params, 0,
>> +					workspace, workspace_size);
> 
> Why is this allocating the memory for every compression operation, instead of
> ahead of time in ->init_compress_ctx()?

Actually, zstd decompression flow needs workspace like its compression flow,
however I realized that we don't have related callback interfaces in decompress
path, so I just add all steps of {,de}compression into .{,de}compress_pages()
functions.

In order to not break callback function fwk of compression, how about adding
{init,destroy}_decompress_ctx() callback interfaces, and relocating
initialization and destroy step into correct callback functions?

Thanks,

> 
> - Eric
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
