Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 970741068E9
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Nov 2019 10:35:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iY5Ly-0002t4-TM; Fri, 22 Nov 2019 09:35:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <stephanos.mallouris@gmail.com>) id 1iY5Lx-0002sr-G2
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 22 Nov 2019 09:35:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:Subject:Message-ID:Date:From:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BB2IX7mn6SY9b65S97RsEDjAx2OxP/SpvdQA4QC64gM=; b=Tqfwr/YL5FbtApeQDG7P9kXM+1
 uBquQyb6y9wvghZEi6J4ZEM0dJUojM0NaZocroA31xlvRnburcznJVFqh6BnFM/phEXDHFru5Tsfl
 ou2szx8E3kNjoRYPLp5pob66FIIW2YB4AnOYARfgX8wY8b+FyITV0H87kwT88kA6cQzw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:Subject:Message-ID:Date:From:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=BB2IX7mn6SY9b65S97RsEDjAx2OxP/SpvdQA4QC64gM=; b=E
 3g5QjFnP5nGYGtyL1yIXMHbNu25dfHxJQHYDPwZc47oJRPmlrokmAZeKlFzvBkvz4Yyh2Lq3r3dQJ
 Jl5udatY8V7Lez1ew3ADlO28L6WSiHiIIaciv+4KNHDgJVY3lCpJL8Qh/4bodYH1x7v0S+6RE8Hl6
 5rxk2nifXlKdPUyc=;
Received: from mail-lj1-f175.google.com ([209.85.208.175])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iY5Lw-00A8eA-1L
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 22 Nov 2019 09:35:49 +0000
Received: by mail-lj1-f175.google.com with SMTP id v8so6589202ljh.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 22 Nov 2019 01:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=BB2IX7mn6SY9b65S97RsEDjAx2OxP/SpvdQA4QC64gM=;
 b=TFhE3yMFXmvxbO1J9s/v4FgXIqEPxZua/bLtLZIUTgXgOVPiSxJ4fWh1TsbPaqaH1P
 uYoNYCDAw5SjIU/rqDtvvwZGFd9uP7eV5NgRTXiRlohGjoeB32oT3Mgo11WN3zQrrY2m
 RFxwjDCKpieEM6gNiWtxBhGdiO72v+WpUQra0H3BJ++DDv+UjEuIM6g3+S/1gPr5w3Mt
 cdH+/W1GTX0mCnXx78sBr7x9PpUKImFp7J9nb9AFSxgOJdnAlNZiB/+ILDHWHmY0LYUV
 G5yy3l2/Pd2MeApS6ZdLXYz+pXIaQs/oJq5S07hEH7YGNwqCfIfgBUE7lz+3l8sil4Cu
 BMbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=BB2IX7mn6SY9b65S97RsEDjAx2OxP/SpvdQA4QC64gM=;
 b=NrxpizCMN2v6C95y/+ozYIPWf/jFcUwXJbnp9UxgV61Owt1nLr1+Eb032oRyyyG/0j
 aQqCwChRohSY9GPevN/Kiab57h5UTpkDmQOhUpC4IVVogaxuOH/bntdge3V28C4o+Fwf
 1E5rIadQmzFMILAyyNrpxTJPFZeMQkh3xORUbJTqawzdjCqjIuc6PoZQz9hibaylK/x3
 jcBIamnjEiiYrDA82TbFMkVolXvHRnGCd1ITZfvsV+ZQBS04cw+0Sc8ckfswEgwP7B+4
 t+rSCszGt73+5+de9pzNfh4tATl1QGjWAe1ml0x/wrXESDeZ5iP+KGmo+bVwZ78sRtJ8
 0uVQ==
X-Gm-Message-State: APjAAAUpLhAq0UxB4uZ25MWx5YltjkkMaH2B+EoNQdhB+ecjZ7sQzxzj
 SbYt6hhS7ZlPXa33x1Y35KSEHJTto93jL0u6Ky1cOQ==
X-Google-Smtp-Source: APXvYqzJ/ga1NS1kXs+9yqVfHw6x4Sf8vwp3H5gsSejCoiBgnepwJQ6OKOrVxfHD9wvydcVQDa918gF5VX2RJAqtMS4=
X-Received: by 2002:a2e:2903:: with SMTP id u3mr11549886lje.131.1574415340952; 
 Fri, 22 Nov 2019 01:35:40 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a2e:9819:0:0:0:0:0 with HTTP; Fri, 22 Nov 2019 01:35:40
 -0800 (PST)
From: Stephanos Mallouris <stephanos.mallouris@gmail.com>
Date: Fri, 22 Nov 2019 11:35:40 +0200
Message-ID: <CAPfgDnCxNrZ-ZfEVoDG_ET8bjRNi3KaSPsjRE_ZrMm-yLbr4Cw@mail.gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (stephanos.mallouris[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.175 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.175 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1iY5Lw-00A8eA-1L
Subject: [f2fs-dev] problem with f2fs android partition
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

Dear all,

I have backup my f2fs android partition via netcat and adb.
After loosing the original partition, tried to restore it on a local
drive and access it via linux but i am encountering the following
issues:

A. trying the command

 sudo mount -t f2fs /dev/sdc1 /mnt

gives the following error

 F2FS-fs (sdc1): Failed to read root inode

B1. Tried to fsck the file system , see bellow:

sudo fsck.f2fs -a  /dev/sdc1

result:

Info: Fix the reported corruption.
Info: sector size = 512
Info: total sectors = 22310913 (10894 MB)
Info: MKFS version
  "Linux version 4.1.46-EliteKernelReborn-v5+ (hassanmirza01@ubuntu)
(gcc version 4.9 20150123 (prerelease) (GCC) ) #1 SMP PREEMPT Fri Jan
19 17:16:04 PKT 2018"
Info: FSCK version
  from "Linux version 4.4.0-169-generic (buildd@lgw01-amd64-022) (gcc
version 5.4.0 20160609 (Ubuntu 5.4.0-6ubuntu1~16.04.12) ) #198-Ubuntu
SMP Tue Nov 12 10:34:23 UTC 2019"
    to "Linux version 4.4.0-169-generic (buildd@lgw01-amd64-022) (gcc
version 5.4.0 20160609 (Ubuntu 5.4.0-6ubuntu1~16.04.12) ) #198-Ubuntu
SMP Tue Nov 12 10:34:23 UTC 2019"
Info: superblock features = 0 :
Info: superblock encrypt level = 0, salt = 00000000000000000000000000000000
Info: total FS sectors = 22310912 (10894 MB)
Info: CKPT version = 1307e4
Info: No error was reported

Still unable to mount the partiotion , gives the same error.

B2. Tried
sudo fsck.f2fs -f  /dev/sdc1

result

Info: Force to fix corruption
Info: sector size = 512
Info: total sectors = 22310913 (10894 MB)
Info: MKFS version
  "Linux version 4.1.46-EliteKernelReborn-v5+ (hassanmirza01@ubuntu)
(gcc version 4.9 20150123 (prerelease) (GCC) ) #1 SMP PREEMPT Fri Jan
19 17:16:04 PKT 2018"
Info: FSCK version
  from "Linux version 4.4.0-169-generic (buildd@lgw01-amd64-022) (gcc
version 5.4.0 20160609 (Ubuntu 5.4.0-6ubuntu1~16.04.12) ) #198-Ubuntu
SMP Tue Nov 12 10:34:23 UTC 2019"
    to "Linux version 4.4.0-169-generic (buildd@lgw01-amd64-022) (gcc
version 5.4.0 20160609 (Ubuntu 5.4.0-6ubuntu1~16.04.12) ) #198-Ubuntu
SMP Tue Nov 12 10:34:23 UTC 2019"
Info: superblock features = 0 :
Info: superblock encrypt level = 0, salt = 00000000000000000000000000000000
Info: total FS sectors = 22310912 (10894 MB)
Info: CKPT version = 1307e4
Info: checkpoint state = 1 :  unmount
[ASSERT] (sanity_check_nid: 362)  --> nid[0x3] ino is 0

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
[move_curseg_info:1471] Move curseg[0] 0 -> 0 after 5000
[move_curseg_info:1471] Move curseg[1] 1 -> 1 after 5000
[move_curseg_info:1471] Move curseg[2] 2 -> 2 after 5000
[move_curseg_info:1471] Move curseg[3] 3 -> 3 after 5000
[move_curseg_info:1471] Move curseg[4] 4 -> 4 after 5000
[move_curseg_info:1471] Move curseg[5] 5 -> 5 after 5000

Done.



Trying to mount it , no success, gives

F2FS-fs (sdc1): Failed to read root inode.


Any help or advice will be much appreciated.
Keep up the great work on f2fs.

Kindest Regards

Stephanos Mallouris


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
