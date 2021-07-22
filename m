Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AE92F3D301A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Jul 2021 01:15:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m6huX-0001ak-NF; Thu, 22 Jul 2021 23:15:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1m6huU-0001aa-Uc
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Jul 2021 23:15:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=S+HGLweuFzG55oNu87sCwpERmis0LdbIsu/1/eCih40=; b=XR7HpSbzhRCTMm0GejyAOYLfm+
 +IodmwHmnJZ+tkKac4TFtG727+8ZAxBQa5SZnfo2bA8fv8SOihZrk5QGqc8ZQ09uxv8Xt6UuYIFnz
 apX+hxw2k3xYPj9o/DmwjZcnflE7URFRXfyaK/Nnwwh5F+bY1ecVABKaojYAkowhGsmk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=S+HGLweuFzG55oNu87sCwpERmis0LdbIsu/1/eCih40=; b=WDWq/IJC0DoxJDeB/b7uwZe90t
 GuAzdB3mNROutTJWxqEi9v5kZiJ7cww3sXn5MZBz6z2oj6/xFSlo3OW+OOll2njmaCAgQR6v8/NmA
 X57OufZ3vzxj15fH2ondTD+iEOqn6TowXnEVUs08vQPTiDTJAw/lPFrcBz2QjhY1yF/o=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m6huO-0001Iz-Mn
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Jul 2021 23:15:22 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 138C260E8F;
 Thu, 22 Jul 2021 23:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626995699;
 bh=eb3jIUA27WuZiqMOHyn3peGQmh5dVT3HqvvzBdRVFcc=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=NCx0VafwcDUgQxdGiVGEH1WRvGiDrLfm0PIdW0M228ZK6/JTb696B+7u64PQXaKI3
 QilW7jzh5eKLnvVOxSkf/xCln1frHvUr+Nnm0EDmcGKQwVDaxLXUFunUFcqOrBDFko
 M5RqW53Cm2gRsSWgmwi8uLw988ZfglpLaB5RZ/TdFv7nQzHPsg92J63qymesa503jY
 A61B4w8GtQtRYIcHCNpPmmqljoR1A7m0OokV0TYJxQ9QLCTiVJHUlIYdu/pxI2XDUL
 ssmoC5bm37yf5PbOQkMeieWlZyhgHDyPIDG7pVkhLW3vPszn3ygX5UW4lQl3JJy37o
 iDgC9qWsxTKFQ==
To: Eric Biggers <ebiggers@kernel.org>
References: <20210722131617.749204-1-chao@kernel.org>
 <YPmTP5EixgTp1Wze@gmail.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <e1b61b7f-a492-f28b-8a98-557e81a2022a@kernel.org>
Date: Fri, 23 Jul 2021 07:14:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YPmTP5EixgTp1Wze@gmail.com>
Content-Language: en-US
X-Spam-Score: -1.5 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 NICE_REPLY_A           Looks like a legit reply (A)
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1m6huO-0001Iz-Mn
Subject: Re: [f2fs-dev] [PATCH] f2fs: simplify accounting inflight directIO
 request
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, Chao Yu <chao.yu@linux.dev>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/7/22 23:48, Eric Biggers wrote:
> On Thu, Jul 22, 2021 at 09:16:17PM +0800, Chao Yu wrote:
>> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
>> index ba120d55e9b1..d0a1ca6ae38e 100644
>> --- a/fs/f2fs/data.c
>> +++ b/fs/f2fs/data.c
>> @@ -1720,6 +1720,9 @@ static int __get_data_block(struct inode *inode, sector_t iblock,
>>   		map_bh(bh, inode->i_sb, map.m_pblk);
>>   		bh->b_state = (bh->b_state & ~F2FS_MAP_FLAGS) | map.m_flags;
>>   		bh->b_size = blks_to_bytes(inode, map.m_len);
>> +
>> +		if (flag == F2FS_GET_BLOCK_DIO)
>> +			bh->b_private = (void *)may_write;
> 
> Why is this hunk needed?

For passing rw info from get_block() to dio->private.

> 
>> +static int f2fs_dio_end_io(struct kiocb *iocb, loff_t offset,
>> +					ssize_t bytes, void *private)
>>   {
>> -	struct f2fs_private_dio *dio = bio->bi_private;
>> -
>> -	dec_page_count(F2FS_I_SB(dio->inode),
>> -			dio->write ? F2FS_DIO_WRITE : F2FS_DIO_READ);
>> -
>> -	bio->bi_private = dio->orig_private;
>> -	bio->bi_end_io = dio->orig_end_io;
>> -
>> -	kfree(dio);
>> +	struct inode *inode = file_inode(iocb->ki_filp);
>> +	bool may_write = private;
>>   
>> -	bio_endio(bio);
>> +	dec_dio_req_count(F2FS_I_SB(inode), may_write ? WRITE : READ);
>> +	return 0;
>>   }
>>   
>>   static void f2fs_dio_submit_bio(struct bio *bio, struct inode *inode,
>>   							loff_t file_offset)
>>   {
>> -	struct f2fs_private_dio *dio;
>> -	bool write = (bio_op(bio) == REQ_OP_WRITE);
>> -
>> -	dio = f2fs_kzalloc(F2FS_I_SB(inode),
>> -			sizeof(struct f2fs_private_dio), GFP_NOFS);
>> -	if (!dio)
>> -		goto out;
>> -
>> -	dio->inode = inode;
>> -	dio->orig_end_io = bio->bi_end_io;
>> -	dio->orig_private = bio->bi_private;
>> -	dio->write = write;
>> -
>> -	bio->bi_end_io = f2fs_dio_end_io;
>> -	bio->bi_private = dio;
>> -
>> -	inc_page_count(F2FS_I_SB(inode),
>> -			write ? F2FS_DIO_WRITE : F2FS_DIO_READ);
>> +	inc_dio_req_count(F2FS_I_SB(inode),
>> +			op_is_write(bio_op(bio)) ? WRITE : READ);
>>   
>>   	submit_bio(bio);
>> -	return;
>> -out:
>> -	bio->bi_status = BLK_STS_IOERR;
>> -	bio_endio(bio);
>>   }
> 
> The inc and dec here aren't correctly paired, since f2fs_dio_submit_bio() is
> called once per bio whereas f2fs_dio_end_io() is called when the entire direct
> I/O request (which may have consisted of multiple bios) has completed.

Correct, it still needs to hook bio->bi_end_io rather than hooking dio->end_io,
however, w/o one extra allocated memory, we have no way to pass sbi to
f2fs_dio_end_io() for dec_dio_req_count(sbi, ...) invoking.

> 
> The correct way to do this would be to do the inc before calling
> __blockdev_direct_IO(), and do the dec in end_io or if __blockdev_direct_IO()
> returned without actually issuing any I/O.
> 
> But I think you shouldn't bother with this part of the change before we switch
> to iomap, as it will then need to be changed again anyway.

Agreed.

Thanks,

> 
> - Eric
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
