Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3CF377EE3
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 May 2021 11:03:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lg1ou-0006LW-QS; Mon, 10 May 2021 09:03:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1lg1ot-0006LP-3L
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 10 May 2021 09:03:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sRwwuRu3tZxL49ueMrGihCtTY+PJl+BHDldAj2OXqJs=; b=MzIDNQdKFVPhLhcfNdfdf/zX28
 99hmKkMOXE90Mj06N0WUhiv/SpHyY0lXgWijqHxJQjWUvqVH98UZCMC18AJd5eZIJRFHbQN8Jbj2P
 Me/u8F3bfj9TJ0WNZXRZVG457C9+v/jinn7SvoKapd2PfjOlWBIZzc5js6tURE+v/oN8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sRwwuRu3tZxL49ueMrGihCtTY+PJl+BHDldAj2OXqJs=; b=cMd7E52sm6iIp3L0CorU20aI7I
 NYtm+ycG+F3ab3ERTJn4EogEVzrJOiUYGyAvo4Pc5BXgcxkmnZ5LIUzUM8MkJQ4BB/i3S9BTS2bYY
 Ze4pS/MWrE18KzayAjfIO0zF4lEl4XVojf9x+FKczwWm9xZeCZi4Vj9hhcbKvQ7mI0ds=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lg1oo-0001a6-VP
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 10 May 2021 09:03:20 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Fdw3k6jFHzqV16;
 Mon, 10 May 2021 16:59:46 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by smtp.huawei.com
 (10.3.19.214) with Microsoft SMTP Server (TLS) id 14.3.498.0; Mon, 10 May
 2021 17:03:05 +0800
To: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
References: <20210510064057.729369-1-shinichiro.kawasaki@wdc.com>
 <726b7f8d-bbad-f940-c06e-056103025a47@huawei.com>
 <20210510084607.ayajkbiyccsasl7q@shindev.dhcp.fujisawa.hgst.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <7c26c024-1fdf-565f-53a3-b41b37c2009d@huawei.com>
Date: Mon, 10 May 2021 17:03:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20210510084607.ayajkbiyccsasl7q@shindev.dhcp.fujisawa.hgst.com>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lg1oo-0001a6-VP
Subject: Re: [f2fs-dev] [PATCH] f2fs: Prevent swap file on zoned block
 devices
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Damien Le Moal <Damien.LeMoal@wdc.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Shinichiro,

On 2021/5/10 16:46, Shinichiro Kawasaki wrote:
> On May 10, 2021 / 15:03, Chao Yu wrote:
>> On 2021/5/10 14:40, Shin'ichiro Kawasaki wrote:
>>> When f2fs is set up on zoned block devices, swap files on the file-
>>> system causes unaligned write command errors. The kernel writes to the
>>> swap files directly without the assistance of the filesystem then
>>> it can not fulfill sequential write requirements of zoned block devices.
>>>
>>> To avoid the errors, prevent swap file activation when the filesystem
>>> enables block zoned device support.
>>>
>>> Fixes: 4969c06a0d83 ("f2fs: support swap file w/ DIO")
>>> Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
>>> Cc: stable@vger.kernel.org # v5.4+
>>> ---
>>>    fs/f2fs/data.c | 6 ++++++
>>>    1 file changed, 6 insertions(+)
>>>
>>> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
>>> index 96f1a354f89f..51a832efd8cd 100644
>>> --- a/fs/f2fs/data.c
>>> +++ b/fs/f2fs/data.c
>>> @@ -4050,6 +4050,12 @@ static int f2fs_swap_activate(struct swap_info_struct *sis, struct file *file,
>>>    	if (f2fs_readonly(F2FS_I_SB(inode)->sb))
>>>    		return -EROFS;
>>> +	if (f2fs_sb_has_blkzoned(F2FS_I_SB(inode))) {
>>
>> Should be f2fs_lfs_mode()? because all LFS mode instances will suffer
>> the same problem?
> 
> Hi Chao, thanks for the comment.
> 
> The problem this patch addresses is the unaligned write command error that
> unique to zoned block devices. Non-zoned, regular block devices do not require
> sequential write and do not report the error, even when kernel does
> non-sequential write to the swap files.
> 
> My understanding is that LFS mode instances allow the non-sequential write to
> swap files. At least, I was able to create a swap file with f2fs LFS mode on
> a non-zoned device, and observed the swap file worked as swap without error.

Yes, it won't return any error because swap manager knew the L2P mapping info,
and just read or write to LBA bypassing f2fs directly.

But, IMO, it (swap manager triggers IPU) breaks LFS mode's semantics which
only allow sequential write.

> 
>      In this trial, I did not pin the swap file before swapon. Depending on the
>      steps to prepare the swap file, the file map to blocks was unaligned to
>      sections. When the file map was unaligned, swapon failed with message
>      "Swapfile does not align to section". When the map was aligned, swapon
>      succeeded. After that, swap file was in pinned status.

I guess pin feature conflicts with LFS mode...

So that I guess checking f2fs_lfs_mode() here will be more precious, right?

Thanks,

> 
> If such swap file usage with LFS mode is not expected, I will modify the patch
> with f2fs_lfs_mode(). It will avoid the unaligned write command error also.
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
