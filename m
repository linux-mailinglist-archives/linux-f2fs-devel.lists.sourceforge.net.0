Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BCF8C60DD
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 May 2024 08:39:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s78Hv-0008LU-UT;
	Wed, 15 May 2024 06:38:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1s78Hv-0008LM-5x
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 May 2024 06:38:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=o7jgdSrY+9B9aEOXq5wEUT5KkFZIpbQond31E/9LuBw=; b=FOm96g3Tm52q7cmx8N6h7Fi0fx
 gZEwPzfCXF1s+fldbuZyvF4hybfzXKH/bM6S/DW+4ZT9QTU2S/Ve5t1J87IRqW0GyQoBNxlSV34Jw
 woNZ4IFIDkU/JKfcAjMrKVZI5ZAlzaqe+2HapF9da7rOIv3ZgVRpULR2PGn/UfG3wyms=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=o7jgdSrY+9B9aEOXq5wEUT5KkFZIpbQond31E/9LuBw=; b=F7wSWRA0YXq22PPZZt6Ui0kH6o
 xVVD0MMgyLByulNiN07SsRpHJx65ZDVgo6CGfNrBYIkgmzQ8ltE+Cukq9dA/uHEoQKHWMKdzI+SIt
 QeI3V1W9l+j8Mk/imUYFsmtcxlkZrly2gw+to2+6gZ6ZDQ9tWsIphynxCOrR7ae69YWk=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1s78Hv-0007sT-D1 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 May 2024 06:38:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 06162612DC
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 15 May 2024 06:38:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A090DC116B1;
 Wed, 15 May 2024 06:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715755123;
 bh=DUBK5FSNdWNxIcO5szuLJHHIpvf4ofWE4u9LBUSeSS0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=kw38awkeWt7DClqOHsChHLNDfetR+rpkBv+orOciCmrKvdkwDHPf7OujHxpx2EKAj
 98n7e5GAEVyEPuQ4kPOaU7KbCmX3XVZfVe9MdfDgqUX5Jwh8RtKbV7TzGC5tV8yYCl
 QGgb/n8B3o8SXbNkOQiKagom5oRlwAHyuxtY/GZXLjpxsT0psyK/GgVVCsWmKQ/zAm
 viUXgxZZFYISGJgASO4r+dhIncFalX47rtSeXV0hN2cVrN/+qdWvdM6Xyz2ssN9bGR
 KBY+PmXmx/50GaUpkAiREXmC75q3ufVZbxCFjS3B9ZAPXIkAmVvV9kM85q0nIJJXG/
 9/9OIG00LuvQw==
Message-ID: <efae597c-d334-498b-9050-1a21bf40e21d@kernel.org>
Date: Wed, 15 May 2024 14:38:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20240510023906.281700-1-chao@kernel.org>
 <ZkOMwKAcKmEPQ4Xz@google.com>
 <fc0d8b1f-0c54-4447-8ceb-3722645f71c2@kernel.org>
 <ZkQ9Uo5713Xpr2n7@google.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <ZkQ9Uo5713Xpr2n7@google.com>
X-Spam-Score: -1.2 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/5/15 12:42, Jaegeuk Kim wrote: > On 05/15, Chao Yu
 wrote: >> On 2024/5/15 0:09, Jaegeuk Kim wrote: >>> On 05/10, Chao Yu wrote:
 >>>> If lfs mode is on, buffered read may race w/ OPU dio write [...] 
 Content analysis details:   (-1.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -1.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1s78Hv-0007sT-D1
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix to avoid racing in between read
 and OPU dio write
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/5/15 12:42, Jaegeuk Kim wrote:
> On 05/15, Chao Yu wrote:
>> On 2024/5/15 0:09, Jaegeuk Kim wrote:
>>> On 05/10, Chao Yu wrote:
>>>> If lfs mode is on, buffered read may race w/ OPU dio write as below,
>>>> it may cause buffered read hits unwritten data unexpectly, and for
>>>> dio read, the race condition exists as well.
>>>>
>>>> Thread A                      Thread B
>>>> - f2fs_file_write_iter
>>>>    - f2fs_dio_write_iter
>>>>     - __iomap_dio_rw
>>>>      - f2fs_iomap_begin
>>>>       - f2fs_map_blocks
>>>>        - __allocate_data_block
>>>>         - allocated blkaddr #x
>>>>          - iomap_dio_submit_bio
>>>>                                 - f2fs_file_read_iter
>>>>                                  - filemap_read
>>>>                                   - f2fs_read_data_folio
>>>>                                    - f2fs_mpage_readpages
>>>>                                     - f2fs_map_blocks
>>>>                                      : get blkaddr #x
>>>>                                     - f2fs_submit_read_bio
>>>>                                 IRQ
>>>>                                 - f2fs_read_end_io
>>>>                                  : read IO on blkaddr #x complete
>>>> IRQ
>>>> - iomap_dio_bio_end_io
>>>>    : direct write IO on blkaddr #x complete
>>>>
>>>> This patch introduces a new per-inode i_opu_rwsem lock to avoid
>>>> such race condition.
>>>
>>> Wasn't this supposed to be managed by user-land?
>>
>> Actually, the test case is:
>>
>> 1. mount w/ lfs mode
>> 2. touch file;
>> 3. initialize file w/ 4k zeroed data; fsync;
>> 4. continue triggering dio write 4k zeroed data to file;
>> 5. and meanwhile, continue triggering buf/dio 4k read in file,
>> use md5sum to verify the 4k data;
>>
>> It expects data is all zero, however it turned out it's not.
> 
> Can we check outstanding write bios instead of abusing locks?

I didn't figure out a way to solve this w/o lock, due to:
- write bios can be issued after outstanding write bios check condition,
result in the race.
- once read() detects that there are outstanding write bios, we need to
delay read flow rather than fail it, right? It looks using a lock is more
proper here?

Any suggestion?

Thanks,

> 
>>
>> Thanks,
>>
>>>
>>>>
>>>> Fixes: f847c699cff3 ("f2fs: allow out-place-update for direct IO in LFS mode")
>>>> Signed-off-by: Chao Yu <chao@kernel.org>
>>>> ---
>>>> v2:
>>>> - fix to cover dio read path w/ i_opu_rwsem as well.
>>>>    fs/f2fs/f2fs.h  |  1 +
>>>>    fs/f2fs/file.c  | 28 ++++++++++++++++++++++++++--
>>>>    fs/f2fs/super.c |  1 +
>>>>    3 files changed, 28 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>>>> index 30058e16a5d0..91cf4b3d6bc6 100644
>>>> --- a/fs/f2fs/f2fs.h
>>>> +++ b/fs/f2fs/f2fs.h
>>>> @@ -847,6 +847,7 @@ struct f2fs_inode_info {
>>>>         /* avoid racing between foreground op and gc */
>>>>         struct f2fs_rwsem i_gc_rwsem[2];
>>>>         struct f2fs_rwsem i_xattr_sem; /* avoid racing between reading and changing EAs */
>>>> +     struct f2fs_rwsem i_opu_rwsem;  /* avoid racing between buf read and opu dio write */
>>>>
>>>>         int i_extra_isize;              /* size of extra space located in i_addr */
>>>>         kprojid_t i_projid;             /* id for project quota */
>>>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>>>> index 72ce1a522fb2..4ec260af321f 100644
>>>> --- a/fs/f2fs/file.c
>>>> +++ b/fs/f2fs/file.c
>>>> @@ -4445,6 +4445,7 @@ static ssize_t f2fs_dio_read_iter(struct kiocb *iocb, struct iov_iter *to)
>>>>         const loff_t pos = iocb->ki_pos;
>>>>         const size_t count = iov_iter_count(to);
>>>>         struct iomap_dio *dio;
>>>> +     bool do_opu = f2fs_lfs_mode(sbi);
>>>>         ssize_t ret;
>>>>
>>>>         if (count == 0)
>>>> @@ -4457,8 +4458,14 @@ static ssize_t f2fs_dio_read_iter(struct kiocb *iocb, struct iov_iter *to)
>>>>                         ret = -EAGAIN;
>>>>                         goto out;
>>>>                 }
>>>> +             if (do_opu && !f2fs_down_read_trylock(&fi->i_opu_rwsem)) {
>>>> +                     f2fs_up_read(&fi->i_gc_rwsem[READ]);
>>>> +                     ret = -EAGAIN;
>>>> +                     goto out;
>>>> +             }
>>>>         } else {
>>>>                 f2fs_down_read(&fi->i_gc_rwsem[READ]);
>>>> +             f2fs_down_read(&fi->i_opu_rwsem);
>>>>         }
>>>>
>>>>         /*
>>>> @@ -4477,6 +4484,7 @@ static ssize_t f2fs_dio_read_iter(struct kiocb *iocb, struct iov_iter *to)
>>>>                 ret = iomap_dio_complete(dio);
>>>>         }
>>>>
>>>> +     f2fs_up_read(&fi->i_opu_rwsem);
>>>>         f2fs_up_read(&fi->i_gc_rwsem[READ]);
>>>>
>>>>         file_accessed(file);
>>>> @@ -4523,7 +4531,13 @@ static ssize_t f2fs_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
>>>>         if (f2fs_should_use_dio(inode, iocb, to)) {
>>>>                 ret = f2fs_dio_read_iter(iocb, to);
>>>>         } else {
>>>> +             bool do_opu = f2fs_lfs_mode(F2FS_I_SB(inode));
>>>> +
>>>> +             if (do_opu)
>>>> +                     f2fs_down_read(&F2FS_I(inode)->i_opu_rwsem);
>>>>                 ret = filemap_read(iocb, to, 0);
>>>> +             if (do_opu)
>>>> +                     f2fs_up_read(&F2FS_I(inode)->i_opu_rwsem);
>>>>                 if (ret > 0)
>>>>                         f2fs_update_iostat(F2FS_I_SB(inode), inode,
>>>>                                                 APP_BUFFERED_READ_IO, ret);
>>>> @@ -4748,14 +4762,22 @@ static ssize_t f2fs_dio_write_iter(struct kiocb *iocb, struct iov_iter *from,
>>>>                         ret = -EAGAIN;
>>>>                         goto out;
>>>>                 }
>>>> +             if (do_opu && !f2fs_down_write_trylock(&fi->i_opu_rwsem)) {
>>>> +                     f2fs_up_read(&fi->i_gc_rwsem[READ]);
>>>> +                     f2fs_up_read(&fi->i_gc_rwsem[WRITE]);
>>>> +                     ret = -EAGAIN;
>>>> +                     goto out;
>>>> +             }
>>>>         } else {
>>>>                 ret = f2fs_convert_inline_inode(inode);
>>>>                 if (ret)
>>>>                         goto out;
>>>>
>>>>                 f2fs_down_read(&fi->i_gc_rwsem[WRITE]);
>>>> -             if (do_opu)
>>>> +             if (do_opu) {
>>>>                         f2fs_down_read(&fi->i_gc_rwsem[READ]);
>>>> +                     f2fs_down_write(&fi->i_opu_rwsem);
>>>> +             }
>>>>         }
>>>>
>>>>         /*
>>>> @@ -4779,8 +4801,10 @@ static ssize_t f2fs_dio_write_iter(struct kiocb *iocb, struct iov_iter *from,
>>>>                 ret = iomap_dio_complete(dio);
>>>>         }
>>>>
>>>> -     if (do_opu)
>>>> +     if (do_opu) {
>>>> +             f2fs_up_write(&fi->i_opu_rwsem);
>>>>                 f2fs_up_read(&fi->i_gc_rwsem[READ]);
>>>> +     }
>>>>         f2fs_up_read(&fi->i_gc_rwsem[WRITE]);
>>>>
>>>>         if (ret < 0)
>>>> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
>>>> index daf2c4dbe150..b4ed3b094366 100644
>>>> --- a/fs/f2fs/super.c
>>>> +++ b/fs/f2fs/super.c
>>>> @@ -1428,6 +1428,7 @@ static struct inode *f2fs_alloc_inode(struct super_block *sb)
>>>>         init_f2fs_rwsem(&fi->i_gc_rwsem[READ]);
>>>>         init_f2fs_rwsem(&fi->i_gc_rwsem[WRITE]);
>>>>         init_f2fs_rwsem(&fi->i_xattr_sem);
>>>> +     init_f2fs_rwsem(&fi->i_opu_rwsem);
>>>>
>>>>         /* Will be used by directory only */
>>>>         fi->i_dir_level = F2FS_SB(sb)->dir_level;
>>>> --
>>>> 2.40.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
