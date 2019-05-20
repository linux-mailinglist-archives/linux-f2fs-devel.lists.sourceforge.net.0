Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D5F23083
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 May 2019 11:38:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hSek3-0003P1-Li; Mon, 20 May 2019 09:37:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hSek2-0003Ou-VS
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 May 2019 09:37:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hAh47ZM2VtIGMZvDYqV7zj1qMHFDdYB/YlysmxUcwGk=; b=OrRsazbQeJoT65XaxItTEoCO0o
 31RjjzVyflsXedD+4ABiQPPi4EIkBicF0WZVt1RcRz8kdZ4QJ/TEMupgXvSnkwpUW+NdMKU6QXw8E
 yBdcCw/IT3z911nAzhv7kuBGqwlzkZO1hw0TZJS2BBtIF2V+7TlcPlEIm4swLkCkpJs8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hAh47ZM2VtIGMZvDYqV7zj1qMHFDdYB/YlysmxUcwGk=; b=AMIT/uv2L9ibt/3V6u4tJc+fJu
 M4sgEXN+pnkgINyy6jZrlVsvMzEW48m07PhoHo8p0fRlgvsojUw0ieFvA1y+6NNowobwuaIRFkfGx
 /BRCOlQpredu5ht8k2KRbRgq6ZEBeOQ/74KZF0qkSnAVoF0lr/BRvxnhw6uAHpoY7TO0=;
Received: from szxga03-in.huawei.com ([45.249.212.189] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hSejy-00Aogi-F2
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 May 2019 09:37:58 +0000
Received: from DGGEMM403-HUB.china.huawei.com (unknown [172.30.72.53])
 by Forcepoint Email with ESMTP id C183B787BE4C9F1E5592;
 Mon, 20 May 2019 17:37:46 +0800 (CST)
Received: from dggeme763-chm.china.huawei.com (10.3.19.109) by
 DGGEMM403-HUB.china.huawei.com (10.3.20.211) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 20 May 2019 17:37:46 +0800
Received: from [10.134.22.195] (10.134.22.195) by
 dggeme763-chm.china.huawei.com (10.3.19.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 20 May 2019 17:37:45 +0800
To: Hagbard Celine <hagbardcelin@gmail.com>
References: <CADoWrG_NTz29eyaa3fUti2sNBP4xp7-zfhDVkix=Kty4rD=Otw@mail.gmail.com>
 <35b643e5-562c-942d-67ce-4a9dbef66d16@huawei.com>
 <5725124a-95c8-cedb-d3a8-d8be86d260dd@huawei.com>
 <CADoWrG9_5izaUMvB0mNLC7yp_Mnnm7yPrqcOvDL2ERR2YrkF2A@mail.gmail.com>
 <452dad75-a4aa-2366-b704-ee5448a3bd71@huawei.com>
 <CADoWrG9V7nD4wzj0DFDAKcjcZHhjC0yPetX_Ce6jj2_YNpU9YA@mail.gmail.com>
 <274e1288-a2ac-4be8-708e-80e75d30813d@kernel.org>
 <CADoWrG88d5XH5tf9iEz7+Agz553S_DBbvisffzv0d8PuU9Cv7Q@mail.gmail.com>
 <f657d41f-84d6-8cfa-5532-689a03ab2d2e@huawei.com>
 <CADoWrG-RBDWpjTyO4Yz68HRnaUW8OCvCZUkDDmaZM4hR-FNOGA@mail.gmail.com>
 <2390a9e9-2365-6e9b-6e8c-22f4542dda1e@huawei.com>
 <CADoWrG8MbLFJX8joszUdwYw6wE1XXvsV01zF=fLz3VgyRUeZXQ@mail.gmail.com>
 <CADoWrG8w_J4jxpFjCJ4OCR=DXL2Cgo+qpJQoJyXQxh5QFHgkMA@mail.gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <ef707c1c-3548-f512-aee0-2999729c16fd@huawei.com>
Date: Mon, 20 May 2019 17:37:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CADoWrG8w_J4jxpFjCJ4OCR=DXL2Cgo+qpJQoJyXQxh5QFHgkMA@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-ClientProxiedBy: dggeme714-chm.china.huawei.com (10.1.199.110) To
 dggeme763-chm.china.huawei.com (10.3.19.109)
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hSejy-00Aogi-F2
Subject: Re: [f2fs-dev] BUG: kernel stack overflow when mounting with
 data_flush
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
Cc: linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/5/16 1:01, Hagbard Celine wrote:
> 2019-05-15 18:50 GMT+02:00, Hagbard Celine <hagbardcelin@gmail.com>:
>> 2019-05-15 10:13 GMT+02:00, Chao Yu <yuchao0@huawei.com>:
>>> On 2019/5/15 16:03, Hagbard Celine wrote:
>>>> 2019-05-15 4:25 GMT+02:00, Chao Yu <yuchao0@huawei.com>:
>>>>> On 2019/5/15 2:13, Hagbard Celine wrote:
>>>>>> 2019-04-02 15:31 GMT+02:00, Chao Yu <chao@kernel.org>:
>>>>>>> On 2019-4-2 20:41, Hagbard Celine wrote:
>>>>>>>> That seems to have fixed it. No more errors in syslog after
>>>>>>>> extracting
>>>>>>>> my stage3 tarball. Also ran a couple of kernel compiles on a
>>>>>>>> partition
>>>>>>>> mounted with data_flush and system seems stable.
>>>>>>>
>>>>>>> Thanks a lot for your quick test. :)
>>>>>>
>>>>>> My test might have been a little too quick, or I found another
>>>>>> data_flush bug that behaves similar.
>>>>>
>>>>> oops...
>>>>>
>>>>>>>>>
>>>>>>>>> -		if (is_dir)
>>>>>>>>> -			F2FS_I(inode)->cp_task = current;
>>>>>>>>> +		F2FS_I(inode)->cp_task = current;
>>>>>
>>>>> If you're sure that this patch was applying before you test, I guess we
>>>>> need
>>>>> an
>>>>> extra barrier here to avoid out-of-order execution.
>>>>>
>>>>> smp_mb()
>>>>>
>>>>>>>>>
>>>>>>>>>  		filemap_fdatawrite(inode->i_mapping);
>>>>>>>>>
>>>>>>>>> -		if (is_dir)
>>>>>>>>> -			F2FS_I(inode)->cp_task = NULL;
>>>>>>>>> +		F2FS_I(inode)->cp_task = NULL;
>>>>>
>>>>> Thanks,
>>>>>
>>>> If I did this correctly; it did not get rid of the stack overflow.
>>>> Here is what I did:
>>>>
>>>> Added smb_mb() in checkpoint.c so the relevant part looks like this:
>>>>
>>>> 		unsigned long cur_ino = inode->i_ino;
>>>>
>>>> 		F2FS_I(inode)->cp_task = current;
>>>>
>>>> 		smp_mb();
>>>>
>>>> 		filemap_fdatawrite(inode->i_mapping);
>>>>
>>>> 		F2FS_I(inode)->cp_task = NULL;
>>>>
>>>> 		iput(inode);
>>>> 		
>>>>
>>>> Compiled, rebooted and ran my test-scripts again. And got this during
>>>> copy-phase in second script:
>>>
>>> It looks very easy to reproduce this bug, could you add log to track
>>> F2FS_I(inode)->cp_task's value:
>> That wasn't so easy, with all the logging from those prink the copy
>> process would hang where it would oops without the printk's.
> 
> Forgot in last mail that I actually had log from hang with both printk
> enabled also:

Sorry for the delay.

I found another two issues related to data_flush, could you try below fixing patch?

[PATCH] f2fs: fix to avoid deadloop if data_flush is on

Thanks,

> 
> [  194.681126] sync_dirty_inodes: inode:590309, cp_task:0000000013327ef9
> [  194.682258] sync_dirty_inodes: inode:590301, cp_task:0000000013327ef9
> [  194.682665] sync_dirty_inodes: inode:590311, cp_task:0000000013327ef9
> [  194.682703] sync_dirty_inodes: inode:590312, cp_task:0000000013327ef9
> [  194.682791] sync_dirty_inodes: inode:590313, cp_task:0000000013327ef9
> [  194.683566] sync_dirty_inodes: inode:590314, cp_task:0000000013327ef9
> [  194.683669] sync_dirty_inodes: inode:590315, cp_task:0000000013327ef9
> [  194.684829] sync_dirty_inodes: inode:590316, cp_task:0000000013327ef9
> [  194.712860] sync_dirty_inodes: inode:590317, cp_task:0000000013327ef9
> [  194.712908] sync_dirty_inodes: inode:590310, cp_task:0000000013327ef9
> [  194.713094] sync_dirty_inodes: inode:590319, cp_task:0000000013327ef9
> [  194.713348] sync_dirty_inodes: inode:590320, cp_task:0000000013327ef9
> [  194.713384] sync_dirty_inodes: inode:590321, cp_task:0000000013327ef9
> [  194.714634] sync_dirty_inodes: inode:590322, cp_task:0000000013327ef9
> [  194.715349] sync_dirty_inodes: inode:590323, cp_task:0000000013327ef9
> [  194.715381] sync_dirty_inodes: inode:590324, cp_task:0000000013327ef9
> [  194.718592] sync_dirty_inodes: inode:590326, cp_task:0000000013327ef9
> [  194.719217] sync_dirty_inodes: inode:590327, cp_task:0000000013327ef9
> [  194.719354] sync_dirty_inodes: inode:590328, cp_task:0000000013327ef9
> [  194.719903] sync_dirty_inodes: inode:590329, cp_task:0000000013327ef9
> [  194.720859] sync_dirty_inodes: inode:590521, cp_task:0000000013327ef9
> [  194.720868] sync_dirty_inodes: inode:590300, cp_task:0000000013327ef9
> [  194.720985] sync_dirty_inodes: inode:590523, cp_task:0000000013327ef9
> [  194.738075] sync_dirty_inodes: inode:591528, cp_task:0000000013327ef9
> [  194.738168] sync_dirty_inodes: inode:591529, cp_task:0000000013327ef9
> [  194.738190] sync_dirty_inodes: inode:591533, cp_task:0000000013327ef9
> [  194.738263] sync_dirty_inodes: inode:591537, cp_task:0000000013327ef9
> [  194.738275] sync_dirty_inodes: inode:591538, cp_task:0000000013327ef9
> [  194.738307] sync_dirty_inodes: inode:591540, cp_task:0000000013327ef9
> [  194.738312] sync_dirty_inodes: inode:591542, cp_task:0000000013327ef9
> [  194.759368] sync_dirty_inodes: inode:593095, cp_task:0000000013327ef9
> [  194.759587] sync_dirty_inodes: inode:593351, cp_task:0000000013327ef9
> [  194.759797] sync_dirty_inodes: inode:593352, cp_task:0000000013327ef9
> [  194.760555] sync_dirty_inodes: inode:593353, cp_task:0000000013327ef9
> [  194.760562] sync_dirty_inodes: inode:593354, cp_task:0000000013327ef9
> [  194.761168] sync_dirty_inodes: inode:593355, cp_task:0000000013327ef9
> [  194.761207] sync_dirty_inodes: inode:593356, cp_task:0000000013327ef9
> [  194.761234] sync_dirty_inodes: inode:593357, cp_task:0000000013327ef9
> [  194.761251] sync_dirty_inodes: inode:593358, cp_task:0000000013327ef9
> [  194.761285] sync_dirty_inodes: inode:593360, cp_task:0000000013327ef9
> [  194.761290] sync_dirty_inodes: inode:593361, cp_task:0000000013327ef9
> [  194.763583] sync_dirty_inodes: inode:593363, cp_task:0000000013327ef9
> [  194.763845] sync_dirty_inodes: inode:593362, cp_task:0000000013327ef9
> [  194.763891] sync_dirty_inodes: inode:593367, cp_task:0000000013327ef9
> [  194.763992] sync_dirty_inodes: inode:593368, cp_task:0000000013327ef9
> [  194.764073] sync_dirty_inodes: inode:593369, cp_task:0000000013327ef9
> [  194.764090] sync_dirty_inodes: inode:593370, cp_task:0000000013327ef9
> [  194.764165] sync_dirty_inodes: inode:593371, cp_task:0000000013327ef9
> [  194.764185] sync_dirty_inodes: inode:593372, cp_task:0000000013327ef9
> [  194.764214] sync_dirty_inodes: inode:593365, cp_task:0000000013327ef9
> [  194.764323] sync_dirty_inodes: inode:593374, cp_task:0000000013327ef9
> [  194.764419] sync_dirty_inodes: inode:593373, cp_task:0000000013327ef9
> [  194.764512] sync_dirty_inodes: inode:593375, cp_task:0000000013327ef9
> [  194.764533] sync_dirty_inodes: inode:593376, cp_task:0000000013327ef9
> [  194.764608] sync_dirty_inodes: inode:593377, cp_task:0000000013327ef9
> [  194.764857] sync_dirty_inodes: inode:593378, cp_task:0000000013327ef9
> [  194.764884] sync_dirty_inodes: inode:593379, cp_task:0000000013327ef9
> [  194.765164] sync_dirty_inodes: inode:593380, cp_task:0000000013327ef9
> [  194.765210] sync_dirty_inodes: inode:593381, cp_task:0000000013327ef9
> [  194.765286] sync_dirty_inodes: inode:593382, cp_task:0000000013327ef9
> [  194.765513] sync_dirty_inodes: inode:593383, cp_task:0000000013327ef9
> [  194.765671] sync_dirty_inodes: inode:593384, cp_task:0000000013327ef9
> [  194.765777] sync_dirty_inodes: inode:593385, cp_task:0000000013327ef9
> [  194.766079] sync_dirty_inodes: inode:593386, cp_task:0000000013327ef9
> [  194.766568] sync_dirty_inodes: inode:593387, cp_task:0000000013327ef9
> [  194.766628] sync_dirty_inodes: inode:593388, cp_task:0000000013327ef9
> [  194.766742] sync_dirty_inodes: inode:593389, cp_task:0000000013327ef9
> [  194.766750] sync_dirty_inodes: inode:593390, cp_task:0000000013327ef9
> [  194.766788] sync_dirty_inodes: inode:593391, cp_task:0000000013327ef9
> [  194.766806] sync_dirty_inodes: inode:593392, cp_task:0000000013327ef9
> [  194.766856] sync_dirty_inodes: inode:593364, cp_task:0000000013327ef9
> [  194.767016] sync_dirty_inodes: inode:593394, cp_task:0000000013327ef9
> [  194.767033] sync_dirty_inodes: inode:593395, cp_task:0000000013327ef9
> [  194.768454] sync_dirty_inodes: inode:593393, cp_task:0000000013327ef9
> [  194.768651] sync_dirty_inodes: inode:593397, cp_task:0000000013327ef9
> [  194.768665] sync_dirty_inodes: inode:593398, cp_task:0000000013327ef9
> [  194.768678] sync_dirty_inodes: inode:593399, cp_task:0000000013327ef9
> [  194.768705] sync_dirty_inodes: inode:593400, cp_task:0000000013327ef9
> [  194.768869] sync_dirty_inodes: inode:593401, cp_task:0000000013327ef9
> [  194.768945] sync_dirty_inodes: inode:593402, cp_task:0000000013327ef9
> [  194.769081] sync_dirty_inodes: inode:593403, cp_task:0000000013327ef9
> [  194.769106] sync_dirty_inodes: inode:593404, cp_task:0000000013327ef9
> [  194.769198] sync_dirty_inodes: inode:593396, cp_task:0000000013327ef9
> [  194.769297] sync_dirty_inodes: inode:593405, cp_task:0000000013327ef9
> [  194.769390] sync_dirty_inodes: inode:593407, cp_task:0000000013327ef9
> [  194.769670] sync_dirty_inodes: inode:593408, cp_task:0000000013327ef9
> [  194.769685] sync_dirty_inodes: inode:593409, cp_task:0000000013327ef9
> [  194.769699] sync_dirty_inodes: inode:593410, cp_task:0000000013327ef9
> [  194.769716] sync_dirty_inodes: inode:593411, cp_task:0000000013327ef9
> [  194.769738] sync_dirty_inodes: inode:593412, cp_task:0000000013327ef9
> [  194.770032] sync_dirty_inodes: inode:593413, cp_task:0000000013327ef9
> [  194.770074] sync_dirty_inodes: inode:593414, cp_task:0000000013327ef9
> [  194.770157] sync_dirty_inodes: inode:593415, cp_task:0000000013327ef9
> [  194.770185] sync_dirty_inodes: inode:593416, cp_task:0000000013327ef9
> [  194.778086] sync_dirty_inodes: inode:593406, cp_task:0000000013327ef9
> [  194.778239] sync_dirty_inodes: inode:593417, cp_task:0000000013327ef9
> [  194.778322] sync_dirty_inodes: inode:593418, cp_task:0000000013327ef9
> [  194.778484] sync_dirty_inodes: inode:593419, cp_task:0000000013327ef9
> [  194.778562] sync_dirty_inodes: inode:593420, cp_task:0000000013327ef9
> [  194.778621] sync_dirty_inodes: inode:593421, cp_task:0000000013327ef9
> [  194.778635] sync_dirty_inodes: inode:593422, cp_task:0000000013327ef9
> [  194.778661] sync_dirty_inodes: inode:593423, cp_task:0000000013327ef9
> [  194.779162] sync_dirty_inodes: inode:593424, cp_task:0000000013327ef9
> [  194.779227] sync_dirty_inodes: inode:593425, cp_task:0000000013327ef9
> [  194.781339] sync_dirty_inodes: inode:593427, cp_task:0000000013327ef9
> [  194.841045] write_data_page: inode:764980, cp_task:          (null)
> [  194.861488] sync_dirty_inodes: inode:593948, cp_task:0000000013327ef9
> [  194.941948] sync_dirty_inodes: inode:593948, cp_task:0000000045fd0ed6
> [  194.958797] sync_dirty_inodes: inode:593948, cp_task:0000000013327ef9
> [  360.534693] usb 3-3: USB disconnect, device number 2
> [  369.937827] INFO: task kworker/u16:5:344 blocked for more than 120 seconds.
> [  369.937829]       Not tainted 5.0.15-gentoo-f2fslog #4
> [  369.937830] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
> disables this message.
> [  369.937831] kworker/u16:5   D    0   344      2 0x80000000
> [  369.937836] Workqueue: writeback wb_workfn (flush-259:0)
> [  369.937838] Call Trace:
> [  369.937843]  ? __schedule+0x2c5/0x8b0
> [  369.937846]  schedule+0x32/0x80
> [  369.937848]  schedule_preempt_disabled+0x14/0x20
> [  369.937850]  __mutex_lock.isra.8+0x2ba/0x4d0
> [  369.937853]  ? log_store+0xf5/0x260
> [  369.937857]  f2fs_write_data_pages+0x133/0x320
> [  369.937860]  ? trace_hardirqs_on+0x2c/0xe0
> [  369.937863]  do_writepages+0x41/0xd0
> [  369.937866]  __filemap_fdatawrite_range+0x81/0xb0
> [  369.937869]  f2fs_sync_dirty_inodes+0x1dd/0x200
> [  369.937871]  f2fs_balance_fs_bg+0x2a7/0x2c0
> [  369.937874]  ? up_read+0x5/0x20
> [  369.937876]  ? f2fs_do_write_data_page+0x2cb/0x940
> [  369.937877]  f2fs_balance_fs+0xe5/0x2c0
> [  369.937880]  __write_data_page+0x1c8/0x6e0
> [  369.937884]  f2fs_write_cache_pages+0x1e0/0x450
> [  369.937889]  f2fs_write_data_pages+0x14b/0x320
> [  369.937891]  ? trace_hardirqs_on+0x2c/0xe0
> [  369.937894]  do_writepages+0x41/0xd0
> [  369.937896]  __filemap_fdatawrite_range+0x81/0xb0
> [  369.937898]  f2fs_sync_dirty_inodes+0x1dd/0x200
> [  369.937900]  f2fs_balance_fs_bg+0x2a7/0x2c0
> [  369.937902]  f2fs_write_node_pages+0x51/0x220
> [  369.937905]  do_writepages+0x41/0xd0
> [  369.937908]  __writeback_single_inode+0x3d/0x3d0
> [  369.937910]  writeback_sb_inodes+0x1e8/0x410
> [  369.937913]  __writeback_inodes_wb+0x5d/0xb0
> [  369.937915]  wb_writeback+0x28f/0x340
> [  369.937918]  ? cpumask_next+0x16/0x20
> [  369.937920]  wb_workfn+0x33e/0x420
> [  369.937923]  process_one_work+0x1a1/0x3d0
> [  369.937925]  worker_thread+0x30/0x380
> [  369.937927]  ? process_one_work+0x3d0/0x3d0
> [  369.937929]  kthread+0x116/0x130
> [  369.937931]  ? kthread_create_worker_on_cpu+0x70/0x70
> [  369.937933]  ret_from_fork+0x3a/0x50
> [  369.937946] INFO: task cp:2049 blocked for more than 120 seconds.
> [  369.937946]       Not tainted 5.0.15-gentoo-f2fslog #4
> [  369.937947] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
> disables this message.
> [  369.937948] cp              D    0  2049   2029 0x00000000
> [  369.937949] Call Trace:
> [  369.937952]  ? __schedule+0x2c5/0x8b0
> [  369.937954]  schedule+0x32/0x80
> [  369.937956]  schedule_preempt_disabled+0x14/0x20
> [  369.937958]  __mutex_lock.isra.8+0x2ba/0x4d0
> [  369.937960]  ? log_store+0xf5/0x260
> [  369.937963]  f2fs_write_data_pages+0x133/0x320
> [  369.937965]  ? trace_hardirqs_on+0x2c/0xe0
> [  369.937968]  do_writepages+0x41/0xd0
> [  369.937971]  __filemap_fdatawrite_range+0x81/0xb0
> [  369.937973]  f2fs_sync_dirty_inodes+0x1dd/0x200
> [  369.937975]  f2fs_balance_fs_bg+0x2a7/0x2c0
> [  369.937977]  f2fs_balance_fs+0xe5/0x2c0
> [  369.937980]  f2fs_mkdir+0x124/0x160
> [  369.937982]  vfs_mkdir+0x102/0x1b0
> [  369.937985]  do_mkdirat+0x7d/0xf0
> [  369.937987]  do_syscall_64+0x69/0x399
> [  369.937989]  ? trace_hardirqs_off_thunk+0x1a/0x1c
> [  369.937992]  entry_SYSCALL_64_after_hwframe+0x49/0xbe
> [  369.937994] RIP: 0033:0x717f2eaa603b
> [  369.937998] Code: Bad RIP value.
> [  369.937999] RSP: 002b:00007ffd8a71c8c8 EFLAGS: 00000202 ORIG_RAX:
> 0000000000000053
> [  369.938001] RAX: ffffffffffffffda RBX: 00007ffd8a71cf80 RCX: 0000717f2eaa603b
> [  369.938002] RDX: 000000000001ae3c RSI: 00000000000001c0 RDI: 00005b54b1a17ff0
> [  369.938003] RBP: 00007ffd8a71cc70 R08: 00007ffd8a71cf80 R09: 00007ffd8a71cf80
> [  369.938004] R10: 00007ffd8a71ca00 R11: 0000000000000202 R12: 00000000000001ed
> [  369.938005] R13: 0000000000000000 R14: 0000000000004000 R15: 0000000000000000
> [  492.817796] INFO: task kworker/u16:5:344 blocked for more than 120 seconds.
> [  492.817797]       Not tainted 5.0.15-gentoo-f2fslog #4
> [  492.817797] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
> disables this message.
> [  492.817798] kworker/u16:5   D    0   344      2 0x80000000
> [  492.817810] Workqueue: writeback wb_workfn (flush-259:0)
> [  492.817811] Call Trace:
> [  492.817813]  ? __schedule+0x2c5/0x8b0
> [  492.817815]  schedule+0x32/0x80
> [  492.817816]  schedule_preempt_disabled+0x14/0x20
> [  492.817817]  __mutex_lock.isra.8+0x2ba/0x4d0
> [  492.817819]  ? log_store+0xf5/0x260
> [  492.817821]  f2fs_write_data_pages+0x133/0x320
> [  492.817823]  ? trace_hardirqs_on+0x2c/0xe0
> [  492.817825]  do_writepages+0x41/0xd0
> [  492.817826]  __filemap_fdatawrite_range+0x81/0xb0
> [  492.817828]  f2fs_sync_dirty_inodes+0x1dd/0x200
> [  492.817829]  f2fs_balance_fs_bg+0x2a7/0x2c0
> [  492.817831]  ? up_read+0x5/0x20
> [  492.817832]  ? f2fs_do_write_data_page+0x2cb/0x940
> [  492.817833]  f2fs_balance_fs+0xe5/0x2c0
> [  492.817835]  __write_data_page+0x1c8/0x6e0
> [  492.817837]  f2fs_write_cache_pages+0x1e0/0x450
> [  492.817840]  f2fs_write_data_pages+0x14b/0x320
> [  492.817842]  ? trace_hardirqs_on+0x2c/0xe0
> [  492.817843]  do_writepages+0x41/0xd0
> [  492.817845]  __filemap_fdatawrite_range+0x81/0xb0
> [  492.817846]  f2fs_sync_dirty_inodes+0x1dd/0x200
> [  492.817847]  f2fs_balance_fs_bg+0x2a7/0x2c0
> [  492.817849]  f2fs_write_node_pages+0x51/0x220
> [  492.817851]  do_writepages+0x41/0xd0
> [  492.817853]  __writeback_single_inode+0x3d/0x3d0
> [  492.817854]  writeback_sb_inodes+0x1e8/0x410
> [  492.817856]  __writeback_inodes_wb+0x5d/0xb0
> [  492.817857]  wb_writeback+0x28f/0x340
> [  492.817859]  ? cpumask_next+0x16/0x20
> [  492.817860]  wb_workfn+0x33e/0x420
> [  492.817862]  process_one_work+0x1a1/0x3d0
> [  492.817863]  worker_thread+0x30/0x380
> [  492.817865]  ? process_one_work+0x3d0/0x3d0
> [  492.817865]  kthread+0x116/0x130
> [  492.817866]  ? kthread_create_worker_on_cpu+0x70/0x70
> [  492.817868]  ret_from_fork+0x3a/0x50
> [  492.817873] INFO: task cp:2049 blocked for more than 120 seconds.
> [  492.817873]       Not tainted 5.0.15-gentoo-f2fslog #4
> [  492.817874] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
> disables this message.
> [  492.817874] cp              D    0  2049   2029 0x00000000
> [  492.817875] Call Trace:
> [  492.817877]  ? __schedule+0x2c5/0x8b0
> [  492.817878]  schedule+0x32/0x80
> [  492.817879]  schedule_preempt_disabled+0x14/0x20
> [  492.817880]  __mutex_lock.isra.8+0x2ba/0x4d0
> [  492.817882]  ? log_store+0xf5/0x260
> [  492.817884]  f2fs_write_data_pages+0x133/0x320
> [  492.817886]  ? trace_hardirqs_on+0x2c/0xe0
> [  492.817887]  do_writepages+0x41/0xd0
> [  492.817889]  __filemap_fdatawrite_range+0x81/0xb0
> [  492.817890]  f2fs_sync_dirty_inodes+0x1dd/0x200
> [  492.817892]  f2fs_balance_fs_bg+0x2a7/0x2c0
> [  492.817893]  f2fs_balance_fs+0xe5/0x2c0
> [  492.817894]  f2fs_mkdir+0x124/0x160
> [  492.817896]  vfs_mkdir+0x102/0x1b0
> [  492.817897]  do_mkdirat+0x7d/0xf0
> [  492.817899]  do_syscall_64+0x69/0x399
> [  492.817900]  ? trace_hardirqs_off_thunk+0x1a/0x1c
> [  492.817902]  entry_SYSCALL_64_after_hwframe+0x49/0xbe
> [  492.817903] RIP: 0033:0x717f2eaa603b
> [  492.817905] Code: Bad RIP value.
> [  492.817906] RSP: 002b:00007ffd8a71c8c8 EFLAGS: 00000202 ORIG_RAX:
> 0000000000000053
> [  492.817907] RAX: ffffffffffffffda RBX: 00007ffd8a71cf80 RCX: 0000717f2eaa603b
> [  492.817908] RDX: 000000000001ae3c RSI: 00000000000001c0 RDI: 00005b54b1a17ff0
> [  492.817908] RBP: 00007ffd8a71cc70 R08: 00007ffd8a71cf80 R09: 00007ffd8a71cf80
> [  492.817909] R10: 00007ffd8a71ca00 R11: 0000000000000202 R12: 00000000000001ed
> [  492.817910] R13: 0000000000000000 R14: 0000000000004000 R15: 0000000000000000
> [  615.697824] INFO: task kworker/u16:5:344 blocked for more than 120 seconds.
> [  615.697825]       Not tainted 5.0.15-gentoo-f2fslog #4
> [  615.697826] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
> disables this message.
> [  615.697827] kworker/u16:5   D    0   344      2 0x80000000
> [  615.697831] Workqueue: writeback wb_workfn (flush-259:0)
> [  615.697832] Call Trace:
> [  615.697836]  ? __schedule+0x2c5/0x8b0
> [  615.697839]  schedule+0x32/0x80
> [  615.697841]  schedule_preempt_disabled+0x14/0x20
> [  615.697842]  __mutex_lock.isra.8+0x2ba/0x4d0
> [  615.697845]  ? log_store+0xf5/0x260
> [  615.697848]  f2fs_write_data_pages+0x133/0x320
> [  615.697851]  ? trace_hardirqs_on+0x2c/0xe0
> [  615.697854]  do_writepages+0x41/0xd0
> [  615.697857]  __filemap_fdatawrite_range+0x81/0xb0
> [  615.697859]  f2fs_sync_dirty_inodes+0x1dd/0x200
> [  615.697861]  f2fs_balance_fs_bg+0x2a7/0x2c0
> [  615.697863]  ? up_read+0x5/0x20
> [  615.697865]  ? f2fs_do_write_data_page+0x2cb/0x940
> [  615.697867]  f2fs_balance_fs+0xe5/0x2c0
> [  615.697869]  __write_data_page+0x1c8/0x6e0
> [  615.697873]  f2fs_write_cache_pages+0x1e0/0x450
> [  615.697878]  f2fs_write_data_pages+0x14b/0x320
> [  615.697880]  ? trace_hardirqs_on+0x2c/0xe0
> [  615.697883]  do_writepages+0x41/0xd0
> [  615.697885]  __filemap_fdatawrite_range+0x81/0xb0
> [  615.697887]  f2fs_sync_dirty_inodes+0x1dd/0x200
> [  615.697889]  f2fs_balance_fs_bg+0x2a7/0x2c0
> [  615.697891]  f2fs_write_node_pages+0x51/0x220
> [  615.697894]  do_writepages+0x41/0xd0
> [  615.697897]  __writeback_single_inode+0x3d/0x3d0
> [  615.697899]  writeback_sb_inodes+0x1e8/0x410
> [  615.697902]  __writeback_inodes_wb+0x5d/0xb0
> [  615.697904]  wb_writeback+0x28f/0x340
> [  615.697906]  ? cpumask_next+0x16/0x20
> [  615.697908]  wb_workfn+0x33e/0x420
> [  615.697911]  process_one_work+0x1a1/0x3d0
> [  615.697913]  worker_thread+0x30/0x380
> [  615.697915]  ? process_one_work+0x3d0/0x3d0
> [  615.697916]  kthread+0x116/0x130
> [  615.697918]  ? kthread_create_worker_on_cpu+0x70/0x70
> [  615.697921]  ret_from_fork+0x3a/0x50
> [  615.697927] INFO: task cp:2049 blocked for more than 120 seconds.
> [  615.697928]       Not tainted 5.0.15-gentoo-f2fslog #4
> [  615.697929] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
> disables this message.
> [  615.697929] cp              D    0  2049   2029 0x00000000
> [  615.697931] Call Trace:
> [  615.697933]  ? __schedule+0x2c5/0x8b0
> [  615.697935]  schedule+0x32/0x80
> [  615.697937]  schedule_preempt_disabled+0x14/0x20
> [  615.697939]  __mutex_lock.isra.8+0x2ba/0x4d0
> [  615.697942]  ? log_store+0xf5/0x260
> [  615.697944]  f2fs_write_data_pages+0x133/0x320
> [  615.697947]  ? trace_hardirqs_on+0x2c/0xe0
> [  615.697950]  do_writepages+0x41/0xd0
> [  615.697952]  __filemap_fdatawrite_range+0x81/0xb0
> [  615.697954]  f2fs_sync_dirty_inodes+0x1dd/0x200
> [  615.697956]  f2fs_balance_fs_bg+0x2a7/0x2c0
> [  615.697958]  f2fs_balance_fs+0xe5/0x2c0
> [  615.697961]  f2fs_mkdir+0x124/0x160
> [  615.697963]  vfs_mkdir+0x102/0x1b0
> [  615.697965]  do_mkdirat+0x7d/0xf0
> [  615.697968]  do_syscall_64+0x69/0x399
> [  615.697969]  ? trace_hardirqs_off_thunk+0x1a/0x1c
> [  615.697972]  entry_SYSCALL_64_after_hwframe+0x49/0xbe
> [  615.697974] RIP: 0033:0x717f2eaa603b
> [  615.697978] Code: Bad RIP value.
> [  615.697979] RSP: 002b:00007ffd8a71c8c8 EFLAGS: 00000202 ORIG_RAX:
> 0000000000000053
> [  615.697980] RAX: ffffffffffffffda RBX: 00007ffd8a71cf80 RCX: 0000717f2eaa603b
> [  615.697981] RDX: 000000000001ae3c RSI: 00000000000001c0 RDI: 00005b54b1a17ff0
> [  615.697982] RBP: 00007ffd8a71cc70 R08: 00007ffd8a71cf80 R09: 00007ffd8a71cf80
> [  615.697983] R10: 00007ffd8a71ca00 R11: 0000000000000202 R12: 00000000000001ed
> [  615.697984] R13: 0000000000000000 R14: 0000000000004000 R15: 0000000000000000
> [  738.577796] INFO: task kworker/u16:5:344 blocked for more than 120 seconds.
> [  738.577798]       Not tainted 5.0.15-gentoo-f2fslog #4
> [  738.577798] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
> disables this message.
> [  738.577799] kworker/u16:5   D    0   344      2 0x80000000
> [  738.577812] Workqueue: writeback wb_workfn (flush-259:0)
> [  738.577812] Call Trace:
> [  738.577815]  ? __schedule+0x2c5/0x8b0
> [  738.577817]  schedule+0x32/0x80
> [  738.577818]  schedule_preempt_disabled+0x14/0x20
> [  738.577819]  __mutex_lock.isra.8+0x2ba/0x4d0
> [  738.577821]  ? log_store+0xf5/0x260
> [  738.577823]  f2fs_write_data_pages+0x133/0x320
> [  738.577825]  ? trace_hardirqs_on+0x2c/0xe0
> [  738.577827]  do_writepages+0x41/0xd0
> [  738.577829]  __filemap_fdatawrite_range+0x81/0xb0
> [  738.577830]  f2fs_sync_dirty_inodes+0x1dd/0x200
> [  738.577832]  f2fs_balance_fs_bg+0x2a7/0x2c0
> [  738.577833]  ? up_read+0x5/0x20
> [  738.577834]  ? f2fs_do_write_data_page+0x2cb/0x940
> [  738.577835]  f2fs_balance_fs+0xe5/0x2c0
> [  738.577837]  __write_data_page+0x1c8/0x6e0
> [  738.577839]  f2fs_write_cache_pages+0x1e0/0x450
> [  738.577842]  f2fs_write_data_pages+0x14b/0x320
> [  738.577844]  ? trace_hardirqs_on+0x2c/0xe0
> [  738.577846]  do_writepages+0x41/0xd0
> [  738.577847]  __filemap_fdatawrite_range+0x81/0xb0
> [  738.577849]  f2fs_sync_dirty_inodes+0x1dd/0x200
> [  738.577850]  f2fs_balance_fs_bg+0x2a7/0x2c0
> [  738.577851]  f2fs_write_node_pages+0x51/0x220
> [  738.577853]  do_writepages+0x41/0xd0
> [  738.577855]  __writeback_single_inode+0x3d/0x3d0
> [  738.577856]  writeback_sb_inodes+0x1e8/0x410
> [  738.577858]  __writeback_inodes_wb+0x5d/0xb0
> [  738.577859]  wb_writeback+0x28f/0x340
> [  738.577861]  ? cpumask_next+0x16/0x20
> [  738.577862]  wb_workfn+0x33e/0x420
> [  738.577864]  process_one_work+0x1a1/0x3d0
> [  738.577865]  worker_thread+0x30/0x380
> [  738.577867]  ? process_one_work+0x3d0/0x3d0
> [  738.577867]  kthread+0x116/0x130
> [  738.577868]  ? kthread_create_worker_on_cpu+0x70/0x70
> [  738.577870]  ret_from_fork+0x3a/0x50
> [  738.577875] INFO: task cp:2049 blocked for more than 120 seconds.
> [  738.577875]       Not tainted 5.0.15-gentoo-f2fslog #4
> [  738.577875] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
> disables this message.
> [  738.577876] cp              D    0  2049   2029 0x00000000
> [  738.577877] Call Trace:
> [  738.577878]  ? __schedule+0x2c5/0x8b0
> [  738.577880]  schedule+0x32/0x80
> [  738.577881]  schedule_preempt_disabled+0x14/0x20
> [  738.577882]  __mutex_lock.isra.8+0x2ba/0x4d0
> [  738.577884]  ? log_store+0xf5/0x260
> [  738.577886]  f2fs_write_data_pages+0x133/0x320
> [  738.577887]  ? trace_hardirqs_on+0x2c/0xe0
> [  738.577889]  do_writepages+0x41/0xd0
> [  738.577891]  __filemap_fdatawrite_range+0x81/0xb0
> [  738.577892]  f2fs_sync_dirty_inodes+0x1dd/0x200
> [  738.577893]  f2fs_balance_fs_bg+0x2a7/0x2c0
> [  738.577895]  f2fs_balance_fs+0xe5/0x2c0
> [  738.577896]  f2fs_mkdir+0x124/0x160
> [  738.577898]  vfs_mkdir+0x102/0x1b0
> [  738.577899]  do_mkdirat+0x7d/0xf0
> [  738.577901]  do_syscall_64+0x69/0x399
> [  738.577902]  ? trace_hardirqs_off_thunk+0x1a/0x1c
> [  738.577904]  entry_SYSCALL_64_after_hwframe+0x49/0xbe
> [  738.577905] RIP: 0033:0x717f2eaa603b
> [  738.577907] Code: Bad RIP value.
> [  738.577908] RSP: 002b:00007ffd8a71c8c8 EFLAGS: 00000202 ORIG_RAX:
> 0000000000000053
> [  738.577909] RAX: ffffffffffffffda RBX: 00007ffd8a71cf80 RCX: 0000717f2eaa603b
> [  738.577909] RDX: 000000000001ae3c RSI: 00000000000001c0 RDI: 00005b54b1a17ff0
> [  738.577910] RBP: 00007ffd8a71cc70 R08: 00007ffd8a71cf80 R09: 00007ffd8a71cf80
> [  738.577910] R10: 00007ffd8a71ca00 R11: 0000000000000202 R12: 00000000000001ed
> [  738.577911] R13: 0000000000000000 R14: 0000000000004000 R15: 0000000000000000
> [  861.457820] INFO: task kworker/u16:5:344 blocked for more than 120 seconds.
> [  861.457823]       Not tainted 5.0.15-gentoo-f2fslog #4
> [  861.457823] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
> disables this message.
> [  861.457825] kworker/u16:5   D    0   344      2 0x80000000
> [  861.457830] Workqueue: writeback wb_workfn (flush-259:0)
> [  861.457832] Call Trace:
> [  861.457837]  ? __schedule+0x2c5/0x8b0
> [  861.457841]  schedule+0x32/0x80
> [  861.457843]  schedule_preempt_disabled+0x14/0x20
> [  861.457846]  __mutex_lock.isra.8+0x2ba/0x4d0
> [  861.457850]  ? log_store+0xf5/0x260
> [  861.457854]  f2fs_write_data_pages+0x133/0x320
> [  861.457858]  ? trace_hardirqs_on+0x2c/0xe0
> [  861.457862]  do_writepages+0x41/0xd0
> [  861.457865]  __filemap_fdatawrite_range+0x81/0xb0
> [  861.457869]  f2fs_sync_dirty_inodes+0x1dd/0x200
> [  861.457872]  f2fs_balance_fs_bg+0x2a7/0x2c0
> [  861.457874]  ? up_read+0x5/0x20
> [  861.457877]  ? f2fs_do_write_data_page+0x2cb/0x940
> [  861.457879]  f2fs_balance_fs+0xe5/0x2c0
> [  861.457883]  __write_data_page+0x1c8/0x6e0
> [  861.457888]  f2fs_write_cache_pages+0x1e0/0x450
> [  861.457894]  f2fs_write_data_pages+0x14b/0x320
> [  861.457898]  ? trace_hardirqs_on+0x2c/0xe0
> [  861.457901]  do_writepages+0x41/0xd0
> [  861.457904]  __filemap_fdatawrite_range+0x81/0xb0
> [  861.457908]  f2fs_sync_dirty_inodes+0x1dd/0x200
> [  861.457910]  f2fs_balance_fs_bg+0x2a7/0x2c0
> [  861.457913]  f2fs_write_node_pages+0x51/0x220
> [  861.457917]  do_writepages+0x41/0xd0
> [  861.457921]  __writeback_single_inode+0x3d/0x3d0
> [  861.457924]  writeback_sb_inodes+0x1e8/0x410
> [  861.457928]  __writeback_inodes_wb+0x5d/0xb0
> [  861.457930]  wb_writeback+0x28f/0x340
> [  861.457934]  ? cpumask_next+0x16/0x20
> [  861.457936]  wb_workfn+0x33e/0x420
> [  861.457940]  process_one_work+0x1a1/0x3d0
> [  861.457943]  worker_thread+0x30/0x380
> [  861.457946]  ? process_one_work+0x3d0/0x3d0
> [  861.457948]  kthread+0x116/0x130
> [  861.457950]  ? kthread_create_worker_on_cpu+0x70/0x70
> [  861.457953]  ret_from_fork+0x3a/0x50
> [  861.457962] INFO: task cp:2049 blocked for more than 120 seconds.
> [  861.457963]       Not tainted 5.0.15-gentoo-f2fslog #4
> [  861.457964] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
> disables this message.
> [  861.457965] cp              D    0  2049   2029 0x00000000
> [  861.457967] Call Trace:
> [  861.457970]  ? __schedule+0x2c5/0x8b0
> [  861.457974]  schedule+0x32/0x80
> [  861.457976]  schedule_preempt_disabled+0x14/0x20
> [  861.457978]  __mutex_lock.isra.8+0x2ba/0x4d0
> [  861.457982]  ? log_store+0xf5/0x260
> [  861.457986]  f2fs_write_data_pages+0x133/0x320
> [  861.457990]  ? trace_hardirqs_on+0x2c/0xe0
> [  861.457993]  do_writepages+0x41/0xd0
> [  861.457996]  __filemap_fdatawrite_range+0x81/0xb0
> [  861.458000]  f2fs_sync_dirty_inodes+0x1dd/0x200
> [  861.458002]  f2fs_balance_fs_bg+0x2a7/0x2c0
> [  861.458005]  f2fs_balance_fs+0xe5/0x2c0
> [  861.458009]  f2fs_mkdir+0x124/0x160
> [  861.458012]  vfs_mkdir+0x102/0x1b0
> [  861.458015]  do_mkdirat+0x7d/0xf0
> [  861.458018]  do_syscall_64+0x69/0x399
> [  861.458020]  ? trace_hardirqs_off_thunk+0x1a/0x1c
> [  861.458025]  entry_SYSCALL_64_after_hwframe+0x49/0xbe
> [  861.458027] RIP: 0033:0x717f2eaa603b
> [  861.458032] Code: Bad RIP value.
> [  861.458033] RSP: 002b:00007ffd8a71c8c8 EFLAGS: 00000202 ORIG_RAX:
> 0000000000000053
> [  861.458035] RAX: ffffffffffffffda RBX: 00007ffd8a71cf80 RCX: 0000717f2eaa603b
> [  861.458036] RDX: 000000000001ae3c RSI: 00000000000001c0 RDI: 00005b54b1a17ff0
> [  861.458038] RBP: 00007ffd8a71cc70 R08: 00007ffd8a71cf80 R09: 00007ffd8a71cf80
> [  861.458039] R10: 00007ffd8a71ca00 R11: 0000000000000202 R12: 00000000000001ed
> [  861.458040] R13: 0000000000000000 R14: 0000000000004000 R15: 0000000000000000
> 
> 
>> I was able to reproduse the bug with one of the two printk's at a time
>> only, and I had to disable syslog-ng and fcron for it not to hang even
>> then.
>>
>> Followig is log from two runs, one with each of the printk's, hope it
>> helps.
>>
>> --BEGIN log one
>> <4>[  593.806592] write_data_page: inode:710085, cp_task:          (null)
>> <4>[  593.806688] write_data_page: inode:710110, cp_task:          (null)
>> <4>[  593.808558] write_data_page: inode:710321, cp_task:          (null)
>> <4>[  593.808575] write_data_page: inode:710325, cp_task:          (null)
>> <4>[  593.808590] write_data_page: inode:710326, cp_task:          (null)
>> <4>[  593.808606] write_data_page: inode:710332, cp_task:          (null)
>> <4>[  593.966185] write_data_page: inode:721775, cp_task:          (null)
>> <4>[  593.966203] write_data_page: inode:721776, cp_task:          (null)
>> <4>[  593.966219] write_data_page: inode:721777, cp_task:          (null)
>> <4>[  593.966235] write_data_page: inode:721778, cp_task:          (null)
>> <4>[  593.966250] write_data_page: inode:721779, cp_task:          (null)
>> <4>[  593.966266] write_data_page: inode:721780, cp_task:          (null)
>> <4>[  593.966281] write_data_page: inode:721781, cp_task:          (null)
>> <4>[  593.966296] write_data_page: inode:721782, cp_task:          (null)
>> <4>[  593.966311] write_data_page: inode:721783, cp_task:          (null)
>> <4>[  593.966327] write_data_page: inode:721784, cp_task:          (null)
>> <4>[  593.966343] write_data_page: inode:721785, cp_task:          (null)
>> <4>[  593.966359] write_data_page: inode:721786, cp_task:          (null)
>> <4>[  593.966374] write_data_page: inode:721787, cp_task:          (null)
>> <4>[  594.340072] write_data_page: inode:746183, cp_task:          (null)
>> <0>[  594.923096] BUG: stack guard page was hit at 000000006e7354a5
>> (stack is 000000006445beb4..00000000988529ca)
>> <0>[  594.923108] BUG: stack guard page was hit at 00000000d2c9ec98
>> (stack is 00000000b417d4d3..000000001b88c4fe)
>> <4>[  594.926975] kernel stack overflow (double-fault): 0000 [#1]
>> PREEMPT SMP PTI
>> <4>[  594.934772] CPU: 7 PID: 2158 Comm: cp Not tainted
>> 5.0.15-gentoo-f2fslog_data_page #5
>> <4>[  594.938757] Hardware name: To Be Filled By O.E.M. To Be Filled
>> By O.E.M./C226 WS, BIOS P3.40 06/25/2018
>> <4>[  594.942880] RIP: 0010:tag_pages_for_writeback+0x0/0x180
>> <4>[  594.947036] Code: 30 48 83 ff 07 0f 86 eb fe ff ff 49 8b 56 40
>> 49 03 56 38 48 d1 ea 49 89 d0 e9 6a fe ff ff 66 66 2e 0f 1f 84 00 00
>> 00 00 00 90 <e8> 2b 41 9f 00 41 54 48 83 c7 08 55 48 89 d5 53 48 83 ec
>> 38 65 48
>> <4>[  594.951623] RSP: 0018:ffffb3f0028dc000 EFLAGS: 00010246
>> <4>[  594.956187] RAX: 0000000000000001 RBX: ffff9ea2d6bd7080 RCX:
>> ffffb3f0028dc060
>> <4>[  594.960816] RDX: 0007ffffffffffff RSI: 0000000000000000 RDI:
>> ffff9ea2d6bd71e0
>> <4>[  594.965375] RBP: ffffb3f0028dc1f0 R08: ffff9ea43eee0100 R09:
>> 0000000000000000
>> <4>[  594.969873] R10: ffffffff97e485c0 R11: 0000000000000001 R12:
>> ffff9ea2d6bd71e0
>> <4>[  594.974384] R13: 0000000000000009 R14: 0000000000000000 R15:
>> ffff9ea43bfce000
>> <4>[  594.978892] FS:  000073c62042f740(0000)
>> GS:ffff9ea45edc0000(0000) knlGS:0000000000000000
>> <4>[  594.983467] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> <4>[  594.988055] CR2: ffffb3f0028dbff8 CR3: 0000000073aa8005 CR4:
>> 00000000003606e0
>> <4>[  594.992689] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
>> 0000000000000000
>> <4>[  594.997310] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
>> 0000000000000400
>> <4>[  595.001860] Call Trace:
>> <4>[  595.006323]  f2fs_write_cache_pages+0x102/0x450
>> <4>[  595.010829]  ? kmem_cache_alloc+0x81/0x6b0
>> <4>[  595.015219]  ? trace_hardirqs_on+0x2c/0xe0
>> <4>[  595.019483]  f2fs_write_data_pages+0x2ed/0x320
>> <4>[  595.023749]  ? __enqueue_entity+0x5/0x60
>> <4>[  595.027995]  ? enqueue_task_fair+0x4b1/0xb20
>> <4>[  595.032232]  do_writepages+0x41/0xd0
>> <4>[  595.036481]  ? preempt_count_add+0x79/0xb0
>> <4>[  595.040754]  ? preempt_count_sub+0x5/0xa0
>> <4>[  595.045017]  ? _raw_spin_unlock+0x12/0x30
>> <4>[  595.049304]  ? nr_blockdev_pages+0x59/0x70
>> <4>[  595.053594]  ? si_meminfo+0x3f/0x60
>> <4>[  595.057892]  __filemap_fdatawrite_range+0x81/0xb0
>> <4>[  595.062218]  f2fs_sync_dirty_inodes+0xb7/0x1f0
>> <4>[  595.066549]  f2fs_balance_fs_bg+0x2a7/0x2c0
>> <4>[  595.070880]  ? preempt_count_sub+0x5/0xa0
>> <4>[  595.075077]  ? _raw_spin_unlock_irqrestore+0x22/0x40
>> <4>[  595.079177]  f2fs_balance_fs+0xe5/0x2c0
>> <4>[  595.083266]  __write_data_page+0x1c8/0x6e0
>> <4>[  595.087352]  f2fs_write_cache_pages+0x1e0/0x450
>> <4>[  595.091460]  ? preempt_count_add+0x79/0xb0
>> <4>[  595.095565]  ? _raw_spin_lock+0x13/0x30
>> <4>[  595.099650]  f2fs_write_data_pages+0x2ed/0x320
>> <4>[  595.103769]  ? __enqueue_entity+0x5/0x60
>> <4>[  595.107922]  ? enqueue_task_fair+0x4b1/0xb20
>> <4>[  595.112117]  do_writepages+0x41/0xd0
>> <4>[  595.116347]  ? preempt_count_add+0x79/0xb0
>> <4>[  595.120630]  ? preempt_count_sub+0x5/0xa0
>> <4>[  595.124931]  ? _raw_spin_unlock+0x12/0x30
>> <4>[  595.129268]  ? nr_blockdev_pages+0x59/0x70
>> <4>[  595.133636]  ? si_meminfo+0x3f/0x60
>> <4>[  595.138039]  __filemap_fdatawrite_range+0x81/0xb0
>> <4>[  595.142520]  f2fs_sync_dirty_inodes+0xb7/0x1f0
>> <4>[  595.146992]  f2fs_balance_fs_bg+0x2a7/0x2c0
>> <4>[  595.151467]  ? preempt_count_sub+0x5/0xa0
>> <4>[  595.155947]  ? _raw_spin_unlock_irqrestore+0x22/0x40
>> <4>[  595.160466]  f2fs_balance_fs+0xe5/0x2c0
>> <4>[  595.164964]  __write_data_page+0x1c8/0x6e0
>> <4>[  595.169478]  f2fs_write_cache_pages+0x1e0/0x450
>> <4>[  595.174019]  ? preempt_count_add+0x79/0xb0
>> <4>[  595.178545]  ? _raw_spin_lock+0x13/0x30
>> <4>[  595.183050]  f2fs_write_data_pages+0x2ed/0x320
>> <4>[  595.187613]  ? __enqueue_entity+0x5/0x60
>> <4>[  595.192150]  ? enqueue_task_fair+0x4b1/0xb20
>> <4>[  595.196678]  do_writepages+0x41/0xd0
>> <4>[  595.201226]  ? preempt_count_add+0x79/0xb0
>> <4>[  595.205819]  ? preempt_count_sub+0x5/0xa0
>> <4>[  595.210430]  ? _raw_spin_unlock+0x12/0x30
>> <4>[  595.214933]  ? nr_blockdev_pages+0x59/0x70
>> <4>[  595.219454]  ? si_meminfo+0x3f/0x60
>> <4>[  595.223862]  __filemap_fdatawrite_range+0x81/0xb0
>> <4>[  595.228245]  f2fs_sync_dirty_inodes+0xb7/0x1f0
>> <4>[  595.232543]  f2fs_balance_fs_bg+0x2a7/0x2c0
>> <4>[  595.236761]  ? preempt_count_sub+0x5/0xa0
>> <4>[  595.240792]  ? _raw_spin_unlock_irqrestore+0x22/0x40
>> <4>[  595.244662]  f2fs_balance_fs+0xe5/0x2c0
>> <4>[  595.248474]  __write_data_page+0x1c8/0x6e0
>> <4>[  595.252281]  f2fs_write_cache_pages+0x1e0/0x450
>> <4>[  595.256076]  f2fs_write_data_pages+0x2ed/0x320
>> <4>[  595.259827]  ? __enqueue_entity+0x5/0x60
>> <4>[  595.263581]  ? enqueue_task_fair+0x4b1/0xb20
>> <4>[  595.267280]  do_writepages+0x41/0xd0
>> <4>[  595.270917]  ? preempt_count_add+0x79/0xb0
>> <4>[  595.274529]  ? preempt_count_sub+0x5/0xa0
>> <4>[  595.278101]  ? _raw_spin_unlock+0x12/0x30
>> <4>[  595.281681]  ? nr_blockdev_pages+0x59/0x70
>> <4>[  595.285226]  ? si_meminfo+0x3f/0x60
>> <4>[  595.288729]  __filemap_fdatawrite_range+0x81/0xb0
>> <4>[  595.292263]  f2fs_sync_dirty_inodes+0xb7/0x1f0
>> <4>[  595.295800]  f2fs_balance_fs_bg+0x2a7/0x2c0
>> <4>[  595.299328]  ? preempt_count_sub+0x5/0xa0
>> <4>[  595.302854]  ? _raw_spin_unlock_irqrestore+0x22/0x40
>> <4>[  595.306405]  f2fs_balance_fs+0xe5/0x2c0
>> <4>[  595.309936]  __write_data_page+0x1c8/0x6e0
>> <4>[  595.313471]  f2fs_write_cache_pages+0x1e0/0x450
>> <4>[  595.317052]  f2fs_write_data_pages+0x2ed/0x320
>> <4>[  595.320637]  ? __enqueue_entity+0x5/0x60
>> <4>[  595.324215]  ? enqueue_task_fair+0x4b1/0xb20
>> <4>[  595.327802]  do_writepages+0x41/0xd0
>> <4>[  595.331372]  ? preempt_count_add+0x79/0xb0
>> <4>[  595.334951]  ? preempt_count_sub+0x5/0xa0
>> <4>[  595.338497]  ? _raw_spin_unlock+0x12/0x30
>> <4>[  595.342030]  ? nr_blockdev_pages+0x59/0x70
>> <4>[  595.345555]  ? si_meminfo+0x3f/0x60
>> <4>[  595.349054]  __filemap_fdatawrite_range+0x81/0xb0
>> <4>[  595.352579]  f2fs_sync_dirty_inodes+0xb7/0x1f0
>> <4>[  595.356099]  f2fs_balance_fs_bg+0x2a7/0x2c0
>> <4>[  595.359604]  ? preempt_count_sub+0x5/0xa0
>> <4>[  595.363110]  ? _raw_spin_unlock_irqrestore+0x22/0x40
>> <4>[  595.366639]  f2fs_balance_fs+0xe5/0x2c0
>> <4>[  595.370156]  __write_data_page+0x1c8/0x6e0
>> <4>[  595.373681]  f2fs_write_cache_pages+0x1e0/0x450
>> <4>[  595.377218]  ? __schedule+0x2cd/0x8b0
>> <4>[  595.380747]  ? __lock_page+0x155/0x240
>> <4>[  595.384292]  f2fs_write_data_pages+0x2ed/0x320
>> <4>[  595.387868]  ? __enqueue_entity+0x5/0x60
>> <4>[  595.391445]  ? enqueue_task_fair+0x4b1/0xb20
>> <4>[  595.395030]  do_writepages+0x41/0xd0
>> <4>[  595.398597]  ? preempt_count_add+0x79/0xb0
>> <4>[  595.402169]  ? preempt_count_sub+0x5/0xa0
>> <4>[  595.405716]  ? _raw_spin_unlock+0x12/0x30
>> <4>[  595.409250]  ? nr_blockdev_pages+0x59/0x70
>> <4>[  595.412777]  ? si_meminfo+0x3f/0x60
>> <4>[  595.416275]  __filemap_fdatawrite_range+0x81/0xb0
>> <4>[  595.419810]  f2fs_sync_dirty_inodes+0xb7/0x1f0
>> <4>[  595.423335]  f2fs_balance_fs_bg+0x2a7/0x2c0
>> <4>[  595.426850]  ? preempt_count_sub+0x5/0xa0
>> <4>[  595.430370]  ? _raw_spin_unlock_irqrestore+0x22/0x40
>> <4>[  595.433904]  f2fs_balance_fs+0xe5/0x2c0
>> <4>[  595.437432]  __write_data_page+0x1c8/0x6e0
>> <4>[  595.440969]  f2fs_write_cache_pages+0x1e0/0x450
>> <4>[  595.444511]  f2fs_write_data_pages+0x2ed/0x320
>> <4>[  595.448045]  ? preempt_count_add+0x79/0xb0
>> <4>[  595.451600]  ? preempt_count_sub+0x5/0xa0
>> <4>[  595.455136]  ? preempt_count_add+0x79/0xb0
>> <4>[  595.458661]  ? _raw_spin_unlock+0x12/0x30
>> <4>[  595.462177]  do_writepages+0x41/0xd0
>> <4>[  595.465672]  ? preempt_count_add+0x79/0xb0
>> <4>[  595.469169]  ? preempt_count_sub+0x5/0xa0
>> <4>[  595.472643]  ? _raw_spin_unlock+0x12/0x30
>> <4>[  595.476106]  ? nr_blockdev_pages+0x59/0x70
>> <4>[  595.479555]  ? si_meminfo+0x3f/0x60
>> <4>[  595.482984]  __filemap_fdatawrite_range+0x81/0xb0
>> <4>[  595.486441]  f2fs_sync_dirty_inodes+0xb7/0x1f0
>> <4>[  595.489880]  f2fs_balance_fs_bg+0x2a7/0x2c0
>> <4>[  595.493322]  ? up_read+0x5/0x20
>> <4>[  595.496743]  ? f2fs_do_write_data_page+0x2cb/0x940
>> <4>[  595.500205]  f2fs_balance_fs+0xe5/0x2c0
>> <4>[  595.503660]  __write_data_page+0x1c8/0x6e0
>> <4>[  595.507118]  f2fs_write_cache_pages+0x1e0/0x450
>> <4>[  595.510615]  f2fs_write_data_pages+0x2ed/0x320
>> <4>[  595.514121]  ? __enqueue_entity+0x5/0x60
>> <4>[  595.517622]  ? enqueue_task_fair+0x4b1/0xb20
>> <4>[  595.521142]  do_writepages+0x41/0xd0
>> <4>[  595.524630]  ? preempt_count_add+0x79/0xb0
>> <4>[  595.528135]  ? preempt_count_sub+0x5/0xa0
>> <4>[  595.531601]  ? _raw_spin_unlock+0x12/0x30
>> <4>[  595.535056]  ? nr_blockdev_pages+0x59/0x70
>> <4>[  595.538498]  ? si_meminfo+0x3f/0x60
>> <4>[  595.541912]  __filemap_fdatawrite_range+0x81/0xb0
>> <4>[  595.545355]  f2fs_sync_dirty_inodes+0xb7/0x1f0
>> <4>[  595.548792]  f2fs_balance_fs_bg+0x2a7/0x2c0
>> <4>[  595.552235]  ? preempt_count_sub+0x5/0xa0
>> <4>[  595.555665]  ? _raw_spin_unlock_irqrestore+0x22/0x40
>> <4>[  595.559120]  f2fs_balance_fs+0xe5/0x2c0
>> <4>[  595.562568]  __write_data_page+0x1c8/0x6e0
>> <4>[  595.566033]  f2fs_write_cache_pages+0x1e0/0x450
>> <4>[  595.569527]  f2fs_write_data_pages+0x2ed/0x320
>> <4>[  595.573022]  ? __enqueue_entity+0x5/0x60
>> <4>[  595.576517]  ? enqueue_task_fair+0x4b1/0xb20
>> <4>[  595.580021]  do_writepages+0x41/0xd0
>> <4>[  595.583507]  ? preempt_count_add+0x79/0xb0
>> <4>[  595.586997]  ? preempt_count_sub+0x5/0xa0
>> <4>[  595.590462]  ? _raw_spin_unlock+0x12/0x30
>> <4>[  595.593923]  ? nr_blockdev_pages+0x59/0x70
>> <4>[  595.597377]  ? si_meminfo+0x3f/0x60
>> <4>[  595.600796]  __filemap_fdatawrite_range+0x81/0xb0
>> <4>[  595.604249]  f2fs_sync_dirty_inodes+0xb7/0x1f0
>> <4>[  595.607691]  f2fs_balance_fs_bg+0x2a7/0x2c0
>> <4>[  595.611124]  ? preempt_count_sub+0x5/0xa0
>> <4>[  595.614569]  ? _raw_spin_unlock_irqrestore+0x22/0x40
>> <4>[  595.618024]  f2fs_balance_fs+0xe5/0x2c0
>> <4>[  595.621477]  __write_data_page+0x1c8/0x6e0
>> <4>[  595.624933]  f2fs_write_cache_pages+0x1e0/0x450
>> <4>[  595.628396]  f2fs_write_data_pages+0x2ed/0x320
>> <4>[  595.631852]  ? __enqueue_entity+0x5/0x60
>> <4>[  595.635334]  ? enqueue_task_fair+0x4b1/0xb20
>> <4>[  595.638828]  do_writepages+0x41/0xd0
>> <4>[  595.642314]  ? preempt_count_add+0x79/0xb0
>> <4>[  595.645816]  ? preempt_count_sub+0x5/0xa0
>> <4>[  595.649282]  ? _raw_spin_unlock+0x12/0x30
>> <4>[  595.652726]  ? nr_blockdev_pages+0x59/0x70
>> <4>[  595.656177]  ? si_meminfo+0x3f/0x60
>> <4>[  595.659610]  __filemap_fdatawrite_range+0x81/0xb0
>> <4>[  595.663057]  f2fs_sync_dirty_inodes+0xb7/0x1f0
>> <4>[  595.666491]  f2fs_balance_fs_bg+0x2a7/0x2c0
>> <4>[  595.669919]  ? preempt_count_sub+0x5/0xa0
>> <4>[  595.673342]  ? _raw_spin_unlock_irqrestore+0x22/0x40
>> <4>[  595.676791]  f2fs_balance_fs+0xe5/0x2c0
>> <4>[  595.680243]  __write_data_page+0x1c8/0x6e0
>> <4>[  595.683722]  f2fs_write_cache_pages+0x1e0/0x450
>> <4>[  595.687244]  f2fs_write_data_pages+0x2ed/0x320
>> <4>[  595.690766]  ? __enqueue_entity+0x5/0x60
>> <4>[  595.694278]  ? enqueue_task_fair+0x4b1/0xb20
>> <4>[  595.697809]  do_writepages+0x41/0xd0
>> <4>[  595.701342]  ? preempt_count_add+0x79/0xb0
>> <4>[  595.704903]  ? preempt_count_sub+0x5/0xa0
>> <4>[  595.708451]  ? _raw_spin_unlock+0x12/0x30
>> <4>[  595.711975]  ? nr_blockdev_pages+0x59/0x70
>> <4>[  595.715488]  ? si_meminfo+0x3f/0x60
>> <4>[  595.718983]  __filemap_fdatawrite_range+0x81/0xb0
>> <4>[  595.722508]  f2fs_sync_dirty_inodes+0xb7/0x1f0
>> <4>[  595.726031]  f2fs_balance_fs_bg+0x2a7/0x2c0
>> <4>[  595.729539]  ? preempt_count_sub+0x5/0xa0
>> <4>[  595.733044]  ? _raw_spin_unlock_irqrestore+0x22/0x40
>> <4>[  595.736581]  f2fs_balance_fs+0xe5/0x2c0
>> <4>[  595.740086]  __write_data_page+0x1c8/0x6e0
>> <4>[  595.743605]  f2fs_write_cache_pages+0x1e0/0x450
>> <4>[  595.747130]  ? _raw_spin_lock+0x13/0x30
>> <4>[  595.750654]  f2fs_write_data_pages+0x2ed/0x320
>> <4>[  595.754190]  ? __enqueue_entity+0x5/0x60
>> <4>[  595.757724]  ? enqueue_task_fair+0x4b1/0xb20
>> <4>[  595.761288]  do_writepages+0x41/0xd0
>> <4>[  595.764855]  ? preempt_count_add+0x79/0xb0
>> <4>[  595.768435]  ? preempt_count_sub+0x5/0xa0
>> <4>[  595.772001]  ? _raw_spin_unlock+0x12/0x30
>> <4>[  595.775544]  ? nr_blockdev_pages+0x59/0x70
>> <4>[  595.779091]  ? si_meminfo+0x3f/0x60
>> <4>[  595.782617]  __filemap_fdatawrite_range+0x81/0xb0
>> <4>[  595.786164]  f2fs_sync_dirty_inodes+0xb7/0x1f0
>> <4>[  595.789709]  f2fs_balance_fs_bg+0x2a7/0x2c0
>> <4>[  595.793237]  ? preempt_count_sub+0x5/0xa0
>> <4>[  595.796755]  ? _raw_spin_unlock_irqrestore+0x22/0x40
>> <4>[  595.800292]  f2fs_balance_fs+0xe5/0x2c0
>> <4>[  595.803843]  __write_data_page+0x1c8/0x6e0
>> <4>[  595.807384]  f2fs_write_cache_pages+0x1e0/0x450
>> <4>[  595.810944]  ? __enqueue_entity+0x5/0x60
>> <4>[  595.814491]  ? preempt_count_add+0x79/0xb0
>> <4>[  595.818039]  ? _raw_spin_lock+0x13/0x30
>> <4>[  595.821621]  f2fs_write_data_pages+0x2ed/0x320
>> <4>[  595.825212]  ? preempt_count_sub+0x5/0xa0
>> <4>[  595.828808]  ? _raw_spin_unlock_irqrestore+0x22/0x40
>> <4>[  595.832427]  ? try_to_wake_up+0x52/0x510
>> <4>[  595.836032]  do_writepages+0x41/0xd0
>> <4>[  595.839623]  ? preempt_count_add+0x79/0xb0
>> <4>[  595.843222]  ? preempt_count_sub+0x5/0xa0
>> <4>[  595.846785]  ? _raw_spin_unlock+0x12/0x30
>> <4>[  595.850328]  ? nr_blockdev_pages+0x59/0x70
>> <4>[  595.853856]  ? si_meminfo+0x3f/0x60
>> <4>[  595.857374]  __filemap_fdatawrite_range+0x81/0xb0
>> <4>[  595.860909]  f2fs_sync_dirty_inodes+0xb7/0x1f0
>> <4>[  595.864465]  f2fs_balance_fs_bg+0x2a7/0x2c0
>> <4>[  595.867996]  ? up_read+0x5/0x20
>> <4>[  595.871514]  ? f2fs_do_write_data_page+0x2cb/0x940
>> <4>[  595.875066]  f2fs_balance_fs+0xe5/0x2c0
>> <4>[  595.878612]  __write_data_page+0x1c8/0x6e0
>> <4>[  595.882190]  f2fs_write_cache_pages+0x1e0/0x450
>> <4>[  595.885795]  ? preempt_count_add+0x79/0xb0
>> <4>[  595.889400]  ? _raw_spin_lock+0x13/0x30
>> <4>[  595.893018]  f2fs_write_data_pages+0x2ed/0x320
>> <4>[  595.896624]  ? mempool_alloc+0x65/0x190
>> <4>[  595.900219]  ? find_get_entry+0xdc/0x150
>> <4>[  595.903828]  do_writepages+0x41/0xd0
>> <4>[  595.907416]  ? preempt_count_add+0x79/0xb0
>> <4>[  595.911003]  ? preempt_count_sub+0x5/0xa0
>> <4>[  595.914549]  ? _raw_spin_unlock+0x12/0x30
>> <4>[  595.918081]  ? nr_blockdev_pages+0x59/0x70
>> <4>[  595.921610]  ? si_meminfo+0x3f/0x60
>> <4>[  595.925130]  __filemap_fdatawrite_range+0x81/0xb0
>> <4>[  595.928670]  f2fs_sync_dirty_inodes+0xb7/0x1f0
>> <4>[  595.932210]  f2fs_balance_fs_bg+0x2a7/0x2c0
>> <4>[  595.935742]  ? unlock_page+0x5/0x30
>> <4>[  595.939260]  f2fs_balance_fs+0xe5/0x2c0
>> <4>[  595.942818]  __write_data_page+0x1c8/0x6e0
>> <4>[  595.946381]  f2fs_write_cache_pages+0x1e0/0x450
>> <4>[  595.949960]  ? find_busiest_group+0x40/0x580
>> <4>[  595.953544]  ? preempt_count_add+0x79/0xb0
>> <4>[  595.957121]  ? _raw_spin_lock+0x13/0x30
>> <4>[  595.960683]  f2fs_write_data_pages+0x2ed/0x320
>> <4>[  595.964267]  ? find_get_entry+0xdc/0x150
>> <4>[  595.967849]  do_writepages+0x41/0xd0
>> <4>[  595.971404]  ? preempt_count_add+0x79/0xb0
>> <4>[  595.974962]  ? preempt_count_sub+0x5/0xa0
>> <4>[  595.978489]  ? _raw_spin_unlock+0x12/0x30
>> <4>[  595.982005]  ? nr_blockdev_pages+0x59/0x70
>> <4>[  595.985505]  ? si_meminfo+0x3f/0x60
>> <4>[  595.988990]  __filemap_fdatawrite_range+0x81/0xb0
>> <4>[  595.992488]  f2fs_sync_dirty_inodes+0xb7/0x1f0
>> <4>[  595.995995]  f2fs_balance_fs_bg+0x2a7/0x2c0
>> <4>[  595.999497]  ? unlock_page+0x5/0x30
>> <4>[  596.002978]  f2fs_balance_fs+0xe5/0x2c0
>> <4>[  596.006497]  __write_data_page+0x1c8/0x6e0
>> <4>[  596.010031]  f2fs_write_cache_pages+0x1e0/0x450
>> <4>[  596.013590]  ? stat_show+0xd01/0x1280
>> <4>[  596.017136]  ? up_read+0x5/0x20
>> <4>[  596.020661]  ? f2fs_getxattr+0x19e/0x3e0
>> <4>[  596.024194]  ? preempt_count_add+0x79/0xb0
>> <4>[  596.027720]  ? _raw_spin_lock+0x13/0x30
>> <4>[  596.031237]  f2fs_write_data_pages+0x2ed/0x320
>> <4>[  596.034759]  ? preempt_count_add+0x79/0xb0
>> <4>[  596.038254]  ? preempt_count_sub+0x5/0xa0
>> <4>[  596.041726]  ? _raw_spin_unlock+0x12/0x30
>> <4>[  596.045174]  ? f2fs_inode_dirtied+0x64/0xf0
>> <4>[  596.048619]  ? preempt_count_add+0x79/0xb0
>> <4>[  596.052066]  ? preempt_count_sub+0x5/0xa0
>> <4>[  596.055503]  do_writepages+0x41/0xd0
>> <4>[  596.058916]  ? preempt_count_add+0x79/0xb0
>> <4>[  596.062334]  ? preempt_count_sub+0x5/0xa0
>> <4>[  596.065718]  ? _raw_spin_unlock+0x12/0x30
>> <4>[  596.069076]  ? nr_blockdev_pages+0x59/0x70
>> <4>[  596.072438]  ? si_meminfo+0x3f/0x60
>> <4>[  596.075787]  __filemap_fdatawrite_range+0x81/0xb0
>> <4>[  596.079190]  f2fs_sync_dirty_inodes+0xb7/0x1f0
>> <4>[  596.082605]  f2fs_balance_fs_bg+0x2a7/0x2c0
>> <4>[  596.086024]  f2fs_balance_fs+0xe5/0x2c0
>> <4>[  596.089415]  f2fs_create+0x131/0x3e0
>> <4>[  596.092781]  ? f2fs_lookup+0x20e/0x360
>> <4>[  596.096141]  path_openat+0x11a8/0x1590
>> <4>[  596.099493]  do_filp_open+0x93/0x100
>> <4>[  596.102836]  ? preempt_count_sub+0x5/0xa0
>> <4>[  596.106176]  do_sys_open+0x186/0x220
>> <4>[  596.109496]  do_syscall_64+0x69/0x399
>> <4>[  596.112799]  ? trace_hardirqs_off_thunk+0x1a/0x1c
>> <4>[  596.116121]  entry_SYSCALL_64_after_hwframe+0x49/0xbe
>> <4>[  596.119459] RIP: 0033:0x73c62051f112
>> <4>[  596.122789] Code: 25 00 00 41 00 3d 00 00 41 00 74 4c 48 8d 05
>> d5 42 0d 00 8b 00 85 c0 75 6d 89 f2 b8 01 01 00 00 48 89 fe bf 9c ff
>> ff ff 0f 05 <48> 3d 00 f0 ff ff 0f 87 a2 00 00 00 48 8b 4c 24 28 64 48
>> 33 0c 25
>> <4>[  596.126545] RSP: 002b:00007ffe665bf1a0 EFLAGS: 00000246
>> ORIG_RAX: 0000000000000101
>> <4>[  596.130299] RAX: ffffffffffffffda RBX: 00007ffe665bf8f0 RCX:
>> 000073c62051f112
>> <4>[  596.134110] RDX: 00000000000000c1 RSI: 00005670d5042690 RDI:
>> 00000000ffffff9c
>> <4>[  596.137944] RBP: 00007ffe665bf5e0 R08: 00007ffe665bf8f0 R09:
>> 00007ffe665bf8f0
>> <4>[  596.141784] R10: 0000000000000180 R11: 0000000000000246 R12:
>> 00000000000001a4
>> <4>[  596.145664] R13: 0000000000000003 R14: 0000000000008000 R15:
>> 0000000000000000
>> <4>[  596.149536] Modules linked in: ipv6 crc_ccitt 8021q garp stp llc
>> nls_cp437 uas usb_storage pl2303 sd_mod x86_pkg_temp_thermal kvm_intel
>> iTCO_wdt kvm irqbypass ghash_clmulni_intel serio_raw i2c_i801 lpc_ich
>> firewire_ohci firewire_core igb ahci crc_itu_t
>> processor_thermal_device libahci dca intel_soc_dts_iosf
>> int340x_thermal_zone pcc_cpufreq efivarfs
>> <4>[  596.158385] ---[ end trace d508e01f5312dbde ]---
>> --END log one
>>
>> --BEGIN log two
>> <4>[  462.870628] sync_dirty_inodes: inode:624255, cp_task:000000006480c3a0
>> <4>[  462.870633] sync_dirty_inodes: inode:624255, cp_task:000000002fea927f
>> <4>[  462.870634] sync_dirty_inodes: inode:624257, cp_task:000000006480c3a0
>> <4>[  462.870638] sync_dirty_inodes: inode:624257, cp_task:000000002fea927f
>> <4>[  462.870660] sync_dirty_inodes: inode:623968, cp_task:000000002fea927f
>> <4>[  462.870665] sync_dirty_inodes: inode:623970, cp_task:000000002fea927f
>> <4>[  462.870679] sync_dirty_inodes: inode:623974, cp_task:000000002fea927f
>> <4>[  462.870681] sync_dirty_inodes: inode:623974, cp_task:000000006480c3a0
>> <4>[  462.870691] sync_dirty_inodes: inode:623975, cp_task:000000002fea927f
>> <4>[  462.870696] sync_dirty_inodes: inode:623976, cp_task:000000002fea927f
>> <4>[  462.870697] sync_dirty_inodes: inode:623976, cp_task:000000006480c3a0
>> <4>[  462.870711] sync_dirty_inodes: inode:623978, cp_task:000000006480c3a0
>> <4>[  462.870715] sync_dirty_inodes: inode:623981, cp_task:000000006480c3a0
>> <4>[  462.870717] sync_dirty_inodes: inode:623981, cp_task:000000002fea927f
>> <4>[  462.870719] sync_dirty_inodes: inode:623982, cp_task:000000006480c3a0
>> <4>[  462.870721] sync_dirty_inodes: inode:623982, cp_task:000000002fea927f
>> <4>[  462.870754] sync_dirty_inodes: inode:623986, cp_task:000000002fea927f
>> <4>[  462.870755] sync_dirty_inodes: inode:623986, cp_task:000000006480c3a0
>> <4>[  462.870774] sync_dirty_inodes: inode:623987, cp_task:000000006480c3a0
>> <4>[  462.870775] sync_dirty_inodes: inode:623987, cp_task:000000002fea927f
>> <4>[  462.870783] sync_dirty_inodes: inode:623988, cp_task:000000002fea927f
>> <4>[  462.870788] sync_dirty_inodes: inode:623991, cp_task:000000002fea927f
>> <4>[  462.870794] sync_dirty_inodes: inode:623993, cp_task:000000002fea927f
>> <4>[  462.870795] sync_dirty_inodes: inode:623993, cp_task:000000006480c3a0
>> <4>[  462.870801] sync_dirty_inodes: inode:623995, cp_task:000000006480c3a0
>> <4>[  462.870808] sync_dirty_inodes: inode:623995, cp_task:000000002fea927f
>> <4>[  462.870810] sync_dirty_inodes: inode:623995, cp_task:000000002fea927f
>> <4>[  462.870812] sync_dirty_inodes: inode:623998, cp_task:000000002fea927f
>> <4>[  462.870813] sync_dirty_inodes: inode:623998, cp_task:000000006480c3a0
>> <4>[  462.870848] sync_dirty_inodes: inode:624000, cp_task:000000002fea927f
>> <4>[  462.870852] sync_dirty_inodes: inode:624000, cp_task:000000006480c3a0
>> <4>[  462.870853] sync_dirty_inodes: inode:624003, cp_task:000000002fea927f
>> <4>[  462.870856] sync_dirty_inodes: inode:624003, cp_task:000000006480c3a0
>> <4>[  462.870858] sync_dirty_inodes: inode:624004, cp_task:000000002fea927f
>> <4>[  462.870860] sync_dirty_inodes: inode:624004, cp_task:000000006480c3a0
>> <4>[  462.870862] sync_dirty_inodes: inode:624007, cp_task:000000002fea927f
>> <4>[  462.870863] sync_dirty_inodes: inode:624007, cp_task:000000006480c3a0
>> <4>[  462.870875] sync_dirty_inodes: inode:624009, cp_task:000000006480c3a0
>> <4>[  462.870902] sync_dirty_inodes: inode:624009, cp_task:000000002fea927f
>> <4>[  462.870905] sync_dirty_inodes: inode:624010, cp_task:000000002fea927f
>> <4>[  462.870908] sync_dirty_inodes: inode:624010, cp_task:000000006480c3a0
>> <4>[  462.870913] sync_dirty_inodes: inode:624013, cp_task:000000002fea927f
>> <4>[  462.870917] sync_dirty_inodes: inode:624014, cp_task:000000002fea927f
>> <4>[  462.870921] sync_dirty_inodes: inode:624014, cp_task:000000006480c3a0
>> <4>[  462.870947] sync_dirty_inodes: inode:624016, cp_task:000000006480c3a0
>> <4>[  462.870951] sync_dirty_inodes: inode:624016, cp_task:000000002fea927f
>> <4>[  462.870953] sync_dirty_inodes: inode:624016, cp_task:000000002fea927f
>> <4>[  462.870955] sync_dirty_inodes: inode:624016, cp_task:000000002fea927f
>> <4>[  462.870956] sync_dirty_inodes: inode:624017, cp_task:000000002fea927f
>> <4>[  462.870958] sync_dirty_inodes: inode:624017, cp_task:000000006480c3a0
>> <4>[  462.870961] sync_dirty_inodes: inode:624021, cp_task:000000002fea927f
>> <4>[  462.870962] sync_dirty_inodes: inode:624021, cp_task:000000006480c3a0
>> <4>[  462.870968] sync_dirty_inodes: inode:624022, cp_task:000000006480c3a0
>> <4>[  462.870970] sync_dirty_inodes: inode:624022, cp_task:000000002fea927f
>> <4>[  462.870975] sync_dirty_inodes: inode:624024, cp_task:000000006480c3a0
>> <4>[  462.870976] sync_dirty_inodes: inode:624024, cp_task:000000002fea927f
>> <4>[  462.870989] sync_dirty_inodes: inode:624026, cp_task:000000002fea927f
>> <4>[  462.870990] sync_dirty_inodes: inode:624026, cp_task:000000006480c3a0
>> <0>[  462.870997] BUG: stack guard page was hit at 0000000056e52d0a
>> (stack is 00000000f6235c3f..00000000f20b69a0)
>> <4>[  462.876404] kernel stack overflow (double-fault): 0000 [#1]
>> PREEMPT SMP PTI
>> <4>[  462.881794] CPU: 6 PID: 875 Comm: kworker/u16:9 Not tainted
>> 5.0.15-gentoo-f2fslog_sync_dirty_inodes #5
>> <4>[  462.887185] Hardware name: To Be Filled By O.E.M. To Be Filled
>> By O.E.M./C226 WS, BIOS P3.40 06/25/2018
>> <4>[  462.892563] Workqueue: writeback wb_workfn (flush-259:0)
>> <4>[  462.897877] RIP: 0010:tracer_hardirqs_off+0x4/0xf0
>> <4>[  462.903078] Code: ee 48 0f 44 dd 4c 89 ff 48 89 da e8 d6 f9 ff
>> ff 49 c7 45 20 00 00 00 00 f0 41 ff 4d 00 e9 67 ff ff ff 0f 1f 40 00
>> 41 57 41 56 <41> 55 41 54 55 53 48 83 ec 08 65 44 8b 25 0a 9f 06 4b f6
>> 05 53 12
>> <4>[  462.908571] RSP: 0018:ffffaa364054c000 EFLAGS: 00010046
>> <4>[  462.913921] RAX: 0000000000000000 RBX: ffff962b5b81ca80 RCX:
>> ffffffffb6b66b50
>> <4>[  462.919235] RDX: ffffffffb6b66b40 RSI: 0000000000000000 RDI:
>> ffffffffb5059c74
>> <4>[  462.924523] RBP: 0000000000411200 R08: 0000000000000002 R09:
>> 0000000000000001
>> <4>[  462.929772] R10: 0000000001cb731b R11: 0000000001cb731c R12:
>> 0000000000411200
>> <4>[  462.934889] R13: 0000000000000246 R14: ffffaa364054c0c8 R15:
>> ffffffffb4f29520
>> <4>[  462.939888] FS:  0000000000000000(0000)
>> GS:ffff962b5ed80000(0000) knlGS:0000000000000000
>> <4>[  462.944841] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> <4>[  462.949681] CR2: ffffaa364054bff8 CR3: 000000072380c002 CR4:
>> 00000000003606e0
>> <4>[  462.954463] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
>> 0000000000000000
>> <4>[  462.959191] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
>> 0000000000000400
>> <4>[  462.963797] Call Trace:
>> <4>[  462.968280]  ? finish_wait+0x80/0x80
>> <4>[  462.972785]  trace_hardirqs_off+0x2b/0xe0
>> <4>[  462.977174]  kmem_cache_alloc+0x44/0x6b0
>> <4>[  462.981443]  ? trace_hardirqs_on+0x2c/0xe0
>> <4>[  462.985703]  ? finish_wait+0x80/0x80
>> <4>[  462.989939]  mempool_alloc+0x65/0x190
>> <4>[  462.994143]  ? preempt_count_add+0x79/0xb0
>> <4>[  462.998379]  bio_alloc_bioset+0x140/0x210
>> <4>[  463.002628]  f2fs_submit_page_write+0x1bb/0x5e0
>> <4>[  463.006912]  do_write_page+0x99/0x180
>> <4>[  463.011201]  f2fs_outplace_write_data+0x55/0xe0
>> <4>[  463.015538]  f2fs_do_write_data_page+0x588/0x940
>> <4>[  463.019897]  __write_data_page+0x4f2/0x6f0
>> <4>[  463.024251]  f2fs_write_cache_pages+0x1e0/0x450
>> <4>[  463.028616]  ? pointer+0x110/0x3b0
>> <4>[  463.032972]  ? log_store+0xf5/0x260
>> <4>[  463.037183]  f2fs_write_data_pages+0x2ed/0x320
>> <4>[  463.041277]  ? __down_trylock_console_sem.isra.14+0x42/0x50
>> <4>[  463.045404]  ? vprintk_emit+0x28f/0x2a0
>> <4>[  463.049517]  do_writepages+0x41/0xd0
>> <4>[  463.053634]  __filemap_fdatawrite_range+0x81/0xb0
>> <4>[  463.057778]  f2fs_sync_dirty_inodes+0x1dd/0x200
>> <4>[  463.061911]  f2fs_balance_fs_bg+0x2a7/0x2c0
>> <4>[  463.066055]  ? up_read+0x5/0x20
>> <4>[  463.070224]  ? f2fs_do_write_data_page+0x2cb/0x940
>> <4>[  463.074464]  f2fs_balance_fs+0xe5/0x2c0
>> <4>[  463.078742]  __write_data_page+0x5b7/0x6f0
>> <4>[  463.083072]  f2fs_write_cache_pages+0x1e0/0x450
>> <4>[  463.087459]  ? pointer+0x110/0x3b0
>> <4>[  463.091880]  ? log_store+0xf5/0x260
>> <4>[  463.096333]  f2fs_write_data_pages+0x2ed/0x320
>> <4>[  463.100853]  ? trace_hardirqs_on+0x2c/0xe0
>> <4>[  463.105422]  ? trace_hardirqs_on+0x2c/0xe0
>> <4>[  463.109943]  do_writepages+0x41/0xd0
>> <4>[  463.114451]  __filemap_fdatawrite_range+0x81/0xb0
>> <4>[  463.119000]  f2fs_sync_dirty_inodes+0x1dd/0x200
>> <4>[  463.123565]  f2fs_balance_fs_bg+0x2a7/0x2c0
>> <4>[  463.128116]  ? up_read+0x5/0x20
>> <4>[  463.132657]  ? f2fs_do_write_data_page+0x2cb/0x940
>> <4>[  463.137238]  f2fs_balance_fs+0xe5/0x2c0
>> <4>[  463.141817]  __write_data_page+0x5b7/0x6f0
>> <4>[  463.146390]  ? _raw_spin_unlock_irqrestore+0x34/0x40
>> <4>[  463.151025]  f2fs_write_cache_pages+0x1e0/0x450
>> <4>[  463.155642]  ? pointer+0x110/0x3b0
>> <4>[  463.160240]  ? log_store+0xf5/0x260
>> <4>[  463.164859]  f2fs_write_data_pages+0x2ed/0x320
>> <4>[  463.169533]  ? trace_hardirqs_on+0x2c/0xe0
>> <4>[  463.174254]  ? trace_hardirqs_on+0x2c/0xe0
>> <4>[  463.178838]  do_writepages+0x41/0xd0
>> <4>[  463.183323]  __filemap_fdatawrite_range+0x81/0xb0
>> <4>[  463.187757]  f2fs_sync_dirty_inodes+0x1dd/0x200
>> <4>[  463.192105]  f2fs_balance_fs_bg+0x2a7/0x2c0
>> <4>[  463.196367]  ? up_read+0x5/0x20
>> <4>[  463.200592]  ? f2fs_do_write_data_page+0x2cb/0x940
>> <4>[  463.204670]  f2fs_balance_fs+0xe5/0x2c0
>> <4>[  463.208563]  __write_data_page+0x5b7/0x6f0
>> <4>[  463.212425]  f2fs_write_cache_pages+0x1e0/0x450
>> <4>[  463.216279]  ? pointer+0x110/0x3b0
>> <4>[  463.220107]  ? log_store+0xf5/0x260
>> <4>[  463.223927]  f2fs_write_data_pages+0x2ed/0x320
>> <4>[  463.227747]  ? __down_trylock_console_sem.isra.14+0x42/0x50
>> <4>[  463.231564]  ? vprintk_emit+0x28f/0x2a0
>> <4>[  463.235333]  do_writepages+0x41/0xd0
>> <4>[  463.239049]  __filemap_fdatawrite_range+0x81/0xb0
>> <4>[  463.242783]  f2fs_sync_dirty_inodes+0x1dd/0x200
>> <4>[  463.246543]  f2fs_balance_fs_bg+0x2a7/0x2c0
>> <4>[  463.250250]  ? up_read+0x5/0x20
>> <4>[  463.253949]  ? f2fs_do_write_data_page+0x2cb/0x940
>> <4>[  463.257687]  f2fs_balance_fs+0xe5/0x2c0
>> <4>[  463.261419]  __write_data_page+0x5b7/0x6f0
>> <4>[  463.265159]  f2fs_write_cache_pages+0x1e0/0x450
>> <4>[  463.268916]  ? pointer+0x110/0x3b0
>> <4>[  463.272675]  ? log_store+0xf5/0x260
>> <4>[  463.276420]  f2fs_write_data_pages+0x2ed/0x320
>> <4>[  463.280192]  ? trace_hardirqs_on+0x2c/0xe0
>> <4>[  463.283952]  ? trace_hardirqs_on+0x2c/0xe0
>> <4>[  463.287664]  do_writepages+0x41/0xd0
>> <4>[  463.291360]  __filemap_fdatawrite_range+0x81/0xb0
>> <4>[  463.295087]  f2fs_sync_dirty_inodes+0x1dd/0x200
>> <4>[  463.298810]  f2fs_balance_fs_bg+0x2a7/0x2c0
>> <4>[  463.302519]  ? up_read+0x5/0x20
>> <4>[  463.306207]  ? f2fs_do_write_data_page+0x2cb/0x940
>> <4>[  463.309944]  f2fs_balance_fs+0xe5/0x2c0
>> <4>[  463.313670]  __write_data_page+0x5b7/0x6f0
>> <4>[  463.317379]  f2fs_write_cache_pages+0x1e0/0x450
>> <4>[  463.321080]  ? pointer+0x110/0x3b0
>> <4>[  463.324773]  ? log_store+0xf5/0x260
>> <4>[  463.328444]  f2fs_write_data_pages+0x2ed/0x320
>> <4>[  463.332132]  ? trace_hardirqs_on+0x2c/0xe0
>> <4>[  463.335820]  ? trace_hardirqs_on+0x2c/0xe0
>> <4>[  463.339467]  do_writepages+0x41/0xd0
>> <4>[  463.343094]  __filemap_fdatawrite_range+0x81/0xb0
>> <4>[  463.346740]  f2fs_sync_dirty_inodes+0x1dd/0x200
>> <4>[  463.350392]  f2fs_balance_fs_bg+0x2a7/0x2c0
>> <4>[  463.354029]  ? _raw_spin_unlock_irqrestore+0x3d/0x40
>> <4>[  463.357687]  f2fs_balance_fs+0xe5/0x2c0
>> <4>[  463.361353]  __write_data_page+0x5b7/0x6f0
>> <4>[  463.365020]  f2fs_write_cache_pages+0x1e0/0x450
>> <4>[  463.368695]  ? pointer+0x110/0x3b0
>> <4>[  463.372399]  ? log_store+0xf5/0x260
>> <4>[  463.376091]  f2fs_write_data_pages+0x2ed/0x320
>> <4>[  463.379796]  ? __down_trylock_console_sem.isra.14+0x42/0x50
>> <4>[  463.383534]  ? vprintk_emit+0x28f/0x2a0
>> <4>[  463.387267]  do_writepages+0x41/0xd0
>> <4>[  463.390989]  __filemap_fdatawrite_range+0x81/0xb0
>> <4>[  463.394729]  f2fs_sync_dirty_inodes+0x1dd/0x200
>> <4>[  463.398460]  f2fs_balance_fs_bg+0x2a7/0x2c0
>> <4>[  463.402181]  ? up_read+0x5/0x20
>> <4>[  463.405875]  ? f2fs_do_write_data_page+0x2cb/0x940
>> <4>[  463.409590]  f2fs_balance_fs+0xe5/0x2c0
>> <4>[  463.413295]  __write_data_page+0x5b7/0x6f0
>> <4>[  463.417019]  f2fs_write_cache_pages+0x1e0/0x450
>> <4>[  463.420752]  ? pointer+0x110/0x3b0
>> <4>[  463.424466]  ? log_store+0xf5/0x260
>> <4>[  463.428207]  f2fs_write_data_pages+0x2ed/0x320
>> <4>[  463.431971]  ? trace_hardirqs_on+0x2c/0xe0
>> <4>[  463.435729]  ? trace_hardirqs_on+0x2c/0xe0
>> <4>[  463.439437]  do_writepages+0x41/0xd0
>> <4>[  463.443137]  __filemap_fdatawrite_range+0x81/0xb0
>> <4>[  463.446863]  f2fs_sync_dirty_inodes+0x1dd/0x200
>> <4>[  463.450581]  f2fs_balance_fs_bg+0x2a7/0x2c0
>> <4>[  463.454281]  ? up_read+0x5/0x20
>> <4>[  463.457962]  ? f2fs_do_write_data_page+0x2cb/0x940
>> <4>[  463.461671]  f2fs_balance_fs+0xe5/0x2c0
>> <4>[  463.465368]  __write_data_page+0x5b7/0x6f0
>> <4>[  463.469084]  f2fs_write_cache_pages+0x1e0/0x450
>> <4>[  463.472807]  ? pointer+0x110/0x3b0
>> <4>[  463.476499]  ? log_store+0xf5/0x260
>> <4>[  463.480154]  f2fs_write_data_pages+0x2ed/0x320
>> <4>[  463.483842]  ? __down_trylock_console_sem.isra.14+0x42/0x50
>> <4>[  463.487562]  ? vprintk_emit+0x28f/0x2a0
>> <4>[  463.491266]  do_writepages+0x41/0xd0
>> <4>[  463.494963]  __filemap_fdatawrite_range+0x81/0xb0
>> <4>[  463.498684]  f2fs_sync_dirty_inodes+0x1dd/0x200
>> <4>[  463.502397]  f2fs_balance_fs_bg+0x2a7/0x2c0
>> <4>[  463.506098]  ? _raw_spin_unlock_irqrestore+0x3d/0x40
>> <4>[  463.509824]  f2fs_balance_fs+0xe5/0x2c0
>> <4>[  463.513542]  __write_data_page+0x5b7/0x6f0
>> <4>[  463.517257]  f2fs_write_cache_pages+0x1e0/0x450
>> <4>[  463.521001]  ? pointer+0x110/0x3b0
>> <4>[  463.524731]  ? log_store+0xf5/0x260
>> <4>[  463.528437]  f2fs_write_data_pages+0x2ed/0x320
>> <4>[  463.532208]  ? trace_hardirqs_on+0x2c/0xe0
>> <4>[  463.535979]  ? trace_hardirqs_on+0x2c/0xe0
>> <4>[  463.539701]  do_writepages+0x41/0xd0
>> <4>[  463.543413]  __filemap_fdatawrite_range+0x81/0xb0
>> <4>[  463.547150]  f2fs_sync_dirty_inodes+0x1dd/0x200
>> <4>[  463.550888]  f2fs_balance_fs_bg+0x2a7/0x2c0
>> <4>[  463.554611]  ? _raw_spin_unlock_irqrestore+0x3d/0x40
>> <4>[  463.558355]  f2fs_balance_fs+0xe5/0x2c0
>> <4>[  463.562091]  __write_data_page+0x5b7/0x6f0
>> <4>[  463.565824]  f2fs_write_cache_pages+0x1e0/0x450
>> <4>[  463.569569]  f2fs_write_data_pages+0x2ed/0x320
>> <4>[  463.573317]  ? trace_hardirqs_on+0x2c/0xe0
>> <4>[  463.577052]  ? trace_hardirqs_on+0x2c/0xe0
>> <4>[  463.580741]  do_writepages+0x41/0xd0
>> <4>[  463.584464]  __filemap_fdatawrite_range+0x81/0xb0
>> <4>[  463.588216]  f2fs_sync_dirty_inodes+0x1dd/0x200
>> <4>[  463.591965]  f2fs_balance_fs_bg+0x2a7/0x2c0
>> <4>[  463.595696]  ? _raw_spin_unlock_irqrestore+0x3d/0x40
>> <4>[  463.599454]  f2fs_balance_fs+0xe5/0x2c0
>> <4>[  463.603195]  __write_data_page+0x5b7/0x6f0
>> <4>[  463.606931]  f2fs_write_cache_pages+0x1e0/0x450
>> <4>[  463.610679]  ? pointer+0x110/0x3b0
>> <4>[  463.614406]  ? log_store+0xf5/0x260
>> <4>[  463.618115]  f2fs_write_data_pages+0x2ed/0x320
>> <4>[  463.621860]  ? trace_hardirqs_on+0x2c/0xe0
>> <4>[  463.625598]  ? trace_hardirqs_on+0x2c/0xe0
>> <4>[  463.629284]  do_writepages+0x41/0xd0
>> <4>[  463.632926]  __filemap_fdatawrite_range+0x81/0xb0
>> <4>[  463.636607]  f2fs_sync_dirty_inodes+0x1dd/0x200
>> <4>[  463.640281]  f2fs_balance_fs_bg+0x2a7/0x2c0
>> <4>[  463.643949]  ? up_read+0x5/0x20
>> <4>[  463.647596]  ? f2fs_do_write_data_page+0x2cb/0x940
>> <4>[  463.651274]  f2fs_balance_fs+0xe5/0x2c0
>> <4>[  463.654945]  __write_data_page+0x5b7/0x6f0
>> <4>[  463.658605]  f2fs_write_cache_pages+0x1e0/0x450
>> <4>[  463.662281]  f2fs_write_data_pages+0x2ed/0x320
>> <4>[  463.665936]  ? trace_hardirqs_on+0x2c/0xe0
>> <4>[  463.669582]  ? trace_hardirqs_on+0x2c/0xe0
>> <4>[  463.673203]  do_writepages+0x41/0xd0
>> <4>[  463.676809]  __filemap_fdatawrite_range+0x81/0xb0
>> <4>[  463.680434]  f2fs_sync_dirty_inodes+0x1dd/0x200
>> <4>[  463.684108]  f2fs_balance_fs_bg+0x2a7/0x2c0
>> <4>[  463.687775]  ? _raw_spin_unlock_irqrestore+0x3d/0x40
>> <4>[  463.691461]  f2fs_balance_fs+0xe5/0x2c0
>> <4>[  463.695135]  __write_data_page+0x5b7/0x6f0
>> <4>[  463.698813]  f2fs_write_cache_pages+0x1e0/0x450
>> <4>[  463.702513]  ? pointer+0x110/0x3b0
>> <4>[  463.706187]  ? log_store+0xf5/0x260
>> <4>[  463.709837]  f2fs_write_data_pages+0x2ed/0x320
>> <4>[  463.713508]  ? trace_hardirqs_on+0x2c/0xe0
>> <4>[  463.717171]  ? trace_hardirqs_on+0x2c/0xe0
>> <4>[  463.720786]  do_writepages+0x41/0xd0
>> <4>[  463.724405]  __filemap_fdatawrite_range+0x81/0xb0
>> <4>[  463.728046]  f2fs_sync_dirty_inodes+0x1dd/0x200
>> <4>[  463.731666]  f2fs_balance_fs_bg+0x2a7/0x2c0
>> <4>[  463.735258]  ? _raw_spin_unlock_irqrestore+0x3d/0x40
>> <4>[  463.738885]  f2fs_balance_fs+0xe5/0x2c0
>> <4>[  463.742501]  __write_data_page+0x5b7/0x6f0
>> <4>[  463.746115]  f2fs_write_cache_pages+0x1e0/0x450
>> <4>[  463.749744]  ? pointer+0x110/0x3b0
>> <4>[  463.753345]  ? log_store+0xf5/0x260
>> <4>[  463.756920]  f2fs_write_data_pages+0x2ed/0x320
>> <4>[  463.760517]  ? trace_hardirqs_on+0x2c/0xe0
>> <4>[  463.764105]  ? trace_hardirqs_on+0x2c/0xe0
>> <4>[  463.767643]  do_writepages+0x41/0xd0
>> <4>[  463.771191]  __filemap_fdatawrite_range+0x81/0xb0
>> <4>[  463.774760]  f2fs_sync_dirty_inodes+0x1dd/0x200
>> <4>[  463.778328]  f2fs_balance_fs_bg+0x2a7/0x2c0
>> <4>[  463.781928]  ? trace_hardirqs_on+0x2c/0xe0
>> <4>[  463.785524]  ? retint_kernel+0x2d/0x2d
>> <4>[  463.789100]  f2fs_write_node_pages+0x51/0x220
>> <4>[  463.792687]  ? trace_hardirqs_on_caller+0x32/0xf0
>> <4>[  463.796285]  do_writepages+0x41/0xd0
>> <4>[  463.799860]  ? retint_kernel+0x2d/0x2d
>> <4>[  463.803417]  __writeback_single_inode+0x3d/0x3d0
>> <4>[  463.806999]  writeback_sb_inodes+0x1e8/0x410
>> <4>[  463.810573]  __writeback_inodes_wb+0x5d/0xb0
>> <4>[  463.814158]  wb_writeback+0x28f/0x340
>> <4>[  463.817730]  wb_workfn+0x2d3/0x420
>> <4>[  463.821328]  process_one_work+0x1a1/0x3d0
>> <4>[  463.824935]  worker_thread+0x30/0x380
>> <4>[  463.828520]  ? process_one_work+0x3d0/0x3d0
>> <4>[  463.832105]  kthread+0x116/0x130
>> <4>[  463.835675]  ? kthread_create_worker_on_cpu+0x70/0x70
>> <4>[  463.839278]  ret_from_fork+0x3a/0x50
>> <4>[  463.842855] Modules linked in: ipv6 crc_ccitt 8021q garp stp llc
>> nls_cp437 uas usb_storage pl2303 sd_mod x86_pkg_temp_thermal kvm_intel
>> iTCO_wdt kvm irqbypass ghash_clmulni_intel serio_raw i2c_i801 lpc_ich
>> firewire_ohci firewire_core igb crc_itu_t dca ahci libahci
>> processor_thermal_device intel_soc_dts_iosf int340x_thermal_zone
>> pcc_cpufreq efivarfs
>> <4>[  463.851196] ---[ end trace b6d0a43e90218d45 ]---
>> --END log two
>>
>>>
>>> --- a/fs/f2fs/checkpoint.c
>>> +++ b/fs/f2fs/checkpoint.c
>>> @@ -1074,6 +1074,11 @@ int f2fs_sync_dirty_inodes(struct f2fs_sb_info
>>> *sbi,
>>> enum
>>> inode_type type)
>>>
>>>                 F2FS_I(inode)->cp_task = current;
>>>
>>> +               smp_mb();
>>> +
>>> +               printk("sync_dirty_inodes: inode:%lu, cp_task:%p",
>>> +                       inode->i_ino, F2FS_I(inode)->cp_task);
>>> +
>>>                 filemap_fdatawrite(inode->i_mapping);
>>>
>>>                 F2FS_I(inode)->cp_task = NULL;
>>> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
>>> index 88988241a0e8..84fbbd337c37 100644
>>> --- a/fs/f2fs/data.c
>>> +++ b/fs/f2fs/data.c
>>> @@ -2392,6 +2392,10 @@ int f2fs_write_single_data_page(struct page *page,
>>> int
>>> *submitted,
>>>         if (!S_ISDIR(inode->i_mode) && !IS_NOQUOTA(inode) &&
>>>                                         !F2FS_I(inode)->cp_task) {
>>>                 f2fs_submit_ipu_bio(sbi, bio, page);
>>> +
>>> +               printk("write_data_page: inode:%lu, cp_task:%p",
>>> +                       inode->i_ino, F2FS_I(inode)->cp_task);
>>> +
>>>                 f2fs_balance_fs(sbi, need_balance_fs);
>>>         }
>>>
>>> Thanks,
>>
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
