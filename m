Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5645F2C9551
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  1 Dec 2020 03:40:00 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kjva5-0003c3-GQ; Tue, 01 Dec 2020 02:39:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kjva3-0003bu-QT
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 01 Dec 2020 02:39:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=thfBo3DTlwV4Sn6kjtLxsEtyk/FhDuj4pX5Sisy6fyY=; b=XnoTUAJ6F6cU6IQRWrp7AW4C4C
 jWSg5nphm8PXLYAcm9Qns8PAgSOnhlsq/orNkft3fsJd0RsVMawu5g+DabE+FL9BB4cX1GfcLWbo+
 IPzH+BDjGlQIdFeFW+RLVOAnOI+tgoCgvEvNqeMmVbWvRQpLXf7EyzS4WWqYl5ecDOv0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=thfBo3DTlwV4Sn6kjtLxsEtyk/FhDuj4pX5Sisy6fyY=; b=RipJh1rkVgB+qN7jLGAlsI1Nrq
 /U4GDM3CZtBA0Li+P8BO6RGhTg9L3lzBgZbdTW4LU7VvPndIxfKwoEk1MpLe/Yarq0YUQJ2i0PBEr
 P8US7fs+fPgYMmZfbGtahp+L5NzJR7ZQYTrec5VpgQL8qlRhHNnCU4QqZy1edQ2RnUws=;
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kjvZp-008BuF-Mx
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 01 Dec 2020 02:39:51 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4ClRB729kwz761J;
 Tue,  1 Dec 2020 10:38:55 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.206) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 1 Dec 2020
 10:39:16 +0800
To: Eric Biggers <ebiggers@kernel.org>
References: <20201126103709.80006-1-yuchao0@huawei.com>
 <X7/sCLnVPOjkC9DI@sol.localdomain>
 <7ecb947e-2f8c-abd7-c116-c82c474fded7@huawei.com>
 <X8U1zbBa4IaaSYXV@sol.localdomain>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <11c11980-1cef-eac5-d42a-4acd4d87565c@huawei.com>
Date: Tue, 1 Dec 2020 10:39:15 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <X8U1zbBa4IaaSYXV@sol.localdomain>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.35 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kjvZp-008BuF-Mx
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: compress: add compress_inode to
 cache compressed blocks
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/12/1 2:11, Eric Biggers wrote:
> On Fri, Nov 27, 2020 at 09:01:47AM +0800, Chao Yu wrote:
>> On 2020/11/27 1:55, Eric Biggers wrote:
>>> On Thu, Nov 26, 2020 at 06:37:09PM +0800, Chao Yu wrote:
>>>> Support to use address space of inner inode to cache compressed block,
>>>> in order to improve cache hit ratio of random read.
>>>>
>>>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
>>>
>>> If the file is also encrypted, are the compressed pages that are cached still
>>> encrypted, or are they decrypted?
>>
>> In current implementation, they are decrypted in cache.
>>
> 
> One of the things the FS_IOC_REMOVE_ENCRYPTION key ioctl is supposed to
> accomplish is evicting all the pagecache pages for all encrypted files that were
> using a particular key.  This happens as a consequence of the ioctl evicting the
> inodes that were using that key.  If the user is also using the init_on_free=1
> kernel command-line option to enable automatic zeroing of all freed memory, that
> should cause those inode's pagecache pages (which contain decrypted data) to be
> zeroed, so that they can't be compromised later by an online attack.
> 
> This new filesystem-wide cache containing decrypted pages might break that.  It
> sounds like when an inode is evicted, its cached pages won't necessarily be
> evicted from this new filesystem-wide cache.

Correct.

> 
> Can you ensure that pages get evicted from this new cache when the inode to
> which they belong is evicted?

Not yet with current implementation, let me consider to find a way to make sure
all cached compressed pages being evicted during f2fs_evict_inode().

Thanks,

> 
> - Eric
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
