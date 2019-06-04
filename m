Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8244C33CCE
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Jun 2019 03:44:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hXyUq-00063s-6q; Tue, 04 Jun 2019 01:44:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hXyUo-00063c-Df
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 04 Jun 2019 01:44:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7mSXNQhxhkkMamhuHvEx33pLIsHLesYo22S6evLGWoc=; b=RNaPADS/xtMLqqX5dFkbda+rZb
 qWuUFtqx3Xq3dRCfPQ8e3YoNUUflS6fKwYWaeED3wFus2pVPapH2wCBXpPKu5WukIzCbudR6vvNHb
 iSvSJLPlJzHjysunUp65Ty9OVfVov0Uzigzg4H5aoEgaCm/CXIh/56ymkj1gPaWbGc8A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7mSXNQhxhkkMamhuHvEx33pLIsHLesYo22S6evLGWoc=; b=h7vNrjcSnwVw/dGy6nvPONrnB6
 IFjd2kMU2kF1srSgY7QXTdihLp78gGXjSXoUOlm6/wxmrlgZV+5Z5mhlr9RpiGT1SyMjNh/T0eXFe
 TLn7GpcFDxDmUyeA5Wmnbq02jL/D69p99i7vXzlaMsnykwLZC0UzjBBSk9x2MCnaiGOA=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hXyUl-005K3L-On
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 04 Jun 2019 01:44:14 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 2558810D7BF66412846D;
 Tue,  4 Jun 2019 09:44:03 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.214) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 4 Jun 2019
 09:43:56 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20190524015555.12622-1-sunqiuyang@huawei.com>
 <20190530160626.GA28719@jaegeuk-macbookpro.roam.corp.google.com>
 <786721cc-90eb-cf2c-eed8-3be0ef9dff8c@huawei.com>
 <20190603162319.GA34729@jaegeuk-macbookpro.roam.corp.google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <ba9aaee7-6bc4-b8d4-4670-54f11fc0cea0@huawei.com>
Date: Tue, 4 Jun 2019 09:43:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190603162319.GA34729@jaegeuk-macbookpro.roam.corp.google.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hXyUl-005K3L-On
Subject: Re: [f2fs-dev] [PATCH v6 1/1] f2fs: ioctl for removing a range from
 F2FS
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
Cc: linux-fsdevel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 sunqiuyang <sunqiuyang@huawei.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/6/4 0:23, Jaegeuk Kim wrote:
> On 05/31, Chao Yu wrote:
>> On 2019/5/31 0:06, Jaegeuk Kim wrote:
>>> On 05/24, sunqiuyang wrote:
>>>> From: Qiuyang Sun <sunqiuyang@huawei.com>
>>>>
>>>> This ioctl shrinks a given length (aligned to sections) from end of the
>>>> main area. Any cursegs and valid blocks will be moved out before
>>>> invalidating the range.
>>>>
>>>> This feature can be used for adjusting partition sizes online.
>>>> --
>>>> Changlog v1 ==> v2:
>>>>
>>>> Sahitya Tummala:
>>>>  - Add this ioctl for f2fs_compat_ioctl() as well.
>>>>  - Fix debugfs status to reflect the online resize changes.
>>>>  - Fix potential race between online resize path and allocate new data
>>>>    block path or gc path.
>>>>
>>>> Others:
>>>>  - Rename some identifiers.
>>>>  - Add some error handling branches.
>>>>  - Clear sbi->next_victim_seg[BG_GC/FG_GC] in shrinking range.
>>>> --
>>>> Changelog v2 ==> v3:
>>>> Implement this interface as ext4's, and change the parameter from shrunk
>>>> bytes to new block count of F2FS.
>>>> --
>>>> Changelog v3 ==> v4:
>>>>  - During resizing, force to empty sit_journal and forbid adding new
>>>>    entries to it, in order to avoid invalid segno in journal after resize.
>>>>  - Reduce sbi->user_block_count before resize starts.
>>>>  - Commit the updated superblock first, and then update in-memory metadata
>>>>    only when the former succeeds.
>>>>  - Target block count must align to sections.
>>>> --
>>>> Changelog v4 ==> v5:
>>>> Write checkpoint before and after committing the new superblock, w/o
>>>> CP_FSCK_FLAG respectively, so that the FS can be fixed by fsck even if
>>>> resize fails after the new superblock is committed.
>>>> --
>>>> Changelog v5 ==> v6:
>>>>  - In free_segment_range(), reduce granularity of gc_mutex.
>>>>  - Add protection on curseg migration.
>>>>
>>>> Signed-off-by: Qiuyang Sun <sunqiuyang@huawei.com>
>>>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
>>>> Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
>>>> ---
>>>>  fs/f2fs/checkpoint.c |   5 +-
>>>>  fs/f2fs/debug.c      |   7 +++
>>>>  fs/f2fs/f2fs.h       |   7 +++
>>>>  fs/f2fs/file.c       |  28 +++++++++++
>>>>  fs/f2fs/gc.c         | 134 ++++++++++++++++++++++++++++++++++++++++++++++++++-
>>>>  fs/f2fs/segment.c    |  54 +++++++++++++++++----
>>>>  fs/f2fs/segment.h    |   1 +
>>>>  fs/f2fs/super.c      |   4 ++
>>>>  8 files changed, 228 insertions(+), 12 deletions(-)
>>>>
>>>> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
>>>> index ed70b68..4706d0a 100644
>>>> --- a/fs/f2fs/checkpoint.c
>>>> +++ b/fs/f2fs/checkpoint.c
>>>> @@ -1313,8 +1313,11 @@ static void update_ckpt_flags(struct f2fs_sb_info *sbi, struct cp_control *cpc)
>>>>  	else
>>>>  		__clear_ckpt_flags(ckpt, CP_ORPHAN_PRESENT_FLAG);
>>>>  
>>>> -	if (is_sbi_flag_set(sbi, SBI_NEED_FSCK))
>>>> +	if (is_sbi_flag_set(sbi, SBI_NEED_FSCK) ||
>>>> +		is_sbi_flag_set(sbi, SBI_IS_RESIZEFS))
>>>>  		__set_ckpt_flags(ckpt, CP_FSCK_FLAG);
>>>> +	else
>>>> +		__clear_ckpt_flags(ckpt, CP_FSCK_FLAG);
>>>
>>> We don't need to clear this flag.
>>
>> During resizefs, we may face inconsistent status of filesystem's on-disk data,
>> so I propose to use below flow, so once some thing breaks resizefs, fsck can
>> detect the corruption by the CP_FSCK_FLAG directly.
>>
>> - resizefs()
>>  - set SBI_IS_RESIZEFS
>>  - do_checkpoint()
>>   - if (is_resizing)
>>    - set CP_FSCK_FLAG
>>
>>  - clear SBI_IS_RESIZEFS
>>  - do_checkpoint()
>>   - if (!is_resizing && not_need_fsck)
>>    - clear CP_FSCK_FLAG
>>
>> It's safe to clear CP_FSCK_FLAG if there is no resizing and corruption, as once
>> the inconsistency was detected we will keep SBI_NEED_FSCK in memory anyway, then
>> checkpoint can set CP_FSCK_FLAG again.
> 
> This tries to resize the image and I mostly worried whether fsck is able to fix

So, Qiuyang, could you try break resizefs at some key points with power-cut, to
check whether fsck can repair all corruption cases? and what is the result
(resized fs or origianl fs)?

> the corrupted metadata area. Moreover, I'm in doubt we really need to do this in
> parallel with FS operations.

What do you mean? We have wrapped main resizefs operaion with
{freeze,thaw}_bdev, so there should be no parallel FS operations.

Thanks,



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
