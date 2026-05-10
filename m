Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6HOkJ4JGAGqgFgEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 10 May 2026 10:49:06 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E3063503321
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 10 May 2026 10:49:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PLMMqiZCWQPCX8psY1txuorZ05oIRRDCcGfkbTV+r2o=; b=UG6MYxz733DrgLq7u0VAcpEkab
	n6r+MCBqfptnPymacShPiKfhXDlKQ/xKL3UAzc9j9puVnF4LOMOySncmYcm39gIEIU//PzVEPopZA
	P50tZqgxfDEyEzpLjACUE+L0VUkiVynh9tVJ2RKsgnlo+FCOjiPFm+dRnN3FXSfhlwC0=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wLzqN-0000Qe-Jn;
	Sun, 10 May 2026 08:48:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1wLzqM-0000QV-GU
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 10 May 2026 08:48:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZrdEcm5d2z9HZxQ943xzZhudbU2KQO09tyLhMe2gH+Q=; b=NAlWLx12IpC/sE4iT2/u4VtC9O
 0bb4XL8BqlMOca8CTxoLW90tDiVUI6+JlmxotnID9G9AMdO8dPVk2ydkQvt3LQ9G+LI3U3SkZsnhp
 4rWOXt0+dX+SsGX30Q8HeB3eayt2h2ra504YtJdy8olt++9zHXmHbGXg6pgBCIAw/1Ng=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZrdEcm5d2z9HZxQ943xzZhudbU2KQO09tyLhMe2gH+Q=; b=MjWfjdjB3mvdeJi+Pm6U8nxIhW
 yobGi9h5VhLac/mXMEQ+itHQWpzN5KL2HUvcbsnNOYRnYeR/sdwKFXeXMDYvkpgCQNqALKAgweZF8
 CZkgMv3i89z66XMndt/t5YiFhiszG1naZVa9sk9KtiQn60anEpWXDFG2k+LmLwv9Bh3I=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wLzqL-0004QY-P2 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 10 May 2026 08:48:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 241C86132E
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 10 May 2026 08:48:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CD0F5C2BCB8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 10 May 2026 08:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1778402931;
 bh=bIZcbaWQ4HVioWh9NAQTCC0qgRhl4BggwIybhUVMsbI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ZSZI2cS1Bskt44ZHsSoRIT+zxx4Oz6KLitzgWtslWhQcedEiRQiLc0/vgzh3xsCdR
 gJGEFPZrmyFreey264RMRWqLW4M+T8JCMdPib20WkKpkjZ2/505Y6/wmsKt/fMafa8
 5hsWLaweKXruwNP+WjufIh0QZV3VojMRi6OapI667uCyCjUq+SNic8vx71hwg8pnG6
 WhfRVTzLW6+SqXHOiXIFKTRljOcd6WzDzRm7J10oEzsbIB/6ERGuDy69LV6GnpBRLd
 xbaFWLucTLAvtxO+h/wwfG3NpFWAHrwJXJWCxWHgm/DzVXmp2U/ES24WiEO8HwyPEa
 zEAwi2zjOZfQw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id C55EAC3279F; Sun, 10 May 2026 08:48:51 +0000 (UTC)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sun, 10 May 2026 08:48:51 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: cs.attila@zerodaybugs.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-203861-202145-p54U4eGanR@https.bugzilla.kernel.org/>
In-Reply-To: <bug-203861-202145@https.bugzilla.kernel.org/>
References: <bug-203861-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=203861 ---
 Comment
 #5 from Attila (cs.attila@zerodaybugs.com) --- Created attachment 310083
 --> https://bugzilla.kernel.org/attachment.cgi?id=310083&action=edit
 Current-master fsck.f2fs reproducer package fo [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1wLzqL-0004QY-P2
Subject: [f2fs-dev] [Bug 203861] Division by zero error in fsck.f2fs when
 fixing a corrupted image
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
X-Rspamd-Queue-Id: E3063503321
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	MIME_TRACE(0.00)[0:+];
	DKIM_MIXED(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_EQ_FROM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[bugzilla-daemon@kernel.org]
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=203861

--- Comment #5 from Attila (cs.attila@zerodaybugs.com) ---
Created attachment 310083
  --> https://bugzilla.kernel.org/attachment.cgi?id=310083&action=edit
Current-master fsck.f2fs reproducer package for Bug 203861: ASAN/UBSAN log,
evidence card, concept fix, mount.c context, and minimized crash artifacts
showing SIGFPE in sanity_check_raw_super() with s

I can reproduce a related fsck.f2fs divide-by-zero on current f2fs-tools
master, so this looks like either an incomplete fix for Bug 203861 or a
regression in a different validation path.

This is not the same top frame as the original 2019 report. The original report
shows the crash later through build_curseg() / GET_ZONE_FROM_SEGNO() when
sbi->secs_per_zone is 0. My current reproducer reaches an earlier path in
sanity_check_raw_super():

- component: f2fs-tools userspace fsck.f2fs
- function: sanity_check_raw_super()
- file/line: fsck/mount.c:1130:49 in my current-master build
- corrupted fields: segs_per_sec = 1, secs_per_zone = 0
- derived value: segs_per_zone = segs_per_sec * secs_per_zone = 0
- observed result: UBSan division-by-zero followed by ASan SIGFPE

Observed sanitizer evidence:

mount.c:1130:33: runtime error: division by zero
SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior mount.c:1130:33
AddressSanitizer:DEADLYSIGNAL
ERROR: AddressSanitizer: FPE
    #0 in sanity_check_raw_super fsck/mount.c:1130:49
    #1 in validate_super_block fsck/mount.c:1195:7
    #2 in f2fs_do_mount fsck/mount.c:4088:8
    #3 in main fsck/main.c:1326:8

The root cause appears to be that secs_per_zone == 0 is still rejected too late
on this path. segs_per_zone is derived from untrusted superblock fields and can
be used as a divisor before secs_per_zone / derived segs_per_zone are
validated.

I am attaching a current repro package with:
- ASAN/UBSAN log
- evidence card
- concept fix
- mount.c context
- minimized crash artifacts

Security impact claimed: local/tooling denial-of-service only. I am not
claiming RCE, privilege escalation, kernel compromise, or production Android
reachability.

If maintainers prefer a new bug instead of reopening/commenting on this
resolved one, I can file a new Bugzilla issue explicitly referencing Bug 203861
as the related/incomplete-fix ancestor.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
