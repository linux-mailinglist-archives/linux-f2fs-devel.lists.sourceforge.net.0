Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5C582CFBF
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 14 Jan 2024 05:59:25 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rOsaW-0000Vg-AV;
	Sun, 14 Jan 2024 04:59:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3GGqjZQkbAK0flmXNYYReNccVQ.TbbTYRhfRePbagRag.PbZ@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1rOsaU-0000VP-Bw for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 14 Jan 2024 04:59:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1yzbyB1MM/qDWFyaL4yvVd/nqNiYOiwdyqZ6k+sJI6s=; b=IceaQbiNBPcLnRnLjCZ7YZjMTA
 4bWbVfTVfEOy8AuQR6R7nTRF6NT6C1g9LU5hxUvd/8lq+ml+01sxDzXpqmIFaJGHr4iitzPQPJe+u
 a7V5/j5eybq39/oDlsR6mS1E+T2rPpin9Kc9uhK4EIRuA5Esxpc7ubJzp/erOTEtZLGI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=1yzbyB1MM/qDWFyaL4yvVd/nqNiYOiwdyqZ6k+sJI6s=; b=T
 dXdNfTaC/dTRGHD/m74RJLbvRai5J7IDJ3AobxTASsIrTpex+orBnJi4Y0Iay+q4njCOb3ZBqa/eG
 4s1+Uvxqbd0CZNgKSH2Lf3PpSDHrYNT/Hgz6Q61dHvAFBfPZWDglplF6XImiMVmSsM3/VPGEMc0bA
 Wko2sueLRIVc5nII=;
Received: from mail-il1-f200.google.com ([209.85.166.200])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rOsaT-0007E2-8f for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 14 Jan 2024 04:59:10 +0000
Received: by mail-il1-f200.google.com with SMTP id
 e9e14a558f8ab-35fedd5e6beso69740465ab.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 13 Jan 2024 20:59:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705208344; x=1705813144;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1yzbyB1MM/qDWFyaL4yvVd/nqNiYOiwdyqZ6k+sJI6s=;
 b=wrDuztRZPn6+SKvWcBOPRVWA5ITd7rdROt+SMqDc54BZQ9w21quEPqww9zYPpqQ7OK
 s+ScNkH1Jvhr2R6Smy5F88u+4Ck/Xk/yBUN0F1BrMTB5iuN8M2xE8ClJ6z1OBdKOotdh
 ihnqOLkvrJqUU8DowHtuY11gWZSlDrsbQZ7KXwqFxdkBiC6DnjRG75mczjB77Xk+0k8A
 q9TN9T7g2bZU5QIMCzxi9SU1hwcM2n3zGsKykazU07KdrMQ9ZSitP11apDQWpH2cJU+C
 FFCb3cO/6EXwVom6EsDLMGzrWIEM9OVT9oLwo79VWexOaJFWCFYdz+g2ljZjmruow8XB
 DJzw==
X-Gm-Message-State: AOJu0YyWxFKkhHIk2TnfZUhhbvf/c1w7enMGSNjbQfSsjD5didFLDOG/
 La33Go5iWKu7Oe5TcaEyWCNpgaWj8OrBFaPyvlrES1ofzOte
X-Google-Smtp-Source: AGHT+IHBDuAaOxdVHgR+iN/a+oZFT7qSw7dVS5C0/k0TTWWkBfcAEdgjJpfCp3zy7m15WYrGZPJ+T7WIoz+4GDZDzmBqlgps0PP+
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:219d:b0:35f:f67a:e55a with SMTP id
 j29-20020a056e02219d00b0035ff67ae55amr296300ila.5.1705208344213; Sat, 13 Jan
 2024 20:59:04 -0800 (PST)
Date: Sat, 13 Jan 2024 20:59:04 -0800
In-Reply-To: <000000000000aac725060ed0b15c@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000009fff64060ee0c1b7@google.com>
From: syzbot <syzbot+a5e651ca75fa0260acd5@syzkaller.appspotmail.com>
To: chao@kernel.org, eadavis@qq.com, ebiggers@google.com, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
X-Spam-Score: 3.0 (+++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: syzbot has bisected this issue to: commit
 275dca4630c165edea9abe27113766bc1173f878
 Author: Eric Biggers <ebiggers@google.com> Date: Wed Dec 27 17:14:28 2023
 +0000 f2fs: move release of block devices to after kill_block_super() 
 Content analysis details:   (3.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 -0.0 SPF_PASS               SPF: sender matches SPF record
 2.5 SORTED_RECIPS          Recipient list is sorted by address
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.200 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.200 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rOsaT-0007E2-8f
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] KASAN: slab-use-after-free Read in
 destroy_device_list
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

syzbot has bisected this issue to:

commit 275dca4630c165edea9abe27113766bc1173f878
Author: Eric Biggers <ebiggers@google.com>
Date:   Wed Dec 27 17:14:28 2023 +0000

    f2fs: move release of block devices to after kill_block_super()

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=10639913e80000
start commit:   052d534373b7 Merge tag 'exfat-for-6.8-rc1' of git://git.ke..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=12639913e80000
console output: https://syzkaller.appspot.com/x/log.txt?x=14639913e80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=878a2a4af11180a7
dashboard link: https://syzkaller.appspot.com/bug?extid=a5e651ca75fa0260acd5
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=167b0f47e80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11255313e80000

Reported-by: syzbot+a5e651ca75fa0260acd5@syzkaller.appspotmail.com
Fixes: 275dca4630c1 ("f2fs: move release of block devices to after kill_block_super()")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
