Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C56313E4738
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  9 Aug 2021 16:08:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mD5xB-0003x5-GB; Mon, 09 Aug 2021 14:08:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <bugzilla-daemon@bugzilla.kernel.org>)
 id 1mD5xA-0003wy-Ah
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Aug 2021 14:08:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7MigzrMPTDp+8k9jlx10rSOWXzWJoDPSlu8sQRyynnE=; b=W5cA3DD9gqNC+UmWmWbaNLLj/W
 NoGPP3iRklnqH264GBzmo/4rXkOuEwmdGejLetOZGzIn4anp6dRR9Yl9w5VRqmZzYM3xP7PaHV9Gm
 /fp0o792otmkkR3/F2JZR0Sv51sX627Bwp8SfHAmHT99JrQM2I9WtwdyXn2G3mXrj+Mo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Date:
 Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=7MigzrMPTDp+8k9jlx10rSOWXzWJoDPSlu8sQRyynnE=; b=a
 09n2CKrDXYsYhSLqoaoAI8KdE4UctnClzLCGm9FpDpRWZZuF1KZ+nU7nEKMsxtQvf4a0s+NGTfFt4
 hG6VNLIGHGxnAzr1wz3E4Jh7FW2w/BUbul/NPeD8xgNIfgm0epMu0tHF9CpWyNTgbqQnCDQueNKq2
 ezx4bNDTPNUTnWrI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mD5x8-000dPD-9t
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Aug 2021 14:08:32 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 96F1260EC0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  9 Aug 2021 14:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628518097;
 bh=V+REVcfZSMaibb4D9v4zKsRkNP+iktTsMmRT5TX+Ar8=;
 h=From:To:Subject:Date:From;
 b=CBnfsuYytXEbZMs5I7iWH3DIOvyAy7CTqXHVjDUjm5Qus/VDql6BI+JYO7bl54c+P
 UtjCPEO+MF0HO+SAsegkyc8qhDg6g55ZmFe5MpXgKpsmRO94bOAzl1PnU4HwsSZO1f
 A72qSyRXW0bWmhqm2QgSboegce35BGAlY5iJrOcmIGntJgj46qllbR8gcoSmza7cyd
 tM8tFxmegQ5FXzXUQ/jnGjgTHsVqXh/8+VMhMuHE79CpQHUuEP8yfXlzU6wTEW4ogK
 0PUgs5UkgzxDKxxgnbO3iJRfzhOmXjrjbUKDmbQ5Oa8XuaZ+B7ZBYo/094qmiml0/w
 bWeE+UjI80TiA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 83E3E60E4D; Mon,  9 Aug 2021 14:08:17 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 09 Aug 2021 14:08:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bezirg@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-214009-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mD5x8-000dPD-9t
Subject: [f2fs-dev] [Bug 214009] New: Compression has no real effect in disk
 usage
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

https://bugzilla.kernel.org/show_bug.cgi?id=214009

            Bug ID: 214009
           Summary: Compression has no real effect in disk usage
           Product: File System
           Version: 2.5
    Kernel Version: 5.13
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: f2fs
          Assignee: filesystem_f2fs@kernel-bugs.kernel.org
          Reporter: bezirg@gmail.com
        Regression: No

I run into problems of measuring the used/free space
of an f2fs partition with transparent compression enable, which leads me to
suspect that there is no transparent compression
happening after all.

I begin with a 1G partition to initialize f2fs with:

$ mkfs.f2fs -O extra_attr,compression /dev/sda2
F2FS-tools: mkfs.f2fs Ver: 1.14.0 (2020-08-24)
Info: Disable heap-based policy
Info: Debug level = 0
Info: Trim is enabled
Info: [/dev/sda2] Disk Model: nal USB 3.0
Info: Segments per section = 1
Info: Sections per zone = 1
Info: sector size = 512
Info: total sectors = 2097152 (1024 MB)
Info: zone aligned segment0 blkaddr: 512
Info: format version with
"Linux version 5.13.7-arch1-1 (linux@archlinux) (gcc (GCC) 11.1.0, GNU ld (GNU
Binutils) 2.36.1) #1 SMP PREEMPT Sat, 31 Jul 2021 13:18:52 +0000"
Info: [/dev/sda2] Discarding device
Info: This device doesn't support BLKSECDISCARD
Info: This device doesn't support BLKDISCARD
Info: Overprovision ratio = 6.360%
Info: Overprovision segments = 68 (GC reserved = 39)
Info: format successful

Let's mount with compression and see the usage/free space:

$ mount -o nodiscard,compress_algorithm=lz4,compress_extension=* /dev/sda2
/mnt/usb
$ cat /etc/mtab | grep /dev/sda2
/dev/sda2 /mnt/usb f2fs
rw,lazytime,relatime,background_gc=on,discard,no_heap,user_xattr,inline_xattr,acl,inline_data,inline_dentry,flush_merge,extent_cache,mode=adaptive,active_logs=6,alloc_mode=reuse,checkpoint_merge,fsync_mode=posix,compress_algorithm=lz4,compress_log_size=2,compress_extension=*,compress_mode=fs
0 0

$ df -hT /mnt/usb

Filesystem     Type  Size  Used Avail Use% Mounted on
/dev/sda2      f2fs 1022M  155M  868M  16% /mnt/usb

I understand that there is some initial overprovision overhead and some other
f2fs overhead that I am not aware of (total 155M).

Next, I create a 500M file, filled with zeroes.

$ dd bs=1M count=500 if=/dev/zero of=/tmp/empty

500+0 records in
500+0 records out
524288000 bytes (524 MB, 500 MiB) copied, 0.196941 s, 2.7 GB/s

The file is highly compressible in lz4 as you can see to around 2M:

$ lz4 /tmp/empty
Compressed filename will be : empty.lz4
Compressed 524288000 bytes into 2057890 bytes ==> 0.39%

I then transfer the file over to the f2fs partition, hoping
that transparent compression will happen:

$ cp /tmp/empty /mnt/usb/empty

The sysfs claims that "transparent compression" happened during this copy:

$ cat /sys/fs/f2fs/sda2/{compr_new_inode,compr_saved_block,compr_written_block}
1
96000
32000

Yet at this point, the df program thinks otherwise:

$ df -hT /mnt/usb

Filesystem     Type  Size  Used Avail Use% Mounted on
/dev/sda2      f2fs 1022M  655M  368M  65% /mnt/usb

As you can see, the reported used space increased by 500M (155M previously +
500M of the file).
I would expect a usage increase of only around 2M, since that is how the
default lz4 compresses into.

I already knew that for individual files the `du` program is not reliable and
in case of btrfs, the `compsize` program should be used instead;
however, the `df` utility works just fine for btrfs+compression.
Let's assume that `df` is reliable for btrfs but is lying in case of f2fs.
If I would then copy again the same 500M file into the f2fs partition, the
partition runs out of space!

$ cp /tmp/empty /mnt/usb/empty2
cp: error writing '/mnt/usb/empty2': No space left on device

$ df -hT /mnt/usb
Filesystem     Type  Size  Used Avail Use% Mounted on
/dev/sda2      f2fs 1022M 1022M     0 100% /mnt/usb

The sysfs continues believing that the second compression happened:

$ cat /sys/fs/f2fs/sda2/{compr_new_inode,compr_saved_block,compr_written_block}

2
166488
55496

I see three possible cases happening:

1) The df program is reporting wrong usage/free space.
2) the f2fs sysfs is lying about performing compression.
3) f2fs "thinks" that there is no space left to allocate, although there is,
since the contents are compressed good.

This is tested and happens both for lz4 and zstd compression of f2fs.
Tested with:
mkfs.f2fs 1.14.0 (2020-08-24)
Linux 5.13.7

I was inspired by other people running into similar problem:

<https://www.reddit.com/r/filesystems/comments/ljzn7i/f2fs_compression_not_compressing>
<https://forums.gentoo.org/viewtopic-p-8485606.html?sid=e6384908dade712e3f8eaeeb7cf1242b>

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
