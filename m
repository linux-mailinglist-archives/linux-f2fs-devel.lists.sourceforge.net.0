Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 291A911A09E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Dec 2019 02:42:22 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ier18-0001wE-9X; Wed, 11 Dec 2019 01:42:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1ier16-0001w6-3K
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Dec 2019 01:42:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3YkFOPfC9ZPn4bHmSnr4ZXE3klr8U/RVlI0Vnj/L6Ew=; b=brOj2iHoLP7izTMOA8mkq1gfsk
 jvFy4A02NiFLBywwet4hA74WLjmQ3m2xHmwqjCKP9DJ1k+5687KOwbwXY+smUBSAtAObtTDtR8zXK
 YmyPTWJxpaCot3AJNjH5yU7GW9iP3ctfvAlq8Xvq3Gtb+A4QIzxrmpxnyJSDzScx3gcM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3YkFOPfC9ZPn4bHmSnr4ZXE3klr8U/RVlI0Vnj/L6Ew=; b=nNi9Ue/9Vd6hjpyzGAzBLuwi8w
 IqSdUOiN/CD3frDd+skAMeXdaaw2HQrgIlmXaKPspSAnyRif3Efbvi8w7yFs40gdTJW2iUVhsYo0l
 cVRBsvsGUY899v4D4pzovbUtskrlNGMkosDZl2Wwu9XJ1FOdxwVz6LLi+muc69TgxTso=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ier13-000T0z-Lb
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Dec 2019 01:42:16 +0000
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id D323C4F4F6E34CA96FF6;
 Wed, 11 Dec 2019 09:42:03 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.213) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 11 Dec
 2019 09:42:01 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20191209222345.1078-1-jaegeuk@kernel.org>
 <20191209222345.1078-6-jaegeuk@kernel.org>
 <88dcbca9-3757-a440-ed73-9d99a56b816c@huawei.com>
 <20191211012121.GA52962@jaegeuk-macbookpro.roam.corp.google.com>
 <00ced682-9522-236d-4078-4c8f2e348d39@huawei.com>
 <20191211013124.GB57416@jaegeuk-macbookpro.roam.corp.google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <dd2021ff-6968-43ad-d8b2-3689668cd79e@huawei.com>
Date: Wed, 11 Dec 2019 09:42:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20191211013124.GB57416@jaegeuk-macbookpro.roam.corp.google.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1ier13-000T0z-Lb
Subject: Re: [f2fs-dev] [PATCH 6/6] f2fs: set I_LINKABLE early to avoid
 wrong access by vfs
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

On 2019/12/11 9:31, Jaegeuk Kim wrote:
> On 12/11, Chao Yu wrote:
>> On 2019/12/11 9:21, Jaegeuk Kim wrote:
>>> On 12/10, Chao Yu wrote:
>>>> On 2019/12/10 6:23, Jaegeuk Kim wrote:
>>>>> This patch moves setting I_LINKABLE early in rename2(whiteout) to avoid the
>>>>> below warning.
>>>>>
>>>>> [ 3189.163385] WARNING: CPU: 3 PID: 59523 at fs/inode.c:358 inc_nlink+0x32/0x40
>>>>> [ 3189.246979] Call Trace:
>>>>> [ 3189.248707]  f2fs_init_inode_metadata+0x2d6/0x440 [f2fs]
>>>>> [ 3189.251399]  f2fs_add_inline_entry+0x162/0x8c0 [f2fs]
>>>>> [ 3189.254010]  f2fs_add_dentry+0x69/0xe0 [f2fs]
>>>>> [ 3189.256353]  f2fs_do_add_link+0xc5/0x100 [f2fs]
>>>>> [ 3189.258774]  f2fs_rename2+0xabf/0x1010 [f2fs]
>>>>> [ 3189.261079]  vfs_rename+0x3f8/0xaa0
>>>>> [ 3189.263056]  ? tomoyo_path_rename+0x44/0x60
>>>>> [ 3189.265283]  ? do_renameat2+0x49b/0x550
>>>>> [ 3189.267324]  do_renameat2+0x49b/0x550
>>>>> [ 3189.269316]  __x64_sys_renameat2+0x20/0x30
>>>>> [ 3189.271441]  do_syscall_64+0x5a/0x230
>>>>> [ 3189.273410]  entry_SYSCALL_64_after_hwframe+0x49/0xbe
>>>>> [ 3189.275848] RIP: 0033:0x7f270b4d9a49
>>>>>
>>>>> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
>>>>> ---
>>>>>  fs/f2fs/namei.c | 27 +++++++++++++--------------
>>>>>  1 file changed, 13 insertions(+), 14 deletions(-)
>>>>>
>>>>> diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
>>>>> index a1c507b0b4ac..5d9584281935 100644
>>>>> --- a/fs/f2fs/namei.c
>>>>> +++ b/fs/f2fs/namei.c
>>>>> @@ -797,6 +797,7 @@ static int __f2fs_tmpfile(struct inode *dir, struct dentry *dentry,
>>>>>  
>>>>>  	if (whiteout) {
>>>>>  		f2fs_i_links_write(inode, false);
>>>>> +		inode->i_state |= I_LINKABLE;
>>>>>  		*whiteout = inode;
>>>>>  	} else {
>>>>>  		d_tmpfile(dentry, inode);
>>>>> @@ -867,6 +868,12 @@ static int f2fs_rename(struct inode *old_dir, struct dentry *old_dentry,
>>>>>  			F2FS_I(old_dentry->d_inode)->i_projid)))
>>>>>  		return -EXDEV;
>>>>>  
>>>>> +	if (flags & RENAME_WHITEOUT) {
>>>>> +		err = f2fs_create_whiteout(old_dir, &whiteout);
>>>>> +		if (err)
>>>>> +			return err;
>>>>> +	}
>>>>
>>>> To record quota info correctly, we need to create whiteout inode after
>>>> dquot_initialize(old_dir)?
>>>
>>> __f2fs_tmpfile() will do it.
>>
>> Okay.
>>
>> Any comments on below question?
>>
>>>
>>>>
>>>>> +
>>>>>  	err = dquot_initialize(old_dir);
>>>>>  	if (err)
>>>>>  		goto out;
>>>>> @@ -898,17 +905,11 @@ static int f2fs_rename(struct inode *old_dir, struct dentry *old_dentry,
>>>>>  		}
>>>>>  	}
>>>>>  
>>>>> -	if (flags & RENAME_WHITEOUT) {
>>>>> -		err = f2fs_create_whiteout(old_dir, &whiteout);
>>>>> -		if (err)
>>>>> -			goto out_dir;
>>>>> -	}
>>>>> -
>>>>>  	if (new_inode) {
>>>>>  
>>>>>  		err = -ENOTEMPTY;
>>>>>  		if (old_dir_entry && !f2fs_empty_dir(new_inode))
>>>>> -			goto out_whiteout;
>>>>> +			goto out_dir;
>>>>>  
>>>>>  		err = -ENOENT;
>>>>>  		new_entry = f2fs_find_entry(new_dir, &new_dentry->d_name,
>>>>> @@ -916,7 +917,7 @@ static int f2fs_rename(struct inode *old_dir, struct dentry *old_dentry,
>>>>>  		if (!new_entry) {
>>>>>  			if (IS_ERR(new_page))
>>>>>  				err = PTR_ERR(new_page);
>>>>> -			goto out_whiteout;
>>>>> +			goto out_dir;
>>>>>  		}
>>>>>  
>>>>>  		f2fs_balance_fs(sbi, true);
>>>>> @@ -948,7 +949,7 @@ static int f2fs_rename(struct inode *old_dir, struct dentry *old_dentry,
>>>>>  		err = f2fs_add_link(new_dentry, old_inode);
>>>>>  		if (err) {
>>>>>  			f2fs_unlock_op(sbi);
>>>>> -			goto out_whiteout;
>>>>> +			goto out_dir;
>>>>>  		}
>>>>>  
>>>>>  		if (old_dir_entry)
>>>>> @@ -972,7 +973,7 @@ static int f2fs_rename(struct inode *old_dir, struct dentry *old_dentry,
>>>>>  				if (IS_ERR(old_page))
>>>>>  					err = PTR_ERR(old_page);
>>>>>  				f2fs_unlock_op(sbi);
>>>>> -				goto out_whiteout;
>>>>> +				goto out_dir;
>>>>>  			}
>>>>>  		}
>>>>>  	}
>>>>> @@ -991,7 +992,6 @@ static int f2fs_rename(struct inode *old_dir, struct dentry *old_dentry,
>>>>>  	f2fs_delete_entry(old_entry, old_page, old_dir, NULL);
>>>>>  
>>>>>  	if (whiteout) {
>>>>> -		whiteout->i_state |= I_LINKABLE;
>>>>>  		set_inode_flag(whiteout, FI_INC_LINK);
>>>>>  		err = f2fs_add_link(old_dentry, whiteout);
>>>>
>>>> [ 3189.256353]  f2fs_do_add_link+0xc5/0x100 [f2fs]
>>>> [ 3189.258774]  f2fs_rename2+0xabf/0x1010 [f2fs]
>>>>
>>>> Does the call stack point here? if so, we have set I_LINKABLE before
>>>> f2fs_add_link(), why the warning still be triggered?
>>
>> Am I missing something?
> 
> Not sure exactly tho, I suspect some races before/after unlock_new_inode().

Alright, I doubt some races on whiteout->i_state updating, as we set I_LINKABLE
w/o holding inode.i_lock.

Could you have a try with holding i_lock?

Thanks,

> 
>>
>> Thanks,
>>
>>>>
>>>> Thanks,
>>>>
>>>>>  		if (err)
>>>>> @@ -1027,15 +1027,14 @@ static int f2fs_rename(struct inode *old_dir, struct dentry *old_dentry,
>>>>>  	f2fs_unlock_op(sbi);
>>>>>  	if (new_page)
>>>>>  		f2fs_put_page(new_page, 0);
>>>>> -out_whiteout:
>>>>> -	if (whiteout)
>>>>> -		iput(whiteout);
>>>>>  out_dir:
>>>>>  	if (old_dir_entry)
>>>>>  		f2fs_put_page(old_dir_page, 0);
>>>>>  out_old:
>>>>>  	f2fs_put_page(old_page, 0);
>>>>>  out:
>>>>> +	if (whiteout)
>>>>> +		iput(whiteout);
>>>>>  	return err;
>>>>>  }
>>>>>  
>>>>>
>>> .
>>>
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
