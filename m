Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FA010DCED
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 30 Nov 2019 08:27:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iaxAT-0005Re-8R; Sat, 30 Nov 2019 07:27:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1iaxAP-0005RS-9O
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 30 Nov 2019 07:27:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+I+QoANEQOGPuT0wmkP3fOlpNljp5Q1rz19/BqUttYQ=; b=UIPAaqSV9Q5bcJ7lGMtEqhYVA4
 s4d6+DRaIt3dP1q0IumG5g15PceZeAZxyvu/8cSvniVAGTi6dtzz5ttHNQl8Ht0Iq0I3CdNCfI7gN
 W/caqfVn3Xq+n8wi1h6c/MR/5h133s7Xnpux34WDbjXWmDrjBVgkwX8BkNlhuaC+1izg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+I+QoANEQOGPuT0wmkP3fOlpNljp5Q1rz19/BqUttYQ=; b=i4Z0Qn7bihj3AaOP9+YQymvkQ+
 UzC9NFuVhmUxxVeYLJ2GPipxaGWQDMuJfRkJtyUQrboQ/Ov0uFte+nqGi8qCVLZt9uLeK8NXS4mQJ
 wv3vIxTYLbIhT3luS5N9X4o4IBG2DvQBRPX3oSiN5sjAaE5XzX31za5sd8pRejw6detA=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iaxAN-000Lwd-Q5
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 30 Nov 2019 07:27:45 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 83080E6B1FE2ADD81028;
 Sat, 30 Nov 2019 15:27:32 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.205) with Microsoft SMTP Server (TLS) id 14.3.439.0; Sat, 30 Nov
 2019 15:27:29 +0800
To: Ritesh Harjani <riteshh@linux.ibm.com>, Damien Le Moal
 <Damien.LeMoal@wdc.com>, "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20191126075719.1046485-1-damien.lemoal@wdc.com>
 <20191126083443.F1FD5A405B@b06wcsmtp001.portsmouth.uk.ibm.com>
 <BYAPR04MB5816C82F708612381216895BE7470@BYAPR04MB5816.namprd04.prod.outlook.com>
 <20191128102033.6085952057@d06av21.portsmouth.uk.ibm.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <ad311ee5-fe8f-9fbc-1e7a-7bfc379d268c@huawei.com>
Date: Sat, 30 Nov 2019 15:27:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20191128102033.6085952057@d06av21.portsmouth.uk.ibm.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: wdc.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iaxAN-000Lwd-Q5
Subject: Re: [f2fs-dev] [PATCH] f2fs: Fix direct IO handling
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
Cc: Javier Gonzalez <javier@javigon.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/11/28 18:20, Ritesh Harjani wrote:
> 
> 
> On 11/28/19 7:40 AM, Damien Le Moal wrote:
>> On 2019/11/26 17:34, Ritesh Harjani wrote:
>>> Hello Damien,
>>>
>>> IIUC, you are trying to fix a stale data read by DIO read for the case
>>> you explained in your patch w.r.t. DIO-write forced to write as buffIO.
>>>
>>> Coincidentally I was just looking at the same code path just now.
>>> So I do have a query to you/f2fs group. Below could be silly one, as I
>>> don't understand F2FS in great detail.
>>>
>>> How is the stale data by DIO read, is protected against a mmap
>>> writes via f2fs_vm_page_mkwrite?
>>>
>>> f2fs_vm_page_mkwrite()		 f2fs_direct_IO (read)
>>> 					filemap_write_and_wait_range()
>>> 	-> f2fs_get_blocks()				
>>> 					 -> submit_bio()
>>>
>>> 	-> set_page_dirty()
>>>
>>> Is above race possible with current f2fs code?
>>> i.e. f2fs_direct_IO could read the stale data from the blocks
>>> which were allocated due to mmap fault?
>>
>> The faulted page is locked until the fault is fully processed so direct
>> IO has to wait for that to complete first.
> 
> How about below parallelism?
> 
>   f2fs_vm_page_mkwrite()		 f2fs_direct_IO (read)
>   					filemap_write_and_wait_range()
> 	-> down_read(->i_mmap_sem);
> 	-> lock_page()
> 	-> f2fs_get_blocks()				
>   					 -> submit_bio()
> 
>   	-> set_page_dirty()
> 
> Can above DIO read not expose the stale data from block which was
> allocated in f2fs_vm_page_mkwrite path?

The race can happen, however I doubt the race condition is more complicated
as I described in previous reply of mine, could you check that?

Thanks,

> 
> 
>>
>>>
>>> Am I missing something here?
>>>
>>> -ritesh
>>>
>>> On 11/26/19 1:27 PM, Damien Le Moal wrote:
>>>> f2fs_preallocate_blocks() identifies direct IOs using the IOCB_DIRECT
>>>> flag for a kiocb structure. However, the file system direct IO handler
>>>> function f2fs_direct_IO() may have decided that a direct IO has to be
>>>> exececuted as a buffered IO using the function f2fs_force_buffered_io().
>>>> This is the case for instance for volumes including zoned block device
>>>> and for unaligned write IOs with LFS mode enabled.
>>>>
>>>> These 2 different methods of identifying direct IOs can result in
>>>> inconsistencies generating stale data access for direct reads after a
>>>> direct IO write that is treated as a buffered write. Fix this
>>>> inconsistency by combining the IOCB_DIRECT flag test with the result
>>>> of f2fs_force_buffered_io().
>>>>
>>>> Reported-by: Javier Gonzalez <javier@javigon.com>
>>>> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
>>>> ---
>>>>    fs/f2fs/data.c | 4 +++-
>>>>    1 file changed, 3 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
>>>> index 5755e897a5f0..8ac2d3b70022 100644
>>>> --- a/fs/f2fs/data.c
>>>> +++ b/fs/f2fs/data.c
>>>> @@ -1073,6 +1073,8 @@ int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *from)
>>>>    	int flag;
>>>>    	int err = 0;
>>>>    	bool direct_io = iocb->ki_flags & IOCB_DIRECT;
>>>> +	bool do_direct_io = direct_io &&
>>>> +		!f2fs_force_buffered_io(inode, iocb, from);
>>>>    
>>>>    	/* convert inline data for Direct I/O*/
>>>>    	if (direct_io) {
>>>> @@ -1081,7 +1083,7 @@ int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *from)
>>>>    			return err;
>>>>    	}
>>>>    
>>>> -	if (direct_io && allow_outplace_dio(inode, iocb, from))
>>>> +	if (do_direct_io && allow_outplace_dio(inode, iocb, from))
>>>>    		return 0;
>>>>    
>>>>    	if (is_inode_flag_set(inode, FI_NO_PREALLOC))
>>>>
>>>
>>>
>>
>>
> 
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
