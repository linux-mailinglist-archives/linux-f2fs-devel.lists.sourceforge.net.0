Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DED139F30
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Jan 2020 02:52:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1irBNW-0001Qf-UR; Tue, 14 Jan 2020 01:52:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1irBNV-0001QR-IC
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Jan 2020 01:52:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TKW6anJiDDzICMJXzhcaOB05A2K2bZmu8Uf+9cIJ49M=; b=HOfcavSM0bAEE3NT0hOO4xePPY
 QlEeUEakwMct70CIRqrOHR1g/bq+ZFyyKGeiMuF2igRtSgn8l1B+qrcUJr9NyBlFM4j7zTqJ3yPHJ
 l7htMO8hX4z6q/vx/Qwk7WH5iu7D12eP4ZYVPKXy6zV7ack8Xzh9FAHu+z3Z0UI9RBbc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TKW6anJiDDzICMJXzhcaOB05A2K2bZmu8Uf+9cIJ49M=; b=lx6CXCSNOZznncdFF4alBzZ1gv
 FdOQU4tS9HAPsxgO4DIvOb8OqHe+MljnH+Qmnf9ieA7cyle4+0y2I6+/uKMAhGpmagKviheM2ESVB
 1c47o6asGNr4+z6B0xS8mXTGnSaM00r52i8TvEpPOK3qGEebdA01W4k57+uBih6LkmJg=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1irBNT-001qqr-JW
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Jan 2020 01:52:21 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 68C3BD61D8DC748DF313;
 Tue, 14 Jan 2020 09:52:09 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.204) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 14 Jan
 2020 09:52:07 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <7a579223-39d4-7e51-c361-4aa592b2500d@huawei.com>
 <20200102181832.GA1953@jaegeuk-macbookpro.roam.corp.google.com>
 <20200102190003.GA7597@jaegeuk-macbookpro.roam.corp.google.com>
 <d51f0325-6879-9aa6-f549-133b96e3eef5@huawei.com>
 <94786408-219d-c343-70f2-70a2cc68dd38@huawei.com>
 <20200106181620.GB50058@jaegeuk-macbookpro.roam.corp.google.com>
 <20200110235214.GA25700@jaegeuk-macbookpro.roam.corp.google.com>
 <3776cb0b-4b18-ae0d-16a7-a591bec77a5e@huawei.com>
 <20200111180200.GA36424@jaegeuk-macbookpro.roam.corp.google.com>
 <72418aa5-7d2a-de26-f0b5-9c839f0c3404@huawei.com>
 <20200113161120.GA49290@jaegeuk-macbookpro.roam.corp.google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <326f0049-936c-7dc4-52c3-aa64e13b2cc6@huawei.com>
Date: Tue, 14 Jan 2020 09:52:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200113161120.GA49290@jaegeuk-macbookpro.roam.corp.google.com>
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
X-Headers-End: 1irBNT-001qqr-JW
Subject: Re: [f2fs-dev] [RFC PATCH v5] f2fs: support data compression
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/1/14 0:11, Jaegeuk Kim wrote:
> On 01/13, Chao Yu wrote:
>> On 2020/1/12 2:02, Jaegeuk Kim wrote:
>>> On 01/11, Chao Yu wrote:
>>>> On 2020/1/11 7:52, Jaegeuk Kim wrote:
>>>>> On 01/06, Jaegeuk Kim wrote:
>>>>>> On 01/06, Chao Yu wrote:
>>>>>>> On 2020/1/3 14:50, Chao Yu wrote:
>>>>>>>> This works to me. Could you run fsstress tests on compressed root directory?
>>>>>>>> It seems still there are some bugs.
>>>>>>>
>>>>>>> Jaegeuk,
>>>>>>>
>>>>>>> Did you mean running por_fsstress testcase?
>>>>>>>
>>>>>>> Now, at least I didn't hit any problem for normal fsstress case.
>>>>>>
>>>>>> Yup. por_fsstress
>>>>>
>>>>> Please check https://github.com/jaegeuk/f2fs/commits/g-dev-test.
>>>>> I've fixed
>>>>> - truncation offset
>>>>> - i_compressed_blocks and its lock coverage
>>>>> - error handling
>>>>> - etc
>>>>
>>>> I changed as below, and por_fsstress stops panic the system.
>>>>
>>>> Could you merge all these fixes into original patch?
>>>
>>> Yup, let m roll up some early patches first once test results become good.
>>
>> I didn't encounter issue any more, how about por_fsstress test result in your
>> enviornment? If there is, please share the call stack with me.
> 
> Sure, will do, once I hit an issue. BTW, I'm hitting another unreacheable nat
> entry issue during por_stress without compression. :(

Did you enable any features during por_fsstress test?

I only hit below warning during por_fsstress test on image w/o compression.

------------[ cut here ]------------
WARNING: CPU: 10 PID: 33483 at fs/fs-writeback.c:1448 __writeback_single_inode+0x28c/0x340
Call Trace:
 writeback_single_inode+0xad/0x120
 sync_inode_metadata+0x3d/0x60
 f2fs_sync_inode_meta+0x90/0xe0 [f2fs]
 block_operations+0x17c/0x360 [f2fs]
 f2fs_write_checkpoint+0x101/0xff0 [f2fs]
 f2fs_sync_fs+0xa8/0x130 [f2fs]
 f2fs_do_sync_file+0x19c/0x880 [f2fs]
 do_fsync+0x38/0x60
 __x64_sys_fsync+0x10/0x20
 do_syscall_64+0x5f/0x220
 entry_SYSCALL_64_after_hwframe+0x44/0xa9

Thanks,

> 
> Thanks,
> 
>>
>> Thanks,
>>
>>>
>>>>
>>>> >From bb17d7d77fe0b8a3e3632a7026550800ab9609e9 Mon Sep 17 00:00:00 2001
>>>> From: Chao Yu <yuchao0@huawei.com>
>>>> Date: Sat, 11 Jan 2020 16:58:20 +0800
>>>> Subject: [PATCH] f2fs: compress: fix f2fs_put_rpages_mapping()
>>>>
>>>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
>>>> ---
>>>>  fs/f2fs/compress.c | 30 +++++++++++++++---------------
>>>>  1 file changed, 15 insertions(+), 15 deletions(-)
>>>>
>>>> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
>>>> index 502cd0ddc2a7..5c6a31d84ce4 100644
>>>> --- a/fs/f2fs/compress.c
>>>> +++ b/fs/f2fs/compress.c
>>>> @@ -74,18 +74,10 @@ static void f2fs_put_compressed_page(struct page *page)
>>>>  }
>>>>
>>>>  static void f2fs_drop_rpages(struct compress_ctx *cc,
>>>> -		struct address_space *mapping, int len, bool unlock)
>>>> +					int len, bool unlock)
>>>>  {
>>>>  	unsigned int i;
>>>>  	for (i = 0; i < len; i++) {
>>>> -		if (mapping) {
>>>> -			pgoff_t start = start_idx_of_cluster(cc);
>>>> -			struct page *page = find_get_page(mapping, start + i);
>>>> -
>>>> -			put_page(page);
>>>> -			put_page(page);
>>>> -			cc->rpages[i] = NULL;
>>>> -		}
>>>>  		if (!cc->rpages[i])
>>>>  			continue;
>>>>  		if (unlock)
>>>> @@ -97,18 +89,25 @@ static void f2fs_drop_rpages(struct compress_ctx *cc,
>>>>
>>>>  static void f2fs_put_rpages(struct compress_ctx *cc)
>>>>  {
>>>> -	f2fs_drop_rpages(cc, NULL, cc->cluster_size, false);
>>>> +	f2fs_drop_rpages(cc, cc->cluster_size, false);
>>>>  }
>>>>
>>>>  static void f2fs_unlock_rpages(struct compress_ctx *cc, int len)
>>>>  {
>>>> -	f2fs_drop_rpages(cc, NULL, len, true);
>>>> +	f2fs_drop_rpages(cc, len, true);
>>>>  }
>>>>
>>>>  static void f2fs_put_rpages_mapping(struct compress_ctx *cc,
>>>> -				struct address_space *mapping, int len)
>>>> +				struct address_space *mapping,
>>>> +				pgoff_t start, int len)
>>>>  {
>>>> -	f2fs_drop_rpages(cc, mapping, len, false);
>>>> +	int i;
>>>> +	for (i = 0; i < len; i++) {
>>>> +		struct page *page = find_get_page(mapping, start + i);
>>>> +
>>>> +		put_page(page);
>>>> +		put_page(page);
>>>> +	}
>>>>  }
>>>>
>>>>  static void f2fs_put_rpages_wbc(struct compress_ctx *cc,
>>>> @@ -680,7 +679,8 @@ static int prepare_compress_overwrite(struct compress_ctx *cc,
>>>>
>>>>  		if (!PageUptodate(page)) {
>>>>  			f2fs_unlock_rpages(cc, i + 1);
>>>> -			f2fs_put_rpages_mapping(cc, mapping, cc->cluster_size);
>>>> +			f2fs_put_rpages_mapping(cc, mapping, start_idx,
>>>> +					cc->cluster_size);
>>>>  			f2fs_destroy_compress_ctx(cc);
>>>>  			goto retry;
>>>>  		}
>>>> @@ -714,7 +714,7 @@ static int prepare_compress_overwrite(struct compress_ctx *cc,
>>>>  unlock_pages:
>>>>  	f2fs_unlock_rpages(cc, i);
>>>>  release_pages:
>>>> -	f2fs_put_rpages_mapping(cc, mapping, i);
>>>> +	f2fs_put_rpages_mapping(cc, mapping, start_idx, i);
>>>>  	f2fs_destroy_compress_ctx(cc);
>>>>  	return ret;
>>>>  }
>>>> -- 
>>>> 2.18.0.rc1
>>>>
>>>>
>>>>
>>>>>
>>>>> One another fix in f2fs-tools as well.
>>>>> https://github.com/jaegeuk/f2fs-tools
>>>>>
>>>>>>
>>>>>>>
>>>>>>> Thanks,
>>>>> .
>>>>>
>>> .
>>>
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
