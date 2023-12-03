Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C25C4802562
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  3 Dec 2023 17:23:11 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r9pFC-00023z-0s;
	Sun, 03 Dec 2023 16:22:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qkrwngud825@gmail.com>) id 1r9pF6-00023s-27
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 03 Dec 2023 16:22:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xjyI0NSqRP3tBZ/bxP+IFQUSUqwpEdqsPE0VFkTo74Q=; b=LSvh7+6rPQJoofTzW7AkJWTAPP
 fNkPLdVtrdxLkx6sKSr8/KXyCmkHqUmVh4cTg1z/F0UBl86GewohFyfF55UKTFJICH5QLrkYgQff8
 aRNEjt5/1pYAniafoHGeeXJDF98MGXoSMrABtYLoPufz+Dlt/j6tr/j1yss5TOMT2iDk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:MIME-Version:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=xjyI0NSqRP3tBZ/bxP+IFQUSUqwpEdqsPE0VFkTo74Q=; b=L
 L/qS5HlgIPTI06LL6tqjwKujD0FF9nubh5TLbaOobFCLY4NOkLEf0nUSvMRd+6isGN2bwJUa4/w0t
 X1fYV03llHQ52y5P02A0wbExIELw5wf/Rk9Mnn16CrYMis3X6J/4y9aH1nu/4sOb7l1z8YVMh17iX
 GCionp/7vuAASjPg=;
Received: from mail-lj1-f172.google.com ([209.85.208.172])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1r9pF3-0007uY-9B for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 03 Dec 2023 16:22:51 +0000
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2c9e9c2989dso19264941fa.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 03 Dec 2023 08:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701620555; x=1702225355; darn=lists.sourceforge.net;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=xjyI0NSqRP3tBZ/bxP+IFQUSUqwpEdqsPE0VFkTo74Q=;
 b=DB/0Iwaydr3Xm7iaEe4i2DRCiXKxz68pGrTOoqDEOqHONyomU/Nn7zN5EJcADX5c9A
 GbhOkL2s5GuwJ5JWqFxwxrMX1lD385LYmShPYZMqydlzsiR5domLp15Q4k5VWU98ogY8
 VbHVSumYmbAixTyuVPAg1g65c/UBpzH6KaXaWwXoUH1tBthgK/CjxqEpQEyEFt1nP51l
 ijFoRrowb3w13dvAW91amLlUVzLv02lZBmf0m1aqm/WypIMtjZ3g12aJ/O19sWSHhbR6
 4yO+m8ecLvNsbcxhepqaj+v3LcUiA8FWQIC04QWgVvYv7pBC/yuj0l1KB26CAcnvwWj9
 dREg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701620555; x=1702225355;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xjyI0NSqRP3tBZ/bxP+IFQUSUqwpEdqsPE0VFkTo74Q=;
 b=R9Xv48cNQEKtbnLSeJzeXhsh5DWq6R+TpHNlGMxkDhxggv3fYVYQwPCrc8AyKGBX41
 gAo5ZvS+PTpbrPYkStjWr/wL6RGmsjh9Pggn65cHMDvBXIvMfA5dgTuatuNvEAjNAC9S
 Tg0LEwAlu0xL4p7Oy+tDK3T3XG6iWCr77HfVBnqIJnge2goScYxyzZbYJXQp04xKap+7
 6Fv1/v4cQ/pc4gHkUJ7HcJ7rjoP2klXbc7kO2w0gJSp6I1coMvZQfg5TOrrTEjco72O+
 eySUzWMFifTtWb7lrIcTFcmjmsmdkd40sXDU6pIrsTEEeFINMJXmRsWRlTWGq+VeQJhR
 heHQ==
X-Gm-Message-State: AOJu0YyABSvm1lqIt6HM7IVNAnGaK+OBYdzXN1NIsV5qNYiPuKDQtLcP
 e8Tslh/t1fMCWq9soLEHYQBWewJsQZlMHL+n1RAEIa8sSvt5yA==
X-Google-Smtp-Source: AGHT+IGSGcEaIEtQqGblPrNkKc0fnKaGWMp7DebWCNmAF4TiNMHeKf+g1bbPlsKipqb59zTR2qB3Mxa048rMnBy3als=
X-Received: by 2002:a2e:8645:0:b0:2c9:e68e:aded with SMTP id
 i5-20020a2e8645000000b002c9e68eadedmr1460629ljj.61.1701620554728; Sun, 03 Dec
 2023 08:22:34 -0800 (PST)
MIME-Version: 1.0
From: Juhyung Park <qkrwngud825@gmail.com>
Date: Mon, 4 Dec 2023 01:22:23 +0900
Message-ID: <CAD14+f2AVKf8Fa2OO1aAUdDNTDsVzzR6ctU_oJSmTyd6zSYR2Q@mail.gmail.com>
To: Gao Xiang <xiang@kernel.org>, linux-erofs@lists.ozlabs.org
X-Spam-Score: 2.0 (++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  (Cc'ing f2fs and crypto as I've noticed something similar
 with f2fs a while ago, which may mean that this is not specific to EROFS:
 ) Hi. I'm encountering a very weird EROFS data corruption. 
 Content analysis details:   (2.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
 1.0 HK_RANDOM_FROM         From username looks random
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [qkrwngud825[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [qkrwngud825[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.172 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.208.172 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1r9pF3-0007uY-9B
Subject: [f2fs-dev] Weird EROFS data corruption
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
Cc: Yann Collet <yann.collet.73@gmail.com>, linux-crypto@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

(Cc'ing f2fs and crypto as I've noticed something similar with f2fs a
while ago, which may mean that this is not specific to EROFS:
https://lore.kernel.org/all/CAD14+f2nBZtLfLC6CwNjgCOuRRRjwzttp3D3iK4Of+1EEjK+cw@mail.gmail.com/
)

Hi.

I'm encountering a very weird EROFS data corruption.

I noticed when I build an EROFS image for AOSP development, the device
would randomly not boot from a certain build.
After inspecting the log, I noticed that a file got corrupted.

After adding a hash check during the build flow, I noticed that EROFS
would randomly read data wrong.

I now have a reliable method of reproducing the issue, but here's the
funny/weird part: it's only happening on my laptop (i7-1185G7). This
is not happening with my 128 cores buildfarm machine (Threadripper
3990X).

I first suspected a hardware issue, but:
a. The laptop had its motherboard replaced recently (due to a failing
physical Type-C port).
b. The laptop passes memory test (memtest86).
c. This happens on all kernel versions from v5.4 to the latest v6.6
including my personal custom builds and Canonical's official Ubuntu
kernels.
d. This happens on different host SSDs and file-system combinations.
e. This only happens on LZ4. LZ4HC doesn't trigger the issue.
f. This only happens when mounting the image natively by the kernel.
Using fuse with erofsfuse is fine.

This is how I'm reproducing the issue:

# mkfs.erofs -zlz4 -T0 --ignore-mtime tmp.img /mnt/lib64/
mkfs.erofs 1.7
Build completed.
------
Filesystem UUID: 3a7e1f90-5450-40f9-92a2-945bacdb51c3
Filesystem total blocks: 53075 (of 4096-byte blocks)
Filesystem total inodes: 973
Filesystem total metadata blocks: 73
Filesystem total deduplicated bytes (of source files): 0
# mount tmp.img /mnt
# for i in {1..30}; do echo 3 > /proc/sys/vm/drop_caches; find /mnt
-type f -exec xxh64sum {} + | sort -k2 | xxh64sum -; done
0b40f1abfbb6e9a8  stdin
0b40f1abfbb6e9a8  stdin
0b40f1abfbb6e9a8  stdin
0b40f1abfbb6e9a8  stdin
0b40f1abfbb6e9a8  stdin
0b40f1abfbb6e9a8  stdin
293a8e7de2a53019  stdin
0b40f1abfbb6e9a8  stdin
0b40f1abfbb6e9a8  stdin
0b40f1abfbb6e9a8  stdin
0b40f1abfbb6e9a8  stdin
0b40f1abfbb6e9a8  stdin
0b40f1abfbb6e9a8  stdin
0b40f1abfbb6e9a8  stdin
0b40f1abfbb6e9a8  stdin
0b40f1abfbb6e9a8  stdin
0b40f1abfbb6e9a8  stdin
293a8e7de2a53019  stdin
293a8e7de2a53019  stdin
0b40f1abfbb6e9a8  stdin
0b40f1abfbb6e9a8  stdin
0b40f1abfbb6e9a8  stdin
0b40f1abfbb6e9a8  stdin
0b40f1abfbb6e9a8  stdin
0b40f1abfbb6e9a8  stdin
0b40f1abfbb6e9a8  stdin
0b40f1abfbb6e9a8  stdin
0b40f1abfbb6e9a8  stdin
0b40f1abfbb6e9a8  stdin
0b40f1abfbb6e9a8  stdin

As you can see, I sometimes get 0b40f1abfbb6e9a8 and 293a8e7de2a53019 in others.

This is when I manually inspect the failing file:

# echo 3 > /proc/sys/vm/drop_caches; xxh64sum
/mnt/vendor.qti.hardware.mwqemadapter@1.0.so
dc96f35f015a0e5d  /mnt/vendor.qti.hardware.mwqemadapter@1.0.so
# xxd < /mnt/vendor.qti.hardware.mwqemadapter@1.0.so > /tmp/1
[ several more attempts until I get a different hash... ]
# echo 3 > /proc/sys/vm/drop_caches; xxh64sum
/mnt/vendor.qti.hardware.mwqemadapter@1.0.so
1cfe5d69c28fff6c  /mnt/vendor.qti.hardware.mwqemadapter@1.0.so
# xxd < /mnt/vendor.qti.hardware.mwqemadapter@1.0.so > /tmp/2
# diff /tmp/[12]
3741c3741
< 0000e9c0: f40e 0000 b46b 0000 ac5c 0000 140e 0000  .....k...\......
---
> 0000e9c0: 445a 0000 e40d 0000 ac5c 0000 140e 0000  DZ.......\......

This could still very well be my hardware issue, but I highly suspect
something's wrong with the kernel software code that happens to only
trigger on my hardware configuration.

I've uploaded the generated image here:
https://arter97.com/.erofs/
but I'm not sure it'll be reproducible on other machines.

I've also tried updating the LZ4 module in the /lib/lz4 to the latest
v1.9.4 and the latest dev trunk (4032c8c787e6). I've managed to get it
working with the Linux kernel, but the corruption still happens.

Let me know if there's anything I can help to narrow down the culprit.

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
