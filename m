Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E876476C248
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Aug 2023 03:34:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qR0kI-00049D-QX;
	Wed, 02 Aug 2023 01:33:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3OKbJZAkbANcLRSD3EE7K3IIB6.9HH9E7NL7K5HGM7GM.5HF@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1qR0kH-000497-PZ for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Aug 2023 01:33:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WABMdNDsk2eKFUUAkeI7Ocof8Yl4v6UX9gv6D1RsRaw=; b=Dv7NJDPhgrPX+wNQTU3cnWlClx
 8dI6y5wnVHkoUWz0Lck7I8pKqdIyrsHus4dICp1uViBhBAbyFebjwtOP/23xfVvuJ0RAKSIT948T7
 db3/4vkWE3PS1dcnnZzrFWubpvKbFzL5t1DjRDzbvGpJMEBbNmYLkj1h7lEunDw/Pgx8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=WABMdNDsk2eKFUUAkeI7Ocof8Yl4v6UX9gv6D1RsRaw=; b=O
 JNCOIvW3Pn09a70/mCR3/CDAkafyKkNecT18r79221uYxcz53oTU1gc7Bx9Zkx24kwpz81G+FPABA
 R40msOcjxAjT93HmRxgGhsFJ4JpLMMItP/vyVMlZBHbBY7EdI+uILALl51r3cXSyNaQ3437shyIs8
 F/8Aq/fnGKe1e+Ww=;
Received: from mail-yw1-f199.google.com ([209.85.128.199])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qR0kH-00054i-4X for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Aug 2023 01:33:49 +0000
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-583b256faf5so7504617b3.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 01 Aug 2023 18:33:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690940023; x=1691544823;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WABMdNDsk2eKFUUAkeI7Ocof8Yl4v6UX9gv6D1RsRaw=;
 b=LGst+1Uoxi5dHiDV295LY38DYNBC5T/XWex++9BaKIT0f2HGYdBUCpVKdY5fvChh4V
 gKurmSoE0MkNHzo57IwaxwPMUlLnN4dDLDhmVWfJJHL2YubLCifb2HlUSXEnBzLSNKiJ
 b/UzEigUdEUqd+l0uefvAVN6QQ9qyCEysvJeDwDherSOVdwre9EKw4AAQ/B2t5ouMNfe
 he0ry5pdy+ZBjgE0IdUMsy86L2pwgut01/v+qKPqIoCjId5llLEcTwKM0R2PzMfsmrN1
 KVywtOpLWNX+wsm7ex53YNTQIfp1L97Wg2QOS4sN9UCIbRZXwdOXU/igMztAYLt3Wi/v
 v2ow==
X-Gm-Message-State: ABy/qLaZvV/AD20KwoGmxAFP5tW+7VPKiq/9OComWRU7pJ5OJ+3JJ3oC
 09ZaZLqS9pvm0hcFWULiSZPsuwzYpa3gqUnezEW2UFFvNUEM
X-Google-Smtp-Source: APBJJlFQW+TRmXKLL5dj1QeoJGESZy5rKFukawpB/6nElzZkSNSLCrJdElPKM37Io0fUi+qlPCAjHnqQvn862R2jq/ZKOXXa4643
MIME-Version: 1.0
X-Received: by 2002:a4a:ddcb:0:b0:563:3a11:7c9a with SMTP id
 i11-20020a4addcb000000b005633a117c9amr16940166oov.1.1690936888877; Tue, 01
 Aug 2023 17:41:28 -0700 (PDT)
Date: Tue, 01 Aug 2023 17:41:28 -0700
In-Reply-To: <000000000000af3d3105ff38ee3c@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000099695a0601e5ecfb@google.com>
From: syzbot <syzbot+f4649be1be739e030111@syzkaller.appspotmail.com>
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
 Content preview: syzbot suspects this issue was fixed by commit: commit
 458c15dfbce62c35fefd9ca637b20a051309c9f1
 Author: Chao Yu <chao@kernel.org> Date: Tue May 23 03:58:22 2023 +0000 f2fs:
 don't reset unchangable mount option in f2fs_remount() 
 Content analysis details:   (0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.199 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1qR0kH-00054i-4X
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] general protection fault in
 f2fs_drop_extent_tree
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

commit 458c15dfbce62c35fefd9ca637b20a051309c9f1
Author: Chao Yu <chao@kernel.org>
Date:   Tue May 23 03:58:22 2023 +0000

    f2fs: don't reset unchangable mount option in f2fs_remount()

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=12461d31a80000
start commit:   a92b7d26c743 Merge tag 'drm-fixes-2023-06-23' of git://ano..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=2cbd298d0aff1140
dashboard link: https://syzkaller.appspot.com/bug?extid=f4649be1be739e030111
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1564afb0a80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=166928c7280000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: f2fs: don't reset unchangable mount option in f2fs_remount()

For information about bisection process see: https://goo.gl/tpsmEJ#bisection


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
