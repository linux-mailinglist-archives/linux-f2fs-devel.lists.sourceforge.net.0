Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C14F6F8C8C
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  6 May 2023 00:52:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pv4HX-0006t7-J2;
	Fri, 05 May 2023 22:52:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1pv4HV-0006t1-N9
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 05 May 2023 22:52:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=t4K7nk5TY2bB+bDtpOAs6rDpjELE0bntagcUWjtYW8w=; b=MvlGbstoWWWXkaPyspKMnCsR7Z
 UiiZTZsFsxkcYK6A9MJh+dFhJkndRXav+twrQnm3pM0EaCQRXBQ61h6kP1/xo8I4QrZNf/VAIBFME
 SIedPpHVjJwmVLC4QyEN+1OJHM1CedANIyd8QeInYjXAheNNNRiKd1llS6w/tVBrSuxI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=t4K7nk5TY2bB+bDtpOAs6rDpjELE0bntagcUWjtYW8w=; b=G5NSNVSyUudVMx2YcWl2Cw1qL6
 /Lb0ML+n2Pd3+Lqx1/TztD6M2TjHe6fyjt+Mr/xHD+pDqhnEQxHWg1NDRGcepVYEjCk6EXOj5Hmiq
 HDen+ClZYaLa+0V2b/WY/F+0s23PHWBph2CoAz4syOgdLs7JWL3XdF55rHEwMALNwHog=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pv4HU-00FmJv-Vz for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 05 May 2023 22:52:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9C2EE640AE
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  5 May 2023 22:51:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 98545C4339E
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  5 May 2023 22:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683327118;
 bh=t4K7nk5TY2bB+bDtpOAs6rDpjELE0bntagcUWjtYW8w=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=iPOSOZ53lr3fUfFlAWvhL9mlPHcomD4r9qmUIo7oMfGsyORq1D7HjNvbikLly9m1v
 kGxEdmhkqCqZ0P73HgREVMMLCUdInXJUFLnAD+MBOTvLHw0U4W1x8HGgE/0MsKgi5O
 U9CCxYL0nSD5eN+WanXqkWI8sOzsLPcubOvJYtGp0SbsNWrfVpUTe9EbJlQjubkNHp
 WFGaulY10YcdZK6rffhuF555tt+chuxKEpht0aUmqH6DnYcu/GXPmHEk+KdE2AJ87h
 il8hcdeori0TLgtwhcqQGxiQPfHKOsIB50iOklnmzSdBXkC/y6LKa3Pj+6HElzBUmC
 /FEz//2/wYTTw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 7F489C3278F; Fri,  5 May 2023 22:51:58 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 05 May 2023 22:51:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: jaegeuk@kernel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216050-202145-UQR8pExzEy@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216050-202145@https.bugzilla.kernel.org/>
References: <bug-216050-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=216050 ---
 Comment
 #167 from Jaegeuk Kim (jaegeuk@kernel.org) --- Matias, you saw the issue
 with the f2fs updates in 6.4-rc1, right? If so, we may need to consider [1]
 back.. Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pv4HU-00FmJv-Vz
Subject: [f2fs-dev] [Bug 216050] f2fs_gc occupies 100% cpu
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

https://bugzilla.kernel.org/show_bug.cgi?id=216050

--- Comment #167 from Jaegeuk Kim (jaegeuk@kernel.org) ---
Matias, you saw the issue with the f2fs updates in 6.4-rc1, right? If so, we
may need to consider [1] back..

[1]
https://github.com/jaegeuk/f2fs/commit/400dc2a4d7ec96a1fc4168652a0862e7edab3671

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
