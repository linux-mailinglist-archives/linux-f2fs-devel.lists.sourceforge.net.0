Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D98C5ACBE0F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Jun 2025 03:10:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7sjArtM/PYW4YNcYQDgt7GBoWF+nej3VOx4izS2k2OM=; b=Hhrx6W7vctTp9tSHgrgvpdbZzh
	a0dT63hHfEDCau6pwqgOOJKjZ1p4m/O2L/SsD5aDZIpuT/jASLpX6d6OMHkLkLvfAUnokQetFyZ5d
	0qGuwPnWmcQVlc5C0uIVEsAe8EGNz8T0uzbUHcVlcDf9LS92v4+COraM1Nn4gX8R8PWQ=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uMGA5-0006p0-RJ;
	Tue, 03 Jun 2025 01:09:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lihongbo22@huawei.com>) id 1uMGA4-0006ou-8h
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Jun 2025 01:09:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:CC:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0KVKTOYrFynSk/TKRMKUw1vMRcnmMdgSEKFUDvivU8A=; b=CBWIYOfFarPzuT96HzauD7+4rX
 Q7pGs0f1Mjkqy62Z7inN+TGKaNpPuOdmK3n7c12cKYd9norYAkQodPHuMW0e5gOgWxC39clJCivc2
 ZRNU83OqaxcFG+7dtpiGx0dmCAOZXUW7woY/DO/Bt/QG23HVdyKe9bxZqJ0ptL/p6uAo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0KVKTOYrFynSk/TKRMKUw1vMRcnmMdgSEKFUDvivU8A=; b=ML1gPOzeadBNfxcSb2Q/iHEILc
 Kb9D4FCNAHxNB4OLkITY8AE7Hpbw4RViC+lPegfb6kcXpgaeZy1xYOvYH/Ef+FMUZruZ7dssgT89c
 iwwqHTj5fmczJ+9ZgWqJ9J8vuJoIWxylT/DvABIhH1g/MLswwgLHMEvr8Tsal0olJpUU=;
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uMGA2-0001dj-0W for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Jun 2025 01:09:52 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4bBCLf31Swz27hcD;
 Tue,  3 Jun 2025 09:10:18 +0800 (CST)
Received: from kwepemo500009.china.huawei.com (unknown [7.202.194.199])
 by mail.maildlp.com (Postfix) with ESMTPS id 63FD11A016C;
 Tue,  3 Jun 2025 09:09:27 +0800 (CST)
Received: from [10.67.111.104] (10.67.111.104) by
 kwepemo500009.china.huawei.com (7.202.194.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 3 Jun 2025 09:09:26 +0800
Message-ID: <d23c6219-e2e1-4550-a2b3-8ce8f193c3f1@huawei.com>
Date: Tue, 3 Jun 2025 09:09:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20250602090224.485077-1-lihongbo22@huawei.com>
 <aD3Lzsp-u6KuyGRt@google.com>
Content-Language: en-US
In-Reply-To: <aD3Lzsp-u6KuyGRt@google.com>
X-Originating-IP: [10.67.111.104]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemo500009.china.huawei.com (7.202.194.199)
X-Headers-End: 1uMGA2-0001dj-0W
Subject: Re: [f2fs-dev] [PATCH v4 0/7] f2fs: new mount API conversion
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
From: Hongbo Li via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Hongbo Li <lihongbo22@huawei.com>
Cc: linux-fsdevel@vger.kernel.org, sandeen@redhat.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net



On 2025/6/3 0:05, Jaegeuk Kim wrote:
> Thanks you, Hongbo.
> 
> I just applied this series to the dev-test branch as below, and will
> keep testing with incoming patches together. Let's see. :)
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/log/?h=dev-test
> 
Ok, I will keep following up on this work with Eric.

Thanks,
Hongbo

> On 06/02, Hongbo Li wrote:
>> In this version, we have finished the issues pointed in v3.
>> First, I'd like to express my sincere thanks to Jaegeuk and Chao
>> for reviewing this patch series and providing corrections. I also
>> appreciate Eric for rebasing the patches onto the latest branch to
>> ensure forward compatibility.
>>
>> The latest patch series has addressed all the issues mentioned in
>> the previous set. For modified patches, I've re-added Signed-off-by
>> tags (SOB) and uniformly removed all Reviewed-by tags.
>>
>> v4:
>>    - Change is_remount as bool type in patch 2.
>>    - Remove the warning reported by Dan for patch 5.
>>    - Enhance sanity check and fix some coding style suggested by
>>      Jaegeuk in patch 5.
>>    - Change the log info when compression option conflicts in patch 5.
>>    - Fix the issues reported by code-reviewing in patch 5.
>>    - Context modified in patch 7.
>>
>> V3: https://lore.kernel.org/all/20250423170926.76007-1-sandeen@redhat.com/
>> - Rebase onto git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
>>    dev branch
>> - Fix up some 0day robot warnings
>>
>> (Here is the origianl cover letter:)
>>
>> Since many filesystems have done the new mount API conversion,
>> we introduce the new mount API conversion in f2fs.
>>
>> The series can be applied on top of the current mainline tree
>> and the work is based on the patches from Lukas Czerner (has
>> done this in ext4[1]). His patch give me a lot of ideas.
>>
>> Here is a high level description of the patchset:
>>
>> 1. Prepare the f2fs mount parameters required by the new mount
>> API and use it for parsing, while still using the old API to
>> get mount options string. Split the parameter parsing and
>> validation of the parse_options helper into two separate
>> helpers.
>>
>>    f2fs: Add fs parameter specifications for mount options
>>    f2fs: move the option parser into handle_mount_opt
>>
>> 2. Remove the use of sb/sbi structure of f2fs from all the
>> parsing code, because with the new mount API the parsing is
>> going to be done before we even get the super block. In this
>> part, we introduce f2fs_fs_context to hold the temporary
>> options when parsing. For the simple options check, it has
>> to be done during parsing by using f2fs_fs_context structure.
>> For the check which needs sb/sbi, we do this during super
>> block filling.
>>
>>    f2fs: Allow sbi to be NULL in f2fs_printk
>>    f2fs: Add f2fs_fs_context to record the mount options
>>    f2fs: separate the options parsing and options checking
>>
>> 3. Switch the f2fs to use the new mount API for mount and
>> remount.
>>
>>    f2fs: introduce fs_context_operation structure
>>    f2fs: switch to the new mount api
>>
>> [1] https://lore.kernel.org/all/20211021114508.21407-1-lczerner@redhat.com/
>>
>> Hongbo Li (7):
>>    f2fs: Add fs parameter specifications for mount options
>>    f2fs: move the option parser into handle_mount_opt
>>    f2fs: Allow sbi to be NULL in f2fs_printk
>>    f2fs: Add f2fs_fs_context to record the mount options
>>    f2fs: separate the options parsing and options checking
>>    f2fs: introduce fs_context_operation structure
>>    f2fs: switch to the new mount api
>>
>>   fs/f2fs/super.c | 2108 +++++++++++++++++++++++++++--------------------
>>   1 file changed, 1197 insertions(+), 911 deletions(-)
>>
>> -- 
>> 2.33.0


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
