Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B296EC9A091
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 02 Dec 2025 05:54:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RupKNXe2Omp4j1lp6JfuXjd2AN+JMpa3LxBmk1X/+gY=; b=EP36ZneOK73BKLQAL3SfmOVlP+
	FAY5uXb2v5pSwQzfRNWn6y+5v/mqsPwayd+j+HH8HM6FrvaEc9OaIzn/TfeNjkY2fRRE6TITGb+Kt
	tvA7STIqkBR2LhJ42aLgn4NWZyEdHHaadTcFHhANYNsVkxWTXmhL2yysYjwE8LzhGdWU=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vQIPF-0007Tb-Ib;
	Tue, 02 Dec 2025 04:54:30 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <tytso@mit.edu>) id 1vQIPE-0007TP-Nw
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 02 Dec 2025 04:54:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hlNAOT1sbtQ7BjQ4GHShq/oTk+cnA1iwgTWmvBQZSkA=; b=g0GfCukbtIr4BEHifqgkJzEbrj
 FpenuZdRhBcrN12epkpSo65HLtl/DdrwLxUmev1tkuyZAFF1z9S2NStpZx7OAX/tzSCbFaElIE2+T
 DUSZqSn/JvxuZ8wGBW4nvwDKJkajpsz4ZhL0jx1uRumwPApHBvgNyLxXLg2y2rs846mI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=hlNAOT1sbtQ7BjQ4GHShq/oTk+cnA1iwgTWmvBQZSkA=; b=b
 dmv/wfCcL4Rjr5CJlED9Key0aijSbueBOmgo62jKrtksuQMcZQDCye348uFmqBtLGsJwh+bF1SScD
 thligtcfgzqmu/KFDXM2XICujuUzNmhTA1CSLrW19fyeN/CzR/2bHOh+ppSbV7O/DZf36vqz/askv
 ZiQGQmyTTzKV9xEo=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vQIPE-0007ha-9Q for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 02 Dec 2025 04:54:29 +0000
Received: from macsyma.thunk.org (pool-173-48-121-67.bstnma.fios.verizon.net
 [173.48.121.67]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 5B24eqk6003070
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 1 Dec 2025 23:40:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
 t=1764650454; bh=hlNAOT1sbtQ7BjQ4GHShq/oTk+cnA1iwgTWmvBQZSkA=;
 h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
 b=N8BqqJyzEMncuuvG01kGsVpJ5SmcZTX8IkpRnPMww4acEB2zlrS9P8kbwFYQM3pm0
 CH7aywDq/nQoJLmwDEDVGJeoX36zA5Vkk28DeJdHmrjn4gWHmt7qoBT3RJev/oUtz2
 t9Mw8FsFmveQDC24m/w9lj6IuUGnm+jn4A9Z9QTwpHMAclm5y4wpT+WRY8F4T0tP4V
 fDTYgKESnLiMj/iuE9cjk018dC07hmGwsA9yhcbtBS7J1sDZ4BQC7UirDvDTCeTuHG
 ZA7oEkSvyM0TfQVj/pqUBKlSbEOPHXR4mryEgkV9B+3dJrTGUzq0wRi08eQzfXEDPv
 vzdSoYca9vJRA==
Received: by macsyma.thunk.org (Postfix, from userid 15806)
 id 4E2AA4DC648E; Mon,  1 Dec 2025 23:39:52 -0500 (EST)
Date: Mon, 1 Dec 2025 23:39:52 -0500
From: "Theodore Tso" <tytso@mit.edu>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
Message-ID: <20251202043952.GA70808@macsyma.lan>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  (fstests cc'ed so I can a get handy-dandy lore.kernel.org
 URL for the exclude file with the background for the test exclusion.) Hi,
 I've been running xfstests on ext4, xfs, btrfs, and f2fs on linux-next[1],
 and for the past week or two, the tests have been hanging due to a BUG getting
 triggered on either f2fs/encrypt[2] or f2f [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [18.9.28.11 listed in wl.mailspike.net]
X-Headers-End: 1vQIPE-0007ha-9Q
Subject: [f2fs-dev] generic/204 is crashing on linux-next when testing f2fs
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
Cc: fstests@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

(fstests cc'ed so I can a get handy-dandy lore.kernel.org URL for the
 exclude file with the background for the test exclusion.)

Hi, I've been running xfstests on ext4, xfs, btrfs, and f2fs on
linux-next[1], and for the past week or two, the tests have been
hanging due to a BUG getting triggered on either f2fs/encrypt[2] or
f2fs/compress[3] test configrations.

[1] Using the command: "gce-xfstests ltm -c ext4/all,xfs/all,btrfs/all,f2fs/all -g auto --repo https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next --watch fs-next"
[2] https://github.com/tytso/xfstests-bld/blob/master/test-appliance/files/root/fs/f2fs/cfg/encrypt
[3] https://github.com/tytso/xfstests-bld/blob/master/test-appliance/files/root/fs/f2fs/cfg/compress

Interestingly, after the BUG_ON things get wedged so badly that
"systemctl" hangs forever.  So apparently whatever is going wrong, it
causes the systemd to malfunction in a profound way.  As a result, the
test VM hangs for days until I get around to aborting the VM.

For now, I'll exclude generic/204 from the f2fs configs in my test
appliance; if you have a chance to take a look at this and let me know
when it might be safe to re-neable generic/204 for f2fs, that would be
great.  Thanks!

BTW, if you'd be interestedr receiving the daily ouptut of the
gce-xfstests run for f2fs, let me know.  That can be arranged...

	     	     	       	  - Ted

P.S.  Here's the dmesg output from a run this morning using the
linux-next kernel 6.18.0-xfstests-g781b8d22e5d5:

[ 1011.282502] run fstests generic/204 at 2025-12-01 22:27:28
[ 1011.604590] F2FS-fs (dm-1): f2fs_recover_fsync_data: recovery fsync data, check_only: 0
[ 1011.605016] F2FS-fs (dm-1): Mounted with checkpoint version = 55cbed75
[ 1065.186351] ------------[ cut here ]------------
[ 1065.191112] kernel BUG at fs/f2fs/segment.c:2872!
[ 1065.195977] Oops: invalid opcode: 0000 [#1] SMP PTI
[ 1065.201170] CPU: 0 UID: 0 PID: 390275 Comm: umount Tainted: G        W           6.18.0-xfstests-g781b8d22e5d5 #1 PREEMPT(none) 
[ 1065.212886] Tainted: [W]=WARN
[ 1065.216868] Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/02/2025
[ 1065.226646] RIP: 0010:get_new_segment+0x28d/0x2b0
[ 1065.231684] Code: e4 ff ff ff e9 5f ff ff ff ba 08 00 00 00 31 f6 4c 89 e7 e8 25 14 fe ff 4c 89 ef e8 6d ea 6c 00 b8 8b ff ff ff e9 3e ff ff ff <0f> 0b 83 7c 24 04 01 0f 85 4e fe ff ff 41 39 ee 0f 82 45 fe ff ff
[ 1065.250635] RSP: 0018:ffffb3d684a2b860 EFLAGS: 00010246
[ 1065.255988] RAX: 0000000000000031 RBX: ffffb3d684a2b8b4 RCX: 0000000000000031
[ 1065.263230] RDX: 0000000000000000 RSI: 0000000000000031 RDI: ffff8e76c1d3e290
[ 1065.270556] RBP: 0000000000000001 R08: ffff8e76c1d3e288 R09: 0000000000000000
[ 1065.277801] R10: 0000000000000001 R11: 0000000000000000 R12: ffff8e76c6b1f000
[ 1065.285090] R13: ffff8e7729c2308c R14: 0000000000000000 R15: ffff8e7729c23080
[ 1065.292362] FS:  00007fb977a5f840(0000) GS:ffff8e78090e8000(0000) knlGS:0000000000000000
[ 1065.301096] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 1065.307080] CR2: 00007fef85ee165c CR3: 000000015b64e006 CR4: 00000000003706f0
[ 1065.314528] Call Trace:
[ 1065.317324]  <TASK>
[ 1065.319547]  new_curseg+0xb5/0x220
[ 1065.323166]  f2fs_allocate_data_block+0x51e/0x750
[ 1065.328026]  do_write_page+0x57/0x280
[ 1065.331823]  f2fs_do_write_node_page+0x38/0x70
[ 1065.336395]  __write_node_folio+0x2d1/0x4e0
[ 1065.340723]  f2fs_sync_node_pages+0x428/0x550
[ 1065.345209]  block_operations+0x33e/0x450
[ 1065.349518]  f2fs_write_checkpoint+0x103/0x5e0
[ 1065.354119]  kill_f2fs_super+0x14b/0x190
[ 1065.358297]  deactivate_locked_super+0x33/0xb0
[ 1065.362918]  cleanup_mnt+0xea/0x180
[ 1065.366582]  task_work_run+0x5c/0xa0
[ 1065.370323]  exit_to_user_mode_loop+0xb1/0xd0
[ 1065.374850]  do_syscall_64+0x155/0x160
[ 1065.378830]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[ 1065.384054] RIP: 0033:0x7fb977cb8217
[ 1065.387743] Code: 0d 00 f7 d8 64 89 02 b8 ff ff ff ff c3 66 0f 1f 44 00 00 31 f6 e9 09 00 00 00 66 0f 1f 84 00 00 00 00 00 b8 a6 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 01 c3 48 8b 15 b1 5b 0d 00 f7 d8 64 89 02 b8
[ 1065.406622] RSP: 002b:00007ffc531c8d48 EFLAGS: 00000246 ORIG_RAX: 00000000000000a6
[ 1065.414317] RAX: 0000000000000000 RBX: 0000564b0abc7af8 RCX: 00007fb977cb8217
[ 1065.421570] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000564b0abce710
[ 1065.428834] RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
[ 1065.436085] R10: 0000000000000008 R11: 0000000000000246 R12: 00007fb977e1826c
[ 1065.443415] R13: 0000564b0abce710 R14: 0000564b0abc7e30 R15: 0000564b0abc79f0
[ 1065.450667]  </TASK>
[ 1065.453067] ---[ end trace 0000000000000000 ]---
[ 1065.457915] RIP: 0010:get_new_segment+0x28d/0x2b0
[ 1065.462751] Code: e4 ff ff ff e9 5f ff ff ff ba 08 00 00 00 31 f6 4c 89 e7 e8 25 14 fe ff 4c 89 ef e8 6d ea 6c 00 b8 8b ff ff ff e9 3e ff ff ff <0f> 0b 83 7c 24 04 01 0f 85 4e fe ff ff 41 39 ee 0f 82 45 fe ff ff
[ 1065.481788] RSP: 0018:ffffb3d684a2b860 EFLAGS: 00010246
[ 1065.487199] RAX: 0000000000000031 RBX: ffffb3d684a2b8b4 RCX: 0000000000000031
[ 1065.494559] RDX: 0000000000000000 RSI: 0000000000000031 RDI: ffff8e76c1d3e290
[ 1065.501898] RBP: 0000000000000001 R08: ffff8e76c1d3e288 R09: 0000000000000000
[ 1065.509183] R10: 0000000000000001 R11: 0000000000000000 R12: ffff8e76c6b1f000
[ 1065.516459] R13: ffff8e7729c2308c R14: 0000000000000000 R15: ffff8e7729c23080
[ 1065.523744] FS:  00007fb977a5f840(0000) GS:ffff8e78090e8000(0000) knlGS:0000000000000000
[ 1065.532160] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 1065.538091] CR2: 00007fef85ee165c CR3: 000000015b64e006 CR4: 00000000003706f0
[ 1065.545412] note: umount[390275] exited with preempt_count 1




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
