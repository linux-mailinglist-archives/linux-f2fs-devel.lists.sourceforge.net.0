Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A6A3949C8
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 29 May 2021 03:13:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lmnXW-0002Dt-9K; Sat, 29 May 2021 01:13:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1lmnXU-0002Dk-82
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 29 May 2021 01:13:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:References:CC:To:From:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bYFc3hv4eiT0anQzNnObjZJCyDJPOhxoxhP/vmV9zGQ=; b=fqkkxPBotrLYl0UAIVESUChpj0
 J3cAqhrqhPM+aEiguclk+dDwT7uc6hmseNWsgazweL9IK6lwTa/cr+M5lopNR266RrK8f6zjRBNV/
 +76iJ9Hsefh/jmklEMSJ652b933LKN2IjRDNlx+MIswrXV+Xn4UcgmEG8KU8LXWhEOpQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:References:CC:To:From:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bYFc3hv4eiT0anQzNnObjZJCyDJPOhxoxhP/vmV9zGQ=; b=kIwfs5nT4ihCMUDyEM4ghKXSpd
 +krxTxg5y9+UciuqMQexZ0X1PQ3t+5xlhBuVHVf77Ql3jUB06aCBVbA0IUH5W9Peo/XG8/Q6H0Dvr
 xrhjI2i2+L5F3ADH03eW9l7b/1vo45ILnsj3c22f7h1iSq1dpC4DIXhUrzBu8VcU9Cm4=;
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lmnXM-0007ND-0t
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 29 May 2021 01:13:22 +0000
Received: from dggemx753-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4FsNkD24Mlz669y;
 Sat, 29 May 2021 09:09:24 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by
 dggemx753-chm.china.huawei.com (10.0.44.37) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Sat, 29 May 2021 09:13:03 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <changfengnan@vivo.com>, <jaegeuk@kernel.org>
References: <20210518125113.1712-1-changfengnan@vivo.com>
 <7ad8bae8-6e38-5ff7-add8-fe1023569f43@huawei.com>
 <000001d7515e$458f3db0$d0adb910$@vivo.com>
 <ffdbecea-51ce-69db-6b4d-8ea7eb9c43fc@huawei.com>
Message-ID: <e7655a1d-9c59-36d6-a4c1-225a293d5cc7@huawei.com>
Date: Sat, 29 May 2021 09:13:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <ffdbecea-51ce-69db-6b4d-8ea7eb9c43fc@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-ClientProxiedBy: dggemx702-chm.china.huawei.com (10.1.199.49) To
 dggemx753-chm.china.huawei.com (10.0.44.37)
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lmnXM-0007ND-0t
Subject: Re: [f2fs-dev] =?utf-8?b?562U5aSNOiBbUkZDIFBBVENIXSBmMmZzOiBjb21w?=
 =?utf-8?q?ress=3A_remove_unneeded_read_when_rewrite_whole_cluster?=
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/5/28 10:49, Chao Yu wrote:
> On 2021/5/25 20:05, changfengnan@vivo.com wrote:
>> yes, I just check wheather the whole page was dirty, because of when write
>> cache f2fs_prepare_compress_overwrite will be called again,
>> when update whole cluster,  cc in prepare_compress_overwrite will be empty,
>> so will not submit bio.
>> when only update one page in cluster,  cc in prepare_compress_overwrite will
>> not be empty, so will submit bio.
>> This is my thinking, not sure if I've missed anything
> 
> Well, it looks more like we did for mmap() write case.
> 
> So I guess we can change as below:
> 
> To Jaegeuk, comments?
> 
> ---
>    fs/f2fs/data.c | 2 +-
>    1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 2ea887a114c8..723c59df51b7 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -3323,7 +3323,7 @@ static int f2fs_write_begin(struct file *file, struct address_space *mapping,
>    	}
> 
>    #ifdef CONFIG_F2FS_FS_COMPRESSION
> -	if (f2fs_compressed_file(inode)) {
> +	if (f2fs_compressed_file(inode) && len != PAGE_SIZE) {

It will cause panic in f2fs_write_end() due to miss to assign fsdata with NULL,
updated as below:

---
  fs/f2fs/data.c | 3 +++
  1 file changed, 3 insertions(+)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 2ea887a114c8..4e214ac87925 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3328,6 +3328,9 @@ static int f2fs_write_begin(struct file *file, struct address_space *mapping,

  		*fsdata = NULL;

+		if (len == PAGE_SIZE)
+			goto repeat;
+
  		ret = f2fs_prepare_compress_overwrite(inode, pagep,
  							index, fsdata);
  		if (ret < 0) {
-- 
2.29.2

Thanks,

>    		int ret;
> 
>    		*fsdata = NULL;
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
