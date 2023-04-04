Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4A26D66AF
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Apr 2023 17:03:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pjiBx-0008Ft-Gk;
	Tue, 04 Apr 2023 15:03:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pjiBv-0008Fm-UE
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 15:03:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 Subject:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=z9aoaAacSWLDqGouznJKCG5DmtE61Hj36npYkil07RA=; b=InRqylUrOirFxqrXqUFFs9TXAr
 7YNBJbrNGkwaKB/WKKQFh36902P5F1N4Cy4emFc/OFFUJv1dXE95wUEJL1LwmlcmtZlQWrSSBWQh0
 SxK0eq1/1Xw0a4hYbRSRRW8hrb4iE6XHGFFu6zPbDBC/fpiWI4PZgR2IUYttcN78/Vd8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:From:
 References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=z9aoaAacSWLDqGouznJKCG5DmtE61Hj36npYkil07RA=; b=QHyg6tV+e7mru6ZM5cyZuGEWSI
 J3fzv65C96MKCl5YznGyw4Zmw1qmq8RrfF2cOmioK5SV3QzP5634SJ7Jlnl8mlLWGnegjMBin1vCd
 S3IHtQmRALtrt0vM8qZ1zhP7W06Pmwd+0RvRP3IMo6wrSRFi2EQbNrl4lYFoW5yVr2Kw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pjiBt-00Ezdj-7B for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 15:03:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C93CB635BD
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  4 Apr 2023 15:03:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1ED2C4339B;
 Tue,  4 Apr 2023 15:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680620595;
 bh=7oy8h46rrhB1ieIqVXQECr4df3oWx5oEbXm8xhNQB/4=;
 h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
 b=g0QX2A/ElUKD3zejglZ+pWv5gerUvIOVE3W4rcE06gvtBJxrGqX6za46CTYS2HrQ8
 Yl/QySeiOxEC+7VkgN1oW9pAfe/xtrPRjAniQdGsVMie3WUZQeuwPsovIYE0X+fa8t
 /hKfpBdlEuM7sx7ph9HX/JlSqKpQHG+xTx0IlXFRmdsXhpXkxk6ARW64wcSSt/Stbq
 coEtHGRkZUw5LfZAl+Pd7j2cV64SruXpMvJwfiP5ZkJxHa8lGz2W2wpYCkRhFcfU8j
 4ciBXS9ePYhjfXv2nrRQPuCQerfo5F4oaOaFcVQfMgLtQDVCUwK1b97wksPqngqDgZ
 8PIv6yfTMQatQ==
Message-ID: <e4757f96-8749-5210-11cc-fcbe4875661d@kernel.org>
Date: Tue, 4 Apr 2023 23:03:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20230402112825.42486-1-chao@kernel.org>
 <ZCsT5mRsZJqPXBzz@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <ZCsT5mRsZJqPXBzz@google.com>
X-Spam-Score: -7.1 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/4/4 1:59, Jaegeuk Kim wrote: > On 04/02,
 Chao Yu wrote:
 >> This patch does below changes: >> >> - If f2fs enables readonly feature
 or device is readonly, allow to >> mount readonly mode only > [...] 
 Content analysis details:   (-7.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -1.9 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pjiBt-00Ezdj-7B
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to check readonly condition
 correctly
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

On 2023/4/4 1:59, Jaegeuk Kim wrote:
> On 04/02, Chao Yu wrote:
>> This patch does below changes:
>>
>> - If f2fs enables readonly feature or device is readonly, allow to
>> mount readonly mode only
>> - Introduce f2fs_dev_is_readonly() to indicate whether image or device
>> is readonly
>> - remove unnecessary f2fs_hw_is_readonly() in f2fs_write_checkpoint()
>> and f2fs_convert_inline_inode()
>> - enable FLUSH_MERGE only if f2fs is mounted as rw and image/device
>> is writable
> 
> What is the problem to solve here?

With below case, it can mount multi-device image w/ rw option, however
one of secondary device is set as ro, later update will cause panic, so
I introduced f2fs_dev_is_readonly(), and check multi-devices rw status
in parse_options() w/ it in order to avoid such inconsistent mount status.

mkfs.f2fs -c /dev/zram1 /dev/zram0 -f
blockdev --setro /dev/zram1
mount -t f2fs /dev/zram0 /mnt/f2fs/
mount: /mnt/f2fs: WARNING: source write-protected, mounted read-only.
mount -t f2fs -o remount,rw /mnt/f2fs/
dd if=/dev/zero  of=/mnt/f2fs/file bs=1M count=8192

kernel BUG at fs/f2fs/inline.c:258!
RIP: 0010:f2fs_write_inline_data+0x23e/0x2d0 [f2fs]
Call Trace:
  f2fs_write_single_data_page+0x26b/0x9f0 [f2fs]
  f2fs_write_cache_pages+0x389/0xa60 [f2fs]
  __f2fs_write_data_pages+0x26b/0x2d0 [f2fs]
  f2fs_write_data_pages+0x2e/0x40 [f2fs]
  do_writepages+0xd3/0x1b0
  __writeback_single_inode+0x5b/0x420
  writeback_sb_inodes+0x236/0x5a0
  __writeback_inodes_wb+0x56/0xf0
  wb_writeback+0x2a3/0x490
  wb_do_writeback+0x2b2/0x330
  wb_workfn+0x6a/0x260
  process_one_work+0x270/0x5e0
  worker_thread+0x52/0x3e0
  kthread+0xf4/0x120
  ret_from_fork+0x29/0x50

Thanks,

> 
>>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>>   fs/f2fs/checkpoint.c |  2 +-
>>   fs/f2fs/f2fs.h       | 10 +++++-----
>>   fs/f2fs/inline.c     |  3 +--
>>   fs/f2fs/super.c      | 13 +++++++------
>>   4 files changed, 14 insertions(+), 14 deletions(-)
>>
>> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
>> index 8e1db5752fff..1eef597ed393 100644
>> --- a/fs/f2fs/checkpoint.c
>> +++ b/fs/f2fs/checkpoint.c
>> @@ -1604,7 +1604,7 @@ int f2fs_write_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
>>   	unsigned long long ckpt_ver;
>>   	int err = 0;
>>   
>> -	if (f2fs_readonly(sbi->sb) || f2fs_hw_is_readonly(sbi))
>> +	if (f2fs_readonly(sbi->sb))
>>   		return -EROFS;
>>   
>>   	if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED))) {
>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>> index 2d4a7ef62537..7de95133478a 100644
>> --- a/fs/f2fs/f2fs.h
>> +++ b/fs/f2fs/f2fs.h
>> @@ -4446,6 +4446,11 @@ static inline bool f2fs_hw_is_readonly(struct f2fs_sb_info *sbi)
>>   	return false;
>>   }
>>   
>> +static inline bool f2fs_dev_is_readonly(struct f2fs_sb_info *sbi)
>> +{
>> +	return f2fs_sb_has_readonly(sbi) || f2fs_hw_is_readonly(sbi);
>> +}
>> +
>>   static inline bool f2fs_lfs_mode(struct f2fs_sb_info *sbi)
>>   {
>>   	return F2FS_OPTION(sbi).fs_mode == FS_MODE_LFS;
>> @@ -4546,11 +4551,6 @@ static inline void f2fs_handle_page_eio(struct f2fs_sb_info *sbi, pgoff_t ofs,
>>   	}
>>   }
>>   
>> -static inline bool f2fs_is_readonly(struct f2fs_sb_info *sbi)
>> -{
>> -	return f2fs_sb_has_readonly(sbi) || f2fs_readonly(sbi->sb);
>> -}
>> -
>>   #define EFSBADCRC	EBADMSG		/* Bad CRC detected */
>>   #define EFSCORRUPTED	EUCLEAN		/* Filesystem is corrupted */
>>   
>> diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
>> index 72269e7efd26..2c36f2dc2317 100644
>> --- a/fs/f2fs/inline.c
>> +++ b/fs/f2fs/inline.c
>> @@ -203,8 +203,7 @@ int f2fs_convert_inline_inode(struct inode *inode)
>>   	struct page *ipage, *page;
>>   	int err = 0;
>>   
>> -	if (!f2fs_has_inline_data(inode) ||
>> -			f2fs_hw_is_readonly(sbi) || f2fs_readonly(sbi->sb))
>> +	if (!f2fs_has_inline_data(inode) || f2fs_readonly(sbi->sb))
>>   		return 0;
>>   
>>   	err = f2fs_dquot_initialize(inode);
>> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
>> index d016f398fcad..db7649010c12 100644
>> --- a/fs/f2fs/super.c
>> +++ b/fs/f2fs/super.c
>> @@ -1382,15 +1382,16 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
>>   		return -EINVAL;
>>   	}
>>   
>> -	if (f2fs_is_readonly(sbi) && test_opt(sbi, FLUSH_MERGE)) {
>> +	if (f2fs_dev_is_readonly(sbi) && !f2fs_readonly(sbi->sb)) {
>> +		f2fs_err(sbi, "Allow to mount readonly mode only");
>> +		return -EROFS;
>> +	}
>> +
>> +	if (f2fs_readonly(sbi->sb) && test_opt(sbi, FLUSH_MERGE)) {
>>   		f2fs_err(sbi, "FLUSH_MERGE not compatible with readonly mode");
>>   		return -EINVAL;
>>   	}
>>   
>> -	if (f2fs_sb_has_readonly(sbi) && !f2fs_readonly(sbi->sb)) {
>> -		f2fs_err(sbi, "Allow to mount readonly mode only");
>> -		return -EROFS;
>> -	}
>>   	return 0;
>>   }
>>   
>> @@ -2122,7 +2123,7 @@ static void default_options(struct f2fs_sb_info *sbi)
>>   	set_opt(sbi, MERGE_CHECKPOINT);
>>   	F2FS_OPTION(sbi).unusable_cap = 0;
>>   	sbi->sb->s_flags |= SB_LAZYTIME;
>> -	if (!f2fs_is_readonly(sbi))
>> +	if (!f2fs_readonly(sbi->sb) && !f2fs_dev_is_readonly(sbi))
>>   		set_opt(sbi, FLUSH_MERGE);
>>   	if (f2fs_hw_support_discard(sbi) || f2fs_hw_should_discard(sbi))
>>   		set_opt(sbi, DISCARD);
>> -- 
>> 2.36.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
