Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 798572D3DAA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Dec 2020 09:43:06 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kmv3e-000695-4g; Wed, 09 Dec 2020 08:42:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kmv3b-00068k-Ni
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Dec 2020 08:42:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:References:CC:To:From:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9muWXIWigDMmV/icy4INHBzlQHFCw+63Mi2Af+3GDPM=; b=gkU/rLBpFY9oVrlyucYzdg3fl5
 YR5ImxSTT4ubES/bEAQElM4mX/v0ptOlJes7Ynoe8rs3ICn5hnnF9d68zz2QUjWvEVQtrYOtgR/0L
 XTZO9EJ+8ss2G8wtDK0EpI2g//j/k+v8kn3LZ1IB2+i9vnwbX7+oxSjX+AR+S5kuepcA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:References:CC:To:From:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9muWXIWigDMmV/icy4INHBzlQHFCw+63Mi2Af+3GDPM=; b=T8G4Uvrbgp/uF9W7+69+1AcD5c
 qclkPgN+j34HqS09ytgf0VqOsbvhih9O5VCEjFjc7aMYTapjTJEHvc9WK+CEXkamgb+XWY0PguIY0
 1FJuTmC4FDNdN3a/MK14WDuDeJTzv19mbgyhL0leXu4AWzrpwl5RHykDxkLLjSG14Mrs=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kmv3P-004hkr-Go
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Dec 2020 08:42:43 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CrVs82s3NzhpgZ;
 Wed,  9 Dec 2020 16:41:48 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.202) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 9 Dec 2020
 16:42:15 +0800
From: Chao Yu <yuchao0@huawei.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20201208031437.56627-1-yuchao0@huawei.com>
 <22ac4df6-53ec-fb7c-c4dd-26435352a701@huawei.com>
 <X9A7Jn+cHRRcAmIi@google.com>
 <37d89d34-add1-5254-380b-233ef7a460d4@huawei.com>
 <X9BKX9PUMFkts9bI@google.com>
 <5398c880-d4d3-81b9-f3c9-765ba1470e96@huawei.com>
 <0d4a20ec-f6e4-ff24-8733-94cc3762195d@huawei.com>
 <X9CJc7xas7OqTZv2@google.com>
 <b3e385d6-b473-c4c9-308d-0285bc71b5b0@huawei.com>
Message-ID: <e773f0bf-16ea-c503-4138-0fd6fabc13a3@huawei.com>
Date: Wed, 9 Dec 2020 16:42:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <b3e385d6-b473-c4c9-308d-0285bc71b5b0@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kmv3P-004hkr-Go
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: compress: support chksum
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

On 2020/12/9 16:31, Chao Yu wrote:
> On 2020/12/9 16:23, Jaegeuk Kim wrote:
>> On 12/09, Chao Yu wrote:
>>> On 2020/12/9 12:28, Chao Yu wrote:
>>>> On 2020/12/9 11:54, Jaegeuk Kim wrote:
>>>>> Ah, could you please write another patch to adjust the new changes?
>>>>
>>>> No problem, will drop "f2fs: compress:support chksum" based on your dev branch, and
>>>> apply all compress related patches on top of dev branch.
>>>
>>> Jaegeuk, could you please
>>> - drop "f2fs: compress:support chksum",
>>
>> What I mean is keeping the old version in dev branch as is, since it gives
>> another conflicts when dropping it. That can add another bug at this point.
>> Can I get a separate patch to fix any issues in that original patch?
> 
> Oops...

The diff is as below:

 From 1ad86c640d3a295292960f6b90802cc5a9be7a0d Mon Sep 17 00:00:00 2001
From: Chao Yu <yuchao0@huawei.com>
Date: Wed, 9 Dec 2020 16:36:58 +0800
Subject: [PATCH] fix_chksum

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
  fs/f2fs/compress.c | 3 +--
  fs/f2fs/compress.h | 0
  2 files changed, 1 insertion(+), 2 deletions(-)
  create mode 100644 fs/f2fs/compress.h

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index f05d409fd0ed..4bcbacfe3325 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -796,7 +796,7 @@ void f2fs_decompress_pages(struct bio *bio, struct page *page, bool verity)

  	ret = cops->decompress_pages(dic);

-	if (!ret && fi->i_compress_flag & 1 << COMPRESS_CHKSUM) {
+	if (!ret && (fi->i_compress_flag & 1 << COMPRESS_CHKSUM)) {
  		u32 provided = le32_to_cpu(dic->cbuf->chksum);
  		u32 calculated = f2fs_crc32(sbi, dic->cbuf->cdata, dic->clen);

@@ -809,7 +809,6 @@ void f2fs_decompress_pages(struct bio *bio, struct page *page, bool verity)
  					provided, calculated);
  			}
  			set_sbi_flag(sbi, SBI_NEED_FSCK);
-			WARN_ON_ONCE(1);
  		}
  	}

diff --git a/fs/f2fs/compress.h b/fs/f2fs/compress.h
new file mode 100644
index 000000000000..e69de29bb2d1
-- 
2.29.2

> 
> Thanks,
> 
>>
>>> - manually fix conflict when applying "f2fs: add compress_mode mount option"
>>> - and then apply last my resent patches.
>>>
>>> Thanks,
>> .
>>
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
