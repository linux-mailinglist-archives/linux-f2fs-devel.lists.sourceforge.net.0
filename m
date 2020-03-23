Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2FB18EE7A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Mar 2020 04:22:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jGDfS-0001Mp-Le; Mon, 23 Mar 2020 03:22:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jGDfR-0001Ma-CM
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Mar 2020 03:22:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KgKgfVDIaLdHok6e03vavGFfQrzRhyf0kPcQZrhNjq0=; b=dptOQxQNfex8JSwce9r/C4Z/Yi
 kzm6uYOv0gaRVfNj48W11HZ9msTalO/4Iib44aGpu4bR1bEIFrXhAStBaNDMwatEjKsKaS+0dDljW
 C/Lq41NbLVEa+/Lhr+sZA0YTjfrAN3ZY5ciSIKyqDGVkPB5vz5bjdQv8d32mnCVBWPlk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KgKgfVDIaLdHok6e03vavGFfQrzRhyf0kPcQZrhNjq0=; b=CB2voA90BRyP9/WyXMz7faYbVM
 V9ViPVSz8aKIN44o7wAW2R930UHqWdvJNoLHT8jz+ti0xxmkk5z5+/AV03aTteupxd0k4OVePmC3X
 xv2a6E5Xl9JYCHs1oCWrAULCM7oAKIYfOPZvneLKWx3Yz6IW7xjiDKOSoxKlZjKoDXes=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jGDfP-0048se-QH
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Mar 2020 03:22:21 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 4129B9EA7CDED3C0FD5D;
 Mon, 23 Mar 2020 11:22:07 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.212) with Microsoft SMTP Server (TLS) id 14.3.487.0; Mon, 23 Mar
 2020 11:22:02 +0800
To: Joe Perches <joe@perches.com>, <jaegeuk@kernel.org>
References: <20200323024109.60967-1-yuchao0@huawei.com>
 <8d435607bd79f518bd9420d68894ddda521bac5a.camel@perches.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <aaa065c4-5c15-38a1-f2ea-73b4226fb203@huawei.com>
Date: Mon, 23 Mar 2020 11:22:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <8d435607bd79f518bd9420d68894ddda521bac5a.camel@perches.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jGDfP-0048se-QH
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: fix potential .flags overflow on
 32bit architecture
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

On 2020/3/23 10:57, Joe Perches wrote:
> On Mon, 2020-03-23 at 10:41 +0800, Chao Yu wrote:
>> f2fs_inode_info.flags is unsigned long variable, it has 32 bits
>> in 32bit architecture, since we introduced FI_MMAP_FILE flag
>> when we support data compression, we may access memory cross
>> the border of .flags field, corrupting .i_sem field, result in
>> below deadlock.
> []
>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> []
>> @@ -682,6 +682,47 @@ enum {
> []
>> +/* used for f2fs_inode_info->flags */
>> +enum {
> []
>> +	FI_MAX,			/* max flag, never be used */
>> +};
>> +
>> +/* f2fs_inode_info.flags array size */
>> +#define FI_ARRAY_SIZE		(BITS_TO_LONGS(FI_MAX))
> 
> Perhaps FI_ARRAY_SIZE isn't necessary.
> 
>> +
>>  struct f2fs_inode_info {
>>  	struct inode vfs_inode;		/* serve a vfs inode */
>>  	unsigned long i_flags;		/* keep an inode flags for ioctl */
>> @@ -694,7 +735,7 @@ struct f2fs_inode_info {
>>  	umode_t i_acl_mode;		/* keep file acl mode temporarily */
>>  
>>  	/* Use below internally in f2fs*/
>> -	unsigned long flags;		/* use to pass per-file flags */
>> +	unsigned long flags[FI_ARRAY_SIZE];	/* use to pass per-file flags */
> 
> and BITS_TO_LONGS should be used here.
> 
>> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> []
>> @@ -362,7 +363,8 @@ static int do_read_inode(struct inode *inode)
>>  	fi->i_flags = le32_to_cpu(ri->i_flags);
>>  	if (S_ISREG(inode->i_mode))
>>  		fi->i_flags &= ~F2FS_PROJINHERIT_FL;
>> -	fi->flags = 0;
>> +	for (i = 0; i < FI_ARRAY_SIZE; i++)
>> +		fi->flags[i] = 0;
> 
> And this could become
> 
> 	bitmap_zero(fi->flags, BITS_TO_LONG(FI_MAX));
> 
> Is FI_ARRAY_SIZE used anywhere else?

Updated in v5, thanks.

Thanks,

> 
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
