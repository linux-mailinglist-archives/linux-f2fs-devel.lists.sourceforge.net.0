Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2406955F8
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Feb 2023 02:30:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pRk9B-0006jG-V3;
	Tue, 14 Feb 2023 01:30:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pRk9A-0006j9-PO
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Feb 2023 01:30:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sXKqHJCLUXOORlOZMnDRdmVI0P1l0cacUi6iF8OoKyI=; b=S46rGaoRWLLy1uxUNWo5Nvb7iN
 //7BdYaULIi//bJF9kUARTeM/Oz5WoSYKnw56s/o39zCfuCnV/XchRN1CT1j/aY5fPGp+wgKNKLMg
 1MJHRexL2EJI+kCz89vuxgliWvUYObpO88XLoQ0VeqzRM52uDY2w+DuU6mcD/44jC8K8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sXKqHJCLUXOORlOZMnDRdmVI0P1l0cacUi6iF8OoKyI=; b=EN2nUPO2V/H5Rcw+kE3qcET1Tq
 h2X9osSZXWVvxMj0fzX+TaxCj3tN1ol/d9VgGkXKpUg6sNI25K8gmUJ59fNKnoep5zT5JjvjS7p9W
 NKcD5RLcGQ772PB8OpZBtxMR/zrwtsXaAR0qlnYlRfeFw5d0qbbnP2yeQVsh29H7jJDE=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pRk99-003n0R-9j for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Feb 2023 01:30:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0DC52B81A32
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 14 Feb 2023 01:30:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD715C433EF;
 Tue, 14 Feb 2023 01:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676338207;
 bh=TcSWSVDQG/HWhzEa4mElyIfq2q468pRmSvFT+IS5NWU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=fbBUnU6NdnohbS7Jm9U9zWWCqWzl5jum7XKz8hnUbXfE/YuE/TSSZtaky2dr8FUFj
 qhjkyliPAKBK1y0CkSMAAf+BAADglJO+q9SDCJayBa7MW0eif/pTm7BNInLYzYfhf1
 IcR5icarCcBI86m3pPKaZGiaEKSPuTkraVeIhlInp1bxlABa3b/TWi+nlo8vnROeAo
 iLMqgU6mmOGSUuw/636coxoVbRAJBgyBnFhRB4SORCy+Jk2h4qo4A22WojS4hVVI/f
 c9IVsfXbgocpBjo3vAwYtZ0LDe9mC3MjOWPKXPO3Ql7trL47YO8oRw36xCz1NUIqUa
 owNIt2x5BNCdg==
Message-ID: <a7ccac95-384c-f4de-a60f-ee6b8680c9d7@kernel.org>
Date: Tue, 14 Feb 2023 09:30:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20230210213250.3471246-1-jaegeuk@kernel.org>
 <1a66e32b-efc0-626b-b585-7f2bfac506a7@kernel.org>
 <Y+p311Vi/odYKuC2@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <Y+p311Vi/odYKuC2@google.com>
X-Spam-Score: -5.5 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/2/14 1:48, Jaegeuk Kim wrote: > On 02/13, Chao Yu
 wrote: >> On 2023/2/11 5:32, Jaegeuk Kim wrote: >>> MAIN_SEGS is for data
 area, while TOTAL_SEGS includes data and metadata. >> >> Good catch! [...]
 Content analysis details:   (-5.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.3 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pRk99-003n0R-9j
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix wrong segment count
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

On 2023/2/14 1:48, Jaegeuk Kim wrote:
> On 02/13, Chao Yu wrote:
>> On 2023/2/11 5:32, Jaegeuk Kim wrote:
>>> MAIN_SEGS is for data area, while TOTAL_SEGS includes data and metadata.
>>
>> Good catch!
>>
>> Could you please add fixes line?
> 
> It seems this is not a bug case, and exisits from the first F2FS patch. :)

Alright, anyway, it looks good to me.

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,

> 
>>
>> Thanks,
>>
>>>
>>> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
>>> ---
>>>    fs/f2fs/segment.h | 4 ++--
>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
>>> index 8ee5e5db9287..6003fbaf4b7d 100644
>>> --- a/fs/f2fs/segment.h
>>> +++ b/fs/f2fs/segment.h
>>> @@ -720,7 +720,7 @@ static inline unsigned char curseg_alloc_type(struct f2fs_sb_info *sbi,
>>>    static inline void check_seg_range(struct f2fs_sb_info *sbi, unsigned int segno)
>>>    {
>>> -	f2fs_bug_on(sbi, segno > TOTAL_SEGS(sbi) - 1);
>>> +	f2fs_bug_on(sbi, segno > MAIN_SEGS(sbi) - 1);
>>>    }
>>>    static inline void verify_fio_blkaddr(struct f2fs_io_info *fio)
>>> @@ -775,7 +775,7 @@ static inline int check_block_count(struct f2fs_sb_info *sbi,
>>>    	/* check segment usage, and check boundary of a given segment number */
>>>    	if (unlikely(GET_SIT_VBLOCKS(raw_sit) > usable_blks_per_seg
>>> -					|| segno > TOTAL_SEGS(sbi) - 1)) {
>>> +					|| segno > MAIN_SEGS(sbi) - 1)) {
>>>    		f2fs_err(sbi, "Wrong valid blocks %d or segno %u",
>>>    			 GET_SIT_VBLOCKS(raw_sit), segno);
>>>    		set_sbi_flag(sbi, SBI_NEED_FSCK);


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
