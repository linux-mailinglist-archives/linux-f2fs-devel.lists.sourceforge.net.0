Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF4036BD91
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 27 Apr 2021 04:56:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lbDu5-0004WG-35; Tue, 27 Apr 2021 02:56:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1lbDu3-0004W2-PM
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 27 Apr 2021 02:56:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hebJCFNK6YYBYgmYY2WciXCN920u8Ffndf5D5IG65uI=; b=MQKH8RIQq+3YJCsUGSrV1SLNsw
 1pQH46IGauxNvLlw0qqThcIaxf1IKlso9NdbDkzCXf8Bkuw+2C7qiEq0ksQqXY0yG8MWofj21eYUb
 ohCFba0NHyn01Yl51lMepMNiMsVu7CJ5hb91w8spTKgci49haJ/II8W4hDj/kkQQKmCU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hebJCFNK6YYBYgmYY2WciXCN920u8Ffndf5D5IG65uI=; b=BXaKvurJJxHWvlO21t6LTYVv+4
 AZ/jcbj/OQb5oBRGpra4RNbOjbYi5TL9ZlhG+Gt4vTQi3Q40UZDeWo4MKaHEz9108NngidS1b54xO
 kFbXeHbcoRRymE0wJ+7cPZr7uLf2x9BAGnT7n0CD80k/FBLG77vZyWz45wkTyZLE80Bc=;
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lbDtw-00EzpT-OP
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 27 Apr 2021 02:56:48 +0000
Received: from dggemx753-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4FTmZ04RN7zYdr7;
 Tue, 27 Apr 2021 10:54:16 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by
 dggemx753-chm.china.huawei.com (10.0.44.37) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Tue, 27 Apr 2021 10:56:32 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20210425011053.44436-1-yuchao0@huawei.com>
 <YIbzwPGOJoKZvFnv@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <3338f2bc-6985-c1a4-9f3d-e59a474027f9@huawei.com>
Date: Tue, 27 Apr 2021 10:56:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <YIbzwPGOJoKZvFnv@google.com>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggemx753-chm.china.huawei.com (10.0.44.37)
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lbDtw-00EzpT-OP
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: reduce expensive checkpoint trigger
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/4/27 1:09, Jaegeuk Kim wrote:
> On 04/25, Chao Yu wrote:
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
>> Reported-by: Yunlei He <heyunlei@hihonor.com>
>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
>> ---
>> v2:
>> - fix to set ENC_DIR_INO only for encrypted directory
>>   fs/f2fs/f2fs.h              | 2 ++
>>   fs/f2fs/file.c              | 3 +++
>>   fs/f2fs/xattr.c             | 6 ++++--
>>   include/trace/events/f2fs.h | 3 ++-
>>   4 files changed, 11 insertions(+), 3 deletions(-)
>>
>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>> index b9d5317db0a7..0fe881309a20 100644
>> --- a/fs/f2fs/f2fs.h
>> +++ b/fs/f2fs/f2fs.h
>> @@ -246,6 +246,7 @@ enum {
>>   	APPEND_INO,		/* for append ino list */
>>   	UPDATE_INO,		/* for update ino list */
>>   	TRANS_DIR_INO,		/* for trasactions dir ino list */
>> +	ENC_DIR_INO,		/* for encrypted dir ino list */
>>   	FLUSH_INO,		/* for multiple device flushing */
>>   	MAX_INO_ENTRY,		/* max. list */
>>   };
>> @@ -1090,6 +1091,7 @@ enum cp_reason_type {
>>   	CP_FASTBOOT_MODE,
>>   	CP_SPEC_LOG_NUM,
>>   	CP_RECOVER_DIR,
>> +	CP_ENC_DIR,
>>   };
>>   
>>   enum iostat_type {
>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>> index a595050c56d3..62af29ec0879 100644
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
>> index c8f34decbf8e..70615d504f7e 100644
>> --- a/fs/f2fs/xattr.c
>> +++ b/fs/f2fs/xattr.c
>> @@ -630,6 +630,7 @@ static int __f2fs_setxattr(struct inode *inode, int index,
>>   			const char *name, const void *value, size_t size,
>>   			struct page *ipage, int flags)
>>   {
>> +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>>   	struct f2fs_xattr_entry *here, *last;
>>   	void *base_addr, *last_base_addr;
>>   	int found, newsize;
>> @@ -745,8 +746,9 @@ static int __f2fs_setxattr(struct inode *inode, int index,
>>   			!strcmp(name, F2FS_XATTR_NAME_ENCRYPTION_CONTEXT))
>>   		f2fs_set_encrypted_inode(inode);
>>   	f2fs_mark_inode_dirty_sync(inode, true);
>> -	if (!error && S_ISDIR(inode->i_mode))
>> -		set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_CP);
>> +	if (!error && S_ISDIR(inode->i_mode) && f2fs_encrypted_file(inode) &&
>> +			f2fs_is_checkpointed_node(sbi, inode->i_ino))
>> +		f2fs_add_ino_entry(sbi, inode->i_ino, ENC_DIR_INO);
> 
> What will happen, if we need to checkpoint xattr_nid on this directory?

need_do_checkpoint()

a)	else if (!f2fs_is_checkpointed_node(sbi, F2FS_I(inode)->i_pino))
		cp_reason = CP_NODE_NEED_CP;

b)	else if (f2fs_exist_written_data(sbi, F2FS_I(inode)->i_pino,
							ENC_DIR_INO))
		cp_reason = CP_ENC_DIR;

If parent is not checkpointed, after converting parent to encrypted directory
and create the file in parent, fsync this file will trigger checkpoint() due
to a)

If parent is checkpointed, after converting parent to encrypted directory
and create the file in parent, fsync this file will trigger checkpoint() due
to b)

Am I missing any cases?

Thanks,

> 
>>   
>>   same:
>>   	if (is_inode_flag_set(inode, FI_ACL_MODE)) {
>> diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
>> index 56b113e3cd6a..ca0cf12226e9 100644
>> --- a/include/trace/events/f2fs.h
>> +++ b/include/trace/events/f2fs.h
>> @@ -145,7 +145,8 @@ TRACE_DEFINE_ENUM(CP_RESIZE);
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
>> 2.29.2
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
