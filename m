Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6AB6E1987
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 14 Apr 2023 03:19:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pn85k-0003SN-Vy;
	Fri, 14 Apr 2023 01:19:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pn85j-0003SH-OV
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 14 Apr 2023 01:19:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rSpoj5UqM4hBtoQ/OM+hiWV88Sord4Iu7w33wlTHFQM=; b=PQF1bNR8GWufKAmsOCUam4zZUQ
 VYTZJfSwZiyqIhWed8ckp1KXvO7MSKkkMEIfAwbkWC0xusAVCrYAJAq70eEdeNbh5Y9SWu8DIOKSw
 v6BzeWESP4StYknuCZSfRsh3+UdQ0gXVBIa2CAOFkdZeLoGV4X8Ch1nIuMHkyLUPTa/E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rSpoj5UqM4hBtoQ/OM+hiWV88Sord4Iu7w33wlTHFQM=; b=BHOLbXknPZ52KMOck8jxHL+ByR
 o0zGTinoFuc7qYXkluT8+rETQr0/ZeNFuBczEcHe822hKFDqXNiz1sEdreHbAhRdGTv8K9N02kP1H
 jkPtZ/FVKJitc398dC8ye5KAYLmtiy09XNFjtHpb+w8MuMzmczeBDLnosSo+vtgkwhfQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pn85i-0001KZ-5F for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 14 Apr 2023 01:19:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 92C82642A0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 14 Apr 2023 01:19:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA50CC433D2;
 Fri, 14 Apr 2023 01:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681435139;
 bh=GpyqswlkR5WgrTmui+S0AaHMMIflP1m47uRsisRn0N8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ShgZ2Hz3viX7fEiwFXbfXEECNWNK4RBYOS83qbbUxpdPNS93Dt2xOlHESUPGZGC//
 JvfNDB+AfGphfTPIILlzD23Wo3p65QyMmDBP5PPQvgj9Bu0zqroC0l0TIATtNVHB55
 7gEBRjiGKQPqI8jZztu9HPVtZeTg0jtfzL/IlZHImvNxM8KRVk5/Je2c6GnrYLPWIx
 eryiiQ10XyLT97bBBZD7/Sv/cXXt/P+qIl5rPnt/AaJS177GieGs22grSdIRUhtVsX
 KOmpYpTLYsZwJHGQntdFFbBHkoYU4RIhp0ohMqOEt8juzOck3g0JQpofG9mDK1zGHm
 oXN5pvFBi8/lw==
Message-ID: <9e77c30c-0770-6cb7-cb75-2e22bc52b8d2@kernel.org>
Date: Fri, 14 Apr 2023 09:18:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20230407181539.4136580-1-jaegeuk@kernel.org>
 <ZDbZlwH5u3/nOTwL@google.com>
 <82ecc91f-a739-4744-29da-227daf5e45a2@kernel.org>
 <ZDglMgnxctYzMNnr@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <ZDglMgnxctYzMNnr@google.com>
X-Spam-Score: -6.3 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/4/13 23:52, Jaegeuk Kim wrote: > On 04/13, Chao Yu
 wrote: >> On 2023/4/13 0:17, Jaegeuk Kim wrote: >>> 1. extent_cache >>> -
 let's drop the largest extent_cache >>> 2. invalidate_block >>> - d [...]
 Content analysis details:   (-6.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -1.1 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pn85i-0001KZ-5F
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: relax sanity check if checkpoint is
 corrupted
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

On 2023/4/13 23:52, Jaegeuk Kim wrote:
> On 04/13, Chao Yu wrote:
>> On 2023/4/13 0:17, Jaegeuk Kim wrote:
>>> 1. extent_cache
>>>    - let's drop the largest extent_cache
>>> 2. invalidate_block
>>>    - don't show the warnings
>>>
>>> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
>>> ---
>>>
>>>    Change log from v1:
>>>     - add one more case to skip the error message
>>>
>>>    fs/f2fs/checkpoint.c   | 10 ++++++++++
>>>    fs/f2fs/extent_cache.c | 22 +++++++++++++++-------
>>>    2 files changed, 25 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
>>> index 448ecf5000b8..64b3860f50ee 100644
>>> --- a/fs/f2fs/checkpoint.c
>>> +++ b/fs/f2fs/checkpoint.c
>>> @@ -152,6 +152,11 @@ static bool __is_bitmap_valid(struct f2fs_sb_info *sbi, block_t blkaddr,
>>>    	se = get_seg_entry(sbi, segno);
>>>    	exist = f2fs_test_bit(offset, se->cur_valid_map);
>>> +
>>> +	/* skip data, if we already have an error in checkpoint. */
>>> +	if (unlikely(f2fs_cp_error(sbi)))
>>> +		return exist;
>>> +
>>>    	if (exist && type == DATA_GENERIC_ENHANCE_UPDATE) {
>>>    		f2fs_err(sbi, "Inconsistent error blkaddr:%u, sit bitmap:%d",
>>>    			 blkaddr, exist);
>>> @@ -202,6 +207,11 @@ bool f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
>>>    	case DATA_GENERIC_ENHANCE_UPDATE:
>>>    		if (unlikely(blkaddr >= MAX_BLKADDR(sbi) ||
>>>    				blkaddr < MAIN_BLKADDR(sbi))) {
>>> +
>>> +			/* Skip to emit an error message. */
>>> +			if (unlikely(f2fs_cp_error(sbi)))
>>> +				return false;
>>> +
>>>    			f2fs_warn(sbi, "access invalid blkaddr:%u",
>>>    				  blkaddr);
>>>    			set_sbi_flag(sbi, SBI_NEED_FSCK);
>>> diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
>>> index 9a8153895d20..bea6ab9d846a 100644
>>> --- a/fs/f2fs/extent_cache.c
>>> +++ b/fs/f2fs/extent_cache.c
>>> @@ -23,18 +23,26 @@ bool sanity_check_extent_cache(struct inode *inode)
>>>    {
>>>    	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>>>    	struct f2fs_inode_info *fi = F2FS_I(inode);
>>> +	struct extent_tree *et = fi->extent_tree[EX_READ];
>>>    	struct extent_info *ei;
>>> -	if (!fi->extent_tree[EX_READ])
>>> +	if (!et)
>>> +		return true;
>>> +
>>> +	ei = &et->largest;
>>> +	if (!ei->len)
>>>    		return true;
>>> -	ei = &fi->extent_tree[EX_READ]->largest;
>>> +	/* Let's drop, if checkpoint got corrupted. */
>>> +	if (is_set_ckpt_flags(sbi, CP_ERROR_FLAG)) {
>>> +		ei->len = 0;
>>> +		et->largest_updated = true;
>>
>> Thsi field indicates whether it is needed to update largest extent into
>> inode page, since cp_error is unrecoverable, it seems we don't needed to
>> update it.
> 
> Intention is to avoid any assumption like that, but sync the same logic when
> updating this.

Sure, fine to me.

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,

> 
>>
>> Thanks,
>>
>>> +		return true;
>>> +	}
>>> -	if (ei->len &&
>>> -		(!f2fs_is_valid_blkaddr(sbi, ei->blk,
>>> -					DATA_GENERIC_ENHANCE) ||
>>> -		!f2fs_is_valid_blkaddr(sbi, ei->blk + ei->len - 1,
>>> -					DATA_GENERIC_ENHANCE))) {
>>> +	if (!f2fs_is_valid_blkaddr(sbi, ei->blk, DATA_GENERIC_ENHANCE) ||
>>> +	    !f2fs_is_valid_blkaddr(sbi, ei->blk + ei->len - 1,
>>> +					DATA_GENERIC_ENHANCE)) {
>>>    		set_sbi_flag(sbi, SBI_NEED_FSCK);
>>>    		f2fs_warn(sbi, "%s: inode (ino=%lx) extent info [%u, %u, %u] is incorrect, run fsck to fix",
>>>    			  __func__, inode->i_ino,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
