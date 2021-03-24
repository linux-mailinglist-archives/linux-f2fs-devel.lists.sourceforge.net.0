Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D291C3472F7
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Mar 2021 08:49:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lOyGT-0003rh-QA; Wed, 24 Mar 2021 07:49:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1lOyGR-0003rZ-G2
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 24 Mar 2021 07:49:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=REk9Ow+oumM9ig0pGqRRwd6bqXzR3Q7BHD/Dg15xPxk=; b=GINgrFpx0wy+DonfbRGbUM5KXO
 T3oaALO78OC32ZDCOPkmiKLNVW0dTQEQIJaeL7/+feVRbUJBdDwHs420xmJQpC8LulblZ+4diNNoe
 PuGbV+kKHg23MAWcQJaymev289cxq6Me5STrm7au9ZYvrNijkFfZRVADGpF8dMtYdgTk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=REk9Ow+oumM9ig0pGqRRwd6bqXzR3Q7BHD/Dg15xPxk=; b=FIimPCs8SkksgqSdVQPFlHdP06
 Q6wlAfBIHnSVUiNkkAtgw7LNWZrP0aw+xCckyEyPdr+l7hu0YU1Jfg3QtQxWxgeOGfZ5J+l2purQz
 4Qfjb+auHHi0W7gjNy7iy8lAFxgkiWs3rPHeC3m4Dr28NECX6F3PmBFAnDm6ngk5tIBc=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lOyGN-0007GW-9j
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 24 Mar 2021 07:49:15 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F50fn3nyNznV4Q;
 Wed, 24 Mar 2021 15:46:25 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by smtp.huawei.com
 (10.3.19.212) with Microsoft SMTP Server (TLS) id 14.3.498.0; Wed, 24 Mar
 2021 15:48:51 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20210323064155.12582-1-yuchao0@huawei.com>
 <YFo16ADpWJ7OUAvK@google.com>
 <107e671d-68ea-1a74-521e-ab2b6fe36416@huawei.com>
 <YFq+aQW7eihFuSst@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <c5850f4b-ebe8-bc34-10c6-ab27d562d621@huawei.com>
Date: Wed, 24 Mar 2021 15:48:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <YFq+aQW7eihFuSst@google.com>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lOyGN-0007GW-9j
Subject: Re: [f2fs-dev] [PATCH] Revert "f2fs: give a warning only for
 readonly partition"
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/3/24 12:22, Jaegeuk Kim wrote:
> On 03/24, Chao Yu wrote:
>> On 2021/3/24 2:39, Jaegeuk Kim wrote:
>>> On 03/23, Chao Yu wrote:
>>>> This reverts commit 938a184265d75ea474f1c6fe1da96a5196163789.
>>>>
>>>> Because that commit fails generic/050 testcase which expect failure
>>>> during mount a recoverable readonly partition.
>>>
>>> I think we need to change generic/050, since f2fs can recover this partition,
>>
>> Well, not sure we can change that testcase, since it restricts all generic
>> filesystems behavior. At least, ext4's behavior makes sense to me:
>>
>> 	journal_dev_ro = bdev_read_only(journal->j_dev);
>> 	really_read_only = bdev_read_only(sb->s_bdev) | journal_dev_ro;
>>
>> 	if (journal_dev_ro && !sb_rdonly(sb)) {
>> 		ext4_msg(sb, KERN_ERR,
>> 			 "journal device read-only, try mounting with '-o ro'");
>> 		err = -EROFS;
>> 		goto err_out;
>> 	}
>>
>> 	if (ext4_has_feature_journal_needs_recovery(sb)) {
>> 		if (sb_rdonly(sb)) {
>> 			ext4_msg(sb, KERN_INFO, "INFO: recovery "
>> 					"required on readonly filesystem");
>> 			if (really_read_only) {
>> 				ext4_msg(sb, KERN_ERR, "write access "
>> 					"unavailable, cannot proceed "
>> 					"(try mounting with noload)");
>> 				err = -EROFS;
>> 				goto err_out;
>> 			}
>> 			ext4_msg(sb, KERN_INFO, "write access will "
>> 			       "be enabled during recovery");
>> 		}
>> 	}
>>
>>> even though using it as readonly. And, valid checkpoint can allow for user to
>>> read all the data without problem.
>>
>>>>    		if (f2fs_hw_is_readonly(sbi)) {
>>
>> Since device is readonly now, all write to the device will fail, checkpoint can
>> not persist recovered data, after page cache is expired, user can see stale data.
> 
> My point is, after mount with ro, there'll be no data write which preserves the
> current status. So, in the next time, we can recover fsync'ed data later, if
> user succeeds to mount as rw. Another point is, with the current checkpoint, we
> should not have any corrupted metadata. So, why not giving a chance to show what
> data remained to user? I think this can be doable only with CoW filesystems.

I guess we're talking about the different things...

Let me declare two different readonly status:

1. filesystem readonly: file system is mount with ro mount option, and
app from userspace can not modify any thing of filesystem, but filesystem
itself can modify data on device since device may be writable.

2. device readonly: device is set to readonly status via 'blockdev --setro'
command, and then filesystem should never issue any write IO to the device.

So, what I mean is, *when device is readonly*, rather than f2fs mountpoint
is readonly (f2fs_hw_is_readonly() returns true as below code, instead of
f2fs_readonly() returns true), in this condition, we should not issue any
write IO to device anyway, because, AFAIK, write IO will fail due to
bio_check_ro() check.

  		if (f2fs_hw_is_readonly(sbi)) {
-			if (!is_set_ckpt_flags(sbi, CP_UMOUNT_FLAG)) {
-				err = -EROFS;
+			if (!is_set_ckpt_flags(sbi, CP_UMOUNT_FLAG))
  				f2fs_err(sbi, "Need to recover fsync data, but write access unavailable");
-				goto free_meta;
-			}
-			f2fs_info(sbi, "write access unavailable, skipping recovery");
+			else
+				f2fs_info(sbi, "write access unavailable, skipping recovery");
  			goto reset_checkpoint;
  		}

For the case of filesystem is readonly and device is writable, it's fine
to do recovery in order to let user to see fsynced data.

Thanks,

> 
>>
>> Am I missing something?
>>
>> Thanks,
>>
>>>
>>>>
>>>> Fixes: 938a184265d7 ("f2fs: give a warning only for readonly partition")
>>>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
>>>> ---
>>>>    fs/f2fs/super.c | 8 +++++---
>>>>    1 file changed, 5 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
>>>> index b48281642e98..2b78ee11f093 100644
>>>> --- a/fs/f2fs/super.c
>>>> +++ b/fs/f2fs/super.c
>>>> @@ -3952,10 +3952,12 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>>>>    		 * previous checkpoint was not done by clean system shutdown.
>>>>    		 */
>>>>    		if (f2fs_hw_is_readonly(sbi)) {
>>>> -			if (!is_set_ckpt_flags(sbi, CP_UMOUNT_FLAG))
>>>> +			if (!is_set_ckpt_flags(sbi, CP_UMOUNT_FLAG)) {
>>>> +				err = -EROFS;
>>>>    				f2fs_err(sbi, "Need to recover fsync data, but write access unavailable");
>>>> -			else
>>>> -				f2fs_info(sbi, "write access unavailable, skipping recovery");
>>>> +				goto free_meta;
>>>> +			}
>>>> +			f2fs_info(sbi, "write access unavailable, skipping recovery");
>>>>    			goto reset_checkpoint;
>>>>    		}
>>>> -- 
>>>> 2.29.2
>>> .
>>>
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
