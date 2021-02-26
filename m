Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 41380325B84
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Feb 2021 03:14:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lFSeL-0000fk-Nm; Fri, 26 Feb 2021 02:14:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1lFSeK-0000fd-09
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 26 Feb 2021 02:14:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GuuoejmmAHKXgWprSo5W0XdO3OLbBPSQwwIFvWfIa8A=; b=e1NbDw/Od6p/YupUFhqpIzW1/M
 J046GXBDnI+Dy0D7U+5w/b+la74Qs26oZwe+IkDinDv0eCtNv+wBMj9HWawgzs+Hsk+BwKV6OZ0xg
 qVtJwU0RNwyxDWCOTgR2mrm1QyZySI7j7D7imIyU1fj3UiLy5oKt+/UDGI0gWNdyd2ZI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GuuoejmmAHKXgWprSo5W0XdO3OLbBPSQwwIFvWfIa8A=; b=Z4AaYU29t6u++SjGdyZ/+ntsvl
 gHfQmy9TfMCkcuj3ImFJCMbZ94mU75CGAALPh+yYTrTDWLEK3O5rrWhIKjwPhbKX6CXG2VVlHZ7ck
 LH8OGTC/ukOZ31WK/dkD3o54lxNon0PeA9WdKRX3oGznN9ixZ65LrowE8I+1caJSBlDQ=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lFSeD-005jMY-UK
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 26 Feb 2021 02:14:35 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DmtTC6kgVzMf1Q;
 Fri, 26 Feb 2021 10:12:15 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by smtp.huawei.com
 (10.3.19.204) with Microsoft SMTP Server (TLS) id 14.3.498.0; Fri, 26 Feb
 2021 10:14:13 +0800
To: Geert Uytterhoeven <geert@linux-m68k.org>, Masahiro Yamada
 <masahiroy@kernel.org>
References: <20210222125916.4168804-1-geert@linux-m68k.org>
 <CAK7LNARxO6O7aRwzJ+i9hEGvWBTCukpwGBC6B79c7UdO=f0Ymw@mail.gmail.com>
 <CAMuHMdX-t4Z27RnWn0Sp1AoO3A=+aT8GXkcGC5gSArtm+W9w1Q@mail.gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <f1e9abe1-6c43-cefc-276b-d36fec72e4a4@huawei.com>
Date: Fri, 26 Feb 2021 10:14:08 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdX-t4Z27RnWn0Sp1AoO3A=+aT8GXkcGC5gSArtm+W9w1Q@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.4 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lFSeD-005jMY-UK
Subject: Re: [f2fs-dev] [PATCH] f2fs: compress: Allow modular
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Geert,

On 2021/2/23 15:42, Geert Uytterhoeven wrote:
>> I checked the code in menu_finalize(), and this seems to work like this.
>>
>> I discussed the oddity of the select behavior before
>> (https://lore.kernel.org/linux-kbuild/e1a6228d-1341-6264-d97a-e2bd52a65c82@infradead.org/),
>> but I was not confident about what the right direction was.
>>
>>
>> Anyway, the behavior is obscure from the current code.
>>
>> If you want to make this more robust,
>> you can write as follows:
>>
>> config F2FS_FS
>>          tristate "F2FS filesystem support"
>>          depends on BLOCK
>>          select NLS
>>          select CRYPTO
>>          select CRYPTO_CRC32
>>          select F2FS_FS_XATTR if FS_ENCRYPTION
>>          select FS_ENCRYPTION_ALGS if FS_ENCRYPTION
>>          select LZO_COMPRESS if F2FS_FS_LZO
>>          select LZO_DECOMPRESS if F2FS_FS_LZO
>>          select LZ4_COMPRESS if F2FS_FS_LZ4
>>          select LZ4_DECOMPRESS if F2FS_FS_LZ4
>>          select LZ4HC_COMPRESS if F2FS_FS_LZ4HC
>>          select ZSTD_COMPRESS if F2FS_FS_ZSTD
>>          select ZSTD_DECOMPRESS if F2FS_FS_ZSTD
>>
>> The code is a bit clumsy, but it is clear
>> that the module (F2FS_FS) is selecting the
>> compress/decompress libraries.
> Actually the above is what I tried first ;-)  Works fine.
> 
> Then I started to look for similar cases in other file systems (e.g.
> EROFS_FS_ZIP), and discovered the issue doesn't happen there, which
> sparked my investigation.  So I settled on the direct dependency,
> because it keeps all compression-related logic together.

It looks above way is more explicit, how about using your previous implementation?

Thank,

> 
> Gr{oetje,eeting}s,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
