Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 757BF96CC45
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  5 Sep 2024 03:28:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sm1I6-00070C-Ru;
	Thu, 05 Sep 2024 01:28:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sm1I5-000704-Om
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Sep 2024 01:28:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TlwUwmpGagB7kgJF9IYfm+zqWSaBvAZdcG7RdmtIbZU=; b=WA3611V7TCHhm2tDOK/EujGBZy
 FV3zoEZcdTCQ3JpM1zPjcu61IiY52K1A2RfZqhOXmVNDlq8GyGkwhIKIPr5hzLYCQUb3mXA8L23sh
 Eilwuj9meX7fi5fuYs7kNeZa8LQrwg24ZIr8xujD1PmXLqDCaN/QPiz0FaHEHUuL4LfA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TlwUwmpGagB7kgJF9IYfm+zqWSaBvAZdcG7RdmtIbZU=; b=alqUaVsdQz9gnv2Twe2E3PRuH/
 zMxfIlOCKc2zTinhLK3ij+VGp2dB+tu3oPvaKuLuwdh5VsEsbTeBHwJMb8GEjI+3U5inEe/OUhz8P
 RyDnxqGy/LLT8saIYSN8DCr1ZRR4C0NuOYf7BKNyjnomSMljRG/9av72Po1CXGdnZF0w=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sm1I4-0006yv-VE for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Sep 2024 01:28:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 243175C0FD1;
 Thu,  5 Sep 2024 01:27:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEFD1C4CEC2;
 Thu,  5 Sep 2024 01:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725499674;
 bh=FbC1cPPSzbfW5w56+Cy7QKMrwCfrGMBGayVp6e5oT2I=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=cYxiTxLOAgjYv9AVW0GhChagMznZzQF4EUUgIWpX1ah/LnkRVuMwy8Imu6NFO7nN1
 6HleT0LVmRFP/jw3Xs8wfuU+WSScNSHtTKgQLAD1AMRovibJMznmIveTWX02OR8d7E
 8ap1EDoIl0Yxf0eF65vO8AqtpvBuxis6UdKJULpYjcmjgp1YOdzJm6o9NUMLVfn4zA
 MN0bQNgs4wtrN1k9wgnJryWf6slS5EJvs3Y2WmLNRmHv4H3Tr7VR59Rf1US1fDFemq
 jt5nHreQMyHJXtwiVcOBAcxslpt0Hy9jnizBUuQlst2JwouWCjGLkIUn3ylfIkCabI
 SNsmk3UVZcKKA==
Message-ID: <ef3966b1-aa76-4bd7-a9c6-becdf996496d@kernel.org>
Date: Thu, 5 Sep 2024 09:27:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: syzbot <syzbot+16c06d2c27b585e352f8@syzkaller.appspotmail.com>,
 jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
References: <000000000000ac12e3061fd623b8@google.com>
Content-Language: en-US
In-Reply-To: <000000000000ac12e3061fd623b8@google.com>
X-Spam-Score: -5.4 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: #syz invalid Becuase commit "f2fs: atomic: fix to not allow
 GC to pollute atomic_file" has been dropped. On 2024/8/17 8:27, syzbot wrote:
 > Hello, > > syzbot found the following issue on: > > HEAD commit: 9e6869691724
 Add linux-next specific files for 20240812 > git tree: linux-next > console
 output: htt [...] 
 Content analysis details:   (-5.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sm1I4-0006yv-VE
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] WARNING: lock held when returning
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

#syz invalid

Becuase commit "f2fs: atomic: fix to not allow GC to pollute atomic_file" has
been dropped.

On 2024/8/17 8:27, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    9e6869691724 Add linux-next specific files for 20240812
> git tree:       linux-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=177f4b7d980000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=61ba6f3b22ee5467
> dashboard link: https://syzkaller.appspot.com/bug?extid=16c06d2c27b585e352f8
> compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14e46af5980000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=158ea2ed980000
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/f1b086192f50/disk-9e686969.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/b457920fb52e/vmlinux-9e686969.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/e63ba9cce98a/bzImage-9e686969.xz
> mounted in repro: https://storage.googleapis.com/syzbot-assets/b1fc2a52ac10/mount_0.gz
> 
> The issue was bisected to:
> 
> commit 7566a155c666dd23b413a002a50cd9ae7b95f053
> Author: Chao Yu <chao@kernel.org>
> Date:   Tue Jun 25 03:13:49 2024 +0000
> 
>      f2fs: atomic: fix to not allow GC to pollute atomic_file
> 
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1416b183980000
> final oops:     https://syzkaller.appspot.com/x/report.txt?x=1616b183980000
> console output: https://syzkaller.appspot.com/x/log.txt?x=1216b183980000
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+16c06d2c27b585e352f8@syzkaller.appspotmail.com
> Fixes: 7566a155c666 ("f2fs: atomic: fix to not allow GC to pollute atomic_file")
> 
> F2FS-fs (loop0): Mounted with checkpoint version = 48b305e5
> syz-executor161: attempt to access beyond end of device
> loop0: rw=2049, sector=45096, nr_sectors = 8 limit=40427
> ================================================
> WARNING: lock held when returning
> 
> 
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
> 
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection
> 
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
> 
> If you want syzbot to run the reproducer, reply with:
> #syz test: git://repo/address.git branch-or-commit-hash
> If you attach or paste a git patch, syzbot will apply it before testing.
> 
> If you want to overwrite report's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
> 
> If the report is a duplicate of another one, reply with:
> #syz dup: exact-subject-of-another-report
> 
> If you want to undo deduplication, reply with:
> #syz undup
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
