Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4738A1E8CDA
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 30 May 2020 03:30:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jeqKP-00020k-Hb; Sat, 30 May 2020 01:30:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jeqKN-00020V-Ql
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 30 May 2020 01:30:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sKvIrN7LdaxiCXxbD3KKW3EjVxwxuuB56odldjlhGfI=; b=k2F+thN8Uo2u41Fa4jfNZ4Jq3q
 Pw/P4QCNmL7v+YUCvb0a4IZQU/ciyIZkQCpKBMRVdrvLlixwZmtqTdmTlfC/KNgCxgYxVdin69sAh
 5BMFUDHAstRgepTVOjvKLvPPTguvWYq5QIPb+zSYFb0bx6r9x3BzhJ3R0dskmiFj/Yhg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sKvIrN7LdaxiCXxbD3KKW3EjVxwxuuB56odldjlhGfI=; b=OrWYOvVl90eq3jFkje/J82fzlY
 ckTbhvMQm3JIEuzxirkmqPMyKevtcAPNjT2hxmXpLFXvKRMsDfDAweO4ED5Dq48gtQMDuWeSfPpU6
 /Csbq8I1k2zVf8AZdoxfdjNu+n2F+6ZLnzUGQMmF0xbPTy5/j1Cd8AdooePYVCU7ZceM=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jeqKL-000NwW-Ky
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 30 May 2020 01:30:23 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 27B375CB4E9BE0AE5A1A;
 Sat, 30 May 2020 09:30:13 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.202) with Microsoft SMTP Server (TLS) id 14.3.487.0; Sat, 30 May
 2020 09:30:11 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20200529092947.7890-1-yuchao0@huawei.com>
 <20200529223426.GA249109@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <96ba756e-a354-1ee8-689e-211f63c294e6@huawei.com>
Date: Sat, 30 May 2020 09:30:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200529223426.GA249109@google.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.32 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jeqKL-000NwW-Ky
Subject: Re: [f2fs-dev] [PATCH] Revert "f2fs: fix quota_sync failure due to
 f2fs_lock_op"
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

On 2020/5/30 6:34, Jaegeuk Kim wrote:
> On 05/29, Chao Yu wrote:
>> Under heavy fsstress, we may triggle panic while issuing discard,
>> because __check_sit_bitmap() detects that discard command may earse
>> valid data blocks, the root cause is as below race stack described,
>> since we removed lock when flushing quota data, quota data writeback
>> may race with write_checkpoint(), so that it causes inconsistency in
>> between cached discard entry and segment bitmap.
>>
>> - f2fs_write_checkpoint
>>  - block_operations
>>   - set_sbi_flag(sbi, SBI_QUOTA_SKIP_FLUSH)
>>  - f2fs_flush_sit_entries
>>   - add_discard_addrs
>>    - __set_bit_le(i, (void *)de->discard_map);
>> 						- f2fs_write_data_pages
>> 						 - f2fs_write_single_data_page
>> 						   : inode is quota one, cp_rwsem won't be locked
>> 						  - f2fs_do_write_data_page
>> 						   - f2fs_allocate_data_block
>> 						    - f2fs_wait_discard_bio
>> 						      : discard entry has not been added yet.
>> 						    - update_sit_entry
>>  - f2fs_clear_prefree_segments
>>   - f2fs_issue_discard
>>   : add discard entry
>>
>> This patch fixes this issue by reverting 435cbab95e39 ("f2fs: fix quota_sync
>> failure due to f2fs_lock_op").
>>
>> Fixes: 435cbab95e39 ("f2fs: fix quota_sync failure due to f2fs_lock_op")
> 
> The previous patch fixes quota_sync gets EAGAIN all the time.
> How about this? It seems this works for fsstress test.
> 
> ---
>  fs/f2fs/segment.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index ebbadde6cbced..f67cffc38975e 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -3095,6 +3095,14 @@ void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
>  	struct curseg_info *curseg = CURSEG_I(sbi, type);
>  	bool put_pin_sem = false;
>  
> +	/*
> +	 * We need to wait for node_write to avoid block allocation during
> +	 * checkpoint. This can only happen to quota writes which can cause
> +	 * the below discard race condition.
> +	 */
> +	if (IS_DATASEG(type))

type is CURSEG_COLD_DATA_PINNED, IS_DATASEG(CURSEG_COLD_DATA_PINNED) should be false,
then node_write lock will not be held, later type will be updated to CURSEG_COLD_DATA,
then we will try to release node_write.

Thanks,

> +		down_write(&sbi->node_write);
> +
>  	if (type == CURSEG_COLD_DATA) {
>  		/* GC during CURSEG_COLD_DATA_PINNED allocation */
>  		if (down_read_trylock(&sbi->pin_sem)) {
> @@ -3174,6 +3182,9 @@ void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
>  
>  	if (put_pin_sem)
>  		up_read(&sbi->pin_sem);
> +
> +	if (IS_DATASEG(type))
> +		up_write(&sbi->node_write);
>  }
>  
>  static void update_device_state(struct f2fs_io_info *fio)
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
