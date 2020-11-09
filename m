Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 376402AAF7C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  9 Nov 2020 03:30:02 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kbwwI-0002Xl-Dp; Mon, 09 Nov 2020 02:29:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kbwwG-0002Xc-DA
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Nov 2020 02:29:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c8/+l1IjT87X5nZchP06/OwVlPtm+F0sy/jz7F2sAnk=; b=JkfGM64iZ0dJ9sg+jc56L/efCA
 5XXmzAezjWQBzouVBU5cEbDXFVZsimRPwnFpVhOK9zlYNI6/s2R8Wyy/yAasSINpDJ0OFqhJ31rx9
 2BsEQjuQvxxFcfoM64Qve2dsRfc1V6p3R8gUzTnuPZU2l4ZpwnbGZxHSRJ9ZzRGdF3dc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=c8/+l1IjT87X5nZchP06/OwVlPtm+F0sy/jz7F2sAnk=; b=kkjWPebdk+bXnkVP0TBAySHblY
 wDNRJF4SbXOVeFauwer/Tjq7YYWfL4PU2brNoN5pqKaS8W5ktFj5bjBfUYklghlN6FzPJykQEu48t
 fmJWMLcy5jXvMoLDFOlWxfTUc0yrdnF+xupj2Cnt3LkVsEhoCBmCDPFXhxNayR4fbY0E=;
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kbwwA-00Dods-Ls
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Nov 2020 02:29:48 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4CTw1L1NDxzhjDT;
 Mon,  9 Nov 2020 10:29:26 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.205) with Microsoft SMTP Server (TLS) id 14.3.487.0; Mon, 9 Nov 2020
 10:29:25 +0800
To: Eric Biggers <ebiggers@kernel.org>, Chao Yu <chao@kernel.org>
References: <20201106065331.76236-1-yuchao0@huawei.com>
 <20201106180324.GA78548@sol.localdomain>
 <a7e78b61-021a-444d-eb36-68ce7aae133e@kernel.org>
 <20201107171635.GA841@sol.localdomain>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <63efaa5c-bc19-4b16-653d-840bc6a6d9d1@huawei.com>
Date: Mon, 9 Nov 2020 10:29:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20201107171635.GA841@sol.localdomain>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.32 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kbwwA-00Dods-Ls
Subject: Re: [f2fs-dev] [PATCH v4 2/2] f2fs: fix compat F2FS_IOC_{MOVE,
 GARBAGE_COLLECT}_RANGE
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/11/8 1:16, Eric Biggers wrote:
> On Sat, Nov 07, 2020 at 05:25:23PM +0800, Chao Yu wrote:
>> On 2020/11/7 2:03, Eric Biggers wrote:
>>> On Fri, Nov 06, 2020 at 02:53:31PM +0800, Chao Yu wrote:
>>>> +#if defined(__KERNEL__)
>>>> +struct compat_f2fs_gc_range {
>>>> +	u32 sync;
>>>> +	compat_u64 start;
>>>> +	compat_u64 len;
>>>> +};
>>>
>>> There's no need to use '#if defined(__KERNEL__)' in kernel source files.
>>>
>>> Likewise for compat_f2fs_move_range.
>>
>> Correct.
>>
>>>
>>>> +static int f2fs_compat_ioc_gc_range(struct file *file, unsigned long arg)
>>>> +{
>>>> +	struct f2fs_sb_info *sbi = F2FS_I_SB(file_inode(file));
>>>> +	struct compat_f2fs_gc_range __user *urange;
>>>> +	struct f2fs_gc_range range;
>>>> +	int err;
>>>> +
>>>> +	if (unlikely(f2fs_cp_error(sbi)))
>>>> +		return -EIO;
>>>> +	if (!f2fs_is_checkpoint_ready(sbi))
>>>> +		return -ENOSPC;
>>>
>>> I still don't understand why this checkpoint-related stuff is getting added
>>> here, and only to the compat versions of the ioctls.  It wasn't in the original
>>> version.  If they are needed then they should be added to __f2fs_ioc_gc_range()
>>> and __f2fs_ioc_move_range() (preferably by a separate patch) so that they are
>>
>> If so, cp-related stuff will be checked redundantly in both f2fs_ioctl() and
>> __f2fs_ioc_xxx() function for native GC_RANGE and MOVE_RANGE ioctls, it's
>> not needed.
>>
> 
> Oh I see, the cp-related checks are at the beginning of f2fs_ioctl() too.
> 
> In that case a much better approach would be to add __f2fs_ioctl() which is
> called by f2fs_ioctl() and f2fs_compat_ioctl(), and have f2fs_ioctl() and
> f2fs_compat_ioctl() do the cp-related checks but not __f2fs_ioctl().

Will this cleanup make sense to you?

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 458724c00d98..1439577108c2 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -4249,16 +4249,10 @@ struct compat_f2fs_gc_range {

  static int f2fs_compat_ioc_gc_range(struct file *file, unsigned long arg)
  {
-	struct f2fs_sb_info *sbi = F2FS_I_SB(file_inode(file));
  	struct compat_f2fs_gc_range __user *urange;
  	struct f2fs_gc_range range;
  	int err;

-	if (unlikely(f2fs_cp_error(sbi)))
-		return -EIO;
-	if (!f2fs_is_checkpoint_ready(sbi))
-		return -ENOSPC;
-
  	urange = compat_ptr(arg);
  	err = get_user(range.sync, &urange->sync);
  	err |= get_user(range.start, &urange->start);
@@ -4280,16 +4274,10 @@ struct compat_f2fs_move_range {

  static int f2fs_compat_ioc_move_range(struct file *file, unsigned long arg)
  {
-	struct f2fs_sb_info *sbi = F2FS_I_SB(file_inode(file));
  	struct compat_f2fs_move_range __user *urange;
  	struct f2fs_move_range range;
  	int err;

-	if (unlikely(f2fs_cp_error(sbi)))
-		return -EIO;
-	if (!f2fs_is_checkpoint_ready(sbi))
-		return -ENOSPC;
-
  	urange = compat_ptr(arg);
  	err = get_user(range.dst_fd, &urange->dst_fd);
  	err |= get_user(range.pos_in, &urange->pos_in);
@@ -4301,6 +4289,27 @@ static int f2fs_compat_ioc_move_range(struct file *file, unsigned long arg)
  	return __f2fs_ioc_move_range(file, &range);
  }

+static long __f2fs_compat_ioctl(struct file *file, unsigned int cmd,
+							unsigned long arg)
+{
+	struct f2fs_sb_info *sbi = F2FS_I_SB(file_inode(file));
+
+	if (unlikely(f2fs_cp_error(sbi)))
+		return -EIO;
+	if (!f2fs_is_checkpoint_ready(sbi))
+		return -ENOSPC;
+
+	switch (cmd) {
+	case F2FS_IOC32_GARBAGE_COLLECT_RANGE:
+		return f2fs_compat_ioc_gc_range(file, arg);
+	case F2FS_IOC32_MOVE_RANGE:
+		return f2fs_compat_ioc_move_range(file, arg);
+	default:
+		return -ENOIOCTLCMD;
+	}
+	return 0;
+}
+
  long f2fs_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
  {
  	switch (cmd) {
@@ -4314,9 +4323,8 @@ long f2fs_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
  		cmd = FS_IOC_GETVERSION;
  		break;
  	case F2FS_IOC32_GARBAGE_COLLECT_RANGE:
-		return f2fs_compat_ioc_gc_range(file, arg);
  	case F2FS_IOC32_MOVE_RANGE:
-		return f2fs_compat_ioc_move_range(file, arg);
+		return __f2fs_compat_ioctl(file, cmd, arg);
  	case F2FS_IOC_START_ATOMIC_WRITE:
  	case F2FS_IOC_COMMIT_ATOMIC_WRITE:
  	case F2FS_IOC_START_VOLATILE_WRITE:

Thanks,

> 
> I feel that's still not entirely correct, because ENOTTY should take precedence
> over EIO or ENOSPC from the cp-related stuff.  But at least it would be
> consistent between the native and compat ioctls, and the cp-related checks
> wouldn't have to be duplicated in random ioctls...
> 
> - Eric
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
