Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 641F74D9675
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 15 Mar 2022 09:38:22 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nU2hA-0000OW-Ox; Tue, 15 Mar 2022 08:38:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <qkrwngud825@gmail.com>) id 1nU2gz-0000Np-TD
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 15 Mar 2022 08:38:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2YlX+xusQeRpWHpJPIibH00AWo6uYu7JBBzj3MsAA0I=; b=MN561Vf6smZ+WBvCBqqKUg+S37
 abidYuzSags8AJ5XDCTuMEMIcB96PAaPn19BkshKfuxv7/NC6C/GUtLxh8FoCxUtU3eZwyaf/WOSP
 PKTpRigZZ779adjiCTLPxy2CrG0xiHY2p2IRzz6K3MPbjs2XQgyLFQkd3WdJVH6PqWnA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2YlX+xusQeRpWHpJPIibH00AWo6uYu7JBBzj3MsAA0I=; b=jOfLPNcgKLBG1ibVPQJ1VzqBqs
 QmqxYq8zEH/NyrA2zUh+kSKsYdBGSSiEfwRrGhaDYSYeQouMHBcypX6eMrL+BQd8JmvoAsK0pH94f
 GEY1/kSvMP/NTUSb55sCwrXGBLvA3IaTpcNSLDTSAhwInhRxNI7jZRTS2TkGtyEsgKt0=;
Received: from mail-ej1-f44.google.com ([209.85.218.44])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nU2gt-0003dX-S2
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 15 Mar 2022 08:38:08 +0000
Received: by mail-ej1-f44.google.com with SMTP id a8so39528314ejc.8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 15 Mar 2022 01:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2YlX+xusQeRpWHpJPIibH00AWo6uYu7JBBzj3MsAA0I=;
 b=UAug9GQgymxZWrRtMh5yNZKm2aoAF9iGL3z2oyMajIt26cRBCv9BWcz4OFfP21lNr+
 NqhmtWbShEMstxhpSnKDGuE8utH+++O3i1ytAO+Zq756gA0rUCubtF+AEmwrBmQmVYk0
 mYKqSr9zGEIrg92Uei6ZNJVvtr3pMKriM9RbQ1IvT5HOCrRFw5wpCM5wtVW09ma9VujD
 2PgpckjWjbVQKK/5E0uoRXPqv5ga8X6FReUPMDWAxDRZJmcSa7Ggr4WbG2tQc5GCd2cW
 6uk6YLFgKFcvNhwSEvnvwWmVpF1/3kQeoHRafroAwqysoxIVf2ImzaCUNpMCMmTL2Lgf
 8n/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2YlX+xusQeRpWHpJPIibH00AWo6uYu7JBBzj3MsAA0I=;
 b=NPHUy6RIxmvkrQrIlKnCLZJJzXdArJViYT+NaDWKwhJxOWeaYr+6gdFVSv6CK57a6J
 ZUCQ6jnWPazUFb3WsLKdSA6NP4C2Ui7qKi3ZaX/zy8fEHPkEfh2IGrPNCXlCPTs1Nav+
 8Y8zF5lwlphE9YKIPdx5pyJLo0zl/iFv7dbA4Tyx26zMNWwCSQC3FDaXk7n8pdJUyd9S
 6Hhrjwmhkr338JVPCzu7iGAj2u/HggsLpsACYQkH3jJqJPJtsKqqnYJ+48vwtEgXJN8D
 sh0EBkoL1C2/jwZPBGEYuMTCeHYadYUb6IWhi08uCs5r5XvizJSiO6e7KyfNjFRUxXQe
 TD4A==
X-Gm-Message-State: AOAM532nJAPnMsnQvju6UtlgAX5R0itTU06zOHMqqcjaDkgC85qD0UB/
 MSjDIHZbnKKPvIzvZTn3NHe3UXxbyxVi+wHbqdw=
X-Google-Smtp-Source: ABdhPJyxUF583wI4CSDMFKBdBUyRLflcMO6oMrIxuPAQyBe5IGwGUT47H1H1qCzyZZ2XrGRQQoskLjjeIYLgCC0hBHE=
X-Received: by 2002:a17:907:7845:b0:6cd:f2f4:cf00 with SMTP id
 lb5-20020a170907784500b006cdf2f4cf00mr21051280ejc.388.1647333477170; Tue, 15
 Mar 2022 01:37:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAD14+f2nBZtLfLC6CwNjgCOuRRRjwzttp3D3iK4Of+1EEjK+cw@mail.gmail.com>
 <15c6c075-7ed1-db3d-e9a3-d2beaa48577f@kernel.org>
In-Reply-To: <15c6c075-7ed1-db3d-e9a3-d2beaa48577f@kernel.org>
From: Juhyung Park <qkrwngud825@gmail.com>
Date: Tue, 15 Mar 2022 17:37:45 +0900
Message-ID: <CAD14+f1sr=kN_d59MGtrCJ8e-GAxzPXsc=j2TP6ChkAccS9hZg@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 2.0 (++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Chao, I actually have never used compression on f2fs yet
 and this image is from an unmodified firmware taken directly from the OTA
 server,
 not made by me. If you can tell me how to check if the file is compressed
 or not, I'll run it and report back. 
 Content analysis details:   (2.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 HK_RANDOM_FROM         From username looks random
 1.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.218.44 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [qkrwngud825[at]gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [qkrwngud825[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.218.44 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nU2gt-0003dX-S2
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

Hi Chao,

I actually have never used compression on f2fs yet and this image is
from an unmodified firmware taken directly from the OTA server, not
made by me.

If you can tell me how to check if the file is compressed or not, I'll
run it and report back.

I never had this sort of issue (a lot of multiple readers causing
troubles) before with a regular R/W, uncompressed f2fs partition, so
I'm guessing it has something to do with RO or compression feature.

Thanks.

On Tue, Mar 15, 2022 at 5:33 PM Chao Yu <chao@kernel.org> wrote:
>
> On 2022/3/14 1:52, Juhyung Park wrote:
> > Hi.
> >
> > We have a production server storing some Android firmwares over a ZFS
> > file-system, and we noticed some issues when extracting firmware files
> > that use f2fs for Android system partitions.
> >
> > This is a proprietary environment, so I cannot disclose every detail,
> > so I hope you understand. I'll try to elaborate as much as I can.
> >
> > The server is running Ubuntu 20.04 with Linux v5.15 (recently upgraded
> > from v5.13 after noticing RO feature added on v5.14 being required).
> > We have a set of scripts extracting Android firmware files. The input
> > is typically the OTA zip file and after going through the script, it
> > extracts every file and binary image from a given file.
> >
> > So that includes extracting super (dynamic partition), ext4 system
> > partitions with dedup enabled, and now, f2fs system partitions with RO
> > and compression enabled.
> >
> > Our script never had to deal with f2fs before as we only started
> > seeing f2fs system partitions with recently released devices.
> >
> > This is the f2fs mount flag after mounting with `mount -o ro
> > system.raw /some/dir`:
> > ro,relatime,lazytime,background_gc=on,discard,no_heap,user_xattr,inline_xattr,acl,inline_data,inline_dentry,extent_cache,mode=adaptive,active_logs=2,alloc_mode=reuse,checkpoint_merge,fsync_mode=posix,compress_algorithm=lz4,compress_log_size=2,compress_mode=fs,discard_unit=block
> >
> > There are *a lot* of files in Android firmware these days, so we try
> > to parallelize parts when we can.
> >
> > This is a snippet of the script:
> > ```
> > #!/bin/bash
> > <...>
> > RSYNC="rsync -ahAXx --inplace --numeric-ids"
> > <...>
> > for val in system vendor product odm; do
> >    if ! ls images/$val.raw > /dev/null 2>&1; then continue; fi
> >
> >    mkdir -p fs
> >    cd fs
> >
> >    mkdir -p $val.mount tmp_$val
> >    mount -o ro ../images/$val.raw $val.mount
> >
> >    $RSYNC $val.mount/ "$DEST_PWD/fs/$val/" &
> >    echo $! > $val.pid
> >    disown
> >
> >    cd $val.mount
> >    find . -type d -exec mkdir -p "$DEST_PWD/strings/$val/"{} \;
> >    find . -type d -exec mkdir -p "../tmp_$val/"{} \;
> >
> >    while read file; do strings "$file" > "$DEST_PWD/strings/$val/$file"
> > & done < <(find . -type f | grep -v '\.apk\|\.jar\|\.zip')
> >    wait
> >
> > <...>
> >
> >    cd ../
> >    rm -rf tmp_$val
> >    cd ../
> > done
> >
> > wait
> > <...>
> > for val in system vendor product odm; do
> >    if ! ls images/$val.raw > /dev/null 2>&1; then continue; fi
> >    tail --pid=$(cat fs/$val.pid) -f /dev/null
> >    umount fs/$val.mount
> >    rmdir fs/$val.mount
> >    rm -f images/$val.img images/$val.raw 2>/dev/null
> > done
> > ```
> >
> > The offending part is:
> > ```
> >    $RSYNC $val.mount/ "$DEST_PWD/fs/$val/" &
> >    find . -type d -exec mkdir -p "$DEST_PWD/strings/$val/"{} \;
> >    find . -type d -exec mkdir -p "../tmp_$val/"{} \;
> >    while read file; do strings "$file" > "$DEST_PWD/strings/$val/$file"
> > & done < <(find . -type f | grep -v '\.apk\|\.jar\|\.zip')
> >    wait
> > ```
> >
> > When that part is reached, the script forks thousands of new processes
> > and starts reading from f2fs. (We simply decided to rely on Linux's
> > task scheduler and didn't bother to limit the number of
> > sub-processes.)
> >
> > I am able to reliably cause f2fs to return EIO on some files:
> > cp: error reading './system/priv-app/some_apk_1/some_apk_1.apk':
> > Input/output error
> > cp: error reading './system/priv-app/some_apk_2/some_apk_2.apk':
> > Input/output error
> > cp: error reading './system/priv-app/some_apk_3/some_apk_3.apk':
> > Input/output error
> > rsync: [sender] read errors mapping
> > "/ssd/some_firmware.zip/fs/system.mount/system/priv-app/some_apk_1/some_apk_1.apk":
> > Input/output error (5)
> > rsync: [sender] read errors mapping
> > "/ssd/some_firmware.zip/fs/system.mount/system/priv-app/some_apk_2/some_apk_2.apk":
> > Input/output error (5)
> > rsync: [sender] read errors mapping
> > "/ssd/some_firmware.zip/fs/system.mount/system/priv-app/some_apk_3/some_apk_3.apk":
> > Input/output error (5)
> > rsync: [sender] read errors mapping
> > "/ssd/some_firmware.zip/fs/system.mount/system/priv-app/some_apk_1/some_apk_1.apk":
> > Input/output error (5)
> > ERROR: system/priv-app/some_apk_1/some_apk_1.apk failed verification
> > -- update retained.
> > rsync: [sender] read errors mapping
> > "/ssd/some_firmware.zip/fs/system.mount/system/priv-app/some_apk_2/some_apk_2.apk":
> > Input/output error (5)
> > ERROR: system/priv-app/some_apk_2/some_apk_2.apk failed verification
> > -- update retained.
> > rsync: [sender] read errors mapping
> > "/ssd/some_firmware.zip/fs/system.mount/system/priv-app/some_apk_3/some_apk_3.apk":
> > Input/output error (5)
> > ERROR: system/priv-app/some_apk_3/some_apk_3.apk failed verification
> > -- update retained.
> > rsync error: some files/attrs were not transferred (see previous
> > errors) (code 23) at main.c(1333) [sender=v3.2.3-45-ga28c4558]
>
> Hi Juhyung,
>
> Do you enable compression on specified files? if so, do all EIOs come from compressed
> file?
>
> Thanks,
>
> >
> > The dmesg remains silent.
> >
> > When I modify the script a little bit and force it to run in a
> > single-thread (by removing &), it runs well.
> >
> > I was able to confirm that it isn't a memory issue. The server has
> > 50G+ of free memory, and the issue is still reliably reproducible when
> > I defragment the memory by dropping caches and doing `echo 1 >
> > /proc/sys/vm/compact_memory`.
> >
> > I wasn't able to test any recent kernels (v5.16 or v5.17) as it's
> > unsupported by ZFS. And it being a production server, I am somewhat
> > limited in dabbling around the kernel.
> >
> > I am planning to test a new kernel with v5.15 +
> > f2fs-stable/linux-5.15.y merged. Meanwhile, if this is a new report or
> > fixed with newer commits, I'd appreciate a tip.
> >
> > Thanks.
> >
> >
> > _______________________________________________
> > Linux-f2fs-devel mailing list
> > Linux-f2fs-devel@lists.sourceforge.net
> > https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
