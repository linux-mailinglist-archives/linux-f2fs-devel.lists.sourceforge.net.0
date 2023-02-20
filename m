Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E8B69D282
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 Feb 2023 19:04:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pUAWH-0003IU-Qu;
	Mon, 20 Feb 2023 18:04:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <oswalpalash@gmail.com>) id 1pUAWG-0003IO-V2
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 20 Feb 2023 18:04:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:Subject:Message-ID:Date:From:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=A6D0LDt5tOZpJuOjBEExW7WXP/fQt80zWM8U7ozVGKY=; b=EQ8pDhUalIDn7mmhZFkLY2coRY
 zGPnM9JnuVZg0rqTC3Xe6elxjU0H42n8UhSEnN2EEZgX+UeozalrShTCuoqnPVzAeHTp9iVRRhcq9
 V+rASuqewW4SGwwP3UDwnP7aL/wRIlJ6HIwDArAp84VJ0mo++Bp3uQq/AzRs0pyN2jG8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:Subject:Message-ID:Date:From:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=A6D0LDt5tOZpJuOjBEExW7WXP/fQt80zWM8U7ozVGKY=; b=V
 VyUMaW6M2pfxA3dq37S7Z3YiABOlRxW12I2tcJk0LdNMKlSL1Budi4ZFk+yUykkwjcrrug3SYGvux
 LXNhJaO8/z74WQ0Zfpn36WxMyEPawgY/0sMffx34bn9Ek/ax2O7177BIAcDEirow1zVTQqreWBV9e
 RUz4UWZmytsmbm9Q=;
Received: from mail-ed1-f50.google.com ([209.85.208.50])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pUAWC-0006F1-3A for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 20 Feb 2023 18:04:08 +0000
Received: by mail-ed1-f50.google.com with SMTP id f13so7332341edz.6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 20 Feb 2023 10:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=A6D0LDt5tOZpJuOjBEExW7WXP/fQt80zWM8U7ozVGKY=;
 b=J+BefhrSZAVrhQrTx474ZlE6ZYO1CqSsZoKgn+OBFZjvHO15QVaOCnNCR9L59DqFTR
 h9msqBhlEtFVFdXB6Tqvddobh+ws7R1VOmF7JN1J0s0hW1P33sqrV6qDBWs4oUsyaobX
 r+P4Jsay/hi6G98U4pthAFK1kU7ZoQESzw0P38WF8NuZSIvdA6Oxp6fXLEUNvGnoIP3B
 Cn5dXp3fI98uUeRBVnhHT9oH9A6+ChxJgBKKYOPXGYiJfvTc84X6TZM0uudxudsZL7OH
 PUWwbRijzbtOMOPenHvFke4kmXDW1h7eTNzFyRPWXL5vt39I82EovnwB13wHUBQycnCB
 epxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=A6D0LDt5tOZpJuOjBEExW7WXP/fQt80zWM8U7ozVGKY=;
 b=FxRp1HkhVahcNfGZ+oxCMJ6jzn1fQPJNVj/7sAZjEoxs1iJDt5hRzRIDOjmoNZ0nFP
 8ydhylllgIeCB/zzDtUny8oABaMDpeXFJBqCG5OGgJ5Fejyi27DiSYjTTzYn7gWUb93q
 b3FRfl2qonP6tMavBpZVj9B+TkYNicK2/xx4CU2F2l9hwsWiUZ0svkejlvRuHZECLAqk
 rjD21V09CqiBKxuKSRmz6RzzfyQGjqaGJLTveTN/xK3SGKKsbT3uiFxr7KY36Pv/+KI0
 Wn9fLYlx7Gmj61T+ZBKvKHao+dKMYhjDza0H1oCEhfONhC0U4fV5wOYFLdkiIHhlZlUh
 dNFA==
X-Gm-Message-State: AO0yUKXoKBJjsRbbrEMNeN7/5A+M2rHs4UIn6d+sizEdUWh4iaAvYgyW
 D2qgoWkWlX3c9uGLk8ttoMXnVYWGRYKh6gH1SmecgvgAUqG9ow==
X-Google-Smtp-Source: AK7set/F7AmbmO+7Raxe54NXRABadQSL0C2q0GLFiBydRAav0Bs+FawkHoqI2NOzaAP9ZSU6WNmv2MUPxHQ80tiqz1o=
X-Received: by 2002:a17:906:b746:b0:88d:64e7:a2be with SMTP id
 fx6-20020a170906b74600b0088d64e7a2bemr4747888ejb.15.1676916238232; Mon, 20
 Feb 2023 10:03:58 -0800 (PST)
MIME-Version: 1.0
From: Palash Oswal <oswalpalash@gmail.com>
Date: Mon, 20 Feb 2023 10:03:46 -0800
Message-ID: <CAGyP=7cYsboh5JSczkZR31_+dPh=XRq4TBF63u8jQcX3h3biLw@mail.gmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, LKML <linux-kernel@vger.kernel.org>, 
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello, I found the following issue using syzkaller on: HEAD
 commit : e60276b8c11ab4a8be23807bc67b04 8cfb937dfa (v6.0.8) git tree: stable
 C Reproducer :
 https://gist.github.com/oswalpalash/eb758955c10d951eae2b5995ffe11d8c
 Kernel .config :
 https://gist.github.com/oswalpalash/0962c70d774e5ec736a047bba917cecb
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [oswalpalash[at]gmail.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.208.50 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.50 listed in wl.mailspike.net]
X-Headers-End: 1pUAWC-0006F1-3A
Subject: [f2fs-dev] KASAN: null-ptr-deref Write in f2fs_stop_discard_thread
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
I found the following issue using syzkaller on:
HEAD commit : e60276b8c11ab4a8be23807bc67b04
8cfb937dfa (v6.0.8)
git tree: stable

C Reproducer : https://gist.github.com/oswalpalash/eb758955c10d951eae2b5995ffe11d8c
Kernel .config :
https://gist.github.com/oswalpalash/0962c70d774e5ec736a047bba917cecb

Console log :

==================================================================
BUG: KASAN: null-ptr-deref in kthread_stop+0x8b/0x710
Write of size 4 at addr 000000000000001c by task syz-executor.0/6491

CPU: 1 PID: 6491 Comm: syz-executor.0 Not tainted 6.0.8-pasta #2
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
1.13.0-1ubuntu1.1 04/01/2014
Call Trace:
 <TASK>
 dump_stack_lvl+0xcd/0x134
 print_report.cold+0x36/0x63a
 kasan_report+0x8a/0x1b0
 kasan_check_range+0x13b/0x190
 kthread_stop+0x8b/0x710
 f2fs_stop_discard_thread+0x91/0xb0
 kill_f2fs_super+0xde/0x3e0
 deactivate_locked_super+0x8c/0xf0
 deactivate_super+0xad/0xd0
 cleanup_mnt+0x347/0x4b0
 task_work_run+0xe0/0x1a0
 exit_to_user_mode_prepare+0x25d/0x270
 syscall_exit_to_user_mode+0x19/0x50
 do_syscall_64+0x42/0xb0
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7fb3a5c9143b
Code: ff ff ff f7 d8 64 89 01 48 83 c8 ff c3 66 90 f3 0f 1e fa 31 f6
e9 05 00 00 00 0f 1f 44 00 00 f3 0f 1e fa b8 a6 00 00 00 0f 05 <48> 3d
01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffe801d8e68 EFLAGS: 00000246 ORIG_RAX: 00000000000000a6
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 00007fb3a5c9143b
RDX: 00007fb3a5c28a90 RSI: 000000000000000a RDI: 00007ffe801d8f30
RBP: 00007ffe801d8f30 R08: 00007fb3a5cfba1f R09: 00007ffe801d8cf0
R10: 00000000fffffffb R11: 0000000000000246 R12: 00007fb3a5cfb9f8
R13: 00007ffe801d9fd0 R14: 0000555557244d90 R15: 0000000000000032
 </TASK>
==================================================================


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
