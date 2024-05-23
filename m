Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1CD8CD356
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 May 2024 15:14:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sA8H5-0007nS-Kc;
	Thu, 23 May 2024 13:14:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1sA8H4-0007nM-69
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 May 2024 13:14:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hTTNHV5Mx4Bo7Q6l1g1/650JzJyxNUnpLFVTTU1rxKs=; b=NFZ5/HNimh2xnipz6ayhbgyulz
 bDsQe2oVdZQ5uj3+mZwBTB8vp7wk+AECAp4wupnTx7DyAXTGmqZceqsmXFZeNbs88JqjKA2EEOrqX
 MzFGQ6AbJAfc70vr+ePciGj3csSfFV11PfTqiG8z7DwxPFnUdY4iDphA0IPu9YodugVE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hTTNHV5Mx4Bo7Q6l1g1/650JzJyxNUnpLFVTTU1rxKs=; b=JgQemFbbrtWzdTFE0sv3JEcJMi
 H9W8ogSLP56qqGHtuh0NXNe+Ua49gp1Pu9NY+Bb9gCV6n/qQUTbnN/GOyuj0xDjrM8mFb6YBWUH6e
 QwR2J61ZmxTQDLzfIlZYjlzUcgb6roMluRdTuAy54MrhD0bo1I6dsQf2REqCHRoOeSWI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sA8H3-00020U-9g for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 May 2024 13:14:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2ABBC62E14
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 23 May 2024 13:14:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D3D74C2BD10
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 23 May 2024 13:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716470053;
 bh=XFmY6+JfVo9pqPfwZ6oPK8oMfZxSC8V93j3CjKT+1SE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Doq7Wj9qMfJ46XDnn16gg1RK+e0IAfXpWECgUSv+GSw/YafN3nYgOarUiriZQqzht
 PjPl+LGSPXsjv97xmgJeKhLI+SsB9QZh8pYH+husGp43mtfajhq0NUvKmBZ8pCC7mu
 S+dIcRCTMTgjx+PMMVGXjIqGUdirYzixUEzX2vBgNTSdvqWPZBUR56F8+pKmgSQ3I3
 ETPChS0demDfXaMzGqlv1UVi7s/ij1R4Qa/hLIGXcNLzgWtGRRNI15lWIaUvsA+iM2
 IPtwPxB6+XuyT+a60QpF3SpcaQG4UO0zXT2wR4nHSPGeXIEUvSK+ox3UhY5Q2U1yeV
 oS6XivtIslw6Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id CC017C53B50; Thu, 23 May 2024 13:14:13 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 23 May 2024 13:14:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pmw.gover@yahoo.co.uk
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218870-202145-iK7TdpczEm@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218870-202145@https.bugzilla.kernel.org/>
References: <bug-218870-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=218870 ---
 Comment
 #3 from Paul Gover (pmw.gover@yahoo.co.uk) --- Created attachment 306325
 --> https://bugzilla.kernel.org/attachment.cgi?id=306325&action=edit syslog
 showing the problem 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [139.178.84.217 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sA8H3-00020U-9g
Subject: [f2fs-dev] [Bug 218870] F2FS mount/unmount results in
 invalid_blkaddr
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

https://bugzilla.kernel.org/show_bug.cgi?id=218870

--- Comment #3 from Paul Gover (pmw.gover@yahoo.co.uk) ---
Created attachment 306325
  --> https://bugzilla.kernel.org/attachment.cgi?id=306325&action=edit
syslog showing the problem

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
