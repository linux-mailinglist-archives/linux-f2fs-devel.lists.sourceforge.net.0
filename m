Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9607E2DDC86
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 18 Dec 2020 02:04:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kq4CG-0006Yp-Mm; Fri, 18 Dec 2020 01:04:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <bugzilla-daemon@bugzilla.kernel.org>)
 id 1kq4CF-0006Yh-0N
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 18 Dec 2020 01:04:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Cx3rxINzXoIxYxuFcE5n5+QZLpX336ADL6jiXRdFr7E=; b=ap/l8UzHkNahGnjWThqkjVPOaJ
 7n74NafY+N3HlCYb23xtO7lhM8nBH0pjVmcRdRQ1AoC1BtoB+QyLWnocdimmWmr2cnMHeHG7nII3r
 TAhKApONXGFBx32Nlv3vrbzPD+yNZd5c5YK2vd1y+8evj6s2n0sMt+tnxlRlAd1HvtoU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Date:
 Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Cx3rxINzXoIxYxuFcE5n5+QZLpX336ADL6jiXRdFr7E=; b=j
 7Gh+c5vwR2kT/izxyZssyv01gdQW5l0hEjid8ghgaplz4sZ7x4mExK4hwrZOznihxTxJAb67f9a3V
 qZeK3HQDad4plIeplk5X+qEU43ebhaaaLOaKYIZXUID2AYk3vGpfrmIe+Zgs69dnBYZ2WaAD4fQbK
 EcBb/B4pJIe39tb4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kq4C7-000ij8-MQ
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 18 Dec 2020 01:04:38 +0000
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 18 Dec 2020 01:04:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: stefan@konink.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-210765-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: konink.de]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1kq4C7-000ij8-MQ
Subject: [f2fs-dev] [Bug 210765] New: F2FS causes access invalid blkaddr
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

https://bugzilla.kernel.org/show_bug.cgi?id=210765

            Bug ID: 210765
           Summary: F2FS causes access invalid blkaddr
           Product: File System
           Version: 2.5
    Kernel Version: 5.10.1
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: blocking
          Priority: P1
         Component: f2fs
          Assignee: filesystem_f2fs@kernel-bugs.kernel.org
          Reporter: stefan@konink.de
        Regression: No

I am reporting this incident here because I noticed some recent changes within
the F2FS layer. I'll cross post this incident at the Gentoo bugtracker, because
I am using the gentoo patchset.

I am using F2FS as my root filesystem. Today I upgraded from 5.9.11-gentoo to
5.10.1-gentoo. After I upgraded glibc programs could not find libstdc++.so.6.
Long story short at least /etc/env.d/00glibc and /etc/nsswitch.conf became
corrupt, and when on kernel 5.10.1-gentoo I could consistently cause the
problems below (twice including a reboot, filesystem checked with a LiveCD).
When switching back to 5.9.11-gentoo, upgrading glibc did not cause any further
issues.

I am aware that non-vanilla kernels, including tainted modules, are not
supported here.


[  701.466276] WARNING: CPU: 4 PID: 66867 at fs/f2fs/checkpoint.c:189
f2fs_is_valid_blkaddr+0x25f/0x270[
[  701.469213] Modules linked in: cmac bnep joydev zfs(PO) zunicode(PO)
zzstd(O) zlua(O) zavl(PO) icp(PO) uvcvideo videobuf2_vmalloc ath10k_pci
videobuf2_memops videobuf2_v4l2 snd_usb_audio btusb snd_hwdep zcommon(PO) btrtl
snd_usbmidi_lib ath10k_core videodev znvpair(PO) btbcm wmi_bmof ath snd_rawmidi
videobuf2_common btintel spl(O) bluetooth ecdh_generic amdgpu kvm_amd
zlib_deflate ecc zlib_inflate mac80211 kvm irqbypass snd_hda_codec_conexant
snd_hda_codec_generic snd_hda_codec_hdmi aesni_intel crypto_simd mfd_core
cryptd snd_hda_intel gpu_sched glue_helper snd_intel_dspcfg evdev psmouse
snd_hda_codec ttm i2c_algo_bit sdhci_pci snd_hda_core drm_kms_helper iosf_mbi
syscopyarea sysfillrect sysimgblt snd_pcm fb_sys_fops cec cqhci snd_timer ccp
sdhci cfg80211 i2c_piix4 r8169 sha1_generic libarc4 mmc_core realtek
thinkpad_acpi mdio_devres libphy nvram wireguard ledtrig_audio ip6_udp_tunnel
snd udp_tunnel soundcore wmi rfkill ac battery video i2c_scmi button
sch_fq_codel drm backlight i2c_core
[  701.469299]  efivarfs
[  701.486729] CPU: 4 PID: 66867 Comm: python3.7m Tainted: P        W  O     
5.10.1-gentoo #1
[  701.489555] Hardware name: LENOVO 20KU000NMH/20KU000NMH, BIOS R0UET77W (1.57
) 04/07/2020
[  701.492291] RIP: 0010:f2fs_is_valid_blkaddr+0x25f/0x270
[  701.494964] Code: 41 f7 41 30 44 01 c0 39 c6 73 09 41 8b 41 5c e9 fe fe ff
ff 89 f2 48 89 df 48 c7 c6 fa e4 f5 81 e8 80 f9 41 00 f0 80 4b 48 04 <0f> 0b 31
c0 5b c3 0f 0b 66 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00
[  701.497674] RSP: 0018:ffffc9000f83fe70 EFLAGS: 00010282
[  701.500374] RAX: 0000000000000000 RBX: ffff888101a6f000 RCX:
0000000000000000
[  701.502979] RDX: 0000000000000000 RSI: ffff88844ef12d40 RDI:
ffff88844ef12d40
[  701.505524] RBP: 0000000000000001 R08: ffffffff8226b1e8 R09:
00000000fffff7ff
[  701.508011] R10: ffffffff8225f200 R11: 00000000fffff800 R12:
ffff8881433d9640
[  701.510494] R13: 0000160000000000 R14: 0000000000001000 R15:
0000000000000003
[  701.512878] FS:  00007f581c2ef740(0000) GS:ffff88844ef00000(0000)
knlGS:0000000000000000
[  701.515216] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  701.517499] CR2: 00007f581ba40000 CR3: 0000000174626000 CR4:
00000000003506e0
[  701.519792] Call Trace:
[  701.521970]  f2fs_llseek+0x23e/0x490
[  701.524089]  __x64_sys_lseek+0x82/0xc0
[  701.526205]  do_syscall_64+0x33/0x40
[  701.528258]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[  701.530299] RIP: 0033:0x7f581c87d377
[  701.532256] Code: 00 00 90 48 8b 15 f1 ca 0c 00 f7 d8 64 89 02 48 c7 c0 ff
ff ff ff eb b2 66 2e 0f 1f 84 00 00 00 00 00 90 b8 08 00 00 00 0f 05 <48> 3d 00
f0 ff ff 77 01 c3 48 8b 15 c1 ca 0c 00 f7 d8 64 89 02 48
[  701.534269] RSP: 002b:00007fffc5549628 EFLAGS: 00000202 ORIG_RAX:
0000000000000008
[  701.536267] RAX: ffffffffffffffda RBX: 0000000000000000 RCX:
00007f581c87d377
[  701.538258] RDX: 0000000000000003 RSI: 0000000000000000 RDI:
0000000000000003
[  701.540295] RBP: 00007fffc5549680 R08: 0000000000000000 R09:
00007fffc55492f0
[  701.542268] R10: 00007fffc55492f0 R11: 0000000000000202 R12:
0000000000000003
[  701.544178] R13: 0000000000000004 R14: 0000000000000002 R15:
00007fffc5549680
[  701.546029] ---[ end trace a0930f5707057a19 ]---
[  701.548199] F2FS-fs (sda4): access invalid blkaddr:539167267
[  701.550010] ------------[ cut here ]------------

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
