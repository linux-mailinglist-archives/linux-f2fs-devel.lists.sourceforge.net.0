Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0M6CC0W9rmn6IQIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 09 Mar 2026 13:29:57 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DF7238D70
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 09 Mar 2026 13:29:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:From:Message-ID:Date:MIME-Version:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vk+h0Du8TG3ukBs5MO5gydMzRilWuKI2iO9hfrHi1v8=; b=IPSAw5rO367u5bFmlA9Y6XCjuH
	lAucPSJS7gWSDeUGWPlk3FhA6PaSOQPDeKT9Dh/6JEVO5j0KI5hMVukTl7xg7O/dBs1Fy0R9yeeNt
	pE8dcTNEBTVf5LkMi55N0UdOJL99hYJc+BlsggJ7EeUUUQO+bvQyT9bx6FsPQbjtMzqE=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vzZk1-0000hF-Bz;
	Mon, 09 Mar 2026 12:29:45 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3LL2uaQkbALUntufVggZmVkkdY.bjjbgZpnZmXjioZio.Xjh@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1vzZjz-0000h7-Hz for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Mar 2026 12:29:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8MfU9gNDbW+d4iD6Cc2MJrg34U/SE4rbuFEBAplQCdw=; b=UFBY9pedK87x/k9D8P8mUT3gwH
 nxL3sMZIwZqcqTjlLTfH3MrvgE0BmpyTpMMVi7e/2p7XKf1tvlpwg4XdZSVAqWlte0pxpHLB30kDk
 DRb8hEZIb1sJYO/Iwlge2rQWFZGTRDmIgyXlS+SSrC8iQAm8ZCjNTZjbclYq0+AHZX18=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=8MfU9gNDbW+d4iD6Cc2MJrg34U/SE4rbuFEBAplQCdw=; b=Z
 AWYMXKu1KU5I1nqTGT3PrNMoBl/3H7neXjhz2J3ZGo28dncP1zMnKQS15FFgowEgwQv7eJeQH2LS/
 1No35waYb3mAqDzFnBtPsJiDAt/UXNsVaQbAYEAa7fa7BZNp5rQo9bSNL6HK7UsRUbVzKCW95tl/b
 2t8ND+aRPAdq9Tog=;
Received: from mail-oo1-f72.google.com ([209.85.161.72])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vzZjz-0005uD-3S for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Mar 2026 12:29:43 +0000
Received: by mail-oo1-f72.google.com with SMTP id
 006d021491bc7-67bb47e67f4so12426523eaf.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 09 Mar 2026 05:29:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773059372; x=1773664172;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8MfU9gNDbW+d4iD6Cc2MJrg34U/SE4rbuFEBAplQCdw=;
 b=bkmSb+aO+SY9f8jCOBT5bqKO3xoC5UKAlaB5ehANnsLkT8NvPzrp30cugVjUSjn1Fq
 uYx5plPmEhd5v5eIyzSNux2GepJNL+XkE7OhxiyjMZg6Gek04ZwPdBpoUn1g9lRju0ey
 G+UhUuFqjYVSKeKTOt/PkGaUdLo0Rba1IG95NxfwCzeYLiF8P8KRPnAn1fgmTkRacI/d
 Ak98aStq6jkSfVCbvEufKRI0KEXjhuZzj8GgCPx2Me0OMQQjOO/wYcECL5yDkvC4tKLj
 F5QW6cbYCjT0S2WmgzANd2Lx3MRjI/RwOuhzkJgpjeDaQqS7zt0japJuupe1XeFJcM75
 7IAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAQxiRIvsgl+iBHnH/Ev1jvctQ6z56tO6ZU/uXdwAnQOQALti1cYgL01WkCPS0KxYYPtJKbNdCG4noH+CN0A9k@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yyxh6JG8t9oScsrP7ua0o7QBmhhyBpqt5v0J8XKfi3RxvI47PQA
 vV5RSPm/RuEg3GxZ/HQCaSrY/+W6lhnheWwADzDm8hZwlRcZKrTx8EuvQwAsNVKR/x4VpWkoWMU
 OM+0bRYRUPdKqIJf+OqS99Gj174KYO6mpulKZ6XpCC99VAp/Poyi0eAPMWw0=
MIME-Version: 1.0
X-Received: by 2002:a05:6820:8107:b0:679:f14e:c4d3 with SMTP id
 006d021491bc7-67b9bc9fcc6mr6787839eaf.19.1773059372431; Mon, 09 Mar 2026
 05:29:32 -0700 (PDT)
Date: Mon, 09 Mar 2026 05:29:32 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69aebd2c.a00a0220.b130.000c.GAE@google.com>
From: syzbot <syzbot+lista82a31187b5c8accd304@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello f2fs maintainers/developers, This is a 31-day syzbot
 report for the f2fs subsystem. All related reports/information can be found
 at: https://syzkaller.appspot.com/upstream/s/f2fs During the period, 3 new
 issues were detected and 0 were fixed. In total, 12 issues are still open
 and 75 have already been fixed. 
 Content analysis details:   (0.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.161.72 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vzZjz-0005uD-3S
Subject: [f2fs-dev] [syzbot] Monthly f2fs report (Mar 2026)
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
X-Rspamd-Queue-Id: 73DF7238D70
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.01 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lista82a31187b5c8accd304];
	FORGED_SENDER(0.00)[syzbot@syzkaller.appspotmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-kernel@vger.kernel.org,m:syzkaller-bugs@googlegroups.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	REDIRECTOR_URL(0.00)[goo.gl];
	DBL_BLOCKED_OPENRESOLVER(0.00)[goo.gl:url,googlegroups.com:email,syzkaller.appspot.com:url,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Action: no action

Hello f2fs maintainers/developers,

This is a 31-day syzbot report for the f2fs subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/f2fs

During the period, 3 new issues were detected and 0 were fixed.
In total, 12 issues are still open and 75 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 1942    Yes   kernel BUG in f2fs_evict_inode (4)
                  https://syzkaller.appspot.com/bug?extid=5c81eb8c0a380fa578b5
<2> 1360    Yes   INFO: task hung in f2fs_balance_fs
                  https://syzkaller.appspot.com/bug?extid=8b85865808c8908a0d8c
<3> 237     Yes   INFO: task hung in f2fs_issue_checkpoint (2)
                  https://syzkaller.appspot.com/bug?extid=8a7eea50810efde15b0a
<4> 7       Yes   INFO: task hung in f2fs_fallocate (6)
                  https://syzkaller.appspot.com/bug?extid=73d18077a2323a1fdb5e
<5> 1       No    KMSAN: uninit-value in f2fs_sanity_check_node_footer
                  https://syzkaller.appspot.com/bug?extid=9aac813cdc456cdd49f8

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
