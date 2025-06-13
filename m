Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3198BAD828E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Jun 2025 07:32:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Hxnyr96ZAJNC6WHNM1otaWTLeymklHwLlvEKfMaaKE=; b=l5orfCHUOotNCWAxVZa+W2hAiK
	nVHYwfyUvQd1e2Sdt0oIgHJSCW3hPZunbu+UA86KyQneSFZjGrBwN53leNqjWvafN+kmaNF4pbR3x
	HCn7veW1GDLa93RB2QxRKImmZa9X01Z1Y+jmSZMUNUMZVUSL823g0tYowjiLn4i0MW0M=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uPx1C-0000jg-A3;
	Fri, 13 Jun 2025 05:31:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uPx1B-0000ja-HU
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Jun 2025 05:31:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ccNRPaAcLYJRErFVJ7rFMsuOVs3bKl3eNkf6Pg7W8xA=; b=blXxgek6mw3hymQj2V9gWBsIe4
 7RBYkzqUPkdawb6/TP/ELvV2QzHDIFAuYZiLJlUw11xjmuAfzD3ihMYk2U3hQJ2tlZzHtddSPrSHF
 Jz7fukf2eL9y9Dvy70IJz5xBmtj8/nHow1kS8DMclrJR46V82EZqCXwXORnGZ+9gTNLk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ccNRPaAcLYJRErFVJ7rFMsuOVs3bKl3eNkf6Pg7W8xA=; b=E+JWwO9SFLg89acIl35HmjDlhC
 sazD3lA0E2bA8qMLAzTVViXpFMgUCdz32lJ0pSvYmaoKcxM/p1QpVXdNG43vgkBrAurBfwNlDXoNw
 A1VJrjYTmOU2sjEwZFfT483FH6rnc/W6qKWA5RMvsjpRwlhCW5x63PvJseRogLud6lxE=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uPx1A-0000Ov-Va for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Jun 2025 05:31:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 685884A03D;
 Fri, 13 Jun 2025 05:31:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47BF6C4CEED;
 Fri, 13 Jun 2025 05:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749792711;
 bh=NRB2YHNY6V0/cOywozOMB3mtKlY/Qugj7lYZ5RarsSE=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=nYtPnR5G1vn3Ht0iV6UzuHLZKJDksJQaR0r5V7URS8Ga3gir4t4NZcfC5Ka8Re1be
 CM1sv9gblBtwphGBYNmCkHhPKS5g1hSIJxy2ZJxDl1FNriNeE5yaqSNHpdlB/twh7v
 uDYdGEQg23mUMvPVKzJCb6EoeiOWz+YUmKP4JZWPvAaczPoHgZIVMKROrZgew+yMHu
 LuNW2NWCbregO6XMjrwqVhB+7BbqdIc68emrrFqRlDt7m/cFHJ15SKlM6F5FHM0BL1
 GXWjwWgD+QiDsRroUNIW+b7AFnv3LN4qjTVuHO5TMEYJn+146/EkIwydIiqsjfPBwl
 D1ztMtUr/pbRw==
Message-ID: <c63deaf9-c567-46c4-a716-fae2b4736b88@kernel.org>
Date: Fri, 13 Jun 2025 13:31:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: wangzijie <wangzijie1@honor.com>, linux-f2fs-devel@lists.sourceforge.net
References: <20250612140526.6435-1-chao@kernel.org>
 <20250613051110.1865186-1-wangzijie1@honor.com>
Content-Language: en-US
In-Reply-To: <20250613051110.1865186-1-wangzijie1@honor.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025/6/13 13:11, wangzijie wrote: >> This patch introduces
 /sys/fs/f2fs/<dev>/reserved_pin_section for tuning >> @needed parameter of
 has_not_enough_free_secs(), if we configure it w/ >> zero, it c [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uPx1A-0000Ov-Va
Subject: Re: [f2fs-dev] [PATCH] f2fs: introduce reserved_pin_section sysfs
 entry
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2025/6/13 13:11, wangzijie wrote:
>> This patch introduces /sys/fs/f2fs/<dev>/reserved_pin_section for tuning
>> @needed parameter of has_not_enough_free_secs(), if we configure it w/
>> zero, it can avoid f2fs_gc() as much as possible while fallocating on
>> pinned file.
>>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>>   Documentation/ABI/testing/sysfs-fs-f2fs | 9 +++++++++
>>   fs/f2fs/f2fs.h                          | 3 +++
>>   fs/f2fs/file.c                          | 5 ++---
>>   fs/f2fs/super.c                         | 3 +++
>>   fs/f2fs/sysfs.c                         | 9 +++++++++
>>   5 files changed, 26 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
>> index bf03263b9f46..c2a233f2a085 100644
>> --- a/Documentation/ABI/testing/sysfs-fs-f2fs
>> +++ b/Documentation/ABI/testing/sysfs-fs-f2fs
>> @@ -861,3 +861,12 @@ Description:	This is a read-only entry to show the value of sb.s_encoding_flags,
>>   		SB_ENC_STRICT_MODE_FL            0x00000001
>>   		SB_ENC_NO_COMPAT_FALLBACK_FL     0x00000002
>>   		============================     ==========
>> +
>> +What:		/sys/fs/f2fs/<disk>/reserved_pin_section
>> +Date:		June 2025
>> +Contact:	"Chao Yu" <chao@kernel.org>
>> +Description:	This threshold is used to control triggering garbage collection while
>> +		fallocating on pinned file, so, it can guarantee there is enough free
>> +		reserved section before preallocating on pinned file.
>> +		By default, the value is ovp_sections, especially, for zoned ufs, the
>> +		value is 1.
>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>> index 9333a22b9a01..fa27498202a3 100644
>> --- a/fs/f2fs/f2fs.h
>> +++ b/fs/f2fs/f2fs.h
>> @@ -1724,6 +1724,9 @@ struct f2fs_sb_info {
>>   	/* for skip statistic */
>>   	unsigned long long skipped_gc_rwsem;		/* FG_GC only */
>>   
>> +	/* free sections reserved for pinned file */
>> +	unsigned int reserved_pin_section;
>> +
>>   	/* threshold for gc trials on pinned files */
>>   	unsigned short gc_pin_file_threshold;
>>   	struct f2fs_rwsem pin_sem;
>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>> index 696131e655ed..a909f79db178 100644
>> --- a/fs/f2fs/file.c
>> +++ b/fs/f2fs/file.c
>> @@ -1887,9 +1887,8 @@ static int f2fs_expand_inode_data(struct inode *inode, loff_t offset,
>>   			}
>>   		}
>>   
>> -		if (has_not_enough_free_secs(sbi, 0, f2fs_sb_has_blkzoned(sbi) ?
>> -			ZONED_PIN_SEC_REQUIRED_COUNT :
>> -			GET_SEC_FROM_SEG(sbi, overprovision_segments(sbi)))) {
>> +		if (has_not_enough_free_secs(sbi, 0,
>> +				sbi->reserved_pin_section)) {
>>   			f2fs_down_write(&sbi->gc_lock);
>>   			stat_inc_gc_call_count(sbi, FOREGROUND);
>>   			err = f2fs_gc(sbi, &gc_control);
>> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
>> index 57adeff5ef25..48b97a95fd63 100644
>> --- a/fs/f2fs/super.c
>> +++ b/fs/f2fs/super.c
>> @@ -4975,6 +4975,9 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
>>   	sbi->last_valid_block_count = sbi->total_valid_block_count;
>>   	sbi->reserved_blocks = 0;
>>   	sbi->current_reserved_blocks = 0;
>> +	sbi->reserved_pin_section = f2fs_sb_has_blkzoned(sbi) ?
>> +			ZONED_PIN_SEC_REQUIRED_COUNT :
>> +			GET_SEC_FROM_SEG(sbi, overprovision_segments(sbi));
>>   	limit_reserve_root(sbi);
>>   	adjust_unusable_cap_perc(sbi);
> 
> Hi Chao,
> It seems like we cannot use overprovision_segments(sbi) directly before f2fs_build_segment_manager().

Oops, ovp_segments is in f2fs_sm_info, I missed that, let me fix in v2.

Thanks,

>   
>> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
>> index 75134d69a0bd..51be7ffb38c5 100644
>> --- a/fs/f2fs/sysfs.c
>> +++ b/fs/f2fs/sysfs.c
>> @@ -824,6 +824,13 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
>>   		return count;
>>   	}
>>   
>> +	if (!strcmp(a->attr.name, "reserved_pin_section")) {
>> +		if (t > GET_SEC_FROM_SEG(sbi, overprovision_segments(sbi)))
>> +			return -EINVAL;
>> +		*ui = (unsigned int)t;
>> +		return count;
>> +	}
>> +
>>   	*ui = (unsigned int)t;
>>   
>>   	return count;
>> @@ -1130,6 +1137,7 @@ F2FS_SBI_GENERAL_RO_ATTR(unusable_blocks_per_sec);
>>   F2FS_SBI_GENERAL_RW_ATTR(blkzone_alloc_policy);
>>   #endif
>>   F2FS_SBI_GENERAL_RW_ATTR(carve_out);
>> +F2FS_SBI_GENERAL_RW_ATTR(reserved_pin_section);
>>   
>>   /* STAT_INFO ATTR */
>>   #ifdef CONFIG_F2FS_STAT_FS
>> @@ -1323,6 +1331,7 @@ static struct attribute *f2fs_attrs[] = {
>>   	ATTR_LIST(last_age_weight),
>>   	ATTR_LIST(max_read_extent_count),
>>   	ATTR_LIST(carve_out),
>> +	ATTR_LIST(reserved_pin_section),
>>   	NULL,
>>   };
>>   ATTRIBUTE_GROUPS(f2fs);
>> -- 
>> 2.40.1
>>
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
