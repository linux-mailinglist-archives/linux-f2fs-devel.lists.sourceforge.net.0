Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D0C8CFFF
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Aug 2019 11:48:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hxpsz-0004qG-8h; Wed, 14 Aug 2019 09:48:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hxpsy-0004q4-6G
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 14 Aug 2019 09:48:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hFjNdn8sZ8pXjmR7EUZ67C4ki4+4CzEL5bIdh9Q/8Tw=; b=D7q/nOKaErtmSOkl6C/y5hJE76
 1Re9eqjYO7zseqhFjw1kbwnd60dnA10A0PTJ8CTUiXuBeYcgogqVnbmlERJEU9T+YGr4QGk1kiPvx
 Fmvl9+Ggsx307w/li+8lSbSxkw5IRZScYZMtCpc6lSRCYmN18y+cZ0aobjfJyoF+cyT8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hFjNdn8sZ8pXjmR7EUZ67C4ki4+4CzEL5bIdh9Q/8Tw=; b=Nb93GuYuFCIzLbmkuLPBnL9VdA
 PuYloUDWkW/FTe6fTO/64SM/OtTTaaCLU42Vmgs33RM8BVXHnGI4iDs3PZqPCC69zl76GKsBKLFjL
 9Op4XVPOMB040S2J4RTV+84zw0zS3Q/L4QvZaDo6jW6P6Res0tEXb7uxYmR4sns0ZQQQ=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hxpsw-003LHU-BV
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 14 Aug 2019 09:48:04 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 68B20F69E3843215B19B
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 14 Aug 2019 17:47:55 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.206) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 14 Aug
 2019 17:47:50 +0800
To: Ju Hyung Park <qkrwngud825@gmail.com>
References: <20190812225211.1737-1-qkrwngud825@gmail.com>
 <c5fbcb16-c7b2-988d-2110-8ce53a6137f6@huawei.com>
 <CAD14+f3bu8WqCE5jAqR968p=DvUqronR8QCg_EhgFD9x2PJQeA@mail.gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <aea1a700-7d31-9b39-8f30-b6acf1fd8a21@huawei.com>
Date: Wed, 14 Aug 2019 17:47:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAD14+f3bu8WqCE5jAqR968p=DvUqronR8QCg_EhgFD9x2PJQeA@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hxpsw-003LHU-BV
Subject: Re: [f2fs-dev] [PATCH 1/2] mkfs.f2fs: add "zip" to cold data types
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Ju Hyung,

On 2019/8/14 17:20, Ju Hyung Park wrote:
> Hi Chao,
> 
> On Wed, Aug 14, 2019 at 10:47 AM Chao Yu <yuchao0@huawei.com> wrote:
>> In android, as I see, most zip file is small-sized log type, and will be removed
>> after a roll-back, such as:
>>
>> time1: create log1.zip
>> time2: create log2.zip
>> time3: create log3.zip
>> time4: remove log1.zip, rename log2.zip -> log1.zip; rename log3.zip ->
>> log2.zip; create log3.zip
>>
>> I suggest we can keep zip type in android as warm type with IPU mode to avoid
>> fragmentation caused by small holes in cold area. In linux distro, I agreed to
>> treat zip as cold type.
> 
> I actually thought your original suggestion of adding "zip" was to
> handle big zip files under /sdcard(/data/media).
> 
> The one case you've mentioned will be entirely dependent on which apps
> user's using.

Yeah, actually, now I didn't see much large zip file in my external storage,
most of them are xxxKB or xMB, some of them looks very old tho. :)

> In case of mine, I don't have any zip files under /data that's
> seemingly used for logs.

Huawei cell phone has log file with .zip/.gz type locating in /data/log/... can
you search that directory?

If we relocate them into cold area, they will make holes in cold area crazily,
as they have small size and will be created/unlinked frequently.

Thanks,

> 
> Thanks,
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
