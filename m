Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F94F5F34B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  4 Jul 2019 09:11:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hivu3-0003NA-If; Thu, 04 Jul 2019 07:11:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hivu2-0003N1-2Q
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 04 Jul 2019 07:11:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CHdYOup5WJv/xXzMa7Z7BTzp2baE6HaIrEG1wNrN11w=; b=msI4/cEUIiSdZLscFviN1/26+7
 9ye1du3mg47P3Kd7fGL3vlrs03tsNoE4SPYdGHHU1zPZ5cib4XgfFoOKBbrwRl2S6Huw43fl5fM2H
 AmTzIeHplbU+GRWANFGEi9Efw/QklrweD464kUGMsyRPrUd1scanihciDmQeeNIktgIE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CHdYOup5WJv/xXzMa7Z7BTzp2baE6HaIrEG1wNrN11w=; b=EeqF7/b43yfE9ue9v+ERHdXo3W
 xfNhM62BzCFSrv4XYfmWhLXPSWBJzHYygfhQr1NNas20jVLizDRzqRwmRLLTmOFQ0EaMPStTVdJ9R
 F9eC4O80ZPSVx3WRhD5flBR+oowaeY9UKodySvR5PRL2yJPWuVuZ8gRCjMXj735SqVz8=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hivuA-007f3a-AL
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 04 Jul 2019 07:11:44 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 4BE55896A52E89EC3414;
 Thu,  4 Jul 2019 15:11:33 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.211) with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 4 Jul 2019
 15:11:28 +0800
To: Ocean Chen <oceanchen@google.com>, <jaegeuk@kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>, <linux-kernel@vger.kernel.org>
References: <20190702080503.175149-1-oceanchen@google.com>
 <cfcd3737-3b03-87fe-39e8-566e545cab3a@huawei.com>
 <20190703150355.GA182283@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <65e4ad7b-ffbc-d5c9-9a0f-0532f4c4f5a9@huawei.com>
Date: Thu, 4 Jul 2019 15:11:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190703150355.GA182283@google.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hivuA-007f3a-AL
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: avoid out-of-range memory access
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Ocean,

On 2019/7/3 23:03, Ocean Chen wrote:
> Hi Yu Chao,
> 
> The cur_data_segno only was checked in mount process. In terms of
> security concern, it's better to check value before using it. I know the

Could you explain more about security concern.. Do you get any report from user
or tools that complaining f2fs issue/codes?

I'm not against sanity check for basic core data of filesystem in run-time, but,
in order to troubleshoot root cause of this issue we can trigger panic directly
to dump more info under F2FS_CHECK_FS macro.

So, maybe we can change as below?

blk_off = le16_to_cpu(ckpt->cur_data_blkoff[i]);
+if (blk_off > ENTRIES_IN_SUM) {
+	f2fs_bug_on(1);
+	f2fs_put_page(page, 1);
+	return -EFAULT;
+}

Thanks,

> risk is low. IMHO, it can be safer.
> BTW, I found we can only check blk_off before for loop instead of
> checking 'j' in each iteratoin.
> 
> On Wed, Jul 03, 2019 at 10:07:11AM +0800, Chao Yu wrote:
>> Hi Ocean,
>>
>> If filesystem is corrupted, it should fail mount due to below check in
>> f2fs_sanity_check_ckpt(), so we are safe in read_compacted_summaries() to access
>> entries[0,blk_off], right?
>>
>> 	for (i = 0; i < NR_CURSEG_DATA_TYPE; i++) {
>> 		if (le32_to_cpu(ckpt->cur_data_segno[i]) >= main_segs ||
>> 			le16_to_cpu(ckpt->cur_data_blkoff[i]) >= blocks_per_seg)
>> 			return 1;
>>
>> Thanks,
>>
>> On 2019/7/2 16:05, Ocean Chen wrote:
>>> blk_off might over 512 due to fs corrupt.
>>> Use ENTRIES_IN_SUM to protect invalid memory access.
>>>
>>> v2:
>>> - fix typo
>>> Signed-off-by: Ocean Chen <oceanchen@google.com>
>>> ---
>>>  fs/f2fs/segment.c | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
>>> index 8dee063c833f..a5e8af0bd62e 100644
>>> --- a/fs/f2fs/segment.c
>>> +++ b/fs/f2fs/segment.c
>>> @@ -3403,6 +3403,8 @@ static int read_compacted_summaries(struct f2fs_sb_info *sbi)
>>>  
>>>  		for (j = 0; j < blk_off; j++) {
>>>  			struct f2fs_summary *s;
>>> +			if (j >= ENTRIES_IN_SUM)
>>> +				return -EFAULT;
>>>  			s = (struct f2fs_summary *)(kaddr + offset);
>>>  			seg_i->sum_blk->entries[j] = *s;
>>>  			offset += SUMMARY_SIZE;
>>>
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
