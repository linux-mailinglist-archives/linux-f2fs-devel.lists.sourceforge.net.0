Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6770AA5E33
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Sep 2019 01:35:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i4vrR-0003mK-6A; Mon, 02 Sep 2019 23:35:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1i4vrQ-0003mD-2q
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 02 Sep 2019 23:35:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=idjQeAQ+JuVXml4ijJi5kHXXA3lP4ZQ+g5u5KohXUJ4=; b=cAsO0vF2PX7sNKeUhhhUt/zzHZ
 NYoNP1sMI+vrj09IiFBzUAUM2nMCQ4Eo2khqNx60/m3zbChhA/rLBIju+jGKn9gORUOd7VdOzmS6x
 YMNj6ACE1OV3kaKzXlh8FvrZhS0eWsrVFAEygiwosSvlkcntpsWMb5YDiCQeuy7+wRX0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=idjQeAQ+JuVXml4ijJi5kHXXA3lP4ZQ+g5u5KohXUJ4=; b=Y+ggJL0uGOx3VneehbF2sqUOgz
 ZVv9GeBAcWhpFdv3Nk4tC/BTZ7qKPOku4GzKeOjXHqSd+wmgB9WzVev1fBU6y9IexOE4+44cMjJbZ
 p47Nm/UgA9REIltZjFr9zWAuERhLY4Z5oxk0BQPdOayPZ6t3R3rmODr0DUoulyjmy29E=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i4vrO-007kuk-ND
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 02 Sep 2019 23:35:48 +0000
Received: from [192.168.0.102] (unknown [180.111.100.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 23642204EC;
 Mon,  2 Sep 2019 23:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567467341;
 bh=X4p78bk4rX3A3ZfcqzYO9O0uFPOSYZLmWhRZ8sFloU8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=a3LIfORQ/heO80Bj8LPo8MOVp1VZ/fLibAGyH2m9lebIAFSlvuAFuFWhd2BfV2dqM
 A7r1bvrttuCPsH+/JU/dOACyg55fU+OvLyKgV/mug2onAjUSufog/u9NEx3oak8MDX
 T0KG9X6uf9juBRcuW/btkvrMd5hz3IIn1uuUV7w8=
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>
References: <20190830153453.24684-1-jaegeuk@kernel.org>
 <d441bdaa-5155-3144-cdfe-01e8dcc7eff2@huawei.com>
 <20190901072529.GB49907@jaegeuk-macbookpro.roam.corp.google.com>
 <aff72932-5be3-0d81-b68d-017a392a334b@huawei.com>
 <20190902230700.GE71929@jaegeuk-macbookpro.roam.corp.google.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <65d05f5e-dffc-0b50-1463-b4b30315f014@kernel.org>
Date: Tue, 3 Sep 2019 07:35:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190902230700.GE71929@jaegeuk-macbookpro.roam.corp.google.com>
Content-Language: en-US
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
X-Headers-End: 1i4vrO-007kuk-ND
Subject: Re: [f2fs-dev] [PATCH] f2fs: convert inline_data in prior to
 i_size_write
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019-9-3 7:07, Jaegeuk Kim wrote:
> On 09/02, Chao Yu wrote:
>> On 2019/9/1 15:25, Jaegeuk Kim wrote:
>>> On 08/31, Chao Yu wrote:
>>>> On 2019/8/30 23:34, Jaegeuk Kim wrote:
>>>>> This can guarantee inline_data has smaller i_size.
>>>>
>>>> So I guess "f2fs: fix to avoid corruption during inline conversion" didn't fix
>>>> such corruption right, I guess checkpoint & SPO before i_size recovery will
>>>> cause this issue?
>>>>
>>>> 	err = f2fs_convert_inline_inode(inode);
>>>> 	if (err) {
>>>>
>>>> -->
>>>
>>> Yup, I think so.
>>
>> Oh,  we'd better to avoid wrong fixing patch as much as possible, so what about
>> letting me change that patch to just fix error path of
>> f2fs_convert_inline_page() by adding missing f2fs_truncate_data_blocks_range()?
> 
> Could you post another patch? I'm okay to combine them.

No problem, let merge them in v2. :)

Thanks,

> 
>>
>> Meanwhile I need to add below 'Fixes' tag line:
>> 7735730d39d7 ("f2fs: fix to propagate error from __get_meta_page()")
>>
>>
>> And if possible, could you add:
>>
>> In below call path, if we failed to convert inline inode, inline inode may have
>> wrong i_size which is larger than max inline size.
>> - f2fs_setattr
>>  - truncate_setsize
>>  - f2fs_convert_inline_inode
>>
>> Fixes: 0cab80ee0c9e ("f2fs: fix to convert inline inode in ->setattr")
>>
>>>
>>>>
>>>> 		/* recover old i_size */
>>>> 		i_size_write(inode, old_size);
>>>> 		return err;
>>>>
>>>>>
>>>>> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
>>>>
>>>> Reviewed-by: Chao Yu <yuchao0@huawei.com>
>>>>
>>>>> ---
>>>>>  fs/f2fs/file.c | 25 +++++++++----------------
>>>>>  1 file changed, 9 insertions(+), 16 deletions(-)
>>>>>
>>>>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>>>>> index 08caaead6f16..a43193dd27cb 100644
>>>>> --- a/fs/f2fs/file.c
>>>>> +++ b/fs/f2fs/file.c
>>>>> @@ -815,14 +815,20 @@ int f2fs_setattr(struct dentry *dentry, struct iattr *attr)
>>>>>  
>>>>>  	if (attr->ia_valid & ATTR_SIZE) {
>>>>>  		loff_t old_size = i_size_read(inode);
>>>>> -		bool to_smaller = (attr->ia_size <= old_size);
>>>>> +
>>>>> +		if (attr->ia_size > MAX_INLINE_DATA(inode)) {
>>>>> +			/* should convert inline inode here */
>>>>
>>>> Would it be better:
>>>>
>>>> /* should convert inline inode here in piror to i_size_write to avoid
>>>> inconsistent status in between inline flag and i_size */
>>>
>>> Put like this.
>>>
>>> +                       /*
>>> +                        * should convert inline inode before i_size_write to
>>> +                        * keep smaller than inline_data size with inline flag.
>>> +                        */
>>
>> Better, :)
>>
>> thanks,
>>
>>>
>>>>
>>>> Thanks,
>>>>
>>>>> +			err = f2fs_convert_inline_inode(inode);
>>>>> +			if (err)
>>>>> +				return err;
>>>>> +		}
>>>>>  
>>>>>  		down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
>>>>>  		down_write(&F2FS_I(inode)->i_mmap_sem);
>>>>>  
>>>>>  		truncate_setsize(inode, attr->ia_size);
>>>>>  
>>>>> -		if (to_smaller)
>>>>> +		if (attr->ia_size <= old_size)
>>>>>  			err = f2fs_truncate(inode);
>>>>>  		/*
>>>>>  		 * do not trim all blocks after i_size if target size is
>>>>> @@ -830,24 +836,11 @@ int f2fs_setattr(struct dentry *dentry, struct iattr *attr)
>>>>>  		 */
>>>>>  		up_write(&F2FS_I(inode)->i_mmap_sem);
>>>>>  		up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
>>>>> -
>>>>>  		if (err)
>>>>>  			return err;
>>>>>  
>>>>> -		if (!to_smaller) {
>>>>> -			/* should convert inline inode here */
>>>>> -			if (!f2fs_may_inline_data(inode)) {
>>>>> -				err = f2fs_convert_inline_inode(inode);
>>>>> -				if (err) {
>>>>> -					/* recover old i_size */
>>>>> -					i_size_write(inode, old_size);
>>>>> -					return err;
>>>>> -				}
>>>>> -			}
>>>>> -			inode->i_mtime = inode->i_ctime = current_time(inode);
>>>>> -		}
>>>>> -
>>>>>  		down_write(&F2FS_I(inode)->i_sem);
>>>>> +		inode->i_mtime = inode->i_ctime = current_time(inode);
>>>>>  		F2FS_I(inode)->last_disk_size = i_size_read(inode);
>>>>>  		up_write(&F2FS_I(inode)->i_sem);
>>>>>  	}
>>>>>
>>> .
>>>
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
