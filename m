Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D6C95542C
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 17 Aug 2024 02:27:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sf7I6-0001jq-Kk;
	Sat, 17 Aug 2024 00:27:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3au6_ZgkbAIMz56rhsslyhwwpk.nvvnsl1zlyjvu0lu0.jvt@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1sf7I5-0001jk-QZ for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 17 Aug 2024 00:27:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1gN2SrQ5ddI5BK1sabWQZ54KOewTmtdJJhiH/IDylRw=; b=U10nNc4G+vHqiDtW+MAZl3mjGX
 2VknpJbrID7PgoJPRbhxwSnHwcUDgux+6QizrIOWDzNEFsWnDbXhTFJwyzpjYUr8mgMbfjSX4KWf1
 nI7s2PzqKsFwek3xptny+k63ls7ZJUNBE5PBWYQ43V3TJXmaTQ/+/om2ivzWbZnu1yRw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=1gN2SrQ5ddI5BK1sabWQZ54KOewTmtdJJhiH/IDylRw=; b=U
 KmapFs2Y56X8xNjj+OHJcS6oMcv/J5tvR8boHJYiPWcm9dVrqly7JOTtrgmje1AQHksmJUar4RRNg
 fmB2o8EwahUf/BR/KxtK/wOSv4rHTXnryDqLsyCOnoAq3psuAfQtEqOu8FHgELxshM2vm3AWfQSRF
 rLOd4pcHvUVCBOTw=;
Received: from mail-io1-f69.google.com ([209.85.166.69])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sf7I5-0000gy-29 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 17 Aug 2024 00:27:33 +0000
Received: by mail-io1-f69.google.com with SMTP id
 ca18e2360f4ac-81f897b8b56so193351339f.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 16 Aug 2024 17:27:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723854442; x=1724459242;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1gN2SrQ5ddI5BK1sabWQZ54KOewTmtdJJhiH/IDylRw=;
 b=K7z5ZXKzs3VY8sdvVsOZdnHPzr7Lj3L3Fe+/BvBtoULCHI8kXD5ow2449CIc0GFHzF
 iv5ewQ+kf3teXijlV2kMzkK22/ANBMDYVmeMelZTsBng8lE/n51X9Mlp0/gMKIhx+MqH
 eqloo2e0TmGYGndYRwraeF12r4AJjaiRBhxqQ4JFbYPjq1tQZc9r/Y7yq+u/qRJYIO0a
 Xj7NCMPCLhGsGwwpzN/3RrCR/1Aex+uQlbUQRhSf6zhUyxN+mrgzmW8Qbbsmvg8p5OXn
 H70xQkKU8eyGi1KiKi0j9aGduvzN2hr/WOWZiSmS4krfBNEvPfZY+OntJ1yZnRI2dv8v
 2SDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVU7nClHm21+a494WiOctDka3uJxOsKBf8CLumVdKkbbVSU1O4a8DZHZ1T0KLJVbf0PFNWTInu/cnAhIWS+wXXlYLtgndEjhiV9eXI5yiZo8pQA5YR5oQ==
X-Gm-Message-State: AOJu0YyflxIRhxlSumOh7N6+BG2hrOCgu/LHIIe3F7OYhk9/+jMhBgPv
 uTHIxYjznLmQ2AEwY+7lxPC/R//WFsnKerbxDZP68kZvvLLEjMfn51baznj1HkVjqWsylZWbAjV
 UWLT4UgLGVuwwzrXe388EBGyokF6OIJ/jbsA7Ui7MBQ0AwMYPpfMdz3M=
X-Google-Smtp-Source: AGHT+IGS+h644N8ypGgzieUdY/TV/bcjfk/heAl8LcVZKHCXEJH/wP7Fd6SyetIe3ooZ+XL736Rg3KdE/LtcOrf6EI51MYgRkhSh
MIME-Version: 1.0
X-Received: by 2002:a05:6638:370f:b0:4b9:9c0a:6f6c with SMTP id
 8926c6da1cb9f-4cce117868cmr161716173.1.1723854442200; Fri, 16 Aug 2024
 17:27:22 -0700 (PDT)
Date: Fri, 16 Aug 2024 17:27:22 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000ac12e3061fd623b8@google.com>
From: syzbot <syzbot+16c06d2c27b585e352f8@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: -1.7 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot found the following issue on: HEAD commit: 9e6869691724
 Add linux-next specific files for 20240812 git tree: linux-next console
 output:
 https://syzkaller.appspot.com/x/log.txt?x=177f4b7d980000 kernel config:
 https://syzkaller.apps [...] 
 Content analysis details:   (-1.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: syzkaller.appspot.com]
 2.7 RCVD_IN_PSBL           RBL: Received via a relay in PSBL
 [209.85.166.69 listed in psbl.surriel.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.85.166.69 listed in list.dnswl.org]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.69 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.69 listed in bl.score.senderscore.com]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.69 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sf7I5-0000gy-29
Subject: [f2fs-dev] [syzbot] [f2fs?] WARNING: lock held when returning
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

syzbot found the following issue on:

HEAD commit:    9e6869691724 Add linux-next specific files for 20240812
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=177f4b7d980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=61ba6f3b22ee5467
dashboard link: https://syzkaller.appspot.com/bug?extid=16c06d2c27b585e352f8
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14e46af5980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=158ea2ed980000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/f1b086192f50/disk-9e686969.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/b457920fb52e/vmlinux-9e686969.xz
kernel image: https://storage.googleapis.com/syzbot-assets/e63ba9cce98a/bzImage-9e686969.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/b1fc2a52ac10/mount_0.gz

The issue was bisected to:

commit 7566a155c666dd23b413a002a50cd9ae7b95f053
Author: Chao Yu <chao@kernel.org>
Date:   Tue Jun 25 03:13:49 2024 +0000

    f2fs: atomic: fix to not allow GC to pollute atomic_file

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1416b183980000
final oops:     https://syzkaller.appspot.com/x/report.txt?x=1616b183980000
console output: https://syzkaller.appspot.com/x/log.txt?x=1216b183980000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+16c06d2c27b585e352f8@syzkaller.appspotmail.com
Fixes: 7566a155c666 ("f2fs: atomic: fix to not allow GC to pollute atomic_file")

F2FS-fs (loop0): Mounted with checkpoint version = 48b305e5
syz-executor161: attempt to access beyond end of device
loop0: rw=2049, sector=45096, nr_sectors = 8 limit=40427
================================================
WARNING: lock held when returning


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about bisection process see: https://goo.gl/tpsmEJ#bisection

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
