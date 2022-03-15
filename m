Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DBE4D96A1
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 15 Mar 2022 09:45:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nU2gL-0007Nr-EF; Tue, 15 Mar 2022 08:45:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nU2gJ-0007NU-PS
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 15 Mar 2022 08:45:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=87ESRW15oxQJoMrjjAK9PiUuDzTrn+kdRQtV+ki4wxI=; b=dbxYGlh8sIjo7uxQBVQsb6Onol
 Pgk6/4UffQFK1ZZ7tbgQWehBL2/cBKzWTVFeJvJoxySIXnZNE68e426AI4jsXwqKfMjHsn+0sYG0w
 Df9gxhgqUbdhJEx/qVx6gdVo8XJ9tjXo07U+WmL96z0AY0+PolxHWKBPq5FWjH48Jg4k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=87ESRW15oxQJoMrjjAK9PiUuDzTrn+kdRQtV+ki4wxI=; b=bsQ7yhMKn8O1nAPNE5T1AxoDH4
 8aZrePuVZOg0XzwgS0ltL4OY4Lc9GiStxHLjC/tXvyFHyAoZVz5VlWSevxQ0yUJD8hXRzxFrg9O3I
 GdYku89ySGuwte6p7UiG+0tF4MBRPv4vaTHxqIiu7DIu5l1KxZtkQEZ4aqIv0aQsdOoQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nU2oE-00GRjB-E4
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 15 Mar 2022 08:45:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0E3A461519;
 Tue, 15 Mar 2022 08:45:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4BFEC340E8;
 Tue, 15 Mar 2022 08:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647333932;
 bh=O25IMMiUE/k0U3mRYx5An9OpZu15vcVFRgMQci2Jk/I=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=opvXTCmxu9fnIuP6hG8VGHMht4Vad8dxei0ofSi9jM4poPvhtF6wbPC5zXcGGBfAo
 qtXFX+nbQgxJtNgCWHEl3KBsgMbsRf/qDiRBSlsBOTClm9hGarXj/sHhn8phXsQ9gi
 USjp0Ab4SPYNUHZqzH+HFIrzPKk9fONdU4RY80mIgJcsb6kFh6M4tpIxiB4Nh13xjG
 mL1toP9PljMmkzA5ePFyt5ru6H3qh/zgg9fjrn+LgtQz/QCKkQfSTZ3akMwW6ejMIJ
 yosqNeQWUXJZVTmmAT1GsUuaJ65KCwwg05x/rvqYvcsPd55w86tY7gTME8cj5EbPg/
 Zbbun1Udh56Ag==
Message-ID: <376d12ed-afd0-41d7-495c-054bfd24d5d1@kernel.org>
Date: Tue, 15 Mar 2022 16:45:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-US
To: Juhyung Park <qkrwngud825@gmail.com>
References: <CAD14+f2nBZtLfLC6CwNjgCOuRRRjwzttp3D3iK4Of+1EEjK+cw@mail.gmail.com>
 <15c6c075-7ed1-db3d-e9a3-d2beaa48577f@kernel.org>
 <CAD14+f1sr=kN_d59MGtrCJ8e-GAxzPXsc=j2TP6ChkAccS9hZg@mail.gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CAD14+f1sr=kN_d59MGtrCJ8e-GAxzPXsc=j2TP6ChkAccS9hZg@mail.gmail.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Juhyung, On 2022/3/15 16:37, Juhyung Park wrote: > Hi Chao,
 > > I actually have never used compression on f2fs yet and this image is
 > from an unmodified firmware taken directly from the OTA server, not > made
 [...] Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nU2oE-00GRjB-E4
Subject: Re: [f2fs-dev] EIO returned when reading files from R/O,
 compressed f2fs image
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

Hi Juhyung,

On 2022/3/15 16:37, Juhyung Park wrote:
> Hi Chao,
> 
> I actually have never used compression on f2fs yet and this image is
> from an unmodified firmware taken directly from the OTA server, not
> made by me.

Alright.

> 
> If you can tell me how to check if the file is compressed or not, I'll
> run it and report back.

lsattr <target_file_path> |grep c

You can check the flag's mean in manual of chattr.

> 
> I never had this sort of issue (a lot of multiple readers causing
> troubles) before with a regular R/W, uncompressed f2fs partition, so
> I'm guessing it has something to do with RO or compression feature.

Agreed, maybe we can repacking image to RO one or compressed one to
check which one can cause this issue?

Thanks,

> 
> Thanks.
> 
> On Tue, Mar 15, 2022 at 5:33 PM Chao Yu <chao@kernel.org> wrote:
>>
>> On 2022/3/14 1:52, Juhyung Park wrote:
>>> Hi.
>>>
>>> We have a production server storing some Android firmwares over a ZFS
>>> file-system, and we noticed some issues when extracting firmware files
>>> that use f2fs for Android system partitions.
>>>
>>> This is a proprietary environment, so I cannot disclose every detail,
>>> so I hope you understand. I'll try to elaborate as much as I can.
>>>
>>> The server is running Ubuntu 20.04 with Linux v5.15 (recently upgraded
>>> from v5.13 after noticing RO feature added on v5.14 being required).
>>> We have a set of scripts extracting Android firmware files. The input
>>> is typically the OTA zip file and after going through the script, it
>>> extracts every file and binary image from a given file.
>>>
>>> So that includes extracting super (dynamic partition), ext4 system
>>> partitions with dedup enabled, and now, f2fs system partitions with RO
>>> and compression enabled.
>>>
>>> Our script never had to deal with f2fs before as we only started
>>> seeing f2fs system partitions with recently released devices.
>>>
>>> This is the f2fs mount flag after mounting with `mount -o ro
>>> system.raw /some/dir`:
>>> ro,relatime,lazytime,background_gc=on,discard,no_heap,user_xattr,inline_xattr,acl,inline_data,inline_dentry,extent_cache,mode=adaptive,active_logs=2,alloc_mode=reuse,checkpoint_merge,fsync_mode=posix,compress_algorithm=lz4,compress_log_size=2,compress_mode=fs,discard_unit=block
>>>
>>> There are *a lot* of files in Android firmware these days, so we try
>>> to parallelize parts when we can.
>>>
>>> This is a snippet of the script:
>>> ```
>>> #!/bin/bash
>>> <...>
>>> RSYNC="rsync -ahAXx --inplace --numeric-ids"
>>> <...>
>>> for val in system vendor product odm; do
>>>     if ! ls images/$val.raw > /dev/null 2>&1; then continue; fi
>>>
>>>     mkdir -p fs
>>>     cd fs
>>>
>>>     mkdir -p $val.mount tmp_$val
>>>     mount -o ro ../images/$val.raw $val.mount
>>>
>>>     $RSYNC $val.mount/ "$DEST_PWD/fs/$val/" &
>>>     echo $! > $val.pid
>>>     disown
>>>
>>>     cd $val.mount
>>>     find . -type d -exec mkdir -p "$DEST_PWD/strings/$val/"{} \;
>>>     find . -type d -exec mkdir -p "../tmp_$val/"{} \;
>>>
>>>     while read file; do strings "$file" > "$DEST_PWD/strings/$val/$file"
>>> & done < <(find . -type f | grep -v '\.apk\|\.jar\|\.zip')
>>>     wait
>>>
>>> <...>
>>>
>>>     cd ../
>>>     rm -rf tmp_$val
>>>     cd ../
>>> done
>>>
>>> wait
>>> <...>
>>> for val in system vendor product odm; do
>>>     if ! ls images/$val.raw > /dev/null 2>&1; then continue; fi
>>>     tail --pid=$(cat fs/$val.pid) -f /dev/null
>>>     umount fs/$val.mount
>>>     rmdir fs/$val.mount
>>>     rm -f images/$val.img images/$val.raw 2>/dev/null
>>> done
>>> ```
>>>
>>> The offending part is:
>>> ```
>>>     $RSYNC $val.mount/ "$DEST_PWD/fs/$val/" &
>>>     find . -type d -exec mkdir -p "$DEST_PWD/strings/$val/"{} \;
>>>     find . -type d -exec mkdir -p "../tmp_$val/"{} \;
>>>     while read file; do strings "$file" > "$DEST_PWD/strings/$val/$file"
>>> & done < <(find . -type f | grep -v '\.apk\|\.jar\|\.zip')
>>>     wait
>>> ```
>>>
>>> When that part is reached, the script forks thousands of new processes
>>> and starts reading from f2fs. (We simply decided to rely on Linux's
>>> task scheduler and didn't bother to limit the number of
>>> sub-processes.)
>>>
>>> I am able to reliably cause f2fs to return EIO on some files:
>>> cp: error reading './system/priv-app/some_apk_1/some_apk_1.apk':
>>> Input/output error
>>> cp: error reading './system/priv-app/some_apk_2/some_apk_2.apk':
>>> Input/output error
>>> cp: error reading './system/priv-app/some_apk_3/some_apk_3.apk':
>>> Input/output error
>>> rsync: [sender] read errors mapping
>>> "/ssd/some_firmware.zip/fs/system.mount/system/priv-app/some_apk_1/some_apk_1.apk":
>>> Input/output error (5)
>>> rsync: [sender] read errors mapping
>>> "/ssd/some_firmware.zip/fs/system.mount/system/priv-app/some_apk_2/some_apk_2.apk":
>>> Input/output error (5)
>>> rsync: [sender] read errors mapping
>>> "/ssd/some_firmware.zip/fs/system.mount/system/priv-app/some_apk_3/some_apk_3.apk":
>>> Input/output error (5)
>>> rsync: [sender] read errors mapping
>>> "/ssd/some_firmware.zip/fs/system.mount/system/priv-app/some_apk_1/some_apk_1.apk":
>>> Input/output error (5)
>>> ERROR: system/priv-app/some_apk_1/some_apk_1.apk failed verification
>>> -- update retained.
>>> rsync: [sender] read errors mapping
>>> "/ssd/some_firmware.zip/fs/system.mount/system/priv-app/some_apk_2/some_apk_2.apk":
>>> Input/output error (5)
>>> ERROR: system/priv-app/some_apk_2/some_apk_2.apk failed verification
>>> -- update retained.
>>> rsync: [sender] read errors mapping
>>> "/ssd/some_firmware.zip/fs/system.mount/system/priv-app/some_apk_3/some_apk_3.apk":
>>> Input/output error (5)
>>> ERROR: system/priv-app/some_apk_3/some_apk_3.apk failed verification
>>> -- update retained.
>>> rsync error: some files/attrs were not transferred (see previous
>>> errors) (code 23) at main.c(1333) [sender=v3.2.3-45-ga28c4558]
>>
>> Hi Juhyung,
>>
>> Do you enable compression on specified files? if so, do all EIOs come from compressed
>> file?
>>
>> Thanks,
>>
>>>
>>> The dmesg remains silent.
>>>
>>> When I modify the script a little bit and force it to run in a
>>> single-thread (by removing &), it runs well.
>>>
>>> I was able to confirm that it isn't a memory issue. The server has
>>> 50G+ of free memory, and the issue is still reliably reproducible when
>>> I defragment the memory by dropping caches and doing `echo 1 >
>>> /proc/sys/vm/compact_memory`.
>>>
>>> I wasn't able to test any recent kernels (v5.16 or v5.17) as it's
>>> unsupported by ZFS. And it being a production server, I am somewhat
>>> limited in dabbling around the kernel.
>>>
>>> I am planning to test a new kernel with v5.15 +
>>> f2fs-stable/linux-5.15.y merged. Meanwhile, if this is a new report or
>>> fixed with newer commits, I'd appreciate a tip.
>>>
>>> Thanks.
>>>
>>>
>>> _______________________________________________
>>> Linux-f2fs-devel mailing list
>>> Linux-f2fs-devel@lists.sourceforge.net
>>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
