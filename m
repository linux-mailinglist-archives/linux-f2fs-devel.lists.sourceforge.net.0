Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FFC9B3D8
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Aug 2019 17:49:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i1BoT-0003CK-1C; Fri, 23 Aug 2019 15:49:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1i1BoR-0003CC-Ar
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 23 Aug 2019 15:49:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6Wxp5VKIB/KyLzLML73/Dr2c5sfy/Ij/SRrZhnNrjvU=; b=lYf1XhbFDDcqn+7wfMsbJHoOSW
 my7Ls7eCpQgbjW3bY0dlyeN0BwyxN/CP5lI4cI2ffKCU8X2jR8OztecC1E05pOrMUzg79rG6/AS/K
 w9XLJErDkL4WNo71Lx4I/fHBRPcMrJyY1DR4RBR0qYn1NIViG25K7TK/2j2K63sys7Mo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6Wxp5VKIB/KyLzLML73/Dr2c5sfy/Ij/SRrZhnNrjvU=; b=IHnTS/PuxPY5hCNEFxecBcxGog
 kyfAMdz4SVi4GMutVtnoctinmW4Xsy6jgwNo0TPy7D1MsOY8EGiewoXQyBqbSonheK96vwxU9h3k3
 +rd2VJRm7bt62HwjKou4ByiihqSOL4YspvqhFtmCT6jnxZWrOIiB3uIaDQUVFitmEowg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i1BoP-00Ha7p-W5
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 23 Aug 2019 15:49:15 +0000
Received: from [192.168.0.101] (unknown [180.111.132.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ADB0A21726;
 Fri, 23 Aug 2019 15:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566575348;
 bh=H+LeUoul4tM5XqbpRluU5z0iD9HCrNUgiMr7AnqOglQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=hHAqnrVsPM74tZbrWt9BfZ1fFwmGrTiE2hawzmTb1e8qN1QLdEf1/d5xsl5DwxKc3
 018XWYKF+I6N75NhIX5qK+XnT8Equ1zG5kpc+qNWUWlw2HgXmeGbPWIFsfwdY+M/lo
 cToTysCVaH9VHntZhYOVBxZQfEr85lI7JHYSkP20=
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>
References: <3bc8584e-651c-9578-c25a-40c60b5cfbdb@huawei.com>
 <dfd847fe-0c6d-f2a1-db50-d637a685d13b@huawei.com>
 <20190822194915.GB99916@jaegeuk-macbookpro.roam.corp.google.com>
 <ca722330-d7f4-4e6b-8129-ae48357db85a@huawei.com>
 <20190823150437.GB35310@jaegeuk-macbookpro.roam.corp.google.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <9d7b76fc-c116-d7e8-1988-41b4978eaa76@kernel.org>
Date: Fri, 23 Aug 2019 23:48:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190823150437.GB35310@jaegeuk-macbookpro.roam.corp.google.com>
Content-Language: en-US
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1i1BoP-00Ha7p-W5
Subject: Re: [f2fs-dev] f2fs_symlink bug
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
Cc: "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019-8-23 23:04, Jaegeuk Kim wrote:
> On 08/23, Chao Yu wrote:
>> On 2019/8/23 3:49, Jaegeuk Kim wrote:
>>> On 08/21, Chao Yu wrote:
>>>> Ping,
>>>>
>>>> On 2019/8/12 20:01, Chao Yu wrote:
>>>>> Hi Jaegeuk,
>>>>>
>>>>> In por_fsstress testcase, fsck reports below inconsistent status, I found one
>>>>> path can cause this case.
>>>>>
>>>>> [FIX] (fsck_chk_inode_blk:1002)  --> Symlink: recover 0x1425 with i_size=4096
>>>>> [ASSERT] (fsck_chk_inode_blk:1030)  --> ino: 0x1425 chksum:0x6983d47, but
>>>>> calculated one is: 0xdb284b35
>>>>> [FIX] (fsck_chk_inode_blk:1036)  --> ino: 0x1425 recover, i_inode_checksum=
>>>>> 0x6983d47 -> 0xdb284b35
>>>>>
>>>>> - f2fs_symlink
>>>>>  - page_symlink failed -> f2fs_write_failed() will truncate size to zero
>>>>>   - f2fs_unlink failed -> symlink inode w/o data will remain in fs
>>>>>
>>>>> Not sure, but one choice of fix is to treat symlink as fs meta like we did for
>>>>> directory, so that checkpoint can take care of all data/node of symlink, any
>>>>> thoughts?
>>>
>>> Hmm, how's the possible to get very long path name requiring another data block?
>>
>> It can with below script, which is actually existed case in fsstress.
>>
>> #!/bin/bash
>>
>> for (( i = 0; i < 4095; i++ )); do
>>         if [ $((i % 255)) -eq 0 ]
>>         then
>>                 filename=$filename"/"
>>         else
>>                 filename=$filename"0"
>>         fi
>> done
>>
>> ln -s $filename /f2fs_mount_point/symlink
>>
>>> If it's fitted in inline_data, it's more easy to guarantee that, right?
>>
>> If the length of symlink is 4095, not sure inline space is enough even we can
>> compress symlink...
> 
> I meant real usecases larger than 3.5KB. There's no posix rule to guarantee
> this. IOWs, it's known behavior across filesystems.

Correct, it looks not a big deal that whether we truncate i_size of symlink to
zero or not? how about avoiding such assert in fsck?

Thanks,

> 
>>
>> Thanks,
>>
>>>
>>>>>
>>>>>
>>>>> _______________________________________________
>>>>> Linux-f2fs-devel mailing list
>>>>> Linux-f2fs-devel@lists.sourceforge.net
>>>>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
>>>>> .
>>>>>
>>> .
>>>
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
