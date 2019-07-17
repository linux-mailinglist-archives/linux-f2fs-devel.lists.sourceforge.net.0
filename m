Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DA36B329
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Jul 2019 03:25:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hnYh5-0007KV-Gn; Wed, 17 Jul 2019 01:25:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hnYh3-0007KO-Uv
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 17 Jul 2019 01:25:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+Z9aDvS4ylyYSXa3LsCAqt8E1EelruEAwZM4CN4+OTg=; b=QBJ/xeOlRPRfnCpLPcHmec/vhw
 8ngxeGG/zFmTgEOxTgVHG0tMbzTWoWA4UiIfiDVKmYQ9Jo4v/AZacBsPak/vBBtD8wXSOoBi1ezcP
 KZ/qAqoIJfKZReCyXTeOag6dZ3G0yQfYMIm6ivK1jFdMWvtNDVbcapi5Ic/0PY9NAeZI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+Z9aDvS4ylyYSXa3LsCAqt8E1EelruEAwZM4CN4+OTg=; b=ZxtxuBn9ay1dRwrM4mnDmpkDVt
 TllGslWbfi0mK0oAsQrPgbhDFV9xYsVQztrVbgLH0/ApEgIUCeHABgTCbjkQHW3sXkXjb8Ev5KVTE
 rJkadZsdcraWjqhgxH9uuUfdSXxN2RwJi2t4PjM3IyodaAWAE/tyuHRGtZRhxt5gny+A=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hnYh1-004ABV-M1
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 17 Jul 2019 01:25:17 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id A8E97EBC09FEFE43D909;
 Wed, 17 Jul 2019 09:25:08 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.204) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 17 Jul
 2019 09:25:03 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
References: <20190626094813.40517-1-yuchao0@huawei.com>
 <7a2e35af-50ce-689d-218a-44b106408d5b@kernel.org>
 <20190716210857.GA5347@jaegeuk-macbookpro.roam.corp.google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <afabbf0f-3b69-80dd-fd89-ede1bafd997f@huawei.com>
Date: Wed, 17 Jul 2019 09:25:02 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190716210857.GA5347@jaegeuk-macbookpro.roam.corp.google.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hnYh1-004ABV-M1
Subject: Re: [f2fs-dev] [PATCH v2] fsck.f2fs: write checkpoint with OPU mode
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

On 2019/7/17 5:08, Jaegeuk Kim wrote:
> On 07/16, Chao Yu wrote:
>> Ping,
> 
> It seems this is still breaking the tests. At some point on fault/power tests,
> I hit fsck is stopped since it's missing one NAT node.
> 
>>
>> On 2019-6-26 17:48, Chao Yu wrote:
>>> +	ret = dev_read(buf, src << F2FS_BLKSIZE_BITS, seg_size);
>>> +	ASSERT(ret >= 0);
>>> +
>>> +	ret = dev_write(buf, dst << F2FS_BLKSIZE_BITS, seg_size);
>>> +	ASSERT(ret >= 0);

My bad, it looks seg_size is wrong, let me send v3...

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
