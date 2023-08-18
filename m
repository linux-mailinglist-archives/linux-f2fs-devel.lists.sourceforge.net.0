Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBD77814E4
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 18 Aug 2023 23:49:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qX7Lg-00030B-KX;
	Fri, 18 Aug 2023 21:49:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3a-ffZAkbAOYaghSITTMZIXXQL.OWWOTMcaMZKWVbMVb.KWU@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1qX7Le-000305-F1 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 18 Aug 2023 21:49:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=htaUE46w/jpYC6GT7fp3ZjxKV5A/VMyj18jALNrVscc=; b=nVgOm0LjBqheZjLgcc8PRy2efj
 dIdPfO7kG/1ehrZuqZr/Y2w6M1ASu3I0SF6/nUWl5pe2g/uMibq0mCCtRPlbIFh6LWtFAU1EHpUph
 +yZMs4RwIoxfm+rbvpwO21uZXlftBd/z5YpHL5IEYcehvlsCceVAMERJho0PM1NmZ5Pk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=htaUE46w/jpYC6GT7fp3ZjxKV5A/VMyj18jALNrVscc=; b=k
 XHo/fuo1F9zSwCtG/6nICZpAuDOtlSYLIMYEdh/BESpyEi+zRwDuyeyA60Y+6KnLLdGVIL7oyEPhK
 5NZs6VvjQJkGe5HVL3++uT5k5WkbFCzrTMyef9t8GG5ppH3YqHMoTMlC3g9T4MWg8XufYtvrkvzOd
 ONJ5zp77a2m9Qu58=;
Received: from mail-pl1-f197.google.com ([209.85.214.197])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qX7Lc-0006bV-In for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 18 Aug 2023 21:49:37 +0000
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-1bdae10c645so19764145ad.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 18 Aug 2023 14:49:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692395371; x=1693000171;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=htaUE46w/jpYC6GT7fp3ZjxKV5A/VMyj18jALNrVscc=;
 b=c94j3Oyzo3zG+A/Ah3wE3N5op1NCu+vR8RPv93t3HKsD0dZ3N5uJ9e5APPmox9cRM9
 QRcM0lPMov842GXjhh0h1xQhisQQrjMIIvxCa4FuvWUyKrq18/jx8uEoQvFKSxumfKsP
 ZQg005pgWKxYBDfG6nTRY+jbmU/IAOHb/c3cXGzHkz1zJiq8KR3dGE8HHbzGV3wj98bA
 2Mdy/9riFDYOxHah8UoA9NkeZBW6ZlLSa872NinzKEw7owOOvM0UfNf9HcrphvWg+JiE
 KWxBSg996pGXEoegI0BCMxgGd13eji54lw39AlypuikX4woz1WqNzkH2JyUJKe8pTTF8
 J8ig==
X-Gm-Message-State: AOJu0YxYRw4oxMT0TkYs7bmkZElMcmYJLjxISa5FuxE2xTwXKIOwZ8RL
 rmTwjOdExzhu+kbJXO1p8+htZv0yUFxaZ3fKt+2Bl9OEwy0E
X-Google-Smtp-Source: AGHT+IEopbrZK9WaQ3DK9uOGyDRimniWVNSjuyIQEZW05tCpOq3HSBrweE8epEmU42rAUfq9ZdMzCGUXU4KTs7VqsrNiciOWveJa
MIME-Version: 1.0
X-Received: by 2002:a17:903:22cd:b0:1b8:9533:65b0 with SMTP id
 y13-20020a17090322cd00b001b8953365b0mr131968plg.5.1692395371136; Fri, 18 Aug
 2023 14:49:31 -0700 (PDT)
Date: Fri, 18 Aug 2023 14:49:30 -0700
In-Reply-To: <ZN/fVHbQA81Zk0Db@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000ea8eaa0603398076@google.com>
From: syzbot <syzbot+e5600587fa9cbf8e3826@syzkaller.appspotmail.com>
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
 Content preview:  Hello,
 syzbot has tested the proposed patch and the reproducer
 did not trigger any issue: Reported-and-tested-by:
 syzbot+e5600587fa9cbf8e3826@syzkaller.appspotmail.com
 Content analysis details:   (0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.197 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.197 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1qX7Lc-0006bV-In
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] possible deadlock in f2fs_getxattr
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

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+e5600587fa9cbf8e3826@syzkaller.appspotmail.com

Tested on:

commit:         47e4a92b f2fs: avoid false alarm of circular locking
git tree:       https://github.com/jaegeuk/f2fs.git g-dev-test
console output: https://syzkaller.appspot.com/x/log.txt?x=16b569efa80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6d0f369ef5fb88c9
dashboard link: https://syzkaller.appspot.com/bug?extid=e5600587fa9cbf8e3826
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
