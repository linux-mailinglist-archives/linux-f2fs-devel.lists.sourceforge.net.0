Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DCE4D775F
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 13 Mar 2022 18:53:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nTSHH-0006Ty-23; Sun, 13 Mar 2022 17:53:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <qkrwngud825@gmail.com>) id 1nTSHF-0006Ts-GN
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 13 Mar 2022 17:53:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:To:Subject:
 Message-ID:Date:From:MIME-Version:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4i2PoAsllSm/xP/+TfIV6mX4MuZCoYGa/3yiThhEg9o=; b=kLTwFhM8vZiwLxAdMID7OvcIdE
 hzzYKq80NBrplO53hUeFZbEONiKpQdp1A9WUmRGeHrR6H9mlTs8EiDu/dfPSGRvEjwTr1YipH+x6v
 oK4a3NVjH3lVD9or9oQsX+D+i5BTg//7x6jmwL2UCXftf/kyT39Rpb9W9qrt0ahFnxaE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
 MIME-Version:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=4i2PoAsllSm/xP/+TfIV6mX4MuZCoYGa/3yiThhEg9o=; b=g
 k3mQLTDfC+SEi2gKPJ1Kv70GYBALd2r91vXQt/PMV7H+K7JZ1THezsadh3MKoqZI5kBER6aRP7DCf
 D1Qn443ZT+VeGd7nJLnwR2D2GzjGIdVJlotj/A9sYcTPPICgEM0S9X/6i+2b8c/bi+nhJ4l+fPdYq
 qhvAV81pGxdU2+9o=;
Received: from mail-ed1-f49.google.com ([209.85.208.49])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nTSP7-0006Sd-L2
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 13 Mar 2022 17:53:21 +0000
Received: by mail-ed1-f49.google.com with SMTP id c25so14753091edj.13
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 13 Mar 2022 10:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=4i2PoAsllSm/xP/+TfIV6mX4MuZCoYGa/3yiThhEg9o=;
 b=msfZ7Th4RTlDDTHiTdvrx75ahShsdO7pVeoVzHit8wPtuZTMLUc7O1hiGWwNpISfIh
 NWX4oZJSpf5hvobdGKqrnRxdBv+9cqPbzCQH2PmdRYEgeQdEhwZ1h3R1bipykxxyyXcX
 3rBRnM984wlgcEG1i7XRw8/NGAj/NKwCCNuaVMYr81S/KHWbi3SIK0dU06eXZw6WizAw
 AzcJcgU+SCs28tcNscswGf9YouAfQZWbhyOo24gcgkBLRldbmwcdHUI5uBJTRjql5G1z
 ZlvW45bG8LiBE3KZQ0JUe9ArU0ZTaaN8hJMpdioEBrugqCy6WmlZpvIYpwJXTymiPNEt
 wKuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=4i2PoAsllSm/xP/+TfIV6mX4MuZCoYGa/3yiThhEg9o=;
 b=binvGRJ6VSkkfLZ6jK5jgdAsKeVjObeve16PV3cEwzIBCvMeU0AKwFO45NyHRaRlez
 PdAI1jkx9es3D6OCfPPAsnLigQ1RROtzmj0nCfHsrnWScGm9W96+BKIfl5TdCHjnF2eT
 Z6WxcgYDv2P8zzqjbOXK8kha4YfrhkKOaCtOhwBCVpUdraGxlOKgwAsJ2Nq1BWwvxoOs
 c3Qd0IMylFs/b2OTIEFPmSlaE1l7RTh8uCqSIh3kr4m1iiVyfI90IQOC2w11RIfTin4L
 Kl1Rm1Yoz6uJORQFtJXRi595a/Oo5jajv+DSE6sQY4RjJohCuVJ43bxOFcD+mmjQDIRZ
 Xp5A==
X-Gm-Message-State: AOAM533tWtMA20SEfiemdjlzam6I3l9KPafthvNZDbfODYGKSe6A3a6n
 Rjb/wnuwQIGipWDrmZ+yOL9vi/a62OkEO1w7wiEDm3DWHnk=
X-Google-Smtp-Source: ABdhPJzwq8Ymr4reJCPkwcI1YPzrmKb1R92SsKHpb8xF+RcWYm5x/vZqp5x6pXYuKFdV4NPejCHf0nkXKflIxnFQfCw=
X-Received: by 2002:aa7:c70f:0:b0:416:1b4c:6159 with SMTP id
 i15-20020aa7c70f000000b004161b4c6159mr17415292edq.207.1647193990830; Sun, 13
 Mar 2022 10:53:10 -0700 (PDT)
MIME-Version: 1.0
From: Juhyung Park <qkrwngud825@gmail.com>
Date: Mon, 14 Mar 2022 02:52:59 +0900
Message-ID: <CAD14+f2nBZtLfLC6CwNjgCOuRRRjwzttp3D3iK4Of+1EEjK+cw@mail.gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: 1.3 (+)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hi. We have a production server storing some Android
 firmwares
 over a ZFS file-system, and we noticed some issues when extracting firmware
 files that use f2fs for Android system partitions. This is a proprietary
 environment, so I cannot disclose every detail, so I hope you understand.
 I'll try to elaborate as much as I can. 
 Content analysis details:   (1.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 HK_RANDOM_FROM         From username looks random
 1.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [qkrwngud825[at]gmail.com]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [qkrwngud825[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.208.49 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.49 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1nTSP7-0006Sd-L2
Subject: [f2fs-dev] EIO returned when reading files from R/O,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi.

We have a production server storing some Android firmwares over a ZFS
file-system, and we noticed some issues when extracting firmware files
that use f2fs for Android system partitions.

This is a proprietary environment, so I cannot disclose every detail,
so I hope you understand. I'll try to elaborate as much as I can.

The server is running Ubuntu 20.04 with Linux v5.15 (recently upgraded
from v5.13 after noticing RO feature added on v5.14 being required).
We have a set of scripts extracting Android firmware files. The input
is typically the OTA zip file and after going through the script, it
extracts every file and binary image from a given file.

So that includes extracting super (dynamic partition), ext4 system
partitions with dedup enabled, and now, f2fs system partitions with RO
and compression enabled.

Our script never had to deal with f2fs before as we only started
seeing f2fs system partitions with recently released devices.

This is the f2fs mount flag after mounting with `mount -o ro
system.raw /some/dir`:
ro,relatime,lazytime,background_gc=on,discard,no_heap,user_xattr,inline_xattr,acl,inline_data,inline_dentry,extent_cache,mode=adaptive,active_logs=2,alloc_mode=reuse,checkpoint_merge,fsync_mode=posix,compress_algorithm=lz4,compress_log_size=2,compress_mode=fs,discard_unit=block

There are *a lot* of files in Android firmware these days, so we try
to parallelize parts when we can.

This is a snippet of the script:
```
#!/bin/bash
<...>
RSYNC="rsync -ahAXx --inplace --numeric-ids"
<...>
for val in system vendor product odm; do
  if ! ls images/$val.raw > /dev/null 2>&1; then continue; fi

  mkdir -p fs
  cd fs

  mkdir -p $val.mount tmp_$val
  mount -o ro ../images/$val.raw $val.mount

  $RSYNC $val.mount/ "$DEST_PWD/fs/$val/" &
  echo $! > $val.pid
  disown

  cd $val.mount
  find . -type d -exec mkdir -p "$DEST_PWD/strings/$val/"{} \;
  find . -type d -exec mkdir -p "../tmp_$val/"{} \;

  while read file; do strings "$file" > "$DEST_PWD/strings/$val/$file"
& done < <(find . -type f | grep -v '\.apk\|\.jar\|\.zip')
  wait

<...>

  cd ../
  rm -rf tmp_$val
  cd ../
done

wait
<...>
for val in system vendor product odm; do
  if ! ls images/$val.raw > /dev/null 2>&1; then continue; fi
  tail --pid=$(cat fs/$val.pid) -f /dev/null
  umount fs/$val.mount
  rmdir fs/$val.mount
  rm -f images/$val.img images/$val.raw 2>/dev/null
done
```

The offending part is:
```
  $RSYNC $val.mount/ "$DEST_PWD/fs/$val/" &
  find . -type d -exec mkdir -p "$DEST_PWD/strings/$val/"{} \;
  find . -type d -exec mkdir -p "../tmp_$val/"{} \;
  while read file; do strings "$file" > "$DEST_PWD/strings/$val/$file"
& done < <(find . -type f | grep -v '\.apk\|\.jar\|\.zip')
  wait
```

When that part is reached, the script forks thousands of new processes
and starts reading from f2fs. (We simply decided to rely on Linux's
task scheduler and didn't bother to limit the number of
sub-processes.)

I am able to reliably cause f2fs to return EIO on some files:
cp: error reading './system/priv-app/some_apk_1/some_apk_1.apk':
Input/output error
cp: error reading './system/priv-app/some_apk_2/some_apk_2.apk':
Input/output error
cp: error reading './system/priv-app/some_apk_3/some_apk_3.apk':
Input/output error
rsync: [sender] read errors mapping
"/ssd/some_firmware.zip/fs/system.mount/system/priv-app/some_apk_1/some_apk_1.apk":
Input/output error (5)
rsync: [sender] read errors mapping
"/ssd/some_firmware.zip/fs/system.mount/system/priv-app/some_apk_2/some_apk_2.apk":
Input/output error (5)
rsync: [sender] read errors mapping
"/ssd/some_firmware.zip/fs/system.mount/system/priv-app/some_apk_3/some_apk_3.apk":
Input/output error (5)
rsync: [sender] read errors mapping
"/ssd/some_firmware.zip/fs/system.mount/system/priv-app/some_apk_1/some_apk_1.apk":
Input/output error (5)
ERROR: system/priv-app/some_apk_1/some_apk_1.apk failed verification
-- update retained.
rsync: [sender] read errors mapping
"/ssd/some_firmware.zip/fs/system.mount/system/priv-app/some_apk_2/some_apk_2.apk":
Input/output error (5)
ERROR: system/priv-app/some_apk_2/some_apk_2.apk failed verification
-- update retained.
rsync: [sender] read errors mapping
"/ssd/some_firmware.zip/fs/system.mount/system/priv-app/some_apk_3/some_apk_3.apk":
Input/output error (5)
ERROR: system/priv-app/some_apk_3/some_apk_3.apk failed verification
-- update retained.
rsync error: some files/attrs were not transferred (see previous
errors) (code 23) at main.c(1333) [sender=v3.2.3-45-ga28c4558]

The dmesg remains silent.

When I modify the script a little bit and force it to run in a
single-thread (by removing &), it runs well.

I was able to confirm that it isn't a memory issue. The server has
50G+ of free memory, and the issue is still reliably reproducible when
I defragment the memory by dropping caches and doing `echo 1 >
/proc/sys/vm/compact_memory`.

I wasn't able to test any recent kernels (v5.16 or v5.17) as it's
unsupported by ZFS. And it being a production server, I am somewhat
limited in dabbling around the kernel.

I am planning to test a new kernel with v5.15 +
f2fs-stable/linux-5.15.y merged. Meanwhile, if this is a new report or
fixed with newer commits, I'd appreciate a tip.

Thanks.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
