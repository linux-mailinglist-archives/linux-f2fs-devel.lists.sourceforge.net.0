Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C676E367ABC
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Apr 2021 09:14:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lZTY3-0003zM-HO; Thu, 22 Apr 2021 07:14:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1lZTY1-0003z4-Mf
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Apr 2021 07:14:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=333HG+VOrJibDnm0Ca/99I3kXDoF96x8TBdvPJgpKKs=; b=FGyQA4ZtgDVZl8MUgmHvV4L8dC
 UeB00psgplDmfP+mopRnNSwskThKomfAaoRpyLCylgOK8yJU7hQC+7olE1ZBGYmvEIh88xbHb9gdj
 +XLwLU4Co34aCJFgL66t+QRMZjr25/ocxHFbPqeJOVB+GOR64ZGHOEql/7ej/a1G8J9E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=333HG+VOrJibDnm0Ca/99I3kXDoF96x8TBdvPJgpKKs=; b=AYmN9p+7s4CUNdQ6hrmsBX+4JP
 JrTlk/enDSdUR4DIIpy3j/1svVETiG3snTkodiowPOjBqxzy9jQ+x0sWJ0O3qFcT0s1+Myo8q66xc
 fwXWQmSM7ioqro+NZJ8cj20bQjPYpzRsIuJEeds3vTEBSmqIhPQuIiPCYll9bb1UYrTc=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lZTXz-0003gf-FM
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Apr 2021 07:14:50 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FQpWC6PfszPsNC;
 Thu, 22 Apr 2021 15:11:35 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by smtp.huawei.com
 (10.3.19.202) with Microsoft SMTP Server (TLS) id 14.3.498.0; Thu, 22 Apr
 2021 15:14:36 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20210416095838.29568-1-yuchao0@huawei.com>
 <YID2TOCsgKdi0aLf@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <733ba2da-4047-045b-5223-05012b980603@huawei.com>
Date: Thu, 22 Apr 2021 15:14:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <YID2TOCsgKdi0aLf@google.com>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lZTXz-0003gf-FM
Subject: Re: [f2fs-dev] [RFC PATCH] f2fs: reduce expensive checkpoint
 trigger frequency
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

On 2021/4/22 12:06, Jaegeuk Kim wrote:
> On 04/16, Chao Yu wrote:
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
> 
> It'll happen once? How much impact will we hit due to this?

Yunlei reports me this issue, the problems here in Honer device's specified
environment, most fsync() on regular file triggers a checkpoint() when mkdir()
happened concurrently, result in causing the performance issue.

Yunlei could explain more about details of this issue. @Yunlei

> 
>>
>> In order to avoid such condition, let's record an entry including
>> directory's ino into global cache when we initialize encryption policy
>> in a checkpointed directory, and then only trigger checkpoint() when
>> target file's parent has non-persisted encryption policy, for the case
>> its parent is not checkpointed, need_do_checkpoint() has cover that
>> by verifying it with f2fs_is_checkpointed_node().
>>
>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
>> ---
>>   fs/f2fs/f2fs.h              | 2 ++
>>   fs/f2fs/file.c              | 3 +++
>>   fs/f2fs/xattr.c             | 6 ++++--
>>   include/trace/events/f2fs.h | 3 ++-
>>   4 files changed, 11 insertions(+), 3 deletions(-)
>>
>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>> index 87d734f5589d..34487e527d12 100644
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
>> index 6284b2f4a60b..a6c38d8b1ec3 100644
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
>> index c8f34decbf8e..38796d488d15 100644
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
>> +	if (!error && S_ISDIR(inode->i_mode) &&
>> +			f2fs_is_checkpointed_node(sbi, inode->i_ino))
>> +		f2fs_add_ino_entry(sbi, inode->i_ino, ENC_DIR_INO);
> 
> Is it right to say ENC_DIR_INO in this case?

Sorry, I didn't get it.

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
