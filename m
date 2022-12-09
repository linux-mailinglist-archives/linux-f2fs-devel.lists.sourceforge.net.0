Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C51AF647B7A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  9 Dec 2022 02:32:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p3SF9-0003WD-Rd;
	Fri, 09 Dec 2022 01:32:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1p3SF8-0003W6-GC
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 09 Dec 2022 01:32:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rHMEkQ4AqH/aLDlUMi/6MnIGegonjlvL9ObeK3jMRDQ=; b=S7HFnArynwDD3YXl2ejAISJqVv
 sB8DiAF0XDARDP0sdK2d39TZklBSWtCBP7TzxWJtpDOflfEA96f+cYg4WfEWhpg+7S7PaO65LgdvK
 fmtIwOo6P/mQ79gRFzOcoW/yfoGjk5wgyVBr1WHBOdpY7FWF/xOTon0BJUg1X/j9XV6g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rHMEkQ4AqH/aLDlUMi/6MnIGegonjlvL9ObeK3jMRDQ=; b=a7AkNxvaHnj4b+3i+EZh2o+Xvg
 YpuXguCRy/wHa3Z/J0wrvdehLtZNwUWc6wGOqWiA/55F/4I68Jw2pcNHO52gKbcLLK2bdBi31xUgP
 aqdXgJ3WVGFTuxqKOrtzR37jjQCtsKpNYSXM/xg1QYxD5eqdKdmbM/KFj6nVnc9j38wE=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p3SF7-00Am5Q-6s for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 09 Dec 2022 01:32:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C829AB826C2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  9 Dec 2022 01:31:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD2F4C433EF;
 Fri,  9 Dec 2022 01:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670549513;
 bh=Zv5ZlzJR4cEeJo3qJGsXmVHZ/bYUfRUeATJ9ndKXUCQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=t5wWa85e6LMISrWm0MAcBp6kAZeQrw3S7NbvPvMvDybs6aenhLCDl2H1DCFXKohRW
 DAGQlFi3F2/xYwIYPNulXejJOu1j1RSdFOeck9IC5mmOY7fxxuSzLo2QleU/EpO8b5
 hNmaSj6ZxpvDxfdLnuu/MDapNYgeVzd7YhlHlxGWF1n/W/B05tSB3lbsZKwSwz5jZC
 xlDvPV4QW0xzYiSijma+s4erkqUMW4a6JA5QdcWDan2J/K50k87hB2LpPFmtmMpe0M
 ggA4nalAbdqHOV19fOezCI+q2Aa+kSE40VxXOpRcUUfexuOkpHTJsErpLwXgNWx/Kh
 icVs/aR7EAU4A==
Message-ID: <0c36cfba-f8b8-b899-95db-09ce5b0a8e8a@kernel.org>
Date: Fri, 9 Dec 2022 09:31:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20221205185433.3479699-1-jaegeuk@kernel.org>
 <8ffb43dd-3887-aa56-6f0a-1fb6ff0e191e@kernel.org>
 <Y5IfEkHlpZ0oBRID@google.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <Y5IfEkHlpZ0oBRID@google.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/12/9 1:29, Jaegeuk Kim wrote: > On 12/08, Chao Yu
 wrote: >> On 2022/12/6 2:54, Jaegeuk Kim wrote: >>> Let's descrbie it's read
 extent cache. >>> >>> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel. [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p3SF7-00Am5Q-6s
Subject: Re: [f2fs-dev] [PATCH 1/6] f2fs: specify extent cache for read
 explicitly
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

On 2022/12/9 1:29, Jaegeuk Kim wrote:
> On 12/08, Chao Yu wrote:
>> On 2022/12/6 2:54, Jaegeuk Kim wrote:
>>> Let's descrbie it's read extent cache.
>>>
>>> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
>>> ---
>>>    fs/f2fs/extent_cache.c |  4 ++--
>>>    fs/f2fs/f2fs.h         | 10 +++++-----
>>>    fs/f2fs/inode.c        |  2 +-
>>>    fs/f2fs/node.c         |  2 +-
>>>    fs/f2fs/node.h         |  2 +-
>>>    fs/f2fs/segment.c      |  4 ++--
>>>    fs/f2fs/super.c        | 16 ++++++++--------
>>>    7 files changed, 20 insertions(+), 20 deletions(-)
>>>
>>> diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
>>> index 932c070173b9..8cd87aee0292 100644
>>> --- a/fs/f2fs/extent_cache.c
>>> +++ b/fs/f2fs/extent_cache.c
>>> @@ -383,7 +383,7 @@ static void __f2fs_init_extent_tree(struct inode *inode, struct page *ipage)
>>>    	if (!i_ext || !i_ext->len)
>>>    		return;
>>> -	get_extent_info(&ei, i_ext);
>>> +	get_read_extent_info(&ei, i_ext);
>>>    	write_lock(&et->lock);
>>>    	if (atomic_read(&et->node_cnt))
>>> @@ -710,7 +710,7 @@ unsigned int f2fs_shrink_extent_tree(struct f2fs_sb_info *sbi, int nr_shrink)
>>>    	unsigned int node_cnt = 0, tree_cnt = 0;
>>>    	int remained;
>>> -	if (!test_opt(sbi, EXTENT_CACHE))
>>> +	if (!test_opt(sbi, READ_EXTENT_CACHE))
>>>    		return 0;
>>>    	if (!atomic_read(&sbi->total_zombie_tree))
>>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>>> index eb8c27c4e5fc..1c39f8145b61 100644
>>> --- a/fs/f2fs/f2fs.h
>>> +++ b/fs/f2fs/f2fs.h
>>> @@ -92,7 +92,7 @@ extern const char *f2fs_fault_name[FAULT_MAX];
>>>    #define F2FS_MOUNT_FLUSH_MERGE		0x00000400
>>>    #define F2FS_MOUNT_NOBARRIER		0x00000800
>>>    #define F2FS_MOUNT_FASTBOOT		0x00001000
>>> -#define F2FS_MOUNT_EXTENT_CACHE		0x00002000
>>> +#define F2FS_MOUNT_READ_EXTENT_CACHE	0x00002000
>>>    #define F2FS_MOUNT_DATA_FLUSH		0x00008000
>>>    #define F2FS_MOUNT_FAULT_INJECTION	0x00010000
>>>    #define F2FS_MOUNT_USRQUOTA		0x00080000
>>> @@ -600,7 +600,7 @@ enum {
>>>    #define F2FS_MIN_EXTENT_LEN	64	/* minimum extent length */
>>>    /* number of extent info in extent cache we try to shrink */
>>> -#define EXTENT_CACHE_SHRINK_NUMBER	128
>>> +#define READ_EXTENT_CACHE_SHRINK_NUMBER	128
>>>    #define RECOVERY_MAX_RA_BLOCKS		BIO_MAX_VECS
>>>    #define RECOVERY_MIN_RA_BLOCKS		1
>>> @@ -830,7 +830,7 @@ struct f2fs_inode_info {
>>>    	loff_t original_i_size;		/* original i_size before atomic write */
>>>    };
>>> -static inline void get_extent_info(struct extent_info *ext,
>>> +static inline void get_read_extent_info(struct extent_info *ext,
>>>    					struct f2fs_extent *i_ext)
>>>    {
>>>    	ext->fofs = le32_to_cpu(i_ext->fofs);
>>> @@ -838,7 +838,7 @@ static inline void get_extent_info(struct extent_info *ext,
>>>    	ext->len = le32_to_cpu(i_ext->len);
>>>    }
>>> -static inline void set_raw_extent(struct extent_info *ext,
>>> +static inline void set_raw_read_extent(struct extent_info *ext,
>>>    					struct f2fs_extent *i_ext)
>>>    {
>>>    	i_ext->fofs = cpu_to_le32(ext->fofs);
>>> @@ -4407,7 +4407,7 @@ static inline bool f2fs_may_extent_tree(struct inode *inode)
>>>    {
>>>    	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>>> -	if (!test_opt(sbi, EXTENT_CACHE) ||
>>> +	if (!test_opt(sbi, READ_EXTENT_CACHE) ||
>>>    			is_inode_flag_set(inode, FI_NO_EXTENT) ||
>>>    			(is_inode_flag_set(inode, FI_COMPRESSED_FILE) &&
>>>    			 !f2fs_sb_has_readonly(sbi)))
>>> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
>>> index 577f109b4e1d..2c705c60019b 100644
>>> --- a/fs/f2fs/inode.c
>>> +++ b/fs/f2fs/inode.c
>>> @@ -629,7 +629,7 @@ void f2fs_update_inode(struct inode *inode, struct page *node_page)
>>>    	if (et) {
>>>    		read_lock(&et->lock);
>>> -		set_raw_extent(&et->largest, &ri->i_ext);
>>> +		set_raw_read_extent(&et->largest, &ri->i_ext);
>>>    		read_unlock(&et->lock);
>>>    	} else {
>>>    		memset(&ri->i_ext, 0, sizeof(ri->i_ext));
>>> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
>>> index b9ee5a1176a0..84b147966080 100644
>>> --- a/fs/f2fs/node.c
>>> +++ b/fs/f2fs/node.c
>>> @@ -85,7 +85,7 @@ bool f2fs_available_free_memory(struct f2fs_sb_info *sbi, int type)
>>>    						sizeof(struct ino_entry);
>>>    		mem_size >>= PAGE_SHIFT;
>>>    		res = mem_size < ((avail_ram * nm_i->ram_thresh / 100) >> 1);
>>> -	} else if (type == EXTENT_CACHE) {
>>> +	} else if (type == READ_EXTENT_CACHE) {
>>>    		mem_size = (atomic_read(&sbi->total_ext_tree) *
>>>    				sizeof(struct extent_tree) +
>>>    				atomic_read(&sbi->total_ext_node) *
>>> diff --git a/fs/f2fs/node.h b/fs/f2fs/node.h
>>> index 3c09cae058b0..0aa48704c77a 100644
>>> --- a/fs/f2fs/node.h
>>> +++ b/fs/f2fs/node.h
>>> @@ -146,7 +146,7 @@ enum mem_type {
>>>    	NAT_ENTRIES,	/* indicates the cached nat entry */
>>>    	DIRTY_DENTS,	/* indicates dirty dentry pages */
>>>    	INO_ENTRIES,	/* indicates inode entries */
>>> -	EXTENT_CACHE,	/* indicates extent cache */
>>> +	READ_EXTENT_CACHE,	/* indicates read extent cache */
>>>    	DISCARD_CACHE,	/* indicates memory of cached discard cmds */
>>>    	COMPRESS_PAGE,	/* indicates memory of cached compressed pages */
>>>    	BASE_CHECK,	/* check kernel status */
>>> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
>>> index 9486ca49ecb1..51de358bc452 100644
>>> --- a/fs/f2fs/segment.c
>>> +++ b/fs/f2fs/segment.c
>>> @@ -449,8 +449,8 @@ void f2fs_balance_fs_bg(struct f2fs_sb_info *sbi, bool from_bg)
>>>    		return;
>>>    	/* try to shrink extent cache when there is no enough memory */
>>> -	if (!f2fs_available_free_memory(sbi, EXTENT_CACHE))
>>> -		f2fs_shrink_extent_tree(sbi, EXTENT_CACHE_SHRINK_NUMBER);
>>> +	if (!f2fs_available_free_memory(sbi, READ_EXTENT_CACHE))
>>> +		f2fs_shrink_extent_tree(sbi, READ_EXTENT_CACHE_SHRINK_NUMBER);
>>>    	/* check the # of cached NAT entries */
>>>    	if (!f2fs_available_free_memory(sbi, NAT_ENTRIES))
>>> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
>>> index 79bf1faf4161..10bd03bbefec 100644
>>> --- a/fs/f2fs/super.c
>>> +++ b/fs/f2fs/super.c
>>> @@ -814,10 +814,10 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
>>>    			set_opt(sbi, FASTBOOT);
>>>    			break;
>>>    		case Opt_extent_cache:
>>> -			set_opt(sbi, EXTENT_CACHE);
>>> +			set_opt(sbi, READ_EXTENT_CACHE);
>>>    			break;
>>>    		case Opt_noextent_cache:
>>> -			clear_opt(sbi, EXTENT_CACHE);
>>> +			clear_opt(sbi, READ_EXTENT_CACHE);
>>>    			break;
>>>    		case Opt_noinline_data:
>>>    			clear_opt(sbi, INLINE_DATA);
>>> @@ -1954,10 +1954,10 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
>>>    		seq_puts(seq, ",barrier");
>>>    	if (test_opt(sbi, FASTBOOT))
>>>    		seq_puts(seq, ",fastboot");
>>> -	if (test_opt(sbi, EXTENT_CACHE))
>>> -		seq_puts(seq, ",extent_cache");
>>> +	if (test_opt(sbi, READ_EXTENT_CACHE))
>>> +		seq_puts(seq, ",read_extent_cache");
>>
>> How about keeping consistent w/ description of f2fs.rst?
> 
> This doesn't change the mount options, but do show the exact name which
> would be better to say what's going on.

mount -t f2fs /dev/vda /mnt/f2fs
mount|grep f2fs
/dev/vda on /mnt/f2fs type f2fs (rw,relatime,lazytime,background_gc=on,discard,no_heap,user_xattr,inline_xattr,acl,inline_data,inline_dentry,flush_merge,barrier,read_extent_cache,mode=adaptive,active_logs=6,alloc_mode=reuse,check)

mount -t f2fs -o remount /mnt/f2fs/
[   63.142480] F2FS-fs (vda): Unrecognized mount option "read_extent_cache" or missing value

Quoted from manual of mount

"mount -o remount,rw  /dir

After this call, mount reads fstab and merges these options with the options
from the command line (-o).  If no mountpoint is found in fstab, then a
remount with unspecified source is allowed."

I guess above command tries to use previous mountoptions which were read
via .show_options().

Thanks,

> 
>>
>>>    	else
>>> -		seq_puts(seq, ",noextent_cache");
>>> +		seq_puts(seq, ",no_read_extent_cache");
>>
>> Ditto,
>>
>> Thanks,
>>
>>>    	if (test_opt(sbi, DATA_FLUSH))
>>>    		seq_puts(seq, ",data_flush");
>>> @@ -2076,7 +2076,7 @@ static void default_options(struct f2fs_sb_info *sbi)
>>>    	set_opt(sbi, INLINE_XATTR);
>>>    	set_opt(sbi, INLINE_DATA);
>>>    	set_opt(sbi, INLINE_DENTRY);
>>> -	set_opt(sbi, EXTENT_CACHE);
>>> +	set_opt(sbi, READ_EXTENT_CACHE);
>>>    	set_opt(sbi, NOHEAP);
>>>    	clear_opt(sbi, DISABLE_CHECKPOINT);
>>>    	set_opt(sbi, MERGE_CHECKPOINT);
>>> @@ -2218,7 +2218,7 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
>>>    	bool need_restart_ckpt = false, need_stop_ckpt = false;
>>>    	bool need_restart_flush = false, need_stop_flush = false;
>>>    	bool need_restart_discard = false, need_stop_discard = false;
>>> -	bool no_extent_cache = !test_opt(sbi, EXTENT_CACHE);
>>> +	bool no_read_extent_cache = !test_opt(sbi, READ_EXTENT_CACHE);
>>>    	bool enable_checkpoint = !test_opt(sbi, DISABLE_CHECKPOINT);
>>>    	bool no_io_align = !F2FS_IO_ALIGNED(sbi);
>>>    	bool no_atgc = !test_opt(sbi, ATGC);
>>> @@ -2308,7 +2308,7 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
>>>    	}
>>>    	/* disallow enable/disable extent_cache dynamically */
>>> -	if (no_extent_cache == !!test_opt(sbi, EXTENT_CACHE)) {
>>> +	if (no_read_extent_cache == !!test_opt(sbi, READ_EXTENT_CACHE)) {
>>>    		err = -EINVAL;
>>>    		f2fs_warn(sbi, "switch extent_cache option is not allowed");
>>>    		goto restore_opts;


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
