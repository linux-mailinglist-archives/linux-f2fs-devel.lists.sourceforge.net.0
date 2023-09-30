Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 702B67B3E06
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 30 Sep 2023 06:40:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qmRls-0007Oy-9q;
	Sat, 30 Sep 2023 04:40:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3FosXZQkbALkrxyjZkkdqZoohc.fnnfkdtrdqbnmsdms.bnl@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1qmRlo-0007Oa-7N for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 30 Sep 2023 04:40:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Z4maoRvrljkflRYnHXhzRQpivRGA7ZdeJoiXO51Iskc=; b=bXXGjXtZDvgwD358/lkjXhB6r9
 9n9AnzG0XOYnAFfEPLfhsO3PSVcDdGa3pw78/Wc/g4M0YZDwPfBiUZJLlc02BeqiIzi0LEzc6hhWt
 XCC7nZUrV+8R6s4T/PX9PBlTCnaPYfStSyh1R2Q4WCm/GTvK4pJaQ61f1xONJzS5fYdI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Z4maoRvrljkflRYnHXhzRQpivRGA7ZdeJoiXO51Iskc=; b=X
 Uxl1f3XX4lGKN+0wkuZm6zxZJuE+By5U9FvyoCT2b1GR7IijxNSz7xWSMQxOT4Kml/DEjXi/VLTTC
 fvpPFvvb6mqDvXNM/z4EYPQtUI/SWLeRfj2CeEw1Gfm+ApSE1KdZ/rOfy13uFgK4dBt8lgl7GGha1
 +mfwpgwjaLJZYrLQ=;
Received: from mail-qk1-f197.google.com ([209.85.222.197])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qmRll-00COo1-00 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 30 Sep 2023 04:40:00 +0000
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-775751c3437so928411385a.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 29 Sep 2023 21:39:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696048791; x=1696653591;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z4maoRvrljkflRYnHXhzRQpivRGA7ZdeJoiXO51Iskc=;
 b=XkhqH1QXgETl6AwfA+9bP79mdiHFkMaT/J+btqq90HaLtagp4ZRFXffccOXfwVF4DL
 q+BwxcghdC7EsQWOeef56Bqwmy3jymrocGe7h0+rEud5X8do3ce8gduBbwEKEAQg6fnW
 SQppFiZbjlUZg2z+MJL73oUXliapsrwTpaJT7pODAdFOKcTbv4+p2tDg4xpRgdji5k1B
 /zNsqlos7GDGXFG2jDKBLJdeWg8dJa1edx2U7o8pE9Bb/ZIDiWcy7GKZozIUxawF4pP+
 Tp0jaWxeMwWmI7ctyT3XQq3GuWThVoy9dkVPknERsl7kDQwzfoHQB6pXldRnccPyTibw
 iekA==
X-Gm-Message-State: AOJu0Yy9SraD20w6brxOIYolIjUnzxauWBoRnXNP9x4eJYbK7wNUIbRq
 lfNkZfxd386SoixyfyKEJbUW1NqeaB3rbdXUg8DsCnf6mTZj
X-Google-Smtp-Source: AGHT+IF4LOEf8UnC0bUMlXsWXtdrWrJuwcTECRkOJxtPiY8VffpH6W8eLeF9FeZFZVR+o79oABrtMjg0oD2csieJZ5mk3ZsumjzV
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1909:b0:3ae:1ae1:df4b with SMTP id
 bf9-20020a056808190900b003ae1ae1df4bmr2980892oib.8.1696041750988; Fri, 29 Sep
 2023 19:42:30 -0700 (PDT)
Date: Fri, 29 Sep 2023 19:42:30 -0700
In-Reply-To: <000000000000cbb5f505faa4d920@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000178f6f06068a7e9a@google.com>
From: syzbot <syzbot+e5b81eaab292e00e7d98@syzkaller.appspotmail.com>
To: chao@kernel.org, hdanton@sina.com, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
X-Spam-Score: 2.3 (++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: syzbot suspects this issue was fixed by commit: commit
 5079e1c0c879311668b77075de3e701869804adf
 Author: Chao Yu <chao@kernel.org> Date: Fri Jun 2 08:36:05 2023 +0000 f2fs:
 avoid dead loop in f2fs_issue_checkpoint() 
 Content analysis details:   (2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.222.197 listed in list.dnswl.org]
 -0.8 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.197 listed in wl.mailspike.net]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 2.5 SORTED_RECIPS          Recipient list is sorted by address
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1qmRll-00COo1-00
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] possible deadlock in
 f2fs_release_file
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

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=15f18a92680000
start commit:   b6dad5178cea Merge tag 'nios2_fix_v6.4' of git://git.kerne..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=ac246111fb601aec
dashboard link: https://syzkaller.appspot.com/bug?extid=e5b81eaab292e00e7d98
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13c50e17280000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15a9558b280000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: f2fs: avoid dead loop in f2fs_issue_checkpoint()

For information about bisection process see: https://goo.gl/tpsmEJ#bisection


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
