Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPOwK2MKAGqaCAEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 10 May 2026 06:32:35 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B7132502918
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 10 May 2026 06:32:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:From:Message-ID:Date:MIME-Version:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4ButP75AGfhSGbbnvNJaMwcjRrBN6soef0w7zwogNvg=; b=F68cz2jJDZxYOx21iFzbmDgS5j
	3LU/BcqS8cq8Q7DAOMo31hGoYxLnbo3TC+oY4uTSbvk/4+cHx72h2DNKWr4OlrQMVvlLvi+VkvtHu
	HCkUuiMihvGfvUsokiwGjQxG3MKNThin880qZx934owKOEmhgPKbmT4Yp7xSfPVooCXg=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wLvqA-0000ru-8J;
	Sun, 10 May 2026 04:32:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3UQoAagkbALwu01mcnngtcrrkf.iqqingwugteqpvgpv.eqo@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1wLvq8-0000rd-FA for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 10 May 2026 04:32:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LaRtowDwSKPVDBEhJMYs9n9Cs3P7tMNwUux1cyPkaXc=; b=i5VepHhfWveDwvgEBKzFldQA/Z
 dFUqeqZsEE/q0s95yopc/BuFYR6YdqUVCyMrQLGsF7s1adGp+iXHA4GIWWQeWhL8rMmWoDBqKTQ8r
 EsQWM7DXn/Rjw5ANDcDo+Fqv/YY957nc5cZIp4uIXqRbtN1e3Kfcta80/s+0bY+ye8P4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=LaRtowDwSKPVDBEhJMYs9n9Cs3P7tMNwUux1cyPkaXc=; b=R
 dGcFOKj8Q9BUKOlhjFXAnFANmu71Skc4tRKQa/OxyMTcPexWyRl5WZcA1Kb99mOkvRO+F9sD4NUQI
 mrP6S9c9KQW8481e19938TSiUvJFdUewLx/8MPXYpz0a451YeU8dUDvCWCRtWaDAooxyjL0FGzSbA
 uMgeBJB4tATziOIs=;
Received: from mail-oo1-f72.google.com ([209.85.161.72])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wLvq8-0002AW-GI for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 10 May 2026 04:32:29 +0000
Received: by mail-oo1-f72.google.com with SMTP id
 006d021491bc7-69b3a3c798dso499483eaf.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 09 May 2026 21:32:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778387538; x=1778992338;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LaRtowDwSKPVDBEhJMYs9n9Cs3P7tMNwUux1cyPkaXc=;
 b=fpopYfFSurxStViCJyu1WA06K8NYh/ScdUAwzBUyOR8JUJP/alDOBNAAcojNhcfyqy
 fRczO3u05Bxzvj1kpMzO7i1DO+sdfVhZ6zkslkPI6vlWmWTMOC3rthJW8E7rh2IhJJyI
 Kwoed3kWcX5w/1DuT4z9WybbrDwxpZBOnLXS3Eroj1Rg/+FpX8zUmzPHtdyxQs6VZHWF
 qHe4mWqjTW8NLlHWdxuNdfz7gUUVSZMxe09xZrZBb8f3/s3j4pIWtZjXYY1GkAyZgu52
 Gjb7hFL75fJgKfD/eLsc5PpEEh930YdIYxEfz5dSMDJWpQpUM0cGCJtnynYyjLcKo1b/
 ijUg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8eTzi6hv68ablsqb6D0cDeHE0KtQg+KxZWn11U6LWH3vyOw6lzPUzljn/c+sqfmjkVC2b5qOP03/Flciot5RId@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxmydW/Sa2C4SxVIHKPwU0p+lH401I6WXLunBACEOB8KoJ9SpOV
 TtIWQoZGIcirXKHv4ZDC4d/DsxTBlHMp5nWgvchlwklKbhmBg1t1SqYuQK1tOeAm2H0L3bndcYN
 e0Awan6AUaun9uEjnvKPocLDoxFu9S/saMW0dcMvhWJb2hzunwfDrDRmlk/M=
MIME-Version: 1.0
X-Received: by 2002:a05:6820:3008:b0:69b:3a3c:23d0 with SMTP id
 006d021491bc7-69b3a3c32cdmr1648976eaf.34.1778387537958; Sat, 09 May 2026
 21:32:17 -0700 (PDT)
Date: Sat, 09 May 2026 21:32:17 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a000a51.050a0220.1036b8.000c.GAE@google.com>
From: syzbot <syzbot+list002e6a12d7700b00b821@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello f2fs maintainers/developers, This is a 31-day syzbot
 report for the f2fs subsystem. All related reports/information can be found
 at: https://syzkaller.appspot.com/upstream/s/f2fs During the period, 2 new
 issues were detected and 0 were fixed. In total, 12 issues are still open
 and 80 have already been fixed. 
 Content analysis details:   (0.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.161.72 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1wLvq8-0002AW-GI
Subject: [f2fs-dev] [syzbot] Monthly f2fs report (May 2026)
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
X-Rspamd-Queue-Id: B7132502918
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
	TAGGED_FROM(0.00)[list002e6a12d7700b00b821];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim,googlegroups.com:email,goo.gl:url,syzkaller.appspot.com:url]
X-Rspamd-Action: no action

Hello f2fs maintainers/developers,

This is a 31-day syzbot report for the f2fs subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/f2fs

During the period, 2 new issues were detected and 0 were fixed.
In total, 12 issues are still open and 80 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 1       No    kernel BUG in f2fs_do_truncate_blocks (2)
                  https://syzkaller.appspot.com/bug?extid=2488d8d751b27f7ce268
<2> 2094    Yes   kernel BUG in f2fs_evict_inode (4)
                  https://syzkaller.appspot.com/bug?extid=5c81eb8c0a380fa578b5
<3> 1363    Yes   INFO: task hung in f2fs_balance_fs
                  https://syzkaller.appspot.com/bug?extid=8b85865808c8908a0d8c
<4> 258     Yes   INFO: task hung in f2fs_issue_checkpoint (2)
                  https://syzkaller.appspot.com/bug?extid=8a7eea50810efde15b0a

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
