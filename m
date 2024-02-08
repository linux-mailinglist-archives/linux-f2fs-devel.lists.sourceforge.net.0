Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8354184E9FC
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  8 Feb 2024 21:58:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rYBTh-0001Ov-Kr;
	Thu, 08 Feb 2024 20:58:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1rYBTf-0001Op-Lf
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Feb 2024 20:58:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=psTMGMFwnfkFo+J1KqQzqc5cbYF1wnrKacPHMljZAAk=; b=Q9Yg0rL9PayLh1MRwCONOKoEDL
 rbbf+Ll2v8azvZCQueZpId0JGa1UU5SKCVtkDOT63QCkMyS6GKS5KMAlmBiHqenr8rPidXD65BFzc
 lyaEeBoONxXq9lv9O9n3W1KxOQ8QJeF/sYszWpiJEG9kYq3rDpKOu3zi25NlSDy9QplE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=psTMGMFwnfkFo+J1KqQzqc5cbYF1wnrKacPHMljZAAk=; b=Rqbp1z/21WYl9BrPWTMP3Zv+OT
 fXgRl7E7bHzW2Lt4TcmtAnqJMpPLSva54NA8M+nkg2JaM2jVDmFeRbciI4o9f5fxN0MR4dILH2OIR
 d6n+YOUkoydialXr2pB16Z1j2GquZXLzCnqvpGYukNjFS/J4bbrBVVfz2z8QjalVo1P8=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rYBTe-0000a5-Mg for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Feb 2024 20:58:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 87424CE1D5C
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  8 Feb 2024 20:58:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C643AC43390
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  8 Feb 2024 20:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707425907;
 bh=psTMGMFwnfkFo+J1KqQzqc5cbYF1wnrKacPHMljZAAk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=IprFiezSuFVAhdrT7YrGQOeGDGpxNM4dTe8VBOqGoSy6tvBmlggPRwHcaahysV6LQ
 M/TbCkE8olklpaPJwQDyZvz2S4jusPulQsCAdXsMyRNg2rR9vYX8wf4qezZ5cVUJRA
 oLt47npi29uOhuE0ReGcS/dyHuQul5j4GNY56DkHl5ZUXpUlKoVg7j5JGaZsoN1R0D
 tCToiNs3jju8rFLY+HpR+J5TAFk9QTZrWhkBJIKbYkr61xxvrDmHjdegJzxJZ1nDob
 oqNuf8u6AAjqdzeaGtIcWhHjZfUgbo3Kix/ed22dsRlmSl5mlIOzxlY9s7JWr/F383
 3ZX1KWI3HypwQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id A3CE8C4332E; Thu,  8 Feb 2024 20:58:27 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 08 Feb 2024 20:58:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: carnil@debian.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218471-202145-2Q8zkv7NUu@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218471-202145@https.bugzilla.kernel.org/>
References: <bug-218471-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -2.7 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=218471 ---
 Comment
 #2 from Salvatore Bonaccorso (carnil@debian.org) --- regressions list report:
 https://lore.kernel.org/regressions/ZcU3VCrt9VOpuFUq@eldamar.lan/T/#u 
 Content analysis details:   (-2.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rYBTe-0000a5-Mg
Subject: [f2fs-dev] [Bug 218471] F2FS fails to mount rw at boot with
 "invalid zstd compress level: 6"
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

https://bugzilla.kernel.org/show_bug.cgi?id=218471

--- Comment #2 from Salvatore Bonaccorso (carnil@debian.org) ---
regressions list report:
https://lore.kernel.org/regressions/ZcU3VCrt9VOpuFUq@eldamar.lan/T/#u

Debian downstream bugreport: https://bugs.debian.org/1063422

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
