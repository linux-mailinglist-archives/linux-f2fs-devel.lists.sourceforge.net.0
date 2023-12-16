Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 04109815C8F
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 17 Dec 2023 00:24:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rEe1M-0000cp-1I;
	Sat, 16 Dec 2023 23:24:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3aTB-ZQkbAPQouvgWhhanWlleZ.ckkchaqoanYkjpajp.Yki@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1rEe1K-0000ci-UF for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 16 Dec 2023 23:24:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c52hql8OhpFGWUCpBSY9HFLOe21/vbBOPBZxmXhJo0Q=; b=gAedgn5tKmOLvlZYRDyo7AXlHG
 zHzmorb+JwMg11jodhEkojHxIT3TBCGReDsqd2Btud4C8O3a+WX+S/nv4mzvIAkqKsVb8BNDUY6e0
 tZpBFWkOgEvHKb1tN569Zbc7BAuBmDBpQpX6vGQitgYbtDG2vkjmjYIf/bwdgRG1E1GA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=c52hql8OhpFGWUCpBSY9HFLOe21/vbBOPBZxmXhJo0Q=; b=d
 aLyLUBvvhO+eqqREpEbmDhUF6DhsIZp4iFT1TLK/GuCspFJXLJ9vcDEeenXBmXoj/mOuYZa5uw5aa
 Ahgg5Vk9DvbHRXZjH11CDutPlGR7wZorzMb0N5HK6V7HqUmWy+QD0uyHZDd5QbdOhjIs6gyOBZ7EJ
 UFpYISArpKT0zmA4=;
Received: from mail-oi1-f199.google.com ([209.85.167.199])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rEe1J-0006nr-6P for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 16 Dec 2023 23:24:33 +0000
Received: by mail-oi1-f199.google.com with SMTP id
 5614622812f47-3b9eddb1371so3018422b6e.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 16 Dec 2023 15:24:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702769067; x=1703373867;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=c52hql8OhpFGWUCpBSY9HFLOe21/vbBOPBZxmXhJo0Q=;
 b=wd/IWYDxuMIaRh1NT/vJEkjHrSCQNpX6b+LQIg0uXQ2Nr0P6AHnYEk12NTyFSzd67Z
 F2I0xh6CHZxCMnhkRhG9hTCfxe6UW6CiHkLoaTfGuQAEHTdFSK4AZMZHrn03A5vy12R5
 RGSfoFwlyclSdGlR1UDzcc9LTcAW3hGmsBZ8GQrhE0QKqg4MJFRjPSJiJ2siQc44UAU2
 fBi7z+9JMJz/2G6C1/HjnfrDupsexlJp5WcOMUku0hfA3kIsXEsdL0r6UHdveWNFXsnl
 6LVE148N2fSAZExqTeXovDlYj5SL+JFuois8KvLCQVJYM4WpbFYs+ZuMpCArIkud9lJq
 ekTQ==
X-Gm-Message-State: AOJu0YxewWx9zS7dRHReEjRAjDodl4zHVO5PNFNklaO3FUu03zkZZ7Ke
 oDEGG0oJOZfSp8/hRZOyEbLrp46we9Eq+N9IdspNYzHTLDKm
X-Google-Smtp-Source: AGHT+IHDVyY7Y+OhPQm2R8skr3NKrKEStHWWVq31UhLGAIELz046qwbxaseC4Yb7zNKtGrn8LA/5/EjYapDqtVDeSayU8Rg3TLKm
MIME-Version: 1.0
X-Received: by 2002:a5d:8544:0:b0:7b7:446a:e7bc with SMTP id
 b4-20020a5d8544000000b007b7446ae7bcmr317095ios.4.1702768745338; Sat, 16 Dec
 2023 15:19:05 -0800 (PST)
Date: Sat, 16 Dec 2023 15:19:05 -0800
In-Reply-To: <000000000000863a7305e722aeeb@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000003362ba060ca8beac@google.com>
From: syzbot <syzbot+8608bb4553edb8c78f41@syzkaller.appspotmail.com>
To: amir73il@gmail.com, chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phillip@squashfs.org.uk, 
 reiserfs-devel@vger.kernel.org, squashfs-devel@lists.sourceforge.net, 
 syzkaller-bugs@googlegroups.com, terrelln@fb.com, viro@zeniv.linux.org.uk
X-Spam-Score: 4.5 (++++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: syzbot has bisected this issue to: commit
 c63e56a4a6523fcb1358e1878607d77a40b534bb
 Author: Amir Goldstein <amir73il@gmail.com> Date: Wed Aug 16 09:42:18 2023
 +0000 ovl: do not open/llseek lower file with upper sb_writers held 
 Content analysis details:   (4.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.167.199 listed in list.dnswl.org]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 1.5 RCVD_IN_SORBS_WEB      RBL: SORBS: sender is an abusable web server
 [209.85.167.199 listed in dnsbl.sorbs.net]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.199 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SORTED_RECIPS          Recipient list is sorted by address
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rEe1J-0006nr-6P
Subject: Re: [f2fs-dev] [syzbot] [reiserfs?] [squashfs?] BUG: Dentry still
 in use in unmount
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

commit c63e56a4a6523fcb1358e1878607d77a40b534bb
Author: Amir Goldstein <amir73il@gmail.com>
Date:   Wed Aug 16 09:42:18 2023 +0000

    ovl: do not open/llseek lower file with upper sb_writers held

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=13723c01e80000
start commit:   3bd7d7488169 Merge tag 'io_uring-6.7-2023-12-15' of git://..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=10f23c01e80000
console output: https://syzkaller.appspot.com/x/log.txt?x=17723c01e80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=53ec3da1d259132f
dashboard link: https://syzkaller.appspot.com/bug?extid=8608bb4553edb8c78f41
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17b8b6e1e80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16ec773ae80000

Reported-by: syzbot+8608bb4553edb8c78f41@syzkaller.appspotmail.com
Fixes: c63e56a4a652 ("ovl: do not open/llseek lower file with upper sb_writers held")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
