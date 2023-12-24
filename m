Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B101481DB72
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 24 Dec 2023 17:40:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rHRWT-0004WM-UF;
	Sun, 24 Dec 2023 16:40:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <35V6IZQkbAPYqwxiYjjcpYnngb.emmejcsqcpamlrclr.amk@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1rHRWQ-0004W3-Sk for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 24 Dec 2023 16:40:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BQ3dtE3cEj3t8PX7zTCW89boYQSV2gt5/WlGrjv/hRY=; b=JAwmT5uycS04FsD1O1XZqr1xIN
 Mfv9ShsVpT2sujxJcT6zB74GGL7NfyvS8ICm2H4DJeJ8ndM6ORX3wnNSTP57+/4Bhto0wBhaxR6hY
 Lm+G9s6GNsyjJyAAQHZWIn6sCKHxg4KiHkKvqD2RqJbnCj+574mtG4E0adlUUrqA3ohU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=BQ3dtE3cEj3t8PX7zTCW89boYQSV2gt5/WlGrjv/hRY=; b=d
 DeRDU95amFgmzzqMc8u3B/rEBe6Da8YVuNYantOV5z9f0CfrLY/EmHED6x3gxQ2TaXzFa2/ySctER
 mzKPi8gLaWaAD/ntI+4DiGgvRNF363Yh3X6F13t8Mo8R2u+BmzhaguCLn5j2M3wQaxeV9JY0QJR6W
 De1uV5Js3VTrFZ3U=;
Received: from mail-io1-f70.google.com ([209.85.166.70])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rHRWN-0007gR-KF for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 24 Dec 2023 16:40:15 +0000
Received: by mail-io1-f70.google.com with SMTP id
 ca18e2360f4ac-7b7fdde8b2dso458038239f.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 24 Dec 2023 08:40:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703436006; x=1704040806;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BQ3dtE3cEj3t8PX7zTCW89boYQSV2gt5/WlGrjv/hRY=;
 b=DhwtVwcNokV1KgLPlIA/0PbQqNyiCVR7bacpX4TEYAjLZdJVvzmUv0D2s6qIf5iNZK
 afCpPetqBry42fkuBckyC29OWnt5/M45SHywiu+qQOft97rXlTbvbd1M1u3NX2E2NiB5
 ClO66AvLyY93M+Iv2aaJEGqFLPxQRj7Ay4+36PH6wjAWbNafqC3+PQj7jOyjqPPdVG5a
 iv4MDHjoAThIdg52KUErVZ9a6sEll0OLG0/Ytj00nTkEJ0RqfdI47E2+z0SFWG6p2Y7m
 g4b9T4JxTWgUtYbi53J7ORhju1frOcBUMULFYu4odvBx0jGVT2z1QsARVvFZx2sI52rQ
 m8ag==
X-Gm-Message-State: AOJu0YzwjJJGTRl8RlzzP7CdeM0QR2+Ip0T+uSFbpgJrwM8MS3+luEU0
 FhLk66YsCTU1WEO/h4EXbx3oo0irvbExRHVM1pLsbptWlR4O
X-Google-Smtp-Source: AGHT+IGqnCO5KaDzC+K+VNi8UHEk7h8wMbFhPswwONHLgmnp+xNRwaClUzAiR+nZ1ZcaM+sXms963MDU7uiovAIF+D1+ROqCLdKG
MIME-Version: 1.0
X-Received: by 2002:a02:cb1b:0:b0:46c:fefd:bb37 with SMTP id
 j27-20020a02cb1b000000b0046cfefdbb37mr120454jap.4.1703436005920; Sun, 24 Dec
 2023 08:40:05 -0800 (PST)
Date: Sun, 24 Dec 2023 08:40:05 -0800
In-Reply-To: <0000000000001825ce06047bf2a6@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000007d6a9060d441adc@google.com>
From: syzbot <syzbot+062317ea1d0a6d5e29e7@syzkaller.appspotmail.com>
To: axboe@kernel.dk, brauner@kernel.org, chao@kernel.org, christian@brauner.io,
 daniel.vetter@ffwll.ch, hch@lst.de, hdanton@sina.com, jack@suse.cz, 
 jaegeuk@kernel.org, jinpu.wang@ionos.com, 
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mairacanal@riseup.net, mcanal@igalia.com, 
 reiserfs-devel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
 terrelln@fb.com, willy@infradead.org, yukuai3@huawei.com
X-Spam-Score: 3.0 (+++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: syzbot suspects this issue was fixed by commit: commit
 fd1464105cb37a3b50a72c1d2902e97a71950af8
 Author: Jan Kara <jack@suse.cz> Date: Wed Oct 18 15:29:24 2023 +0000 fs:
 Avoid grabbing sb->s_umount under bdev->bd_holder_lock 
 Content analysis details:   (3.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 2.5 SORTED_RECIPS          Recipient list is sorted by address
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.70 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.70 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rHRWN-0007gR-KF
Subject: Re: [f2fs-dev] [syzbot] [reiserfs?] possible deadlock in super_lock
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

syzbot suspects this issue was fixed by commit:

commit fd1464105cb37a3b50a72c1d2902e97a71950af8
Author: Jan Kara <jack@suse.cz>
Date:   Wed Oct 18 15:29:24 2023 +0000

    fs: Avoid grabbing sb->s_umount under bdev->bd_holder_lock

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=14639595e80000
start commit:   2cf0f7156238 Merge tag 'nfs-for-6.6-2' of git://git.linux-..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=710dc49bece494df
dashboard link: https://syzkaller.appspot.com/bug?extid=062317ea1d0a6d5e29e7
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=107e9518680000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs: Avoid grabbing sb->s_umount under bdev->bd_holder_lock

For information about bisection process see: https://goo.gl/tpsmEJ#bisection


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
