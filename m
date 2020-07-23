Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF0A22AA8C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Jul 2020 10:19:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jyWRi-0007n5-Tz; Thu, 23 Jul 2020 08:19:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <nolange79@gmail.com>) id 1jyWRh-0007mt-Qz
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 Jul 2020 08:19:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:Subject:Message-ID:Date:From:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wpWW0k6Z5SoWh7wNmRMzCyy1myUz4TGTS4jfuupX9uE=; b=mLrqnDJ7+W7iicxz+MeLtHLKSR
 aTKE1YuFHe1IaGjYfMgi+TZTbFAzEhd9t+l3qAAIOj3w9L5TcZrCXfQQPAf08HITL5zM+QTYNrZfw
 xSSpshL8hW02e1eYYfXEUWW25oDGvn79Jw8aF9poww4FE8rLK6HSiJxiUYMpzvbJSkWw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:Subject:Message-ID:Date:From:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=wpWW0k6Z5SoWh7wNmRMzCyy1myUz4TGTS4jfuupX9uE=; b=C
 l+kWZf44LxQDG9va7f8TdFLVFSqX619PRf8JO4cfbPUZVIuWforujKf/fzrr9xRA+2aGohC56hliv
 +yhaVL3djjBS4OjbyJ4gAH9yDlVH8bUp3vkl0lL8GCe+TIlUMIs65R6G0Al3nqqY/aSo+YfKELJnI
 nXzvBRhgj2IHAa98=;
Received: from mail-il1-f171.google.com ([209.85.166.171])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jyWRg-005zXR-Fv
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 Jul 2020 08:19:17 +0000
Received: by mail-il1-f171.google.com with SMTP id p15so3578892ilh.13
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 23 Jul 2020 01:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=wpWW0k6Z5SoWh7wNmRMzCyy1myUz4TGTS4jfuupX9uE=;
 b=XE+jgFBvqm5cJZu5Dy7BKY2ewIEdC0s1Lv980v0BrcBLQwLI40bmD76gQCN7cr/a4f
 X3Qddzztfzt1uDa95ATXGzzAogGXGz0FAG7ikF4SF+vZoekGpRdEAk0Mqnucro20gC2b
 ylFIlH+F4ZiR4lKbuXKhUPz54LwPpi8qIDem+qxibzwLaPhsgxFR7VHh1hRSJPFoD5Fu
 S/nkA++D1yJSI7/PIsp8k//C8EW6j6pIoGs3cLTtg8cYSBdGqFmwRTttjvJ0AFLVZE4G
 KZbRTGa2x8GByL3u0PDKreIaHafIAK6HYOIqBSDioqoGa7ggxFADLEswCAea6AhCHjBv
 VrVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=wpWW0k6Z5SoWh7wNmRMzCyy1myUz4TGTS4jfuupX9uE=;
 b=K+slxHIe9+UB/IKgS//hOgP0Q/w3P1HIhuzsP7ZENplo5GvkDJqCY6e0fWrAQbDuJE
 095bwC9pDcIgLszNWKddHbUE8s51zTm+XbQ0vkzK2YIDv6DFHBeYvKYGGVLMsbFKyFss
 eB/IgnamGvU/3DordlTPzdQWgtlhQFg6yJxR3b6cUuiQYLShUaoqkKOJeyreiwwUxj5r
 1AWrlu55iUeksOjyDGuH2OjeRWIbiTbfgfH8nU2Qo2ntmTnLVXn3/2ZCBEMVXl8rLSmQ
 pzQ8V7pDVzZ3ZjJBp9tOFdNN00OJALgrjVSXWyECg2Tpt2u3tnfvBpu9NWKFUNmGVnQP
 dbRw==
X-Gm-Message-State: AOAM530gHZ2XMwDjA9qSkqXiZKPaG/TUAdJbESRGq21C1b2pyHsu1LET
 9+YvpsUPceA9mHmijameLcQdnDp5PqDbMbMKBejPRQKl08s=
X-Google-Smtp-Source: ABdhPJzDTHkqjmuxw4H8KLi954rM4AWnUxdaI2umM0eUDWwOxxQcYcedPCmXC6wf0XcErfRcLIjGI8jJmV3E3CKqO50=
X-Received: by 2002:a92:4a09:: with SMTP id m9mr4003674ilf.79.1595492343483;
 Thu, 23 Jul 2020 01:19:03 -0700 (PDT)
MIME-Version: 1.0
From: Norbert Lange <nolange79@gmail.com>
Date: Thu, 23 Jul 2020 10:18:52 +0200
Message-ID: <CADYdroO3nv0E8kV=wPgR8JYj-Tpu_CO9eUDTWFSvFb7CsUU4og@mail.gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (nolange79[at]gmail.com)
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (nolange79[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.171 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.171 listed in wl.mailspike.net]
 -0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jyWRg-005zXR-Fv
Subject: [f2fs-dev] fsck.f2fs tool causes endless reboots if used with
 systemd
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

Hello,

I have the problem that a f2fs filesystem together with systemd (and
an installed fsck.f2fs) will endlessly reboot.

The fsck.f2fs tool behaves differently to the ext variants, does not
seem to support the -a switch and fails on a mounted device (by
default). ie. it would not help calling fsck from the initramfs
either.
fsck tools seem wildly different, but systemd assumes some basic uniformity

systemd version the issue has been seen with

systemd 245 (245)
-PAM -AUDIT -SELINUX -IMA -APPARMOR -SMACK -SYSVINIT -UTMP
-LIBCRYPTSETUP -GCRYPT -GNUTLS -ACL -XZ +LZ4 -SECCOMP +BLKID -ELFUTILS
+KMOD -IDN2 -IDN -PCRE2 default-hierarchy=unified

fsck.f2fs 1.13.0 (2019-09-24)

The root filesystem is f2fs, mounted read-only from the initrd.
Systemd will endlessly reboot the system as the fsck attempt fails.

The systemd-fsck tool will end up calling fsck.f2fs with the parameter below,
and will fail as this device is mounted (tries to open it in exclusive mode).

$ fsck.f2fs -a /dev/mmcblk0p5; echo $?
Info: Fix the reported corruption.
Info: Mounted device!
Info: Check FS only on RO mounted device
Error: Failed to open the device!
255

A workaround would be to force or skip the check

fsck.f2fs -a -f /dev/mmcblk0p5; echo $?
Info: Fix the reported corruption.
.....
Done: 0.232165 secs
0

Norbert

[1] - https://github.com/systemd/systemd/issues/15106


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
