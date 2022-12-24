Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE31655A45
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 24 Dec 2022 15:00:59 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p9551-000624-6L;
	Sat, 24 Dec 2022 14:00:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bagasdotme@gmail.com>) id 1p9550-00061y-FM
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 24 Dec 2022 14:00:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:To:From:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9JXM0KAhlws+0VmPex6+ZlzFQeInZVdFj7LBU8Zn+Dc=; b=SSay4bPQSHfRT+ynBTKFBZSFEl
 pn2/oM3jyv3tGaH53MPndtUKIApOY23zX8jXLuoydoIkp17WfJjHUAck7CkAO7ZZpuf+Cfjqn6yMG
 BbIRLA1dEMklY0U6s9XNNX/mobvN/vx4tfn2JqaGYQt1xH5y0qEYdSM5+Debxrs7vB+I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:To:From:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9JXM0KAhlws+0VmPex6+ZlzFQeInZVdFj7LBU8Zn+Dc=; b=NQg+NZOX/d2qA8PoBz7nzNSQmG
 YWRzQ5AFDkCMy7xZZcu8iqSlpIn5Z10OZU8c6cTzlJ7Zt7MeTNRebnMm+wWtbsrC3UjSN+nqotFeT
 xFEcDL8ElKYvJZldF1A523/OYiIZN+OEsfrOWe/N7OqvsfqeqVnrnrBA/FAFKFfwYHlQ=;
Received: from mail-pl1-f182.google.com ([209.85.214.182])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1p954w-00Amys-NE for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 24 Dec 2022 14:00:50 +0000
Received: by mail-pl1-f182.google.com with SMTP id jn22so7229305plb.13
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 24 Dec 2022 06:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9JXM0KAhlws+0VmPex6+ZlzFQeInZVdFj7LBU8Zn+Dc=;
 b=QoltfF8hkLYSIcmgc9MnXP5eiZB/nYMrUPEXWwdxpC31gwooM1FCX9US6x66b0dOK1
 8G5UE8BwI1WBjd0utuBH7vcaypL2yvbPnfB5Vd2a6LrhOovzDZ5FwX9vuFrMQlsLYQxc
 MZs9yMsPaLhVruG1aURprOVPwwKyYqTGZZXFm2nVrkq0cZc19OimCNM5uvyqIDAaSOPy
 hU3sca/Cb0rryCrlv88uta0+Jg3BNSGkiZRZPojBM/sW3OiHDDQJCfIoHyTvwlakc2fM
 f97AMVi6ZIZm8Fix/Qv1c865G6v3friwurGd6DS430pUeczoEuC3RPy2oDZb04jHc3q2
 NUgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9JXM0KAhlws+0VmPex6+ZlzFQeInZVdFj7LBU8Zn+Dc=;
 b=p0EyBBTCxZ+gg/S2aH111YI0SH2lAmC5poLAvw7yOYXPOo5XXg3KPDp/rKlBKuW4hF
 oMYTPV74unsbceXuctrw6Apdt3Y1kgXuDeReyL2t64xSerSwfMQJ9f5Bxw31oe7752EU
 a9OZtovwJXF6KXkuY7zCGhLtYOScSm4fVZHLW0md8noWjNeKzq0aGpaxjGw2Asjee5k5
 4BGkPqV49B7PsBWtveYzRekQ3RfLKpkVsLU4YnSL5dXpCB+cYMGEwJU/3IBCod0ipG0I
 tLyuzxA2he00NK+CYW+xDOVfJF/OAJD/Mn+W1STFGrm0hRT9ZyX1x2dfkg3/83OFb32W
 LLrA==
X-Gm-Message-State: AFqh2kqi1Km6mJ3cFJAvbEw4D/DR0axE4YEv0JLFWNFR/a1BDkoD3Tqy
 +hAQvOmTz6eJ2kd3azpkJ9o=
X-Google-Smtp-Source: AMrXdXvBxPeQMBBLe4NDEv+BsucJYDxppcvPdxwNY5Fngy+HFMhYlZwOyzCVPZbSV34dU/SK1aPzbw==
X-Received: by 2002:a17:902:ca14:b0:185:441e:222c with SMTP id
 w20-20020a170902ca1400b00185441e222cmr12326548pld.39.1671890439108; 
 Sat, 24 Dec 2022 06:00:39 -0800 (PST)
Received: from [192.168.43.80] (subs02-180-214-232-28.three.co.id.
 [180.214.232.28]) by smtp.gmail.com with ESMTPSA id
 m12-20020a170902d18c00b00186bc66d2cbsm4181746plb.73.2022.12.24.06.00.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Dec 2022 06:00:38 -0800 (PST)
Message-ID: <0c70ba66-ef00-7242-d198-844f803662fa@gmail.com>
Date: Sat, 24 Dec 2022 21:00:33 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Jeff Chua <jeff.chua.linux@gmail.com>, lkml
 <linux-kernel@vger.kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <chao@kernel.org>,
 F2FS Development <linux-f2fs-devel@lists.sourceforge.net>,
 Linux Regressions <regressions@lists.linux.dev>
References: <CAAJw_Ztzyh-GNTJYpXbA0CeJv2Rz=fLZKE6_Q=7JMmM+s9yHXQ@mail.gmail.com>
 <CAAJw_Ztb0mJVkHtBhryf=9g8CA0fZZRa8HVio8GCGUSLOvqa7A@mail.gmail.com>
 <Y6bz4wOC0nwu2yGU@debian.me>
Content-Language: en-US
In-Reply-To: <Y6bz4wOC0nwu2yGU@debian.me>
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/24/22 19:43, Bagas Sanjaya wrote: > On Sat, Dec 24,
 2022 at 01:48:55PM +0800, Jeff Chua wrote: >> Got the following error in latest
 linux-6.2-git with just vim (:w >> file1). No problem with lin [...] 
 Content analysis details:   (0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [bagasdotme[at]gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.182 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.182 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 1.5 RCVD_IN_SORBS_WEB      RBL: SORBS: sender is an abusable web server
 [180.214.232.28 listed in dnsbl.sorbs.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -1.1 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1p954w-00Amys-NE
Subject: Re: [f2fs-dev] f2fs write error Linux v6.2
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
>>
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
