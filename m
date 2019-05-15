Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 732721EADF
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 May 2019 11:23:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hQq8K-00076u-Tb; Wed, 15 May 2019 09:23:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hQq8F-00076X-1e
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 May 2019 09:23:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YJCmj5+irrST24WvvVbcyb++VIuL6brDIANP6UbuMKM=; b=B9j+yrpzRsYtJPqf5O2YFs6HAc
 0BcOuGSY1Dw3EpArZjCW2X35f8Skk9X5gdBLa4MtqMWQ9r/r3gTB+mlE8KQArIorURaq4L3BvtapW
 QPrsyl45QEw6mTHgAaIZ1AEDek919d7IxJ9rYWPaSqsZJSYaEI7PUl8S6TTrtriEi6r8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YJCmj5+irrST24WvvVbcyb++VIuL6brDIANP6UbuMKM=; b=VwTiEWMUcBc4m/eKZQKoGWGwey
 z/r1pEzF7qTWF2V2YEAjdju/Wmkni0IzPQwDv5vW7hQwSRIQH9cxnG0rHC++WosVKOSLi0aa+48xq
 OHvW7wtWEod3wrSk8XRuGtSEw4Jh7qcCeVfxe86do/wxAGQh46o4dQuwAfLKbw7Bzrzk=;
Received: from szxga03-in.huawei.com ([45.249.212.189] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hQq8A-00H1is-Id
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 May 2019 09:23:26 +0000
Received: from DGGEMM406-HUB.china.huawei.com (unknown [172.30.72.57])
 by Forcepoint Email with ESMTP id 634B813EB59534B53952;
 Wed, 15 May 2019 17:23:13 +0800 (CST)
Received: from dggeme763-chm.china.huawei.com (10.3.19.109) by
 DGGEMM406-HUB.china.huawei.com (10.3.20.214) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 15 May 2019 17:23:10 +0800
Received: from [10.134.22.195] (10.134.22.195) by
 dggeme763-chm.china.huawei.com (10.3.19.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 15 May 2019 17:23:10 +0800
To: Ju Hyung Park <qkrwngud825@gmail.com>
References: <20190514093340.40217-1-yuchao0@huawei.com>
 <20190514093340.40217-2-yuchao0@huawei.com>
 <CAD14+f2ckNUv9n-Zb9UL_ojX8=24tYBhT-SsrcpVNogqee2tkA@mail.gmail.com>
 <6bcbb5e8-55ad-49c1-bb77-f7f677ceb526@huawei.com>
 <CAD14+f3NHosrL=5UOBSMbFxQ91x-AuWOj_w=JYkJSnmfDgTkvA@mail.gmail.com>
 <CAD14+f0ZTmmLBXtmHF_Kz23JLSJy+UzpNxwSMV4rvSCse3y7EA@mail.gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <7e1bfa07-5ee8-a276-fe6a-6d79bd9270c3@huawei.com>
Date: Wed, 15 May 2019 17:23:10 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAD14+f0ZTmmLBXtmHF_Kz23JLSJy+UzpNxwSMV4rvSCse3y7EA@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-ClientProxiedBy: dggeme704-chm.china.huawei.com (10.1.199.100) To
 dggeme763-chm.china.huawei.com (10.3.19.109)
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
X-Headers-End: 1hQq8A-00H1is-Id
Subject: Re: [f2fs-dev] [PATCH v3 2/2] f2fs-tools: relocate chksum_offset
 for large_nat_bitmap feature
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Ju Hyung,

On 2019/5/15 12:50, Ju Hyung Park wrote:
> Hi Chao,
> 
> The new logs are at
> http://arter97.com/f2fs/v3
> 
> The first run spits out 60MB worth of log
> and the second run spits out 170MB worth of log
> and the third run now returns everything's ok.
> 
> Returning ok after 2nd run is good news, but the user would expect
> everything to be fixed with just the first run of fsck'ing. Is this
> expected?

No, I think we should fix all problem at first time.

I checked the log and code, and have no idea why this happened, the logs show
that valid block still has invalid sit bitmap after 1st fsck.

log1, line: 381518

[ASSERT] (fsck_chk_data_blk:1640)  --> SIT bitmap is 0x0. blk_addr[0x36ea64c]

log2, line: 128537
[ASSERT] (fsck_chk_data_blk:1640)  --> SIT bitmap is 0x0. blk_addr[0x36ea64c]

However, it shouldn't be, since we will repair sit bitmap in below path:

- fsck_verify
 - rewrite_sit_area_bitmap

So I doubt that sit version bitmap is corrupted, could you add below log and
reproduce this issue?

diff --git a/fsck/fsck.c b/fsck/fsck.c
index b5daeb4..0fc9919 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -1617,6 +1617,9 @@ int fsck_chk_data_blk(struct f2fs_sb_info *sbi, u32 blk_addr,
                int enc_name)
 {
        struct f2fs_fsck *fsck = F2FS_FSCK(sbi);
+       struct sit_info *sit_i = SIT_I(sbi);
+       unsigned int offset =
+               SIT_BLOCK_OFFSET(sit_i, GET_SEGNO(sbi, blk_addr));

        /* Is it reserved block? */
        if (blk_addr == NEW_ADDR) {
@@ -1637,7 +1640,9 @@ int fsck_chk_data_blk(struct f2fs_sb_info *sbi, u32 blk_addr,
        }

        if (f2fs_test_sit_bitmap(sbi, blk_addr) == 0)
-               ASSERT_MSG("SIT bitmap is 0x0. blk_addr[0x%x]", blk_addr);
+               ASSERT_MSG("SIT bitmap is 0x0. bitmap:%d, blk_addr[0x%x]",
+                       f2fs_test_bit(offset, sit_i->sit_bitmap)
+                       blk_addr);

        if (f2fs_test_main_bitmap(sbi, blk_addr) != 0)
                ASSERT_MSG("Duplicated data [0x%x]. pnid[0x%x] idx[0x%x]",

Thanks,

> 
> I'll test the new kernel soon.
> 
> Thanks.
> 
> On Tue, May 14, 2019 at 6:54 PM Ju Hyung Park <qkrwngud825@gmail.com> wrote:
>>
>> Ah, sorry. I typed too soon.
>>
>> I'll make sure to test this sooner than later.
>> Sorry for the delay.
>>
>> Thanks :)
>>
>> On Tue, May 14, 2019, 6:43 PM Chao Yu <yuchao0@huawei.com> wrote:
>>>
>>> Hi Ju Hyung,
>>>
>>> This is the change on tools part. ;)
>>>
>>> Thanks,
>>>
>>> On 2019/5/14 17:38, Ju Hyung Park wrote:
>>>> Hi Chao,
>>>>
>>>> I believe Jaegeuk already queued v2 for Linus, I think you should probably
>>>> make this as a separate patch.
>>>>
>>>> Thanks.
>>>>
>>>> On Tue, May 14, 2019, 6:35 PM Chao Yu <yuchao0@huawei.com> wrote:
>>>>
>>>>> For large_nat_bitmap feature, there is a design flaw:
>>>>>
>>>>> Previous:
>>>>>
>>>>> struct f2fs_checkpoint layout:
>>>>> +--------------------------+  0x0000
>>>>> | checkpoint_ver           |
>>>>> | ......                   |
>>>>> | checksum_offset          |------+
>>>>> | ......                   |      |
>>>>> | sit_nat_version_bitmap[] |<-----|-------+
>>>>> | ......                   |      |       |
>>>>> | checksum_value           |<-----+       |
>>>>> +--------------------------+  0x1000      |
>>>>> |                          |      nat_bitmap + sit_bitmap
>>>>> | payload blocks           |              |
>>>>> |                          |              |
>>>>> +--------------------------|<-------------+
>>>>>
>>>>> Obviously, if nat_bitmap size + sit_bitmap size is larger than
>>>>> MAX_BITMAP_SIZE_IN_CKPT, nat_bitmap or sit_bitmap may overlap
>>>>> checkpoint checksum's position, once checkpoint() is triggered
>>>>> from kernel, nat or sit bitmap will be damaged by checksum field.
>>>>>
>>>>> In order to fix this, let's relocate checksum_value's position
>>>>> to the head of sit_nat_version_bitmap as below, then nat/sit
>>>>> bitmap and chksum value update will become safe.
>>>>>
>>>>> After:
>>>>>
>>>>> struct f2fs_checkpoint layout:
>>>>> +--------------------------+  0x0000
>>>>> | checkpoint_ver           |
>>>>> | ......                   |
>>>>> | checksum_offset          |------+
>>>>> | ......                   |      |
>>>>> | sit_nat_version_bitmap[] |<-----+
>>>>> | ......                   |<-------------+
>>>>> |                          |              |
>>>>> +--------------------------+  0x1000      |
>>>>> |                          |      nat_bitmap + sit_bitmap
>>>>> | payload blocks           |              |
>>>>> |                          |              |
>>>>> +--------------------------|<-------------+
>>>>>
>>>>> Related report and discussion:
>>>>>
>>>>> https://sourceforge.net/p/linux-f2fs/mailman/message/36642346/
>>>>>
>>>>> In addition, during writing checkpoint, if large_nat_bitmap feature is
>>>>> enabled, we need to set CP_LARGE_NAT_BITMAP_FLAG flag in checkpoint.
>>>>>
>>>>> Reported-by: Park Ju Hyung <qkrwngud825@gmail.com>
>>>>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
>>>>> ---
>>>>> v3:
>>>>> - if large_nat_bitmap is off, fix to configure checksum_offset to
>>>>> CP_CHKSUM_OFFSET.
>>>>>  fsck/f2fs.h        |  9 ++++++++-
>>>>>  fsck/fsck.c        | 37 +++++++++++++++++++++++++++++++++++++
>>>>>  fsck/fsck.h        |  1 +
>>>>>  fsck/main.c        |  2 ++
>>>>>  fsck/mount.c       |  9 ++++++++-
>>>>>  fsck/resize.c      |  5 +++++
>>>>>  include/f2fs_fs.h  | 10 ++++++++--
>>>>>  mkfs/f2fs_format.c |  5 ++++-
>>>>>  8 files changed, 73 insertions(+), 5 deletions(-)
>>>>>
>>>>> diff --git a/fsck/f2fs.h b/fsck/f2fs.h
>>>>> index 93f01e5..4dc6698 100644
>>>>> --- a/fsck/f2fs.h
>>>>> +++ b/fsck/f2fs.h
>>>>> @@ -270,9 +270,16 @@ static inline void *__bitmap_ptr(struct f2fs_sb_info
>>>>> *sbi, int flag)
>>>>>         int offset;
>>>>>
>>>>>         if (is_set_ckpt_flags(ckpt, CP_LARGE_NAT_BITMAP_FLAG)) {
>>>>> +               unsigned int chksum_size = 0;
>>>>> +
>>>>>                 offset = (flag == SIT_BITMAP) ?
>>>>>                         le32_to_cpu(ckpt->nat_ver_bitmap_bytesize) : 0;
>>>>> -               return &ckpt->sit_nat_version_bitmap + offset;
>>>>> +
>>>>> +               if (le32_to_cpu(ckpt->checksum_offset) ==
>>>>> +                                       CP_MIN_CHKSUM_OFFSET)
>>>>> +                       chksum_size = sizeof(__le32);
>>>>> +
>>>>> +               return &ckpt->sit_nat_version_bitmap + offset +
>>>>> chksum_size;
>>>>>         }
>>>>>
>>>>>         if (le32_to_cpu(F2FS_RAW_SUPER(sbi)->cp_payload) > 0) {
>>>>> diff --git a/fsck/fsck.c b/fsck/fsck.c
>>>>> index a8c8923..b5daeb4 100644
>>>>> --- a/fsck/fsck.c
>>>>> +++ b/fsck/fsck.c
>>>>> @@ -1917,6 +1917,19 @@ int fsck_chk_meta(struct f2fs_sb_info *sbi)
>>>>>         return 0;
>>>>>  }
>>>>>
>>>>> +void fsck_chk_checkpoint(struct f2fs_sb_info *sbi)
>>>>> +{
>>>>> +       struct f2fs_checkpoint *cp = F2FS_CKPT(sbi);
>>>>> +
>>>>> +       if (get_cp(ckpt_flags) & CP_LARGE_NAT_BITMAP_FLAG) {
>>>>> +               if (get_cp(checksum_offset) != CP_MIN_CHKSUM_OFFSET) {
>>>>> +                       ASSERT_MSG("Deprecated layout of large_nat_bitmap,
>>>>> "
>>>>> +                               "chksum_offset:%u",
>>>>> get_cp(checksum_offset));
>>>>> +                       c.fix_chksum = 1;
>>>>> +               }
>>>>> +       }
>>>>> +}
>>>>> +
>>>>>  void fsck_init(struct f2fs_sb_info *sbi)
>>>>>  {
>>>>>         struct f2fs_fsck *fsck = F2FS_FSCK(sbi);
>>>>> @@ -2017,6 +2030,23 @@ static void flush_curseg_sit_entries(struct
>>>>> f2fs_sb_info *sbi)
>>>>>         free(sit_blk);
>>>>>  }
>>>>>
>>>>> +static void fix_checksum(struct f2fs_sb_info *sbi)
>>>>> +{
>>>>> +       struct f2fs_checkpoint *cp = F2FS_CKPT(sbi);
>>>>> +       struct f2fs_nm_info *nm_i = NM_I(sbi);
>>>>> +       struct sit_info *sit_i = SIT_I(sbi);
>>>>> +       void *bitmap_offset;
>>>>> +
>>>>> +       if (!c.fix_chksum)
>>>>> +               return;
>>>>> +
>>>>> +       bitmap_offset = cp->sit_nat_version_bitmap + sizeof(__le32);
>>>>> +
>>>>> +       memcpy(bitmap_offset, nm_i->nat_bitmap, nm_i->bitmap_size);
>>>>> +       memcpy(bitmap_offset + nm_i->bitmap_size,
>>>>> +                       sit_i->sit_bitmap, sit_i->bitmap_size);
>>>>> +}
>>>>> +
>>>>>  static void fix_checkpoint(struct f2fs_sb_info *sbi)
>>>>>  {
>>>>>         struct f2fs_fsck *fsck = F2FS_FSCK(sbi);
>>>>> @@ -2038,6 +2068,12 @@ static void fix_checkpoint(struct f2fs_sb_info *sbi)
>>>>>                 flags |= CP_TRIMMED_FLAG;
>>>>>         if (is_set_ckpt_flags(cp, CP_DISABLED_FLAG))
>>>>>                 flags |= CP_DISABLED_FLAG;
>>>>> +       if (is_set_ckpt_flags(cp, CP_LARGE_NAT_BITMAP_FLAG)) {
>>>>> +               flags |= CP_LARGE_NAT_BITMAP_FLAG;
>>>>> +               set_cp(checksum_offset, CP_MIN_CHKSUM_OFFSET);
>>>>> +       } else {
>>>>> +               set_cp(checksum_offset, CP_CHKSUM_OFFSET);
>>>>> +       }
>>>>>
>>>>>         if (flags & CP_UMOUNT_FLAG)
>>>>>                 cp_blocks = 8;
>>>>> @@ -2717,6 +2753,7 @@ int fsck_verify(struct f2fs_sb_info *sbi)
>>>>>                                 write_curseg_info(sbi);
>>>>>                                 flush_curseg_sit_entries(sbi);
>>>>>                         }
>>>>> +                       fix_checksum(sbi);
>>>>>                         fix_checkpoint(sbi);
>>>>>                 } else if (is_set_ckpt_flags(cp, CP_FSCK_FLAG) ||
>>>>>                         is_set_ckpt_flags(cp, CP_QUOTA_NEED_FSCK_FLAG)) {
>>>>> diff --git a/fsck/fsck.h b/fsck/fsck.h
>>>>> index cbd6e93..c8802b0 100644
>>>>> --- a/fsck/fsck.h
>>>>> +++ b/fsck/fsck.h
>>>>> @@ -154,6 +154,7 @@ extern int fsck_chk_dentry_blk(struct f2fs_sb_info *,
>>>>> u32, struct child_info *,
>>>>>                 int, int);
>>>>>  int fsck_chk_inline_dentries(struct f2fs_sb_info *, struct f2fs_node *,
>>>>>                 struct child_info *);
>>>>> +void fsck_chk_checkpoint(struct f2fs_sb_info *sbi);
>>>>>  int fsck_chk_meta(struct f2fs_sb_info *sbi);
>>>>>  int fsck_chk_curseg_info(struct f2fs_sb_info *);
>>>>>  int convert_encrypted_name(unsigned char *, u32, unsigned char *, int);
>>>>> diff --git a/fsck/main.c b/fsck/main.c
>>>>> index 03076d9..afdfec9 100644
>>>>> --- a/fsck/main.c
>>>>> +++ b/fsck/main.c
>>>>> @@ -616,6 +616,8 @@ static void do_fsck(struct f2fs_sb_info *sbi)
>>>>>                 c.fix_on = 1;
>>>>>         }
>>>>>
>>>>> +       fsck_chk_checkpoint(sbi);
>>>>> +
>>>>>         fsck_chk_quota_node(sbi);
>>>>>
>>>>>         /* Traverse all block recursively from root inode */
>>>>> diff --git a/fsck/mount.c b/fsck/mount.c
>>>>> index 95c5357..5a0955e 100644
>>>>> --- a/fsck/mount.c
>>>>> +++ b/fsck/mount.c
>>>>> @@ -774,7 +774,8 @@ static int verify_checksum_chksum(struct
>>>>> f2fs_checkpoint *cp)
>>>>>         unsigned int chksum_offset = get_cp(checksum_offset);
>>>>>         unsigned int crc, cal_crc;
>>>>>
>>>>> -       if (chksum_offset > CP_CHKSUM_OFFSET) {
>>>>> +       if (chksum_offset < CP_MIN_CHKSUM_OFFSET ||
>>>>> +                       chksum_offset > CP_CHKSUM_OFFSET) {
>>>>>                 MSG(0, "\tInvalid CP CRC offset: %u\n", chksum_offset);
>>>>>                 return -1;
>>>>>         }
>>>>> @@ -2372,6 +2373,12 @@ void write_checkpoint(struct f2fs_sb_info *sbi)
>>>>>                 flags |= CP_TRIMMED_FLAG;
>>>>>         if (is_set_ckpt_flags(cp, CP_DISABLED_FLAG))
>>>>>                 flags |= CP_DISABLED_FLAG;
>>>>> +       if (is_set_ckpt_flags(cp, CP_LARGE_NAT_BITMAP_FLAG)) {
>>>>> +               flags |= CP_LARGE_NAT_BITMAP_FLAG;
>>>>> +               set_cp(checksum_offset, CP_MIN_CHKSUM_OFFSET);
>>>>> +       } else {
>>>>> +               set_cp(checksum_offset, CP_CHKSUM_OFFSET);
>>>>> +       }
>>>>>
>>>>>         set_cp(free_segment_count, get_free_segments(sbi));
>>>>>         set_cp(valid_block_count, sbi->total_valid_block_count);
>>>>> diff --git a/fsck/resize.c b/fsck/resize.c
>>>>> index 5537a73..fc563f2 100644
>>>>> --- a/fsck/resize.c
>>>>> +++ b/fsck/resize.c
>>>>> @@ -514,6 +514,11 @@ static void rebuild_checkpoint(struct f2fs_sb_info
>>>>> *sbi,
>>>>>         flags = update_nat_bits_flags(new_sb, cp, get_cp(ckpt_flags));
>>>>>         if (flags & CP_COMPACT_SUM_FLAG)
>>>>>                 flags &= ~CP_COMPACT_SUM_FLAG;
>>>>> +       if (flags & CP_LARGE_NAT_BITMAP_FLAG)
>>>>> +               set_cp(checksum_offset, CP_MIN_CHKSUM_OFFSET);
>>>>> +       else
>>>>> +               set_cp(checksum_offset, CP_CHKSUM_OFFSET);
>>>>> +
>>>>>         set_cp(ckpt_flags, flags);
>>>>>
>>>>>         memcpy(new_cp, cp, (unsigned char *)cp->sit_nat_version_bitmap -
>>>>> diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
>>>>> index e0a4cbf..84a4e55 100644
>>>>> --- a/include/f2fs_fs.h
>>>>> +++ b/include/f2fs_fs.h
>>>>> @@ -382,6 +382,7 @@ struct f2fs_configuration {
>>>>>         int ro;
>>>>>         int preserve_limits;            /* preserve quota limits */
>>>>>         int large_nat_bitmap;
>>>>> +       int fix_chksum;                 /* fix old cp.chksum position */
>>>>>         __le32 feature;                 /* defined features */
>>>>>
>>>>>         /* mkfs parameters */
>>>>> @@ -692,10 +693,15 @@ struct f2fs_checkpoint {
>>>>>         unsigned char sit_nat_version_bitmap[1];
>>>>>  } __attribute__((packed));
>>>>>
>>>>> +#define CP_BITMAP_OFFSET       \
>>>>> +       (offsetof(struct f2fs_checkpoint, sit_nat_version_bitmap))
>>>>> +#define CP_MIN_CHKSUM_OFFSET   CP_BITMAP_OFFSET
>>>>> +
>>>>> +#define MIN_NAT_BITMAP_SIZE    64
>>>>>  #define MAX_SIT_BITMAP_SIZE_IN_CKPT    \
>>>>> -       (CP_CHKSUM_OFFSET - sizeof(struct f2fs_checkpoint) + 1 - 64)
>>>>> +       (CP_CHKSUM_OFFSET - CP_BITMAP_OFFSET - MIN_NAT_BITMAP_SIZE)
>>>>>  #define MAX_BITMAP_SIZE_IN_CKPT        \
>>>>> -       (CP_CHKSUM_OFFSET - sizeof(struct f2fs_checkpoint) + 1)
>>>>> +       (CP_CHKSUM_OFFSET - CP_BITMAP_OFFSET)
>>>>>
>>>>>  /*
>>>>>   * For orphan inode management
>>>>> diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
>>>>> index ab8103c..ed27700 100644
>>>>> --- a/mkfs/f2fs_format.c
>>>>> +++ b/mkfs/f2fs_format.c
>>>>> @@ -690,7 +690,10 @@ static int f2fs_write_check_point_pack(void)
>>>>>         set_cp(nat_ver_bitmap_bytesize, ((get_sb(segment_count_nat) / 2) <<
>>>>>                          get_sb(log_blocks_per_seg)) / 8);
>>>>>
>>>>> -       set_cp(checksum_offset, CP_CHKSUM_OFFSET);
>>>>> +       if (c.large_nat_bitmap)
>>>>> +               set_cp(checksum_offset, CP_MIN_CHKSUM_OFFSET);
>>>>> +       else
>>>>> +               set_cp(checksum_offset, CP_CHKSUM_OFFSET);
>>>>>
>>>>>         crc = f2fs_checkpoint_chksum(cp);
>>>>>         *((__le32 *)((unsigned char *)cp + get_cp(checksum_offset))) =
>>>>> --
>>>>> 2.18.0.rc1
>>>>>
>>>>>
>>>>>
>>>>> _______________________________________________
>>>>> Linux-f2fs-devel mailing list
>>>>> Linux-f2fs-devel@lists.sourceforge.net
>>>>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
>>>>>
>>>>
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
