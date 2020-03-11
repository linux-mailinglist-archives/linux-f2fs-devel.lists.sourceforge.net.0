Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 75AE6180CED
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Mar 2020 01:42:11 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jBpRf-0004c3-7o; Wed, 11 Mar 2020 00:41:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jBpRa-0004bn-I9
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Mar 2020 00:41:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eP5WNAZYYepRHObGpBhPT5soz2yWA2wI4vzYu5Km3LY=; b=SFDo3Ql5LVNzZYwkkTeSn+vJU8
 7QGOkj7RHBcYWDbzVnf3bUJXCnKhvRW/DMN7VWXBqkL0KErps/x3HGuxGmeHmuAd5H0ctZsbvIHhc
 6MVEMga+ECdIuTM0JaeWaW5dM30sqQUczdr4THbt/HCJt0vRMMh35E733BDxsMnKtDig=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eP5WNAZYYepRHObGpBhPT5soz2yWA2wI4vzYu5Km3LY=; b=jxcQvUt3q/a/nd1gE5OV1f1Cgk
 N03XuWgCnepn6tGqUWkRqruOXEGmGVV1j4JbJyvxZ2U9eYUlQMXIgMvDr5Bj/BjIhj3oBwSPsZ2hX
 eMRBHy48W/sHlt5xastTta7OZscTo9VKV6gpBNzt+AjMR80We7E6176Hh4fEa7pgZ2bI=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jBpRW-004NZl-EA
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Mar 2020 00:41:54 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id DCDE26520FF5B53561BA;
 Wed, 11 Mar 2020 08:41:41 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.205) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 11 Mar
 2020 08:41:36 +0800
To: Eric Biggers <ebiggers@kernel.org>
References: <20200310125009.12966-1-yuchao0@huawei.com>
 <20200310161515.GA1067@sol.localdomain>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <4d8384b9-88fe-2a15-13ff-238d9fd4027a@huawei.com>
Date: Wed, 11 Mar 2020 08:41:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200310161515.GA1067@sol.localdomain>
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
X-Headers-End: 1jBpRW-004NZl-EA
Subject: Re: [f2fs-dev] [PATCH 1/5] f2fs: change default compression
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

On 2020/3/11 0:15, Eric Biggers wrote:
> On Tue, Mar 10, 2020 at 08:50:05PM +0800, Chao Yu wrote:
>> Use LZ4 as default compression algorithm, as compared to LZO, it shows
>> almost the same compression ratio and much better decompression speed.
>>
>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
>> ---
>>  fs/f2fs/super.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
>> index db3a63f7c769..ebffe7aa08ee 100644
>> --- a/fs/f2fs/super.c
>> +++ b/fs/f2fs/super.c
>> @@ -1577,7 +1577,7 @@ static void default_options(struct f2fs_sb_info *sbi)
>>  	F2FS_OPTION(sbi).test_dummy_encryption = false;
>>  	F2FS_OPTION(sbi).s_resuid = make_kuid(&init_user_ns, F2FS_DEF_RESUID);
>>  	F2FS_OPTION(sbi).s_resgid = make_kgid(&init_user_ns, F2FS_DEF_RESGID);
>> -	F2FS_OPTION(sbi).compress_algorithm = COMPRESS_LZO;
>> +	F2FS_OPTION(sbi).compress_algorithm = COMPRESS_LZ4;
>>  	F2FS_OPTION(sbi).compress_log_size = MIN_COMPRESS_LOG_SIZE;
>>  	F2FS_OPTION(sbi).compress_ext_cnt = 0;
>>  	F2FS_OPTION(sbi).bggc_mode = BGGC_MODE_ON;
> 
> This makes sense, but it's unclear to me why comparing the different compression
> algorithms is happening just now, after support for both LZO and LZ4 was already
> merged into mainline and now has to be supported forever.  During review months
> ago, multiple people suggested that LZ4 is better than LZO, so there's not much
> reason to support LZO at all.

Agreed,

Jaegeuk, thoughts?

Let me remove lzo if you have no objection on this.

Thanks,

> 
> - Eric
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
