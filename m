Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OP9CK9b49mkyawIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 03 May 2026 09:27:18 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBFF4B4B07
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 03 May 2026 09:27:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:From:Message-ID:In-Reply-To:Date:MIME-Version:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=3zY29U8+YpaU1x+udlnLCv/gWw8woqqdlYZ973/Gtw4=; b=BDaAISWx8fvYOg714wgzfFICFH
	m+SlT/iwUgcRHLmENN+woSbM67FY7o1OQy4O/YQIy64xzbrQMJGK4gRToHZNgTfk9ZZsMHMFfvAsO
	NuUWJmQfMo0mTIWNCi5bn3FG4P7qGU1ch21gMiy6hYHgdBffdCkqefvrjQ9lqu82kEIg=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wJREJ-00074E-Vw;
	Sun, 03 May 2026 07:27:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3xfj2aQkbAOgcijUKVVObKZZSN.QYYQVOecObMYXdOXd.MYW@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1wJREI-000740-Gc for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 03 May 2026 07:27:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4+osliUaymIVFH6R5/bEjn0M5p7u7//4ClVsL93EMMI=; b=G4E5XkIUPlaCNYknmiNPIX/ovT
 Qf9h8eNKJAHrNiTG9YcJ9of1iZnDCHV9AgYukbbHhWL5z3FfrTn0GgTyXAA4ig9fcnBnqCqW+2nE+
 Nl9j0s7cpYIdRpg7teliwb8L+qPj885jXj/9Gw9gDrw0pxRHDhna4GK4ESo3cl62T5jM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=4+osliUaymIVFH6R5/bEjn0M5p7u7//4ClVsL93EMMI=; b=H
 pXa2Sr7KJpMJMi3PqX5tJpJDe9p1at2ErLpPboDZhjPdaOcj7zlRFUf7lduv3px64m+dTRT/h/EHI
 BuGq0TOSMk2CeA843UwiDFTULIEFn0AA0giYmSJdN9lD6z6CTwwLZKKDBMUGsARMuQMcTk4mLobIm
 ZssyCxokzxCzXol8=;
Received: from mail-oo1-f72.google.com ([209.85.161.72])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wJREI-0002jj-K4 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 03 May 2026 07:27:07 +0000
Received: by mail-oo1-f72.google.com with SMTP id
 006d021491bc7-69492bc3a38so4088830eaf.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 03 May 2026 00:27:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777793221; x=1778398021;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4+osliUaymIVFH6R5/bEjn0M5p7u7//4ClVsL93EMMI=;
 b=Vlfs4+EzebCwuTw9SyY5vxGM+uXzwB3HRoV+N06fUszCV/YkE5l5tZvV91kpF4TEmJ
 NdYP+NuqFac7klh2kex/NvB7kH49D4yc2/9fzVdb9llJmXh79I9LXyRK/+K1Ni3tyMEG
 sbWTb55jXVrNXcUeCJo9oiNruGhFc7M5G53mrxWBEpgcuGFUjbmTSsToOc6GLgSIomIm
 iO7KF1fBq1FTxkwI1a1MTVPnGFSvPmR2Q2Wtvy9LJiXwvuytLOOSJXwvLddnYnt/3Bi+
 deZKIEk0lRm2BYla6GA4RsF0+jQuGhaL9oIWum6bs3MSBOGomQ9RLGlo9Uw3XC33qCqk
 3n7w==
X-Forwarded-Encrypted: i=1;
 AFNElJ/5O/APEMEZsfd1nhRBVtX5Iwt4PcPULPib8KbIBHfnDp2zLmyQIwMLhVuil1kRDYot7Ye/rPSkJYiBKY6AKMx+@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzgNN6HAiYE/j7sH8ycLZlX02eNzL8Ykn1/2o7773xjiGaFUzzA
 vIiO2DoP4fXIJno5HcNPpzPg1txhr19HvzC9brkVkLzqLtxhb//pdSRmNf+cr3TRDlWRS2RHLW+
 ZZN4E9lIacZvdLSg0fflqpS3hnnNVYLRuP0y5TeBqZ9kEpO+diH/ol7Mt+qY=
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1626:b0:695:94b4:d4e2 with SMTP id
 006d021491bc7-696979a4e5amr2197059eaf.5.1777793221036; Sun, 03 May 2026
 00:27:01 -0700 (PDT)
Date: Sun, 03 May 2026 00:27:01 -0700
In-Reply-To: <e50ceb6c-4239-4009-9578-51ece89fdc77@dev.snart.me>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69f6f8c5.050a0220.1584b9.0044.GAE@google.com>
From: syzbot <syzbot+cae7809e9dc1459e4e63@syzkaller.appspotmail.com>
To: dxdt@dev.snart.me, linux-f2fs-devel@lists.sourceforge.net, 
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org, syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot has tested the proposed patch and the reproducer
 did not trigger any issue: Reported-by:
 syzbot+cae7809e9dc1459e4e63@syzkaller.appspotmail.com
 Tested-by: syzbot+cae7809e9dc1459e4e63@syzkaller.appspotmail.com 
 Content analysis details:   (0.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.161.72 listed in wl.mailspike.net]
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1wJREI-0002jj-K4
Subject: Re: [f2fs-dev] [syzbot] [mm?] [exfat?] [f2fs?] memory leak in
 __kfree_rcu_sheaf
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
X-Rspamd-Queue-Id: 4CBFF4B4B07
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.01 / 15.00];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=9645c21cfd1d3e8f];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[cae7809e9dc1459e4e63];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:dxdt@dev.snart.me,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fsdevel@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:syzkaller-bugs@googlegroups.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[syzbot@syzkaller.appspotmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-];
	RCPT_COUNT_FIVE(0.00)[6];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[syzkaller.appspot.com:url,appspotmail.com:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	SUBJECT_HAS_QUESTION(0.00)[]

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+cae7809e9dc1459e4e63@syzkaller.appspotmail.com
Tested-by: syzbot+cae7809e9dc1459e4e63@syzkaller.appspotmail.com

Tested on:

commit:         66edb901 Merge tag 'v7.1-p3' of git://git.kernel.org/p..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11fb7082580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9645c21cfd1d3e8f
dashboard link: https://syzkaller.appspot.com/bug?extid=cae7809e9dc1459e4e63
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=17f2f326580000

Note: testing is done by a robot and is best-effort only.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
