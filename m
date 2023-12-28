Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CB71081F430
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 Dec 2023 03:47:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rIgQs-00007k-2Y;
	Thu, 28 Dec 2023 02:47:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rIgQo-00007d-23
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 Dec 2023 02:47:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qkpQtE12c5+g2Ir2EeoxkuMhAVgX4WQ7u+QPxQWe/fw=; b=M/cUeU5DlkDb1TAjQWGf7UCloT
 4G5wT5A9JUbPEXbc1D7Q8UlQKEM+pq3S358XwqwNyLATeFXV2vUQl095RQpPThgb5V3DmOvjFweJ4
 tQwncHUWVTS3npojbkJKYgmgNv4LJ/4RPk3OQV06eKCTKxnMBqQN709I1f5lJyKTDt9s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qkpQtE12c5+g2Ir2EeoxkuMhAVgX4WQ7u+QPxQWe/fw=; b=lB/pK0bbQJ83dGAeIK8RSam0pX
 d8jK9RY+08nEZpplHlGmYbCnN0xIc0ROCKk4l23O4GngzqYcQ/8xXdHflKVvtk9OlKVJy1I2hUM1N
 zhhl2OAbOShlGDsxGAjjY6toD1kjKBV/v66EuqFvfXx7x9wO/ZoGoa6GcH8iPCfF/yu0=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rIgQm-000691-Ud for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 Dec 2023 02:47:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4DBF2CE12B0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 28 Dec 2023 02:47:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 901E8C433C7;
 Thu, 28 Dec 2023 02:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703731639;
 bh=2AjIOZxyvSsnOs5RvR4gm8XqtCrUbOnC19jU5B+aS1M=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=f2MUYIXWxRuy8oqd0WDfNtx+tGlwmeRADgTRQn8dzT9IilUKJdP8x7LlaxWl5DUND
 yVdjZFw8nTmI/pTAvBeWsgsp91dz/UkWUVdd7jkN4VTpWju2rTbyJp5BEu9TvVMx1n
 JP2GUI+Kc+h4MlJppB7U1Kc4TtlQHIypIYgiQU/IdH9/fRywlWMzMR6chUMA8FISqj
 kC0t4Cst+Z8fZrpeeoUaq2ScDUXUyQQzZuKJ97qwF7pf1nSVLsHaT5dKC17NMQ6MGs
 yxrcWiBOCu7hwb+tY9uzIleF0Q+CeJKPIv7U4sQbz5ADL7NmGIefMKMi3QE3iDosXo
 UaljN8u42/MgQ==
Message-ID: <b4b08863-4cd5-471f-9f88-ca3559201446@kernel.org>
Date: Thu, 28 Dec 2023 10:47:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20231225144335.2548-1-chao@kernel.org>
 <ZYyt7dNmPw0aMa5l@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <ZYyt7dNmPw0aMa5l@google.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/12/28 7:06, Jaegeuk Kim wrote: > On 12/25, Chao Yu
 wrote: >> We will encounter below inconsistent status when FAULT_BLKADDR
 type >> fault injection is on. >> >> Info: checkpoint state = d6 : n [...]
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -2.8 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rIgQm-000691-Ud
Subject: Re: [f2fs-dev] [PATCH v2 6/6] f2fs: introduce FAULT_INCONSISTENCE
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

On 2023/12/28 7:06, Jaegeuk Kim wrote:
> On 12/25, Chao Yu wrote:
>> We will encounter below inconsistent status when FAULT_BLKADDR type
>> fault injection is on.
>>
>> Info: checkpoint state = d6 :  nat_bits crc fsck compacted_summary orphan_inodes sudden-power-off
>> [ASSERT] (fsck_chk_inode_blk:1254)  --> ino: 0x1c100 has i_blocks: 000000c0, but has 191 blocks
>> [FIX] (fsck_chk_inode_blk:1260)  --> [0x1c100] i_blocks=0x000000c0 -> 0xbf
>> [FIX] (fsck_chk_inode_blk:1269)  --> [0x1c100] i_compr_blocks=0x00000026 -> 0x27
>> [ASSERT] (fsck_chk_inode_blk:1254)  --> ino: 0x1cadb has i_blocks: 0000002f, but has 46 blocks
>> [FIX] (fsck_chk_inode_blk:1260)  --> [0x1cadb] i_blocks=0x0000002f -> 0x2e
>> [FIX] (fsck_chk_inode_blk:1269)  --> [0x1cadb] i_compr_blocks=0x00000011 -> 0x12
>> [ASSERT] (fsck_chk_inode_blk:1254)  --> ino: 0x1c62c has i_blocks: 00000002, but has 1 blocks
>> [FIX] (fsck_chk_inode_blk:1260)  --> [0x1c62c] i_blocks=0x00000002 -> 0x1
>>
>> After we inject fault into f2fs_is_valid_blkaddr() during truncation,
>> a) it missed to increase @nr_free or @valid_blocks
>> b) it can cause in blkaddr leak in truncated dnode
>> Which may cause inconsistent status.
>>
>> This patch separates FAULT_INCONSISTENCE from FAULT_BLKADDR, so that
> 
> Could you please rename FAULT_INCONSISTENCE to give exactly what it tries
> to break?

Sure, maybe FAULT_BLKADDR_INCONSISTENCE... let me know if you want/have a
better one. :)

Thanks,

> 
>> we can:
>> a) use FAULT_INCONSISTENCE in f2fs_truncate_data_blocks_range() to
>> simulate inconsistent issue independently,
>> b) FAULT_BLKADDR fault will not cause any inconsistent status, we can
>> just use it to check error path handling in kernel side.
>>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>> v2:
>> - make __f2fs_is_valid_blkaddr() void.
>>   Documentation/ABI/testing/sysfs-fs-f2fs |  1 +
>>   Documentation/filesystems/f2fs.rst      |  1 +
>>   fs/f2fs/checkpoint.c                    | 19 +++++++++++++++----
>>   fs/f2fs/f2fs.h                          |  3 +++
>>   fs/f2fs/file.c                          |  8 ++++++--
>>   fs/f2fs/super.c                         |  1 +
>>   6 files changed, 27 insertions(+), 6 deletions(-)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
>> index 4f1d4e636d67..649aabac16c2 100644
>> --- a/Documentation/ABI/testing/sysfs-fs-f2fs
>> +++ b/Documentation/ABI/testing/sysfs-fs-f2fs
>> @@ -708,6 +708,7 @@ Description:	Support configuring fault injection type, should be
>>   		FAULT_DQUOT_INIT         0x000010000
>>   		FAULT_LOCK_OP            0x000020000
>>   		FAULT_BLKADDR            0x000040000
>> +		FAULT_INCONSISTENCE      0x000080000
>>   		===================      ===========
>>   
>>   What:		/sys/fs/f2fs/<disk>/discard_io_aware_gran
>> diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
>> index d32c6209685d..5616fb8ae207 100644
>> --- a/Documentation/filesystems/f2fs.rst
>> +++ b/Documentation/filesystems/f2fs.rst
>> @@ -206,6 +206,7 @@ fault_type=%d		 Support configuring fault injection type, should be
>>   			 FAULT_DQUOT_INIT	  0x000010000
>>   			 FAULT_LOCK_OP		  0x000020000
>>   			 FAULT_BLKADDR		  0x000040000
>> +			 FAULT_INCONSISTENCE	  0x000080000
>>   			 ===================	  ===========
>>   mode=%s			 Control block allocation mode which supports "adaptive"
>>   			 and "lfs". In "lfs" mode, there should be no random
>> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
>> index b0597a539fc5..84546f529cf0 100644
>> --- a/fs/f2fs/checkpoint.c
>> +++ b/fs/f2fs/checkpoint.c
>> @@ -170,12 +170,9 @@ static bool __is_bitmap_valid(struct f2fs_sb_info *sbi, block_t blkaddr,
>>   	return exist;
>>   }
>>   
>> -bool f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
>> +static bool __f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
>>   					block_t blkaddr, int type)
>>   {
>> -	if (time_to_inject(sbi, FAULT_BLKADDR))
>> -		return false;
>> -
>>   	switch (type) {
>>   	case META_NAT:
>>   		break;
>> @@ -230,6 +227,20 @@ bool f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
>>   	return true;
>>   }
>>   
>> +bool f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
>> +					block_t blkaddr, int type)
>> +{
>> +	if (time_to_inject(sbi, FAULT_BLKADDR))
>> +		return false;
>> +	return __f2fs_is_valid_blkaddr(sbi, blkaddr, type);
>> +}
>> +
>> +bool f2fs_is_valid_blkaddr_raw(struct f2fs_sb_info *sbi,
>> +					block_t blkaddr, int type)
>> +{
>> +	return __f2fs_is_valid_blkaddr(sbi, blkaddr, type);
>> +}
>> +
>>   /*
>>    * Readahead CP/NAT/SIT/SSA/POR pages
>>    */
>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>> index 34b20700b5ec..3985296e64cb 100644
>> --- a/fs/f2fs/f2fs.h
>> +++ b/fs/f2fs/f2fs.h
>> @@ -61,6 +61,7 @@ enum {
>>   	FAULT_DQUOT_INIT,
>>   	FAULT_LOCK_OP,
>>   	FAULT_BLKADDR,
>> +	FAULT_INCONSISTENCE,
>>   	FAULT_MAX,
>>   };
>>   
>> @@ -3767,6 +3768,8 @@ struct page *f2fs_get_meta_page_retry(struct f2fs_sb_info *sbi, pgoff_t index);
>>   struct page *f2fs_get_tmp_page(struct f2fs_sb_info *sbi, pgoff_t index);
>>   bool f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
>>   					block_t blkaddr, int type);
>> +bool f2fs_is_valid_blkaddr_raw(struct f2fs_sb_info *sbi,
>> +					block_t blkaddr, int type);
>>   int f2fs_ra_meta_pages(struct f2fs_sb_info *sbi, block_t start, int nrpages,
>>   			int type, bool sync);
>>   void f2fs_ra_meta_pages_cond(struct f2fs_sb_info *sbi, pgoff_t index,
>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>> index 9f4e21b5916c..b5149f1f2a20 100644
>> --- a/fs/f2fs/file.c
>> +++ b/fs/f2fs/file.c
>> @@ -590,9 +590,13 @@ void f2fs_truncate_data_blocks_range(struct dnode_of_data *dn, int count)
>>   		f2fs_set_data_blkaddr(dn, NULL_ADDR);
>>   
>>   		if (__is_valid_data_blkaddr(blkaddr)) {
>> -			if (!f2fs_is_valid_blkaddr(sbi, blkaddr,
>> -					DATA_GENERIC_ENHANCE))
>> +			if (time_to_inject(sbi, FAULT_INCONSISTENCE))
>> +				continue;
>> +			if (!f2fs_is_valid_blkaddr_raw(sbi, blkaddr,
>> +						DATA_GENERIC_ENHANCE)) {
>> +				f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
>>   				continue;
>> +			}
>>   			if (compressed_cluster)
>>   				valid_blocks++;
>>   		}
>> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
>> index 206d03c82d96..9a5c5e06f766 100644
>> --- a/fs/f2fs/super.c
>> +++ b/fs/f2fs/super.c
>> @@ -62,6 +62,7 @@ const char *f2fs_fault_name[FAULT_MAX] = {
>>   	[FAULT_DQUOT_INIT]	= "dquot initialize",
>>   	[FAULT_LOCK_OP]		= "lock_op",
>>   	[FAULT_BLKADDR]		= "invalid blkaddr",
>> +	[FAULT_INCONSISTENCE]	= "inconsistence",
>>   };
>>   
>>   void f2fs_build_fault_attr(struct f2fs_sb_info *sbi, unsigned int rate,
>> -- 
>> 2.40.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
