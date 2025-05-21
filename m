Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CDBABF7FA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 May 2025 16:39:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:From:Message-ID:In-Reply-To:Date:MIME-Version:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=LmBoaHjbm9FbZ19Mx29mpo7U30bNWSm2uNlGpp6c/xg=; b=R9pQYm9ZeKTmKTnKveKkr5vKy6
	41J4+vYwl3tTFnoPpmwACtstiW1sY6fL7R2s390nZjuIk4ZkSg8yum4VJRJ4nkRZAN0XCb3o6pFog
	AKxCEf1VnL82S/8YKflew4UXRix15U41GQbXXne21P0irSetUnKDaWDnm5sUbCxnXFGk=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uHkbM-0001AJ-4l;
	Wed, 21 May 2025 14:39:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3u94taAkbAHgouvgWhhanWlleZ.ckkchaqoanYkjpajp.Yki@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1uHkbL-0001AC-0k for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 May 2025 14:39:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tNTcSc3/ESLmDtghSx/A40u0Mkk8+k9LA53ImyKlq3o=; b=ayy2hpp0i2nq3cQ7e2Ib/T1rWu
 Ldttk1VfbOumRkuEtVrsZUlISBSUGj/zWdJYDPQvLTqjsMGg8Bvod9HPVf7vKxC1Uz9tm/Fco9LDh
 E4iQQGW+Nt1uH6IGvUdD3ijoTN+668hKqV8X4S8saSACdIiHpxQc3nrz8vwK0Fui5dRk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=tNTcSc3/ESLmDtghSx/A40u0Mkk8+k9LA53ImyKlq3o=; b=I
 PdT+5U7PEhSzB7sj667/iymqCgPbujBI473Hjo2LVamCYbx/ItHQgd9WjplAkgFdBxMImbOnNuney
 R8UZbl7GrLcBPYZOxqmkMh+JUIM9XLkGX31s0+kn9OCN1IezMLn5dJvdDSP25Vt1vcabQzr6xMe93
 fxUZVjY+sQO9G5xA=;
Received: from mail-oi1-f197.google.com ([209.85.167.197])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uHkbK-00068E-HJ for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 May 2025 14:39:22 +0000
Received: by mail-oi1-f197.google.com with SMTP id
 5614622812f47-400b3984779so6727340b6e.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 21 May 2025 07:39:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747838357; x=1748443157;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tNTcSc3/ESLmDtghSx/A40u0Mkk8+k9LA53ImyKlq3o=;
 b=UcHMzUc/o1M6hNEQX+hvBQTpzDay98bH7SKYdLiWZBi4KAuAMhoWl/EapGcxYg1CQ8
 +hL8dtXX7cXpbwJAKah7UehsxDtFd9mNMmuyKgfZeKPtfMz2516+X6Z/MZLnDyNYVKUv
 XDm9q9+lBpbp2THIEOFikRmuKoPdaUGpm98bmY38GnKdZ30O0eNN+ZBM5k4NzQhe1PZM
 V2AKy+RufPFWeNF3JH8grGxQyOTOlGQPvf6OtaU+Xj5OJKr/AoXKYRV9gjTK3t3klx14
 EcshojTbv1Bg2ZglNqKp2K3v/6Mnnu7l6XbbHvytXxK3VEd3h7nsgvRVmc8NHu3WCMrA
 j1EQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSHOKVMadhjV0wmetC0YT9gAivCYfblGsxnGKAE3V7l+JDC6Krsj0k+aQEepS4gc4EO/JHfhuNirMxUdk6GKNX@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwHEWBZOJd1fI0HxRibuVXXCa3JC8wifhcF+Wa2rbXt1Z1Ajyeh
 jQS27xd5gNdmaayHRub4DPHxrYjSDMfpYvp/Ih9hfjz5pb2g00PiID/S/Qa8BcCLUr2rtr2sMLn
 v9DE3/ZFiNXsl203H+lVO1hZ6hgtV0xHyI/l4IcV5kCaiFC6bnkvHAcpTrek=
X-Google-Smtp-Source: AGHT+IHRbAgB9dkBjeyutv7YiqRsp9/3LHctBOQVq/LaDiPqrqUyOfexNHXKHeWSn7X7pfdHCH+WMoy8O3PpCO+WUEErfdD5p9xa
MIME-Version: 1.0
X-Received: by 2002:a05:6602:4815:b0:864:ab75:758 with SMTP id
 ca18e2360f4ac-86a231974f4mr2974915539f.4.1747836603345; Wed, 21 May 2025
 07:10:03 -0700 (PDT)
Date: Wed, 21 May 2025 07:10:03 -0700
In-Reply-To: <71446a9d-fd2f-4a74-8486-775c56fe782b@kernel.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <682ddebb.a00a0220.29bc26.028f.GAE@google.com>
From: syzbot <syzbot+aa5bb5f6860e08a60450@syzkaller.appspotmail.com>
To: bp@alien8.de, chao@kernel.org, dave.hansen@linux.intel.com, hanqi@vivo.com,
 hpa@zytor.com, jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
 linux-kernel@vger.kernel.org, mingo@redhat.com, 
 syzkaller-bugs@googlegroups.com, tglx@linutronix.de, x86@kernel.org
X-Spam-Score: 2.8 (++)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot has tested the proposed patch but the reproducer
 is still triggering an issue: unregister_netdevice: waiting for DEV to become
 free unregister_netdevice: waiting for batadv0 to become free. Usage count
 = 3 Content analysis details:   (2.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 2.5 SORTED_RECIPS          Recipient list is sorted by address
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.197 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.197 listed in wl.mailspike.net]
X-Headers-End: 1uHkbK-00068E-HJ
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] INFO: task hung in freeze_super (6)
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

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
unregister_netdevice: waiting for DEV to become free

unregister_netdevice: waiting for batadv0 to become free. Usage count = 3


Tested on:

commit:         a8454e3b f2fs: fix to skip f2fs_balance_fs() if checkp..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/syzbot
console output: https://syzkaller.appspot.com/x/log.txt?x=140260e8580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=40634659c9fbec3
dashboard link: https://syzkaller.appspot.com/bug?extid=aa5bb5f6860e08a60450
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6

Note: no patches were applied.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
