Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A7307326AF1
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 27 Feb 2021 02:13:04 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lFoAG-0002Qq-2t; Sat, 27 Feb 2021 01:13:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1lFoAE-0002QZ-78
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 27 Feb 2021 01:12:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=I639RZBnieyCYVWr7hz4XI0tUImnNSEkxEfTOMxvJyQ=; b=ZJcEeTwozLkqg4l/jVt9H29R5L
 38VlppKwUAtydsm4aONc3jrPwmkIP6B9CsEE5liY7Rlnryesc0Nua30+1/GpPXtGV8fPKlYjgFQTz
 bytZ1WTWeF4qFqRSX44W1bcgj0yCO5hXirMMk76XfcuMS163ojcCZzlmmftYbabxvu7k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=I639RZBnieyCYVWr7hz4XI0tUImnNSEkxEfTOMxvJyQ=; b=JrlyLe2s3luhuV6EnEM3cCCXmg
 p/elZFzyHE1MuFi3IBsp6awqtFh1mJ92B6iPx0Z9E220/s9dhXOjyeeDXb6EGWZHmUIf0R5sxuuVz
 aPAzpmOjtZWw9RLniE66vUX2k12kiSXosP47Y/oHwRxX5WVS9ck4GwyfrR+0018Rv86Y=;
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lFoA8-00073Y-Px
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 27 Feb 2021 01:12:58 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4DnT4907d3z7qtt;
 Sat, 27 Feb 2021 09:11:05 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by smtp.huawei.com
 (10.3.19.212) with Microsoft SMTP Server (TLS) id 14.3.498.0; Sat, 27 Feb
 2021 09:12:40 +0800
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20210226155142.2909545-1-geert@linux-m68k.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <c77e72ad-fa15-db64-7348-7b1a34b6153f@huawei.com>
Date: Sat, 27 Feb 2021 09:12:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20210226155142.2909545-1-geert@linux-m68k.org>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linux-m68k.org]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.35 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.3 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lFoA8-00073Y-Px
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: compress: Allow modular
 (de)compression algorithms
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
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-kbuild@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/2/26 23:51, Geert Uytterhoeven wrote:
> If F2FS_FS is modular, enabling the compressions options
> F2FS_FS_{LZ4,LZ4HZ,LZO,LZORLE,ZSTD} will make the (de)compression
> algorithms {LZ4,LZ4HC,LZO,ZSTD}_{,DE}COMPRESS builtin instead of
> modular, as the former depend on an intermediate boolean
> F2FS_FS_COMPRESSION, which in-turn depends on tristate F2FS_FS.
> 
> Indeed, if a boolean symbol A depends directly on a tristate symbol B
> and selects another tristate symbol C:
> 
>      tristate B
> 
>      tristate C
> 
>      bool A
>        depends on B
>        select C
> 
> and B is modular, then C will also be modular.
> 
> However, if there is an intermediate boolean D in the dependency chain
> between A and B:
> 
>      tristate B
> 
>      tristate C
> 
>      bool D
>        depends on B
> 
>      bool A
>        depends on D
>        select C
> 
> then the modular state won't propagate from B to C, and C will be
> builtin instead of modular.
> 
> As modular dependency propagation through intermediate symbols is
> obscure, fix this in a robust way by moving the selection of tristate
> (de)compression algorithms from the boolean compression options to the
> tristate main F2FS_FS option.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
