Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 87FD59C2E4D
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  9 Nov 2024 16:40:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t9nZR-0005nd-VI;
	Sat, 09 Nov 2024 15:40:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1t9nZQ-0005nV-UT
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 09 Nov 2024 15:40:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2ZraKwelxXky2NkyWMtagXWnOaVv7x0Dht+CCfFgp8E=; b=AMLHiv1dRgdE/lZChzqr7Qj9nn
 iq6rUZEqZ/pBHGeIvZ2gA+M00yaTjShr/qMYPcbwQ3d8JG2+BGyeP9+aQYWWDelRD1wBQl8cC7D52
 gAUy08I6wpBsLPNREcf/I9k+adjJTknbZRZDrzwTI/xneDpcrjcx/azvdvlZsY5+U1Xc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2ZraKwelxXky2NkyWMtagXWnOaVv7x0Dht+CCfFgp8E=; b=ROzj6qUE7Lv3KAVv4b0jF8cE+P
 EUNnl7xraiNaMFwLiU1ewQK/+8lugwvGNPMkJVYD1f1O95qik6XUTQJOpkx+zo06RVCJltqHloIEK
 FZxZ8sA8O0M4BkVVdHgUutr/KqVAUIr6cFuygWq+fggI/yeSQo+UspFEOzETG914K1co=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t9nZP-0005X5-LC for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 09 Nov 2024 15:40:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id ADEDD5C0648
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat,  9 Nov 2024 15:39:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id ED455C4CED3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat,  9 Nov 2024 15:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731166810;
 bh=2ZraKwelxXky2NkyWMtagXWnOaVv7x0Dht+CCfFgp8E=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=h0BfTkh1pma6xN9OQ4m3FyTYHtMtrkCtXf0hDx1O5mGXUrpGToy+68V6/hT2HRSre
 cr9YyLWZAMgbKEMmSRuPbRM2Qb0ohp3Pw8pVlP4RYGNZT7rpOpaSh7kuOZqT7WtkxW
 AvZteTQwLPhCW5C16TuTPrcscF+6ouEWAN8MU5P1FYWE3rZ6HQesaydWRJC4HkR7oq
 DeUh9OyCjEdGZT8BzLEIJWE+6Yr+ahof9F/k4/AJbPhfsE4moIvOSuKPn2JzNe/Rms
 gjozUf94yNiLc5BFn5kw9T+EoNeWxoETgfqiprNYgPiIspwS5PmvxGl3+JalReoWAI
 JzFzaFVwle7ag==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id D74C6C53BC2; Sat,  9 Nov 2024 15:40:09 +0000 (UTC)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sat, 09 Nov 2024 15:40:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: piergiorgio.sartor@nexgo.de
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219484-202145-07bZPUGRX1@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219484-202145@https.bugzilla.kernel.org/>
References: <bug-219484-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -5.5 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=219484 ---
 Comment
 #2 from piergiorgio.sartor@nexgo.de --- Thanks for the prompt reply. Actually, 
 there is no "max_hw_discard_sectors", but only a "max_discard_segments",
 which is "1" (for all DM devices). It is also "1" for the underlying SSD
 (/dev/sda). The "discard_max_bytes", as well [...] 
 Content analysis details:   (-5.5 points, 6.0 required)
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
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t9nZP-0005X5-LC
Subject: [f2fs-dev] [Bug 219484] f2fs discard causes kernel NULL pointer
 dereferencing
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

https://bugzilla.kernel.org/show_bug.cgi?id=219484

--- Comment #2 from piergiorgio.sartor@nexgo.de ---
Thanks for the prompt reply.

Actually, there is no "max_hw_discard_sectors", but only a
"max_discard_segments", which is "1" (for all DM devices).
It is also "1" for the underlying SSD (/dev/sda).
The "discard_max_bytes", as well as the "discard_max_hw_bytes", is "2147450880"
everywhere.

Hope this helps,

bye,

pg

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
