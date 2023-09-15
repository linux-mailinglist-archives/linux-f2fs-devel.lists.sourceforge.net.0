Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B527A15C5
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 Sep 2023 07:55:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qh1nm-0001ej-JZ;
	Fri, 15 Sep 2023 05:55:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3Z_ADZQkbAIY289ukvvo1kzzsn.qyyqvo42o1myx3ox3.myw@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1qh1nk-0001ec-D6 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Sep 2023 05:55:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cXDLU6GhPRgxvgHhWczS2W48hUEzfbdQ+kiAI/fzXHg=; b=PJGAIEQU3Em6IJc+NXK7SO9zGx
 6NlbJAuwHU2m6xGjnCVnNAUjo3C3gajaBqWCP+qoDLTm4KuoQuj37gls/jy5aYxv8zVLhok2oWyzx
 7/fgBQdPEEjK4BfXxQbcxGGgJaorMexsB0f70jYwRqO7dWvtyc9O+ZoZaHg/Y0cr+GI8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=cXDLU6GhPRgxvgHhWczS2W48hUEzfbdQ+kiAI/fzXHg=; b=F
 CSHnvJJJgFjMMIhDK6N4RTyySM3SVV44J4ZMWgcK6cdJlt+A1hwEd3XFuFFj6m/61+pT6698DrC1L
 qmkKKiCN4/RDXrOMDPBj7OnCevODMd7lJFls+4fmlZQ0m3K75j+hn1Fx0Uqo7ZENFuWQYaQeu7NCm
 vd/tqPNO41uMxOFU=;
Received: from mail-yw1-f200.google.com ([209.85.128.200])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qh1ni-0003z3-2R for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Sep 2023 05:55:34 +0000
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-59bc02af5dcso24220087b3.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 14 Sep 2023 22:55:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694757327; x=1695362127;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cXDLU6GhPRgxvgHhWczS2W48hUEzfbdQ+kiAI/fzXHg=;
 b=q/2lhX8WiF+WA313QjH3KXwpLWuPdC8Ei8ATMFXABVhcGezQHX5gQDHaiR14vgdQtB
 Tyvio4mBX7ZSAbZY/wIGR9sK2WfJvc4DRY9AiXednS0t0JxkS5epvvVqVwQwrgQFw3qB
 OOhkyzXQfjciFXWv4G2AzHIbP96DTTsSA7LpVcbmS5J3RgnR1BB8oQfuod2NWFFBZRNT
 k9ZjOKlodJT50uyRqq5o/FvpIgKJveOS4fgSfQDvHSRF6dErM06bs4MVmaYM5nsRGDoW
 Kj/OcWeWvCNlesuDK+yVPB8Q3v8dlwD4qiG+OvGpwlFqD0OjzFKqdXfkrfX2Cj4Wpgg5
 7oaQ==
X-Gm-Message-State: AOJu0Yz4fip8pmZrE52s0/wvpoBd7JC1D1xYI/s36kvmsECWh41dYpxs
 57JcVVig5S355o/n2JrBVlmRWLAj+ZX63VLwyjV7Z6whC1qK
X-Google-Smtp-Source: AGHT+IEK2iRnTBP7FWvcpup3PZIp5C/uidyAVstqvSMHqPBS3p8eOnCe7wZYxiiKDvJ4/y6F7OlBJBSHymT20OCuq70KuwKnRc0U
MIME-Version: 1.0
X-Received: by 2002:a05:6808:2115:b0:3ab:81e4:4d78 with SMTP id
 r21-20020a056808211500b003ab81e44d78mr311949oiw.8.1694756967306; Thu, 14 Sep
 2023 22:49:27 -0700 (PDT)
Date: Thu, 14 Sep 2023 22:49:27 -0700
In-Reply-To: <0000000000000534da05faa4d3d4@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000045d4d06055f5bff@google.com>
From: syzbot <syzbot+eb6201248f684e99b9f8@syzkaller.appspotmail.com>
To: chao@kernel.org, hdanton@sina.com, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, nogikh@google.com, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: 3.1 (+++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: syzbot suspects this issue was fixed by commit: commit
 5079e1c0c879311668b77075de3e701869804adf
 Author: Chao Yu <chao@kernel.org> Date: Fri Jun 2 08:36:05 2023 +0000 f2fs:
 avoid dead loop in f2fs_issue_checkpoint() 
 Content analysis details:   (3.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.200 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 2.5 SORTED_RECIPS          Recipient list is sorted by address
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1qh1ni-0003z3-2R
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] WARNING: lock held when returning
 to user space in f2fs_write_single_data_page
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

commit 5079e1c0c879311668b77075de3e701869804adf
Author: Chao Yu <chao@kernel.org>
Date:   Fri Jun 2 08:36:05 2023 +0000

    f2fs: avoid dead loop in f2fs_issue_checkpoint()

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=15aae552680000
start commit:   c8c655c34e33 Merge tag 'for-linus' of git://git.kernel.org..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=5eadbf0d3c2ece89
dashboard link: https://syzkaller.appspot.com/bug?extid=eb6201248f684e99b9f8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13130a1c280000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13d919f8280000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: f2fs: avoid dead loop in f2fs_issue_checkpoint()

For information about bisection process see: https://goo.gl/tpsmEJ#bisection


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
