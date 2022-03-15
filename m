Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FFF4D995B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 15 Mar 2022 11:48:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nU4bK-0002dr-T1; Tue, 15 Mar 2022 10:48:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <qkrwngud825@gmail.com>) id 1nU4bJ-0002dl-FP
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 15 Mar 2022 10:48:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1lxTrnX8sXpNKAb+PIvQNFwrB/wZE80vJh/UdRg3SiU=; b=fOooVQpgmRnhS7CqElNDj45zzy
 iGA8Sw+F+H8hH6VJhCYV1M9xZbDS2Up3ePGeMG6n5O83r0wMqZ0vQ6YqUSVWRaSnKyXCAD/POOJfb
 fG0HZ7Ch3c+BTqlaHnDRHtE1kaqy0UhIoY2cSw7FE8mzy9gBqZg8jBSJEc7IRMoAemXw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1lxTrnX8sXpNKAb+PIvQNFwrB/wZE80vJh/UdRg3SiU=; b=G+nWHImWvlrQAXc9Hs4WUMn8Z8
 i7m0Texk9kGY/fLd1NgdErVXzDq6A76TxTq08g7NS8EVoSjFsh5v82Hj526lE/K3t+MJGJU2eDSJf
 07FQaZgQVZtHbgl1IXlTH7/kWD5FDvdlXLScEFDRolvnDOmh1dCgkLUKV1OIkKHC/E4Y=;
Received: from mail-ed1-f53.google.com ([209.85.208.53])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nU4jA-0003AC-70
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 15 Mar 2022 10:48:36 +0000
Received: by mail-ed1-f53.google.com with SMTP id g20so23613700edw.6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 15 Mar 2022 03:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1lxTrnX8sXpNKAb+PIvQNFwrB/wZE80vJh/UdRg3SiU=;
 b=p0BXf3GXwvT7/z56pPuu3Ewc4h90BGUzeDuSWNd3M06hrgGujn9n4pvrkMfCVe+MK+
 4HZ/P8ALv1fxKzGEyxq499b+pr0yyuA5r/zonIg1ftWtYwQlFNwBY022No3ICYyQgMl7
 Mxq5WMvYONiBuVK+I+BFlrGDDG41MwoHUOKFh/4FQ6elkSBaCi15+kY1td5GYiMP9QED
 uXXXdexPHBlXGhqeCF/ucdETLhRm0iyI6G2KKyTP86E+YWDHjLqUicpcAxxcxuyL2/H5
 oBsAg8hx6xWw9UD4ZCL1P3wK3ehGJP6ZQRd0sOJYq8GnuidwaN6awTtOHDkOxF1DgtV2
 gg/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1lxTrnX8sXpNKAb+PIvQNFwrB/wZE80vJh/UdRg3SiU=;
 b=6I/G40VZYkhf62+GdN02g/enCC1U3ctEzNnXZY3cWWE34oTRcjg0tb3W3ul0revuRj
 wyC7Uy3ilPvReRuxCloZqI948CN/Jh8DrOrvN2sKKmKuhznAzQFk6bQ2OVTHmT8XMUqk
 0scZTGIIiHYTZSvSu17x9dt6sPUlMBrhVZdLTkw/mDuBb/b600vbplwFtZacrmckSW99
 NagXWEwiF6/W8Mjmrv7i65MtgL/o8kkCoYO4U6Rpwo/L6aUfBzyKd0IbRF4X6QnFPMVd
 nOlLYFBYIcJOwLCNtipF+bQNDSrxaLOVTHgVXdQXZNlaJaLKhTwQO1uSDToqxJHTN7Iz
 uPrQ==
X-Gm-Message-State: AOAM530qMFp5JzmwqdAl1RfUmo2J3NcM2C7YmLGZGPcHrmuLHoIDQYL+
 RIyee/AVtlnV9vXbXOSUmpaZ3F5Rbwm8fRowZ71LMjI9w1A=
X-Google-Smtp-Source: ABdhPJxs8BJxU0PzIOoosQLDUCxYKf42zx5c3Csk1YJd6t40CZ6EWZ4oJeySgo6MHvRhjJeuBXLUkAtlyrlULdo7WP8=
X-Received: by 2002:a05:6402:1590:b0:416:3524:1f5a with SMTP id
 c16-20020a056402159000b0041635241f5amr24067251edv.391.1647341305609; Tue, 15
 Mar 2022 03:48:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAD14+f2nBZtLfLC6CwNjgCOuRRRjwzttp3D3iK4Of+1EEjK+cw@mail.gmail.com>
 <15c6c075-7ed1-db3d-e9a3-d2beaa48577f@kernel.org>
 <CAD14+f1sr=kN_d59MGtrCJ8e-GAxzPXsc=j2TP6ChkAccS9hZg@mail.gmail.com>
 <376d12ed-afd0-41d7-495c-054bfd24d5d1@kernel.org>
 <CAD14+f3SnZir_Q7pyVzFZ6zHJendYyxYfGaxP9iLEDQuPE=AZw@mail.gmail.com>
In-Reply-To: <CAD14+f3SnZir_Q7pyVzFZ6zHJendYyxYfGaxP9iLEDQuPE=AZw@mail.gmail.com>
From: Juhyung Park <qkrwngud825@gmail.com>
Date: Tue, 15 Mar 2022 19:48:14 +0900
Message-ID: <CAD14+f1_smUWHgZRffuTNfsmCk-j_LL_vw5RuWffGdnd=vP8BA@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 2.0 (++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Here's strace from both commands right after drop_caches.
 cp: https://pastebin.com/raw/GH51BjV4 tar: https://pastebin.com/raw/0wgiu7fE
 It seems that cp is calling a few extra fadvise and ioctl. 
 Content analysis details:   (2.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.208.53 listed in list.dnswl.org]
 1.0 HK_RANDOM_FROM         From username looks random
 1.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [qkrwngud825[at]gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [qkrwngud825[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.53 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nU4jA-0003AC-70
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Here's strace from both commands right after drop_caches.

cp: https://pastebin.com/raw/GH51BjV4
tar: https://pastebin.com/raw/0wgiu7fE

It seems that cp is calling a few extra fadvise and ioctl.

On Tue, Mar 15, 2022 at 7:25 PM Juhyung Park <qkrwngud825@gmail.com> wrote:
>
> Hi Chao,
>
> On Tue, Mar 15, 2022 at 5:45 PM Chao Yu <chao@kernel.org> wrote:
> >
> > Hi Juhyung,
> >
> > On 2022/3/15 16:37, Juhyung Park wrote:
> > > Hi Chao,
> > >
> > > I actually have never used compression on f2fs yet and this image is
> > > from an unmodified firmware taken directly from the OTA server, not
> > > made by me.
> >
> > Alright.
> >
> > >
> > > If you can tell me how to check if the file is compressed or not, I'll
> > > run it and report back.
> >
> > lsattr <target_file_path> |grep c
> >
> > You can check the flag's mean in manual of chattr.
>
> Ah, didn't know that lsattr shows compressed state.
> It seems that every single file under that system partition is
> compressed except ones with file size of < 4096, but the error only
> happens on select files.
>
> >
> > >
> > > I never had this sort of issue (a lot of multiple readers causing
> > > troubles) before with a regular R/W, uncompressed f2fs partition, so
> > > I'm guessing it has something to do with RO or compression feature.
> >
> > Agreed, maybe we can repacking image to RO one or compressed one to
> > check which one can cause this issue?
>
> Is this easy to do standalone?
>
> AOSP's ext4 image creation was already super complicated to do
> out-of-tree with their dedup and minimizing file size (so that the
> resulting image is as small as possible) thinggies going on. I think
> I've seen EROFS support but I don't know how f2fs system images are
> handled under AOSP.
>
> Also, I moved the environment to my personal laptop. It's running
> v5.15.28 with the latest f2fs-stable/linux-5.15.y merged and it still
> happens there.
>
> One weird thing that I've been able to confirm is that it seems that
> multiple readers are not the problem:
> #!/bin/bash
>
> set -v
>
> APK=system/app/some_app/some_app.apk
>
> echo 3 > /proc/sys/vm/drop_caches
> tar -pcf - $APK | cat > /dev/null     # Works!
> cp $APK /tmp                          # Works!
>
> echo 3 > /proc/sys/vm/drop_caches
> tar -pcf - $APK | cat > /dev/null     # Works!
> echo 3 > /proc/sys/vm/drop_caches
> cp $APK /tmp                          # cp: error reading
> 'system/app/some_app/some_app.apk': Input/output error
>
> echo 3 > /proc/sys/vm/drop_caches
> cp $APK /tmp                          # cp: error reading
> 'system/app/some_app/some_app.apk': Input/output error
> tar -pcf - $APK | cat > /dev/null     # tar:
> system/app/some_app/some_app.apk: File shrank by 3375397 bytes;
> padding with zeros
>
> echo 3 > /proc/sys/vm/drop_caches
> cp $APK /tmp                          # cp: error reading
> 'system/app/some_app/some_app.apk': Input/output error
> echo 3 > /proc/sys/vm/drop_caches
> tar -pcf - $APK | cat > /dev/null     # Works!
>
> I'm guessing some system-calls that cp use causes f2fs to malfunction.
> (GNU tar is smart enough to detect if the output is /dev/null, so it
> skips the actual file read when it is piped directly to /dev/null, so
> I added `cat` in between.)
>
> Hope this new info helps.
>
> Thanks.
>
> >
> > Thanks,
> >
> > >
> > > Thanks.
> > >
> > > On Tue, Mar 15, 2022 at 5:33 PM Chao Yu <chao@kernel.org> wrote:
> > >>
> > >> On 2022/3/14 1:52, Juhyung Park wrote:
> > >>> Hi.
> > >>>
> > >>> We have a production server storing some Android firmwares over a ZFS
> > >>> file-system, and we noticed some issues when extracting firmware files
> > >>> that use f2fs for Android system partitions.
> > >>>
> > >>> This is a proprietary environment, so I cannot disclose every detail,
> > >>> so I hope you understand. I'll try to elaborate as much as I can.
> > >>>
> > >>> The server is running Ubuntu 20.04 with Linux v5.15 (recently upgraded
> > >>> from v5.13 after noticing RO feature added on v5.14 being required).
> > >>> We have a set of scripts extracting Android firmware files. The input
> > >>> is typically the OTA zip file and after going through the script, it
> > >>> extracts every file and binary image from a given file.
> > >>>
> > >>> So that includes extracting super (dynamic partition), ext4 system
> > >>> partitions with dedup enabled, and now, f2fs system partitions with RO
> > >>> and compression enabled.
> > >>>
> > >>> Our script never had to deal with f2fs before as we only started
> > >>> seeing f2fs system partitions with recently released devices.
> > >>>
> > >>> This is the f2fs mount flag after mounting with `mount -o ro
> > >>> system.raw /some/dir`:
> > >>> ro,relatime,lazytime,background_gc=on,discard,no_heap,user_xattr,inline_xattr,acl,inline_data,inline_dentry,extent_cache,mode=adaptive,active_logs=2,alloc_mode=reuse,checkpoint_merge,fsync_mode=posix,compress_algorithm=lz4,compress_log_size=2,compress_mode=fs,discard_unit=block
> > >>>
> > >>> There are *a lot* of files in Android firmware these days, so we try
> > >>> to parallelize parts when we can.
> > >>>
> > >>> This is a snippet of the script:
> > >>> ```
> > >>> #!/bin/bash
> > >>> <...>
> > >>> RSYNC="rsync -ahAXx --inplace --numeric-ids"
> > >>> <...>
> > >>> for val in system vendor product odm; do
> > >>>     if ! ls images/$val.raw > /dev/null 2>&1; then continue; fi
> > >>>
> > >>>     mkdir -p fs
> > >>>     cd fs
> > >>>
> > >>>     mkdir -p $val.mount tmp_$val
> > >>>     mount -o ro ../images/$val.raw $val.mount
> > >>>
> > >>>     $RSYNC $val.mount/ "$DEST_PWD/fs/$val/" &
> > >>>     echo $! > $val.pid
> > >>>     disown
> > >>>
> > >>>     cd $val.mount
> > >>>     find . -type d -exec mkdir -p "$DEST_PWD/strings/$val/"{} \;
> > >>>     find . -type d -exec mkdir -p "../tmp_$val/"{} \;
> > >>>
> > >>>     while read file; do strings "$file" > "$DEST_PWD/strings/$val/$file"
> > >>> & done < <(find . -type f | grep -v '\.apk\|\.jar\|\.zip')
> > >>>     wait
> > >>>
> > >>> <...>
> > >>>
> > >>>     cd ../
> > >>>     rm -rf tmp_$val
> > >>>     cd ../
> > >>> done
> > >>>
> > >>> wait
> > >>> <...>
> > >>> for val in system vendor product odm; do
> > >>>     if ! ls images/$val.raw > /dev/null 2>&1; then continue; fi
> > >>>     tail --pid=$(cat fs/$val.pid) -f /dev/null
> > >>>     umount fs/$val.mount
> > >>>     rmdir fs/$val.mount
> > >>>     rm -f images/$val.img images/$val.raw 2>/dev/null
> > >>> done
> > >>> ```
> > >>>
> > >>> The offending part is:
> > >>> ```
> > >>>     $RSYNC $val.mount/ "$DEST_PWD/fs/$val/" &
> > >>>     find . -type d -exec mkdir -p "$DEST_PWD/strings/$val/"{} \;
> > >>>     find . -type d -exec mkdir -p "../tmp_$val/"{} \;
> > >>>     while read file; do strings "$file" > "$DEST_PWD/strings/$val/$file"
> > >>> & done < <(find . -type f | grep -v '\.apk\|\.jar\|\.zip')
> > >>>     wait
> > >>> ```
> > >>>
> > >>> When that part is reached, the script forks thousands of new processes
> > >>> and starts reading from f2fs. (We simply decided to rely on Linux's
> > >>> task scheduler and didn't bother to limit the number of
> > >>> sub-processes.)
> > >>>
> > >>> I am able to reliably cause f2fs to return EIO on some files:
> > >>> cp: error reading './system/priv-app/some_apk_1/some_apk_1.apk':
> > >>> Input/output error
> > >>> cp: error reading './system/priv-app/some_apk_2/some_apk_2.apk':
> > >>> Input/output error
> > >>> cp: error reading './system/priv-app/some_apk_3/some_apk_3.apk':
> > >>> Input/output error
> > >>> rsync: [sender] read errors mapping
> > >>> "/ssd/some_firmware.zip/fs/system.mount/system/priv-app/some_apk_1/some_apk_1.apk":
> > >>> Input/output error (5)
> > >>> rsync: [sender] read errors mapping
> > >>> "/ssd/some_firmware.zip/fs/system.mount/system/priv-app/some_apk_2/some_apk_2.apk":
> > >>> Input/output error (5)
> > >>> rsync: [sender] read errors mapping
> > >>> "/ssd/some_firmware.zip/fs/system.mount/system/priv-app/some_apk_3/some_apk_3.apk":
> > >>> Input/output error (5)
> > >>> rsync: [sender] read errors mapping
> > >>> "/ssd/some_firmware.zip/fs/system.mount/system/priv-app/some_apk_1/some_apk_1.apk":
> > >>> Input/output error (5)
> > >>> ERROR: system/priv-app/some_apk_1/some_apk_1.apk failed verification
> > >>> -- update retained.
> > >>> rsync: [sender] read errors mapping
> > >>> "/ssd/some_firmware.zip/fs/system.mount/system/priv-app/some_apk_2/some_apk_2.apk":
> > >>> Input/output error (5)
> > >>> ERROR: system/priv-app/some_apk_2/some_apk_2.apk failed verification
> > >>> -- update retained.
> > >>> rsync: [sender] read errors mapping
> > >>> "/ssd/some_firmware.zip/fs/system.mount/system/priv-app/some_apk_3/some_apk_3.apk":
> > >>> Input/output error (5)
> > >>> ERROR: system/priv-app/some_apk_3/some_apk_3.apk failed verification
> > >>> -- update retained.
> > >>> rsync error: some files/attrs were not transferred (see previous
> > >>> errors) (code 23) at main.c(1333) [sender=v3.2.3-45-ga28c4558]
> > >>
> > >> Hi Juhyung,
> > >>
> > >> Do you enable compression on specified files? if so, do all EIOs come from compressed
> > >> file?
> > >>
> > >> Thanks,
> > >>
> > >>>
> > >>> The dmesg remains silent.
> > >>>
> > >>> When I modify the script a little bit and force it to run in a
> > >>> single-thread (by removing &), it runs well.
> > >>>
> > >>> I was able to confirm that it isn't a memory issue. The server has
> > >>> 50G+ of free memory, and the issue is still reliably reproducible when
> > >>> I defragment the memory by dropping caches and doing `echo 1 >
> > >>> /proc/sys/vm/compact_memory`.
> > >>>
> > >>> I wasn't able to test any recent kernels (v5.16 or v5.17) as it's
> > >>> unsupported by ZFS. And it being a production server, I am somewhat
> > >>> limited in dabbling around the kernel.
> > >>>
> > >>> I am planning to test a new kernel with v5.15 +
> > >>> f2fs-stable/linux-5.15.y merged. Meanwhile, if this is a new report or
> > >>> fixed with newer commits, I'd appreciate a tip.
> > >>>
> > >>> Thanks.
> > >>>
> > >>>
> > >>> _______________________________________________
> > >>> Linux-f2fs-devel mailing list
> > >>> Linux-f2fs-devel@lists.sourceforge.net
> > >>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
