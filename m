Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4873BD77A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 Jul 2021 15:12:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m0ksK-0005oA-DF; Tue, 06 Jul 2021 13:12:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <changfengnan@vivo.com>) id 1m0ksJ-0005o3-5D
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 06 Jul 2021 13:12:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=o/6hvggspfZ96IWwrz44vFHFIlnITiJ8TZChkVfeg2E=; b=MinWvk5NQcPaqOGc35POP0IZq0
 dPbgZ7u7LnesVLReeDnfbt9HXK1onV21NRqPeaXuyZ7T/be01pluCKoJX5zFQnZI7jZmZqqksv7H5
 VDYpT9rSFmSquV+iaaFhfeYQZli861i/bGD5P3nTOkt89fOtL/6adgMgzjp7kdEKXu38=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=o/6hvggspfZ96IWwrz44vFHFIlnITiJ8TZChkVfeg2E=; b=IwamF2kJFvhT+mHOPu30nX1MV8
 GbrRVT7fRIscn3ngwRG5JnAC0gmE9IyOY7ifMwhRVIL7PrT+5VXtympPxIhdwaPvbTIur7ZOsD+7S
 WmQx3KtjiK3PwIKz9KTWmLb96tvb6C/A3cXrsyOyreSzxnP2spCkL4YVEsAOo7z+uTaA=;
Received: from mail-m121144.qiye.163.com ([115.236.121.144])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m0ks6-000079-MA
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 06 Jul 2021 13:12:31 +0000
DKIM-Signature: a=rsa-sha256;
 b=cyZJ1NrjxIHM0tly3RHgtKGV3Ul31DjpAESETT8QeLLJAjIRkvNqlnO7RX1KHSu6394xWsYJa/pCPh0c+zjan+N8e/RuuoPjki8hoJfTyG0Dhw9VcKFwh+Ep35dN0cM+9IYNlohm+x/WsVHpG0alOIs+347SGjoSiVnZJ85O/J0=;
 c=relaxed/relaxed; s=default; d=vivo.com; v=1;
 bh=o/6hvggspfZ96IWwrz44vFHFIlnITiJ8TZChkVfeg2E=;
 h=date:mime-version:subject:message-id:from;
Received: from [172.25.44.145] (unknown [58.251.74.232])
 by mail-m121144.qiye.163.com (Hmail) with ESMTPA id B5C95AC0293;
 Tue,  6 Jul 2021 21:12:09 +0800 (CST)
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <003001d75913$aff3cc40$0fdb64c0$@vivo.com>
 <YN32CHiLz0lbpwMF@google.com> <de2c95be-e00d-205e-4b57-b168fbaaf9d0@vivo.com>
 <YN6xGCuGY9xjtAYw@google.com>
From: Fengnan Chang <changfengnan@vivo.com>
Message-ID: <84b06211-afe6-443d-ff2f-211a8a262b54@vivo.com>
Date: Tue, 6 Jul 2021 21:12:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YN6xGCuGY9xjtAYw@google.com>
Content-Language: en-US
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZGU9OHlZDTx8fSk9OSkoZTRpVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
 hKQ1VLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Kzo6TRw5Cz9MDB88FTgDQior
 SR5PCi1VSlVKTUlOTkxMSkhLSk5KVTMWGhIXVRgTGhUcHR4VHBUaFTsNEg0UVRgUFkVZV1kSC1lB
 WU5DVUlOSlVMT1VJSElZV1kIAVlBT0JITzcG
X-HM-Tid: 0a7a7bf28774b039kuuub5c95ac0293
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [115.236.121.144 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [115.236.121.144 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.1 DKIM_INVALID           DKIM or DK signature exists, but is not valid
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1m0ks6-000079-MA
Subject: Re: [f2fs-dev] f2fs compress performance problem
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

I did more test on random overwrite, I set write size equal to cluster 
size, make sure always write one cluster, no cross cluster write and 
merge this patch 
https://lore.kernel.org/linux-f2fs-devel/6bd41278-0de8-5119-6857-0478c641cf71@vivo.com/T/#t 
,
it can up to 45% of original. This would seem to indicate that there are 
reasons other than the need for read whole cluster and rewrite it.
	


On 2021/7/2 14:24, Jaegeuk Kim wrote:
> On 07/02, Fengnan Chang wrote:
>> Yes, I had enable compress_cache and extent_cache, compress_cache indeed can
>> improve random read performance, but couldn't improve other test case.And
>> extent_cache was default enabled in my test.
> 
> Sorry, we enabled extent_cache for RO partition only.
> 
> static inline bool f2fs_may_extent_tree(struct inode *inode)
> {
> 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> 
> 	if (!test_opt(sbi, EXTENT_CACHE) ||
> 			is_inode_flag_set(inode, FI_NO_EXTENT) ||
> 			(is_inode_flag_set(inode, FI_COMPRESSED_FILE) &&
> 			 !f2fs_sb_has_readonly(sbi)))
> 		return false;
> ...
> 
> 
>>
>>
>> Fix the description of the previous email:
>>   4. 4K random overwrite has dropped to 1% of original, yes only 1% of
>> original, I found  open file with O_WRONLY|O_DSYNC|O_DIRECT is an important
>> reason, every time sync a compress inode need do checkpoint, after I remove
>> checkpoint on compress inode, up to 10% of original. If I set write size
>> equal to cluster size,  it can up to 35% of original. And I think major
>> reason of this is we need read whole cluster and rewrite it , I've been
>> trying to get around this restriction recently, but haven't made any
>> progress yet.
>>
>> Thanks.
>>
>> On 2021/7/2 1:06, Jaegeuk Kim wrote:
>>> On 06/04, changfengnan@vivo.com wrote:
>>>> Hi:
>>>>
>>>> I've been working on f2fs compression for a while, I'm confused on f2fs
>>>> compression performance, after a while reserch,
>>>> I found some problem, maybe need some discuss.
>>>> I use AndroBench test performance on mobile, after enable compression, the
>>>> benchmark scores have dropped a lot.
>>>> Specifically:
>>>> 1. 32M sequential read has dropped to 50% of original. Test case open file
>>>> with O_RDONLY|O_DIRECT, and set POSIX_FADV_RANDOM, the major resaon
>>>> is disable readahed. For now,I didn't found any patch can improve this.
>>>> 2. 4K random read has dropped to 40% of original, after merge `f2fs:
>>>> compress: add compress_inode to cache compressed blocks`,
>>>> significant improvement in random read performance, up to 90% of original,
>>>> maybe more.
>>>> 3. 32M sequential overwrite has dropped to 10% of original, after merge
>>>> `f2fs: compress: remove unneeded read when rewrite whole cluster`
>>>> up to 30% of original.
>>>> 4. 4K random read has dropped to 1% of original, yes only 1% of original, I
>>>> found  open file with O_WRONLY|O_DSYNC|O_DIRECT is  an important reason,
>>>> every time sync a compress inode need do checkpoint, after I remove
>>>> checkpoint on compress inode, up to 10% of original. And I think major
>>>> reason of this
>>>> is we need read whole cluster and rewrite it ,but I did't think of any
>>>> method to improve this.
>>>>
>>>> I want to know is there any idea can help to improve this.
>>>> And I want to know do we have goal for the performance of compression, is it
>>>> possible to achieve the original performance?
>>>
>>> Could you please check compress_cache and extent_cache that can improve read
>>> performance? Both were done quite recently.
>>>
>>>>
>>>> Thanks.
>>>
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
