Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB096F8B3A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  5 May 2023 23:40:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pv3AW-00007V-Mt;
	Fri, 05 May 2023 21:40:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <32HdVZAkbAEc178tjuun0jyyrm.pxxpun31n0lxw2nw2.lxv@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1pv3AU-00007N-Tq for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 05 May 2023 21:40:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6r1fpOCe4Fv1EAxhDcJy4IoI32U0TyXXfS1pn3Vn3eM=; b=a2RH+JApCd51yIGwDtmzLFZmce
 f0PCdJVgUHo8cziNji30E+NhDAxOcsR+nEMzdO1Er0Qe6mMlyvt8dLFM3m4qIOdG1gJ9pjBqYjPZu
 NuUUaAqzHOYjhhqjGEwREBGzyKWyOyIw2yIOfx3byxhniQOogDlVsRh5bLu/QublnrNY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=6r1fpOCe4Fv1EAxhDcJy4IoI32U0TyXXfS1pn3Vn3eM=; b=I
 9S0icU3Tw1UdYPUh+nzR/2LzfenlppZPGOoNOUiYzMFQV2Rr7W3RYw2sQgNi2Q/KozX9m95y7NhpW
 kG1oO+hYrpXMe+1dVF5WSvVhC9ch6pcCV0hicBybFp+jlegG4Fd16Jq9He+t8IUBYJ+WI09XCbRaH
 dqtKPr1ApgSRYva0=;
Received: from mail-io1-f71.google.com ([209.85.166.71])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pv3AU-0005up-AQ for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 05 May 2023 21:40:46 +0000
Received: by mail-io1-f71.google.com with SMTP id
 ca18e2360f4ac-7606d443ba6so145750039f.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 05 May 2023 14:40:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683322840; x=1685914840;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6r1fpOCe4Fv1EAxhDcJy4IoI32U0TyXXfS1pn3Vn3eM=;
 b=djqbjYvAT1B/WheLu1Y7qcbpb0lqaQsRZ8yax7mOwkIe1cAuxVzFy4Y4QR2F9InKZG
 TN25vwv5E3ctqDSHfVRs0rD48bgycDOoe9vVZ92pxaCdmz9xZ/K0hT0WJr8bYFQrfZMF
 ywHHwW1uiykyPhS3U4+SCjYLpOjwqSqD7rLePtHiyrZv1CngR4xW03l220iN6Asqxpuv
 Sfy30YNoLm0i2nJ6fSSM9jxiew4yh3TFnN252VYEXfJZf9Nen9M7udfkHmmGhLHqnpar
 x1E82T9ByCVaS4eanHs8EcX17CM/gSbc2+yQNGUBSLirK3Q5eGKRotgZryYejSIATbVO
 gcnQ==
X-Gm-Message-State: AC+VfDwKfP/fCqX9QKspnxngLFysjQ1lddUXr8s/UB7fM3Ap4iXsYu9O
 ANXmuf7UKF0BqaX1hzoE0OBRJ9nn/VHFh/5Ah3bKYVc2vIQh
X-Google-Smtp-Source: ACHHUZ4+W5iAMTzlHsI1iNuw3ugVX93iXPox7IbLl9VrL3MAAawXiPp4lY9sMEiE9DjeZp8P3C8leyIKIlMbCyYfumOH3/6InX69
MIME-Version: 1.0
X-Received: by 2002:a92:d4ce:0:b0:32a:9e86:242f with SMTP id
 o14-20020a92d4ce000000b0032a9e86242fmr1369094ilm.6.1683322840521; Fri, 05 May
 2023 14:40:40 -0700 (PDT)
Date: Fri, 05 May 2023 14:40:40 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000f3a4ee05faf923fa@google.com>
From: syzbot <syzbot+list4594bdd613fc4b2a114c@syzkaller.appspotmail.com>
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
 Content preview:  Hello f2fs maintainers/developers, This is a 31-day syzbot
 report for the f2fs subsystem. All related reports/information can be found
 at: https://syzkaller.appspot.com/upstream/s/f2fs During the period, 3 new
 issues were detected and 0 were fixed. In total, 20 issues are still open
 and 28 have been fixed so far. 
 Content analysis details:   (0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.71 listed in list.dnswl.org]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.71 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1pv3AU-0005up-AQ
Subject: [f2fs-dev] [syzbot] Monthly f2fs report (May 2023)
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

This is a 31-day syzbot report for the f2fs subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/f2fs

During the period, 3 new issues were detected and 0 were fixed.
In total, 20 issues are still open and 28 have been fixed so far.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 173     Yes   INFO: task hung in f2fs_balance_fs
                  https://syzkaller.appspot.com/bug?extid=8b85865808c8908a0d8c
<2> 49      Yes   kernel BUG in f2fs_evict_inode
                  https://syzkaller.appspot.com/bug?extid=e1246909d526a9d470fa
<3> 7       No    general protection fault in __replace_atomic_write_block
                  https://syzkaller.appspot.com/bug?extid=4420fa19a8667ff0b057

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
