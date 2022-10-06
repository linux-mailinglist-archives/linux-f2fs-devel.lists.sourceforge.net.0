Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 376B15F6A76
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  6 Oct 2022 17:22:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ogShd-0003Yf-CO;
	Thu, 06 Oct 2022 15:22:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ogSha-0003YP-6n
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Oct 2022 15:22:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EevDX70sTVhhnB6lZ/n6j0KvCHOFLDFUNS+/rHz8LQw=; b=L4YSIr8OBvu6kZ1oD+1oos2TVC
 11aNS4+ONCCUrI/i9kfZtZvWW+s3GKFD/IlrGq/FzM/fMQJeypvO4pQCsnkrs2TuMFdo9RwTq3kQX
 AhMqeNpTUTGm5O39vRXFKG4SVSdhbVZjIcWQ8aa3atywwUt9TMwfOOI/sWLHMoM0RnEo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EevDX70sTVhhnB6lZ/n6j0KvCHOFLDFUNS+/rHz8LQw=; b=Su5Ebe4r+Y+tAA429Scz7OShnP
 p6hdi+ZBS/9WT7PVWzS1hpCHGi0n6J+TEyF6It36LiHS1S9EGYIXguy9i3aRHcpJEiNcdt9Z5EVpz
 iZWEiVYjcx4dcU/QMYwGxHPPeAs3axyj9xwfvD8at0lw339ziZmjeN3M74MS38892h+g=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ogShZ-0007PQ-6Q for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Oct 2022 15:22:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E80E2B820D6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  6 Oct 2022 15:22:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FE2AC433D6;
 Thu,  6 Oct 2022 15:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665069733;
 bh=CModKETgYOkafd4EANscH8/Tpa5llX0IY6NQ27y7+Kk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=VGet30b3RjlQiI7T0SQAhuRJybLu8POV5c/gm9zW8xjBLq8BMpDtiMWSqLKUP54tV
 FnLkw4IGRasubvbsbccx9Q/qW1u0jvpTNJrUr02gjlg6ZAx1H4jv+sMq8o8qwZe6oN
 CUqvkEb/T5fdIk7sJeS3mtbaVBb1FyKfbC22QRxxsX842wDM86BoiW3i12pnr5+dvH
 Yk7jFrSHfsh5fJ04qpeF7a8frJFWDZ70gHKn9Vt6F7TqqegbZa6//6h3DCv8V4qfA4
 +bhyx7mkJQe/ZhtInSu4Ps013XKmYqrp0PICU9x7Tyz7hij/XFgx6DtYeLzF6KDrU4
 VwKuGVn8RDqrA==
Message-ID: <a7f3c427-f312-1f80-e989-243a49b7eab9@kernel.org>
Date: Thu, 6 Oct 2022 23:22:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20220925055802.11955-1-chao@kernel.org>
 <YzMnm4vx7dxb+vAA@google.com>
 <f8be286d-a3d9-2426-ab79-34d5c6e80a9c@kernel.org>
 <YzO8P7/XM4OckVSp@google.com>
 <7387ba71-46bd-aed9-d435-f234f486a7a0@kernel.org>
 <YzXjrn7oZzVmUz/n@google.com>
 <45e56fa9-de7a-7858-f032-4433adb2b021@kernel.org>
 <YzduzKQN3xTg1cqh@google.com>
 <d42b88ab-39b6-71ba-a891-5d3a82b486d9@kernel.org>
 <Yzo1krmcr4N58mg+@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <Yzo1krmcr4N58mg+@google.com>
X-Spam-Score: -6.6 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/10/3 9:06, Jaegeuk Kim wrote: > On 10/01, Chao Yu
 wrote: >> On 2022/10/1 6:33, Jaegeuk Kim wrote: >>> On 09/30, Chao Yu wrote:
 >>>> On 2022/9/30 2:27, Jaegeuk Kim wrote: >>>>> On 09/28, Chao Y [...] 
 Content analysis details:   (-6.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -1.4 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ogShZ-0007PQ-6Q
Subject: Re: [f2fs-dev] [PATCH] mkfs.f2fs: update allocation policy for ro
 feature
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/10/3 9:06, Jaegeuk Kim wrote:
> On 10/01, Chao Yu wrote:
>> On 2022/10/1 6:33, Jaegeuk Kim wrote:
>>> On 09/30, Chao Yu wrote:
>>>> On 2022/9/30 2:27, Jaegeuk Kim wrote:
>>>>> On 09/28, Chao Yu wrote:
>>>>>> On 2022/9/28 11:15, Jaegeuk Kim wrote:
>>>>>>> On 09/28, Chao Yu wrote:
>>>>>>>> On 2022/9/28 0:40, Jaegeuk Kim wrote:
>>>>>>>>> On 09/25, Chao Yu wrote:
>>>>>>>>>> Update allocation policy for ro feature:
>>>>>>>>>> - hot_data: allocating blocks by LBA ascending order
>>>>>>>>>> - hot_node: allocating blocks by LBA descending order
>>>>>>>>>
>>>>>>>>> This will increase the RO image size.
>>>>>>>>
>>>>>>>> Shouldn't RO image has fixed-size during mkfs?
>>>>>>>
>>>>>>> First run gives the reduced size information, and second round makes the image
>>>>>>> with the required size.
>>>>>>
>>>>>> I didn't get it, in which step it may increase the RO image size?
>>>>>>
>>>>>> IIUC, after we apply this patch, reduced size information won't change due
>>>>>> to that after sload in first run, total used block count should be fixed?
>>>>>
>>>>> First run fills the data and leaves the maximum LBA touched in the image. Then,
>>>>
>>>> How about caclulating required size w/ total used blocks rather than maximum LBA?
>>>
>>> Do you think that can give the smallest size for the image?
>>
>> I guess so, but let me do some tests to check that.
>>
>> Segments for data block and node block should be calculated separately:
>> required_blks = roundup(data_blks, blks_per_seg) + roundup(node_blks, blks_per_seg)
>>
>> Am I missing something?
> 
> I think that'd be fine tho, please test first.

I did some tests, seems above method works... but original implementation
may have bug, could you please check below patch:

 From 757d8f5191e21065f0c914512c17f963e5a17945 Mon Sep 17 00:00:00 2001
From: Chao Yu <chao@kernel.org>
Date: Thu, 6 Oct 2022 22:09:38 +0800
Subject: [PATCH] sload.f2fs: fix to calculate max size correctly

Max image size should be calculated with round_up().

- dd if=/dev/zero of=img bs=1M count=512
- mkfs.f2fs -O ro -f img

a) sload.f2fs -f <kernel_path>/kernel/ img
b) sload.f2fs -f <kernel_path>/mm/ img
c) sload.f2fs -f <kernel_path>/include/ img

Before:
[FSCK] Max image size: 48 MB, Free space: 462 MB
[FSCK] Max image size: 25 MB, Free space: 485 MB
[FSCK] Max image size: 112 MB, Free space: 398 MB

After:
[FSCK] Max image size: 50 MB, Free space: 460 MB
[FSCK] Max image size: 26 MB, Free space: 484 MB
[FSCK] Max image size: 114 MB, Free space: 396 MB

Signed-off-by: Chao Yu <chao@kernel.org>
---
  fsck/f2fs.h        | 2 ++
  fsck/fsck.c        | 9 ++++++---
  include/f2fs_fs.h  | 6 ++++--
  mkfs/f2fs_format.c | 3 ++-
  4 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/fsck/f2fs.h b/fsck/f2fs.h
index 030d750..88b98f9 100644
--- a/fsck/f2fs.h
+++ b/fsck/f2fs.h
@@ -420,6 +420,8 @@ static inline block_t __end_block_addr(struct f2fs_sb_info *sbi)
  	return end + le64_to_cpu(F2FS_RAW_SUPER(sbi)->block_count);
  }

+#define BLKS_PER_SEC(sbi)						\
+		((sbi)->segs_per_sec * (sbi)->blocks_per_seg)
  #define GET_ZONENO_FROM_SEGNO(sbi, segno)                               \
  	((segno / sbi->segs_per_sec) / sbi->secs_per_zone)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index b1b6722..f6ff986 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -3179,6 +3179,7 @@ int fsck_verify(struct f2fs_sb_info *sbi)
  	struct f2fs_fsck *fsck = F2FS_FSCK(sbi);
  	struct hard_link_node *node = NULL;
  	bool verify_failed = false;
+	uint64_t max_size, free_size;

  	if (c.show_file_map)
  		return 0;
@@ -3229,10 +3230,12 @@ int fsck_verify(struct f2fs_sb_info *sbi)
  		}
  		c.bug_on = 1;
  	}
+
+	max_size = round_up(c.max_size, sbi->blocksize * BLKS_PER_SEC(sbi));
+	free_size = SM_I(sbi)->segment_count * sbi->blocks_per_seg *
+				sbi->blocksize - max_size;
  	printf("[FSCK] Max image size: %"PRIu64" MB, Free space: %u MB\n",
-		c.max_size >> 20,
-		(sbi->user_block_count - sbi->total_valid_block_count) >>
-		(20 - F2FS_BLKSIZE_BITS));
+					max_size >> 20, free_size >> 20);
  	printf("[FSCK] Unreachable nat entries                       ");
  	if (nr_unref_nid == 0x0) {
  		printf(" [Ok..] [0x%x]\n", nr_unref_nid);
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 509d75a..0a99717 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -663,7 +663,8 @@ struct f2fs_configuration {
  	(void) (&_max1 == &_max2);		\
  	_max1 > _max2 ? _max1 : _max2; })

-#define round_up(x, y)		(((x) + (y) - 1) / (y))
+#define div_round_up(x, y)		(((x) + (y) - 1) / (y))
+#define round_up(x, y)			(div_round_up(x, y) * (y))
  /*
   * Copied from fs/f2fs/f2fs.h
   */
@@ -1592,7 +1593,8 @@ static inline double get_best_overprovision(struct f2fs_super_block *sb)

  	for (; candidate <= end; candidate += diff) {
  		reserved = (2 * (100 / candidate + 1) + 6) *
-				round_up(usable_main_segs, get_sb(section_count));
+				div_round_up(usable_main_segs,
+						get_sb(section_count));
  		ovp = (usable_main_segs - reserved) * candidate / 100;
  		space = usable_main_segs - reserved - ovp;
  		if (max_space < space) {
diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
index 40ac589..14f5534 100644
--- a/mkfs/f2fs_format.c
+++ b/mkfs/f2fs_format.c
@@ -485,7 +485,8 @@ static int f2fs_prepare_super_block(void)

  	c.reserved_segments =
  			(2 * (100 / c.overprovision + 1) + NR_CURSEG_TYPE) *
-			round_up(f2fs_get_usable_segments(sb), get_sb(section_count));
+			div_round_up(f2fs_get_usable_segments(sb),
+						get_sb(section_count));

  	if (c.feature & cpu_to_le32(F2FS_FEATURE_RO)) {
  		c.overprovision = 0;
-- 
2.36.1

> 
>>
>> Thanks,
>>
>>>
>>>>
>>>> Thanks,
>>>>
>>>>> it'll resize the image file and run again with the smallest image.
>>>>>
>>>>>>
>>>>>> Thanks,
>>>>>>
>>>>>>>
>>>>>>>>
>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Chao Yu <chao@kernel.org>
>>>>>>>>>> ---
>>>>>>>>>>       mkfs/f2fs_format.c | 4 ++--
>>>>>>>>>>       1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>>>>>>
>>>>>>>>>> diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
>>>>>>>>>> index 40ac589..8d0f410 100644
>>>>>>>>>> --- a/mkfs/f2fs_format.c
>>>>>>>>>> +++ b/mkfs/f2fs_format.c
>>>>>>>>>> @@ -544,10 +544,10 @@ static int f2fs_prepare_super_block(void)
>>>>>>>>>>       	}
>>>>>>>>>>       	if (c.feature & cpu_to_le32(F2FS_FEATURE_RO)) {
>>>>>>>>>> -		c.cur_seg[CURSEG_HOT_NODE] = 0;
>>>>>>>>>> +		c.cur_seg[CURSEG_HOT_NODE] = last_section(last_zone(total_zones));
>>>>>>>>>>       		c.cur_seg[CURSEG_WARM_NODE] = 0;
>>>>>>>>>>       		c.cur_seg[CURSEG_COLD_NODE] = 0;
>>>>>>>>>> -		c.cur_seg[CURSEG_HOT_DATA] = 1;
>>>>>>>>>> +		c.cur_seg[CURSEG_HOT_DATA] = 0;
>>>>>>>>>>       		c.cur_seg[CURSEG_COLD_DATA] = 0;
>>>>>>>>>>       		c.cur_seg[CURSEG_WARM_DATA] = 0;
>>>>>>>>>>       	} else if (c.heap) {
>>>>>>>>>> -- 
>>>>>>>>>> 2.36.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
