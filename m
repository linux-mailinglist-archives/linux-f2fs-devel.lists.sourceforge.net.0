Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 628068D35C8
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 May 2024 13:48:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sCHmv-00044x-M3;
	Wed, 29 May 2024 11:48:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <38RVXZgkbALIkqrcSddWjShhaV.YggYdWmkWjUgflWfl.Uge@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1sCHmr-00044n-4O for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 May 2024 11:48:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:To:From:
 Subject:Message-ID:In-Reply-To:Date:MIME-Version:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:References:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7que1wCcQSg2LMiw0l1rpP/+1+zrMnwXWbUoNws8Zak=; b=Ht3EhRbIADfBedKNtLdR+eQvqb
 8zllbjG2DnG9qnlm0KaJpbOVkzvFGenEHCp22h7wK+fFObbFAX/DOqTlw8Rqb5IPS4ZvNIM4+2H2n
 pUxWPx0aeH7V8plpmMpjSTHhk5NBhNhKQRMo+8R6xbPw+8rMDqeP0Dknxwq3H8z5Fqgg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:To:From:Subject:Message-ID:
 In-Reply-To:Date:MIME-Version:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7que1wCcQSg2LMiw0l1rpP/+1+zrMnwXWbUoNws8Zak=; b=iuQWvvLokKVAEr1r1iiDogbEeZ
 F3bu5JysXxTKkgLhO9tDkbbJfTPdaCOReTv1rVze9HO6m2wAOaIiAePa7vV9ZBWBjWwyhLBl2crTH
 yyQiBwLDB4V2WkLuehufR+d4wnkY6Qv+mbCkyi89LBdPy3klxUAQm4x2SiDlsmgnvNdI=;
Received: from mail-il1-f197.google.com ([209.85.166.197])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sCHmq-0007it-6I for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 May 2024 11:48:08 +0000
Received: by mail-il1-f197.google.com with SMTP id
 e9e14a558f8ab-371280b8ddfso18890905ab.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 29 May 2024 04:48:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716983281; x=1717588081;
 h=content-transfer-encoding:to:from:subject:message-id:in-reply-to
 :date:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7que1wCcQSg2LMiw0l1rpP/+1+zrMnwXWbUoNws8Zak=;
 b=R/b8S3GUCq8i4NXhKpIgwO/t/IxT3ATTBv8UePZirqgq/9mLr9x6pDYZYT34sp/80+
 CA5j2b6teQfFiY/u5N9UG0YqEB+ZFID/Mg+8t1irn49wr+u06sVi7aoQMhi6NP8HFOGR
 WNkR8q3m1Ei+3eJt3vYtRxzCFOhejxQ3S4YKpx3UjFAT8mY+PVFvVKPlIwyotJPlP+hk
 7nCHbbInN8IHjtSfzlMTHMlfMJN5+1IFed7yNZSdZblTz2r2bxHckFMwo4pU82L/gKTa
 AarH14khDngugOW42zWbS+Ei+ZR49YE5sGeg3uOhuNhnAbACp3PqXoNZbMahspc7+MRU
 o59g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+4CQW+7GWulLr/DndqSwzJDCxlg6kYQbva7FOF91ChUP8q6F6MRTjyNhExFy+ZjohnaZKVV5eIogUWwf2n8rDX+DSMkdPOd4DWUTu+uENTcmg3fjyvA==
X-Gm-Message-State: AOJu0YxrFkM2tQ26yf9AXtQv0sF1PSZkxD2tChv5wNqgTwRlKnWzaWyw
 l66jRZPC6Pa6MSPy0OOQ6HzWpK9i1XscMpLgqNPW8McJg22LxNvcs5ktYetBzhNMn77llsZ6uTg
 r8a1so+/nnnT4JtyH4oR4wqIC3CBpeotqnbyK3poLGcwwpLo48VszGyA=
X-Google-Smtp-Source: AGHT+IGV3pkoeHq2JLojbo7MaYprtJGxEmcl7RRlayhH/M3kW4v5OUCXHAXiDd8NFtiIotxOrYmhhxSVXNADfuHSqkFJ75s/u8Cr
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2196:b0:374:598b:3fec with SMTP id
 e9e14a558f8ab-374598b4269mr5048615ab.5.1716983281767; Wed, 29 May 2024
 04:48:01 -0700 (PDT)
Date: Wed, 29 May 2024 04:48:01 -0700
In-Reply-To: <1f177444-0613-4843-98fe-bcdca2538a07@kernel.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000098718506199652db@google.com>
From: syzbot <syzbot+74ebe2104433e9dc610d@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot tried to test the proposed patch but the build/boot
 failed: 42][ T1] usbcore: registered new interface driver dln2 [ 7.576709][
 T1] usbcore: registered new interface driver pn533_usb [ 7.583988][ T1] nfcsim
 0.2 initialized [ 7.586139][ T1] usbcore: registered [...] 
 Content analysis details:   (0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: syzkaller.appspot.com]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.197 listed in sa-trusted.bondedsender.org]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.197 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.197 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sCHmq-0007it-6I
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] KASAN: slab-use-after-free Read in
 sanity_check_extent_cache
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

42][    T1] usbcore: registered new interface driver dln2
[    7.576709][    T1] usbcore: registered new interface driver pn533_usb
[    7.583988][    T1] nfcsim 0.2 initialized
[    7.586139][    T1] usbcore: registered new interface driver port100
[    7.587701][    T1] usbcore: registered new interface driver nfcmrvl
[    7.594256][    T1] Loading iSCSI transport class v2.0-870.
[    7.612218][    T1] virtio_scsi virtio0: 1/0/0 default/read/poll queues
[    7.621827][    T1] ------------[ cut here ]------------
[    7.622778][    T1] refcount_t: decrement hit 0; leaking memory.
[    7.626782][    T1] WARNING: CPU: 0 PID: 1 at lib/refcount.c:31 refcount_warn_saturate+0xfa/0x1d0
[    7.628293][    T1] Modules linked in:
[    7.628860][    T1] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.9.0-rc1-syzkaller-00060-g889914b5c209 #0
[    7.630401][    T1] Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/02/2024
[    7.632495][    T1] RIP: 0010:refcount_warn_saturate+0xfa/0x1d0
[    7.634119][    T1] Code: b2 00 00 00 e8 67 52 f2 fc 5b 5d c3 cc cc cc cc e8 5b 52 f2 fc c6 05 51 cc ce 0a 01 90 48 c7 c7 a0 54 fe 8b e8 b7 d0 b4 fc 90 <0f> 0b 90 90 eb d9 e8 3b 52 f2 fc c6 05 2e cc ce 0a 01 90 48 c7 c7
[    7.638094][    T1] RSP: 0000:ffffc90000066e18 EFLAGS: 00010246
[    7.639044][    T1] RAX: 343580cc97689700 RBX: ffff8881401bf06c RCX: ffff8880166c8000
[    7.640552][    T1] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
[    7.642175][    T1] RBP: 0000000000000004 R08: ffffffff8157ffe2 R09: fffffbfff1bf96e0
[    7.643575][    T1] R10: dffffc0000000000 R11: fffffbfff1bf96e0 R12: ffffea000501cdc0
[    7.645089][    T1] R13: ffffea000501cdc8 R14: 1ffffd4000a039b9 R15: 0000000000000000
[    7.646458][    T1] FS:  0000000000000000(0000) GS:ffff8880b9400000(0000) knlGS:0000000000000000
[    7.647850][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    7.648816][    T1] CR2: ffff88823ffff000 CR3: 000000000df32000 CR4: 00000000003506f0
[    7.650069][    T1] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[    7.651660][    T1] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[    7.653255][    T1] Call Trace:
[    7.653955][    T1]  <TASK>
[    7.655231][    T1]  ? __warn+0x163/0x4e0
[    7.656060][    T1]  ? refcount_warn_saturate+0xfa/0x1d0
[    7.657004][    T1]  ? report_bug+0x2b3/0x500
[    7.657697][    T1]  ? refcount_warn_saturate+0xfa/0x1d0
[    7.658659][    T1]  ? handle_bug+0x3e/0x70
[    7.659735][    T1]  ? exc_invalid_op+0x1a/0x50
[    7.660993][    T1]  ? asm_exc_invalid_op+0x1a/0x20
[    7.661819][    T1]  ? __warn_printk+0x292/0x360
[    7.662573][    T1]  ? refcount_warn_saturate+0xfa/0x1d0
[    7.663589][    T1]  ? refcount_warn_saturate+0xf9/0x1d0
[    7.664642][    T1]  __free_pages_ok+0xc54/0xd80
[    7.665381][    T1]  make_alloc_exact+0xa3/0xf0
[    7.666771][    T1]  vring_alloc_queue_split+0x20a/0x600
[    7.667714][    T1]  ? __pfx_vring_alloc_queue_split+0x10/0x10
[    7.668766][    T1]  ? vp_find_vqs+0x4c/0x4e0
[    7.669540][    T1]  ? virtscsi_probe+0x3ea/0xf60
[    7.670758][    T1]  ? virtio_dev_probe+0x991/0xaf0
[    7.671577][    T1]  ? really_probe+0x2b8/0xad0
[    7.672570][    T1]  ? driver_probe_device+0x50/0x430
[    7.673427][    T1]  vring_create_virtqueue_split+0xc6/0x310
[    7.674713][    T1]  ? ret_from_fork+0x4b/0x80
[    7.675577][    T1]  ? __pfx_vring_create_virtqueue_split+0x10/0x10
[    7.676513][    T1]  vring_create_virtqueue+0xca/0x110
[    7.677483][    T1]  ? __pfx_vp_notify+0x10/0x10
[    7.678536][    T1]  ? __pfx_virtscsi_ctrl_done+0x10/0x10
[    7.679645][    T1]  setup_vq+0xe9/0x2d0
[    7.680389][    T1]  ? __pfx_vp_notify+0x10/0x10
[    7.681211][    T1]  ? __pfx_virtscsi_ctrl_done+0x10/0x10
[    7.682323][    T1]  ? __pfx_virtscsi_ctrl_done+0x10/0x10
[    7.683391][    T1]  ? __pfx_virtscsi_ctrl_done+0x10/0x10
[    7.684728][    T1]  vp_setup_vq+0xbf/0x330
[    7.685412][    T1]  ? __pfx_vp_config_changed+0x10/0x10
[    7.686599][    T1]  ? ioread16+0x2f/0x90
[    7.687219][    T1]  ? __pfx_virtscsi_ctrl_done+0x10/0x10
[    7.688543][    T1]  vp_find_vqs_msix+0x8b2/0xc80
[    7.689396][    T1]  vp_find_vqs+0x4c/0x4e0
[    7.690066][    T1]  virtscsi_init+0x8db/0xd00
[    7.690768][    T1]  ? __pfx_virtscsi_init+0x10/0x10
[    7.691800][    T1]  ? __pfx_default_calc_sets+0x10/0x10
[    7.692645][    T1]  ? scsi_host_alloc+0xa57/0xea0
[    7.693496][    T1]  ? vp_get+0xfd/0x140
[    7.694109][    T1]  virtscsi_probe+0x3ea/0xf60
[    7.695276][    T1]  ? __pfx_virtscsi_probe+0x10/0x10
[    7.696256][    T1]  ? kernfs_add_one+0x156/0x8b0
[    7.697276][    T1]  ? virtio_no_restricted_mem_acc+0x9/0x10
[    7.698400][    T1]  ? virtio_features_ok+0x10c/0x270
[    7.699300][    T1]  virtio_dev_probe+0x991/0xaf0
[    7.700143][    T1]  ? __pfx_virtio_dev_probe+0x10/0x10
[    7.700985][    T1]  really_probe+0x2b8/0xad0
[    7.702196][    T1]  __driver_probe_device+0x1a2/0x390
[    7.703259][    T1]  driver_probe_device+0x50/0x430
[    7.704075][    T1]  __driver_attach+0x45f/0x710
[    7.704819][    T1]  ? __pfx___driver_attach+0x10/0x10
[    7.705601][    T1]  bus_for_each_dev+0x239/0x2b0
[    7.706514][    T1]  ? __pfx___driver_attach+0x10/0x10
[    7.707442][    T1]  ? __pfx_bus_for_each_dev+0x10/0x10
[    7.708680][    T1]  ? do_raw_spin_unlock+0x13c/0x8b0
[    7.710058][    T1]  bus_add_driver+0x347/0x620
[    7.711073][    T1]  driver_register+0x23a/0x320
[    7.712178][    T1]  ? __pfx_virtio_scsi_init+0x10/0x10
[    7.713450][    T1]  virtio_scsi_init+0x65/0xe0
[    7.714571][    T1]  ? __pfx_virtio_scsi_init+0x10/0x10
[    7.715692][    T1]  do_one_initcall+0x248/0x880
[    7.716533][    T1]  ? __pfx_virtio_scsi_init+0x10/0x10
[    7.717409][    T1]  ? __pfx_do_one_initcall+0x10/0x10
[    7.718599][    T1]  ? lockdep_hardirqs_on_prepare+0x43d/0x780
[    7.719639][    T1]  ? __pfx_parse_args+0x10/0x10
[    7.720523][    T1]  ? do_initcalls+0x1c/0x80
[    7.721261][    T1]  ? rcu_is_watching+0x15/0xb0
[    7.722428][    T1]  do_initcall_level+0x157/0x210
[    7.723278][    T1]  do_initcalls+0x3f/0x80
[    7.723962][    T1]  kernel_init_freeable+0x435/0x5d0
[    7.725035][    T1]  ? __pfx_kernel_init_freeable+0x10/0x10
[    7.726103][    T1]  ? __pfx_lockdep_hardirqs_on_prepare+0x10/0x10
[    7.727205][    T1]  ? __pfx_kernel_init+0x10/0x10
[    7.728033][    T1]  ? __pfx_kernel_init+0x10/0x10
[    7.729046][    T1]  ? __pfx_kernel_init+0x10/0x10
[    7.729731][    T1]  kernel_init+0x1d/0x2b0
[    7.730411][    T1]  ret_from_fork+0x4b/0x80
[    7.731117][    T1]  ? __pfx_kernel_init+0x10/0x10
[    7.731836][    T1]  ret_from_fork_asm+0x1a/0x30
[    7.732580][    T1]  </TASK>
[    7.733103][    T1] Kernel panic - not syncing: kernel: panic_on_warn set ...
[    7.734198][    T1] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.9.0-rc1-syzkaller-00060-g889914b5c209 #0
[    7.734971][    T1] Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/02/2024
[    7.734971][    T1] Call Trace:
[    7.734971][    T1]  <TASK>
[    7.734971][    T1]  dump_stack_lvl+0x241/0x360
[    7.734971][    T1]  ? __pfx_dump_stack_lvl+0x10/0x10
[    7.734971][    T1]  ? __pfx__printk+0x10/0x10
[    7.734971][    T1]  ? _printk+0xd5/0x120
[    7.734971][    T1]  ? vscnprintf+0x5d/0x90
[    7.734971][    T1]  panic+0x349/0x860
[    7.734971][    T1]  ? __warn+0x172/0x4e0
[    7.734971][    T1]  ? __pfx_panic+0x10/0x10
[    7.734971][    T1]  ? show_trace_log_lvl+0x4e6/0x520
[    7.734971][    T1]  ? ret_from_fork_asm+0x1a/0x30
[    7.734971][    T1]  __warn+0x346/0x4e0
[    7.734971][    T1]  ? refcount_warn_saturate+0xfa/0x1d0
[    7.734971][    T1]  report_bug+0x2b3/0x500
[    7.734971][    T1]  ? refcount_warn_saturate+0xfa/0x1d0
[    7.734971][    T1]  handle_bug+0x3e/0x70
[    7.734971][    T1]  exc_invalid_op+0x1a/0x50
[    7.734971][    T1]  asm_exc_invalid_op+0x1a/0x20
[    7.734971][    T1] RIP: 0010:refcount_warn_saturate+0xfa/0x1d0
[    7.734971][    T1] Code: b2 00 00 00 e8 67 52 f2 fc 5b 5d c3 cc cc cc cc e8 5b 52 f2 fc c6 05 51 cc ce 0a 01 90 48 c7 c7 a0 54 fe 8b e8 b7 d0 b4 fc 90 <0f> 0b 90 90 eb d9 e8 3b 52 f2 fc c6 05 2e cc ce 0a 01 90 48 c7 c7
[    7.734971][    T1] RSP: 0000:ffffc90000066e18 EFLAGS: 00010246
[    7.734971][    T1] RAX: 343580cc97689700 RBX: ffff8881401bf06c RCX: ffff8880166c8000
[    7.734971][    T1] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
[    7.734971][    T1] RBP: 0000000000000004 R08: ffffffff8157ffe2 R09: fffffbfff1bf96e0
[    7.734971][    T1] R10: dffffc0000000000 R11: fffffbfff1bf96e0 R12: ffffea000501cdc0
[    7.734971][    T1] R13: ffffea000501cdc8 R14: 1ffffd4000a039b9 R15: 0000000000000000
[    7.734971][    T1]  ? __warn_printk+0x292/0x360
[    7.734971][    T1]  ? refcount_warn_saturate+0xf9/0x1d0
[    7.734971][    T1]  __free_pages_ok+0xc54/0xd80
[    7.734971][    T1]  make_alloc_exact+0xa3/0xf0
[    7.734971][    T1]  vring_alloc_queue_split+0x20a/0x600
[    7.734971][    T1]  ? __pfx_vring_alloc_queue_split+0x10/0x10
[    7.734971][    T1]  ? vp_find_vqs+0x4c/0x4e0
[    7.734971][    T1]  ? virtscsi_probe+0x3ea/0xf60
[    7.734971][    T1]  ? virtio_dev_probe+0x991/0xaf0
[    7.734971][    T1]  ? really_probe+0x2b8/0xad0
[    7.734971][    T1]  ? driver_probe_device+0x50/0x430
[    7.734971][    T1]  vring_create_virtqueue_split+0xc6/0x310
[    7.734971][    T1]  ? ret_from_fork+0x4b/0x80
[    7.734971][    T1]  ? __pfx_vring_create_virtqueue_split+0x10/0x10
[    7.734971][    T1]  vring_create_virtqueue+0xca/0x110
[    7.734971][    T1]  ? __pfx_vp_notify+0x10/0x10
[    7.734971][    T1]  ? __pfx_virtscsi_ctrl_done+0x10/0x10
[    7.734971][    T1]  setup_vq+0xe9/0x2d0
[    7.734971][    T1]  ? __pfx_vp_notify+0x10/0x10
[    7.734971][    T1]  ? __pfx_virtscsi_ctrl_done+0x10/0x10
[    7.784590][    T1]  ? __pfx_virtscsi_ctrl_done+0x10/0x10
[    7.784590][    T1]  ? __pfx_virtscsi_ctrl_done+0x10/0x10
[    7.784590][    T1]  vp_setup_vq+0xbf/0x330
[    7.784590][    T1]  ? __pfx_vp_config_changed+0x10/0x10
[    7.784590][    T1]  ? ioread16+0x2f/0x90
[    7.784590][    T1]  ? __pfx_virtscsi_ctrl_done+0x10/0x10
[    7.784590][    T1]  vp_find_vqs_msix+0x8b2/0xc80
[    7.784590][    T1]  vp_find_vqs+0x4c/0x4e0
[    7.784590][    T1]  virtscsi_init+0x8db/0xd00
[    7.784590][    T1]  ? __pfx_virtscsi_init+0x10/0x10
[    7.784590][    T1]  ? __pfx_default_calc_sets+0x10/0x10
[    7.784590][    T1]  ? scsi_host_alloc+0xa57/0xea0
[    7.784590][    T1]  ? vp_get+0xfd/0x140
[    7.784590][    T1]  virtscsi_probe+0x3ea/0xf60
[    7.784590][    T1]  ? __pfx_virtscsi_probe+0x10/0x10
[    7.784590][    T1]  ? kernfs_add_one+0x156/0x8b0
[    7.784590][    T1]  ? virtio_no_restricted_mem_acc+0x9/0x10
[    7.784590][    T1]  ? virtio_features_ok+0x10c/0x270
[    7.784590][    T1]  virtio_dev_probe+0x991/0xaf0
[    7.784590][    T1]  ? __pfx_virtio_dev_probe+0x10/0x10
[    7.784590][    T1]  really_probe+0x2b8/0xad0
[    7.784590][    T1]  __driver_probe_device+0x1a2/0x390
[    7.784590][    T1]  driver_probe_device+0x50/0x430
[    7.784590][    T1]  __driver_attach+0x45f/0x710
[    7.784590][    T1]  ? __pfx___driver_attach+0x10/0x10
[    7.784590][    T1]  bus_for_each_dev+0x239/0x2b0
[    7.784590][    T1]  ? __pfx___driver_attach+0x10/0x10
[    7.784590][    T1]  ? __pfx_bus_for_each_dev+0x10/0x10
[    7.784590][    T1]  ? do_raw_spin_unlock+0x13c/0x8b0
[    7.784590][    T1]  bus_add_driver+0x347/0x620
[    7.784590][    T1]  driver_register+0x23a/0x320
[    7.784590][    T1]  ? __pfx_virtio_scsi_init+0x10/0x10
[    7.784590][    T1]  virtio_scsi_init+0x65/0xe0
[    7.784590][    T1]  ? __pfx_virtio_scsi_init+0x10/0x10
[    7.784590][    T1]  do_one_initcall+0x248/0x880
[    7.784590][    T1]  ? __pfx_virtio_scsi_init+0x10/0x10
[    7.784590][    T1]  ? __pfx_do_one_initcall+0x10/0x10
[    7.784590][    T1]  ? lockdep_hardirqs_on_prepare+0x43d/0x780
[    7.784590][    T1]  ? __pfx_parse_args+0x10/0x10
[    7.784590][    T1]  ? do_initcalls+0x1c/0x80
[    7.784590][    T1]  ? rcu_is_watching+0x15/0xb0
[    7.784590][    T1]  do_initcall_level+0x157/0x210
[    7.784590][    T1]  do_initcalls+0x3f/0x80
[    7.784590][    T1]  kernel_init_freeable+0x435/0x5d0
[    7.784590][    T1]  ? __pfx_kernel_init_freeable+0x10/0x10
[    7.784590][    T1]  ? __pfx_lockdep_hardirqs_on_prepare+0x10/0x10
[    7.784590][    T1]  ? __pfx_kernel_init+0x10/0x10
[    7.784590][    T1]  ? __pfx_kernel_init+0x10/0x10
[    7.784590][    T1]  ? __pfx_kernel_init+0x10/0x10
[    7.784590][    T1]  kernel_init+0x1d/0x2b0
[    7.784590][    T1]  ret_from_fork+0x4b/0x80
[    7.784590][    T1]  ? __pfx_kernel_init+0x10/0x10
[    7.784590][    T1]  ret_from_fork_asm+0x1a/0x30
[    7.834581][    T1]  </TASK>
[    7.834581][    T1] Kernel Offset: disabled
[    7.834581][    T1] Rebooting in 86400 seconds..


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
GOGCCFLAGS='-fPIC -m64 -pthread -Wl,--no-gc-sections -fmessage-length=0 -ffile-prefix-map=/tmp/go-build686088701=/tmp/go-build -gno-record-gcc-switches'

git status (err=<nil>)
HEAD detached at 610f2a54d
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
GOOS=linux GOARCH=amd64 go build "-ldflags=-s -w -X github.com/google/syzkaller/prog.GitRevision=610f2a54d02f8cf4f2454c03bf679b602e6e59b6 -X 'github.com/google/syzkaller/prog.gitRevisionDate=20240503-155746'" "-tags=syz_target syz_os_linux syz_arch_amd64 " -o ./bin/linux_amd64/syz-fuzzer github.com/google/syzkaller/syz-fuzzer
GOOS=linux GOARCH=amd64 go build "-ldflags=-s -w -X github.com/google/syzkaller/prog.GitRevision=610f2a54d02f8cf4f2454c03bf679b602e6e59b6 -X 'github.com/google/syzkaller/prog.gitRevisionDate=20240503-155746'" "-tags=syz_target syz_os_linux syz_arch_amd64 " -o ./bin/linux_amd64/syz-execprog github.com/google/syzkaller/tools/syz-execprog
GOOS=linux GOARCH=amd64 go build "-ldflags=-s -w -X github.com/google/syzkaller/prog.GitRevision=610f2a54d02f8cf4f2454c03bf679b602e6e59b6 -X 'github.com/google/syzkaller/prog.gitRevisionDate=20240503-155746'" "-tags=syz_target syz_os_linux syz_arch_amd64 " -o ./bin/linux_amd64/syz-stress github.com/google/syzkaller/tools/syz-stress
mkdir -p ./bin/linux_amd64
gcc -o ./bin/linux_amd64/syz-executor executor/executor.cc \
	-m64 -std=c++11 -I. -Ivendor -O2 -pthread -Wall -Werror -Wparentheses -Wunused-const-variable -Wframe-larger-than=16384 -Wno-stringop-overflow -Wno-array-bounds -Wno-format-overflow -Wno-unused-but-set-variable -Wno-unused-command-line-argument -static-pie -fpermissive -w -DGOOS_linux=1 -DGOARCH_amd64=1 \
	-DHOSTGOOS_linux=1 -DGIT_REVISION=\"610f2a54d02f8cf4f2454c03bf679b602e6e59b6\"


Error text is too large and was truncated, full error text is at:
https://syzkaller.appspot.com/x/error.txt?x=1233c3ec980000


Tested on:

commit:         889914b5 f2fs: fix to cover read extent cache access w..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git wip
kernel config:  https://syzkaller.appspot.com/x/.config?x=1ace29459a0a1915
dashboard link: https://syzkaller.appspot.com/bug?extid=74ebe2104433e9dc610d
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Note: no patches were applied.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
