Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0911F2A7600
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  5 Nov 2020 04:16:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kaVlR-0001T6-37; Thu, 05 Nov 2020 03:16:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kaVlM-0001SQ-Go
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 05 Nov 2020 03:16:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RO0x8HnerRhOX8IvLzZSZc0SZWuef+U8mnTfuKmi4Vo=; b=Cl51qTDQNUqbOzVS7G+VT7TWkr
 OLTcMuRMUsu18tujuHGTGEYB6guFFFIzzTLMOxj+5jiCciiE+SeFaOB6/zhdeNN6/TRaGr8h6Ujtb
 11bg4QAY0i3QZfS8DDq6eGh/xr+yXDRf7ohAXObtSdHxnvL/goW3RtmYL/I/YfSBaV+E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RO0x8HnerRhOX8IvLzZSZc0SZWuef+U8mnTfuKmi4Vo=; b=mk0mVrSwcvnLa1CrRBGG5s89iU
 9Yzxcz0SEu3N32/WewbKnI0u1gwfxnb4vg/6ZCVaOTL1NXamjRraV04VIu1nhT5NkWMD3+0qsEOOn
 evMOwCK3vosj553TSbNyNCotmsvpMkYhaqLU84MRYYNw+TtVLULeegYUQ/EsRbxbMuBY=;
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kaVl3-001um6-St
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 05 Nov 2020 03:16:36 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4CRTDs4F93zhclL;
 Thu,  5 Nov 2020 11:15:57 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.212) with Microsoft SMTP Server (TLS) id 14.3.487.0; Thu, 5 Nov 2020
 11:15:54 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>, Daejun Park <daejun7.park@samsung.com>
References: <CGME20201103083832epcms2p6c8b0e4470f1392772317ab2b25256b3d@epcms2p6>
 <20201103083832epcms2p6c8b0e4470f1392772317ab2b25256b3d@epcms2p6>
 <20201103185808.GB1273166@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <4be2e157-fbc1-6e2c-cdd7-a32514884754@huawei.com>
Date: Thu, 5 Nov 2020 11:15:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20201103185808.GB1273166@google.com>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: samsung.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.32 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kaVl3-001um6-St
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: change write_hint for hot/warm nodes
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
Cc: yongmyung lee <ymhungry.lee@samsung.com>,
 Jieon Seol <jieon.seol@samsung.com>, Sang-yoon Oh <sangyoon.oh@samsung.com>,
 Mankyu PARK <manq.park@samsung.com>,
 Sung-Jun Park <sungjun07.park@samsung.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 Keoseong Park <keosung.park@samsung.com>,
 SEUNGUK SHIN <seunguk.shin@samsung.com>,
 Jinyoung CHOI <j-young.choi@samsung.com>,
 Jaemyung Lee <jaemyung.lee@samsung.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/11/4 2:58, Jaegeuk Kim wrote:
> On 11/03, Daejun Park wrote:
>> In the fs-based mode of F2FS, the mapping of hot/warm node to
>> WRITE_LIFE_NOT_SET should be changed to WRITE_LIFE_SHORT.
>>
>> As a result of analyzing the write pattern of f2fs using real workload,
>> hot/warm nodes have high update ratio close to hot data.[*]
>> However, F2FS passes write hints for hot/warm nodes as WRITE_LIFE_NOT_SET.
> 
> I prefer to keep it as is, since basically node blocks should be separatly
> stored from data blocks in different erase blocks in order to match F2FS GC

Correct, I missed that the change will break HOT_DATA type and {HOT,WARM}_NODE
type data separation in FTL.

> and FTL GC units. And, we don't do IPU for node blocks which doesn't make sense
> to say *update ratio*.

IMO, if fs discard is fast enough, both IPU and OPU will cause original blkaddr in
FTL being invalid, we can compare update ratio on {I,O}PU IOs inside FTL; otherwise,
we can't.

Thanks,

> 
>>
>> Furthermore, WRITE_LIFE_NOT_SET is a default value of write hint when it is
>> not provided from the file system.
>> In storage, write_hint is used to distinguish streams (e.g. NVMe).
>> So, the hot/warm node of F2FS is not distinguished from other write_hints,
>> which can make the wrong stream seperation.
>>
>> * Liang, Yu, et al. "An empirical study of F2FS on mobile devices." 2017
>> IEEE 23rd International Conference on Embedded and Real-Time Computing
>> Systems and Applications (RTCSA).
>>
>> Signed-off-by: Daejun Park <daejun7.park@samsung.com>
>> ---
>> v2: update documentation and comments
>> ---
>>   Documentation/filesystems/f2fs.rst | 4 ++--
>>   fs/f2fs/segment.c                  | 6 +++---
>>   2 files changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
>> index b8ee761c9922..afa3da7cfade 100644
>> --- a/Documentation/filesystems/f2fs.rst
>> +++ b/Documentation/filesystems/f2fs.rst
>> @@ -717,8 +717,8 @@ WRITE_LIFE_LONG       "                        WRITE_LIFE_LONG
>>   ===================== ======================== ===================
>>   User                  F2FS                     Block
>>   ===================== ======================== ===================
>> -                      META                     WRITE_LIFE_MEDIUM;
>> -                      HOT_NODE                 WRITE_LIFE_NOT_SET
>> +                      META                     WRITE_LIFE_MEDIUM
>> +                      HOT_NODE                 WRITE_LIFE_SHORT
>>                         WARM_NODE                "
>>                         COLD_NODE                WRITE_LIFE_NONE
>>   ioctl(COLD)           COLD_DATA                WRITE_LIFE_EXTREME
>> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
>> index 1596502f7375..577ab7516c6b 100644
>> --- a/fs/f2fs/segment.c
>> +++ b/fs/f2fs/segment.c
>> @@ -3160,8 +3160,8 @@ int f2fs_rw_hint_to_seg_type(enum rw_hint hint)
>>    *
>>    * User                  F2FS                     Block
>>    * ----                  ----                     -----
>> - *                       META                     WRITE_LIFE_MEDIUM;
>> - *                       HOT_NODE                 WRITE_LIFE_NOT_SET
>> + *                       META                     WRITE_LIFE_MEDIUM
>> + *                       HOT_NODE                 WRITE_LIFE_SHORT
>>    *                       WARM_NODE                "
>>    *                       COLD_NODE                WRITE_LIFE_NONE
>>    * ioctl(COLD)           COLD_DATA                WRITE_LIFE_EXTREME
>> @@ -3208,7 +3208,7 @@ enum rw_hint f2fs_io_type_to_rw_hint(struct f2fs_sb_info *sbi,
>>   				return WRITE_LIFE_EXTREME;
>>   		} else if (type == NODE) {
>>   			if (temp == WARM || temp == HOT)
>> -				return WRITE_LIFE_NOT_SET;
>> +				return WRITE_LIFE_SHORT;
>>   			else if (temp == COLD)
>>   				return WRITE_LIFE_NONE;
>>   		} else if (type == META) {
>> -- 
>> 2.25.1
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
