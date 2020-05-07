Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 232001C828C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  7 May 2020 08:30:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jWa3J-0000Mu-Fu; Thu, 07 May 2020 06:30:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jWa3G-0000Ml-JQ
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 07 May 2020 06:30:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:References:CC:To:From:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yqSoh2DJaHkC9IPUJwj92SckpM2ygjFt35IigY1LTww=; b=ZPTU57eYuEBGacTfjgpGa4ERv6
 LZ0Pl32/Anj0Cdy4FNUfFBrCAzBwn89OVpwW4X7tOXEAmoDbSGUIyM6IjK+imTxFuGqxOYO1MRxSE
 Z+wtm+YTeeYHFUKTDV5LV61flOQbEHAI+6Horp4csa9b0H8BdVZ4BgdxIGho2Z41yZHQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:References:CC:To:From:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yqSoh2DJaHkC9IPUJwj92SckpM2ygjFt35IigY1LTww=; b=WnDAq9aXjI37BHBHUkyFQi6J3O
 yEaHRw93cSxNJybTPJlvuGG1I2ytjqPx2dmUcgvUht7vrzYXZspBwN7Ydmm1kcGs/BQVWUjMGqpr5
 cz4uk3gvfCyv4bxLoYdoa9oKiKZ6mHLtozuDbuBOzbV7T8du8GSq7EzOTr7eTqMB4j04=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jWa3E-00HKH5-7Q
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 07 May 2020 06:30:34 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 3AD732D253226B4F4938;
 Thu,  7 May 2020 14:30:18 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.205) with Microsoft SMTP Server (TLS) id 14.3.487.0; Thu, 7 May 2020
 14:30:16 +0800
From: Chao Yu <yuchao0@huawei.com>
To: Eric Biggers <ebiggers@kernel.org>, Gao Xiang <hsiangkao@gmx.com>
References: <20200505153139.201697-1-jaegeuk@kernel.org>
 <20200505165847.GA98848@gmail.com> <20200505181323.GA55221@google.com>
 <20200505181941.GC98848@gmail.com>
 <20200506001403.GA2101@hsiangkao-HP-ZHAN-66-Pro-G1>
 <20200506012428.GG128280@sol.localdomain>
 <5641613f-48e0-171c-cfd0-e799e24d8d11@huawei.com>
Message-ID: <cfba83e1-bae7-bd14-f41a-0d6e54366f37@huawei.com>
Date: Thu, 7 May 2020 14:30:15 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <5641613f-48e0-171c-cfd0-e799e24d8d11@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jWa3E-00HKH5-7Q
Subject: Re: [f2fs-dev] [PATCH] f2fs: get parent inode when recovering pino
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/5/6 14:55, Chao Yu wrote:
> On 2020/5/6 9:24, Eric Biggers wrote:
>> On Wed, May 06, 2020 at 08:14:07AM +0800, Gao Xiang wrote:
>>>>
>>>> Actually, I think this is wrong because the fsync can be done via a file
>>>> descriptor that was opened to a now-deleted link to the file.
>>>
>>> I'm still confused about this...
>>>
>>> I don't know what's wrong with this version from my limited knowledge?
>>>  inode itself is locked when fsyncing, so
>>>
>>>    if the fsync inode->i_nlink == 1, this inode has only one hard link
>>>    (not deleted yet) and should belong to a single directory; and
>>>
>>>    the only one parent directory would not go away (not deleted as well)
>>>    since there are some dirents in it (not empty).
>>>
>>> Could kindly explain more so I would learn more about this scenario?
>>> Thanks a lot!
>>
>> i_nlink == 1 just means that there is one non-deleted link.  There can be links
>> that have since been deleted, and file descriptors can still be open to them.
>>
>>>
>>>>
>>>> We need to find the dentry whose parent directory is still exists, i.e. the
>>>> parent directory that is counting towards 'inode->i_nlink == 1'.
>>>
>>> directory counting towards 'inode->i_nlink == 1', what's happening?
>>
>> The non-deleted link is the one counted in i_nlink.
>>
>>>
>>>>
>>>> I think d_find_alias() is what we're looking for.
>>>
>>> It may be simply dentry->d_parent (stable/positive as you said before, and it's
>>> not empty). why need to d_find_alias()?
>>
>> Because we need to get the dentry that hasn't been deleted yet, which isn't
>> necessarily the one associated with the file descriptor being fsync()'ed.
>>
>>> And what is the original problem? I could not get some clue from the original
>>> patch description (I only saw some extra igrab/iput because of some unknown
>>> reasons), it there some backtrace related to the problem?
>>
>> The problem is that i_pino gets set incorrectly.  I just noticed this while
>> reviewing the code.  It's not hard to reproduce, e.g.:
>>
>> #include <unistd.h>
>> #include <fcntl.h>
>> #include <sys/stat.h>
>>
>> int main()
>> {
>>         int fd;
>>
>>         mkdir("dir1", 0700);
>>         mkdir("dir2", 0700);
>>         mknod("dir1/file", S_IFREG|0600, 0);
>>         link("dir1/file", "dir2/file");
>>         fd = open("dir2/file", O_WRONLY);
>>         unlink("dir2/file");
>>         write(fd, "X", 1);
>>         fsync(fd);
>> }
>>
>> Then:
>>
>> sync
>> echo N | dump.f2fs -i $(stat -c %i dir1/file) /dev/vdb | grep 'i_pino'
>> echo "dir1 (correct): $(stat -c %i dir1)"
>> echo "dir2 (wrong): $(stat -c %i dir2)"
>>
>> i_pino will point to dir2 rather than dir1 as expected.
> 
> Could you add above testcase into commit message of your patch? it will
> be easier to understand the issue we solved with it.
> 
> In addition, how about adding this testcase in fstest as a generic one?

Oops, it's not a generic one... please ignore this.

> 
>>
>> - Eric
>>
>>
>> _______________________________________________
>> Linux-f2fs-devel mailing list
>> Linux-f2fs-devel@lists.sourceforge.net
>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
>> .
>>
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
