Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 74226156FB7
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 Feb 2020 07:58:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j131s-0006qj-Vf; Mon, 10 Feb 2020 06:58:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1j131p-0006qa-W2
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 10 Feb 2020 06:58:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Nnclcdc/cVcbLzCBA1T34E0JgRzgihazsIjmmae5xXk=; b=mihdP7pMdgsGI+7t5P63p+jKYI
 Xi6TJ8rJK8Pm6wS+pmmCQUYsPDxkDWZIydZ5HnLGQVTKEBEg2na2n5VXS5NV67zfWs+Aygmc1ofy3
 965K6Zi1yzropEhe0q6J36HjRkR7Njy0fMwJ2z8HZyw6g4azJ1gGYixriwgBAO5NiXNk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Nnclcdc/cVcbLzCBA1T34E0JgRzgihazsIjmmae5xXk=; b=k/3aUNAA+l9oIMWcK/VoiFlzfw
 y/WGG/+DjUMMaK+LEejZpt3DzcLGX+x+Xld613ZEu7WnS0yMW8GXbbNoAhIcnBN+cSMp3JzLKqgQ0
 CphJc8Dj7x8R5e34UyDJeayIG0OTviUVxhzHado6jrzj0ABZH4XArTU91zP6IlcQV+KA=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j131n-00GuOc-Kw
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 10 Feb 2020 06:58:45 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id CC4C6DCBC68D1ACC08DF;
 Mon, 10 Feb 2020 14:58:32 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.205) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 10 Feb
 2020 14:58:28 +0800
To: Ju Hyung Park <qkrwngud825@gmail.com>
References: <20191227104456.24528-1-yuchao0@huawei.com>
 <CAD14+f2jh5pfeW1Z2KTJLoWFivDbjH2SB3j9OVQ932WwBZZHjg@mail.gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <cccd9ef3-72b2-5f6c-a4aa-d03d1b56efb2@huawei.com>
Date: Mon, 10 Feb 2020 14:58:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAD14+f2jh5pfeW1Z2KTJLoWFivDbjH2SB3j9OVQ932WwBZZHjg@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j131n-00GuOc-Kw
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to add swap extent correctly
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Ju Hyung,

On 2020/2/7 14:42, Ju Hyung Park wrote:
> Hi Chao,
> 
> I think this should be sent to linux-stable.
> Thoughts?

Yup, I forgot to Cc stable mailing list, let me resend it.

Thanks for reminding me that.

Thanks,

> 
> Thanks.
> 
> On Fri, Dec 27, 2019 at 7:45 PM Chao Yu <yuchao0@huawei.com> wrote:
>>
>> As Youling reported in mailing list:
>>
>> https://www.linuxquestions.org/questions/linux-newbie-8/the-file-system-f2fs-is-broken-4175666043/
>>
>> https://www.linux.org/threads/the-file-system-f2fs-is-broken.26490/
>>
>> There is a test case can corrupt f2fs image:
>> - dd if=/dev/zero of=/swapfile bs=1M count=4096
>> - chmod 600 /swapfile
>> - mkswap /swapfile
>> - swapon --discard /swapfile
>>
>> The root cause is f2fs_swap_activate() intends to return zero value
>> to setup_swap_extents() to enable SWP_FS mode (swap file goes through
>> fs), in this flow, setup_swap_extents() setups swap extent with wrong
>> block address range, result in discard_swap() erasing incorrect address.
>>
>> Because f2fs_swap_activate() has pinned swapfile, its data block
>> address will not change, it's safe to let swap to handle IO through
>> raw device, so we can get rid of SWAP_FS mode and initial swap extents
>> inside f2fs_swap_activate(), by this way, later discard_swap() can trim
>> in right address range.
>>
>> Fixes: 4969c06a0d83 ("f2fs: support swap file w/ DIO")
>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
>> ---
>>  fs/f2fs/data.c | 32 +++++++++++++++++++++++++-------
>>  1 file changed, 25 insertions(+), 7 deletions(-)
>>
>> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
>> index 19cd03450066..ee4d3d284379 100644
>> --- a/fs/f2fs/data.c
>> +++ b/fs/f2fs/data.c
>> @@ -3608,7 +3608,8 @@ int f2fs_migrate_page(struct address_space *mapping,
>>
>>  #ifdef CONFIG_SWAP
>>  /* Copied from generic_swapfile_activate() to check any holes */
>> -static int check_swap_activate(struct file *swap_file, unsigned int max)
>> +static int check_swap_activate(struct swap_info_struct *sis,
>> +                               struct file *swap_file, sector_t *span)
>>  {
>>         struct address_space *mapping = swap_file->f_mapping;
>>         struct inode *inode = mapping->host;
>> @@ -3619,6 +3620,8 @@ static int check_swap_activate(struct file *swap_file, unsigned int max)
>>         sector_t last_block;
>>         sector_t lowest_block = -1;
>>         sector_t highest_block = 0;
>> +       int nr_extents = 0;
>> +       int ret;
>>
>>         blkbits = inode->i_blkbits;
>>         blocks_per_page = PAGE_SIZE >> blkbits;
>> @@ -3630,7 +3633,8 @@ static int check_swap_activate(struct file *swap_file, unsigned int max)
>>         probe_block = 0;
>>         page_no = 0;
>>         last_block = i_size_read(inode) >> blkbits;
>> -       while ((probe_block + blocks_per_page) <= last_block && page_no < max) {
>> +       while ((probe_block + blocks_per_page) <= last_block &&
>> +                       page_no < sis->max) {
>>                 unsigned block_in_page;
>>                 sector_t first_block;
>>
>> @@ -3670,13 +3674,27 @@ static int check_swap_activate(struct file *swap_file, unsigned int max)
>>                                 highest_block = first_block;
>>                 }
>>
>> +               /*
>> +                * We found a PAGE_SIZE-length, PAGE_SIZE-aligned run of blocks
>> +                */
>> +               ret = add_swap_extent(sis, page_no, 1, first_block);
>> +               if (ret < 0)
>> +                       goto out;
>> +               nr_extents += ret;
>>                 page_no++;
>>                 probe_block += blocks_per_page;
>>  reprobe:
>>                 continue;
>>         }
>> -       return 0;
>> -
>> +       ret = nr_extents;
>> +       *span = 1 + highest_block - lowest_block;
>> +       if (page_no == 0)
>> +               page_no = 1;    /* force Empty message */
>> +       sis->max = page_no;
>> +       sis->pages = page_no - 1;
>> +       sis->highest_bit = page_no - 1;
>> +out:
>> +       return ret;
>>  bad_bmap:
>>         pr_err("swapon: swapfile has holes\n");
>>         return -EINVAL;
>> @@ -3701,14 +3719,14 @@ static int f2fs_swap_activate(struct swap_info_struct *sis, struct file *file,
>>         if (f2fs_disable_compressed_file(inode))
>>                 return -EINVAL;
>>
>> -       ret = check_swap_activate(file, sis->max);
>> -       if (ret)
>> +       ret = check_swap_activate(sis, file, span);
>> +       if (ret < 0)
>>                 return ret;
>>
>>         set_inode_flag(inode, FI_PIN_FILE);
>>         f2fs_precache_extents(inode);
>>         f2fs_update_time(F2FS_I_SB(inode), REQ_TIME);
>> -       return 0;
>> +       return ret;
>>  }
>>
>>  static void f2fs_swap_deactivate(struct file *file)
>> --
>> 2.18.0.rc1
>>
>>
>>
>> _______________________________________________
>> Linux-f2fs-devel mailing list
>> Linux-f2fs-devel@lists.sourceforge.net
>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
