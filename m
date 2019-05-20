Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9EF229E8
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 May 2019 04:18:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hSXst-0008FF-NG; Mon, 20 May 2019 02:18:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hSXsr-0008F7-LG
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 May 2019 02:18:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=abcJBx/SSacS2QltnBesuBBMktPHTJgFiJqgMW9tg6k=; b=BzuP5+J7bpmUytLm5iGsaHAwm/
 QwmtKXh430/bJRH+rAb6geYv8kAq8W9aQR5ugomS6v5pwc9izUVbTYZp+Vysa9sKKL0zw6R1knSw8
 IKPIpiNvgKgXkb+gjdkO76pXRU97Fydov1thN0248B9sTnkgvmFUEjbLELIXsJr9cKyg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=abcJBx/SSacS2QltnBesuBBMktPHTJgFiJqgMW9tg6k=; b=jNxQ+Rn8jz8RDO4t9uI2p0Esvt
 PQEUcRerMDqNcURG0YNOAAKFiuUTcQKcpl7UqR8IENwHWaforLWWGCZn6mFvPOeTZIXYTNcx0taQg
 aBR5bVqhG4pSh09rrV22CzcTnBvnT1ili7RSWN4RT5lVL6Pe1+iVwJkAlUvlYij0cXPM=;
Received: from szxga08-in.huawei.com ([45.249.212.255] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hSXsp-00FjNi-G8
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 May 2019 02:18:37 +0000
Received: from DGGEMM405-HUB.china.huawei.com (unknown [172.30.72.57])
 by Forcepoint Email with ESMTP id 06C4DC0161858EB250BF;
 Mon, 20 May 2019 10:18:29 +0800 (CST)
Received: from dggeme763-chm.china.huawei.com (10.3.19.109) by
 DGGEMM405-HUB.china.huawei.com (10.3.20.213) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 20 May 2019 10:18:28 +0800
Received: from [10.134.22.195] (10.134.22.195) by
 dggeme763-chm.china.huawei.com (10.3.19.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 20 May 2019 10:18:28 +0800
To: Ju Hyung Park <qkrwngud825@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20190426022554.56393-1-yuchao0@huawei.com>
 <CAD14+f0f9fKMmzNYXzoPD9W5CrECwvmGLi2a8EphfyZhTPjvnA@mail.gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <df9a51b0-b634-2b08-d849-e04bc5a44df8@huawei.com>
Date: Mon, 20 May 2019 10:18:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAD14+f0f9fKMmzNYXzoPD9W5CrECwvmGLi2a8EphfyZhTPjvnA@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-ClientProxiedBy: dggeme720-chm.china.huawei.com (10.1.199.116) To
 dggeme763-chm.china.huawei.com (10.3.19.109)
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hSXsp-00FjNi-G8
Subject: Re: [f2fs-dev] [PATCH v2 2/2] f2fs: relocate chksum_offset for
 large_nat_bitmap feature
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

On 2019/5/20 1:31, Ju Hyung Park wrote:
> Hi Jaegeuk and Chao,
> 
> I was semi-forced today to use the new kernel and test f2fs.
> 
> My Ubuntu initramfs got a bit wonky and I had to boot into live CD and
> fix some stuffs. The live CD was using 4.15 kernel, and just mounting
> the f2fs partition there corrupted f2fs and my 4.19(with 5.1-rc1-4.19
> f2fs-stable merged) refused to mount with "SIT is corrupted node"
> message.
> 
> I used the latest f2fs-tools sent by Chao including "fsck.f2fs: fix to
> repair cp_loads blocks at correct position"
> 
> It spit out 140M worth of output, but at least I didn't have to run it
> twice. Everything returned "Ok" in the 2nd run.
> The new log is at
> http://arter97.com/f2fs/final
> 
> After fixing the image, I used my 4.19 kernel with 5.2-rc1-4.19
> f2fs-stable merged and it mounted.
> 
> But, I got this:
> [    1.047791] F2FS-fs (nvme0n1p3): layout of large_nat_bitmap is
> deprecated, run fsck to repair, chksum_offset: 4092
> [    1.081307] F2FS-fs (nvme0n1p3): Found nat_bits in checkpoint
> [    1.161520] F2FS-fs (nvme0n1p3): recover fsync data on readonly fs
> [    1.162418] F2FS-fs (nvme0n1p3): Mounted with checkpoint version = 761c7e00
> 
> But after doing a reboot, the message is gone:
> [    1.098423] F2FS-fs (nvme0n1p3): Found nat_bits in checkpoint
> [    1.177771] F2FS-fs (nvme0n1p3): recover fsync data on readonly fs
> [    1.178365] F2FS-fs (nvme0n1p3): Mounted with checkpoint version = 761c7eda
> 
> I'm not exactly sure why the kernel detected that I'm still using the
> old layout on the first boot. Maybe fsck didn't fix it properly, or
> the check from the kernel is improper.

The fsck should have fixed layout problem, that's just unnecessary message, we
can avoid it by relocating sanity check of layout.

I've sent one patch for that, and tested with it, it acts as expected. :)

> 
> I also noticed that Jaegeuk sent v1 of this patch to upstream. (Maybe
> that's why the kernel detected old layout?) Please send v2 to upstream
> soon, as running older fsck will cause much more headaches.

Since v1 was upstreamed in 5.2-rc1, I guess we need another patch for that,
maybe in below patch?

[PATCH] f2fs: fix to check layout on last valid checkpoint park

Thanks,

> 
> Thanks.
> 
> 
> On Fri, Apr 26, 2019 at 11:26 AM Chao Yu <yuchao0@huawei.com> wrote:
>>
>> For large_nat_bitmap feature, there is a design flaw:
>>
>> Previous:
>>
>> struct f2fs_checkpoint layout:
>> +--------------------------+  0x0000
>> | checkpoint_ver           |
>> | ......                   |
>> | checksum_offset          |------+
>> | ......                   |      |
>> | sit_nat_version_bitmap[] |<-----|-------+
>> | ......                   |      |       |
>> | checksum_value           |<-----+       |
>> +--------------------------+  0x1000      |
>> |                          |      nat_bitmap + sit_bitmap
>> | payload blocks           |              |
>> |                          |              |
>> +--------------------------|<-------------+
>>
>> Obviously, if nat_bitmap size + sit_bitmap size is larger than
>> MAX_BITMAP_SIZE_IN_CKPT, nat_bitmap or sit_bitmap may overlap
>> checkpoint checksum's position, once checkpoint() is triggered
>> from kernel, nat or sit bitmap will be damaged by checksum field.
>>
>> In order to fix this, let's relocate checksum_value's position
>> to the head of sit_nat_version_bitmap as below, then nat/sit
>> bitmap and chksum value update will become safe.
>>
>> After:
>>
>> struct f2fs_checkpoint layout:
>> +--------------------------+  0x0000
>> | checkpoint_ver           |
>> | ......                   |
>> | checksum_offset          |------+
>> | ......                   |      |
>> | sit_nat_version_bitmap[] |<-----+
>> | ......                   |<-------------+
>> |                          |              |
>> +--------------------------+  0x1000      |
>> |                          |      nat_bitmap + sit_bitmap
>> | payload blocks           |              |
>> |                          |              |
>> +--------------------------|<-------------+
>>
>> Related report and discussion:
>>
>> https://sourceforge.net/p/linux-f2fs/mailman/message/36642346/
>>
>> Reported-by: Park Ju Hyung <qkrwngud825@gmail.com>
>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
>> ---
>> v2:
>> - improve hint message suggested by Ju Hyung.
>> - move verification to f2fs_sanity_check_ckpt().
>>  fs/f2fs/f2fs.h  |  4 +++-
>>  fs/f2fs/super.c | 13 +++++++++++++
>>  2 files changed, 16 insertions(+), 1 deletion(-)
>>
>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>> index 119bc5a9783e..aa71c1aa9eaa 100644
>> --- a/fs/f2fs/f2fs.h
>> +++ b/fs/f2fs/f2fs.h
>> @@ -1909,9 +1909,11 @@ static inline void *__bitmap_ptr(struct f2fs_sb_info *sbi, int flag)
>>         int offset;
>>
>>         if (is_set_ckpt_flags(sbi, CP_LARGE_NAT_BITMAP_FLAG)) {
>> +               unsigned int chksum_size = sizeof(__le32);
>> +
>>                 offset = (flag == SIT_BITMAP) ?
>>                         le32_to_cpu(ckpt->nat_ver_bitmap_bytesize) : 0;
>> -               return &ckpt->sit_nat_version_bitmap + offset;
>> +               return &ckpt->sit_nat_version_bitmap + offset + chksum_size;
>>         }
>>
>>         if (__cp_payload(sbi) > 0) {
>> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
>> index fefc8cc6e756..22241bb866df 100644
>> --- a/fs/f2fs/super.c
>> +++ b/fs/f2fs/super.c
>> @@ -2714,6 +2714,19 @@ int f2fs_sanity_check_ckpt(struct f2fs_sb_info *sbi)
>>                 return 1;
>>         }
>>
>> +       if (__is_set_ckpt_flags(ckpt, CP_LARGE_NAT_BITMAP_FLAG)) {
>> +               unsigned int chksum_offset;
>> +
>> +               chksum_offset = le32_to_cpu(ckpt->checksum_offset);
>> +               if (chksum_offset != CP_MIN_CHKSUM_OFFSET) {
>> +                       f2fs_msg(sbi->sb, KERN_WARNING,
>> +                               "using deprecated layout of large_nat_bitmap, "
>> +                               "please run fsck v1.13.0 or higher to repair, "
>> +                               "chksum_offset: %u", chksum_offset);
>> +                       return 1;
>> +               }
>> +       }
>> +
>>         if (unlikely(f2fs_cp_error(sbi))) {
>>                 f2fs_msg(sbi->sb, KERN_ERR, "A bug case: need to run fsck");
>>                 return 1;
>> --
>> 2.18.0.rc1
>>
>>
>>
>> _______________________________________________
>> Linux-f2fs-devel mailing list
>> Linux-f2fs-devel@lists.sourceforge.net
>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
