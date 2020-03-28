Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CA5196481
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 28 Mar 2020 09:38:34 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jI6z1-00038z-DI; Sat, 28 Mar 2020 08:38:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jI6yz-00037n-7W
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 28 Mar 2020 08:38:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=A3P5dXxyLgdy4jO1RuGsH1TCygZeQcqeYw5b16s+E9k=; b=BrZDrad6epNEmNARf5eeLimIzG
 H6i3fIGfghrzRbYGnW9KWpYPi3aUelOGsMYH7pQ4jcf7LxbjKPIFx/lnIFASWrMvODiwBOhT+kLdC
 5KL/FxLAaExgjiNDIpNqJUki5MpLU3rgmrmzO2SoVdYWd+uuSyQP/1nfU0LfcjVqmyic=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=A3P5dXxyLgdy4jO1RuGsH1TCygZeQcqeYw5b16s+E9k=; b=G9I3An1wa1mVgHoPqOj9I8o4VJ
 DNZGuMsjaJYfLN6oTmqaulTV7lh0h7RUgO+PRBqWJ5xsaCCxB7EDwJh4GVLXN4IsYAwSy5wQlrHuD
 wU4xvMQewPXxF91fW/Y0jS0YDCNrcZp9PNFHiUSJbYuj/Y7SGha71xjPRN2rkdtKfm9Q=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jI6yt-008BRV-Vi
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 28 Mar 2020 08:38:21 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 02B6B1F41F22422873C7;
 Sat, 28 Mar 2020 16:38:05 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.204) with Microsoft SMTP Server (TLS) id 14.3.487.0; Sat, 28 Mar
 2020 16:38:01 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>, Sahitya Tummala <stummala@codeaurora.org>
References: <1585219019-24831-1-git-send-email-stummala@codeaurora.org>
 <20200327192412.GA186975@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <397da8a6-fdb4-9637-c6ea-803492c408a2@huawei.com>
Date: Sat, 28 Mar 2020 16:38:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200327192412.GA186975@google.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: codeaurora.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1jI6yt-008BRV-Vi
Subject: Re: [f2fs-dev] [PATCH] f2fs: prevent meta updates while checkpoint
 is in progress
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

Hi all,

On 2020/3/28 3:24, Jaegeuk Kim wrote:
> Hi Sahitya,
> 
> On 03/26, Sahitya Tummala wrote:
>> allocate_segment_for_resize() can cause metapage updates if
>> it requires to change the current node/data segments for resizing.
>> Stop these meta updates when there is a checkpoint already
>> in progress to prevent inconsistent CP data.
> 
> Doesn't freeze|thaw_bdev(sbi->sb->s_bdev); work for you?

That can avoid foreground ops racing? rather than background ops like
balance_fs() from kworker?

BTW, I found that {freeze,thaw}_bdev is not enough to freeze all
foreground fs ops, it needs to use {freeze,thaw}_super instead.

---
 fs/f2fs/gc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 26248c8936db..acdc8b99b543 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1538,7 +1538,7 @@ int f2fs_resize_fs(struct f2fs_sb_info *sbi, __u64 block_count)
 		return -EINVAL;
 	}

-	freeze_bdev(sbi->sb->s_bdev);
+	freeze_super(sbi->sb);

 	shrunk_blocks = old_block_count - block_count;
 	secs = div_u64(shrunk_blocks, BLKS_PER_SEC(sbi));
@@ -1551,7 +1551,7 @@ int f2fs_resize_fs(struct f2fs_sb_info *sbi, __u64 block_count)
 		sbi->user_block_count -= shrunk_blocks;
 	spin_unlock(&sbi->stat_lock);
 	if (err) {
-		thaw_bdev(sbi->sb->s_bdev, sbi->sb);
+		thaw_super(sbi->sb);
 		return err;
 	}

@@ -1613,6 +1613,6 @@ int f2fs_resize_fs(struct f2fs_sb_info *sbi, __u64 block_count)
 	}
 	clear_sbi_flag(sbi, SBI_IS_RESIZEFS);
 	mutex_unlock(&sbi->resize_mutex);
-	thaw_bdev(sbi->sb->s_bdev, sbi->sb);
+	thaw_super(sbi->sb);
 	return err;
 }
-- 
2.18.0.rc1

> 
>>
>> Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
>> ---
>>  fs/f2fs/gc.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
>> index 5bca560..6122bad 100644
>> --- a/fs/f2fs/gc.c
>> +++ b/fs/f2fs/gc.c
>> @@ -1399,8 +1399,10 @@ static int free_segment_range(struct f2fs_sb_info *sbi, unsigned int start,
>>  	int err = 0;
>>  
>>  	/* Move out cursegs from the target range */
>> +	f2fs_lock_op(sbi);
>>  	for (type = CURSEG_HOT_DATA; type < NR_CURSEG_TYPE; type++)
>>  		allocate_segment_for_resize(sbi, type, start, end);
>> +	f2fs_unlock_op(sbi);
>>  
>>  	/* do GC to move out valid blocks in the range */
>>  	for (segno = start; segno <= end; segno += sbi->segs_per_sec) {
>> -- 
>> Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.
>> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
