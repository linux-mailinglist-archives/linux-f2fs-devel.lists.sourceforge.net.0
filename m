Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B8EF49D10AE
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 18 Nov 2024 13:39:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tD12Q-0007uM-S7;
	Mon, 18 Nov 2024 12:39:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3ejU7ZwkbABMBHI3t44xAt881w.z77z4xDBxAv76Cx6C.v75@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1tD12P-0007uG-HV for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 18 Nov 2024 12:39:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JoqvCgtdU4lMJOv2UffTj7/ARJEytxGntBglXk5Ifig=; b=S7xD6QimTUAVzMCoRJTxad9qDg
 T4AWm/E2oV+BQop9KDIXsgm9EUAibDiezLE2dOtjDAkURxh0MxHRNOO+QtSgaCRi2mM8xKDI3iRHA
 MoHVgwwURNVY9GmT+xg/jd5W45/1uIxirDU0H/RiQ6infYiLXi3xf5l6g0FtL2vvTUfI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=JoqvCgtdU4lMJOv2UffTj7/ARJEytxGntBglXk5Ifig=; b=c
 zMnP2mhtAXrwA5dFZL8OLi1JJXsUrzw1lth0lk/h+cAaUvSvd7kJKi6g5AQI331i0zIfIRbDFimQp
 IKP5H+ZJ5Ktjd0HBnQCzt1aGYAlYHCbjZhfECTo4KLxHVyuBut99i2JexhopkPIktBLDo5kBDbrpp
 Txk/Aj926x8Mx6+Y=;
Received: from mail-io1-f72.google.com ([209.85.166.72])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tD12O-000276-KE for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 18 Nov 2024 12:39:30 +0000
Received: by mail-io1-f72.google.com with SMTP id
 ca18e2360f4ac-83abf68e7ffso473600939f.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 18 Nov 2024 04:39:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731933563; x=1732538363;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JoqvCgtdU4lMJOv2UffTj7/ARJEytxGntBglXk5Ifig=;
 b=CyQX5qeTeCHL7NLjXyJsTAWAcoW8nzcRe13skmdG7HDnLqA+G0qoCjimfr1j+44WCN
 /+g2KmfzE1WxRyFoAiWjMjTlcPAVKESrGXkX8OwlyAhZ3TlC4UD1E4KudF2D00/d2R2d
 jwegX5UCH9fhSbyK9fKLLwKNEdf0t7PGqtBCdf0gntnbiAR0h8rUywGqZ+Aedx8IPtbm
 IRSWtB/djmupkic5BMqO9tjvE8gQ46G4W9q0DoD0mWAX0OwIYkIumJsG6+vsGWSpsCLA
 KwZk/IgB5QgjyE1yktXCp6zj6KgMsrAMkp9C9f/iVB6w85Gx9ccAJ1NLe/jFOjwL4YQ+
 sbjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhjpCLJEWJ8PHyfvkoafEkB8hNcPn4SgEVQ5Vh7h5InAq+WaetMEkg2lytwcW+qbkQOQvqqi3bZa/oF7IZB8/A@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yx9tUomj90pMGMXMjD7karVdBSvvuWD4TO3p2PGNOrgnRKwZG+J
 hGBy/Y96dij3d2wSbo12tTXVweOcDkP+TrgWTDl+nZg+mTsYogQDPk3z2Ck7eMwqVD6OmGfRG0J
 tYgCC5eLLBt/gMknj9PLcf8Zr0lBwUzcHq9A1O7sOIJK4VHFjK0YDOWM=
X-Google-Smtp-Source: AGHT+IF9mcBCCC9GPfOHSylucVBFguajg0Mg0J0fl5nAp/fpCTpCUXZ8MqkHvUNsT32nxmJyXSVkb35ODLRRyU28ZknoHd3/PNYu
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1522:b0:3a7:6721:7adb with SMTP id
 e9e14a558f8ab-3a767217ba0mr32243355ab.2.1731933562939; Mon, 18 Nov 2024
 04:39:22 -0800 (PST)
Date: Mon, 18 Nov 2024 04:39:22 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <673b357a.050a0220.87769.003c.GAE@google.com>
From: syzbot <syzbot+list9deb5e64e2106995cbb1@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello f2fs maintainers/developers, This is a 31-day syzbot
 report for the f2fs subsystem. All related reports/information can be found
 at: https://syzkaller.appspot.com/upstream/s/f2fs During the period, 1 new
 issues were detected and 0 were fixed. In total, 6 issues are still open
 and 47 have already been fixed. 
 Content analysis details:   (0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.72 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.72 listed in sa-trusted.bondedsender.org]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.72 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.72 listed in wl.mailspike.net]
X-Headers-End: 1tD12O-000276-KE
Subject: [f2fs-dev] [syzbot] Monthly f2fs report (Nov 2024)
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

During the period, 1 new issues were detected and 0 were fixed.
In total, 6 issues are still open and 47 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 1182    Yes   INFO: task hung in f2fs_balance_fs
                  https://syzkaller.appspot.com/bug?extid=8b85865808c8908a0d8c
<2> 72      No    INFO: task hung in vfs_rename
                  https://syzkaller.appspot.com/bug?extid=6165bc9800cd6e1fe958
<3> 4       No    WARNING: locking bug in f2fs_getxattr (2)
                  https://syzkaller.appspot.com/bug?extid=44090b62afaabafe828a

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
