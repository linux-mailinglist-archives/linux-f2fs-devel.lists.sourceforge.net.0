Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DEF9FB611
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Dec 2024 22:30:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tPq0I-0004lu-Lj;
	Mon, 23 Dec 2024 21:30:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3XdZpZwkbAPImsteUffYlUjjcX.aiiafYomYlWihnYhn.Wig@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1tPq0G-0004ln-Pu for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Dec 2024 21:30:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5WIT5ztIw01Gjgm6xXRruaARLPeEd1FWcxQgI3wtKpA=; b=KKP+sR0pCVSM5MFfV0eoh0+2Oz
 WDltEN+W+XANhKKSvmIHHTMXS2o/07Wfy2u9kJNvc6FmiDaBpjYFcty+9jkcZYDAekFBUgi8vHHCz
 ujyGsXKnt8e0Ez9nuFXr0krQzR3E4I6d4mZvo+TQBckSe8PWJj+sOc/6fFmGF363ZrqI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=5WIT5ztIw01Gjgm6xXRruaARLPeEd1FWcxQgI3wtKpA=; b=d
 7/5yXvl+lJ7N1Ndx4+yrC5l1Mz+Nzfoe0+GCqEofnwRekiQwcN92ZafECgBaul2NT/4MiBL8v+MEO
 cN6zVAorr1C/mWGJlBLiqtAKEBDPMVD544fP7vvH4U7hql+6zxIu65t0ubVoFLE4v8RVcr5MEI/s8
 olzU8FlvNNUXj4+c=;
Received: from mail-il1-f197.google.com ([209.85.166.197])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tPq0F-00009h-Ps for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Dec 2024 21:30:17 +0000
Received: by mail-il1-f197.google.com with SMTP id
 e9e14a558f8ab-3a9c9b37244so86194375ab.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 23 Dec 2024 13:30:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734989405; x=1735594205;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5WIT5ztIw01Gjgm6xXRruaARLPeEd1FWcxQgI3wtKpA=;
 b=oc6uTLWip327ns9eKC9lNCpWvfArHMm9RPVnsWqoewzGn57Pob8jAihhyUuCjtJhC2
 m2TDrQ5ExMllNXujvfoxPn+Livlsp6zsYL2S/U5yrFHXYzm91QCW0mutBweocLYoWcxf
 XXnwJfefUWGpbAdNvzEzingV/hW4dmIZyp2BQb+I5UdTAYrwnMz1Hff4Q7SF3HEH1vlv
 m4RkpcFKGEt1Plt3RfGmJdZVCQEPiVoQ7mqws/BAhPjbHGUG0zCMO6tf+juskP9Sgzrl
 uU5owo+yGoNkoWIXggk1ky4Yskc4cpK4SM70T0CYWQ8RsE0kBJlrYh0ZZBOyXdre37fO
 V1sw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9aNuh1/QiGG4eOqSs02R/tp7C1ozcSoMtW4fkG+jdR8sgui3XKEx9KV+kbfGH/r7GJ9IfadQBiPnKkU92TOr5@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yz20gTQRYtOGZLepcDjIISLon6H6RltoCQkVsiHOfUXNArGzvSO
 Zx3Td/dKezdW48yX+v8rvBSmmrDN/IGndocqYUKlNZ0tnnNwY06DEiHSdNZ684M+UjlY1GWiHWu
 TFojqjJ+61ryM/xNS9phVZtELSpzBlXyhWkkNyZXgCdlMAxfwfuNz6Hg=
X-Google-Smtp-Source: AGHT+IHNNiAbE8pXeZ/bZfYpmYCZLmHjRtJ62Bv5MvFh/cb9Ls8dVmNjqr3lS2Nje24yHN/kdT3aXEM5mzRQagZO4ZTpB6+yF1YZ
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:12cb:b0:3a7:4826:b057 with SMTP id
 e9e14a558f8ab-3c2d591996emr134211775ab.21.1734989405104; Mon, 23 Dec 2024
 13:30:05 -0800 (PST)
Date: Mon, 23 Dec 2024 13:30:05 -0800
In-Reply-To: <a441f694-b0f2-4a57-b4cc-b98cc995c323@kernel.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6769d65d.050a0220.226966.0043.GAE@google.com>
From: syzbot <syzbot+69f5379a1717a0b982a1@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot tried to test the proposed patch but the build/boot
 failed: fs/f2fs/segment.c:5541:6: error: call to undeclared function 'unlike'; 
 ISO C99 and later do not support implicit function declarations [-Werror,
 -Wimplicit-function-declaration]
 Content analysis details:   (0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.197 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.197 listed in sa-trusted.bondedsender.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.197 listed in wl.mailspike.net]
X-Headers-End: 1tPq0F-00009h-Ps
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] UBSAN: array-index-out-of-bounds in
 read_inline_xattr
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

syzbot tried to test the proposed patch but the build/boot failed:

fs/f2fs/segment.c:5541:6: error: call to undeclared function 'unlike'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]


Tested on:

commit:         7d46ca6d f2fs: fix to avoid return invalid mtime from ..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git wip
kernel config:  https://syzkaller.appspot.com/x/.config?x=1234f097ee657d8b
dashboard link: https://syzkaller.appspot.com/bug?extid=69f5379a1717a0b982a1
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Note: no patches were applied.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
