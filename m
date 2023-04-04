Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDB96D6518
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Apr 2023 16:21:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pjhWp-00063t-Sw;
	Tue, 04 Apr 2023 14:20:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3PTIsZAkbAHoqwxiYjjcpYnngb.emmejcsqcpamlrclr.amk@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1pjhWo-00063k-5Q for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 14:20:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eMNGtlJZv/4J3QkC2pyZ771io5e3UBz8yYy+eISdalI=; b=BAVwfT2yNvO800bPMty4iXxwNF
 8hTVhrHHVzB7LQKw9x0JoQMIWYkR4dpB5QPd4ZiFL7x5+6sPAStNKBF8neLieAq1gafBRrfJi3RtZ
 QK+mz1XMBg/QCz57DnvwsxxYKv8RtorrXdLw9O84dU1asTdW/f7AlmiGI2VZyJJHTQF8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=eMNGtlJZv/4J3QkC2pyZ771io5e3UBz8yYy+eISdalI=; b=g
 l7HJilwuPXjA9BudnhdQoV8b6yY4t4Bi6cqj49Dkjt8F4rUMC3Ot9ddVqzedQ+UEEXXoIgY1j5ehQ
 ixlmIEnbtf858DgcooVc4TGejWIj3Lh2P8hGvBL4XgSnd0Y5b3GdnwbD8QaUmh0AD7LW4fbZFM0/j
 zLqsEZ8yeWp5Dxiw=;
Received: from mail-io1-f69.google.com ([209.85.166.69])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pjhWl-0008SU-Gm for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 14:20:53 +0000
Received: by mail-io1-f69.google.com with SMTP id
 i189-20020a6b3bc6000000b00758a1ed99c2so20021497ioa.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 04 Apr 2023 07:20:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680618046; x=1683210046;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eMNGtlJZv/4J3QkC2pyZ771io5e3UBz8yYy+eISdalI=;
 b=xIlk+SHaL/+SOCfIoNKxUuTQyAaIogU6DGGQESeQtdp8a6dMTyB7YI/xdktxnWWCLu
 LllnKxnbKUBp3xQDaT9tPloTgzZyzdRn/g6nNIhuHm8j5XMdVvI3JpCpFWmxMcasawNH
 7n9T6t5uqOZpIr5ONw2R7aJ46D3Ht2hYP12KaJI+1DUKdNvuHEESoMAIypLDAkGI2EiW
 PXmlfQqyYzMDY64NUscydfVRiIWuFc+hS7BAgAlhW+KSSwKIqQObep7XuaPsMGn3N7H2
 gcqwk4MOQd3fT1K9NPHbCF7EXJwf8G62wIEVYeP09zzbg42VAgxmpqO5AvVu6DJHCCKR
 8dHA==
X-Gm-Message-State: AAQBX9em7bJHVA0PIlsM+LcqLc7CpoCpEh09fgzDufYy5uya/9j9bRcw
 ThTyJRKM99OfqBFTI/fc60sVr482+p8MMGAOQqZ82YgbXdZm
X-Google-Smtp-Source: AKy350a+WL44nLl7X2R0Ry2vo6oea+fMVyYo4ZSOxn5TAfx3lixq7DYBV37bw38GjRlTrpDS2wQW27XIXgwOnFzkuRQ5bR5OF19O
MIME-Version: 1.0
X-Received: by 2002:a05:6602:22d2:b0:752:fa5a:6188 with SMTP id
 e18-20020a05660222d200b00752fa5a6188mr1676000ioe.1.1680618045959; Tue, 04 Apr
 2023 07:20:45 -0700 (PDT)
Date: Tue, 04 Apr 2023 07:20:45 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000a1f44605f8836188@google.com>
From: syzbot <syzbot+listc9c597f02f7166815d68@syzkaller.appspotmail.com>
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
 Content preview:  Hello f2fs maintainers/developers, This is a 30-day syzbot
 report for the f2fs subsystem. All related reports/information can be found
 at: https://syzkaller.appspot.com/upstream/s/f2fs During the period, 0 new
 issues were detected and 0 were fixed. In total, 16 issues are still open
 and 27 have been fixed so far. 
 Content analysis details:   (0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.69 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.69 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1pjhWl-0008SU-Gm
Subject: [f2fs-dev] [syzbot] Monthly f2fs report
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

Hello f2fs maintainers/developers,

This is a 30-day syzbot report for the f2fs subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/f2fs

During the period, 0 new issues were detected and 0 were fixed.
In total, 16 issues are still open and 27 have been fixed so far.

Some of the still happening issues:

Crashes Repro Title
77      Yes   INFO: task hung in f2fs_balance_fs
              https://syzkaller.appspot.com/bug?extid=8b85865808c8908a0d8c
23      Yes   kernel BUG in f2fs_evict_inode
              https://syzkaller.appspot.com/bug?extid=e1246909d526a9d470fa
4       No    BUG: unable to handle kernel NULL pointer dereference in f2fs_release_folio
              https://syzkaller.appspot.com/bug?extid=00e671c059932a115ea4

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
