Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E77299F4C8A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Dec 2024 14:39:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tNXnB-0007VQ-SO;
	Tue, 17 Dec 2024 13:39:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1tNXnA-0007VK-7g
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Dec 2024 13:39:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VI8WdvrC4/XZGenxigoM6ZFa5BsjTpGU7SEUoe8xTis=; b=WQJ6MNn5Si0t4AZ+JcePZ/Ab1B
 xxhU7LZq+fhFBazbcscB57z+6jepUc0Syatj0rNwet4oRGKZy1Q9hFF53zHVLFdPeOCO7CjjNgweR
 e1WnjB2VyeUkkfCa7GRfFHC4xYhqH7yw+uxINDdYoDuOU5fNjvZr1bcg0z+0BXnBkcjo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VI8WdvrC4/XZGenxigoM6ZFa5BsjTpGU7SEUoe8xTis=; b=Ibai+mrsFtKKYQSOiv55pYMDT7
 KStDwtxk3Chg0BNviTZvowCcrV7VE+fPjdcXD5ibeltlcTIrp3ynlQuEqEHIV9b8I6jZuGIp2Q/eA
 NlLtMVRUCWYuvMVykwo+WJZcgSCdJWB0PY5h9IfMt3omjlCRmHg0JD8gggH0koA68q1c=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tNXn8-0002ko-C2 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Dec 2024 13:39:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D3C2F5C6527
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 17 Dec 2024 13:38:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A2F71C4CED4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 17 Dec 2024 13:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734442743;
 bh=1s+S6YO9G27yomER3zIxO0lLIuLwr8T+mJkpySD44uA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=BBBnoTwBK2F85dVI3gMBnSmtVbtnxV8YicyrxycLLWFDYhDhoS/ZNmI8wNTJy366p
 jUhffBkSz6rjuvVzkA+E9P0mt/Jo969LhwzG2I4gi8//cwchgg0eb9YyGQcnCnzDQr
 ZWi9XRdhUfH6na1KxPj+GuoijAeGGlFTQXSB2b1PHNZR1nizBj9rwChHmGk9XKMpIy
 EBr9/T/JjDmFq7H2OBxdYuSQUxz7LcH2NvQTMOk9C4EoQeja3ozccfuR4ZDXRcTvCM
 P5YrHRGtjvS8MuNqN5+j50+Ck6T05AXaYeNGJSfcB2FDSTnQeRDq6xsi2T0jdDngnL
 VLOAqG3W37Ruw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 8CB5AC3279E; Tue, 17 Dec 2024 13:39:03 +0000 (UTC)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 17 Dec 2024 13:39:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: chao@kernel.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-219484-202145-Ni1myrZ2Y3@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219484-202145@https.bugzilla.kernel.org/>
References: <bug-219484-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  https://bugzilla.kernel.org/show_bug.cgi?id=219484 Chao Yu
 (chao@kernel.org) changed: What |Removed |Added Status|ASSIGNED |RESOLVED
 Resolution|--- |CODE_FIX 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tNXn8-0002ko-C2
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

Chao Yu (chao@kernel.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|---                         |CODE_FIX

--- Comment #10 from Chao Yu (chao@kernel.org) ---
(In reply to piergiorgio.sartor from comment #9)
> Hi all,
> 
> I tested kernel-6.12.4-100.fc40.x86_64.rpm (Fedora 40, Koji build).
> This is supposed to include the patch and, for what I tested, it seems to
> work fine. No NULL pointer de-referencing, no crash, everything good as
> before.

Thank you very much for the test and feedback!

> 
> I think you can close the bug, in case something else will pop up in the
> future, I can re-open.

Fine, let us know if you have any other problem.

> 
> Thanks for the support!
> 
> Merry Christmas & Happy New Year!

Merry Christmas & Happy New Year too!

Thanks,

> 
> bye,
> 
> pg

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
