Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C9063A4F8BA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  5 Mar 2025 09:25:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tpk3n-0000Mr-B4;
	Wed, 05 Mar 2025 08:25:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tpk3m-0000Mg-IW
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Mar 2025 08:24:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TwXBSxbjEruiJAYY4DcmQxYzKI7CNmVpR/POGNNNe1Y=; b=ZOyNdKDQ86AmIDekNbGk4AqRkP
 BjYA97rB7dy1QeSBuF2SYDuH/lu9aeTXoaYmolPe9qAYp05CTkK9LGmqp/NUNGmzzLIqgfIRMDFEl
 2LWyOW0CM9i2nrpMjTCJhkbaXLTtMzoQAX3e+3Q+SJfT/STFKVCke5FNibpvImYlA3BM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TwXBSxbjEruiJAYY4DcmQxYzKI7CNmVpR/POGNNNe1Y=; b=FoVOlRZbqa2r7rlOtmSAEcYg3E
 2A9t21fzYaiGABrMOSvpr+Fz4DjaFst6JKIkIbvKclMQZUl9ncPImK5dOR5uGi5C63Y2PwgXMsYq/
 DiErmmbwQOkAlhKkGA7CUJRvlOKr3lGa8tPT7lKm8+GjrecEbpwOOvKQpRrS0oyXaBsE=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tpk3m-0000ZO-Fa for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Mar 2025 08:24:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 07148A44FA5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  5 Mar 2025 08:19:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06913C4CEE2;
 Wed,  5 Mar 2025 08:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741163087;
 bh=PW3JaKtoCnCno27xMt0CxSjDwQZd35hm3I+KQGOj6nM=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=ZZVtwLqtAUqKGkPwf5T8kYsPFSfE22uLdgVP/rVjmmoFSjcQR7R2Te/vrDvfZ7noG
 D5wqGFMMslK/3p9DMbnf+zE9/X5PO9ocFGx4kEr7LpB2641QelQm4f4+t2z9UIeNO6
 uE9YsU0JzLenNyMCypJ4wEZwpqp0bi9SPBHiupMVpyPGK5jxX1c54Sw2KtpTDeyTzS
 GJN+yJ+gBF0ckJbdQhNP2d6FWw7PzMPjAW0fynH2LdjrhTQmqZqV6ucGXxwtsw3AQh
 9yyxar38tM3VjnO0WaKpqwDEjdsL7N5dAHYSnC+EjUC2+Rr5hJLE7qsbOp/FqsNNrp
 6EbFndHcPUOZA==
Message-ID: <1ed6cd1b-4165-4a87-a2eb-a8278c944922@kernel.org>
Date: Wed, 5 Mar 2025 16:24:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Eric Biggers <ebiggers@kernel.org>
References: <20250303034606.1355224-1-chao@kernel.org>
 <20250303230644.GA3695685@google.com>
Content-Language: en-US
In-Reply-To: <20250303230644.GA3695685@google.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/4/25 07:06, Eric Biggers wrote: > On Mon, Mar 03, 2025
 at 11:46:06AM +0800,
 Chao Yu via Linux-f2fs-devel wrote: >> This patch introduces
 a new flag F2FS_NOLINEAR_LOOKUP_FL, so that we can >> tag [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tpk3m-0000ZO-Fa
Subject: Re: [f2fs-dev] [PATCH] f2fs: support F2FS_NOLINEAR_LOOKUP_FL
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
Cc: linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 3/4/25 07:06, Eric Biggers wrote:
> On Mon, Mar 03, 2025 at 11:46:06AM +0800, Chao Yu via Linux-f2fs-devel wrote:
>> This patch introduces a new flag F2FS_NOLINEAR_LOOKUP_FL, so that we can
>> tag casefolded directory w/ it to disable linear lookup functionality,
>> it can be used for QA.
>>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>>  fs/f2fs/dir.c             |  3 ++-
>>  fs/f2fs/f2fs.h            |  2 ++
>>  fs/f2fs/file.c            | 36 +++++++++++++++++++++++-------------
>>  include/uapi/linux/f2fs.h |  5 +++++
>>  4 files changed, 32 insertions(+), 14 deletions(-)
>>
>> diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
>> index 54dd52de7269..4c74f29a2c73 100644
>> --- a/fs/f2fs/dir.c
>> +++ b/fs/f2fs/dir.c
>> @@ -366,7 +366,8 @@ struct f2fs_dir_entry *__f2fs_find_entry(struct inode *dir,
>>  
>>  out:
>>  #if IS_ENABLED(CONFIG_UNICODE)
>> -	if (IS_CASEFOLDED(dir) && !de && use_hash) {
>> +	if (IS_CASEFOLDED(dir) && !de && use_hash &&
>> +				!IS_NOLINEAR_LOOKUP(dir)) {
>>  		use_hash = false;
>>  		goto start_find_entry;
>>  	}
>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>> index 05879c6dc4d6..787f1e5a52d7 100644
>> --- a/fs/f2fs/f2fs.h
>> +++ b/fs/f2fs/f2fs.h
>> @@ -3047,6 +3047,7 @@ static inline void f2fs_change_bit(unsigned int nr, char *addr)
>>  #define F2FS_NOCOMP_FL			0x00000400 /* Don't compress */
>>  #define F2FS_INDEX_FL			0x00001000 /* hash-indexed directory */
>>  #define F2FS_DIRSYNC_FL			0x00010000 /* dirsync behaviour (directories only) */
>> +#define F2FS_NOLINEAR_LOOKUP_FL		0x08000000 /* do not use linear lookup */
>>  #define F2FS_PROJINHERIT_FL		0x20000000 /* Create with parents projid */
>>  #define F2FS_CASEFOLD_FL		0x40000000 /* Casefolded file */
>>  #define F2FS_DEVICE_ALIAS_FL		0x80000000 /* File for aliasing a device */
>> @@ -3066,6 +3067,7 @@ static inline void f2fs_change_bit(unsigned int nr, char *addr)
>>  #define F2FS_OTHER_FLMASK	(F2FS_NODUMP_FL | F2FS_NOATIME_FL)
>>  
>>  #define IS_DEVICE_ALIASING(inode)	(F2FS_I(inode)->i_flags & F2FS_DEVICE_ALIAS_FL)
>> +#define IS_NOLINEAR_LOOKUP(inode)	(F2FS_I(inode)->i_flags & F2FS_NOLINEAR_LOOKUP_FL)
>>  
>>  static inline __u32 f2fs_mask_flags(umode_t mode, __u32 flags)
>>  {
>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>> index 014cb7660a9a..1acddc4d11e4 100644
>> --- a/fs/f2fs/file.c
>> +++ b/fs/f2fs/file.c
>> @@ -2062,6 +2062,11 @@ static int f2fs_setflags_common(struct inode *inode, u32 iflags, u32 mask)
>>  		}
>>  	}
>>  
>> +	if ((iflags ^ masked_flags) & F2FS_NOLINEAR_LOOKUP_FLAG) {
>> +		if (!S_ISDIR(inode->i_mode) || !IS_CASEFOLDED(inode))
>> +			return -EINVAL;
>> +	}
>> +
>>  	fi->i_flags = iflags | (fi->i_flags & ~mask);
>>  	f2fs_bug_on(F2FS_I_SB(inode), (fi->i_flags & F2FS_COMPR_FL) &&
>>  					(fi->i_flags & F2FS_NOCOMP_FL));
>> @@ -2093,17 +2098,18 @@ static const struct {
>>  	u32 iflag;
>>  	u32 fsflag;
>>  } f2fs_fsflags_map[] = {
>> -	{ F2FS_COMPR_FL,	FS_COMPR_FL },
>> -	{ F2FS_SYNC_FL,		FS_SYNC_FL },
>> -	{ F2FS_IMMUTABLE_FL,	FS_IMMUTABLE_FL },
>> -	{ F2FS_APPEND_FL,	FS_APPEND_FL },
>> -	{ F2FS_NODUMP_FL,	FS_NODUMP_FL },
>> -	{ F2FS_NOATIME_FL,	FS_NOATIME_FL },
>> -	{ F2FS_NOCOMP_FL,	FS_NOCOMP_FL },
>> -	{ F2FS_INDEX_FL,	FS_INDEX_FL },
>> -	{ F2FS_DIRSYNC_FL,	FS_DIRSYNC_FL },
>> -	{ F2FS_PROJINHERIT_FL,	FS_PROJINHERIT_FL },
>> -	{ F2FS_CASEFOLD_FL,	FS_CASEFOLD_FL },
>> +	{ F2FS_COMPR_FL,		FS_COMPR_FL },
>> +	{ F2FS_SYNC_FL,			FS_SYNC_FL },
>> +	{ F2FS_IMMUTABLE_FL,		FS_IMMUTABLE_FL },
>> +	{ F2FS_APPEND_FL,		FS_APPEND_FL },
>> +	{ F2FS_NODUMP_FL,		FS_NODUMP_FL },
>> +	{ F2FS_NOATIME_FL,		FS_NOATIME_FL },
>> +	{ F2FS_NOCOMP_FL,		FS_NOCOMP_FL },
>> +	{ F2FS_INDEX_FL,		FS_INDEX_FL },
>> +	{ F2FS_DIRSYNC_FL,		FS_DIRSYNC_FL },
>> +	{ F2FS_PROJINHERIT_FL,		FS_PROJINHERIT_FL },
>> +	{ F2FS_CASEFOLD_FL,		FS_CASEFOLD_FL },
>> +	{ F2FS_NOLINEAR_LOOKUP_FL,	F2FS_NOLINEAR_LOOKUP_FL },
>>  };
>>  
>>  #define F2FS_GETTABLE_FS_FL (		\
>> @@ -2121,7 +2127,8 @@ static const struct {
>>  		FS_INLINE_DATA_FL |	\
>>  		FS_NOCOW_FL |		\
>>  		FS_VERITY_FL |		\
>> -		FS_CASEFOLD_FL)
>> +		FS_CASEFOLD_FL |	\
>> +		F2FS_NOLINEAR_LOOKUP_FL)
>>  
>>  #define F2FS_SETTABLE_FS_FL (		\
>>  		FS_COMPR_FL |		\
>> @@ -2133,7 +2140,8 @@ static const struct {
>>  		FS_NOCOMP_FL |		\
>>  		FS_DIRSYNC_FL |		\
>>  		FS_PROJINHERIT_FL |	\
>> -		FS_CASEFOLD_FL)
>> +		FS_CASEFOLD_FL |	\
>> +		F2FS_NOLINEAR_LOOKUP_FL)
>>  
>>  /* Convert f2fs on-disk i_flags to FS_IOC_{GET,SET}FLAGS flags */
>>  static inline u32 f2fs_iflags_to_fsflags(u32 iflags)
>> @@ -3344,6 +3352,8 @@ int f2fs_fileattr_get(struct dentry *dentry, struct fileattr *fa)
>>  		fsflags |= FS_INLINE_DATA_FL;
>>  	if (is_inode_flag_set(inode, FI_PIN_FILE))
>>  		fsflags |= FS_NOCOW_FL;
>> +	if (IS_NOLINEAR_LOOKUP(inode))
>> +		fsflags |= F2FS_NOLINEAR_LOOKUP_FL;
>>  
>>  	fileattr_fill_flags(fa, fsflags & F2FS_GETTABLE_FS_FL);
>>  
>> diff --git a/include/uapi/linux/f2fs.h b/include/uapi/linux/f2fs.h
>> index 795e26258355..a03626fdcf35 100644
>> --- a/include/uapi/linux/f2fs.h
>> +++ b/include/uapi/linux/f2fs.h
>> @@ -104,4 +104,9 @@ struct f2fs_comp_option {
>>  	__u8 log_cluster_size;
>>  };
>>  
>> +/* used for FS_IOC_GETFLAGS and FS_IOC_SETFLAGS */
>> +enum {
>> +	F2FS_NOLINEAR_LOOKUP_FLAG = 0x08000000,
>> +};
> 
> FS_IOC_GETFLAGS and FS_IOC_SETFLAGS are not filesystem-specific, and the
> supported flags are declared in include/uapi/linux/fs.h.  You can't just
> randomly give an unused bit a filesystem specific meaning.

Yeah, let me have a try to propose it into vfs.

Thanks,

> 
> - Eric



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
