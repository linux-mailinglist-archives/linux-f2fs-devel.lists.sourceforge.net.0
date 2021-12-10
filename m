Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CB03A470266
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Dec 2021 15:04:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mvgVj-00037B-BM; Fri, 10 Dec 2021 14:04:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@bugzilla.kernel.org>)
 id 1mvgVX-00036n-Ss
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Dec 2021 14:04:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DVRPfVXHoMMXBWarZlxg27z1qtf6AvG9JGb417fKmUo=; b=lrtl7igfiWmksvM62ly3menJQ4
 RLdf+NHlWxgREupVLv5vJPFnek/Vqg+cadKF41OGGdY3NDxAMhyWxy89IQoRZS10vx2gZnSnn30gL
 h1Dl1EEPSKRYJHEea8M0LYbp/wfPJvKONrxLe9xVboN/MrFgHUjsKpUx3A13/rqAeWRI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Date:
 Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=DVRPfVXHoMMXBWarZlxg27z1qtf6AvG9JGb417fKmUo=; b=X
 o1kcZeYfVIviHAtdr0WPvBtBrr/i4G9BCcjgp+UxpjQCUKQLf7wvx/lnR5eGUe8e5qOTW+adzYCnx
 nHcHQaqSC0GA9KzabBoCAIX0qH480S/l3xh4BzXy75PN3kBt3Rq+E6nKn+odqVwXDUZ8nZUL2hKs0
 kcZnA4i/Eu5VLYgQ=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mvgVN-0005ZN-0T
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Dec 2021 14:04:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B8DCCB827F1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 10 Dec 2021 14:03:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 935CFC341C6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 10 Dec 2021 14:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639145033;
 bh=xshGNgVfT8UpjqE6SvNL0/rzl1bcuB5KE0h15yClgns=;
 h=From:To:Subject:Date:From;
 b=D78mzoCBGg2vyyp+afWAjszqvBPbdKrCXUmcVUvcKA/eIMHAYhF58nTkKqcksWjZi
 KxBdrSLH4OQRzJuvfO0gJhYVT7Dd+ZSyxAbOvSfT1y2vRnQZnVwM/FxOaRxUjEKcQ1
 P6S/94NAnAjT2iH6GEHdvPV+23Ssd81sgq1FFtXy/0RkC9Hod0WojN3eoUoQJ1sT/j
 QtgORW1EyCwQ+IBm6itTcF58QVfd0Mxs5XmoHMgQ9C5FiKxoM7ostKhpnDZn8xiLfh
 UrtZm7gY8tri8JQuJhhbMcb5pdDrmCwlSTq6V9rlMKlsKiESZdt1cwBqJRB/Bcs/lj
 EpeGLr/n9Qvmw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 6749060F38; Fri, 10 Dec 2021 14:03:53 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 10 Dec 2021 14:03:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: yanming@tju.edu.cn
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-215293-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  https://bugzilla.kernel.org/show_bug.cgi?id=215293 Bug ID:
 215293 Summary: F2FS: kernel bug at fs/f2fs/segment.c:2543 Product: File
 System Version: 2.5 Kernel Version: 5.15.4 Hardware: All OS: Linux Tree:
 Mainline Status: NEW Severity: normal Priorit [...] 
 Content analysis details:   (-0.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mvgVN-0005ZN-0T
Subject: [f2fs-dev] [Bug 215293] New: F2FS: kernel bug at
 fs/f2fs/segment.c:2543
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

https://bugzilla.kernel.org/show_bug.cgi?id=215293

            Bug ID: 215293
           Summary: F2FS: kernel bug at fs/f2fs/segment.c:2543
           Product: File System
           Version: 2.5
    Kernel Version: 5.15.4
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: f2fs
          Assignee: filesystem_f2fs@kernel-bugs.kernel.org
          Reporter: yanming@tju.edu.cn
        Regression: No

I encountered a bug when I do some file operations on F2FS file system. The
operations I performed are all related to file or mount.


Corresponding kernel message as following:


5,2356,3412295770,-;F2FS-fs (loop10): Found nat_bits in checkpoint
5,2357,3412466195,-;F2FS-fs (loop10): Mounted with checkpoint version =
56c1f7db
4,2359,3510242807,-;------------[ cut here ]------------
4,2360,3510242900,-;WARNING: CPU: 0 PID: 17414 at fs/f2fs/segment.c:2543
new_curseg+0x1451/0x1940 [f2fs]
4,2361,3510243452,-;Modules linked in: f2fs crc32_generic lz4hc_compress
lz4_compress zstd_compress rfcomm cmac algif_hash algif_skcipher af_alg bnep
snd_hda_codec_hdmi snd_ctl_led snd_hda_codec_realtek snd_hda_codec_generic
iwlmvm x86_pkg_temp_thermal intel_powerclamp coretemp nouveau i915 mac80211
snd_hda_intel kvm_intel libarc4 snd_intel_dspcfg kvm iwlwifi mei_hdcp
snd_intel_sdw_acpi uvcvideo snd_hda_codec btusb crct10dif_pclmul
ghash_clmulni_intel btrtl snd_hda_core aesni_intel mxm_wmi btbcm crypto_simd
videobuf2_vmalloc cryptd videobuf2_memops drm_ttm_helper btintel snd_hwdep ttm
rapl bluetooth snd_pcm videobuf2_v4l2 cfg80211 drm_kms_helper videobuf2_common
videodev snd_seq_midi thinkpad_acpi snd_seq_midi_event snd_rawmidi intel_cstate
cec snd_seq rc_core intel_wmi_thunderbolt nvram sch_fq_codel input_leds mc
joydev i2c_algo_bit serio_raw wmi_bmof mei_me snd_seq_device ecdh_generic
fb_sys_fops platform_profile ee1004 snd_timer ledtrig_audio syscopyarea mei ecc
sysfillrect snd sysimgblt
4,2362,3510253014,c; intel_pch_thermal soundcore drm mac_hid acpi_pad msr
parport_pc ppdev lp parport ip_tables x_tables autofs4 hid_generic usbhid hid
e1000e rtsx_pci_sdmmc psmouse crc32_pclmul rtsx_pci i2c_i801 ahci xhci_pci
i2c_smbus libahci xhci_pci_renesas wmi video
4,2363,3510256259,-;CPU: 0 PID: 17414 Comm: runner-1 Tainted: G        W    L  
 5.15.4 #2
4,2364,3510256706,-;Hardware name: LENOVO 20J6A00NHH/20J6A00NHH, BIOS R0FET24W
(1.04 ) 12/21/2016
4,2365,3510256931,-;RIP: 0010:new_curseg+0x1451/0x1940 [f2fs]
4,2366,3510257395,-;Code: 66 41 83 fc 02 0f 87 7e f2 ff ff e8 a9 71 ef d1 48 83
05 d9 4a 18 00 01 e9 63 ee ff ff e8 97 71 ef d1 48 83 05 a7 48 18 00 01 <0f> 0b
48 83 05 a5 48 18 00 01 be 08 00 00 00 49 8d 7f 48 48 83 05
4,2367,3510257778,-;RSP: 0018:ffff8881ce206290 EFLAGS: 00010202
4,2368,3510258075,-;RAX: 0000000000000000 RBX: 0000000000000200 RCX:
ffffffffc4ceea32
4,2369,3510258345,-;RDX: 0000000000000000 RSI: ffff8881bf304e00 RDI:
0000000000000002
4,2370,3510258703,-;RBP: ffff8881ce206340 R08: ffffffffffffffff R09:
0000000000000000
4,2371,3510259000,-;R10: 0000000000000003 R11: ffffed1039c40c46 R12:
0000000000000200
4,2372,3510259278,-;R13: 0000000000000200 R14: 0000000000000000 R15:
ffff8881b9dc6000
4,2373,3510259553,-;FS:  0000000001f4c880(0000) GS:ffff888723400000(0000)
knlGS:0000000000000000
4,2374,3510259925,-;CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
4,2375,3510260236,-;CR2: 00001f458d9ee2d0 CR3: 00000001ad1f6003 CR4:
00000000003706f0
4,2376,3510260526,-;Call Trace:
4,2377,3510260622,-; <TASK>
4,2378,3510260743,-; ? write_comp_data+0x37/0xc0
4,2379,3510261249,-; allocate_segment_by_default+0x25d/0x620 [f2fs]
4,2380,3510261731,-; f2fs_allocate_data_block+0xa3b/0x3500 [f2fs]
4,2381,3510262189,-; ? __kasan_check_write+0x24/0x30
4,2382,3510262775,-; ? up_write+0x66/0xd0
4,2383,3510263451,-; do_write_page+0x300/0x6c0 [f2fs]
4,2384,3510263933,-; f2fs_outplace_write_data+0x18d/0x330 [f2fs]
4,2385,3510264395,-; ? f2fs_do_write_node_page+0x140/0x140 [f2fs]
4,2386,3510264854,-; ? write_comp_data+0x37/0xc0
4,2387,3510265327,-; f2fs_do_write_data_page+0xfbd/0x1a90 [f2fs]
4,2388,3510265810,-; ? f2fs_should_update_outplace+0x7a0/0x7a0 [f2fs]
4,2389,3510266354,-; ? __sanitizer_cov_trace_pc+0x31/0x80
4,2390,3510267118,-; ? alloc_pages+0x133/0x370
4,2391,3510267724,-; ? mempool_free_slab+0x40/0x40
4,2392,3510268396,-; ? write_comp_data+0x37/0xc0
4,2393,3510269024,-; f2fs_write_single_data_page+0x1133/0x1b50 [f2fs]
4,2394,3510269662,-; ? f2fs_do_write_data_page+0x1a90/0x1a90 [f2fs]
4,2395,3510270212,-; ? __sanitizer_cov_trace_pc+0x31/0x80
4,2396,3510271051,-; ? percpu_counter_add_batch+0xa4/0x170
4,2397,3510271636,-; ? write_comp_data+0x37/0xc0
4,2398,3510272234,-; ? __sanitizer_cov_trace_pc+0x31/0x80
4,2399,3510272921,-; f2fs_write_cache_pages+0xa4d/0x1e40 [f2fs]
4,2400,3510273572,-; ? f2fs_write_single_data_page+0x1b50/0x1b50 [f2fs]
4,2401,3510274151,-; ? __sanitizer_cov_trace_pc+0x31/0x80
4,2402,3510274896,-; ? _find_next_bit+0x270/0x310
4,2403,3510275568,-; ? cpumask_next_and+0x71/0xb0
4,2404,3510276268,-; ? write_comp_data+0x37/0xc0
4,2405,3510276988,-; ? __kasan_check_write+0x24/0x30
4,2406,3510277534,-; ? write_comp_data+0x37/0xc0
4,2407,3510278161,-; ? __raw_callee_save___native_queued_spin_unlock+0x15/0x23
4,2408,3510279027,-; ? __sanitizer_cov_trace_pc+0x31/0x80
4,2409,3510279564,-; ? f2fs_remove_dirty_inode+0x294/0x6a0 [f2fs]
4,2410,3510280105,-; ? __sanitizer_cov_trace_pc+0x31/0x80
4,2411,3510280725,-; ? __sanitizer_cov_trace_pc+0x31/0x80
4,2412,3510281405,-; f2fs_write_data_pages+0x842/0x12a0 [f2fs]
4,2413,3510282002,-; ? f2fs_write_cache_pages+0x1e40/0x1e40 [f2fs]
4,2414,3510282687,-; ? write_comp_data+0x37/0xc0
4,2415,3510283277,-; ? f2fs_write_cache_pages+0x1e40/0x1e40 [f2fs]
4,2416,3510283837,-; do_writepages+0x174/0x750
4,2417,3510284407,-; filemap_fdatawrite_wbc+0x232/0x3a0
4,2418,3510285046,-; filemap_fdatawrite+0xc2/0x100
4,2419,3510285604,-; ? filemap_flush+0x100/0x100
4,2420,3510286249,-; ? __raw_callee_save___native_queued_spin_unlock+0x15/0x23
4,2421,3510287120,-; f2fs_sync_dirty_inodes+0x25c/0xa70 [f2fs]
4,2422,3510287741,-; block_operations+0x2f8/0xf40 [f2fs]
4,2423,3510288301,-; ? f2fs_sync_inode_meta+0x3b0/0x3b0 [f2fs]
4,2424,3510288904,-; ? write_comp_data+0x37/0xc0
4,2425,3510289511,-; ? write_comp_data+0x37/0xc0
4,2426,3510290169,-; f2fs_write_checkpoint+0x52f/0x5ef0 [f2fs]
4,2427,3510290836,-; ? __sanitizer_cov_trace_pc+0x31/0x80
4,2428,3510291477,-; ? read_node_page+0x376/0x830 [f2fs]
4,2429,3510292051,-; ? f2fs_write_node_page+0x50/0x50 [f2fs]
4,2430,3510292645,-; ? f2fs_get_sectors_written+0x450/0x450 [f2fs]
4,2431,3510293203,-; ? write_comp_data+0x37/0xc0
4,2432,3510293785,-; ? write_comp_data+0x37/0xc0
4,2433,3510294369,-; ? write_comp_data+0x37/0xc0
4,2434,3510295094,-; ? __sanitizer_cov_trace_pc+0x31/0x80
4,2435,3510295776,-; ? f2fs_usable_blks_in_seg+0x106/0xb00 [f2fs]
4,2436,3510296365,-; ? __sanitizer_cov_trace_pc+0x31/0x80
4,2437,3510297045,-; ? write_comp_data+0x37/0xc0
4,2438,3510297697,-; f2fs_gc+0x2b4f/0x3f40 [f2fs]
4,2439,3510298217,-; ? __sanitizer_cov_trace_pc+0x31/0x80
4,2440,3510299133,-; ? free_segment_range+0xc10/0xc10 [f2fs]
4,2441,3510299708,-; ? write_comp_data+0x37/0xc0
4,2442,3510300409,-; ? down_write+0xf0/0x1c0
4,2443,3510300932,-; ? down_write_killable+0x1d0/0x1d0
4,2444,3510301518,-; ? write_comp_data+0x37/0xc0
4,2445,3510302226,-; f2fs_balance_fs+0x957/0x2500 [f2fs]
4,2446,3510302882,-; ? f2fs_balance_fs+0x957/0x2500 [f2fs]
4,2447,3510303461,-; ? f2fs_do_write_data_page+0x727/0x1a90 [f2fs]
4,2448,3510304041,-; ? is_bpf_text_address+0x44/0x60
4,2449,3510304753,-; ? f2fs_balance_fs_bg+0xf30/0xf30 [f2fs]
4,2450,3510305342,-; ? __kasan_check_write+0x24/0x30
4,2451,3510305902,-; ? _raw_spin_lock+0x9b/0x120
4,2452,3510306599,-; ? write_comp_data+0x37/0xc0
4,2453,3510307270,-; ? write_comp_data+0x37/0xc0
4,2454,3510307950,-; f2fs_write_single_data_page+0x120f/0x1b50 [f2fs]
4,2455,3510308619,-; ? f2fs_do_write_data_page+0x1a90/0x1a90 [f2fs]
4,2456,3510309200,-; ? __sanitizer_cov_trace_pc+0x31/0x80
4,2457,3510309958,-; ? percpu_counter_add_batch+0xa4/0x170
4,2458,3510310710,-; ? write_comp_data+0x37/0xc0
4,2459,3510311356,-; ? __sanitizer_cov_trace_pc+0x31/0x80
4,2460,3510312086,-; f2fs_write_cache_pages+0xa4d/0x1e40 [f2fs]
4,2461,3510312774,-; ? f2fs_write_single_data_page+0x1b50/0x1b50 [f2fs]
4,2462,3510313361,-; ? __sanitizer_cov_trace_pc+0x31/0x80
4,2463,3510314044,-; ? ftrace_graph_ret_addr+0x129/0x1b0
4,2464,3510314756,-; ? write_comp_data+0x37/0xc0
4,2465,3510315372,-; ? entry_SYSCALL_64_after_hwframe+0x44/0xae
4,2466,3510316067,-; ? __sanitizer_cov_trace_pc+0x31/0x80
4,2467,3510316725,-; ? write_comp_data+0x37/0xc0
4,2468,3510317370,-; ? __sanitizer_cov_trace_pc+0x31/0x80
4,2469,3510318053,-; ? write_comp_data+0x37/0xc0
4,2470,3510318909,-; ? write_comp_data+0x37/0xc0
4,2471,3510319579,-; ? __mutex_lock_slowpath+0x30/0x30
4,2472,3510320932,-; ? __sanitizer_cov_trace_pc+0x31/0x80
4,2473,3510321427,-; f2fs_write_data_pages+0xd32/0x12a0 [f2fs]
4,2474,3510321906,-; ? f2fs_write_cache_pages+0x1e40/0x1e40 [f2fs]
4,2475,3510322578,-; ? stack_trace_save+0x9c/0xd0
4,2476,3510323108,-; ? stack_trace_snprint+0x120/0x120
4,2477,3510323559,-; ? __x64_sys_mkdir+0x84/0xb0
4,2478,3510324151,-; ? write_comp_data+0x37/0xc0
4,2479,3510324815,-; ? f2fs_write_cache_pages+0x1e40/0x1e40 [f2fs]
4,2480,3510325447,-; do_writepages+0x174/0x750
4,2481,3510326066,-; filemap_fdatawrite_wbc+0x232/0x3a0
4,2482,3510326875,-; file_write_and_wait_range+0x1b9/0x260
4,2483,3510327565,-; ? file_check_and_advance_wb_err+0x330/0x330
4,2484,3510328377,-; ? write_comp_data+0x37/0xc0
4,2485,3510329036,-; f2fs_do_sync_file+0x310/0x27e0 [f2fs]
4,2486,3510329667,-; ? fill_zero+0x5d0/0x5d0 [f2fs]
4,2487,3510330200,-; ? putname+0x158/0x1e0
4,2488,3510330983,-; ? __sanitizer_cov_trace_pc+0x31/0x80
4,2489,3510331671,-; ? write_comp_data+0x37/0xc0
4,2490,3510333299,-; f2fs_sync_file+0x14e/0x1c0 [f2fs]
4,2491,3510333853,-; ? f2fs_do_sync_file+0x27e0/0x27e0 [f2fs]
4,2492,3510334556,-; vfs_fsync_range+0x151/0x250
4,2493,3510335145,-; do_fsync+0x69/0xe0
4,2494,3510335660,-; __x64_sys_fsync+0x40/0x60
4,2495,3510337151,-; do_syscall_64+0x3b/0xc0
4,2496,3510337823,-; entry_SYSCALL_64_after_hwframe+0x44/0xae
4,2497,3510338604,-;RIP: 0033:0x42b7a7
4,2498,3510338970,-;Code: 02 b8 ff ff ff ff eb be 66 2e 0f 1f 84 00 00 00 00 00
90 f3 0f 1e fa 64 8b 04 25 18 00 00 00 85 c0 75 10 b8 4a 00 00 00 0f 05 <48> 3d
00 f0 ff ff 77 41 c3 48 83 ec 18 89 7c 24 0c e8 d3 fb ff ff
4,2499,3510339517,-;RSP: 002b:00007ffddd3b6738 EFLAGS: 00000246 ORIG_RAX:
000000000000004a
4,2500,3510341061,-;RAX: ffffffffffffffda RBX: 0000000000400590 RCX:
000000000042b7a7
4,2501,3510341472,-;RDX: 00000000004d5008 RSI: 0000000000000001 RDI:
0000000000000068
4,2502,3510341840,-;RBP: 00007ffddd3b6760 R08: 0000000000000000 R09:
00007ffddd3b6570
4,2503,3510342213,-;R10: 00000000ffffffff R11: 0000000000000246 R12:
000000000042dba0
4,2504,3510342692,-;R13: 0000000000000000 R14: 0000000000523018 R15:
0000000000000000
4,2505,3510343194,-; </TASK>
4,2506,3510343367,-;---[ end trace 8315ce788462ca5f ]---

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
