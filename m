Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A41F13927E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Jan 2020 14:50:05 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ir06S-0001HX-DX; Mon, 13 Jan 2020 13:50:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <stephanos.mallouris@gmail.com>) id 1ir06Q-0001HA-K4
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 13 Jan 2020 13:49:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 References:In-Reply-To:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ms2pCJrBk9UTxLxhSRBsvk7RMPzzgXgfQUzuWQCogdA=; b=jnbknskjHWg+qyP2QViPkyWj98
 N5Oy+AME21dfqr2MRxgRxBmZ4Cf7qVupJaCsbZlLkBSOJOL7VR0iT1+wKSy0GfqyLBpcz6r7D6UyC
 hZZfevAH9tHM0a49RTcMZxaQyfNNVq4ZCr0+Si9ls76PZwsDNg5+xryG76xRbtjR8KM0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:References:In-Reply-To:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ms2pCJrBk9UTxLxhSRBsvk7RMPzzgXgfQUzuWQCogdA=; b=Trd/I/YBA3wutDLs/gTKCBRwBb
 pOPwtEkLRjRVJp1dH0RuG6nff4epSQN8qJmU3akEEfFrCKEDZxcZDEpQqcS/YvO3UfXbJavY5/AaN
 htCXGWZJzMvstxJ+NR+RrHG88Ecld8WctqAtnH7gxntrbFirBYHw+mPvkyD/u84PfXp4=;
Received: from mail-lj1-f196.google.com ([209.85.208.196])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1ir06O-003Blo-4X
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 13 Jan 2020 13:49:58 +0000
Received: by mail-lj1-f196.google.com with SMTP id j26so10106565ljc.12
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 13 Jan 2020 05:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=ms2pCJrBk9UTxLxhSRBsvk7RMPzzgXgfQUzuWQCogdA=;
 b=BS4VvF+bBbOeOjqLoSGSPTjMpATyshTdKCk4SsMsKL+Aj7Nnyq1iA8q70hSfv83ok1
 KYZT8kvqouaRsF+qvWr3bDM9foAnitLph/+GmvkCY30Kw5ZaAPkNMV1c67OBnySa1m6K
 ZAvRenyWV1JUNglXjOQ+X+te3ounWMJuS+2JgOlRYyfli/6YAyNgqEGgGhLbh3SBbCVr
 3ODRcU9ML+c9s+/37X57ajE0hPWrNw+rw7SMjnH4MB4XzG9jhRpBKM8tx8N+JSoVsbV2
 DSNJzWujhXNOGjImdr0vMl5Q6ogyONQpd0kNYYaXDOGuDGT+R5aAnDLry91KJcGQLotd
 vhBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=ms2pCJrBk9UTxLxhSRBsvk7RMPzzgXgfQUzuWQCogdA=;
 b=luyCBHvBfgVgxCSGM6cbrqpvzx99WDSFQ8mIwQTroUT58ali4ci8Dm0vheZCt6cw4+
 OZXdJ8wfw9y/AoJZU/eIhEhCtdpH7N+yoFVkFhE62LZwAoZm8S5nFodZ5Sf8Wci7Lw7r
 iwuWg0oVOENlNxx3xpCA5zcGnbw19zkwCoRaSWZTGzdc/bF6hQbKaWl98Xlosf7B1QEs
 P7vmUG5e37NLCJCNwZbJkyQx9eeM51A6K0d4WOdHjsXXC6qQCxm4AVUHMy5z1lvmQTRd
 HsdImL6IZK+puAoWe+Bl2GU6Yz3bMKPZ9RUzPCnCJ5c9wNWL9wKfVT3PrnWQcQeDWBHC
 SHXw==
X-Gm-Message-State: APjAAAVxB35UWP8KW1uH8jYE4/kc0gOU50zBTL9ezt22jKTIl5ShwrEY
 tAX9xWy1BUrhJsTwDXXdu6VL2Z+PGD5YCrQLe4I=
X-Google-Smtp-Source: APXvYqwxYusbScFmvhmOZWATZ1tqkn/QgSEkmgrdBaaqBtkw30LsZ/4+VE/20C14dqxeyS7N6oWgiTc3mjuuW9br7nc=
X-Received: by 2002:a2e:870b:: with SMTP id m11mr10666943lji.93.1578923389081; 
 Mon, 13 Jan 2020 05:49:49 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a2e:8417:0:0:0:0:0 with HTTP; Mon, 13 Jan 2020 05:49:48
 -0800 (PST)
In-Reply-To: <91f73ea7-45fb-714e-5adf-82227c4734f5@huawei.com>
References: <CAPfgDnCxNrZ-ZfEVoDG_ET8bjRNi3KaSPsjRE_ZrMm-yLbr4Cw@mail.gmail.com>
 <20191125174048.GA71634@jaegeuk-macbookpro.roam.corp.google.com>
 <CAPfgDnBLZUbx1pWZqTz09WmTcaS6gkE7sqLSXYSs_cJmWZ2PFg@mail.gmail.com>
 <20191126183448.GB5510@jaegeuk-macbookpro.roam.corp.google.com>
 <CAPfgDnDP8WCxL0s_2ct5egby1c-84rs9TmveHjb2TQ_1aW-4Uw@mail.gmail.com>
 <20191127182615.GB42245@jaegeuk-macbookpro.roam.corp.google.com>
 <CAPfgDnA28pAE=1y=6XtzmrhZ1WE8y-dScZv0dB6ymbkGbfzK=Q@mail.gmail.com>
 <20191203174302.GB41093@jaegeuk-macbookpro.roam.corp.google.com>
 <7bda6647-f4d6-216a-c771-a9023362e16b@huawei.com>
 <CAPfgDnB6tRvKou_19gS7M0eqeL87WsW1f+vTKkkMnPxVnA4j4w@mail.gmail.com>
 <86e80c6f-0470-6b58-696e-3b43c76f9852@huawei.com>
 <CAPfgDnCZdOw5QzvORMjQzz4aU24GXrJQZQRougwjtBvym-wDkA@mail.gmail.com>
 <91f73ea7-45fb-714e-5adf-82227c4734f5@huawei.com>
From: Stephanos Mallouris <stephanos.mallouris@gmail.com>
Date: Mon, 13 Jan 2020 15:49:48 +0200
Message-ID: <CAPfgDnDZWdW8dVQdQ6MguA5QBNxogLXAj_9q+Muwkm_V=NM5pQ@mail.gmail.com>
To: Chao Yu <yuchao0@huawei.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (stephanos.mallouris[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.196 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.196 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1ir06O-003Blo-4X
Subject: Re: [f2fs-dev] problem with f2fs android partition
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Dear All,

I have made a fresh test and trial.
Please see my actions.

1. First i disk dump the original image file to a new hard drive
partition i first created (20GB)
using the command:
sudo dd if=mmcblk0p49.raw bs=4096  status=progress of=/dev/sdc1.

2. Downloaded using git and patching main.c per your instructions.

3. Make the patched f2fs-tools.

4. Put the new drive with the partition using USB, regognized as sdc , sdc1.

5. Go this result on trying the dump.f2fs
elementary@elementary:/media/elementary/mysparky/work_on_f2fs$ sudo
dump.f2fs -i3 /dev/sdc1
Info: [/dev/sdc1] Disk Model: HDWJ110
Info: Segments per section = 1
Info: Sections per zone = 1
Info: sector size = 512
Info: total sectors = 42008576 (20512 MB)
Info: MKFS version
  "Linux version 4.1.46-EliteKernelReborn-v5+ (hassanmirza01@ubuntu)
(gcc version 4.9 20150123 (prerelease) (GCC) ) #1 SMP PREEMPT Fri Jan
19 17:16:04 PKT 2018"
Info: FSCK version
  from "Linux version 4.15.0-36-generic (buildd@lgw01-amd64-031) (gcc
version 7.3.0 (Ubuntu 7.3.0-16ubuntu3)) #39-Ubuntu SMP Mon Sep 24
16:19:09 UTC 2018"
    to "Linux version 4.15.0-36-generic (buildd@lgw01-amd64-031) (gcc
version 7.3.0 (Ubuntu 7.3.0-16ubuntu3)) #39-Ubuntu SMP Mon Sep 24
16:19:09 UTC 2018"
Info: superblock features = 0 :
Info: superblock encrypt level = 0, salt = 00000000000000000000000000000000
Info: total FS sectors = 22310912 (10894 MB)
Info: CKPT version = 1307e4
[print_node_info: 267] Node ID [0x0:0] is inode
i_mode                        		[0x       0 : 0]
i_advise                      		[0x       0 : 0]
i_uid                         		[0x       0 : 0]
i_gid                         		[0x       0 : 0]
i_links                       		[0x       0 : 0]
i_size                        		[0x       0 : 0]
i_blocks                      		[0x       0 : 0]
i_atime                       		[0x       0 : 0]
i_atime_nsec                  		[0x       0 : 0]
i_ctime                       		[0x       0 : 0]
i_ctime_nsec                  		[0x       0 : 0]
i_mtime                       		[0x       0 : 0]
i_mtime_nsec                  		[0x       0 : 0]
i_generation                  		[0x       0 : 0]
i_current_depth               		[0x       0 : 0]
i_xattr_nid                   		[0x       0 : 0]
i_flags                       		[0x       0 : 0]
i_inline                      		[0x       0 : 0]
i_pino                        		[0x       0 : 0]
i_dir_level                   		[0x       0 : 0]
i_ext: fofs:0 blkaddr:0 len:0
i_addr[ofs]                   		[0x       0 : 0]
i_addr[ofs + 1]               		[0x       0 : 0]
i_addr[ofs + 2]               		[0x       0 : 0]
i_addr[ofs + 3]               		[0x       0 : 0]
i_nid[0]                      		[0x       0 : 0]
i_nid[1]                      		[0x       0 : 0]
i_nid[2]                      		[0x       0 : 0]
i_nid[3]                      		[0x       0 : 0]
i_nid[4]                      		[0x       0 : 0]

Invalid (i)node block

Info: checkpoint state = 4 :  compacted_summary sudden-power-off

Done: 0.024776 secs

6. then tried twice to sudo fsck.f2fs  /dev/sdc1 and on the second time i think
the patched code work due to giving :

sudo fsck.f2fs  /dev/sdc1
Info: [/dev/sdc1] Disk Model: HDWJ110
Info: Segments per section = 1
Info: Sections per zone = 1
Info: sector size = 512
Info: total sectors = 42008576 (20512 MB)
Info: MKFS version
  "Linux version 4.1.46-EliteKernelReborn-v5+ (hassanmirza01@ubuntu)
(gcc version 4.9 20150123 (prerelease) (GCC) ) #1 SMP PREEMPT Fri Jan
19 17:16:04 PKT 2018"
Info: FSCK version
  from "Linux version 4.15.0-36-generic (buildd@lgw01-amd64-031) (gcc
version 7.3.0 (Ubuntu 7.3.0-16ubuntu3)) #39-Ubuntu SMP Mon Sep 24
16:19:09 UTC 2018"
    to "Linux version 4.15.0-36-generic (buildd@lgw01-amd64-031) (gcc
version 7.3.0 (Ubuntu 7.3.0-16ubuntu3)) #39-Ubuntu SMP Mon Sep 24
16:19:09 UTC 2018"
Info: superblock features = 0 :
Info: superblock encrypt level = 0, salt = 00000000000000000000000000000000
Info: total FS sectors = 22310912 (10894 MB)
Info: CKPT version = 1307e4
Info: Checked valid nat_bits in checkpoint
Info: checkpoint state = 281 :  allow_nocrc nat_bits unmount
[ASSERT] (is_root_nat_corrupted: 610)  --> nid[0x3] ino is 0
[ASSERT] (sanity_check_nid: 392)  --> nid[0x3] ino is 0

[FSCK] Unreachable nat entries                        [Ok..] [0x0]
[FSCK] SIT valid block bitmap checking                [Ok..]
[FSCK] Hard link checking for regular file            [Ok..] [0x0]
[FSCK] valid_block_count matching with CP             [Ok..] [0x0]
[FSCK] valid_node_count matcing with CP (de lookup)   [Ok..] [0x0]
[FSCK] valid_node_count matcing with CP (nat lookup)  [Ok..] [0x0]
[FSCK] valid_inode_count matched with CP              [Ok..] [0x0]
[FSCK] free segment_count matched with CP             [Ok..] [0x1519]
[FSCK] next block offset is free                      [Ok..]
[FSCK] fixing SIT types
[FSCK] other corrupted bugs                           [Fail]

So now the checkpoing changed to
Info: checkpoint state = 281 :  allow_nocrc nat_bits unmount

from

Info: checkpoint state = 4 :  compacted_summary sudden-power-off

so i believe there is some progress...

7. Now when i try to mount the sdc1 partiotion , using dmesg i get the
following
information

[ 5553.260078]  sdc: sdc1
[ 5563.337756]  sdc: sdc1
[ 5606.821439] F2FS-fs (sdc1): Found nat_bits in checkpoint
[ 5606.965813] F2FS-fs (sdc1): Found nat_bits in checkpoint

And unfortunatly i am unable to Mount It.

Please advice on further actions and steps.. i think we are getting somewhere.

Regarding previous email the correct information is
[ASSERT] (sanity_check_nid: 418)  --> nid[0x3] nat_entry->ino[0x3]
> footer.ino[0x0]

Regards

Stephanos M.












On 1/8/20, Chao Yu <yuchao0@huawei.com> wrote:
> Hi Stephanos,
>
> On 2020/1/7 22:09, Stephanos Mallouris wrote:
>> Dear Yu,
>>
>> Thanks for the reply, i did patch and compile the f2fs-tools.
>> I run  two cases
>> 1. sudo ./fsck.f2fs /media/elementary/eengineering/mmcblk0p49.raw
>> --dry-run -a -y
>>
>> Results attached in firest log file
>>
>> 2.  sudo ./fsck.f2fs /media/elementary/eengineering/mmcblk0p49.raw
>> --dry-run -a -y
>
> It looks running fsck two times still didn't repair the partition.
>
>>
>> Results attached in second log file
>>
>> Please have a look, when possible, assistance is much appreciated.
>>
>> Attaching also the main.c patched file.
>
> I found the output is not the same as you reported previously:
>
> Previous:
> [ASSERT] (sanity_check_nid: 362)  --> nid[0x3] ino is 0
>
> Now:
> [ASSERT] (sanity_check_nid: 418)  --> nid[0x3] nat_entry->ino[0x3]
> footer.ino[0x0]
>
> Did you run fsck on original backuped image? or we have ran fsck several
> times
> on current image before run patched fsck?
>
> And I didn't find debug message such as "Relink root inode, blkaddr: 0x%x",
> That means my patch didn't fix anything on your current image, fsck still
> failed
> due to sanity check find another inconsistency on root inode ( which needs
> another
> patch to fix maybe...).
>
> Could you dump root inode info on current image?
>
> dump.f2fs -i 3 /media/elementary/eengineering/mmcblk0p49.raw
>
> Thanks,
>
>>
>> Regards
>>
>> stephanos m
>>
>>
>>
>> On 12/31/19, Chao Yu <yuchao0@huawei.com> wrote:
>>> Hi,
>>>
>>> Sorry for the delay.
>>>
>>> I figure out a patch to handle your case, w/ this patch, fsck will try
>>> to
>>> search
>>> root inode and once it finds the target, it will relink it to its nat
>>> entry,
>>> after this, all following check in fsck could be executed later.
>>>
>>> If you still keep that corrupted image, could you please have a try w/
>>> this
>>> patch?
>>>
>>> [PATCH] fsck.f2fs: lookup and relink root inode
>>>
>>> Thanks,
>>>
>>> On 2019/12/17 18:11, Stephanos Mallouris wrote:
>>>> Hi to all,
>>>>
>>>> Sorry for the late reply. running the commands as suggested gave the
>>>> following:
>>>>
>>>> 1. # dump.f2fs -i 0x3 /dev/sdc3
>>>>
>>>> Info: sector size = 512
>>>> Info: total sectors = 25624576 (12512 MB)
>>>> Info: MKFS version
>>>>   "Linux version 4.1.46-EliteKernelReborn-v5+ (hassanmirza01@ubuntu)
>>>> (gcc version 4.9 20150123 (prerelease) (GCC) ) #1 SMP PREEMPT Fri Jan
>>>> 19 17:16:04 PKT 2018"
>>>> Info: FSCK version
>>>>   from "Linux version 4.1.46-EliteKernelReborn-v6+
>>>> (hassanmirza01@ubuntu) (gcc version 4.9 20150123 (prerelease) (GCC) )
>>>> #1 SMP PREEMPT Sat Jan 27 00:46:02 PKT 2018"
>>>>     to "Linux version 4.4.0-170-generic (buildd@lgw01-amd64-015) (gcc
>>>> version 5.4.0 20160609 (Ubuntu 5.4.0-6ubuntu1~16.04.12) ) #199-Ubuntu
>>>> SMP Thu Nov 14 01:44:41 UTC 2019"
>>>> Info: superblock features = 0 :
>>>> Info: superblock encrypt level = 0, salt =
>>>> 00000000000000000000000000000000
>>>> Info: total FS sectors = 22310912 (10894 MB)
>>>> Info: CKPT version = 1307e4
>>>> Info: checkpoint state = 4 :  compacted_summary sudden-power-off
>>>> Invalid node block
>>>>
>>>>
>>>> Done.
>>>>
>>>> 2.  # dump.f2fs -i 0x4 /dev/sdc3
>>>>
>>>> Info: sector size = 512
>>>> Info: total sectors = 25624576 (12512 MB)
>>>> Info: MKFS version
>>>>   "Linux version 4.1.46-EliteKernelReborn-v5+ (hassanmirza01@ubuntu)
>>>> (gcc version 4.9 20150123 (prerelease) (GCC) ) #1 SMP PREEMPT Fri Jan
>>>> 19 17:16:04 PKT 2018"
>>>> Info: FSCK version
>>>>   from "Linux version 4.4.0-170-generic (buildd@lgw01-amd64-015) (gcc
>>>> version 5.4.0 20160609 (Ubuntu 5.4.0-6ubuntu1~16.04.12) ) #199-Ubuntu
>>>> SMP Thu Nov 14 01:44:41 UTC 2019"
>>>>     to "Linux version 4.4.0-170-generic (buildd@lgw01-amd64-015) (gcc
>>>> version 5.4.0 20160609 (Ubuntu 5.4.0-6ubuntu1~16.04.12) ) #199-Ubuntu
>>>> SMP Thu Nov 14 01:44:41 UTC 2019"
>>>> Info: superblock features = 0 :
>>>> Info: superblock encrypt level = 0, salt =
>>>> 00000000000000000000000000000000
>>>> Info: total FS sectors = 22310912 (10894 MB)
>>>> Info: CKPT version = 1307e4
>>>> Info: checkpoint state = 4 :  compacted_summary sudden-power-off
>>>> [print_node_info: 103] Node ID [0x4:4] is inode
>>>> i_mode                        		[0x    41f8 : 16888]
>>>> i_advise                      		[0x       2 : 2]
>>>> i_uid                         		[0x     3ff : 1023]
>>>> i_gid                         		[0x     3ff : 1023]
>>>> i_links                       		[0x       5 : 5]
>>>> i_size                        		[0x    1000 : 4096]
>>>> i_blocks                      		[0x       3 : 3]
>>>> i_atime                       		[0x5c52cc67 : 1548930151]
>>>> i_atime_nsec                  		[0x380742f0 : 939999984]
>>>> i_ctime                       		[0x5da861d5 : 1571316181]
>>>> i_ctime_nsec                  		[0x232aaf7f : 589999999]
>>>> i_mtime                       		[0x5ca8c4a0 : 1554564256]
>>>> i_mtime_nsec                  		[0x bebc1fd : 199999997]
>>>> i_generation                  		[0x414c2cfb : 1095511291]
>>>> i_current_depth               		[0x       1 : 1]
>>>> i_xattr_nid                   		[0x       5 : 5]
>>>> i_flags                       		[0x       0 : 0]
>>>> i_inline                      		[0x       0 : 0]
>>>> i_pino                        		[0x       3 : 3]
>>>> i_namelen                     		[0x       5 : 5]
>>>> i_name                        		[media]
>>>> i_ext: fofs:0 blkaddr:0 len:0
>>>> i_addr[0]                     		[0x  294852 : 2705490]
>>>> i_addr[1]                     		[0x       0 : 0]
>>>> i_addr[2]                     		[0x       0 : 0]
>>>> i_addr[3]                     		[0x       0 : 0]
>>>> i_nid[0]                      		[0x       0 : 0]
>>>> i_nid[1]                      		[0x       0 : 0]
>>>> i_nid[2]                      		[0x       0 : 0]
>>>> i_nid[3]                      		[0x       0 : 0]
>>>> i_nid[4]                      		[0x       0 : 0]
>>>>
>>>> Not a regular file
>>>>
>>>>
>>>> Done.
>>>>
>>>>
>>>>
>>>>
>>>> 3. dump.f2fs -i 0x5 /dev/sdc3
>>>>
>>>> Info: sector size = 512
>>>> Info: total sectors = 25624576 (12512 MB)
>>>> Info: MKFS version
>>>>   "Linux version 4.1.46-EliteKernelReborn-v5+ (hassanmirza01@ubuntu)
>>>> (gcc version 4.9 20150123 (prerelease) (GCC) ) #1 SMP PREEMPT Fri Jan
>>>> 19 17:16:04 PKT 2018"
>>>> Info: FSCK version
>>>>   from "Linux version 4.4.0-170-generic (buildd@lgw01-amd64-015) (gcc
>>>> version 5.4.0 20160609 (Ubuntu 5.4.0-6ubuntu1~16.04.12) ) #199-Ubuntu
>>>> SMP Thu Nov 14 01:44:41 UTC 2019"
>>>>     to "Linux version 4.4.0-170-generic (buildd@lgw01-amd64-015) (gcc
>>>> version 5.4.0 20160609 (Ubuntu 5.4.0-6ubuntu1~16.04.12) ) #199-Ubuntu
>>>> SMP Thu Nov 14 01:44:41 UTC 2019"
>>>> Info: superblock features = 0 :
>>>> Info: superblock encrypt level = 0, salt =
>>>> 00000000000000000000000000000000
>>>> Info: total FS sectors = 22310912 (10894 MB)
>>>> Info: CKPT version = 1307e4
>>>> Info: checkpoint state = 4 :  compacted_summary sudden-power-off
>>>> [print_node_info: 109] Node ID [0x5:5] is direct node or indirect node.
>>>> [0]			[0xf2f52011 : -218816495]
>>>> [1]			[0x       1 : 1]
>>>> [2]			[0x       0 : 0]
>>>> [3]			[0x       0 : 0]
>>>> [4]			[0x       0 : 0]
>>>> [5]			[0x       0 : 0]
>>>> [6]			[0x  210706 : 2164486]
>>>> [7]			[0x696c6573 : 1768711539]
>>>> [8]			[0x7578756e : 1970828654]
>>>> [9]			[0x6a626f3a : 1784835898]
>>>> [10]			[0x5f746365 : 1601463141]
>>>> Not a regular file
>>>>
>>>>
>>>> Done.
>>>>
>>>> Those are the results. Hoping for your assistance and help
>>>>
>>>> Regards
>>>>
>>>> Stephanos M.
>>>>
>>>>
>>>>
>>>> On 12/4/19, Chao Yu <yuchao0@huawei.com> wrote:
>>>>> Hi Jaegeuk,
>>>>>
>>>>> On 2019/12/4 1:43, Jaegeuk Kim wrote:
>>>>>> Hi,
>>>>>>
>>>>>> I think you didn't back up the root inode block, since it showed
>>>>>> zeros.
>>>>>> Could you try the below a bit on fresh back-up image again?
>>>>>>
>>>>>> # dump.f2fs -i 0x3 /dev/sdc1
>>>>>> # dump.f2fs -i 0x4 /dev/sdc1
>>>>>> # dump.f2fs -i 0x5 /dev/sdc1
>>>>>
>>>>> Quoted:
>>>>> "[ASSERT] (sanity_check_nid: 362)  --> nid[0x3] ino is 0"
>>>>>
>>>>> Look into log in the Stephanos' first report email, it looks like nat
>>>>> entry
>>>>> of root inode was broken, if this is true, IMO, we have to add a
>>>>> routine
>>>>> to
>>>>> detect such inconsistence and lookup last root inode and relink to its
>>>>> nat
>>>>> entry.
>>>>>
>>>>> Thanks,
>>>>>
>>>>>>
>>>>>> Thanks,
>>>>>>
>>>>>> On 11/28, Stephanos Mallouris wrote:
>>>>>>> Hi,
>>>>>>>
>>>>>>> Thanks for the effort and advice .
>>>>>>> Did execute the command. It gave a lot of information ,
>>>>>>> so i am attaching that to a file.
>>>>>>>
>>>>>>> Regards
>>>>>>>
>>>>>>> Stephanos
>>>>>>>
>>>>>>>
>>>>>>> On 11/27/19, Jaegeuk Kim <jaegeuk@kernel.org> wrote:
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> On 11/27, Stephanos Mallouris wrote:
>>>>>>>>> Dear Kim ,
>>>>>>>>>
>>>>>>>>> Regarding the question:
>>>>>>>>>
>>>>>>>>> "Hmm, # of valid blocks is 0, which is really impossible.
>>>>>>>>>  Do you have original backed up image? I think at some point the
>>>>>>>>> image
>>>>>>>>>  was overwritten when fsck.f2fs tried to fix.
>>>>>>>>>  "
>>>>>>>>>
>>>>>>>>> I do have the original dump raw image. Please advice actions
>>>>>>>>> to assist in recovering it.
>>>>>>>>
>>>>>>>> Could you share the first run with that image?
>>>>>>>> # fsck.f2fs -d 3 "fresh backup image"
>>>>>>>>
>>>>>>>> Thanks,
>>>>>>>>
>>>>>>>>>
>>>>>>>>> I did a dd to an external drive, and from where i tried
>>>>>>>>> unsuccessful
>>>>>>>>> so
>>>>>>>>> far.
>>>>>>>>> I use the following command
>>>>>>>>>
>>>>>>>>> sudo dd if=mmcblk0p49.raw bs=512 oflag=sync status=progress
>>>>>>>>> of=/dev/sda1
>>>>>>>>>
>>>>>>>>> mmcblk0p49.raw is the backup partitioned.
>>>>>>>>>
>>>>>>>>> Thanks in advance
>>>>>>>>>
>>>>>>>>> Stephanos M.
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> On 11/26/19, Jaegeuk Kim <jaegeuk@kernel.org> wrote:
>>>>>>>>>> On 11/26, Stephanos Mallouris wrote:
>>>>>>>>>>> Dear Kim,
>>>>>>>>>>>
>>>>>>>>>>> Thanks for getting back to me.
>>>>>>>>>>>
>>>>>>>>>>> I executed the command  fsck.f2fs -d 3 -f /dev/sdc1
>>>>>>>>>>> and it gave me the following information:
>>>>>>>>>>>
>>>>>>>>>>> Info: Debug level = 3
>>>>>>>>>>> Info: Force to fix corruption
>>>>>>>>>>> Info: sector size = 512
>>>>>>>>>>> Info: total sectors = 22310913 (10894 MB)
>>>>>>>>>>> Info: MKFS version
>>>>>>>>>>>   "Linux version 4.1.46-EliteKernelReborn-v5+
>>>>>>>>>>> (hassanmirza01@ubuntu)
>>>>>>>>>>> (gcc version 4.9 20150123 (prerelease) (GCC) ) #1 SMP PREEMPT
>>>>>>>>>>> Fri
>>>>>>>>>>> Jan
>>>>>>>>>>> 19 17:16:04 PKT 2018"
>>>>>>>>>>> Info: FSCK version
>>>>>>>>>>>   from "Linux version 4.4.0-169-generic (buildd@lgw01-amd64-022)
>>>>>>>>>>> (gcc
>>>>>>>>>>> version 5.4.0 20160609 (Ubuntu 5.4.0-6ubuntu1~16.04.12) )
>>>>>>>>>>> #198-Ubuntu
>>>>>>>>>>> SMP Tue Nov 12 10:34:23 UTC 2019"
>>>>>>>>>>>     to "Linux version 4.4.0-169-generic (buildd@lgw01-amd64-022)
>>>>>>>>>>> (gcc
>>>>>>>>>>> version 5.4.0 20160609 (Ubuntu 5.4.0-6ubuntu1~16.04.12) )
>>>>>>>>>>> #198-Ubuntu
>>>>>>>>>>> SMP Tue Nov 12 10:34:23 UTC 2019"
>>>>>>>>>>> Info: superblock features = 0 :
>>>>>>>>>>> Info: superblock encrypt level = 0, salt =
>>>>>>>>>>> 00000000000000000000000000000000
>>>>>>>>>>>
>>>>>>>>>>> +--------------------------------------------------------+
>>>>>>>>>>> | Super block                                            |
>>>>>>>>>>> +--------------------------------------------------------+
>>>>>>>>>>> magic                         		[0xf2f52010 : 4076150800]
>>>>>>>>>>> major_ver                     		[0x       1 : 1]
>>>>>>>>>>> volum_name                    		[]
>>>>>>>>>>> minor_ver                     		[0x       7 : 7]
>>>>>>>>>>> log_sectorsize                		[0x       9 : 9]
>>>>>>>>>>> log_sectors_per_block         		[0x       3 : 3]
>>>>>>>>>>> log_blocksize                 		[0x       c : 12]
>>>>>>>>>>> log_blocks_per_seg            		[0x       9 : 9]
>>>>>>>>>>> segs_per_sec                  		[0x       1 : 1]
>>>>>>>>>>> secs_per_zone                 		[0x       1 : 1]
>>>>>>>>>>> checksum_offset               		[0x       0 : 0]
>>>>>>>>>>> block_count                   		[0x  2a8e00 : 2788864]
>>>>>>>>>>> section_count                 		[0x    151f : 5407]
>>>>>>>>>>> segment_count                 		[0x    1546 : 5446]
>>>>>>>>>>> segment_count_ckpt            		[0x       2 : 2]
>>>>>>>>>>> segment_count_sit             		[0x       2 : 2]
>>>>>>>>>>> segment_count_nat             		[0x      18 : 24]
>>>>>>>>>>> segment_count_ssa             		[0x       b : 11]
>>>>>>>>>>> segment_count_main            		[0x    151f : 5407]
>>>>>>>>>>> segment0_blkaddr              		[0x     200 : 512]
>>>>>>>>>>> cp_blkaddr                    		[0x     200 : 512]
>>>>>>>>>>> sit_blkaddr                   		[0x     600 : 1536]
>>>>>>>>>>> nat_blkaddr                   		[0x     a00 : 2560]
>>>>>>>>>>> ssa_blkaddr                   		[0x    3a00 : 14848]
>>>>>>>>>>> main_blkaddr                  		[0x    5000 : 20480]
>>>>>>>>>>> root_ino                      		[0x       3 : 3]
>>>>>>>>>>> node_ino                      		[0x       1 : 1]
>>>>>>>>>>> meta_ino                      		[0x       2 : 2]
>>>>>>>>>>> cp_payload                    		[0x       0 : 0]
>>>>>>>>>>> version                       Linux version 4.4.0-169-generic
>>>>>>>>>>> (buildd@lgw01-amd64-022) (gcc version 5.4.0 20160609 (Ubuntu
>>>>>>>>>>> 5.4.0-6ubuntu1~16.04.12) ) #198-Ubuntu SMP Tue Nov 12 10:34:23
>>>>>>>>>>> UTC
>>>>>>>>>>> 2019
>>>>>>>>>>> Info: total FS sectors = 22310912 (10894 MB)
>>>>>>>>>>> Info: CKPT version = 1307e4
>>>>>>>>>>>
>>>>>>>>>>> +--------------------------------------------------------+
>>>>>>>>>>> | Checkpoint                                             |
>>>>>>>>>>> +--------------------------------------------------------+
>>>>>>>>>>> checkpoint_ver                		[0x  1307e4 : 1247204]
>>>>>>>>>>> user_block_count              		[0x  289400 : 2659328]
>>>>>>>>>>> valid_block_count             		[0x       0 : 0]
>>>>>>>>>>
>>>>>>>>>> Hmm, # of valid blocks is 0, which is really impossible.
>>>>>>>>>> Do you have original backed up image? I think at some point the
>>>>>>>>>> image
>>>>>>>>>> was overwritten when fsck.f2fs tried to fix.
>>>>>>>>>>
>>>>>>>>>>> rsvd_segment_count            		[0x      70 : 112]
>>>>>>>>>>> overprov_segment_count        		[0x      d5 : 213]
>>>>>>>>>>> free_segment_count            		[0x    1519 : 5401]
>>>>>>>>>>> alloc_type[CURSEG_HOT_NODE]   		[0x       1 : 1]
>>>>>>>>>>> alloc_type[CURSEG_WARM_NODE]  		[0x       1 : 1]
>>>>>>>>>>> alloc_type[CURSEG_COLD_NODE]  		[0x       1 : 1]
>>>>>>>>>>> cur_node_segno[0]             		[0x       3 : 3]
>>>>>>>>>>> cur_node_segno[1]             		[0x       4 : 4]
>>>>>>>>>>> cur_node_segno[2]             		[0x       5 : 5]
>>>>>>>>>>> cur_node_blkoff[0]            		[0x       0 : 0]
>>>>>>>>>>> cur_node_blkoff[1]            		[0x       0 : 0]
>>>>>>>>>>> cur_node_blkoff[2]            		[0x       0 : 0]
>>>>>>>>>>> alloc_type[CURSEG_HOT_DATA]   		[0x       1 : 1]
>>>>>>>>>>> alloc_type[CURSEG_WARM_DATA]  		[0x       1 : 1]
>>>>>>>>>>> alloc_type[CURSEG_COLD_DATA]  		[0x       1 : 1]
>>>>>>>>>>> cur_data_segno[0]             		[0x       0 : 0]
>>>>>>>>>>> cur_data_segno[1]             		[0x       1 : 1]
>>>>>>>>>>> cur_data_segno[2]             		[0x       2 : 2]
>>>>>>>>>>> cur_data_blkoff[0]            		[0x       0 : 0]
>>>>>>>>>>> cur_data_blkoff[1]            		[0x       0 : 0]
>>>>>>>>>>> cur_data_blkoff[2]            		[0x       0 : 0]
>>>>>>>>>>> ckpt_flags                    		[0x       1 : 1]
>>>>>>>>>>> cp_pack_total_block_count     		[0x       8 : 8]
>>>>>>>>>>> cp_pack_start_sum             		[0x       1 : 1]
>>>>>>>>>>> valid_node_count              		[0x       0 : 0]
>>>>>>>>>>> valid_inode_count             		[0x       0 : 0]
>>>>>>>>>>> next_free_nid                 		[0x   14105 : 82181]
>>>>>>>>>>> sit_ver_bitmap_bytesize       		[0x      40 : 64]
>>>>>>>>>>> nat_ver_bitmap_bytesize       		[0x     300 : 768]
>>>>>>>>>>> checksum_offset               		[0x     ffc : 4092]
>>>>>>>>>>> elapsed_time                  		[0x 167a468 : 23569512]
>>>>>>>>>>> sit_nat_version_bitmap[0]     		[0x      79 : 121]
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> [lookup_nat_in_journal:1515] ==> Found nid [0x4bb2] in nat cache
>>>>>>>>>>> [lookup_nat_in_journal:1515] ==> Found nid [0x6ba0] in nat cache
>>>>>>>>>>> [lookup_nat_in_journal:1515] ==> Found nid [0x783c] in nat cache
>>>>>>>>>>> [lookup_nat_in_journal:1515] ==> Found nid [0xa0ec] in nat cache
>>>>>>>>>>> [lookup_nat_in_journal:1515] ==> Found nid [0xab88] in nat cache
>>>>>>>>>>> [lookup_nat_in_journal:1515] ==> Found nid [0xadcd] in nat cache
>>>>>>>>>>> [lookup_nat_in_journal:1515] ==> Found nid [0xb19c] in nat cache
>>>>>>>>>>> [lookup_nat_in_journal:1515] ==> Found nid [0xb431] in nat cache
>>>>>>>>>>> [lookup_nat_in_journal:1515] ==> Found nid [0xb8f4] in nat cache
>>>>>>>>>>> [lookup_nat_in_journal:1515] ==> Found nid [0xbf40] in nat cache
>>>>>>>>>>> [lookup_nat_in_journal:1515] ==> Found nid [0xce28] in nat cache
>>>>>>>>>>> [lookup_nat_in_journal:1515] ==> Found nid [0xd299] in nat cache
>>>>>>>>>>> [lookup_nat_in_journal:1515] ==> Found nid [0xd56c] in nat cache
>>>>>>>>>>> [lookup_nat_in_journal:1515] ==> Found nid [0xd8d3] in nat cache
>>>>>>>>>>> [lookup_nat_in_journal:1515] ==> Found nid [0xe527] in nat cache
>>>>>>>>>>> [lookup_nat_in_journal:1515] ==> Found nid [0xe67d] in nat cache
>>>>>>>>>>> [lookup_nat_in_journal:1515] ==> Found nid [0xf88c] in nat cache
>>>>>>>>>>> [lookup_nat_in_journal:1515] ==> Found nid [0xfc96] in nat cache
>>>>>>>>>>> [lookup_nat_in_journal:1515] ==> Found nid [0x10271] in nat
>>>>>>>>>>> cache
>>>>>>>>>>> [lookup_nat_in_journal:1515] ==> Found nid [0x111d6] in nat
>>>>>>>>>>> cache
>>>>>>>>>>> [lookup_nat_in_journal:1515] ==> Found nid [0x1154e] in nat
>>>>>>>>>>> cache
>>>>>>>>>>> [lookup_nat_in_journal:1515] ==> Found nid [0x11b66] in nat
>>>>>>>>>>> cache
>>>>>>>>>>> [lookup_nat_in_journal:1515] ==> Found nid [0x1271e] in nat
>>>>>>>>>>> cache
>>>>>>>>>>> [lookup_nat_in_journal:1515] ==> Found nid [0x12abc] in nat
>>>>>>>>>>> cache
>>>>>>>>>>> [lookup_nat_in_journal:1515] ==> Found nid [0x1339b] in nat
>>>>>>>>>>> cache
>>>>>>>>>>> [lookup_nat_in_journal:1515] ==> Found nid [0x137d2] in nat
>>>>>>>>>>> cache
>>>>>>>>>>> [lookup_nat_in_journal:1515] ==> Found nid [0x139ae] in nat
>>>>>>>>>>> cache
>>>>>>>>>>> [lookup_nat_in_journal:1515] ==> Found nid [0x14363] in nat
>>>>>>>>>>> cache
>>>>>>>>>>> [lookup_nat_in_journal:1515] ==> Found nid [0x146a2] in nat
>>>>>>>>>>> cache
>>>>>>>>>>> [lookup_nat_in_journal:1515] ==> Found nid [0x151a3] in nat
>>>>>>>>>>> cache
>>>>>>>>>>> [lookup_nat_in_journal:1515] ==> Found nid [0x151da] in nat
>>>>>>>>>>> cache
>>>>>>>>>>> [lookup_nat_in_journal:1515] ==> Found nid [0x15580] in nat
>>>>>>>>>>> cache
>>>>>>>>>>> [lookup_nat_in_journal:1515] ==> Found nid [0x15744] in nat
>>>>>>>>>>> cache
>>>>>>>>>>> [lookup_nat_in_journal:1515] ==> Found nid [0x158eb] in nat
>>>>>>>>>>> cache
>>>>>>>>>>> [lookup_nat_in_journal:1515] ==> Found nid [0x16030] in nat
>>>>>>>>>>> cache
>>>>>>>>>>> [lookup_nat_in_journal:1515] ==> Found nid [0x1632b] in nat
>>>>>>>>>>> cache
>>>>>>>>>>> [lookup_nat_in_journal:1515] ==> Found nid [0x16722] in nat
>>>>>>>>>>> cache
>>>>>>>>>>> [lookup_nat_in_journal:1515] ==> Found nid [0x16c38] in nat
>>>>>>>>>>> cache
>>>>>>>>>>> [build_nat_area_bitmap:1718] valid nat entries (block_addr !=
>>>>>>>>>>> 0x0)
>>>>>>>>>>> [0x
>>>>>>>>>>>       0 : 0]
>>>>>>>>>>> [build_sit_area_bitmap:1214] Blocks [0x0 : 0] Free Segs [0x1519
>>>>>>>>>>> :
>>>>>>>>>>> 5401]
>>>>>>>>>>>
>>>>>>>>>>> Info: checkpoint state = 1 :  unmount
>>>>>>>>>>> [ASSERT] (sanity_check_nid: 362)  --> nid[0x3] ino is 0
>>>>>>>>>>>
>>>>>>>>>>> [FSCK] Unreachable nat entries                        [Ok..]
>>>>>>>>>>> [0x0]
>>>>>>>>>>> [FSCK] SIT valid block bitmap checking                [Ok..]
>>>>>>>>>>> [FSCK] Hard link checking for regular file            [Ok..]
>>>>>>>>>>> [0x0]
>>>>>>>>>>> [FSCK] valid_block_count matching with CP             [Ok..]
>>>>>>>>>>> [0x0]
>>>>>>>>>>> [FSCK] valid_node_count matcing with CP (de lookup)   [Ok..]
>>>>>>>>>>> [0x0]
>>>>>>>>>>> [FSCK] valid_node_count matcing with CP (nat lookup)  [Ok..]
>>>>>>>>>>> [0x0]
>>>>>>>>>>> [FSCK] valid_inode_count matched with CP              [Ok..]
>>>>>>>>>>> [0x0]
>>>>>>>>>>> [FSCK] free segment_count matched with CP             [Ok..]
>>>>>>>>>>> [0x1519]
>>>>>>>>>>> [FSCK] next block offset is free                      [Ok..]
>>>>>>>>>>> [FSCK] fixing SIT types
>>>>>>>>>>> [FSCK] other corrupted bugs                           [Fail]
>>>>>>>>>>> [move_curseg_info:1471] Move curseg[0] 0 -> 0 after 5000
>>>>>>>>>>> [move_curseg_info:1471] Move curseg[1] 1 -> 1 after 5000
>>>>>>>>>>> [move_curseg_info:1471] Move curseg[2] 2 -> 2 after 5000
>>>>>>>>>>> [move_curseg_info:1471] Move curseg[3] 3 -> 3 after 5000
>>>>>>>>>>> [move_curseg_info:1471] Move curseg[4] 4 -> 4 after 5000
>>>>>>>>>>> [move_curseg_info:1471] Move curseg[5] 5 -> 5 after 5000
>>>>>>>>>>>
>>>>>>>>>>> Done.
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> It still give the same error trying to mount the partiotion.
>>>>>>>>>>> [57765.609319] F2FS-fs (sdc1): Failed to read root inode
>>>>>>>>>>> [57765.651048] F2FS-fs (sdc1): Failed to read root inode
>>>>>>>>>>> [58015.507861] F2FS-fs (sdc1): Failed to read root inode
>>>>>>>>>>> [58015.563422] F2FS-fs (sdc1): Failed to read root inode
>>>>>>>>>>>
>>>>>>>>>>> Please advice and assist if possible.
>>>>>>>>>>>
>>>>>>>>>>> Kindest Regards,
>>>>>>>>>>>
>>>>>>>>>>> Stephanos Mallouris
>>>>>>>>>>>
>>>>>>>>>>> On 11/25/19, Jaegeuk Kim <jaegeuk@kernel.org> wrote:
>>>>>>>>>>>> Hi,
>>>>>>>>>>>>
>>>>>>>>>>>> On 11/22, Stephanos Mallouris wrote:
>>>>>>>>>>>>> Dear all,
>>>>>>>>>>>>>
>>>>>>>>>>>>> I have backup my f2fs android partition via netcat and adb.
>>>>>>>>>>>>> After loosing the original partition, tried to restore it on a
>>>>>>>>>>>>> local
>>>>>>>>>>>>> drive and access it via linux but i am encountering the
>>>>>>>>>>>>> following
>>>>>>>>>>>>> issues:
>>>>>>>>>>>>>
>>>>>>>>>>>>> A. trying the command
>>>>>>>>>>>>>
>>>>>>>>>>>>>  sudo mount -t f2fs /dev/sdc1 /mnt
>>>>>>>>>>>>>
>>>>>>>>>>>>> gives the following error
>>>>>>>>>>>>>
>>>>>>>>>>>>>  F2FS-fs (sdc1): Failed to read root inode
>>>>>>>>>>>>>
>>>>>>>>>>>>> B1. Tried to fsck the file system , see bellow:
>>>>>>>>>>>>>
>>>>>>>>>>>>> sudo fsck.f2fs -a  /dev/sdc1
>>>>>>>>>>>>>
>>>>>>>>>>>>> result:
>>>>>>>>>>>>>
>>>>>>>>>>>>> Info: Fix the reported corruption.
>>>>>>>>>>>>> Info: sector size = 512
>>>>>>>>>>>>> Info: total sectors = 22310913 (10894 MB)
>>>>>>>>>>>>> Info: MKFS version
>>>>>>>>>>>>>   "Linux version 4.1.46-EliteKernelReborn-v5+
>>>>>>>>>>>>> (hassanmirza01@ubuntu)
>>>>>>>>>>>>> (gcc version 4.9 20150123 (prerelease) (GCC) ) #1 SMP PREEMPT
>>>>>>>>>>>>> Fri
>>>>>>>>>>>>> Jan
>>>>>>>>>>>>> 19 17:16:04 PKT 2018"
>>>>>>>>>>>>> Info: FSCK version
>>>>>>>>>>>>>   from "Linux version 4.4.0-169-generic
>>>>>>>>>>>>> (buildd@lgw01-amd64-022)
>>>>>>>>>>>>> (gcc
>>>>>>>>>>>>> version 5.4.0 20160609 (Ubuntu 5.4.0-6ubuntu1~16.04.12) )
>>>>>>>>>>>>> #198-Ubuntu
>>>>>>>>>>>>> SMP Tue Nov 12 10:34:23 UTC 2019"
>>>>>>>>>>>>>     to "Linux version 4.4.0-169-generic
>>>>>>>>>>>>> (buildd@lgw01-amd64-022)
>>>>>>>>>>>>> (gcc
>>>>>>>>>>>>> version 5.4.0 20160609 (Ubuntu 5.4.0-6ubuntu1~16.04.12) )
>>>>>>>>>>>>> #198-Ubuntu
>>>>>>>>>>>>> SMP Tue Nov 12 10:34:23 UTC 2019"
>>>>>>>>>>>>> Info: superblock features = 0 :
>>>>>>>>>>>>> Info: superblock encrypt level = 0, salt =
>>>>>>>>>>>>> 00000000000000000000000000000000
>>>>>>>>>>>>> Info: total FS sectors = 22310912 (10894 MB)
>>>>>>>>>>>>> Info: CKPT version = 1307e4
>>>>>>>>>>>>> Info: No error was reported
>>>>>>>>>>>>>
>>>>>>>>>>>>> Still unable to mount the partiotion , gives the same error.
>>>>>>>>>>>>>
>>>>>>>>>>>>> B2. Tried
>>>>>>>>>>>>> sudo fsck.f2fs -f  /dev/sdc1
>>>>>>>>>>>>
>>>>>>>>>>>> Could you try: fsck.f2fs -d 3 -f /dev/sdc1?
>>>>>>>>>>>> It seems you didn't back up the entire partition which is
>>>>>>>>>>>> missing
>>>>>>>>>>>> root
>>>>>>>>>>>> inode
>>>>>>>>>>>> block.
>>>>>>>>>>>>
>>>>>>>>>>>> Thanks,
>>>>>>>>>>>>
>>>>>>>>>>>>>
>>>>>>>>>>>>> result
>>>>>>>>>>>>>
>>>>>>>>>>>>> Info: Force to fix corruption
>>>>>>>>>>>>> Info: sector size = 512
>>>>>>>>>>>>> Info: total sectors = 22310913 (10894 MB)
>>>>>>>>>>>>> Info: MKFS version
>>>>>>>>>>>>>   "Linux version 4.1.46-EliteKernelReborn-v5+
>>>>>>>>>>>>> (hassanmirza01@ubuntu)
>>>>>>>>>>>>> (gcc version 4.9 20150123 (prerelease) (GCC) ) #1 SMP PREEMPT
>>>>>>>>>>>>> Fri
>>>>>>>>>>>>> Jan
>>>>>>>>>>>>> 19 17:16:04 PKT 2018"
>>>>>>>>>>>>> Info: FSCK version
>>>>>>>>>>>>>   from "Linux version 4.4.0-169-generic
>>>>>>>>>>>>> (buildd@lgw01-amd64-022)
>>>>>>>>>>>>> (gcc
>>>>>>>>>>>>> version 5.4.0 20160609 (Ubuntu 5.4.0-6ubuntu1~16.04.12) )
>>>>>>>>>>>>> #198-Ubuntu
>>>>>>>>>>>>> SMP Tue Nov 12 10:34:23 UTC 2019"
>>>>>>>>>>>>>     to "Linux version 4.4.0-169-generic
>>>>>>>>>>>>> (buildd@lgw01-amd64-022)
>>>>>>>>>>>>> (gcc
>>>>>>>>>>>>> version 5.4.0 20160609 (Ubuntu 5.4.0-6ubuntu1~16.04.12) )
>>>>>>>>>>>>> #198-Ubuntu
>>>>>>>>>>>>> SMP Tue Nov 12 10:34:23 UTC 2019"
>>>>>>>>>>>>> Info: superblock features = 0 :
>>>>>>>>>>>>> Info: superblock encrypt level = 0, salt =
>>>>>>>>>>>>> 00000000000000000000000000000000
>>>>>>>>>>>>> Info: total FS sectors = 22310912 (10894 MB)
>>>>>>>>>>>>> Info: CKPT version = 1307e4
>>>>>>>>>>>>> Info: checkpoint state = 1 :  unmount
>>>>>>>>>>>>> [ASSERT] (sanity_check_nid: 362)  --> nid[0x3] ino is 0
>>>>>>>>>>>>>
>>>>>>>>>>>>> [FSCK] Unreachable nat entries                        [Ok..]
>>>>>>>>>>>>> [0x0]
>>>>>>>>>>>>> [FSCK] SIT valid block bitmap checking                [Ok..]
>>>>>>>>>>>>> [FSCK] Hard link checking for regular file            [Ok..]
>>>>>>>>>>>>> [0x0]
>>>>>>>>>>>>> [FSCK] valid_block_count matching with CP             [Ok..]
>>>>>>>>>>>>> [0x0]
>>>>>>>>>>>>> [FSCK] valid_node_count matcing with CP (de lookup)   [Ok..]
>>>>>>>>>>>>> [0x0]
>>>>>>>>>>>>> [FSCK] valid_node_count matcing with CP (nat lookup)  [Ok..]
>>>>>>>>>>>>> [0x0]
>>>>>>>>>>>>> [FSCK] valid_inode_count matched with CP              [Ok..]
>>>>>>>>>>>>> [0x0]
>>>>>>>>>>>>> [FSCK] free segment_count matched with CP             [Ok..]
>>>>>>>>>>>>> [0x1519]
>>>>>>>>>>>>> [FSCK] next block offset is free                      [Ok..]
>>>>>>>>>>>>> [FSCK] fixing SIT types
>>>>>>>>>>>>> [FSCK] other corrupted bugs                           [Fail]
>>>>>>>>>>>>> [move_curseg_info:1471] Move curseg[0] 0 -> 0 after 5000
>>>>>>>>>>>>> [move_curseg_info:1471] Move curseg[1] 1 -> 1 after 5000
>>>>>>>>>>>>> [move_curseg_info:1471] Move curseg[2] 2 -> 2 after 5000
>>>>>>>>>>>>> [move_curseg_info:1471] Move curseg[3] 3 -> 3 after 5000
>>>>>>>>>>>>> [move_curseg_info:1471] Move curseg[4] 4 -> 4 after 5000
>>>>>>>>>>>>> [move_curseg_info:1471] Move curseg[5] 5 -> 5 after 5000
>>>>>>>>>>>>>
>>>>>>>>>>>>> Done.
>>>>>>>>>>>>>
>>>>>>>>>>>>>
>>>>>>>>>>>>>
>>>>>>>>>>>>> Trying to mount it , no success, gives
>>>>>>>>>>>>>
>>>>>>>>>>>>> F2FS-fs (sdc1): Failed to read root inode.
>>>>>>>>>>>>>
>>>>>>>>>>>>>
>>>>>>>>>>>>> Any help or advice will be much appreciated.
>>>>>>>>>>>>> Keep up the great work on f2fs.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Kindest Regards
>>>>>>>>>>>>>
>>>>>>>>>>>>> Stephanos Mallouris
>>>>>>>>>>>>>
>>>>>>>>>>>>>
>>>>>>>>>>>>> _______________________________________________
>>>>>>>>>>>>> Linux-f2fs-devel mailing list
>>>>>>>>>>>>> Linux-f2fs-devel@lists.sourceforge.net
>>>>>>>>>>>>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
>>>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>>> _______________________________________________
>>>>>> Linux-f2fs-devel mailing list
>>>>>> Linux-f2fs-devel@lists.sourceforge.net
>>>>>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
>>>>>> .
>>>>>>
>>>>>
>>>> .
>>>>
>>>
>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
