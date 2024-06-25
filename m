Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 005F8915D7D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Jun 2024 05:53:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sLxEj-0003zw-RS;
	Tue, 25 Jun 2024 03:52:54 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sLxEi-0003zg-8Q
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Jun 2024 03:52:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eeVE7NB6fSGj/T0oQcC9GvJD6l9G7/AhQ8A/OK+YS0E=; b=Q98OViVKA0rLleKz0da0MDjGRn
 dVjruTp2WKRgt/Wrivg1YTbIzQDpwe8LA7rsARGcz0+W/EyMdcrEmKVfWZrFdOOLVUBokL37F52UC
 w3mdlwTxMup+OwqarWqyc1FCEPELwy1sSNLWWRRjONEhXAqtcxH9szocX0IEvfp1VhpA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eeVE7NB6fSGj/T0oQcC9GvJD6l9G7/AhQ8A/OK+YS0E=; b=EixFiybdZzBtkrT2Gm6S9O3pwR
 3MAcCtpSSrfi0bf271l/5Dg/BcaX5ErCyFvsWmEaeB7O4LPIb/h68hk9lYxw4P1qeqKDHVM2+4xly
 sQeslmHP7y4QAiVSsQYQs2M9cuHxe9Nvbf4iOreKywENAforBX3IKxbjD4lMrC6oqyO4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sLxEi-0005wp-FY for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Jun 2024 03:52:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5D682611CF;
 Tue, 25 Jun 2024 03:52:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EE98C32782;
 Tue, 25 Jun 2024 03:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719287566;
 bh=z5urP9LmonVj1+HWK1Z4RP53MeJ9CgTGlShcGRnU5d8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=HTCPW3iUCAhqdm1Ud/ZUaC0sYGyAzGoZ/dbtFmHNTEKnhSfnXszL9EBxj7kXR3nb2
 kAGhjFQa4noI4X3WTb9wDvYPFGNbkQZYdWjBkm5EgmUibnKhEQ3n9DDO8hiwKYYWXR
 flYza6dtOhcUJI48Bxwm5uDAZT5T1luoa9pRkTS4oBhhrpUz3G+JFW/GFIA79tVH5Q
 58Vjc682QbzYDYdN9kjEVTzlY4IjIlrU+ILSOps29IhLEXsbU0ttt9jYNUbpeQuY9+
 Py3CU6sBpP77FW0fynqe4klgVBYoy+ZLrepMYJbKseFK9r4+INtF5uGtkzSjKJl4JX
 MgS6dLdC9Qatw==
Message-ID: <874174e3-79ba-452d-afff-615fe0bc8d0d@kernel.org>
Date: Tue, 25 Jun 2024 11:52:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: wangzijie <wangzijie1@honor.com>
References: <20240111081743.2999210-1-chao@kernel.org>
 <20240625021433.798568-1-wangzijie1@honor.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240625021433.798568-1-wangzijie1@honor.com>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/6/25 10:14, wangzijie wrote: >> We may trigger high
 frequent checkpoint for below case: >> 1. mkdir /mnt/dir1; set dir1 encrypted
 >> 2. touch /mnt/file1; fsync /mnt/file1 >> 3. mkdir /mnt/dir2 [...] 
 Content analysis details:   (-0.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sLxEi-0005wp-FY
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: reduce expensive checkpoint trigger
 frequency
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
Cc: jaegeuk@kernel.org, zhiguo.niu@unisoc.com, linux-kernel@vger.kernel.org,
 bintian.wang@honor.com, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/6/25 10:14, wangzijie wrote:
>> We may trigger high frequent checkpoint for below case:
>> 1. mkdir /mnt/dir1; set dir1 encrypted
>> 2. touch /mnt/file1; fsync /mnt/file1
>> 3. mkdir /mnt/dir2; set dir2 encrypted
>> 4. touch /mnt/file2; fsync /mnt/file2
>> ...
>>
>> Although, newly created dir and file are not related, due to
>> commit bbf156f7afa7 ("f2fs: fix lost xattrs of directories"), we will
>> trigger checkpoint whenever fsync() comes after a new encrypted dir
>> created.
>>
>> In order to avoid such condition, let's record an entry including
>> directory's ino into global cache when we initialize encryption policy
>> in a checkpointed directory, and then only trigger checkpoint() when
>> target file's parent has non-persisted encryption policy, for the case
>> its parent is not checkpointed, need_do_checkpoint() has cover that
>> by verifying it with f2fs_is_checkpointed_node().
>>
>> Reported-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
>> Tested-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
>> Reported-by: Yunlei He <heyunlei@hihonor.com>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>> v3:
>> - Recently, Zhiguo Niu reported the same issue, so I repost this
>> patch for comments.
>>   fs/f2fs/f2fs.h              |  2 ++
>>   fs/f2fs/file.c              |  3 +++
>>   fs/f2fs/xattr.c             | 16 ++++++++++++++--
>>   include/trace/events/f2fs.h |  3 ++-
>>   4 files changed, 21 insertions(+), 3 deletions(-)
>>
>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>> index e2e0ca45f881..0094a8c85f4a 100644
>> --- a/fs/f2fs/f2fs.h
>> +++ b/fs/f2fs/f2fs.h
>> @@ -279,6 +279,7 @@ enum {
>>   	APPEND_INO,		/* for append ino list */
>>   	UPDATE_INO,		/* for update ino list */
>>   	TRANS_DIR_INO,		/* for transactions dir ino list */
>> +	ENC_DIR_INO,		/* for encrypted dir ino list */
>>   	FLUSH_INO,		/* for multiple device flushing */
>>   	MAX_INO_ENTRY,		/* max. list */
>>   };
>> @@ -1147,6 +1148,7 @@ enum cp_reason_type {
>>   	CP_FASTBOOT_MODE,
>>   	CP_SPEC_LOG_NUM,
>>   	CP_RECOVER_DIR,
>> +	CP_ENC_DIR,
>>   };
>>   
>>   enum iostat_type {
>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>> index 8198afb5fb9c..18b33b1f0c83 100644
>> --- a/fs/f2fs/file.c
>> +++ b/fs/f2fs/file.c
>> @@ -218,6 +218,9 @@ static inline enum cp_reason_type need_do_checkpoint(struct inode *inode)
>>   		f2fs_exist_written_data(sbi, F2FS_I(inode)->i_pino,
>>   							TRANS_DIR_INO))
>>   		cp_reason = CP_RECOVER_DIR;
>> +	else if (f2fs_exist_written_data(sbi, F2FS_I(inode)->i_pino,
>> +							ENC_DIR_INO))
>> +		cp_reason = CP_ENC_DIR;
>>   
>>   	return cp_reason;
>>   }
>> diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
>> index f290fe9327c4..cbd1b88297fe 100644
>> --- a/fs/f2fs/xattr.c
>> +++ b/fs/f2fs/xattr.c
>> @@ -629,6 +629,7 @@ static int __f2fs_setxattr(struct inode *inode, int index,
>>   			const char *name, const void *value, size_t size,
>>   			struct page *ipage, int flags)
>>   {
>> +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>>   	struct f2fs_xattr_entry *here, *last;
>>   	void *base_addr, *last_base_addr;
>>   	int found, newsize;
>> @@ -772,8 +773,19 @@ static int __f2fs_setxattr(struct inode *inode, int index,
>>   	if (index == F2FS_XATTR_INDEX_ENCRYPTION &&
>>   			!strcmp(name, F2FS_XATTR_NAME_ENCRYPTION_CONTEXT))
>>   		f2fs_set_encrypted_inode(inode);
>> -	if (S_ISDIR(inode->i_mode))
>> -		set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_CP);
>> +
>> +	if (S_ISDIR(inode->i_mode)) {
>> +		/*
>> +		 * In restrict mode, fsync() always tries triggering checkpoint
>> +		 * for all metadata consistency, in other mode, it only triggers
>> +		 * checkpoint when parent's encryption metadata updates.
>> +		 */
>> +		if (F2FS_OPTION(sbi).fsync_mode == FSYNC_MODE_STRICT)
>> +			set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_CP);
>> +		else if (IS_ENCRYPTED(inode) &&
>> +			f2fs_is_checkpointed_node(sbi, inode->i_ino))
>> +			f2fs_add_ino_entry(sbi, inode->i_ino, ENC_DIR_INO);
>> +	}
>>   
>>   same:
>>   	if (is_inode_flag_set(inode, FI_ACL_MODE)) {
>> diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
>> index 7ed0fc430dc6..48f2e399e184 100644
>> --- a/include/trace/events/f2fs.h
>> +++ b/include/trace/events/f2fs.h
>> @@ -139,7 +139,8 @@ TRACE_DEFINE_ENUM(EX_BLOCK_AGE);
>>   		{ CP_NODE_NEED_CP,	"node needs cp" },		\
>>   		{ CP_FASTBOOT_MODE,	"fastboot mode" },		\
>>   		{ CP_SPEC_LOG_NUM,	"log type is 2" },		\
>> -		{ CP_RECOVER_DIR,	"dir needs recovery" })
>> +		{ CP_RECOVER_DIR,	"dir needs recovery" },		\
>> +		{ CP_ENC_DIR,		"persist encryption policy" })
>>   
>>   #define show_shutdown_mode(type)					\
>>   	__print_symbolic(type,						\
>> -- 
>> 2.40.1
> 
> Hi, Chao
> I noticed the discussion about patch v2, Jaegeuk mentioned no encryption case:
> 1) parent is checkpointed
> 2) set_xattr(dir) w/ new xnid
> 3) create(file)
> 4) fsync(file)
> We will not trigger checkpoint() after this change.
> So, how about adding a rule in need_do_checkpoint? We can judge if the parent has xnid
> being checkpointed or not, if not we can still trigger checkpoint() and keep the same
> behavior before this change.

Hi wangzijie,

It may cause performance overhead to get parent's xnid by parent ino,
so I prefer to tag ENC_DIR_INO for the inode if its parent's xnid is
not checkpointed, it that fine to you?

Thanks,

> 
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
