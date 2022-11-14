Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A92628499
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 14 Nov 2022 17:05:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oubxS-0002As-I7;
	Mon, 14 Nov 2022 16:05:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1oubxM-0002AO-Oj
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Nov 2022 16:05:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oX+cpIubPxFfj0KfUbcbCRKxCxSCchdtVJIaE9rF2KY=; b=Vibzy5Rou6WXXRank+U8X3sK/h
 wB0NNgZ5AKNhGfs0ShC6leFinHRNloh4w5wkJNJKl43yUhcJpQKOFijFGrXXS0kTAiM12Ky2aveo9
 JbbHkChKqoKi9jgnDeoH6ec1RGeARAptJqsgvIheZuJ5ldRI0dAnE/DWHQEl3L2fRV0U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oX+cpIubPxFfj0KfUbcbCRKxCxSCchdtVJIaE9rF2KY=; b=iLbQlpWKXOTnQBuKq8FJoOwhVJ
 KN1uipWKrgw369J12nSD1C36bFxMsNfj2ESvgZI9j1ycYjbEO6ZkUP53zQD5ba36w79HQbZ8MNUjB
 MaJT/SvShLul7DlGbXDN90PWSW9RHBJWSsnVoQO0SIzoCaXrhP4iSUW5s6cz6n8/1twU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oubxM-00088V-1f for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Nov 2022 16:05:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A4AC7611C9;
 Mon, 14 Nov 2022 16:05:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51A9DC433D6;
 Mon, 14 Nov 2022 16:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668441902;
 bh=WrMAiJWAGjL/5kxc67SHz6ZQmpO1PjsLIpr9WTxGv88=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=qeTsKhN70k17i1CzzIWPTVnTfEhhwZWla/47uJoZCXzwrPj82Qmcl48kGlN8xRgdy
 bBzac62KJil7qgkrWD3KfleMj4Ltawu9hw+oHfR+4fuYY1uofG/pY4ZMn36MOYlwQd
 BDtVh1DNJc9OUiX1DP/VkWNDUHv65RW6HyEbg71GzmF7m5taS/k0zlo67fGCrLtWbA
 FQFJngvaP99NXgqybyJuKCdxn7hiHqnYoBloDnoW+il9n/+lheIde4U8cxcA81UtHW
 444pZzcs3CauxpPAy94w0HVoANCMjTTYj2GMbxB9FMtzWWBp8VWNObTAeYIXhArBbu
 w39uNQdkWqb5A==
Message-ID: <ce324279-bd2e-1595-0cdd-f1fdaf549549@kernel.org>
Date: Tue, 15 Nov 2022 00:05:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, Sheng Yong <shengyong@oppo.com>
References: <20221111100830.953733-1-shengyong@oppo.com>
 <Y272nVjzr6CynmyQ@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <Y272nVjzr6CynmyQ@google.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/11/12 9:27,
 Jaegeuk Kim wrote: > Does thes make sense?
 Jaegeuk, Could you please send modified patches to mailing list, otherwise,
 I can not add comments on specified line. 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oubxM-00088V-1f
Subject: Re: [f2fs-dev] [PATCH v2 1/2] f2fs: fix to enable compress for
 newly created file if extension matches
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

On 2022/11/12 9:27, Jaegeuk Kim wrote:
> Does thes make sense?

Jaegeuk,

Could you please send modified patches to mailing list, otherwise,
I can not add comments on specified line.

Thanks,

> 
> https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=dev-test&id=608460dfae20b9d23aa222f7448710a086778222
> https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=dev-test&id=962379487b5cb9f3b85ea367b130c2c6ca584edf
> 
> Second one is needed to address build error.
> 
> On 11/11, Sheng Yong wrote:
>> If compress_extension is set, and a newly created file matches the
>> extension, the file could be marked as compression file. However,
>> if inline_data is also enabled, there is no chance to check its
>> extension since f2fs_should_compress() always returns false.
>>
>> This patch moves set_compress_inode(), which do extension check, in
>> f2fs_should_compress() to check extensions before setting inline
>> data flag.
>>
>> Fixes: 7165841d578e ("f2fs: fix to check inline_data during compressed inode conversion")
>> Signed-off-by: Sheng Yong <shengyong@oppo.com>
>> ---
>>   fs/f2fs/namei.c | 27 +++++++++++++--------------
>>   1 file changed, 13 insertions(+), 14 deletions(-)
>>
>> ---
>> v1->v2: add filename parameter for f2fs_new_inode, and move
>>          set_compress_inode into f2fs_new_inode
>>
>> diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
>> index e104409c3a0e5..36e251f438568 100644
>> --- a/fs/f2fs/namei.c
>> +++ b/fs/f2fs/namei.c
>> @@ -22,8 +22,12 @@
>>   #include "acl.h"
>>   #include <trace/events/f2fs.h>
>>   
>> +static void set_compress_inode(struct f2fs_sb_info *sbi, struct inode *inode,
>> +						const unsigned char *name);
>> +
>>   static struct inode *f2fs_new_inode(struct user_namespace *mnt_userns,
>> -						struct inode *dir, umode_t mode)
>> +						struct inode *dir, umode_t mode,
>> +						const char *name)
>>   {
>>   	struct f2fs_sb_info *sbi = F2FS_I_SB(dir);
>>   	nid_t ino;
>> @@ -119,6 +123,8 @@ static struct inode *f2fs_new_inode(struct user_namespace *mnt_userns,
>>   		if ((F2FS_I(dir)->i_flags & F2FS_COMPR_FL) &&
>>   					f2fs_may_compress(inode))
>>   			set_compress_context(inode);
>> +		if (name)
>> +			set_compress_inode(sbi, inode, name);
>>   	}
>>   
>>   	/* Should enable inline_data after compression set */
>> @@ -293,8 +299,7 @@ static void set_compress_inode(struct f2fs_sb_info *sbi, struct inode *inode,
>>   	unsigned char noext_cnt = F2FS_OPTION(sbi).nocompress_ext_cnt;
>>   	int i, cold_count, hot_count;
>>   
>> -	if (!f2fs_sb_has_compression(sbi) ||
>> -			F2FS_I(inode)->i_flags & F2FS_NOCOMP_FL ||
>> +	if (F2FS_I(inode)->i_flags & F2FS_NOCOMP_FL ||
>>   			!f2fs_may_compress(inode) ||
>>   			(!ext_cnt && !noext_cnt))
>>   		return;
>> @@ -326,10 +331,6 @@ static void set_compress_inode(struct f2fs_sb_info *sbi, struct inode *inode,
>>   	for (i = 0; i < ext_cnt; i++) {
>>   		if (!is_extension_exist(name, ext[i], false))
>>   			continue;
>> -
>> -		/* Do not use inline_data with compression */
>> -		stat_dec_inline_inode(inode);
>> -		clear_inode_flag(inode, FI_INLINE_DATA);
>>   		set_compress_context(inode);
>>   		return;
>>   	}
>> @@ -352,15 +353,13 @@ static int f2fs_create(struct user_namespace *mnt_userns, struct inode *dir,
>>   	if (err)
>>   		return err;
>>   
>> -	inode = f2fs_new_inode(mnt_userns, dir, mode);
>> +	inode = f2fs_new_inode(mnt_userns, dir, mode, dentry->d_name.name);
>>   	if (IS_ERR(inode))
>>   		return PTR_ERR(inode);
>>   
>>   	if (!test_opt(sbi, DISABLE_EXT_IDENTIFY))
>>   		set_file_temperature(sbi, inode, dentry->d_name.name);
>>   
>> -	set_compress_inode(sbi, inode, dentry->d_name.name);
>> -
>>   	inode->i_op = &f2fs_file_inode_operations;
>>   	inode->i_fop = &f2fs_file_operations;
>>   	inode->i_mapping->a_ops = &f2fs_dblock_aops;
>> @@ -689,7 +688,7 @@ static int f2fs_symlink(struct user_namespace *mnt_userns, struct inode *dir,
>>   	if (err)
>>   		return err;
>>   
>> -	inode = f2fs_new_inode(mnt_userns, dir, S_IFLNK | S_IRWXUGO);
>> +	inode = f2fs_new_inode(mnt_userns, dir, S_IFLNK | S_IRWXUGO, NULL);
>>   	if (IS_ERR(inode))
>>   		return PTR_ERR(inode);
>>   
>> @@ -760,7 +759,7 @@ static int f2fs_mkdir(struct user_namespace *mnt_userns, struct inode *dir,
>>   	if (err)
>>   		return err;
>>   
>> -	inode = f2fs_new_inode(mnt_userns, dir, S_IFDIR | mode);
>> +	inode = f2fs_new_inode(mnt_userns, dir, S_IFDIR | mode, NULL);
>>   	if (IS_ERR(inode))
>>   		return PTR_ERR(inode);
>>   
>> @@ -817,7 +816,7 @@ static int f2fs_mknod(struct user_namespace *mnt_userns, struct inode *dir,
>>   	if (err)
>>   		return err;
>>   
>> -	inode = f2fs_new_inode(mnt_userns, dir, mode);
>> +	inode = f2fs_new_inode(mnt_userns, dir, mode, NULL);
>>   	if (IS_ERR(inode))
>>   		return PTR_ERR(inode);
>>   
>> @@ -856,7 +855,7 @@ static int __f2fs_tmpfile(struct user_namespace *mnt_userns, struct inode *dir,
>>   	if (err)
>>   		return err;
>>   
>> -	inode = f2fs_new_inode(mnt_userns, dir, mode);
>> +	inode = f2fs_new_inode(mnt_userns, dir, mode, NULL);
>>   	if (IS_ERR(inode))
>>   		return PTR_ERR(inode);
>>   
>> -- 
>> 2.25.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
