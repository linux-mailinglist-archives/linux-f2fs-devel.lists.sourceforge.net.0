Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BF71C8597E5
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 18 Feb 2024 17:59:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rbkVk-0005xp-BN;
	Sun, 18 Feb 2024 16:59:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yizhan@redhat.com>) id 1rbkVi-0005xZ-Lb
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 18 Feb 2024 16:59:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eAhMKfhDa1o15gK+6j+rX/Nt1dGSvpN0TmM5Ge4jmDw=; b=XAHMk9rai4ARgBzdAyDaDHaeyJ
 n4bw+tGQp0gQ/0QeEokk9sNNmtbEmN/e9RxqOdJ0oo7dFbpxpHCeiNSsfUlvVdx0HAC5WeSuFBnpl
 L8HaCi/NTUGaLvXBxB4NkOBctSRbn8f/BNjPyZ3qPOixz0lXQfsm600bGF4Ss27V0qmE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:MIME-Version:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=eAhMKfhDa1o15gK+6j+rX/Nt1dGSvpN0TmM5Ge4jmDw=; b=B
 Tu6hpLKtS17NfO55sf0W0lIfpDoZ3M2m9kDQrnlE0bq7jr5vrk5+MGeEo+fRW+kE6uUXagqUjubGR
 WRFbpIlbSXoxKGpKvlVliTPLDvdWcxtt7sks44/YmrE0H54Ohnf1s1jXyHLsu4gIkLWJ8I6Yh9M3H
 t+X6ao2UsMKxLDIM=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rbkVg-0007CP-KY for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 18 Feb 2024 16:59:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1708275554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=eAhMKfhDa1o15gK+6j+rX/Nt1dGSvpN0TmM5Ge4jmDw=;
 b=DBqsrYdAH5M+ODnYOM18jbQKXV7jak8vJmO0amPDzmX+iR/drVhZQupv10WpM/mqzAkW3q
 UVadcMynhDkSMyfwmhrh60W8/UJ1aZdihIjWWRGe5vFUIn5W/U9frVaFd5sQoQmODlx5Sm
 51GOA96b22yKjLs/0ko85BpXoPEWlvg=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-524-JxnH3DhuPSemLq0PaNubqQ-1; Sun, 18 Feb 2024 11:59:13 -0500
X-MC-Unique: JxnH3DhuPSemLq0PaNubqQ-1
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-295aaffe58bso4214542a91.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 18 Feb 2024 08:59:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708275551; x=1708880351;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eAhMKfhDa1o15gK+6j+rX/Nt1dGSvpN0TmM5Ge4jmDw=;
 b=b1Tdqi2BoTAF3cOZtxsEZKxueFlDqv9q/oTziZXthrhsZ4cStlamSfBuku00lQXgLg
 saKX3a32HyUWaMHsuH8uBMEa/lFp9lxEAOa5I+WlKd2F7sH0//8bvRqWjqZ4/qw4vtWl
 pXN++0Omzuc0fIBgfd8iFdTw1fFp2YWXFtMM4Mp98OrgFhL5akNYUTFu9xy0p1D9SGxi
 I2Pbra6Z53K4icVQvtx2iiwGO28EjRISsATJjy09KHrPieIi+7Xx/qKdJlL3t/+g1WRw
 y6mE7WqlIb+rQZpwrBB2ShOYQPqjaRjTfsPbRoaWZvdKoAigL74pwR574CbE/No78yok
 nZvQ==
X-Gm-Message-State: AOJu0YyH+dC3xG71Ohc2MH0IBwz1kei4etFyNxjHr3zCrjjS5wz2HiFf
 E1yelVmkh7nGxHmWHABtwLFE+vXwDarqYkgUe37k673LPJ/ysawfWQ7BrBuc0dD+KKvrr7CNjXD
 C0VomMxT0NB+emdcIQNu9wvFi43QZj4Rphu/pYPRZQMoZl2WkCdcu+cOD7rKDRgQmXX4NQ2kWJo
 JQ2gFFUwT4HjY3Re9jjenX98sCKxBg6w6WMzwwJR/8mhmySKRbflkGJkkmM1QZUmts0A==
X-Received: by 2002:a17:90b:3749:b0:299:7f49:234e with SMTP id
 ne9-20020a17090b374900b002997f49234emr2293509pjb.0.1708275550881; 
 Sun, 18 Feb 2024 08:59:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFmpIFaFm6JbpqTGBYwshc3asKKFufYcn7uwIgQKQcqAW7efUApZPGHSkj6Bs/Wg8IDmm8gImJ1lfIzfKG+Oys=
X-Received: by 2002:a17:90b:3749:b0:299:7f49:234e with SMTP id
 ne9-20020a17090b374900b002997f49234emr2293496pjb.0.1708275550492; Sun, 18 Feb
 2024 08:59:10 -0800 (PST)
MIME-Version: 1.0
From: Yi Zhang <yi.zhang@redhat.com>
Date: Mon, 19 Feb 2024 00:58:58 +0800
Message-ID: <CAHj4cs-kfojYC9i0G73PRkYzcxCTex=-vugRFeP40g_URGvnfQ@mail.gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net, 
 linux-block <linux-block@vger.kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello I reproduced this issue on the latest
 linux-block/for-next, 
 please help check it and let me know if you need more info/test, thanks.
 # ./check zbd/010 zbd/010 (test gap zone support with F2FS) [failed] runtime
 ... 3.752s something found in dmesg: [ 4378.146781] run blktests zbd/010
 at 2024-02-18 11:31:13 [ 4378.192349] null_blk: mo [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.133.124 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [170.10.133.124 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rbkVg-0007CP-KY
Subject: [f2fs-dev] [bug report]WARNING: CPU: 22 PID: 44011 at
 fs/iomap/iter.c:51 iomap_iter+0x32b observed with blktests zbd/010
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
Cc: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello
I reproduced this issue on the latest linux-block/for-next, please
help check it and let me know if you need more info/test, thanks.

# ./check zbd/010
zbd/010 (test gap zone support with F2FS)                    [failed]
    runtime    ...  3.752s
    something found in dmesg:
    [ 4378.146781] run blktests zbd/010 at 2024-02-18 11:31:13
    [ 4378.192349] null_blk: module loaded
    [ 4378.209860] null_blk: disk nullb0 created
    [ 4378.413285] scsi_debug:sdebug_driver_probe: scsi_debug: trim
poll_queues to 0. poll_q/nr_hw = (0/1)
    [ 4378.422334] scsi host15: scsi_debug: version 0191 [20210520]
                     dev_size_mb=1024, opts=0x0, submit_queues=1, statistics=0
    [ 4378.434922] scsi 15:0:0:0: Direct-Access-ZBC Linux
scsi_debug       0191 PQ: 0 ANSI: 7
    [ 4378.443343] scsi 15:0:0:0: Power-on or device reset occurred
    [ 4378.449371] sd 15:0:0:0: Attached scsi generic sg5 type 20
    [ 4378.449418] sd 15:0:0:0: [sdf] Host-managed zoned block device
    ...
    (See '/mnt/tests/gitlab.com/api/v4/projects/19168116/repository/archive.zip/storage/blktests/blk/blktests/results/nodev/zbd/010.dmesg'
for the entire message)
# uname -r
6.8.0-rc3+

[ 4378.146781] run blktests zbd/010 at 2024-02-18 11:31:13
[ 4378.192349] null_blk: module loaded
[ 4378.209860] null_blk: disk nullb0 created
[ 4378.413285] scsi_debug:sdebug_driver_probe: scsi_debug: trim
poll_queues to 0. poll_q/nr_hw = (0/1)
[ 4378.422334] scsi host15: scsi_debug: version 0191 [20210520]
                 dev_size_mb=1024, opts=0x0, submit_queues=1, statistics=0
[ 4378.434922] scsi 15:0:0:0: Direct-Access-ZBC Linux    scsi_debug
   0191 PQ: 0 ANSI: 7
[ 4378.443343] scsi 15:0:0:0: Power-on or device reset occurred
[ 4378.449371] sd 15:0:0:0: Attached scsi generic sg5 type 20
[ 4378.449418] sd 15:0:0:0: [sdf] Host-managed zoned block device
[ 4378.460718] sd 15:0:0:0: [sdf] 262144 4096-byte logical blocks:
(1.07 GB/1.00 GiB)
[ 4378.468292] sd 15:0:0:0: [sdf] Write Protect is off
[ 4378.473172] sd 15:0:0:0: [sdf] Mode Sense: 5b 00 10 08
[ 4378.473179] sd 15:0:0:0: [sdf] Write cache: enabled, read cache:
enabled, supports DPO and FUA
[ 4378.481796] sd 15:0:0:0: [sdf] Preferred minimum I/O size 4096 bytes
[ 4378.488146] sd 15:0:0:0: [sdf] Optimal transfer size 4194304 bytes
[ 4378.494366] sd 15:0:0:0: [sdf] 256 zones of 1024 logical blocks
[ 4378.500895] sd 15:0:0:0: [sdf] Attached SCSI disk
[ 4378.591696] F2FS-fs (nullb0): Mount Device [ 0]:
/dev/nullb0,      510,        0 -    3ffff
[ 4378.600903] F2FS-fs (nullb0): Mount Device [ 1]:
/dev/sdf,      512,    40000 -    7ffff (zone: Host-managed)
[ 4378.611858] F2FS-fs (nullb0): IO Block Size:        4 KB
[ 4378.617811] F2FS-fs (nullb0): Found nat_bits in checkpoint
[ 4378.630242] F2FS-fs (nullb0): Mounted with checkpoint version = 2ddce711
[ 4381.278858] ------------[ cut here ]------------
[ 4381.283484] WARNING: CPU: 22 PID: 44011 at fs/iomap/iter.c:51
iomap_iter+0x32b/0x350
[ 4381.291231] Modules linked in: scsi_debug null_blk f2fs
crc32_generic lz4hc_compress lz4_compress rfkill sunrpc intel_rapl_msr
vfat fat intel_rapl_common intel_uncore_frequency
intel_uncore_frequency_common isst_if_common skx_edac nfit libnvdimm
x86_pkg_temp_thermal ipmi_ssif intel_powerclamp spi_nor coretemp
kvm_intel bnxt_en kvm iTCO_wdt irqbypass intel_pmc_bxt acpi_ipmi
iTCO_vendor_support ipmi_si rapl i2c_i801 mtd mei_me tg3 intel_cstate
intel_pch_thermal dell_smbios intel_uncore ipmi_devintf spi_intel_pci
i2c_smbus dell_wmi_descriptor dcdbas spi_intel ipmi_msghandler
wmi_bmof mei pcspkr acpi_power_meter lpc_ich loop fuse nfnetlink zram
xfs crct10dif_pclmul crc32_pclmul crc32c_intel polyval_clmulni
polyval_generic nvme ghash_clmulni_intel nvme_core sha512_ssse3
mgag200 sha256_ssse3 sha1_ssse3 megaraid_sas nvme_auth i2c_algo_bit
wmi [last unloaded: null_blk]
[ 4381.367409] CPU: 22 PID: 44011 Comm: fio Not tainted 6.8.0-rc3+ #1
[ 4381.373588] Hardware name: Dell Inc. PowerEdge R740xd/0YNX56, BIOS
2.20.1 09/13/2023
[ 4381.381327] RIP: 0010:iomap_iter+0x32b/0x350
[ 4381.385599] Code: e9 c2 fe ff ff 89 d0 4c 8d 63 28 4c 8d 6b 78 85
d2 0f 8e b5 fe ff ff e9 46 fe ff ff 0f 0b e9 71 fe ff ff 0f 0b e9 77
fe ff ff <0f> 0b e9 7c fe ff ff 0f 0b e9 7f fe ff ff 0f 0b b8 fb ff ff
ff e9
[ 4381.404346] RSP: 0018:ffffb6650558fa40 EFLAGS: 00010206
[ 4381.409569] RAX: 0000000000000000 RBX: ffffb6650558fad0 RCX: fffffffffff4a000
[ 4381.416702] RDX: 00000000000b6000 RSI: 00000000000000b6 RDI: ffff9e301c126b18
[ 4381.423834] RBP: ffffffffc112e900 R08: ffff9e33872c1000 R09: 000000000003fc00
[ 4381.430969] R10: 0000000000000004 R11: 0000000000000004 R12: ffffb6650558faf8
[ 4381.438098] R13: ffffb6650558fb48 R14: ffff9e301c126b18 R15: ffffffffc112e900
[ 4381.445229] FS:  00007eff7a09b080(0000) GS:ffff9e336fec0000(0000)
knlGS:0000000000000000
[ 4381.453316] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 4381.459062] CR2: 00007eff71c37004 CR3: 000000010d1c0001 CR4: 00000000007706f0
[ 4381.466193] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[ 4381.473326] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[ 4381.480456] PKRU: 55555554
[ 4381.483170] Call Trace:
[ 4381.485623]  <TASK>
[ 4381.487729]  ? iomap_iter+0x32b/0x350
[ 4381.491393]  ? __warn+0x81/0x130
[ 4381.494639]  ? iomap_iter+0x32b/0x350
[ 4381.498311]  ? report_bug+0x16f/0x1a0
[ 4381.501984]  ? handle_bug+0x3c/0x80
[ 4381.505476]  ? exc_invalid_op+0x17/0x70
[ 4381.509314]  ? asm_exc_invalid_op+0x1a/0x20
[ 4381.513502]  ? iomap_iter+0x32b/0x350
[ 4381.517167]  __iomap_dio_rw+0x1df/0x830
[ 4381.521009]  f2fs_file_read_iter+0x156/0x3d0 [f2fs]
[ 4381.525937]  ? selinux_file_permission+0x151/0x180
[ 4381.530729]  aio_read+0x138/0x210
[ 4381.534051]  ? io_submit_one+0x188/0x8c0
[ 4381.537974]  io_submit_one+0x188/0x8c0
[ 4381.541727]  ? do_io_getevents+0x89/0xe0
[ 4381.545652]  __x64_sys_io_submit+0x8c/0x1a0
[ 4381.549838]  do_syscall_64+0x86/0x170
[ 4381.553504]  ? syscall_exit_to_user_mode+0x89/0x230
[ 4381.558383]  ? do_syscall_64+0x95/0x170
[ 4381.562222]  ? do_syscall_64+0x95/0x170
[ 4381.566061]  ? do_syscall_64+0x95/0x170
[ 4381.569897]  ? do_syscall_64+0x95/0x170
[ 4381.573738]  ? __irq_exit_rcu+0x4b/0xc0
[ 4381.577578]  entry_SYSCALL_64_after_hwframe+0x6e/0x76
[ 4381.582631] RIP: 0033:0x7eff7a1b215d
[ 4381.586209] Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e
fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24
08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 8b cc 0c 00 f7 d8 64 89
01 48
[ 4381.604953] RSP: 002b:00007fff421d86c8 EFLAGS: 00000246 ORIG_RAX:
00000000000000d1
[ 4381.612519] RAX: ffffffffffffffda RBX: 00007eff7a09aff8 RCX: 00007eff7a1b215d
[ 4381.619651] RDX: 0000564e55cae8f8 RSI: 0000000000000001 RDI: 00007eff71c84000
[ 4381.626784] RBP: 00007fff421d8700 R08: 0000564e55cc2000 R09: 00007fff421d86f0
[ 4381.633914] R10: 0000000000000000 R11: 0000000000000246 R12: 00007eff71c84000
[ 4381.641046] R13: 0000000000000000 R14: 0000000000000001 R15: 0000564e55cae8f8
[ 4381.648181]  </TASK>
[ 4381.650371] ---[ end trace 0000000000000000 ]---
[ 4381.769895] sd 15:0:0:0: [sdf] Synchronizing SCSI cache

-- 
Best Regards,
  Yi Zhang



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
