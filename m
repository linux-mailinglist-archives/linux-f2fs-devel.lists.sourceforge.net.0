Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPvSKjJGAGqgFgEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 10 May 2026 10:47:46 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 508465032F3
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 10 May 2026 10:47:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vBhWAeqd3tenjFQretmfptKav+umVk6JewgDh4M7ge4=; b=en1y9AFGigSqON36JFR+vasVTz
	YKHu2sfw9ENAjYByLbh7wo9sYE1GPD2tCBjvSHvr5xrAmg1xRB2KYMlFxr7wAsbNZtZuhZEn4RGm2
	cAk7wTBU9Tw6E8p400jxTdnd6yy6R/NKyQph/xcGD4O0GOlDqXy5axQtRoP+OZa/YEas=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wLzoz-00056d-Ll;
	Sun, 10 May 2026 08:47:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1wLzoy-00056S-Nx
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 10 May 2026 08:47:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=43ABVU6RKDVcbCi9cv9os0oxGkhaeFpLnkEw/GixItg=; b=e3PWWbmy022naX+QJ6JBISDW7U
 Uu8kIOP0haWYfj4ZIxjrwl4dXN/D/hfRlTQ62K5DBR/KBxDTWjEexp0mAIHf7i5d5ld7rsDuQpG5y
 c63dO2twvyIM6dB4uSmIRcO2U0zBiH336NqS/hM74RxgbjFWL/qsEPhQ7ZEND1MJ4NUk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=43ABVU6RKDVcbCi9cv9os0oxGkhaeFpLnkEw/GixItg=; b=M9D/LKdme5OxcAgFtY0YYRbXrg
 oc7dOJznR+fxF6O46FF/D7VbH5GqwMdqzbG6jhTxFYoCdCIsLqCS+FaYsk6bmXiK00Xam45kEDApN
 kqFKpiqhsuXc5GXzNnLkNz4ylhPpN93rNwRNUFRYgBDpkndzpc1Tp32LQovih5zbD7GU=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wLzoy-0004Ge-QK for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 10 May 2026 08:47:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 707BE40C15
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 10 May 2026 08:47:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 520FFC2BCB8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 10 May 2026 08:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1778402847;
 bh=AFzgLVFkVr+pbZ16P+nwtOBIBH2AZtm6H1nQK6zqZv4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=qNYxj45nXb9Cc/o0WFxiHypObPCI24C7YetafcLS4SrR+8B4D18Zj1Dxnx+1e7MH8
 174TlI+yC9hzl1L6XnBcuZHlGL6OJMm6ZMmIi1CdZd3+PMOcz+0nhQ7i/9aj1SdQSQ
 +mMoZbSw7VnOJ7PTrvdZIr90RiuGeBODFAfcxAlKB8h8dPDXJ4LrsU8Rc2ksjdJRR/
 q+ebJ85XrkVrokwxrUxtu3+FkfaM8CqARjl2VxQVacOgJe5Ij8PXPZmF9+Fl+w3/dg
 /v2FuUpZxnRNrQzLJnZKxXXXrCYEbyhf9+9Z9eFi67zT5uEuuH4A5ciznHB1edIHl5
 bVXOq1IF/0mVA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 3EA5AC433E1; Sun, 10 May 2026 08:47:27 +0000 (UTC)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sun, 10 May 2026 08:47:27 +0000
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
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-203861-202145-CFUJ3Ank6N@https.bugzilla.kernel.org/>
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
 Content preview:  https://bugzilla.kernel.org/show_bug.cgi?id=203861 Attila
 (cs.attila@zerodaybugs.com) changed: What |Removed |Added CC|
 |cs.attila@zerodaybugs.com
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
X-Headers-End: 1wLzoy-0004Ge-QK
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
X-Rspamd-Queue-Id: 508465032F3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ARC_NA(0.00)[];
	DKIM_MIXED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
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

Attila (cs.attila@zerodaybugs.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |cs.attila@zerodaybugs.com

--- Comment #4 from Attila (cs.attila@zerodaybugs.com) ---
Current-master fsck.f2fs reproducer package for Bug 203861: ASAN/UBSAN log,
evidence card, concept fix, mount.c context, and minimized crash artifacts
showing SIGFPE in sanity_check_raw_super() with secs_per_zone=0 / derived
segs_per_zone=0.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
