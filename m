Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB868B2371
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Apr 2024 16:03:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rzzgx-0008FT-S8;
	Thu, 25 Apr 2024 14:03:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3lmIqZgkbAD0rxyjZkkdqZoohc.fnnfkdtrdqbnmsdms.bnl@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1rzzgw-0008FN-Kh for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Apr 2024 14:03:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:To:From:
 Subject:Message-ID:In-Reply-To:Date:MIME-Version:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:References:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Rbu4sBShjUWT70B5cAw3x4DCO9Kl2R83zlzt32Awcq4=; b=fnNIgUJNXNzHTucXYhHM1puuIZ
 ljX6kkWpKpuIvoDG2SNk5wf2TsnJhxNme0dR1XUGRhE8sGgpp7eooz5XB78AifSGKkmD9Y0iCgTuw
 e0xhhWq/tO23a1WsJNYuK1o2hQoEAwm9IAc2KXYFTwGuNxMLF3YVZsA2yaORJ8TmdHWk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:To:From:Subject:Message-ID:
 In-Reply-To:Date:MIME-Version:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Rbu4sBShjUWT70B5cAw3x4DCO9Kl2R83zlzt32Awcq4=; b=g+6BbZcCD6vpjgJlqgGB9nl+te
 0vS9AX0rcR1ptjgUcNRbCK3Y0zpX+RSflrW6dKk8EP5wwtMYL6Sta1OIYozd9Zdnvbo/pvMm7NHRC
 x6MWgs5zh61CtF6xfNTP46GW6/xBkR6viyeboktUBqKAsuOTqrjYTjJ/d5Ik8J5NxgyU=;
Received: from mail-io1-f70.google.com ([209.85.166.70])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rzzgv-0001aW-4I for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Apr 2024 14:03:14 +0000
Received: by mail-io1-f70.google.com with SMTP id
 ca18e2360f4ac-7de5098333bso97499039f.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 25 Apr 2024 07:03:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714053783; x=1714658583;
 h=content-transfer-encoding:to:from:subject:message-id:in-reply-to
 :date:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rbu4sBShjUWT70B5cAw3x4DCO9Kl2R83zlzt32Awcq4=;
 b=InrwXhSVr+wruTrcwjXPJLRDdbf2aTxGDvCuBtoXRk7P/3bkqtlqNMP9Yviy/YPX3m
 uRuL+6jJCNk6LaoSdh4RMLgLBovXQepdVGlnm3ZZlOJg7rVJqkLjhZEx++Jo+rnbWROB
 NqY3EQBTjIIxdz7IVs6SpYYEsZhY6U49tGItFb1/CFPwAM5V1CdmmUMh6xJo59jqeBn6
 N7I/Wfve1AJwXJAVh4ipyuOQ+UgaW1r8S6gTYp6TPrD3dlBYH3wPp8QOQ55rcRROgc4D
 oBGdEMGKGoV3Szw5GK5/iTe5rTtQV3tORKtTZLfYEllJ4IBCOKajOWmsK6WBleCbw0Fl
 VTdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW89levmX+xZG2uUuN2fARcIHhwGodsxhndBypJtkzk7yusavmrkuEjGqZJzfXKS8AuF0myrBb5bLogLvJoq+E2Eox29YupR3+XvJNvYi/isf0KHN+XIQ==
X-Gm-Message-State: AOJu0YzrsnVmnZRNTIcMJN5PSJGQPvbe8+IuuyG/9c0v7/I7WVN6BK1o
 3gxacDl/xptw5vIoxkPF4Mh3LfMHDwu3s7dFCx9Ti0aVvAHJWeOs8VfI7jaZTYXxX67FD1039X3
 F32Qop2vPfxqmnjSxt59Ud6UQeyabR8vebeO7WqIlCj/P6h7V4nITUT0=
X-Google-Smtp-Source: AGHT+IEUdMKaSNZFthhRzd3GfFmA1ikn5mS42qjqNPjREfi79pP01XUXD66jainBFpglV5oKMc5Kz9cxwKFx406EXSf1pyH2y+0B
MIME-Version: 1.0
X-Received: by 2002:a05:6638:841e:b0:486:e390:16a5 with SMTP id
 iq30-20020a056638841e00b00486e39016a5mr293770jab.3.1714053782795; Thu, 25 Apr
 2024 07:03:02 -0700 (PDT)
Date: Thu, 25 Apr 2024 07:03:02 -0700
In-Reply-To: <bf941367-5efc-4e79-8cac-208016e5a9b4@kernel.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000d9b4020616ec3e05@google.com>
From: syzbot <syzbot+3694e283cf5c40df6d14@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot tried to test the proposed patch but the build/boot
 failed: ][ T1] usbcore: registered new interface driver port100 [ 7.895087][
 T1] usbcore: registered new interface driver nfcmrvl [ 7.905107][ T1] Loading
 iSCSI transport class v2.0-870. [ 7.922010][ T1] virt [...] 
 Content analysis details:   (0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: syzkaller.appspot.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.70 listed in list.dnswl.org]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.70 listed in wl.mailspike.net]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1rzzgv-0001aW-4I
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] KASAN: slab-out-of-bounds Read in
 f2fs_get_node_info
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

syzbot tried to test the proposed patch but the build/boot failed:

][    T1] usbcore: registered new interface driver port100
[    7.895087][    T1] usbcore: registered new interface driver nfcmrvl
[    7.905107][    T1] Loading iSCSI transport class v2.0-870.
[    7.922010][    T1] virtio_scsi virtio0: 1/0/0 default/read/poll queues
[    7.931607][    T1] ------------[ cut here ]------------
[    7.932648][    T1] refcount_t: decrement hit 0; leaking memory.
[    7.933996][    T1] WARNING: CPU: 0 PID: 1 at lib/refcount.c:31 refcount_warn_saturate+0xfa/0x1d0
[    7.935773][    T1] Modules linked in:
[    7.936430][    T1] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.9.0-rc1-syzkaller-00035-g5f5d424df7e0 #0
[    7.938346][    T1] Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 03/27/2024
[    7.940220][    T1] RIP: 0010:refcount_warn_saturate+0xfa/0x1d0
[    7.941129][    T1] Code: b2 00 00 00 e8 e7 3e f2 fc 5b 5d c3 cc cc cc cc e8 db 3e f2 fc c6 05 d1 c3 ce 0a 01 90 48 c7 c7 60 57 fe 8b e8 37 bd b4 fc 90 <0f> 0b 90 90 eb d9 e8 bb 3e f2 fc c6 05 ae c3 ce 0a 01 90 48 c7 c7
[    7.944817][    T1] RSP: 0000:ffffc90000066e18 EFLAGS: 00010246
[    7.946204][    T1] RAX: 66500b6c8a695200 RBX: ffff88814074d61c RCX: ffff8880166c8000
[    7.947881][    T1] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
[    7.949474][    T1] RBP: 0000000000000004 R08: ffffffff8157ffe2 R09: fffffbfff1bf96e0
[    7.950651][    T1] R10: dffffc0000000000 R11: fffffbfff1bf96e0 R12: ffffea000083fdc0
[    7.952066][    T1] R13: ffffea000083fdc8 R14: 1ffffd4000107fb9 R15: 0000000000000000
[    7.953537][    T1] FS:  0000000000000000(0000) GS:ffff8880b9400000(0000) knlGS:0000000000000000
[    7.955023][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    7.956765][    T1] CR2: ffff88823ffff000 CR3: 000000000df32000 CR4: 00000000003506f0
[    7.958239][    T1] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[    7.959594][    T1] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[    7.960858][    T1] Call Trace:
[    7.961668][    T1]  <TASK>
[    7.962214][    T1]  ? __warn+0x163/0x4e0
[    7.963029][    T1]  ? refcount_warn_saturate+0xfa/0x1d0
[    7.964034][    T1]  ? report_bug+0x2b3/0x500
[    7.964911][    T1]  ? refcount_warn_saturate+0xfa/0x1d0
[    7.965754][    T1]  ? handle_bug+0x3e/0x70
[    7.966390][    T1]  ? exc_invalid_op+0x1a/0x50
[    7.967476][    T1]  ? asm_exc_invalid_op+0x1a/0x20
[    7.968393][    T1]  ? __warn_printk+0x292/0x360
[    7.969171][    T1]  ? refcount_warn_saturate+0xfa/0x1d0
[    7.969977][    T1]  ? refcount_warn_saturate+0xf9/0x1d0
[    7.971093][    T1]  __free_pages_ok+0xc54/0xd80
[    7.971989][    T1]  make_alloc_exact+0xa3/0xf0
[    7.972707][    T1]  vring_alloc_queue_split+0x20a/0x600
[    7.974010][    T1]  ? __pfx_vring_alloc_queue_split+0x10/0x10
[    7.975606][    T1]  ? vp_find_vqs+0x4c/0x4e0
[    7.976506][    T1]  ? virtscsi_probe+0x3ea/0xf60
[    7.977276][    T1]  ? virtio_dev_probe+0x991/0xaf0
[    7.978066][    T1]  ? really_probe+0x2b8/0xad0
[    7.978729][    T1]  ? driver_probe_device+0x50/0x430
[    7.979895][    T1]  vring_create_virtqueue_split+0xc6/0x310
[    7.980907][    T1]  ? ret_from_fork+0x4b/0x80
[    7.981907][    T1]  ? __pfx_vring_create_virtqueue_split+0x10/0x10
[    7.983053][    T1]  vring_create_virtqueue+0xca/0x110
[    7.984261][    T1]  ? __pfx_vp_notify+0x10/0x10
[    7.985081][    T1]  ? __pfx_virtscsi_ctrl_done+0x10/0x10
[    7.986232][    T1]  setup_vq+0xe9/0x2d0
[    7.987144][    T1]  ? __pfx_vp_notify+0x10/0x10
[    7.988136][    T1]  ? __pfx_virtscsi_ctrl_done+0x10/0x10
[    7.989737][    T1]  ? __pfx_virtscsi_ctrl_done+0x10/0x10
[    7.990898][    T1]  ? __pfx_virtscsi_ctrl_done+0x10/0x10
[    7.992460][    T1]  vp_setup_vq+0xbf/0x330
[    7.993445][    T1]  ? __pfx_vp_config_changed+0x10/0x10
[    7.994457][    T1]  ? ioread16+0x2f/0x90
[    7.995411][    T1]  ? __pfx_virtscsi_ctrl_done+0x10/0x10
[    7.996442][    T1]  vp_find_vqs_msix+0x8b2/0xc80
[    7.997332][    T1]  vp_find_vqs+0x4c/0x4e0
[    7.998606][    T1]  virtscsi_init+0x8db/0xd00
[    7.999359][    T1]  ? __pfx_virtscsi_init+0x10/0x10
[    8.000096][    T1]  ? __pfx_default_calc_sets+0x10/0x10
[    8.001321][    T1]  ? scsi_host_alloc+0xa57/0xea0
[    8.002518][    T1]  ? vp_get+0xfd/0x140
[    8.003649][    T1]  virtscsi_probe+0x3ea/0xf60
[    8.004550][    T1]  ? __pfx_virtscsi_probe+0x10/0x10
[    8.005302][    T1]  ? vp_setup_vq+0x26d/0x330
[    8.006401][    T1]  ? __pfx_vp_set_status+0x10/0x10
[    8.007509][    T1]  ? vp_set_status+0x1a/0x40
[    8.008360][    T1]  ? virtio_no_restricted_mem_acc+0x9/0x10
[    8.009422][    T1]  ? virtio_features_ok+0x10c/0x270
[    8.010463][    T1]  virtio_dev_probe+0x991/0xaf0
[    8.011159][    T1]  ? __pfx_virtio_dev_probe+0x10/0x10
[    8.012074][    T1]  really_probe+0x2b8/0xad0
[    8.012764][    T1]  __driver_probe_device+0x1a2/0x390
[    8.013825][    T1]  driver_probe_device+0x50/0x430
[    8.014890][    T1]  __driver_attach+0x45f/0x710
[    8.015600][    T1]  ? __pfx___driver_attach+0x10/0x10
[    8.016479][    T1]  bus_for_each_dev+0x239/0x2b0
[    8.017551][    T1]  ? __pfx___driver_attach+0x10/0x10
[    8.018401][    T1]  ? __pfx_bus_for_each_dev+0x10/0x10
[    8.019494][    T1]  ? do_raw_spin_unlock+0x13c/0x8b0
[    8.020300][    T1]  bus_add_driver+0x347/0x620
[    8.020992][    T1]  driver_register+0x23a/0x320
[    8.021940][    T1]  ? __pfx_virtio_scsi_init+0x10/0x10
[    8.022834][    T1]  virtio_scsi_init+0x65/0xe0
[    8.023816][    T1]  ? __pfx_virtio_scsi_init+0x10/0x10
[    8.024765][    T1]  do_one_initcall+0x248/0x880
[    8.025532][    T1]  ? __pfx_virtio_scsi_init+0x10/0x10
[    8.026403][    T1]  ? __pfx_lockdep_hardirqs_on_prepare+0x10/0x10
[    8.027532][    T1]  ? __pfx_do_one_initcall+0x10/0x10
[    8.028306][    T1]  ? __pfx_parse_args+0x10/0x10
[    8.029137][    T1]  ? do_initcalls+0x1c/0x80
[    8.029885][    T1]  ? rcu_is_watching+0x15/0xb0
[    8.031051][    T1]  do_initcall_level+0x157/0x210
[    8.032038][    T1]  do_initcalls+0x3f/0x80
[    8.032723][    T1]  kernel_init_freeable+0x435/0x5d0
[    8.033666][    T1]  ? __pfx_kernel_init_freeable+0x10/0x10
[    8.034835][    T1]  ? __pfx_lockdep_hardirqs_on_prepare+0x10/0x10
[    8.035863][    T1]  ? __pfx_kernel_init+0x10/0x10
[    8.036989][    T1]  ? __pfx_kernel_init+0x10/0x10
[    8.037733][    T1]  ? __pfx_kernel_init+0x10/0x10
[    8.038424][    T1]  kernel_init+0x1d/0x2b0
[    8.039045][    T1]  ret_from_fork+0x4b/0x80
[    8.039774][    T1]  ? __pfx_kernel_init+0x10/0x10
[    8.040688][    T1]  ret_from_fork_asm+0x1a/0x30
[    8.041498][    T1]  </TASK>
[    8.041923][    T1] Kernel panic - not syncing: kernel: panic_on_warn set ...
[    8.042985][    T1] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.9.0-rc1-syzkaller-00035-g5f5d424df7e0 #0
[    8.043627][    T1] Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 03/27/2024
[    8.043627][    T1] Call Trace:
[    8.043627][    T1]  <TASK>
[    8.043627][    T1]  dump_stack_lvl+0x241/0x360
[    8.043627][    T1]  ? __pfx_dump_stack_lvl+0x10/0x10
[    8.043627][    T1]  ? __pfx__printk+0x10/0x10
[    8.043627][    T1]  ? _printk+0xd5/0x120
[    8.043627][    T1]  ? vscnprintf+0x5d/0x90
[    8.043627][    T1]  panic+0x349/0x860
[    8.043627][    T1]  ? __warn+0x172/0x4e0
[    8.043627][    T1]  ? __pfx_panic+0x10/0x10
[    8.043627][    T1]  ? show_trace_log_lvl+0x4e6/0x520
[    8.053439][    T1]  ? ret_from_fork_asm+0x1a/0x30
[    8.053439][    T1]  __warn+0x346/0x4e0
[    8.053439][    T1]  ? refcount_warn_saturate+0xfa/0x1d0
[    8.053439][    T1]  report_bug+0x2b3/0x500
[    8.053439][    T1]  ? refcount_warn_saturate+0xfa/0x1d0
[    8.053439][    T1]  handle_bug+0x3e/0x70
[    8.053439][    T1]  exc_invalid_op+0x1a/0x50
[    8.053439][    T1]  asm_exc_invalid_op+0x1a/0x20
[    8.053439][    T1] RIP: 0010:refcount_warn_saturate+0xfa/0x1d0
[    8.053439][    T1] Code: b2 00 00 00 e8 e7 3e f2 fc 5b 5d c3 cc cc cc cc e8 db 3e f2 fc c6 05 d1 c3 ce 0a 01 90 48 c7 c7 60 57 fe 8b e8 37 bd b4 fc 90 <0f> 0b 90 90 eb d9 e8 bb 3e f2 fc c6 05 ae c3 ce 0a 01 90 48 c7 c7
[    8.063386][    T1] RSP: 0000:ffffc90000066e18 EFLAGS: 00010246
[    8.063386][    T1] RAX: 66500b6c8a695200 RBX: ffff88814074d61c RCX: ffff8880166c8000
[    8.063386][    T1] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
[    8.063386][    T1] RBP: 0000000000000004 R08: ffffffff8157ffe2 R09: fffffbfff1bf96e0
[    8.063386][    T1] R10: dffffc0000000000 R11: fffffbfff1bf96e0 R12: ffffea000083fdc0
[    8.063386][    T1] R13: ffffea000083fdc8 R14: 1ffffd4000107fb9 R15: 0000000000000000
[    8.073474][    T1]  ? __warn_printk+0x292/0x360
[    8.073474][    T1]  ? refcount_warn_saturate+0xf9/0x1d0
[    8.073474][    T1]  __free_pages_ok+0xc54/0xd80
[    8.073474][    T1]  make_alloc_exact+0xa3/0xf0
[    8.073474][    T1]  vring_alloc_queue_split+0x20a/0x600
[    8.073474][    T1]  ? __pfx_vring_alloc_queue_split+0x10/0x10
[    8.073474][    T1]  ? vp_find_vqs+0x4c/0x4e0
[    8.073474][    T1]  ? virtscsi_probe+0x3ea/0xf60
[    8.073474][    T1]  ? virtio_dev_probe+0x991/0xaf0
[    8.073474][    T1]  ? really_probe+0x2b8/0xad0
[    8.073474][    T1]  ? driver_probe_device+0x50/0x430
[    8.083348][    T1]  vring_create_virtqueue_split+0xc6/0x310
[    8.083348][    T1]  ? ret_from_fork+0x4b/0x80
[    8.083348][    T1]  ? __pfx_vring_create_virtqueue_split+0x10/0x10
[    8.083348][    T1]  vring_create_virtqueue+0xca/0x110
[    8.083348][    T1]  ? __pfx_vp_notify+0x10/0x10
[    8.083348][    T1]  ? __pfx_virtscsi_ctrl_done+0x10/0x10
[    8.083348][    T1]  setup_vq+0xe9/0x2d0
[    8.083348][    T1]  ? __pfx_vp_notify+0x10/0x10
[    8.083348][    T1]  ? __pfx_virtscsi_ctrl_done+0x10/0x10
[    8.083348][    T1]  ? __pfx_virtscsi_ctrl_done+0x10/0x10
[    8.083348][    T1]  ? __pfx_virtscsi_ctrl_done+0x10/0x10
[    8.083348][    T1]  vp_setup_vq+0xbf/0x330
[    8.093441][    T1]  ? __pfx_vp_config_changed+0x10/0x10
[    8.093441][    T1]  ? ioread16+0x2f/0x90
[    8.093441][    T1]  ? __pfx_virtscsi_ctrl_done+0x10/0x10
[    8.093441][    T1]  vp_find_vqs_msix+0x8b2/0xc80
[    8.093441][    T1]  vp_find_vqs+0x4c/0x4e0
[    8.093441][    T1]  virtscsi_init+0x8db/0xd00
[    8.093441][    T1]  ? __pfx_virtscsi_init+0x10/0x10
[    8.093441][    T1]  ? __pfx_default_calc_sets+0x10/0x10
[    8.093441][    T1]  ? scsi_host_alloc+0xa57/0xea0
[    8.093441][    T1]  ? vp_get+0xfd/0x140
[    8.093441][    T1]  virtscsi_probe+0x3ea/0xf60
[    8.103383][    T1]  ? __pfx_virtscsi_probe+0x10/0x10
[    8.103383][    T1]  ? vp_setup_vq+0x26d/0x330
[    8.103383][    T1]  ? __pfx_vp_set_status+0x10/0x10
[    8.103383][    T1]  ? vp_set_status+0x1a/0x40
[    8.103383][    T1]  ? virtio_no_restricted_mem_acc+0x9/0x10
[    8.103383][    T1]  ? virtio_features_ok+0x10c/0x270
[    8.103383][    T1]  virtio_dev_probe+0x991/0xaf0
[    8.103383][    T1]  ? __pfx_virtio_dev_probe+0x10/0x10
[    8.103383][    T1]  really_probe+0x2b8/0xad0
[    8.103383][    T1]  __driver_probe_device+0x1a2/0x390
[    8.113498][    T1]  driver_probe_device+0x50/0x430
[    8.113498][    T1]  __driver_attach+0x45f/0x710
[    8.113498][    T1]  ? __pfx___driver_attach+0x10/0x10
[    8.113498][    T1]  bus_for_each_dev+0x239/0x2b0
[    8.113498][    T1]  ? __pfx___driver_attach+0x10/0x10
[    8.113498][    T1]  ? __pfx_bus_for_each_dev+0x10/0x10
[    8.113498][    T1]  ? do_raw_spin_unlock+0x13c/0x8b0
[    8.113498][    T1]  bus_add_driver+0x347/0x620
[    8.113498][    T1]  driver_register+0x23a/0x320
[    8.113498][    T1]  ? __pfx_virtio_scsi_init+0x10/0x10
[    8.113498][    T1]  virtio_scsi_init+0x65/0xe0
[    8.123379][    T1]  ? __pfx_virtio_scsi_init+0x10/0x10
[    8.123379][    T1]  do_one_initcall+0x248/0x880
[    8.123379][    T1]  ? __pfx_virtio_scsi_init+0x10/0x10
[    8.123379][    T1]  ? __pfx_lockdep_hardirqs_on_prepare+0x10/0x10
[    8.123379][    T1]  ? __pfx_do_one_initcall+0x10/0x10
[    8.123379][    T1]  ? __pfx_parse_args+0x10/0x10
[    8.123379][    T1]  ? do_initcalls+0x1c/0x80
[    8.123379][    T1]  ? rcu_is_watching+0x15/0xb0
[    8.123379][    T1]  do_initcall_level+0x157/0x210
[    8.123379][    T1]  do_initcalls+0x3f/0x80
[    8.123379][    T1]  kernel_init_freeable+0x435/0x5d0
[    8.133466][    T1]  ? __pfx_kernel_init_freeable+0x10/0x10
[    8.133466][    T1]  ? __pfx_lockdep_hardirqs_on_prepare+0x10/0x10
[    8.133466][    T1]  ? __pfx_kernel_init+0x10/0x10
[    8.133466][    T1]  ? __pfx_kernel_init+0x10/0x10
[    8.133466][    T1]  ? __pfx_kernel_init+0x10/0x10
[    8.133466][    T1]  kernel_init+0x1d/0x2b0
[    8.133466][    T1]  ret_from_fork+0x4b/0x80
[    8.133466][    T1]  ? __pfx_kernel_init+0x10/0x10
[    8.133466][    T1]  ret_from_fork_asm+0x1a/0x30
[    8.133466][    T1]  </TASK>
[    8.133466][    T1] Kernel Offset: disabled
[    8.133466][    T1] Rebooting in 86400 seconds..


syzkaller build log:
go env (err=<nil>)
GO111MODULE='auto'
GOARCH='amd64'
GOBIN=''
GOCACHE='/syzkaller/.cache/go-build'
GOENV='/syzkaller/.config/go/env'
GOEXE=''
GOEXPERIMENT=''
GOFLAGS=''
GOHOSTARCH='amd64'
GOHOSTOS='linux'
GOINSECURE=''
GOMODCACHE='/syzkaller/jobs-2/linux/gopath/pkg/mod'
GONOPROXY=''
GONOSUMDB=''
GOOS='linux'
GOPATH='/syzkaller/jobs-2/linux/gopath'
GOPRIVATE=''
GOPROXY='https://proxy.golang.org,direct'
GOROOT='/usr/local/go'
GOSUMDB='sum.golang.org'
GOTMPDIR=''
GOTOOLCHAIN='auto'
GOTOOLDIR='/usr/local/go/pkg/tool/linux_amd64'
GOVCS=''
GOVERSION='go1.21.4'
GCCGO='gccgo'
GOAMD64='v1'
AR='ar'
CC='gcc'
CXX='g++'
CGO_ENABLED='1'
GOMOD='/syzkaller/jobs-2/linux/gopath/src/github.com/google/syzkaller/go.mod'
GOWORK=''
CGO_CFLAGS='-O2 -g'
CGO_CPPFLAGS=''
CGO_CXXFLAGS='-O2 -g'
CGO_FFLAGS='-O2 -g'
CGO_LDFLAGS='-O2 -g'
PKG_CONFIG='pkg-config'
GOGCCFLAGS='-fPIC -m64 -pthread -Wl,--no-gc-sections -fmessage-length=0 -ffile-prefix-map=/tmp/go-build543475362=/tmp/go-build -gno-record-gcc-switches'

git status (err=<nil>)
HEAD detached at 36c961ad9
nothing to commit, working tree clean


tput: No value for $TERM and no -T specified
tput: No value for $TERM and no -T specified
Makefile:31: run command via tools/syz-env for best compatibility, see:
Makefile:32: https://github.com/google/syzkaller/blob/master/docs/contributing.md#using-syz-env
go list -f '{{.Stale}}' ./sys/syz-sysgen | grep -q false || go install ./sys/syz-sysgen
make .descriptions
tput: No value for $TERM and no -T specified
tput: No value for $TERM and no -T specified
Makefile:31: run command via tools/syz-env for best compatibility, see:
Makefile:32: https://github.com/google/syzkaller/blob/master/docs/contributing.md#using-syz-env
bin/syz-sysgen
touch .descriptions
GOOS=linux GOARCH=amd64 go build "-ldflags=-s -w -X github.com/google/syzkaller/prog.GitRevision=36c961ad9dc0e5b72efc784a57717424a02bfa00 -X 'github.com/google/syzkaller/prog.gitRevisionDate=20240422-084642'" "-tags=syz_target syz_os_linux syz_arch_amd64 " -o ./bin/linux_amd64/syz-fuzzer github.com/google/syzkaller/syz-fuzzer
GOOS=linux GOARCH=amd64 go build "-ldflags=-s -w -X github.com/google/syzkaller/prog.GitRevision=36c961ad9dc0e5b72efc784a57717424a02bfa00 -X 'github.com/google/syzkaller/prog.gitRevisionDate=20240422-084642'" "-tags=syz_target syz_os_linux syz_arch_amd64 " -o ./bin/linux_amd64/syz-execprog github.com/google/syzkaller/tools/syz-execprog
GOOS=linux GOARCH=amd64 go build "-ldflags=-s -w -X github.com/google/syzkaller/prog.GitRevision=36c961ad9dc0e5b72efc784a57717424a02bfa00 -X 'github.com/google/syzkaller/prog.gitRevisionDate=20240422-084642'" "-tags=syz_target syz_os_linux syz_arch_amd64 " -o ./bin/linux_amd64/syz-stress github.com/google/syzkaller/tools/syz-stress
mkdir -p ./bin/linux_amd64
gcc -o ./bin/linux_amd64/syz-executor executor/executor.cc \
	-m64 -O2 -pthread -Wall -Werror -Wparentheses -Wunused-const-variable -Wframe-larger-than=16384 -Wno-stringop-overflow -Wno-array-bounds -Wno-format-overflow -Wno-unused-but-set-variable -Wno-unused-command-line-argument -static-pie -fpermissive -w -DGOOS_linux=1 -DGOARCH_amd64=1 \
	-DHOSTGOOS_linux=1 -DGIT_REVISION=\"36c961ad9dc0e5b72efc784a57717424a02bfa00\"


Error text is too large and was truncated, full error text is at:
https://syzkaller.appspot.com/x/error.txt?x=1241f68b180000


Tested on:

commit:         5f5d424d f2fs: fix to do sanity check on i_xattr_nid i..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/syzbot
kernel config:  https://syzkaller.appspot.com/x/.config?x=1ace29459a0a1915
dashboard link: https://syzkaller.appspot.com/bug?extid=3694e283cf5c40df6d14
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Note: no patches were applied.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
