Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 61174470279
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Dec 2021 15:13:06 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mvgdx-0003Lr-DY; Fri, 10 Dec 2021 14:13:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@bugzilla.kernel.org>)
 id 1mvgdv-0003Lg-MZ
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Dec 2021 14:12:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8gATuTiHDh/Px/sILX0lfsGlwVxjBgR4h0xywmGF4kg=; b=QGKiUCBXj+sct1nolW/k/oGEOz
 tU+mcm8UIcBO9wW8ZYlb6ArBTuyCMtAKgg9tS9KL+Yb4qOI3miYjAHnp2z6F5KoqEPldembrSpnKe
 prqEAw+cpoSRaVhDfnhoAGfJcvSY7smpVpvHyDqQFEI/lcy+vtVRcLK+5wBV1mVrweYM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Date:
 Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=8gATuTiHDh/Px/sILX0lfsGlwVxjBgR4h0xywmGF4kg=; b=h
 UbADtP8yhrVKIHtpHkbKULg3YcRV5Fg0H9ABFuaeodB+Gica15sV/++6mdYbc9FcX3XbMC/2XHlsx
 83JZ9RDAYZgfSnUZBvWrkMtk/sJdKl4FhB2J9a0r57g1JeTaNWivzVjU1g21rjZZ9XTH7KBrPJNrP
 iRutvy7UKZBr7td0=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mvgdu-000681-KN
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Dec 2021 14:12:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 49CE1B827F1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 10 Dec 2021 14:12:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2335EC341C6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 10 Dec 2021 14:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639145571;
 bh=QA6cBBEtCw3TiLHI4LjDvnNLKQXkuTaEhwBv2DrrYhI=;
 h=From:To:Subject:Date:From;
 b=akjgJysqG372ZotdabZvpRTm33QKYLxMe2TOzVzqKfsT4O5mb8+NEOnt2r1Gk6Pr3
 2zuoSRqu3qRvSYDtcuGOqMRYo2vhczyvBuSypIJaQO1MKp0gvzz+kHQt8G/8TSDT2r
 KfhO2rDnnJwEkMgIn4Y0y37Mbh4qtDuz5PjfVXbMGpkVeYIbkKRJlPGnaIoyveMYve
 yu1E9Cu483SWOrXn++rgQVexblHaLtYKtlOWbqc4w5e1vGCJQTP97viAowfx/F7VSR
 CDIB7tcPIeZ/Jeq7FsPR2G/BEBuDVTMoAhycU9eccBAdjUOgiILI7bOj3ctoUqBTCO
 6p/OyvLWUWBnw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 02A1760F38; Fri, 10 Dec 2021 14:12:50 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 10 Dec 2021 14:12:50 +0000
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
Message-ID: <bug-215295-202145@https.bugzilla.kernel.org/>
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
 Content preview:  https://bugzilla.kernel.org/show_bug.cgi?id=215295 Bug ID:
 215295 Summary: F2FS: BUG: KASAN: slab-out-of-bounds in
 reset_curseg+0x5ac/0x5e0
 [f2fs] Product: File System Version: 2.5 Kernel Version: 5.15.4 Hardware:
 All OS: Linux Tree: Mainline Status: [...] 
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
X-Headers-End: 1mvgdu-000681-KN
Subject: [f2fs-dev] [Bug 215295] New: F2FS: BUG: KASAN: slab-out-of-bounds
 in reset_curseg+0x5ac/0x5e0 [f2fs]
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

https://bugzilla.kernel.org/show_bug.cgi?id=215295

            Bug ID: 215295
           Summary: F2FS: BUG: KASAN: slab-out-of-bounds in
                    reset_curseg+0x5ac/0x5e0 [f2fs]
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
operations I performed are all related to file or mount. I build the kernel
with CONFIG_KASAN option, and the corresponding KASAN message is listed as
following:


3,2045,7791135067,-;BUG: KASAN: slab-out-of-bounds in reset_curseg+0x5ac/0x5e0
[f2fs]
3,2046,7791135854,-;Write of size 4 at addr ffff8881077de810 by task
kworker/u16:4/5163
3,2047,7791135926,-;
3,2048,7791135926,-;CPU: 7 PID: 5163 Comm: kworker/u16:4 Tainted: G        W   
L    5.15.4 #2
3,2049,7791135926,-;Hardware name: LENOVO 20J6A00NHH/20J6A00NHH, BIOS R0FET24W
(1.04 ) 12/21/2016
3,2050,7791135926,-;Workqueue: writeback wb_workfn (flush-7:14)
3,2051,7791135926,-;Call Trace:
3,2052,7791135926,-; <TASK>
3,2053,7791135926,-; dump_stack_lvl+0xea/0x130
3,2054,7791135926,-; print_address_description.constprop.0+0x34/0x240
3,2055,7791135926,-; ? reset_curseg+0x5ac/0x5e0 [f2fs]
3,2056,7791135926,-; kasan_report.cold+0xd8/0x200
3,2057,7791135926,-; ? reset_curseg+0x5ac/0x5e0 [f2fs]
3,2058,7791135926,-; __asan_report_store4_noabort+0x27/0x40
3,2059,7791135926,-; reset_curseg+0x5ac/0x5e0 [f2fs]
3,2060,7791135926,-; new_curseg+0xd4b/0x1940 [f2fs]
3,2061,7791135926,-; ? write_comp_data+0x37/0xc0
3,2062,7791135926,-; allocate_segment_by_default+0x25d/0x620 [f2fs]
3,2063,7791135926,-; f2fs_allocate_data_block+0xa3b/0x3500 [f2fs]
3,2064,7791135926,-; ? __kasan_check_write+0x24/0x30
3,2065,7791135926,-; ? up_write+0x66/0xd0
3,2066,7791135926,-; do_write_page+0x300/0x6c0 [f2fs]
3,2067,7791135926,-; f2fs_outplace_write_data+0x18d/0x330 [f2fs]
3,2068,7791135926,-; ? f2fs_do_write_node_page+0x140/0x140 [f2fs]
3,2069,7791135926,-; ? write_comp_data+0x37/0xc0
3,2070,7791135926,-; f2fs_do_write_data_page+0xfbd/0x1a90 [f2fs]
3,2071,7791135926,-; ? f2fs_should_update_outplace+0x7a0/0x7a0 [f2fs]
3,2072,7791135926,-; ? __sanitizer_cov_trace_pc+0x31/0x80
3,2073,7791155914,-; ? alloc_pages+0x133/0x370
3,2074,7791155914,-; ? mempool_free_slab+0x40/0x40
3,2075,7791155914,-; ? write_comp_data+0x37/0xc0
3,2076,7791155914,-; f2fs_write_single_data_page+0x1133/0x1b50 [f2fs]
3,2077,7791159920,-; ? f2fs_do_write_data_page+0x1a90/0x1a90 [f2fs]
3,2078,7791159920,-; ? __sanitizer_cov_trace_pc+0x31/0x80
3,2079,7791159920,-; ? percpu_counter_add_batch+0xa4/0x170
3,2080,7791159920,-; ? write_comp_data+0x37/0xc0
3,2081,7791159920,-; ? __sanitizer_cov_trace_pc+0x31/0x80
3,2082,7791159920,-; f2fs_write_cache_pages+0xa4d/0x1e40 [f2fs]
3,2083,7791159920,-; ? f2fs_write_single_data_page+0x1b50/0x1b50 [f2fs]
3,2084,7791159920,-; ? write_comp_data+0x37/0xc0
3,2085,7791159920,-; ? __kasan_check_write+0x24/0x30
3,2086,7791159920,-; ? write_comp_data+0x37/0xc0
3,2087,7791167905,-; ? __kasan_check_read+0x21/0x30
3,2088,7791167905,-; ? sysvec_apic_timer_interrupt+0x4b/0x90
3,2089,7791167905,-; ? asm_sysvec_apic_timer_interrupt+0x12/0x20
3,2090,7791167905,-; ? __kasan_check_write+0x24/0x30
3,2091,7791171925,-; ? write_comp_data+0x37/0xc0
3,2092,7791171925,-; ? __raw_callee_save___native_queued_spin_unlock+0x15/0x23
3,2093,7791171925,-; ? __sanitizer_cov_trace_pc+0x31/0x80
3,2094,7791171925,-; ? f2fs_remove_dirty_inode+0x294/0x6a0 [f2fs]
3,2095,7791171925,-; ? __sanitizer_cov_trace_pc+0x31/0x80
3,2096,7791171925,-; ? __sanitizer_cov_trace_pc+0x31/0x80
3,2097,7791171925,-; f2fs_write_data_pages+0x842/0x12a0 [f2fs]
3,2098,7791171925,-; ? f2fs_write_cache_pages+0x1e40/0x1e40 [f2fs]
3,2099,7791171925,-; ? write_comp_data+0x37/0xc0
3,2100,7791171925,-; ? f2fs_write_cache_pages+0x1e40/0x1e40 [f2fs]
3,2101,7791179908,-; do_writepages+0x174/0x750
3,2102,7791179908,-; filemap_fdatawrite_wbc+0x232/0x3a0
3,2103,7791179908,-; filemap_fdatawrite+0xc2/0x100
3,2104,7791179908,-; ? filemap_flush+0x100/0x100
3,2105,7791183945,-; ? __raw_callee_save___native_queued_spin_unlock+0x15/0x23
3,2106,7791183945,-; f2fs_sync_dirty_inodes+0x25c/0xa70 [f2fs]
3,2107,7791183945,-; block_operations+0x2f8/0xf40 [f2fs]
3,2108,7791183945,-; ? kthread+0x400/0x510
3,2109,7791183945,-; ? f2fs_sync_inode_meta+0x3b0/0x3b0 [f2fs]
3,2110,7791183945,-; ? _raw_spin_lock_irqsave+0xde/0x170
3,2111,7791183945,-; ? write_comp_data+0x37/0xc0
3,2112,7791183945,-; ? write_comp_data+0x37/0xc0
3,2113,7791183945,-; f2fs_write_checkpoint+0x52f/0x5ef0 [f2fs]
3,2114,7791183945,-; ? __xa_set_mark+0xeb/0x140
3,2115,7791183945,-; ? xas_set_mark+0x260/0x260
3,2116,7791183945,-; ? __sanitizer_cov_trace_pc+0x31/0x80
3,2117,7791183945,-; ? f2fs_get_sectors_written+0x450/0x450 [f2fs]
3,2118,7791183945,-; ? __kasan_check_write+0x24/0x30
3,2119,7791183945,-; ? __kasan_check_write+0x24/0x30
3,2120,7791183945,-; ? down_write+0xf0/0x1c0
3,2121,7791183945,-; ? down_write_killable+0x1d0/0x1d0
3,2122,7791183945,-; ? ftrace_graph_ret_addr+0x129/0x1b0
3,2123,7791183945,-; ? __sanitizer_cov_trace_pc+0x31/0x80
3,2124,7791183945,-; ? write_comp_data+0x37/0xc0
3,2125,7791183945,-; f2fs_issue_checkpoint+0x1fa/0x5c0 [f2fs]
3,2126,7791183945,-; ? mutex_unlock+0x91/0x110
3,2127,7791183945,-; ? f2fs_destroy_checkpoint_caches+0x40/0x40 [f2fs]
3,2128,7791183945,-; ? write_comp_data+0x37/0xc0
3,2129,7791183945,-; ? f2fs_build_free_nids+0xec9/0x13c0 [f2fs]
3,2130,7791183945,-; ? write_comp_data+0x37/0xc0
3,2131,7791183945,-; ? write_comp_data+0x37/0xc0
3,2132,7791183945,-; f2fs_sync_fs+0x309/0x3d0 [f2fs]
3,2133,7791183945,-; f2fs_balance_fs_bg+0x483/0xf30 [f2fs]
3,2134,7791183945,-; ? f2fs_drop_inmem_page+0xec0/0xec0 [f2fs]
3,2135,7791183945,-; ? __kasan_check_write+0x24/0x30
3,2136,7791183945,-; ? _raw_spin_lock_irqsave+0xde/0x170
3,2137,7791183945,-; ? _raw_write_unlock_bh+0x80/0x80
3,2138,7791183945,-; ? write_comp_data+0x37/0xc0
3,2139,7791211895,-; ? write_comp_data+0x37/0xc0
3,2140,7791211895,-; f2fs_write_node_pages+0x16f/0xaa0 [f2fs]
3,2141,7791211895,-; ? f2fs_sync_node_pages+0x2050/0x2050 [f2fs]
3,2142,7791211895,-; ? write_comp_data+0x37/0xc0
3,2143,7791211895,-; ? __sanitizer_cov_trace_pc+0x31/0x80
3,2144,7791211895,-; ? write_comp_data+0x37/0xc0
3,2145,7791211895,-; ? f2fs_sync_node_pages+0x2050/0x2050 [f2fs]
3,2146,7791211895,-; do_writepages+0x174/0x750
3,2147,7791211895,-; __writeback_single_inode+0xf5/0xcd0
3,2148,7791211895,-; writeback_sb_inodes+0x5e5/0x10d0
3,2149,7791211895,-; ? __writeback_single_inode+0xcd0/0xcd0
3,2150,7791211895,-; ? __kasan_check_write+0x24/0x30
3,2151,7791211895,-; ? __sanitizer_cov_trace_pc+0x31/0x80
3,2152,7791211895,-; ? write_comp_data+0x37/0xc0
3,2153,7791211895,-; __writeback_inodes_wb+0x160/0x2d0
3,2154,7791211895,-; wb_writeback+0x815/0xac0
3,2155,7791211895,-; ? __writeback_inodes_wb+0x2d0/0x2d0
3,2156,7791211895,-; ? __sanitizer_cov_trace_pc+0x31/0x80
3,2157,7791211895,-; ? get_nr_dirty_inodes+0xfe/0x170
3,2158,7791211895,-; ? write_comp_data+0x37/0xc0
3,2159,7791211895,-; wb_workfn+0xa23/0x1020
3,2160,7791230699,-; ? inode_wait_for_writeback+0x80/0x80
3,2161,7791231899,-; ? psi_task_change+0x250/0x250
3,2162,7791232071,-; ? __kasan_check_write+0x24/0x30
3,2163,7791232071,-; ? __switch_to+0x4f4/0x1270
3,2164,7791232071,-; ? __schedule+0xb9a/0x2750
3,2165,7791234424,-; ? write_comp_data+0x37/0xc0
3,2166,7791234424,-; process_one_work+0x9cb/0x16f0
3,2167,7791236218,-; worker_thread+0x67a/0x14d0
3,2168,7791236218,-; ? _raw_write_unlock_bh+0x80/0x80
3,2169,7791237612,-; ? rescuer_thread+0x1020/0x1020
3,2170,7791238481,-; kthread+0x400/0x510
3,2171,7791238481,-; ? set_kthread_struct+0x180/0x180
3,2172,7791238481,-; ret_from_fork+0x22/0x30
3,2173,7791239957,-; </TASK>
3,2174,7791239957,-;
3,2175,7791239957,-;The buggy address belongs to the page:
4,2176,7791239957,-;page:000000000e5ac705 refcount:1 mapcount:0
mapping:0000000000000000 index:0x0 pfn:0x1077d8
4,2177,7791241100,-;head:000000000e5ac705 order:3 compound_mapcount:0
compound_pincount:0
4,2178,7791241100,-;flags:
0x17ffffc0010000(head|node=0|zone=2|lastcpupid=0x1fffff)
4,2179,7791242543,-;raw: 0017ffffc0010000 0000000000000000 dead000000000122
0000000000000000
4,2180,7791243343,-;raw: 0000000000000000 0000000000000000 00000001ffffffff
0000000000000000
4,2181,7791243447,-;page dumped because: kasan: bad access detected
3,2182,7791243983,-;
3,2183,7791244033,-;Memory state around the buggy address:
3,2184,7791244392,-; ffff8881077de700: 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00
3,2185,7791244392,-; ffff8881077de780: 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00
3,2186,7791245155,-;>ffff8881077de800: 00 00 fe fe fe fe fe fe fe fe fe fe fe
fe fe fe
3,2187,7791245155,-;                         ^
3,2188,7791245155,-; ffff8881077de880: fe fe fe fe fe fe fe fe fe fe fe fe fe
fe fe fe
3,2189,7791245155,-; ffff8881077de900: fe fe fe fe fe fe fe fe fe fe fe fe fe
fe fe fe
3,2190,7791246450,-;==================================================================

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
