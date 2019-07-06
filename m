Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CCE60E77
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  6 Jul 2019 04:11:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hjaAF-000654-J0; Sat, 06 Jul 2019 02:10:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1hjaAE-00064w-HE
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 06 Jul 2019 02:10:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=56/0EPWrxXwK2m91jlOT/2ZUymLtxqs8j19iY7CCGqE=; b=cZKYMVcvOopvHx68GqIeoQJkBQ
 jy3IqlQcBmGrrhiIJhl0QdcP7+2AX+ZSmKZTAcEXd/9HLBG1eBZ2KRkypSb7RyPCxnS05G2qUXhrt
 mWANBMDxPj+HsOpDKRGKjCdAyNErnf+5Ul5HBgamwBd37KjE/MbfhVrV4zZ4dYZOywC4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=56/0EPWrxXwK2m91jlOT/2ZUymLtxqs8j19iY7CCGqE=; b=IVehEDQDrhSRPo4O6k4DRTfnWK
 1aO2AOfa1Ho9E5ni/9+SUKIi48U+SHMzoggWqjstM7wjdwj4wxcETZPEA0OfzZ+/+y6luwgRjxv4E
 fa4lIqyEQWYGGv8sDZbgaY2V5X23etuVkEwAuIwK4laJTQU6EWKtH1HD8RMXbEbVKD74=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hjaAO-007UDg-8S
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 06 Jul 2019 02:11:10 +0000
Received: from [192.168.0.101] (unknown [49.65.245.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5AE1021670;
 Sat,  6 Jul 2019 02:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1562379062;
 bh=lZIbpSFrO9vD0wbuJWqxV7RQpu7BtuQa60koytpSO1Q=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=hS5LvYgrBwbM0FJLLQRepAw7J4d5zx/WxW7gZ/Zlt1dTYKzzuKovvuoK1ruCG4moH
 qZSZ8e/K1Af/YafTEUhfyX8nvDDkMuT4OJxkiz6R3mLjhJRa/Ydrny+Hhf3kOOYbN8
 HBUavvrqvnz6KlhVmrdMXNLeRDp+6gUfC0z3AuwI=
To: Sahitya Tummala <stummala@codeaurora.org>
References: <1562302863-14418-1-git-send-email-stummala@codeaurora.org>
 <15bb7741-7c2f-8dc2-065f-ba1fcaf22050@huawei.com>
 <20190705110356.GC8289@codeaurora.org> <20190705134859.GD8289@codeaurora.org>
 <0143261e-5592-1ee2-e09d-437d2a7eac22@kernel.org>
 <20190706013112.GE8289@codeaurora.org> <20190706013729.GF8289@codeaurora.org>
From: Chao Yu <chao@kernel.org>
Message-ID: <e1b02df8-8d4c-4794-42b6-8bffdeb7e744@kernel.org>
Date: Sat, 6 Jul 2019 10:10:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190706013729.GF8289@codeaurora.org>
Content-Language: en-US
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hjaAO-007UDg-8S
Subject: Re: [f2fs-dev] [PATCH] fsck: Fix data loss issue observed during SPO
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

Hi Sahitya,

On 2019-7-6 9:37, Sahitya Tummala wrote:
> Hi Chao,
> 
> I just realized that there is a patch from you to fix this already.
> 
> commit 92ea71c711681a8f575d09d57d5ceaebd6644fcc
> Author: Chao Yu <yuchao0@huawei.com>
> Date:   Wed Jan 9 10:48:25 2019 +0800
> 
>     fsck.f2fs: fix incorrect boundary of IS_VALID_NID()
> 
>     nid should never equal to max_nid, fix it.
> 
>     Signed-off-by: Chao Yu <yuchao0@huawei.com>
>     Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> 
> In my code base, I was not having this patch but only have
> "fsck.f2fs: check validity of nat journal", thus resulting into
> data loss issues. I will now verify with this patch included.

Ah, that should be the root cause..

BTW, the diff was pointed out by Jaegeuk on patch ("fsck.f2fs: check validity of
nat journal"), but it looks it was merged to the wrong patch. :P

 static inline bool IS_VALID_BLK_ADDR(struct f2fs_sb_info *sbi, u32 addr)
 {
+	if (addr == NULL_ADDR || addr == NEW_ADDR)
+		return 1;
+
 	if (addr >= le64_to_cpu(F2FS_RAW_SUPER(sbi)->block_count) ||
 				addr < SM_I(sbi)->main_blkaddr) {
 		DBG(1, "block addr [0x%x]\n", addr);

Thanks,

> 
> Thanks for your support on this issue.
> 
> Thanks,
> Sahitya.
> 
> On Sat, Jul 06, 2019 at 07:01:12AM +0530, Sahitya Tummala wrote:
>> Hi Chao,
>>
>> On Sat, Jul 06, 2019 at 09:14:59AM +0800, Chao Yu wrote:
>>> Hi Sahitya,
>>>
>>> On 2019-7-5 21:48, Sahitya Tummala wrote:
>>>> Hi Chao,
>>>>
>>>> The journal doesn't look to be corrupted, but only block_addr
>>>> in f2fs_nat_entry is 0 whereas nid and version seems to be valid.
>>>> These could be just truncated nodes, right?
>>>
>>> Yes, but that should not fail the condition of journal check and result in
>>> journal size truncation, right?
>>>
>>
>> Yes, the patch fails for this condition as well and results into
>> truncation of journal, due to this check  addr < SM_I(sbi)->main_blkaddr
>> in IS_VALID_BLK_ADDR().
>>
>> Do you think we can correct it this way?
>>
>> diff --git a/fsck/f2fs.h b/fsck/f2fs.h
>> index 417ca0b..00fb740 100644
>> --- a/fsck/f2fs.h
>> +++ b/fsck/f2fs.h
>> @@ -364,8 +364,8 @@ static inline bool IS_VALID_NID(struct f2fs_sb_info *sbi, u32 nid)
>>
>>  static inline bool IS_VALID_BLK_ADDR(struct f2fs_sb_info *sbi, u32 addr)
>>  {
>> -       if (addr >= le64_to_cpu(F2FS_RAW_SUPER(sbi)->block_count) ||
>> -                               addr < SM_I(sbi)->main_blkaddr) {
>> +       if (addr && (addr >= le64_to_cpu(F2FS_RAW_SUPER(sbi)->block_count) ||
>> +                               addr < SM_I(sbi)->main_blkaddr)) {
>>                 DBG(1, "block addr [0x%x]\n", addr);
>>                 return 0;
>>         }
>>
>> Thanks,
>>
>>> Thanks,
>>>
>>>>
>>>> Here is the full dump of nat journal entries after a SPO (this is not a 
>>>> issue case, but just a normal case with SPO) -
>>>>
>>>> [   21.121325] fsck.f2fs: 0: addr 0 nid 5c5a ver 1\x0a
>>>> [   21.127509] fsck.f2fs: 1: addr 0 nid 4c1d ver 1\x0a
>>>> [   21.133760] fsck.f2fs: 2: addr 12075 nid 444f ver 0\x0a
>>>> [   21.140325] fsck.f2fs: 3: addr 0 nid 4307 ver 0\x0a
>>>> [   21.146510] fsck.f2fs: 4: addr 0 nid 4059 ver 1\x0a
>>>> [   21.152745] fsck.f2fs: 5: addr 0 nid 3e69 ver 1\x0a
>>>> [   21.158944] fsck.f2fs: 6: addr 0 nid 3cf9 ver 1\x0a
>>>> [   21.165128] fsck.f2fs: 7: addr 0 nid 3b7b ver 1\x0a
>>>> [   21.171362] fsck.f2fs: 8: addr 18f65 nid 34e2 ver 0\x0a
>>>> [   21.177903] fsck.f2fs: 9: addr 12126 nid 2c87 ver 0\x0a
>>>> [   21.184466] fsck.f2fs: 10: addr 0 nid 2a0a ver 1\x0a
>>>> [   21.190795] fsck.f2fs: 11: addr 0 nid 2565 ver 1\x0a
>>>> [   21.197070] fsck.f2fs: 12: addr 0 nid 1f48 ver 0\x0a
>>>> [   21.203369] fsck.f2fs: 13: addr 155bf nid 1d76 ver 0\x0a
>>>> [   21.210042] fsck.f2fs: 14: addr 19538 nid 18da ver 0\x0a
>>>> [   21.216675] fsck.f2fs: 15: addr 0 nid 157f ver 0\x0a
>>>> [   21.223037] fsck.f2fs: 16: addr d117 nid ac3 ver 0\x0a
>>>> [   21.229547] fsck.f2fs: 17: addr 11e48 nid 805 ver 0\x0a
>>>> [   21.236088] fsck.f2fs: 18: addr d112 nid 61c ver 0\x0a
>>>> [   21.242585] fsck.f2fs: 19: addr d00b nid 45b ver 0\x0a
>>>> [   21.249086] fsck.f2fs: 20: addr d111 nid 30d ver 0\x0a
>>>> [   21.255544] fsck.f2fs: 21: addr d110 nid 1b5 ver 0\x0a
>>>> [   21.262025] fsck.f2fs: 22: addr 0 nid 5e41 ver 1\x0a
>>>> [   21.268342] fsck.f2fs: 23: addr 0 nid 5e46 ver 0\x0a
>>>> [   21.274618] fsck.f2fs: 24: addr 0 nid 5a34 ver 1\x0a
>>>> [   21.280916] fsck.f2fs: 25: addr 0 nid 59fa ver 1\x0a
>>>> [   21.287192] fsck.f2fs: 26: addr 0 nid 57c3 ver 1\x0a
>>>> [   21.293526] fsck.f2fs: 27: addr 0 nid 5776 ver 1\x0a
>>>> [   21.299816] fsck.f2fs: 28: addr 0 nid 4f20 ver 1\x0a
>>>> [   21.306091] fsck.f2fs: 29: addr 0 nid 4ff7 ver 0\x0a
>>>> [   21.312416] fsck.f2fs: 30: addr 0 nid 47e1 ver 1\x0a
>>>> [   21.318715] fsck.f2fs: 31: addr 0 nid 4880 ver 1\x0a
>>>> [   21.324990] fsck.f2fs: 32: addr d118 nid ff4 ver 0\x0a
>>>> [   21.331498] fsck.f2fs: 33: addr d10c nid ff9 ver 0\x0a
>>>> [   21.337957] fsck.f2fs: 34: addr 0 nid 49ed ver 1\x0a
>>>> [   21.344290] fsck.f2fs: 35: addr 0 nid 497e ver 0\x0a
>>>> [   21.350612] fsck.f2fs: 36: addr fc5a nid 49d2 ver 0\x0a
>>>>
>>>> Thanks,
>>>>
>>>> On Fri, Jul 05, 2019 at 04:33:57PM +0530, Sahitya Tummala wrote:
>>>>> Hi Chao,
>>>>>
>>>>> On Fri, Jul 05, 2019 at 06:11:47PM +0800, Chao Yu wrote:
>>>>>> Hi Sahitya,
>>>>>>
>>>>>> On 2019/7/5 13:01, Sahitya Tummala wrote:
>>>>>>> With the commit <979b25727800> ("fsck.f2fs: check validity of nat journal"),
>>>>>>> there is a serious data loss issue observed during sudden power off tests.
>>>>>>
>>>>>> In that patch, since journal's data is untrusty, I just truncated n_nats to last
>>>>>> valid one to fix original reported issue.
>>>>>
>>>>> The original issue will be fixed even without updating/truncating the n_nats
>>>>> as we still have sanity checks on nid and blkaddr, right?
>>>>>
>>>>>>
>>>>>> Actually, the problem here is we don't know which data is correct and which data
>>>>>> is corrupted in nat or sit journal, so even we skip broken entry without
>>>>>> modifying journal->n_{nats,sits}, latter entry may still contain broken data(but
>>>>>> it may pass validation check), and those entries may cause potential data
>>>>>> loss/corruption...
>>>>>>
>>>>>
>>>>> This issue was reported by a customer in the following test scenario -
>>>>>
>>>>> Update the password in Android and then force crash. It is verified that
>>>>> all the files related to password data has fsync() already.
>>>>>
>>>>> After some iterations (3-4) of this test, it is found password related files are
>>>>> lost, failing the phone to bootup.
>>>>>
>>>>> Without this patch ("fsck.f2fs: check validity of nat journal"), they don't see
>>>>> such issue. It means that the data present in journal seems to be valid atleast
>>>>> in this case and truncating is causing to loose the valid data/files.
>>>>>
>>>>>> It looks no matter how we change the codes, we still may face data
>>>>>> loos/corruption issues.
>>>>>>
>>>>>
>>>>> Yes, maybe in some cases, the data loss is still expected, but there are
>>>>> chances that data may be valid as well, which is confirmed by the test case above.
>>>>>
>>>>>> IMO, we need to find out the root cause of data corruption, So my question is
>>>>>> that why sudden power off tests can make nat journal being corrupted? I doubt
>>>>>> that in-place update method on checkpoint area of fsck may cause this... any
>>>>>> other thoughts?
>>>>>>
>>>>>
>>>>> In case of sudden power off, I have printed the all the journal entries in the
>>>>> NAT and I several entries with valid blkaddr and nid as below -
>>>>>
>>>>> [   21.007649] fsck.f2fs: withfix: 0: addr 1c373 nid 45b\x0a
>>>>> [   21.014399] fsck.f2fs: withfix: 1: addr 1c2c1 nid 1b5\x0a
>>>>> [   21.021151] fsck.f2fs: \x09Error: f2fs_init_nid_bitmap: addr(0) i/nats 2/37 is invalid!!!\x0a
>>>>> [   21.030860] fsck.f2fs: withfix: 3: addr 1c1f7 nid 19b2\x0a
>>>>> [   21.037674] fsck.f2fs: \x09Error: f2fs_init_nid_bitmap: addr(0) i/nats 4/37 is invalid!!!\x0a
>>>>> [   21.047353] fsck.f2fs: \x09Error: f2fs_init_nid_bitmap: addr(0) i/nats 5/37 is invalid!!!\x0a
>>>>> [   21.057062] fsck.f2fs: withfix: 6: addr 1c377 nid ac3\x0a
>>>>> [   21.063841] fsck.f2fs: withfix: 7: addr 1c378 nid ac9\x0a
>>>>> [   21.070634] fsck.f2fs: withfix: 8: addr 1b2fe nid 807\x0a
>>>>> [   21.077356] fsck.f2fs: withfix: 9: addr 17aeb nid 805\x0a
>>>>> [   21.084102] fsck.f2fs: \x09Error: f2fs_init_nid_bitmap: addr(0) i/nats 10/37 is invalid!!!\x0a
>>>>> [   21.093891] fsck.f2fs: \x09Error: f2fs_init_nid_bitmap: addr(0) i/nats 11/37 is invalid!!!\x0a
>>>>> [   21.103662] fsck.f2fs: \x09Error: f2fs_init_nid_bitmap: addr(0) i/nats 12/37 is invalid!!!\x0a
>>>>> [   21.113450] fsck.f2fs: \x09Error: f2fs_init_nid_bitmap: addr(0) i/nats 13/37 is invalid!!!\x0a
>>>>> [   21.123227] fsck.f2fs: \x09Error: f2fs_init_nid_bitmap: addr(0) i/nats 14/37 is invalid!!!\x0a
>>>>> [   21.133022] fsck.f2fs: \x09Error: f2fs_init_nid_bitmap: addr(0) i/nats 15/37 is invalid!!!\x0a
>>>>> [   21.142792] fsck.f2fs: \x09Error: f2fs_init_nid_bitmap: addr(0) i/nats 16/37 is invalid!!!\x0a
>>>>> [   21.152580] fsck.f2fs: withfix: 17: addr 1c37f nid ff4\x0a
>>>>> [   21.159415] fsck.f2fs: withfix: 18: addr 1c36c nid ff9\x0a
>>>>> [   21.166229] fsck.f2fs: \x09Error: f2fs_init_nid_bitmap: addr(0) i/nats 19/37 is invalid!!!\x0a
>>>>> [   21.176039] fsck.f2fs: \x09Error: f2fs_init_nid_bitmap: addr(0) i/nats 20/37 is invalid!!!\x0a
>>>>> [   21.185831] fsck.f2fs: \x09Error: f2fs_init_nid_bitmap: addr(0) i/nats 21/37 is invalid!!!\x0a
>>>>> [   21.195631] fsck.f2fs: \x09Error: f2fs_init_nid_bitmap: addr(0) i/nats 22/37 is invalid!!!\x0a
>>>>> [   21.205394] fsck.f2fs: withfix: 23: addr 1c2f3 nid 61c\x0a
>>>>> [   21.212257] fsck.f2fs: withfix: 24: addr 1c391 nid 641\x0a
>>>>> [   21.219093] fsck.f2fs: withfix: 25: addr 1c386 nid 33b\x0a
>>>>> [   21.225905] fsck.f2fs: withfix: 26: addr 1c356 nid 258\x0a
>>>>> [   21.232767] fsck.f2fs: withfix: 27: addr 1c2f2 nid 382\x0a
>>>>> [   21.239601] fsck.f2fs: \x09Error: f2fs_init_nid_bitmap: addr(0) i/nats 28/37 is invalid!!!\x0a
>>>>> [   21.249398] fsck.f2fs: \x09Error: f2fs_init_nid_bitmap: addr(0) i/nats 29/37 is invalid!!!\x0a
>>>>> [   21.259160] fsck.f2fs: \x09Error: f2fs_init_nid_bitmap: addr(0) i/nats 30/37 is invalid!!!\x0a
>>>>> [   21.268970] fsck.f2fs: withfix: 31: addr 1ac03 nid 1ccd\x0a
>>>>> [   21.275874] fsck.f2fs: withfix: 32: addr 1c395 nid a57\x0a
>>>>> [   21.282709] fsck.f2fs: withfix: 33: addr 1c392 nid 92e\x0a
>>>>> [   21.289564] fsck.f2fs: withfix: 34: addr 1c38b nid aa1\x0a
>>>>> [   21.296377] fsck.f2fs: withfix: 35: addr 1c393 nid 931\x0a
>>>>> [   21.303240] fsck.f2fs: withfix: 36: addr 1c394 nid a35\x0a
>>>>>
>>>>> Thanks,
>>>>>
>>>>>> Thanks,
>>>>>>
>>>>>>>
>>>>>>> The reason is due to incorrect update of journal->n_nats in that patch.
>>>>>>> When fsck encounters a nat journal entry with invalid blkaddr/nid, it
>>>>>>> updates journal->n_nats with the index of such first entry and then continues
>>>>>>> the for loop which scans all nats in journal in f2fs_init_nid_bitmap().
>>>>>>> But that loop doesn't continue and doesn't update nm_i->nid_bitmap as well,
>>>>>>> as it fails the for loop condition i < nats_in_cursum(journal).
>>>>>>>
>>>>>>> There could be several other valid entries in the journal after this
>>>>>>> invalid entry. Due to this invalid journal->n_nats, build_nat_area_bitmap()
>>>>>>> could not be build properly for valid nat journal entries. It further results
>>>>>>> into these fsck asserts/errors and causes data loss due to incorrect fsck fix.
>>>>>>>
>>>>>>> [ASSERT] (sanity_check_nid: 372)  --> nid[0xfb01] ino is 0\x0a
>>>>>>> [FIX] (__chk_dentries:1438)  --> Unlink [0xfb01] - _JeNcl242yB3Apz2MW,VOh6WmjsVht1W len[0x1c], type[0x1]\x0a
>>>>>>> [ASSERT] (sanity_check_nid: 372)  --> nid[0xfa2d] ino is 0\x0a
>>>>>>> [FIX] (__chk_dentries:1438)  --> Unlink [0xfa2d] - _++vN7axccjjGNI,TQEVmcOemY1EAAAA len[0x14], type[0x1]\x0a
>>>>>>> ...
>>>>>>> NID[0xba5] is unreachable\x0a
>>>>>>> NID[0xfa9] is unreachable\x0a
>>>>>>> ...
>>>>>>> [FIX] (nullify_nat_entry:2089)  --> Remove nid [0xba5] in NAT\x0a
>>>>>>> [FIX] (nullify_nat_entry:2089)  --> Remove nid [0xfa9] in NAT\x0a
>>>>>>> ...
>>>>>>>
>>>>>>> Fixes: 979b25727800 ("fsck.f2fs: check validity of nat journal")
>>>>>>> Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
>>>>>>> ---
>>>>>>>  fsck/mount.c | 2 --
>>>>>>>  1 file changed, 2 deletions(-)
>>>>>>>
>>>>>>> diff --git a/fsck/mount.c b/fsck/mount.c
>>>>>>> index 60e0e4a..1b93f49 100644
>>>>>>> --- a/fsck/mount.c
>>>>>>> +++ b/fsck/mount.c
>>>>>>> @@ -1160,7 +1160,6 @@ static int f2fs_init_nid_bitmap(struct f2fs_sb_info *sbi)
>>>>>>>  		addr = le32_to_cpu(nat_in_journal(journal, i).block_addr);
>>>>>>>  		if (!IS_VALID_BLK_ADDR(sbi, addr)) {
>>>>>>>  			MSG(0, "\tError: f2fs_init_nid_bitmap: addr(%u) is invalid!!!\n", addr);
>>>>>>> -			journal->n_nats = cpu_to_le16(i);
>>>>>>>  			c.fix_on = 1;
>>>>>>>  			continue;
>>>>>>>  		}
>>>>>>> @@ -1168,7 +1167,6 @@ static int f2fs_init_nid_bitmap(struct f2fs_sb_info *sbi)
>>>>>>>  		nid = le32_to_cpu(nid_in_journal(journal, i));
>>>>>>>  		if (!IS_VALID_NID(sbi, nid)) {
>>>>>>>  			MSG(0, "\tError: f2fs_init_nid_bitmap: nid(%u) is invalid!!!\n", nid);
>>>>>>> -			journal->n_nats = cpu_to_le16(i);
>>>>>>>  			c.fix_on = 1;
>>>>>>>  			continue;
>>>>>>>  		}
>>>>>>>
>>>>>
>>>>> -- 
>>>>> --
>>>>> Sent by a consultant of the Qualcomm Innovation Center, Inc.
>>>>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.
>>>>>
>>>>>
>>>>> _______________________________________________
>>>>> Linux-f2fs-devel mailing list
>>>>> Linux-f2fs-devel@lists.sourceforge.net
>>>>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
>>>>
>>
>> -- 
>> --
>> Sent by a consultant of the Qualcomm Innovation Center, Inc.
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.
>>
>>
>> _______________________________________________
>> Linux-f2fs-devel mailing list
>> Linux-f2fs-devel@lists.sourceforge.net
>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
