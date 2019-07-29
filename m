Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDFC7863E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Jul 2019 09:22:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hrzzP-0003Up-7p; Mon, 29 Jul 2019 07:22:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hrzzN-0003Uh-OF
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 29 Jul 2019 07:22:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=APWYwFXjAsQi0+Ia4tKSNOKL/yvWqtptlEGxZMyds8g=; b=f0F/FsT53Pq+Q99K5USGP7EFIL
 FeYmRt2FfMdth36Jt8V+/csyipATc47EXeRr9FA4oYuadEqOyLiJPBgJdmzjsVxdAkALmzCQgK0XG
 khnxVY7e0SNatMCGiAeZ4PTutadJRKOxXXRB7lzvcXZQaiArTcuhgoGgbx8Pjn07ngFM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=APWYwFXjAsQi0+Ia4tKSNOKL/yvWqtptlEGxZMyds8g=; b=NrW/1lqE/CtsJJy37EUAIC2WRO
 i4PBQQgS4T4MiU94kdshkTaGGvwoT92nySRIjZEmlewVpN5k3NqxDGfyM3WuRRHoM38mwNhCrmXql
 mgid+fQRAmYdXM5a3fDfx6A3vyXMChJb1RAc58ZoJrYWpJpz+Uf+m8WNgtqkDki3U4yw=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hrzzM-0035jy-3W
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 29 Jul 2019 07:22:33 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 75FAC6D82EC4BAD96A58;
 Mon, 29 Jul 2019 15:22:24 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.207) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 29 Jul
 2019 15:22:22 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
References: <20190723230529.251659-1-drosen@google.com>
 <20190723230529.251659-4-drosen@google.com>
 <9362e4ed-2be8-39f5-b4d9-9c86e37ab993@kernel.org>
 <20190729062735.GA98839@jaegeuk-macbookpro.roam.corp.google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <fa07a09d-92c9-4e0b-7c2b-e87771273dce@huawei.com>
Date: Mon, 29 Jul 2019 15:22:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190729062735.GA98839@jaegeuk-macbookpro.roam.corp.google.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hrzzM-0035jy-3W
Subject: Re: [f2fs-dev] [PATCH v4 3/3] f2fs: Support case-insensitive file
 name lookups
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
Cc: Daniel Rosenberg <drosen@google.com>, linux-doc@vger.kernel.org,
 linux-api@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/7/29 14:27, Jaegeuk Kim wrote:
> On 07/28, Chao Yu wrote:
>> On 2019-7-24 7:05, Daniel Rosenberg via Linux-f2fs-devel wrote:
>>>  /* Flags that are appropriate for regular files (all but dir-specific ones). */
>>>  #define F2FS_REG_FLMASK		(~(F2FS_DIRSYNC_FL | F2FS_PROJINHERIT_FL))
>>
>> We missed to add F2FS_CASEFOLD_FL here to exclude it in F2FS_REG_FLMASK.
> 
> Applied.
> 
>>
>>> @@ -1660,7 +1660,16 @@ static int f2fs_setflags_common(struct inode *inode, u32 iflags, u32 mask)
>>>  		return -EPERM;
>>>  
>>>  	oldflags = fi->i_flags;
>>> +	if ((iflags ^ oldflags) & F2FS_CASEFOLD_FL) {
>>> +		if (!f2fs_sb_has_casefold(F2FS_I_SB(inode)))
>>> +			return -EOPNOTSUPP;
>>> +
>>> +		if (!S_ISDIR(inode->i_mode))
>>> +			return -ENOTDIR;
>>>  
>>> +		if (!f2fs_empty_dir(inode))
>>> +			return -ENOTEMPTY;
>>> +	}
> 
> Modified like this:
> @@ -1665,6 +1665,13 @@ static int f2fs_setflags_common(struct inode *inode, u32 iflags, u32 mask)
>         if (IS_NOQUOTA(inode))
>                 return -EPERM;
> 
> +       if ((iflags ^ fi->i_flags) & F2FS_CASEFOLD_FL) {
> +               if (!f2fs_sb_has_casefold(F2FS_I_SB(inode)))
> +                       return -EOPNOTSUPP;
> +               if (!f2fs_empty_dir(inode))
> +                       return -ENOTEMPTY;
> +       }
> +
> 
> Note that, directory is checked by above change.
> 
> I've uploaded in f2fs.git, so could you check it out and test a bit?

I've checked it out, it looks good to me now, and later I will test this new
version.

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,

> 
> Thanks,
> 
>>
>> I applied the patches based on last Jaegeuk's dev branch, it seems we needs to
>> adjust above code a bit. Otherwise it looks good to me.
>>
>> BTW, it looks the patchset works fine with generic/556 testcase.
>>
>> Thanks,
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
