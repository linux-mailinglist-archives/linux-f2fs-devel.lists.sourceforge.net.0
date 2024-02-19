Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 03351859B22
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Feb 2024 04:46:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rbubi-00047q-2m;
	Mon, 19 Feb 2024 03:46:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rbubg-00047f-Qz
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Feb 2024 03:46:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EOiYQpoahj4LkSa7A3y/liWk+2pzH3q+IgNQcNibAYM=; b=BaAP1RDsJNOSN9EnYUWXWKB6ad
 CopaHxWI2AF9L6kOy1co+G0jLBp4BQI/7Tjaxj6ZKpyAZVrDoAvxJnO05iOtWcTPbyeSowGk7edYa
 /OK6APfNXGM7rhcc7VEiC3D4pJmG7fkwAXSuJD7BHVTCI8BA7KdTJbkbyZco3134fUVk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EOiYQpoahj4LkSa7A3y/liWk+2pzH3q+IgNQcNibAYM=; b=Osk0w4HWtgjCXHnBltcQNP6gfc
 ZAq1LCtc9MfqoM4mjMJdDEZXEffhb7hLHmIi4/rFqrHHn0NynaIJhQletaE728X67iVa7uLScGgVU
 OjpoemQN2bZMizkfWV+hWWI1Wb2tSk+panR9b8cuB99hekTJ6pI1itgB6YsPPPTvmTQo=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rbubd-0000Ct-D1 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Feb 2024 03:46:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 9A6ACCE0E15;
 Mon, 19 Feb 2024 03:46:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9AF0C433C7;
 Mon, 19 Feb 2024 03:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708314366;
 bh=vEBoTcuR/nSO6LL9kSYfq0xkSgBQi1GGuclwDSBKX5w=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=vIZlhgu10+z1RYo9U2WEl5pF8ZhzAqhdAUwbc7Gnw+3VIBy0R8XQRi0Rtq/3PotUH
 HDRb3WNtu3lXwcMrmnorxOLw3nnw/9sRBp4H5N9iEGLBjqCnSoGdD3QDUDQaMUga1m
 dpE5q5HO0KqJMwFJPSIKN4THDQx2nNz/kCNN4qVdBvQGKa1wLFAdTYmiloY5oaFwG7
 fmjesgkLilFWINA4MqZVYx/mpUdLiAZh12NXa/GJ74N0Siw8ju/bsyB+Wv8GkG0Izz
 xKG+E8/V6zzXLSCpLR10rg3AS679Tc0pZQczKARMTl8IkxvsOtPvsDzlOUENwh2DQ4
 iTdfg7C3FU+pw==
Message-ID: <6f01fe1b-d580-4a2a-adc5-7eb3baebeb7a@kernel.org>
Date: Mon, 19 Feb 2024 11:46:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, Zhiguo Niu <zhiguo.niu@unisoc.com>
References: <1707103845-17220-1-git-send-email-zhiguo.niu@unisoc.com>
 <e2680238-9e9c-422a-adf3-bcee71dfe0a8@kernel.org>
 <ZcGoWAsl08d5-U0g@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <ZcGoWAsl08d5-U0g@google.com>
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/2/6 11:32, Jaegeuk Kim wrote: > On 02/05, Chao Yu
 wrote: >> On 2024/2/5 11:30, Zhiguo Niu wrote: >>> There are some cases of
 f2fs_is_valid_blkaddr not handled as >>> ERROR_INVALID_BLKADDR,so u [...]
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rbubd-0000Ct-D1
Subject: Re: [f2fs-dev] [PATCH v7] f2fs: unify the error handling of
 f2fs_is_valid_blkaddr
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
Cc: hongyu.jin@unisoc.com, ke.wang@unisoc.com, niuzhiguo84@gmail.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/2/6 11:32, Jaegeuk Kim wrote:
> On 02/05, Chao Yu wrote:
>> On 2024/2/5 11:30, Zhiguo Niu wrote:
>>> There are some cases of f2fs_is_valid_blkaddr not handled as
>>> ERROR_INVALID_BLKADDR,so unify the error handling about all of
>>> f2fs_is_valid_blkaddr.
>>>
>>> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
>>> Signed-off-by: Chao Yu <chao@kernel.org>
>>> ---
>>> changes of v7: update patch according to sync with Chao
>>>     -restore some code to original
>>>     -modify err handle of __is_bitmap_valid for covering all cases
>>> changes of v6: improve patch according to Chao's suggestions
>>>     -restore dump_stack to original position
>>>     -adjuest code sequence of __is_bitmap_check_valid
>>> changes of v5: improve patch according to Jaegeuk's suggestiongs
>>>     -restore return value of some f2fs_is_valid_blkaddr error case to original
>>>     -move cp_err checking to outermost for unified processing
>>>     -return true directly for case (type=DATA_GENERIC_ENHANCE_READ) in
>>>      __is_bitmap_valid to avoid meaningless flow
>>>     -rename __is_bitmap_valid to __is_bitmap_check_valid for avoiding ambiguity
>>>      and handling its return value in the caller uniformly, also cooperate
>>>      switch checking true to false for error case of
>>>      f2fs_is_valid_blkaddr(type=DATA_GENERIC_ENHANCE_UPDATE) in do_recover_data
>>>      for more readable
>>> changes of v4: update according to the latest code
>>> changes of v3:
>>>     -rebase patch to dev-test
>>>     -correct return value for some f2fs_is_valid_blkaddr error case
>>> changes of v2: improve patch according Chao's suggestions.
>>> ---
>>> ---
>>>    fs/f2fs/checkpoint.c   | 33 ++++++++++++++++++---------------
>>>    fs/f2fs/data.c         | 22 +++-------------------
>>>    fs/f2fs/extent_cache.c |  5 +----
>>>    fs/f2fs/file.c         | 16 +++-------------
>>>    fs/f2fs/gc.c           |  2 --
>>>    fs/f2fs/recovery.c     |  4 ----
>>>    fs/f2fs/segment.c      |  2 --
>>>    7 files changed, 25 insertions(+), 59 deletions(-)
>>>
>>> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
>>> index b85820e..3335619 100644
>>> --- a/fs/f2fs/checkpoint.c
>>> +++ b/fs/f2fs/checkpoint.c
>>> @@ -154,46 +154,43 @@ static bool __is_bitmap_valid(struct f2fs_sb_info *sbi, block_t blkaddr,
>>>    	if (unlikely(f2fs_cp_error(sbi)))
>>>    		return exist;
>>> -	if (exist && type == DATA_GENERIC_ENHANCE_UPDATE) {
>>> -		f2fs_err(sbi, "Inconsistent error blkaddr:%u, sit bitmap:%d",
>>> -			 blkaddr, exist);
>>> -		set_sbi_flag(sbi, SBI_NEED_FSCK);
>>> -		return exist;
>>> -	}
>>> -
>>> -	if (!exist && type == DATA_GENERIC_ENHANCE) {
>>> +	if ((exist && type == DATA_GENERIC_ENHANCE_UPDATE) ||
>>> +		(!exist && type == DATA_GENERIC_ENHANCE)) {
>>>    		f2fs_err(sbi, "Inconsistent error blkaddr:%u, sit bitmap:%d",
>>>    			 blkaddr, exist);
>>>    		set_sbi_flag(sbi, SBI_NEED_FSCK);
>>>    		dump_stack();
>>>    	}
>>> +
>>
>> No need to add one blank line.
>>
>> Otherwise, it looks good to me.
>>
>> Reviewed-by: Chao Yu <chao@kernel.org>
>>
>> Thanks,
>>
>>>    	return exist;
>>>    }
>>>    static bool __f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
>>>    					block_t blkaddr, int type)
>>>    {
>>> +	bool valid = false;
>>> +
>>>    	switch (type) {
>>>    	case META_NAT:
>>>    		break;
>>>    	case META_SIT:
>>>    		if (unlikely(blkaddr >= SIT_BLK_CNT(sbi)))
>>> -			return false;
>>> +			goto err;
>>>    		break;
>>>    	case META_SSA:
>>>    		if (unlikely(blkaddr >= MAIN_BLKADDR(sbi) ||
>>>    			blkaddr < SM_I(sbi)->ssa_blkaddr))
>>> -			return false;
>>> +			goto err;
>>>    		break;
>>>    	case META_CP:
>>>    		if (unlikely(blkaddr >= SIT_I(sbi)->sit_base_addr ||
>>>    			blkaddr < __start_cp_addr(sbi)))
>>> -			return false;
>>> +			goto err;
>>>    		break;
>>>    	case META_POR:
>>>    		if (unlikely(blkaddr >= MAX_BLKADDR(sbi) ||
>>>    			blkaddr < MAIN_BLKADDR(sbi)))
>>> -			return false;
>>> +			goto err;
>>>    		break;
>>>    	case DATA_GENERIC:
>>>    	case DATA_GENERIC_ENHANCE:
>>> @@ -210,21 +207,27 @@ static bool __f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
>>>    				  blkaddr);
>>>    			set_sbi_flag(sbi, SBI_NEED_FSCK);
>>>    			dump_stack();
>>> -			return false;
>>> +			goto err;
>>>    		} else {
>>> -			return __is_bitmap_valid(sbi, blkaddr, type);
>>> +			valid = __is_bitmap_valid(sbi, blkaddr, type);
>>> +			if ((!valid && type != DATA_GENERIC_ENHANCE_UPDATE) ||
>>> +				(valid && type == DATA_GENERIC_ENHANCE_UPDATE))
>>> +				goto err;
> 
> Please think about how to optimize this, which is really ugly now.

How about this?

---
  fs/f2fs/checkpoint.c | 16 +++++++++-------
  1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 246b2a063cfb..5a6ac6f26cfe 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -135,7 +135,7 @@ struct page *f2fs_get_tmp_page(struct f2fs_sb_info *sbi, pgoff_t index)
  }

  static bool __is_bitmap_valid(struct f2fs_sb_info *sbi, block_t blkaddr,
-							int type)
+						int type, bool *record_error)
  {
  	struct seg_entry *se;
  	unsigned int segno, offset;
@@ -160,6 +160,7 @@ static bool __is_bitmap_valid(struct f2fs_sb_info *sbi, block_t blkaddr,
  			 blkaddr, exist);
  		set_sbi_flag(sbi, SBI_NEED_FSCK);
  		dump_stack();
+		*record_error = true;
  	}

  	return exist;
@@ -168,8 +169,6 @@ static bool __is_bitmap_valid(struct f2fs_sb_info *sbi, block_t blkaddr,
  static bool __f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
  					block_t blkaddr, int type)
  {
-	bool valid = false;
-
  	switch (type) {
  	case META_NAT:
  		break;
@@ -209,10 +208,13 @@ static bool __f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
  			dump_stack();
  			goto err;
  		} else {
-			valid = __is_bitmap_valid(sbi, blkaddr, type);
-			if ((!valid && type != DATA_GENERIC_ENHANCE_UPDATE) ||
-				(valid && type == DATA_GENERIC_ENHANCE_UPDATE))
+			bool valid, record_error = false;
+
+			valid = __is_bitmap_valid(sbi, blkaddr, type,
+							&record_error);
+			if (!valid || record_error)
  				goto err;
+			return valid;
  		}
  		break;
  	case META_GENERIC:
@@ -227,7 +229,7 @@ static bool __f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
  	return true;
  err:
  	f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
-	return valid;
+	return false;
  }

  bool f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
-- 
2.40.1



> 
>>>    		}
>>>    		break;
>>>    	case META_GENERIC:
>>>    		if (unlikely(blkaddr < SEG0_BLKADDR(sbi) ||
>>>    			blkaddr >= MAIN_BLKADDR(sbi)))
>>> -			return false;
>>> +			goto err;
>>>    		break;
>>>    	default:
>>>    		BUG();
>>>    	}
>>>    	return true;
>>> +err:
>>> +	f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
>>> +	return valid;
>>>    }
>>>    bool f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
>>> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
>>> index 05158f8..300f9ae 100644
>>> --- a/fs/f2fs/data.c
>>> +++ b/fs/f2fs/data.c
>>> @@ -738,10 +738,8 @@ int f2fs_submit_page_bio(struct f2fs_io_info *fio)
>>>    	if (!f2fs_is_valid_blkaddr(fio->sbi, fio->new_blkaddr,
>>>    			fio->is_por ? META_POR : (__is_meta_io(fio) ?
>>> -			META_GENERIC : DATA_GENERIC_ENHANCE))) {
>>> -		f2fs_handle_error(fio->sbi, ERROR_INVALID_BLKADDR);
>>> +			META_GENERIC : DATA_GENERIC_ENHANCE)))
>>>    		return -EFSCORRUPTED;
>>> -	}
>>>    	trace_f2fs_submit_page_bio(page, fio);
>>> @@ -946,10 +944,8 @@ int f2fs_merge_page_bio(struct f2fs_io_info *fio)
>>>    			fio->encrypted_page : fio->page;
>>>    	if (!f2fs_is_valid_blkaddr(fio->sbi, fio->new_blkaddr,
>>> -			__is_meta_io(fio) ? META_GENERIC : DATA_GENERIC)) {
>>> -		f2fs_handle_error(fio->sbi, ERROR_INVALID_BLKADDR);
>>> +			__is_meta_io(fio) ? META_GENERIC : DATA_GENERIC))
>>>    		return -EFSCORRUPTED;
>>> -	}
>>>    	trace_f2fs_submit_page_bio(page, fio);
>>> @@ -1286,8 +1282,6 @@ struct page *f2fs_get_read_data_page(struct inode *inode, pgoff_t index,
>>>    		if (!f2fs_is_valid_blkaddr(F2FS_I_SB(inode), dn.data_blkaddr,
>>>    						DATA_GENERIC_ENHANCE_READ)) {
>>>    			err = -EFSCORRUPTED;
>>> -			f2fs_handle_error(F2FS_I_SB(inode),
>>> -						ERROR_INVALID_BLKADDR);
>>>    			goto put_err;
>>>    		}
>>>    		goto got_it;
>>> @@ -1313,8 +1307,6 @@ struct page *f2fs_get_read_data_page(struct inode *inode, pgoff_t index,
>>>    						dn.data_blkaddr,
>>>    						DATA_GENERIC_ENHANCE)) {
>>>    		err = -EFSCORRUPTED;
>>> -		f2fs_handle_error(F2FS_I_SB(inode),
>>> -					ERROR_INVALID_BLKADDR);
>>>    		goto put_err;
>>>    	}
>>>    got_it:
>>> @@ -1642,7 +1634,6 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
>>>    	if (!is_hole &&
>>>    	    !f2fs_is_valid_blkaddr(sbi, blkaddr, DATA_GENERIC_ENHANCE)) {
>>>    		err = -EFSCORRUPTED;
>>> -		f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
>>>    		goto sync_out;
>>>    	}
>>> @@ -2166,8 +2157,6 @@ static int f2fs_read_single_page(struct inode *inode, struct page *page,
>>>    		if (!f2fs_is_valid_blkaddr(F2FS_I_SB(inode), block_nr,
>>>    						DATA_GENERIC_ENHANCE_READ)) {
>>>    			ret = -EFSCORRUPTED;
>>> -			f2fs_handle_error(F2FS_I_SB(inode),
>>> -						ERROR_INVALID_BLKADDR);
>>>    			goto out;
>>>    		}
>>>    	} else {
>>> @@ -2707,11 +2696,8 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
>>>    	    f2fs_lookup_read_extent_cache_block(inode, page->index,
>>>    						&fio->old_blkaddr)) {
>>>    		if (!f2fs_is_valid_blkaddr(fio->sbi, fio->old_blkaddr,
>>> -						DATA_GENERIC_ENHANCE)) {
>>> -			f2fs_handle_error(fio->sbi,
>>> -						ERROR_INVALID_BLKADDR);
>>> +						DATA_GENERIC_ENHANCE))
>>>    			return -EFSCORRUPTED;
>>> -		}
>>>    		ipu_force = true;
>>>    		fio->need_lock = LOCK_DONE;
>>> @@ -2739,7 +2725,6 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
>>>    		!f2fs_is_valid_blkaddr(fio->sbi, fio->old_blkaddr,
>>>    						DATA_GENERIC_ENHANCE)) {
>>>    		err = -EFSCORRUPTED;
>>> -		f2fs_handle_error(fio->sbi, ERROR_INVALID_BLKADDR);
>>>    		goto out_writepage;
>>>    	}
>>> @@ -3706,7 +3691,6 @@ static int f2fs_write_begin(struct file *file, struct address_space *mapping,
>>>    		if (!f2fs_is_valid_blkaddr(sbi, blkaddr,
>>>    				DATA_GENERIC_ENHANCE_READ)) {
>>>    			err = -EFSCORRUPTED;
>>> -			f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
>>>    			goto fail;
>>>    		}
>>>    		err = f2fs_submit_page_read(use_cow ?
>>> diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
>>> index ad8dfac7..48048fa 100644
>>> --- a/fs/f2fs/extent_cache.c
>>> +++ b/fs/f2fs/extent_cache.c
>>> @@ -43,7 +43,6 @@ bool sanity_check_extent_cache(struct inode *inode)
>>>    	if (!f2fs_is_valid_blkaddr(sbi, ei->blk, DATA_GENERIC_ENHANCE) ||
>>>    	    !f2fs_is_valid_blkaddr(sbi, ei->blk + ei->len - 1,
>>>    					DATA_GENERIC_ENHANCE)) {
>>> -		set_sbi_flag(sbi, SBI_NEED_FSCK);
>>>    		f2fs_warn(sbi, "%s: inode (ino=%lx) extent info [%u, %u, %u] is incorrect, run fsck to fix",
>>>    			  __func__, inode->i_ino,
>>>    			  ei->blk, ei->fofs, ei->len);
>>> @@ -856,10 +855,8 @@ static int __get_new_block_age(struct inode *inode, struct extent_info *ei,
>>>    		goto out;
>>>    	if (__is_valid_data_blkaddr(blkaddr) &&
>>> -	    !f2fs_is_valid_blkaddr(sbi, blkaddr, DATA_GENERIC_ENHANCE)) {
>>> -		f2fs_bug_on(sbi, 1);
>>> +	    !f2fs_is_valid_blkaddr(sbi, blkaddr, DATA_GENERIC_ENHANCE))
>>>    		return -EINVAL;
>>> -	}
>>>    out:
>>>    	/*
>>>    	 * init block age with zero, this can happen when the block age extent
>>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>>> index 25b119cf..23cd6a1 100644
>>> --- a/fs/f2fs/file.c
>>> +++ b/fs/f2fs/file.c
>>> @@ -593,10 +593,8 @@ void f2fs_truncate_data_blocks_range(struct dnode_of_data *dn, int count)
>>>    			if (time_to_inject(sbi, FAULT_BLKADDR_CONSISTENCE))
>>>    				continue;
>>>    			if (!f2fs_is_valid_blkaddr_raw(sbi, blkaddr,
>>> -						DATA_GENERIC_ENHANCE)) {
>>> -				f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
>>> +						DATA_GENERIC_ENHANCE))
>>>    				continue;
>>> -			}
>>>    			if (compressed_cluster)
>>>    				valid_blocks++;
>>>    		}
>>> @@ -1196,7 +1194,6 @@ static int __read_out_blkaddrs(struct inode *inode, block_t *blkaddr,
>>>    			!f2fs_is_valid_blkaddr(sbi, *blkaddr,
>>>    					DATA_GENERIC_ENHANCE)) {
>>>    			f2fs_put_dnode(&dn);
>>> -			f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
>>>    			return -EFSCORRUPTED;
>>>    		}
>>> @@ -1482,7 +1479,6 @@ static int f2fs_do_zero_range(struct dnode_of_data *dn, pgoff_t start,
>>>    		if (!f2fs_is_valid_blkaddr(sbi, dn->data_blkaddr,
>>>    					DATA_GENERIC_ENHANCE)) {
>>>    			ret = -EFSCORRUPTED;
>>> -			f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
>>>    			break;
>>>    		}
>>> @@ -3442,10 +3438,8 @@ static int release_compress_blocks(struct dnode_of_data *dn, pgoff_t count)
>>>    		if (!__is_valid_data_blkaddr(blkaddr))
>>>    			continue;
>>>    		if (unlikely(!f2fs_is_valid_blkaddr(sbi, blkaddr,
>>> -					DATA_GENERIC_ENHANCE))) {
>>> -			f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
>>> +					DATA_GENERIC_ENHANCE)))
>>>    			return -EFSCORRUPTED;
>>> -		}
>>>    	}
>>>    	while (count) {
>>> @@ -3607,10 +3601,8 @@ static int reserve_compress_blocks(struct dnode_of_data *dn, pgoff_t count)
>>>    		if (!__is_valid_data_blkaddr(blkaddr))
>>>    			continue;
>>>    		if (unlikely(!f2fs_is_valid_blkaddr(sbi, blkaddr,
>>> -					DATA_GENERIC_ENHANCE))) {
>>> -			f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
>>> +					DATA_GENERIC_ENHANCE)))
>>>    			return -EFSCORRUPTED;
>>> -		}
>>>    	}
>>>    	while (count) {
>>> @@ -3894,8 +3886,6 @@ static int f2fs_sec_trim_file(struct file *filp, unsigned long arg)
>>>    						DATA_GENERIC_ENHANCE)) {
>>>    				ret = -EFSCORRUPTED;
>>>    				f2fs_put_dnode(&dn);
>>> -				f2fs_handle_error(sbi,
>>> -						ERROR_INVALID_BLKADDR);
>>>    				goto out;
>>>    			}
>>> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
>>> index a079eeb..30e93d8 100644
>>> --- a/fs/f2fs/gc.c
>>> +++ b/fs/f2fs/gc.c
>>> @@ -1197,7 +1197,6 @@ static int ra_data_block(struct inode *inode, pgoff_t index)
>>>    		if (unlikely(!f2fs_is_valid_blkaddr(sbi, dn.data_blkaddr,
>>>    						DATA_GENERIC_ENHANCE_READ))) {
>>>    			err = -EFSCORRUPTED;
>>> -			f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
>>>    			goto put_page;
>>>    		}
>>>    		goto got_it;
>>> @@ -1216,7 +1215,6 @@ static int ra_data_block(struct inode *inode, pgoff_t index)
>>>    	if (unlikely(!f2fs_is_valid_blkaddr(sbi, dn.data_blkaddr,
>>>    						DATA_GENERIC_ENHANCE))) {
>>>    		err = -EFSCORRUPTED;
>>> -		f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
>>>    		goto put_page;
>>>    	}
>>>    got_it:
>>> diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
>>> index aad1d1a..289c0bf 100644
>>> --- a/fs/f2fs/recovery.c
>>> +++ b/fs/f2fs/recovery.c
>>> @@ -693,14 +693,12 @@ static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
>>>    		if (__is_valid_data_blkaddr(src) &&
>>>    			!f2fs_is_valid_blkaddr(sbi, src, META_POR)) {
>>>    			err = -EFSCORRUPTED;
>>> -			f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
>>>    			goto err;
>>>    		}
>>>    		if (__is_valid_data_blkaddr(dest) &&
>>>    			!f2fs_is_valid_blkaddr(sbi, dest, META_POR)) {
>>>    			err = -EFSCORRUPTED;
>>> -			f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
>>>    			goto err;
>>>    		}
>>> @@ -755,8 +753,6 @@ static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
>>>    				f2fs_err(sbi, "Inconsistent dest blkaddr:%u, ino:%lu, ofs:%u",
>>>    					dest, inode->i_ino, dn.ofs_in_node);
>>>    				err = -EFSCORRUPTED;
>>> -				f2fs_handle_error(sbi,
>>> -						ERROR_INVALID_BLKADDR);
>>>    				goto err;
>>>    			}
>>> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
>>> index 7901ede..ad6511f 100644
>>> --- a/fs/f2fs/segment.c
>>> +++ b/fs/f2fs/segment.c
>>> @@ -334,8 +334,6 @@ static int __f2fs_commit_atomic_write(struct inode *inode)
>>>    					DATA_GENERIC_ENHANCE)) {
>>>    				f2fs_put_dnode(&dn);
>>>    				ret = -EFSCORRUPTED;
>>> -				f2fs_handle_error(sbi,
>>> -						ERROR_INVALID_BLKADDR);
>>>    				goto out;
>>>    			}


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
