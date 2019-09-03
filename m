Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E0787A5F2D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Sep 2019 04:09:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i4yGa-0001qA-D1; Tue, 03 Sep 2019 02:09:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1i4yGZ-0001q2-Gh
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Sep 2019 02:09:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oGV+vN1+8nqa2O36WOlbZedsU2Plvu5NXRJNXlR/VBk=; b=KokRYNv/uvNNklwt38Q7aTXA12
 VelYL9IZYGQpkNxRKbyrnILxy48WnSNMMazi0hir0Bwr5UG9vQDD7hm20iuvcZn0gJKrzqHUc5K8Y
 JL7jouTWwKvcMUOvSScbsDFPWvxVAMWL5zAUFPOf5pk1lGGo+6yAs+kRgnWhTrS4ZMJ4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oGV+vN1+8nqa2O36WOlbZedsU2Plvu5NXRJNXlR/VBk=; b=l5WbpT0s3PJcSpsNDbnA0PJM4q
 R8sa4qrtZGCliHa+x4/GMnUdOuqIb1F7BXWBjZucdg8JCAXb1bAWDlfl1LpKqPTdPOjg0MQascS5W
 0YfnUcN8HZl/mndDNkI2DJLaj+Rwz9rIvJGmZmeJBMuWqYKMkc+jv7HIO0AVUKIHYhxk=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i4yGX-007JSC-W1
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Sep 2019 02:09:55 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 04709543F0917821EBDC;
 Tue,  3 Sep 2019 10:09:47 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.211) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 3 Sep 2019
 10:09:45 +0800
To: Chao Yu <chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20190830153453.24684-1-jaegeuk@kernel.org>
 <d441bdaa-5155-3144-cdfe-01e8dcc7eff2@huawei.com>
 <20190901072529.GB49907@jaegeuk-macbookpro.roam.corp.google.com>
 <aff72932-5be3-0d81-b68d-017a392a334b@huawei.com>
 <20190902230700.GE71929@jaegeuk-macbookpro.roam.corp.google.com>
 <65d05f5e-dffc-0b50-1463-b4b30315f014@kernel.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <fbdd610e-617c-b80c-511e-389acee25418@huawei.com>
Date: Tue, 3 Sep 2019 10:09:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <65d05f5e-dffc-0b50-1463-b4b30315f014@kernel.org>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1i4yGX-007JSC-W1
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

On 2019/9/3 7:35, Chao Yu wrote:
> On 2019-9-3 7:07, Jaegeuk Kim wrote:
>> On 09/02, Chao Yu wrote:
>>> On 2019/9/1 15:25, Jaegeuk Kim wrote:
>>>> On 08/31, Chao Yu wrote:
>>>>> On 2019/8/30 23:34, Jaegeuk Kim wrote:
>>>>>> This can guarantee inline_data has smaller i_size.
>>>>>
>>>>> So I guess "f2fs: fix to avoid corruption during inline conversion" didn't fix
>>>>> such corruption right, I guess checkpoint & SPO before i_size recovery will
>>>>> cause this issue?
>>>>>
>>>>> 	err = f2fs_convert_inline_inode(inode);
>>>>> 	if (err) {
>>>>>
>>>>> -->
>>>>
>>>> Yup, I think so.
>>>
>>> Oh,  we'd better to avoid wrong fixing patch as much as possible, so what about
>>> letting me change that patch to just fix error path of
>>> f2fs_convert_inline_page() by adding missing f2fs_truncate_data_blocks_range()?
>>
>> Could you post another patch? I'm okay to combine them.
> 
> No problem, let merge them in v2. :)

Still send as two separated patches which can be easily maintained in those LTS
stable kernel. :P

Thanks,

> 
> Thanks,
> 
>>
>>>
>>> Meanwhile I need to add below 'Fixes' tag line:
>>> 7735730d39d7 ("f2fs: fix to propagate error from __get_meta_page()")
>>>
>>>
>>> And if possible, could you add:
>>>
>>> In below call path, if we failed to convert inline inode, inline inode may have
>>> wrong i_size which is larger than max inline size.
>>> - f2fs_setattr
>>>  - truncate_setsize
>>>  - f2fs_convert_inline_inode
>>>
>>> Fixes: 0cab80ee0c9e ("f2fs: fix to convert inline inode in ->setattr")
>>>
>>>>
>>>>>
>>>>> 		/* recover old i_size */
>>>>> 		i_size_write(inode, old_size);
>>>>> 		return err;
>>>>>
>>>>>>
>>>>>> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
>>>>>
>>>>> Reviewed-by: Chao Yu <yuchao0@huawei.com>
>>>>>
>>>>>> ---
>>>>>>  fs/f2fs/file.c | 25 +++++++++----------------
>>>>>>  1 file changed, 9 insertions(+), 16 deletions(-)
>>>>>>
>>>>>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>>>>>> index 08caaead6f16..a43193dd27cb 100644
>>>>>> --- a/fs/f2fs/file.c
>>>>>> +++ b/fs/f2fs/file.c
>>>>>> @@ -815,14 +815,20 @@ int f2fs_setattr(struct dentry *dentry, struct iattr *attr)
>>>>>>  
>>>>>>  	if (attr->ia_valid & ATTR_SIZE) {
>>>>>>  		loff_t old_size = i_size_read(inode);
>>>>>> -		bool to_smaller = (attr->ia_size <= old_size);
>>>>>> +
>>>>>> +		if (attr->ia_size > MAX_INLINE_DATA(inode)) {
>>>>>> +			/* should convert inline inode here */
>>>>>
>>>>> Would it be better:
>>>>>
>>>>> /* should convert inline inode here in piror to i_size_write to avoid
>>>>> inconsistent status in between inline flag and i_size */
>>>>
>>>> Put like this.
>>>>
>>>> +                       /*
>>>> +                        * should convert inline inode before i_size_write to
>>>> +                        * keep smaller than inline_data size with inline flag.
>>>> +                        */
>>>
>>> Better, :)
>>>
>>> thanks,
>>>
>>>>
>>>>>
>>>>> Thanks,
>>>>>
>>>>>> +			err = f2fs_convert_inline_inode(inode);
>>>>>> +			if (err)
>>>>>> +				return err;
>>>>>> +		}
>>>>>>  
>>>>>>  		down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
>>>>>>  		down_write(&F2FS_I(inode)->i_mmap_sem);
>>>>>>  
>>>>>>  		truncate_setsize(inode, attr->ia_size);
>>>>>>  
>>>>>> -		if (to_smaller)
>>>>>> +		if (attr->ia_size <= old_size)
>>>>>>  			err = f2fs_truncate(inode);
>>>>>>  		/*
>>>>>>  		 * do not trim all blocks after i_size if target size is
>>>>>> @@ -830,24 +836,11 @@ int f2fs_setattr(struct dentry *dentry, struct iattr *attr)
>>>>>>  		 */
>>>>>>  		up_write(&F2FS_I(inode)->i_mmap_sem);
>>>>>>  		up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
>>>>>> -
>>>>>>  		if (err)
>>>>>>  			return err;
>>>>>>  
>>>>>> -		if (!to_smaller) {
>>>>>> -			/* should convert inline inode here */
>>>>>> -			if (!f2fs_may_inline_data(inode)) {
>>>>>> -				err = f2fs_convert_inline_inode(inode);
>>>>>> -				if (err) {
>>>>>> -					/* recover old i_size */
>>>>>> -					i_size_write(inode, old_size);
>>>>>> -					return err;
>>>>>> -				}
>>>>>> -			}
>>>>>> -			inode->i_mtime = inode->i_ctime = current_time(inode);
>>>>>> -		}
>>>>>> -
>>>>>>  		down_write(&F2FS_I(inode)->i_sem);
>>>>>> +		inode->i_mtime = inode->i_ctime = current_time(inode);
>>>>>>  		F2FS_I(inode)->last_disk_size = i_size_read(inode);
>>>>>>  		up_write(&F2FS_I(inode)->i_sem);
>>>>>>  	}
>>>>>>
>>>> .
>>>>
>>
>>
>> _______________________________________________
>> Linux-f2fs-devel mailing list
>> Linux-f2fs-devel@lists.sourceforge.net
>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
>>
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
