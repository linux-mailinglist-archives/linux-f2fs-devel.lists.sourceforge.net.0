Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DF48018E104
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 21 Mar 2020 13:14:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jFd1C-0008Ul-Fg; Sat, 21 Mar 2020 12:14:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1jFd1B-0008Ud-1G
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 21 Mar 2020 12:14:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:Cc:References:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Te374bzDMKxMQY9zdjolzFe6a/NJvgGzhio/QQJBApc=; b=jUHtAfoYQtPLgMaP2lT80LMjP8
 bU7WJbZrwKg96xq/3U5Czu8egj2mfF5lOJs4TmZQYB0jBdi6XxWN06QRgERRpGRCCwKRwd/XeVHvf
 K/w274OjmYRJlNZ79cgAaPICXZFAzDnYIr5Z5J1072JAiL5ozCWpeAE6KJChhMpw+48E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:Cc:References:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Te374bzDMKxMQY9zdjolzFe6a/NJvgGzhio/QQJBApc=; b=Rm65x9YqCXhTfUqtJSIGoJilKh
 1oxIA3ITcdpMfX80oVgmfvITAjeGxK8x5hCgQbYcMP2QG26J1hk+/R0aTiby8PAmJpF+c5oRLF2Bt
 Ag6Q/MFDROUgAThthwemiFw0y0qzZuvGkHmcg0jvdelk1LtlpzoGOQLwE1Pcpf6Lr4Ok=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jFd14-002OfA-4l
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 21 Mar 2020 12:14:20 +0000
Received: from [192.168.0.107] (unknown [49.65.245.234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 46CBB20724;
 Sat, 21 Mar 2020 12:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584792848;
 bh=nMDvRIWaBQEE07eBr/b8Z+twcpwniFZsKHyMXPtB6pw=;
 h=Subject:To:References:Cc:From:Date:In-Reply-To:From;
 b=z8/oylr37/M67dJb6GRGSiB2TCdaqNVQovV9/U//Syw1i0IXQiSdKt9DKu4hgOce0
 EEOX/9zGcd6Heu38yyesU0w4A1KnPVDYNIXLIG9yO3rku2PiOXtHGVXaBN4VB8785i
 D49lAK1zHEIxYgMupX1OpoKfZhq2izG/ZhKRXu00=
To: Eric Biggers <ebiggers@kernel.org>, Chao Yu <yuchao0@huawei.com>
References: <20200320101831.70611-1-yuchao0@huawei.com>
 <20200320190759.GK851@sol.localdomain>
From: Chao Yu <chao@kernel.org>
Message-ID: <14a40f93-d414-d475-56df-f07348db635b@kernel.org>
Date: Sat, 21 Mar 2020 20:13:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20200320190759.GK851@sol.localdomain>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1jFd14-002OfA-4l
Subject: Re: [f2fs-dev] [PATCH] f2fs: clean up f2fs_may_encrypt()
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020-3-21 3:07, Eric Biggers wrote:
> On Fri, Mar 20, 2020 at 06:18:31PM +0800, Chao Yu wrote:
>> Merge below two conditions into f2fs_may_encrypt() for cleanup
>> - IS_ENCRYPTED()
>> - DUMMY_ENCRYPTION_ENABLED()
>>
>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
>> ---
>>  fs/f2fs/dir.c   |  4 +---
>>  fs/f2fs/f2fs.h  | 13 +++++++++----
>>  fs/f2fs/namei.c |  4 +---
>>  3 files changed, 11 insertions(+), 10 deletions(-)
>>
>> diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
>> index 0971ccc4664a..2accfc5e38d0 100644
>> --- a/fs/f2fs/dir.c
>> +++ b/fs/f2fs/dir.c
>> @@ -471,7 +471,6 @@ struct page *f2fs_init_inode_metadata(struct inode *inode, struct inode *dir,
>>  			struct page *dpage)
>>  {
>>  	struct page *page;
>> -	int dummy_encrypt = DUMMY_ENCRYPTION_ENABLED(F2FS_I_SB(dir));
>>  	int err;
>>
>>  	if (is_inode_flag_set(inode, FI_NEW_INODE)) {
>> @@ -498,8 +497,7 @@ struct page *f2fs_init_inode_metadata(struct inode *inode, struct inode *dir,
>>  		if (err)
>>  			goto put_error;
>>
>> -		if ((IS_ENCRYPTED(dir) || dummy_encrypt) &&
>> -					f2fs_may_encrypt(inode)) {
>> +		if (f2fs_may_encrypt(dir, inode)) {
>>  			err = fscrypt_inherit_context(dir, inode, page, false);
>>  			if (err)
>>  				goto put_error;
>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>> index 09db79a20f8e..fcafa68212eb 100644
>> --- a/fs/f2fs/f2fs.h
>> +++ b/fs/f2fs/f2fs.h
>> @@ -3946,15 +3946,20 @@ static inline bool f2fs_lfs_mode(struct f2fs_sb_info *sbi)
>>  	return F2FS_OPTION(sbi).fs_mode == FS_MODE_LFS;
>>  }
>>
>> -static inline bool f2fs_may_encrypt(struct inode *inode)
>> +static inline bool f2fs_may_encrypt(struct inode *dir, struct inode *inode)
>>  {
>>  #ifdef CONFIG_FS_ENCRYPTION
>> +	struct f2fs_sb_info *sbi = F2FS_I_SB(dir);
>>  	umode_t mode = inode->i_mode;
>>
>> -	return (S_ISREG(mode) || S_ISDIR(mode) || S_ISLNK(mode));
>> -#else
>> -	return false;
>> +	/*
>> +	 * If the directory encrypted or dummy encryption enabled,
>> +	 * then we should encrypt the inode.
>> +	 */
>> +	if (IS_ENCRYPTED(dir) || DUMMY_ENCRYPTION_ENABLED(sbi))
>> +		return (S_ISREG(mode) || S_ISDIR(mode) || S_ISLNK(mode));
>>  #endif
>> +	return false;
>>  }
>>
>>  static inline bool f2fs_may_compress(struct inode *inode)
>> diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
>> index b75c70813f9e..95cfbce062e8 100644
>> --- a/fs/f2fs/namei.c
>> +++ b/fs/f2fs/namei.c
>> @@ -75,9 +75,7 @@ static struct inode *f2fs_new_inode(struct inode *dir, umode_t mode)
>>
>>  	set_inode_flag(inode, FI_NEW_INODE);
>>
>> -	/* If the directory encrypted, then we should encrypt the inode. */
>> -	if ((IS_ENCRYPTED(dir) || DUMMY_ENCRYPTION_ENABLED(sbi)) &&
>> -				f2fs_may_encrypt(inode))
>> +	if (f2fs_may_encrypt(dir, inode))
>>  		f2fs_set_encrypted_inode(inode);
>>
>>  	if (f2fs_sb_has_extra_attr(sbi)) {
>> --
>
> Can't f2fs_init_inode_metadata() just check IS_ENCRYPTED(inode) instead?
> (inode, not dir.)  The encrypt flag was already set by f2fs_new_inode(), right?

Correct, I've updated the patch.

Thanks,

>
> If so, then f2fs_may_encrypt() would only have one caller and it could be
> inlined into f2fs_new_inode(), similar to __ext4_new_inode().
>
> - Eric
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
