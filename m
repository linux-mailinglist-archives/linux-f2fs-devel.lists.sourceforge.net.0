Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A131369DE6E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Feb 2023 12:07:11 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pUQUH-0005oe-8m;
	Tue, 21 Feb 2023 11:07:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1pUQTy-0005oK-8N
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Feb 2023 11:06:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=p7eQYNkes3YeHiueMIEKdBKlkFX+xTRJIAwQTZ5AkRw=; b=gFrW/6cl5FFTQolAwiHHrvZ5g8
 JMn0pXmP3zljbunc8HLwqaClHBPtB+efSHkTl5HEQ10H7DTjL0lkJI42cKoFi+OmMFMhXi75P1pFO
 E410ZqgyeAzwMsMJjc1fNP6DmPPNaUiQcfTF2rvCj8jKvMucgxhXjkWP3VYhP9jwBE4g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=p7eQYNkes3YeHiueMIEKdBKlkFX+xTRJIAwQTZ5AkRw=; b=mgbD197O+jqnH3GXUoW6TlQBUt
 5f6uVwTITNQ0qxbuoSmZKbDmrNzo32/fLiS7wY9lEVoNm1o1hiiBpDcTxvupWZrNw9oqxnlqgFEhs
 gcVYqN7+gDmJHmAYlv4jxmSTaDJez356pRUJLZRKWObT9sLUrbnMlj7XzwDuFxhGIjBc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pUQTw-0001x6-T8 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Feb 2023 11:06:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4A91860FD3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 21 Feb 2023 11:06:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AE40EC433EF
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 21 Feb 2023 11:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676977603;
 bh=p7eQYNkes3YeHiueMIEKdBKlkFX+xTRJIAwQTZ5AkRw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=t/IFFju0vmUywWGft7dbrXENOqo7zEbgmKLDs7gueKGwY8A1vZgvB09fNFZc7lFok
 M8KPsM1+ZfErAhEJ+zZfOiMLj8f8TnjiZPY1nDfsFJSY/OzzepK8oY77fZpzFioXQk
 3EFD9StBrN9YlMhgbG2WI9hcnRuB9S8tbKfui1+nYlTwImypc9RpymNX9ArJwUdRFf
 n+zTrlTHFejYumk/4RPadL7XWpgDCE5l4tOuBB4fo1ZNlMY4Xo47q8hUp782PwqlAZ
 JvVl1LtBJTUOTzTWHyoRYzRdzlbDL+eHPuRYxqlalyfSu3etDhYS9W/kfOC5D09Zu2
 AMgyScxmaL1dA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 86651C43142; Tue, 21 Feb 2023 11:06:43 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 21 Feb 2023 11:06:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: guido.iodice@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216050-202145-n8xBsdYCs6@https.bugzilla.kernel.org/>
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
 #135 from Guido (guido.iodice@gmail.com) --- (In reply to bogdan.nicolae
 from comment #134) > Well lines got shifted a bit. It's now #1336 instead
 of #1325. 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pUQTw-0001x6-T8
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

--- Comment #135 from Guido (guido.iodice@gmail.com) ---
(In reply to bogdan.nicolae from comment #134)
> Well lines got shifted a bit. It's now #1336 instead of #1325.

Yes, in meantime I corrected the patch, I'm building the kernel now.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
