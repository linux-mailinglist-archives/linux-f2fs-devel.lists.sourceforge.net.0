Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gFadM4J3tWln0wAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 14 Mar 2026 15:58:10 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DF728D924
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 14 Mar 2026 15:58:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0wyGcM0rWR3e/M8CqJieN6YPzwjxPtTxdT+AghwBh5U=; b=IHhvuFYszmDnXTEfMBjnHo7EUi
	dPoZLz9V2davK8YAJjjru/O28MwQ4r9lbhLFJPk7Bl+Itmrjq2bSezC8f7bf6NLru1XK9/ZUkNoGr
	Nm21aP/SNlSSuWHTEDn/TnNrTvTdb4ZSDEMMeuwk1TbFfu+ozFg7ViIQvwsm755lT1No=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w1QR5-0003jt-9I;
	Sat, 14 Mar 2026 14:57:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1w1QR3-0003jm-VV
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 14 Mar 2026 14:57:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=h3X6wQYkOQicr1zPL50aSafEhVqpIWAd07pHg57YeVs=; b=gL0xufDkcn7s9exuMCJXTgR1UP
 smfuXKQJSJh1OrZVozoJCrVMxNbeTEF1M5nlrTX8jTZ3rzI3k+sdwuItG5GgsGFnkALRHJMp4TTb/
 FLYv/5jwGu5fs5+uzeoHeQRernez+b7bm/Pahp+VaCFbsHf6xlZegvOg4rFi3OO6Z/Rc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Date:
 Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=h3X6wQYkOQicr1zPL50aSafEhVqpIWAd07pHg57YeVs=; b=M
 HdHDtmIWLZFE9ueq33NyG3ipL/Kl50vzt3QUUKz1vLK096H5jCqpGoK6bpHIRoiNmNGril3REheJu
 XQdpXFlwYj5S0vpszJLsHg7OD2icSgwVuSlb+NCQThBOiTRHGmXTG8JIrdDUuuDG2nT7af9H+LfBZ
 GTAsHgNarjhfZkFE=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w1QR3-0007fa-El for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 14 Mar 2026 14:57:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A926660008
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 14 Mar 2026 14:57:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5DD02C116C6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 14 Mar 2026 14:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773500258;
 bh=+afKRGHP6qguPX9qIsLpAmSHhAaEpme/UpIo6l8H4Fk=;
 h=From:To:Subject:Date:From;
 b=nk5otByi1p3jnj8X6kE8OfgJM9NM2v7RSvcKQy78qTMeUqN1yo0n/6S2l0n/m+4fd
 FMatsC55Yrc9qwLqx0p2mt0PA7+uBu52Yo658c65Bu35TE+qqDgC3PRigBn95dYp4b
 WZKqRtNHtA+1lrz7Y+pVHAIu454e+DecpYLsUuZXjtbsoW8lBvml4uKfdRLY98pzI5
 L30lFfBxWpjkBW61cqMr75ZSllT0dxo8kcpzDyrPwyxFmPDVKfYo41Xo5VQtNJhGLZ
 tIMXIxylUR/Y+QIG0sQv8NRwGVSBE7OM42UzczeWdyGUd4xDG18fQ1HhvAgA6S2lsc
 QT/jeqPrZ/Srw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 4FB9DC41612; Sat, 14 Mar 2026 14:57:38 +0000 (UTC)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sat, 14 Mar 2026 14:57:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ekonom1@atlas.sk
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-221229-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  https://bugzilla.kernel.org/show_bug.cgi?id=221229 Bug ID:
 221229 Summary: F2FS partition enlargement with fscrypt not completed Product:
 File System Version: 2.5 Hardware: All OS: Linux Status: NEW Severity: normal
 Priority: P3 Component: f2fs Assig [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1w1QR3-0007fa-El
Subject: [f2fs-dev] [Bug 221229] New: F2FS partition enlargement with
 fscrypt not completed
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
From: bugzilla-daemon--- via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: bugzilla-daemon@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_MIXED(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_ONE(0.00)[1];
	TO_EQ_FROM(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[bugzilla-daemon@kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: 11DF728D924
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

https://bugzilla.kernel.org/show_bug.cgi?id=221229

            Bug ID: 221229
           Summary: F2FS partition enlargement with fscrypt not completed
           Product: File System
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: f2fs
          Assignee: filesystem_f2fs@kernel-bugs.kernel.org
          Reporter: ekonom1@atlas.sk
        Regression: No

Most important is this link
https://gitlab.gnome.org/GNOME/gparted/-/issues/311

Gparted developer says the bug is not in Gparted but in f2fs-tools

The source of the error was:

the file system was not unmounted
F2FS file system check tool not cleaning everything and requiring
additional mount and unmount

From your above supplied output fsck.f2fs reports the file system as
sudden-power-off == not cleanly unmounted. But fsck doesn't fix this
state.

lubuntu@lubuntu:~$ sudo fsck.f2fs -f /dev/sda6
...
Info: checkpoint state = 42 : crc orphan_inodes sudden-power-off



For every other file system a successful check fully cleans the file
system of all faults. But for F2FS it doesn't clear the "I need log
replaying". Only the Linux kernel f2fs code does that on mount.
This is not GParted's fault.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
