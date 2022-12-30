Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E768659490
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 30 Dec 2022 05:04:51 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pB6dP-0003Wo-PT;
	Fri, 30 Dec 2022 04:04:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jeff.chua.linux@gmail.com>) id 1pB6dD-0003Wd-SD
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 30 Dec 2022 04:04:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Cc:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qCt5T8j69vFW2sQ77aGsEnhH9bYGHOXKoqu/4Xg5wSQ=; b=HFOKsb4fOAZoCie16+SZeCJRD8
 dozZdsPlcttik4RoQHbGiLFxASOFv8wUptYK7mXw88Kj6/Ujf4oHMO/V6uJAinX3eMESioG0u7EOb
 INC81MQTy6JgludmCtgIlVvoCNB0U2d73CjOL7ScJSmCP02qYf4/9+PvtwG30FJdJvPE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qCt5T8j69vFW2sQ77aGsEnhH9bYGHOXKoqu/4Xg5wSQ=; b=hGafqX3pLszIj6PY//BnPoRBGH
 IlAvafikgqxrIpM14TwDx1XwihYov64afIy3tGFEu0uIYyLbREj+PsmkIuHuD6Iorf6DUgFglWNat
 Rw8ZcFreqUQRaOSJVpPnQfPBdqVniD6ddNkFPQO1SPZOHjl476UQh2x3wDqp1Yj3xboE=;
Received: from mail-vs1-f49.google.com ([209.85.217.49])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pB6d6-00054w-Vd for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 30 Dec 2022 04:04:29 +0000
Received: by mail-vs1-f49.google.com with SMTP id 3so20256801vsq.7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 29 Dec 2022 20:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qCt5T8j69vFW2sQ77aGsEnhH9bYGHOXKoqu/4Xg5wSQ=;
 b=Bwv9gFGTkbWc/FwjxntLDkoNr0hB0CWBbS09rh0p/Pv58Z3f0PxIRz9oPKoTetePPL
 NdZPXLx6f+JaunmiLHb0+LhE7karb8VLpbLUcjbv2wHUAYsh4HVUWgulGxtF4lPkUtiq
 HqyYhZNr1PB/aXvm8JzwRZkbh4YKWd5Uah3oq3s5+5M7QSGY7Y6RZke4zsQHM18lSY25
 UQx5xQSrWv5MJw2WQHCZvt/O0OFQg//X7F2ppUbAmudsDZ6yV2hBc4qa+nA06EyrWY5J
 Uc4IPo8Qv9afzEjThfvYRRMwXYHzy9KhpNaaMoOYMvGWWfDI355g2NZkgsJTSPIo1l0T
 MR4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qCt5T8j69vFW2sQ77aGsEnhH9bYGHOXKoqu/4Xg5wSQ=;
 b=anKXA3JXUs3NdFaS95/sDPLW3KpeGAkLlJVhVPzrKPIeZ4D3G55WDgKHcLZjpUZay6
 BZM4lNbteErvLhEC0EZ72eQiQvZWDI5FY06aCXKUZaxlLDrHyjuPI0nKMBkN2OMhCWwE
 kMHJ+bf4qAg1g9jqIj4sfJXW4Jx5rvPhsbzQNzpR9mCzwnKPlS4kz2u2mFNBQ7msu27b
 wKIhT8pc8ZGy5bnojQvOQ23MdIdvRPtPmXQBT89tsasSnBOg3Dy2Y9v2EqRAvjJYLRJr
 4yWb7sltXB3VvxlSRcIA0kS3h5BToCzgcvDcVitgAde5vPOH5+rfW6GyhdXbX47u4wv5
 QuPw==
X-Gm-Message-State: AFqh2kqQtkluS02tCJx7GcWygLZUBgHKRgku34Z8gylc/A5izp3h4KXa
 kUCk14dV43fBRIgL4GBWatK8fZlEjd4ELue/Jig=
X-Google-Smtp-Source: AMrXdXsqaznzGUBnDq8zXnua/QeIZqzGcLamyF/Nx0c12LrxzZh+CQwl7IQPBrRDz6+1NY4fOi5w5d8cHwGvDvePA7E=
X-Received: by 2002:a67:fd48:0:b0:3c9:59f7:2486 with SMTP id
 g8-20020a67fd48000000b003c959f72486mr1346990vsr.50.1672373055681; Thu, 29 Dec
 2022 20:04:15 -0800 (PST)
MIME-Version: 1.0
References: <CAAJw_Ztzyh-GNTJYpXbA0CeJv2Rz=fLZKE6_Q=7JMmM+s9yHXQ@mail.gmail.com>
 <CAAJw_Ztb0mJVkHtBhryf=9g8CA0fZZRa8HVio8GCGUSLOvqa7A@mail.gmail.com>
 <Y6bz4wOC0nwu2yGU@debian.me> <0c70ba66-ef00-7242-d198-844f803662fa@gmail.com>
In-Reply-To: <0c70ba66-ef00-7242-d198-844f803662fa@gmail.com>
From: Jeff Chua <jeff.chua.linux@gmail.com>
Date: Fri, 30 Dec 2022 12:04:04 +0800
Message-ID: <CAAJw_Zv0iBg4rkzxQ2UOOLS9JQZ4cCmM7gSoDXec_gm-GggB6A@mail.gmail.com>
To: lkml <linux-kernel@vger.kernel.org>, 
 Linus Torvalds <torvalds@linux-foundation.org>,
 Bagas Sanjaya <bagasdotme@gmail.com>, 
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, 
 F2FS Development <linux-f2fs-devel@lists.sourceforge.net>, 
 Linux Regressions <regressions@lists.linux.dev>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/24/22 19:43, Bagas Sanjaya wrote: > On Sat, Dec 24,
 2022 at 01:48:55PM +0800, Jeff Chua wrote: >> Got the following error in latest
 linux-6.2-git with just vim (:w >> file1). No problem with lin [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [jeff.chua.linux[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.217.49 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.217.49 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1pB6d6-00054w-Vd
Subject: [f2fs-dev] Fwd: f2fs write error Linux v6.2
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

On 12/24/22 19:43, Bagas Sanjaya wrote:
> On Sat, Dec 24, 2022 at 01:48:55PM +0800, Jeff Chua wrote:
>> Got the following error in latest linux-6.2-git with just vim (:w
>> file1). No problem with linux-6.1.1

What happened to the f2fs developers? No response from anyone yet. Am
I the only one facing this? Linux-6.2 is unusable until this is fixed.
What can I do to help?

Jeff


>> 2022-12-22T14:09:51.419409+08:00 [localhost] kernel: BUG: kernel NULL
>> pointer dereference, address: 0000000000000024
>> 2022-12-22T14:09:51.419422+08:00 [localhost] kernel: #PF: supervisor
>> write access in kernel mode
>> 2022-12-22T14:09:51.419423+08:00 [localhost] kernel: #PF:
>> error_code(0x0002) - not-present page
>> 2022-12-22T14:09:51.419424+08:00 [localhost] kernel: PGD 147b63067 P4D
>> 147b63067 PUD 177d5c067 PMD 0
>> 2022-12-22T14:09:51.419424+08:00 [localhost] kernel: Oops: 0002 [#7] PREEMPT SMP
>> 2022-12-22T14:09:51.419428+08:00 [localhost] kernel: CPU: 6 PID: 22891
>> Comm: vi Tainted: G     UD            6.1.0 #11
>> 2022-12-22T14:09:51.419428+08:00 [localhost] kernel: Hardware name:
>> LENOVO 21CCS1GL00/21CCS1GL00, BIOS N3AET69W (1.34 ) 12/05/2022
>> 2022-12-22T14:09:51.419428+08:00 [localhost] kernel: RIP:
>> 0010:f2fs_issue_flush+0x10e/0x180
>> 2022-12-22T14:09:51.419429+08:00 [localhost] kernel: Code: ba 01 00 00
>> 00 be 03 00 00 00 e8 ad e8 d5 ff 48 83 3b 00 74 1e 48 89 e7 e8 7f c1
>> 84 00 f0 ff 4b 24 8b 44 24 2c e9 66 ff ff ff <f0> ff 43 24 e9 4a ff ff
>> ff 45 31 ff 4c 87 7b 28 4d 85 ff 74 d6 44
>> 2022-12-22T14:09:51.419429+08:00 [localhost] kernel: RSP:
>> 0018:ffffc90000b13df0 EFLAGS: 00010246
>> 2022-12-22T14:09:51.419430+08:00 [localhost] kernel: RAX:
>> ffff888101caccc0 RBX: 0000000000000000 RCX: 0000000000000000
>> 2022-12-22T14:09:51.419430+08:00 [localhost] kernel: RDX:
>> 0000000010000088 RSI: 000000000005a844 RDI: ffff8881027bf000
>> 2022-12-22T14:09:51.419431+08:00 [localhost] kernel: RBP:
>> ffff8881027bf000 R08: 0000000000000000 R09: ffff8881027bf2a8
>> 2022-12-22T14:09:51.419431+08:00 [localhost] kernel: R10:
>> 0000000000000000 R11: 0000000000000000 R12: 0000000000000024
>> 2022-12-22T14:09:51.419432+08:00 [localhost] kernel: R13:
>> 000000000005a844 R14: 000000000005a844 R15: 0000000000000000
>> 2022-12-22T14:09:51.419432+08:00 [localhost] kernel: FS:
>> 00007ff03fdf0b80(0000) GS:ffff88883f380000(0000)
>> knlGS:0000000000000000
>> 2022-12-22T14:09:51.419432+08:00 [localhost] kernel: CS:  0010 DS:
>> 0000 ES: 0000 CR0: 0000000080050033
>> 2022-12-22T14:09:51.419433+08:00 [localhost] kernel: CR2:
>> 0000000000000024 CR3: 000000013d64e006 CR4: 0000000000770ee0
>> 2022-12-22T14:09:51.419433+08:00 [localhost] kernel: PKRU: 55555554
>> 2022-12-22T14:09:51.419434+08:00 [localhost] kernel: Call Trace:
>> 2022-12-22T14:09:51.419434+08:00 [localhost] kernel: <TASK>
>> 2022-12-22T14:09:51.419435+08:00 [localhost] kernel: ?
>> preempt_count_add+0x63/0x90
>> 2022-12-22T14:09:51.419435+08:00 [localhost] kernel: ?
>> preempt_count_add+0x63/0x90
>> 2022-12-22T14:09:51.419435+08:00 [localhost] kernel: ?
>> preempt_count_add+0x63/0x90
>> 2022-12-22T14:09:51.419436+08:00 [localhost] kernel:
>> f2fs_do_sync_file+0x489/0x650
>> 2022-12-22T14:09:51.419436+08:00 [localhost] kernel: __x64_sys_fsync+0x2f/0x60
>> 2022-12-22T14:09:51.419437+08:00 [localhost] kernel: do_syscall_64+0x35/0x80
>> 2022-12-22T14:09:51.419437+08:00 [localhost] kernel:
>> entry_SYSCALL_64_after_hwframe+0x46/0xb0
>> 2022-12-22T14:09:51.419438+08:00 [localhost] kernel: RIP: 0033:0x7ff03feef20b
>> 2022-12-22T14:09:51.419438+08:00 [localhost] kernel: Code: 3d 00 f0 ff
>> ff 77 48 c3 0f 1f 80 00 00 00 00 48 83 ec 18 89 7c 24 0c e8 a3 a2 f8
>> ff 8b 7c 24 0c 41 89 c0 b8 4a 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 35
>> 44 89 c7 89 44 24 0c e8 01 a3 f8 ff 8b 44
>> 2022-12-22T14:09:51.419438+08:00 [localhost] kernel: RSP:
>> 002b:00007ffe6ecca530 EFLAGS: 00000293 ORIG_RAX: 000000000000004a
>> 2022-12-22T14:09:51.419439+08:00 [localhost] kernel: RAX:
>> ffffffffffffffda RBX: 0000000000000001 RCX: 00007ff03feef20b
>> 2022-12-22T14:09:51.419439+08:00 [localhost] kernel: RDX:
>> 0000000000000002 RSI: 0000000000000002 RDI: 0000000000000003
>> 2022-12-22T14:09:51.419440+08:00 [localhost] kernel: RBP:
>> 0000000000002000 R08: 0000000000000000 R09: 00000000024bcfb0
>> 2022-12-22T14:09:51.419440+08:00 [localhost] kernel: R10:
>> fffffffffffff4bf R11: 0000000000000293 R12: 00000000000006b7
>> 2022-12-22T14:09:51.419440+08:00 [localhost] kernel: R13:
>> 000000000000003d R14: 0000000000000000 R15: 00000000024a1680
>> 2022-12-22T14:09:51.419441+08:00 [localhost] kernel: </TASK>
>> 2022-12-22T14:09:51.419441+08:00 [localhost] kernel: Modules linked
>> in: [last unloaded: ecc]
>> 2022-12-22T14:09:51.419442+08:00 [localhost] kernel: CR2: 0000000000000024
>> 2022-12-22T14:09:51.419442+08:00 [localhost] kernel: ---[ end trace
>> 0000000000000000 ]---
>> 2022-12-22T14:09:51.419443+08:00 [localhost] kernel: RIP:
>> 0010:f2fs_issue_flush+0x10e/0x180
>> 2022-12-22T14:09:51.419443+08:00 [localhost] kernel: Code: ba 01 00 00
>> 00 be 03 00 00 00 e8 ad e8 d5 ff 48 83 3b 00 74 1e 48 89 e7 e8 7f c1
>> 84 00 f0 ff 4b 24 8b 44 24 2c e9 66 ff ff ff <f0> ff 43 24 e9 4a ff ff
>> ff 45 31 ff 4c 87 7b 28 4d 85 ff 74 d6 44
>> 2022-12-22T14:09:51.419443+08:00 [localhost] kernel: RSP:
>> 0018:ffffc90003903df0 EFLAGS: 00010246
>> 2022-12-22T14:09:51.419444+08:00 [localhost] kernel: RAX:
>> ffff888100106d80 RBX: 0000000000000000 RCX: 0000000000000000
>> 2022-12-22T14:09:51.419444+08:00 [localhost] kernel: RDX:
>> 0000000010000088 RSI: 0000000000b0e2ba RDI: ffff888116227000
>> 2022-12-22T14:09:51.419445+08:00 [localhost] kernel: RBP:
>> ffff888116227000 R08: 0000000000000000 R09: ffff8881162272a8
>> 2022-12-22T14:09:51.419445+08:00 [localhost] kernel: R10:
>> 0000000000000000 R11: 0000000000000000 R12: 0000000000000024
>> 2022-12-22T14:09:51.419445+08:00 [localhost] kernel: R13:
>> 0000000000b0e2ba R14: 0000000000b0e2ba R15: 0000000000000000
>> 2022-12-22T14:09:51.419446+08:00 [localhost] kernel: FS:
>> 00007ff03fdf0b80(0000) GS:ffff88883f380000(0000)
>> knlGS:0000000000000000
>> 2022-12-22T14:09:51.419446+08:00 [localhost] kernel: CS:  0010 DS:
>> 0000 ES: 0000 CR0: 0000000080050033
>> 2022-12-22T14:09:51.419446+08:00 [localhost] kernel: CR2:
>> 0000000000000024 CR3: 000000013d64e006 CR4: 0000000000770ee0
>> 2022-12-22T14:09:51.419447+08:00 [localhost] kernel: PKRU: 55555554
>
> Thanks for the report! I'm adding this to regzbot:
>
> #regzbot ^introduced v6.1.1..v6.2
> #regzbot title f2fs: kernel NULL pointer dereference when writing file
>

Oops, I mean:

#regzbot introduced v6.1.1..72a85e2b0a1e1e

Also, Cc'ed other F2FS maintainers and relevant lists.

Thanks.

--
An old man doll... just what I always wanted! - Clara


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
