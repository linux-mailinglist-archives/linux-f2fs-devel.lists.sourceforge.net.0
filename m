Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC9D7D7D23
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Oct 2023 08:59:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qvuLF-0003FO-Hb;
	Thu, 26 Oct 2023 06:59:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3Uw46ZQkbAIg4ABwmxxq3m11up.s00sxq64q3o0z5qz5.o0y@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1qvuLD-0003FI-OL for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 26 Oct 2023 06:59:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:To:From:
 Subject:Message-ID:In-Reply-To:Date:MIME-Version:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:References:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Mg4dqADrWVVQFvwUDMmazDT6n+A6BU7HqszKhe39EAk=; b=Yd4FZ954b7DomlcfPtU3l97goY
 MVQUn2il0HTb/+89o0WANMSA8yG268Kyf7kOUe5C/clSytgHwny6ji2G/14kOEbDGCwd+P+gpg+iO
 m0OPlSjF/3KszGG+nJILI+GphsPvBSYtd2JKGuH+TJas3jZktVI+Of0QWcODgXA7eNT0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:To:From:Subject:Message-ID:
 In-Reply-To:Date:MIME-Version:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Mg4dqADrWVVQFvwUDMmazDT6n+A6BU7HqszKhe39EAk=; b=T8XdOw3Cb3iF/mZrleP2pdQBk2
 994G5EEgcvVNqOUzDailXdfqWP+9a1+JDPMVOirctT2hcdf9Y0PHvh9AeTU61QL4uBoUN+93YPM49
 zpGSEu6egZP/Segy7IQ0Pxm/pe0MziGINKwmM4h1HFyywYE6tqisjQah9MkmKbxIBSDs=;
Received: from mail-oa1-f70.google.com ([209.85.160.70])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qvuLA-0005kR-TO for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 26 Oct 2023 06:59:38 +0000
Received: by mail-oa1-f70.google.com with SMTP id
 586e51a60fabf-1e9c2c00182so636157fac.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 25 Oct 2023 23:59:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698303571; x=1698908371;
 h=content-transfer-encoding:to:from:subject:message-id:in-reply-to
 :date:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mg4dqADrWVVQFvwUDMmazDT6n+A6BU7HqszKhe39EAk=;
 b=Ln7BT1TrkRkG+D6TgXi91M4xqF0QOAtXGMUjr4VhrSg5f9qU3Wy/qT7w8oBSDGJvdU
 iO353byJyLIM4p+wjwphaov/LsFKEO8N4hjMifksNs3q9Op12mH3z85fbN4SvKBTTEA+
 YDqRbFbMwtH3E4XSCIFTQa7JA59ehWc3+TtP3hRp6fXoSpORao6er+lqw/aY/+Vktcfw
 Uy5yA5Ew9nFxsEgPKVWJGK9mrMHYNUK+hRWWiod4SqhSrH7bwlh7QNkqbruz2qmKYLq9
 o3IKShMeCFwTJ/FzTQwSCN7OnDvGboTl6PuJpRbA6P7Bf047G5x0TaU+qCP3FY7JGysS
 fJWw==
X-Gm-Message-State: AOJu0YxHLhtJWSwQXlueDb4sKXDtpZXwwzO5YhqsYCv5A8IoJAXtYIjt
 ln7WFLl2MfKcHZCQzh/j4PcbDoiTh0jDKy0JOU5GiSqO0gsL
X-Google-Smtp-Source: AGHT+IHp42mn/AOQMp/Gy+pIgTER3CgUE07jlE0pfwGuoDZyiIaKHT4W8OY7jzoJ5tQHqlAfyspW2vZKdlZR85jhZJ/GMbMFDJg/
MIME-Version: 1.0
X-Received: by 2002:a05:6870:179c:b0:1e9:a917:d59b with SMTP id
 r28-20020a056870179c00b001e9a917d59bmr8164456oae.3.1698303571383; Wed, 25 Oct
 2023 23:59:31 -0700 (PDT)
Date: Wed, 25 Oct 2023 23:59:31 -0700
In-Reply-To: <0000000000000f188605ffdd9cf8@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000017dd680608991d75@google.com>
From: syzbot <syzbot+a4976ce949df66b1ddf1@syzkaller.appspotmail.com>
To: arthurgrillo@riseup.net, chao@kernel.org, hdanton@sina.com, 
 jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 lizhi.xu@windriver.com, mairacanal@riseup.net, mcanal@igalia.com, 
 penguin-kernel@i-love.sakura.ne.jp, syzkaller-bugs@googlegroups.com
X-Spam-Score: 3.1 (+++)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  syzbot suspects this issue was fixed by commit: commit a0e6a017ab56936c0405fe914a793b241ed25ee0
    Author: Maíra Canal <mcanal@igalia.com> Date: Tue May 23 12:32:08 2023 +0000
    drm/vkms: Fix race-condition between the hrtimer and the atomic commit 
 
 Content analysis details:   (3.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  2.5 SORTED_RECIPS          Recipient list is sorted by address
  0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
                             mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [209.85.160.70 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.160.70 listed in list.dnswl.org]
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1qvuLA-0005kR-TO
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] possible deadlock in
 f2fs_add_inline_entry
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

c3l6Ym90IHN1c3BlY3RzIHRoaXMgaXNzdWUgd2FzIGZpeGVkIGJ5IGNvbW1pdDoKCmNvbW1pdCBh
MGU2YTAxN2FiNTY5MzZjMDQwNWZlOTE0YTc5M2IyNDFlZDI1ZWUwCkF1dGhvcjogTWHDrXJhIENh
bmFsIDxtY2FuYWxAaWdhbGlhLmNvbT4KRGF0ZTogICBUdWUgTWF5IDIzIDEyOjMyOjA4IDIwMjMg
KzAwMDAKCiAgICBkcm0vdmttczogRml4IHJhY2UtY29uZGl0aW9uIGJldHdlZW4gdGhlIGhydGlt
ZXIgYW5kIHRoZSBhdG9taWMgY29tbWl0CgpiaXNlY3Rpb24gbG9nOiAgaHR0cHM6Ly9zeXprYWxs
ZXIuYXBwc3BvdC5jb20veC9iaXNlY3QudHh0P3g9MTY2YzA5MGQ2ODAwMDAKc3RhcnQgY29tbWl0
OiAgIDI4ZjIwYTE5Mjk0ZCBNZXJnZSB0YWcgJ3g4Ni11cmdlbnQtMjAyMy0wOC0yNicgb2YgZ2l0
Oi8vZ2kuLgpnaXQgdHJlZTogICAgICAgdXBzdHJlYW0Ka2VybmVsIGNvbmZpZzogIGh0dHBzOi8v
c3l6a2FsbGVyLmFwcHNwb3QuY29tL3gvLmNvbmZpZz94PTIxYTU3ODA5MmRkNjFkMDUKZGFzaGJv
YXJkIGxpbms6IGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL2J1Zz9leHRpZD1hNDk3NmNl
OTQ5ZGY2NmIxZGRmMQpzeXogcmVwcm86ICAgICAgaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5j
b20veC9yZXByby5zeXo/eD0xNWEwOTM0MDY4MDAwMApDIHJlcHJvZHVjZXI6ICAgaHR0cHM6Ly9z
eXprYWxsZXIuYXBwc3BvdC5jb20veC9yZXByby5jP3g9MTE4OTA5ZWJhODAwMDAKCklmIHRoZSBy
ZXN1bHQgbG9va3MgY29ycmVjdCwgcGxlYXNlIG1hcmsgdGhlIGlzc3VlIGFzIGZpeGVkIGJ5IHJl
cGx5aW5nIHdpdGg6Cgojc3l6IGZpeDogZHJtL3ZrbXM6IEZpeCByYWNlLWNvbmRpdGlvbiBiZXR3
ZWVuIHRoZSBocnRpbWVyIGFuZCB0aGUgYXRvbWljIGNvbW1pdAoKRm9yIGluZm9ybWF0aW9uIGFi
b3V0IGJpc2VjdGlvbiBwcm9jZXNzIHNlZTogaHR0cHM6Ly9nb28uZ2wvdHBzbUVKI2Jpc2VjdGlv
bgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9y
Z2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4
LWYyZnMtZGV2ZWwK
