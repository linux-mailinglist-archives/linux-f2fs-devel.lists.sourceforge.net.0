Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BE46108C8
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Oct 2022 05:34:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ooG8b-0000bX-4U;
	Fri, 28 Oct 2022 03:34:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3vU1bYwkbAOYaghSITTMZIXXQL.OWWOTMcaMZKWVbMVb.KWU@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1ooG8Z-0000bR-Jk for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Oct 2022 03:34:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=d9bEgoyCkEVc1rviJui83BJ63zZs6aH07Bg8EsC0G6Q=; b=VFZQ7ZAzvbNsQJgSwb6dmCyPOR
 3aytF9/vTk0yAWGJaUQXgnv5W16jQY7QoiVSheyNiqA3EZL8AdxkqloM24H4rrc41mqiJN0nlnB9s
 LizYUWAjSC4G2ECAzkjOGspym3VwL6qghrtFd5gKKOv29znqLTdWpmNKkc5UjWCYDLyM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=d9bEgoyCkEVc1rviJui83BJ63zZs6aH07Bg8EsC0G6Q=; b=R
 UOh1DWNXYK8D6O5QrG+zddUq6WSH6QYUb9qTYIPpjJ1sQ4sOWGTplcRmz1U9yaUjBIzoCavpck/Yr
 9KzRllBDoCFGFPZYx6zS5YrEcwUlQhrWfiYFKv4epSmhPeVWKLrZRoTjDVLgitpe0r7l/NV15IXNw
 aDf7G1ziMiBHfup8=;
Received: from mail-io1-f72.google.com ([209.85.166.72])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ooG8Y-00046w-Ub for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Oct 2022 03:34:27 +0000
Received: by mail-io1-f72.google.com with SMTP id
 a6-20020a056602208600b006bff2e56943so3288525ioa.11
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 27 Oct 2022 20:34:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=d9bEgoyCkEVc1rviJui83BJ63zZs6aH07Bg8EsC0G6Q=;
 b=hkE+T4OBy2S+n2UHlzGC1enBntIrYGANK7TyrSt7IVXfXkbH7AfFv/NjAxht2UbEMy
 fUSPpHM7ts/HthSqIyeotMDQG71gHktx+5k9UOAeQuRVK5FmrFAxaWWfMaeK7lxX1veA
 0QZfDjvImQUuUS+00dR4ApvXEidL4EZgh6uuIwBQQ5boKhCulyUbiw83xMyFcvS6leDI
 Bh5AUFXi2/zWbuswaSmXOMKinpBsICrqUaxOf29okH5txaim6Y+OioOI+1RLGP3V3998
 dQG15ZmcAU0Q+NOANd2+DBdfEOJpJ0VieoZU9Od65ny8POHi7TNOmqM1I4f/1YqIIGx9
 uEcA==
X-Gm-Message-State: ACrzQf3LV79JZhwfte733ODfbFTjTVG3/yFU+sx8Yi17x2FQexeII+zj
 zSdadOf2hl5JVF6NbFLPShVbIalCYoS8B4e0QYYm+icQp5IQ
X-Google-Smtp-Source: AMsMyM5D1/vrXmJp1T7B1mMtXHgOipwY7DPBpP1Uj5RWHyfccshSXYdP3JkEur3gchsb3YuZ8eqSfmteGNHGkWetUR0eZ6NgKSgP
MIME-Version: 1.0
X-Received: by 2002:a05:6638:d96:b0:363:9ed9:1112 with SMTP id
 l22-20020a0566380d9600b003639ed91112mr32264367jaj.171.1666928061421; Thu, 27
 Oct 2022 20:34:21 -0700 (PDT)
Date: Thu, 27 Oct 2022 20:34:21 -0700
In-Reply-To: <000000000000a7077705eae5f90c@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000f79f5905ec0fee38@google.com>
From: syzbot <syzbot+035a381ea1afb63f098d@syzkaller.appspotmail.com>
To: changfengnan@vivo.com, chao@kernel.org, frank.li@vivo.com, 
 jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
 wuhoipok@gmail.com
X-Spam-Score: 3.1 (+++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: syzbot has bisected this issue to: commit
 4d67490498acb4ffcef5ba7bc44990d46e66a44c
 Author: Fengnan Chang <changfengnan@vivo.com> Date: Thu Aug 19 08:02:37 2021
 +0000 f2fs: Don't create discard thread when device doesn't support realtime
 discard Content analysis details:   (3.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.72 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.72 listed in wl.mailspike.net]
 2.5 SORTED_RECIPS          Recipient list is sorted by address
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
X-Headers-End: 1ooG8Y-00046w-Ub
Subject: Re: [f2fs-dev] [syzbot] BUG: unable to handle kernel NULL pointer
 dereference in f2fs_stop_discard_thread
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

commit 4d67490498acb4ffcef5ba7bc44990d46e66a44c
Author: Fengnan Chang <changfengnan@vivo.com>
Date:   Thu Aug 19 08:02:37 2021 +0000

    f2fs: Don't create discard thread when device doesn't support realtime discard

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=17da7522880000
start commit:   247f34f7b803 Linux 6.1-rc2
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=143a7522880000
console output: https://syzkaller.appspot.com/x/log.txt?x=103a7522880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a66c6c673fb555e8
dashboard link: https://syzkaller.appspot.com/bug?extid=035a381ea1afb63f098d
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11d92d6a880000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12e5dbba880000

Reported-by: syzbot+035a381ea1afb63f098d@syzkaller.appspotmail.com
Fixes: 4d67490498ac ("f2fs: Don't create discard thread when device doesn't support realtime discard")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
