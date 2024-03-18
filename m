Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 743AF87E676
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 18 Mar 2024 10:54:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rm9hB-0002de-8J;
	Mon, 18 Mar 2024 09:54:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <eugen.hristev@collabora.com>) id 1rm9hA-0002dW-5N
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 18 Mar 2024 09:54:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ehaNQTI64Z3+K/WGWH5RVlzhS2J9iUY1QhI1YNSNA/8=; b=j2M5u4TJzuk2C5tJ9r3kL1Y7a7
 PPIIu9OmZ/LpJEOtrK+R4VNyYXP0Xl0QRGfLDOR/otkDwGjL1GJZ5EqAevBw2B+XW7OmjlvfAzncV
 TQ4jgoMgKNmXt1kTEjAaJOSGA3LNulD1khrwKtuZiDjTF+uxlyQk4/ySVayCKEGCn6l4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ehaNQTI64Z3+K/WGWH5RVlzhS2J9iUY1QhI1YNSNA/8=; b=GcnSVzElUCaq3L6S2SVkSHFMHS
 dqoJ+BG57PLFFBE4snZQne4/ay5rdoWeBXigpDBQVPKaV2X/VcHkFlA+BoztF208UAetdOckyGSTN
 uxXequoogdwFfGyEFDxlNC5vhv5+U9QG2646ZiuuJwIHE8ZBdue60iBRpl3xEoTv28m0=;
Received: from madrid.collaboradmins.com ([46.235.227.194])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rm9gx-0002k4-S9 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 18 Mar 2024 09:54:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1710755639;
 bh=SRglM2PBHV4RNTf7tLETeShVgLn5d55vx8MZNE7zvQg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=xnoeNPEIL9MQK915O+a9dDj7qJx/fLSrZ0SOsAvnWDzUhpWc8UCi40xfYEcf0LVG2
 6vlBOS0Z/YqF1rF1Y09Xdo0H/gh3g1uWK7V71J4vFxSjA0EX9QqWiXvh2/3WpwebR6
 RsBPA4Yyf9xDs8OvWY1zDRVqMd44wEnA9B3JPjOrRGpn/Mf2/cIKmXa19mZ6BGV6Gn
 twwXb7PzK1M1Nr/NLReSq9LxKBAliuCpog5EII/vqfh6F6GKT4icAzBPHCMIIalpJM
 KFN0l6U++DWCcb/OkM+qDuj/c05daFoyxiXDIxMEykKVRfs2M/76AJW2lNLOOm81z3
 KyiNZIQBt17Yw==
Received: from [100.90.194.27] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: ehristev)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9BA15378203E;
 Mon, 18 Mar 2024 09:53:56 +0000 (UTC)
Message-ID: <cea072bf-0ae5-4d0d-b0db-cd2ac772f463@collabora.com>
Date: Mon, 18 Mar 2024 11:53:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Gabriel Krisman Bertazi <krisman@suse.de>
References: <20240305101608.67943-1-eugen.hristev@collabora.com>
 <20240305101608.67943-3-eugen.hristev@collabora.com>
 <87edcdk8li.fsf@mailhost.krisman.be>
 <aaa4561e-fd23-4b21-8963-7ba4cc99eed3@collabora.com>
 <8734sskha1.fsf@mailhost.krisman.be>
In-Reply-To: <8734sskha1.fsf@mailhost.krisman.be>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/14/24 16:41,
 Gabriel Krisman Bertazi wrote: > Eugen Hristev
 <eugen.hristev@collabora.com> writes: > >>> Please, make sure you actually
 stress test this patchset with fstests >>> against both f2fs [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rm9gx-0002k4-S9
Subject: Re: [f2fs-dev] [PATCH v13 2/9] f2fs: Simplify the handling of
 cached insensitive names
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
From: Eugen Hristev via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eugen Hristev <eugen.hristev@collabora.com>
Cc: brauner@kernel.org, kernel@collabora.com, tytso@mit.edu, jack@suse.cz,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 adilger.kernel@dilger.ca, viro@zeniv.linux.org.uk,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, linux-ext4@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 3/14/24 16:41, Gabriel Krisman Bertazi wrote:
> Eugen Hristev <eugen.hristev@collabora.com> writes:
> 
>>> Please, make sure you actually stress test this patchset with fstests
>>> against both f2fs and ext4 before sending each new version.
>>
>> I did run the xfstests, however, maybe I did not run the full suite, or maybe I am
>> running it in a wrong way ?
> 
> No worries.  Did you manage to reproduce it?

Yes, thank you, using qemu on the x86_64 with your commands below.

While the oops was caused by that wrong kfree call, fixing it and moving further
got me into further problems.
I am unsure though how these patches cause it.

Here is a snippet of the problem that occurs now :

generic/417 12s ... [  616.265444] run fstests generic/417 at 2024-03-18 09:22:48
[  616.768435] ------------[ cut here ]------------
[  616.769493] WARNING: CPU: 4 PID: 133 at block/blk-merge.c:580
__blk_rq_map_sg+0x46a/0x480
[  616.771253] Modules linked in:
[  616.771873] CPU: 4 PID: 133 Comm: kworker/4:1H Not tainted
6.7.0-09941-g554c4640dff5 #18
[  616.773660] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.15.0-1
04/01/2014
[  616.775573] Workqueue: kblockd blk_mq_run_work_fn
[  616.776570] RIP: 0010:__blk_rq_map_sg+0x46a/0x480
[  616.777547] Code: 17 fe ff ff 44 89 58 0c 48 8b 01 e9 ec fc ff ff 43 8d 3c 06 48
8b 14 24 81 ff 00 10 00 00 0f 86 af fc ff ff e9 02 fe ff ff 90 <0f> 0b 90 e9 76 fd
ff ff 90 0f 0b 90 0f 0b 0f 1f 84 00 00 00 00 00
[  616.781245] RSP: 0018:ffff97e4804f3b98 EFLAGS: 00010216
[  616.782322] RAX: 000000000000005e RBX: 0000000000000f10 RCX: ffff8f5701eed000
[  616.783929] RDX: ffffdc0c4052df82 RSI: 0000000000001000 RDI: 00000000fffffffc
[  616.785426] RBP: 000000000000005e R08: 0000000000000000 R09: ffff8f5702120000
[  616.787065] R10: ffffdc0c4052df80 R11: 0000000000000000 R12: ffff8f5702118000
[  616.788650] R13: 0000000000000000 R14: 0000000000001000 R15: ffffdc0c4052df80
[  616.790129] FS:  0000000000000000(0000) GS:ffff8f577db00000(0000)
knlGS:0000000000000000
[  616.791826] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  616.793069] CR2: 00007fbe596adc98 CR3: 000000001162e000 CR4: 0000000000350ef0
[  616.794528] Call Trace:
[  616.795093]  <TASK>
[  616.795541]  ? __warn+0x7f/0x130
[  616.796242]  ? __blk_rq_map_sg+0x46a/0x480
[  616.797101]  ? report_bug+0x199/0x1b0
[  616.797843]  ? handle_bug+0x3d/0x70
[  616.798656]  ? exc_invalid_op+0x18/0x70
[  616.799461]  ? asm_exc_invalid_op+0x1a/0x20
[  616.800313]  ? __blk_rq_map_sg+0x46a/0x480
[  616.801207]  ? __blk_rq_map_sg+0xfc/0x480
[  616.802213]  scsi_alloc_sgtables+0xae/0x2b0
[  616.803258]  sd_init_command+0x181/0x860
[  616.804111]  scsi_queue_rq+0x7c3/0xae0
[  616.804910]  blk_mq_dispatch_rq_list+0x2bf/0x7c0
[  616.805962]  __blk_mq_sched_dispatch_requests+0x40a/0x5c0
[  616.807226]  blk_mq_sched_dispatch_requests+0x34/0x60
[  616.808389]  blk_mq_run_work_fn+0x5f/0x70
[  616.809332]  process_one_work+0x136/0x2f0
[  616.810268]  ? __pfx_worker_thread+0x10/0x10
[  616.811320]  worker_thread+0x2ef/0x400
[  616.812215]  ? __pfx_worker_thread+0x10/0x10
[  616.813205]  kthread+0xd5/0x100
[  616.813907]  ? __pfx_kthread+0x10/0x10
[  616.814787]  ret_from_fork+0x2f/0x50
[  616.815598]  ? __pfx_kthread+0x10/0x10
[  616.816394]  ret_from_fork_asm+0x1b/0x30
[  616.817210]  </TASK>
[  616.817658] ---[ end trace 0000000000000000 ]---
[  616.818687] ------------[ cut here ]------------
[  616.819697] kernel BUG at drivers/scsi/scsi_lib.c:1068!


Do you have any ideas ?

Thanks !
Eugen

> 
>> How are you running the kvm-xfstests with qemu ? Can you share your command
>> arguments please ?
> 
> I don't use kvm-xfstests.  I run ./check directly:
> 
> export SCRATCH_DEV=/dev/loop1
> export SCRATCH_MNT=$BASEMNT/scratch
> export TEST_DEV=/dev/loop0
> export TEST_DIR=$BASEMNT/test
> export RESULT_BASE=${BASEMNT}/results
> export REPORT_DIR=${BASEMNT}/report
> export FSTYP=f2fs
> 
> mkfs.f2fs -f -C utf8 -O casefold ${TEST_DEV}
> 
> ./check -g encrypt,quick
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
