Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DDB46B092
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  7 Dec 2021 03:26:27 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1muQBT-0001dR-Td; Tue, 07 Dec 2021 02:26:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@bugzilla.kernel.org>)
 id 1muQBR-0001dL-Vt
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 07 Dec 2021 02:26:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FOLo4Qsrb1ZcNTHdwj7kCWmRfBsovYwOjJnxsTFB450=; b=biiH6pgbSu7uPCfK4sXmJdrbn0
 gSQKIiMPb6C3LgB/4dkaslZXEnjkJgnJKAl/3HBGpf+RAAn6G6mFjryovJaYP5gYvSszGSNljvLUo
 t0xx5MBpae8HUKvIFkUgugYY7BTsQ3CzymeNWnEY2oeiwo9XnZlH8HanxQNGTlpReNHA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FOLo4Qsrb1ZcNTHdwj7kCWmRfBsovYwOjJnxsTFB450=; b=DBf2sK9j5cVaSv9pBhRNj6B9ZD
 wwaLZRpX9WZeHqRFxybMreIp2iBEHJpEuQwctNhYDrNviGoi0zWAmYAJX2yGCgUsWYuErq+Q/e6/L
 seSIPe7II//ZyPitqIeL/w1P+18BW1eOP6nhYlDsr0VA6Kthacfz+rp8iK3xSAoTIsbU=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1muQBR-00040p-5Y
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 07 Dec 2021 02:26:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4FABFB8166B
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  7 Dec 2021 02:26:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 09192C341C1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  7 Dec 2021 02:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638843972;
 bh=z0z+dKlDieggOxTseO0j5iXmTYPPREYRipyNJhMfVCY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=sImdAREy8KkIM3YkUP+9LcXiTUaLxnEJiHQ3GomaxsQIlZvH1x/2O6pAiJIKzxHSt
 PVKftbWkVFwt3/1ui6FMIPcJXNL1i2U7Wt46npmhK3GrTH/L0qXI9XuUc0Yw8h5v7u
 KZ/Aoygy1xNtN1tBUO2bsxa9ElBZPLrb3mtdaUqVAj1dyp28jnYAWXEWAmKx93pSy2
 4wfdCqebolGzKcHJmqHTPuA8OyDAepm9CCWHm/ZXrIgg5V8tkRJRDZN82UmsWqsVPf
 l/8wn5pFEWLn9D+hbiw3j+XWwwU+kAHmJvT2UX1mFwBdn6MCgQl/XCrnTTNcOWF3rO
 9iheQP6ZyaawQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id D4798610C9; Tue,  7 Dec 2021 02:26:11 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 07 Dec 2021 02:26:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: chao@kernel.org
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status cc
Message-ID: <bug-215231-202145-4yC4dldrY9@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215231-202145@https.bugzilla.kernel.org/>
References: <bug-215231-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  https://bugzilla.kernel.org/show_bug.cgi?id=215231 Chao Yu
 (chao@kernel.org) changed: What |Removed |Added Status|NEW |ASSIGNED CC|
 |chao@kernel.org 
 Content analysis details:   (-0.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1muQBR-00040p-5Y
Subject: [f2fs-dev] [Bug 215231] kernel NULL pointer dereference triggered
 in folio_mark_dirty() when mount and operate on a crafted f2fs image
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

https://bugzilla.kernel.org/show_bug.cgi?id=215231

Chao Yu (chao@kernel.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED
                 CC|                            |chao@kernel.org

--- Comment #1 from Chao Yu (chao@kernel.org) ---
Wenqing, thanks for catching this and the report.

I fixed this up with below patchset, could you please test with them?

https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git/commit/?h=dev&id=6889d573d5dd09ad2569218cfd222abf4a91d1c2

https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git/commit/?h=dev&id=09716c3ffd052b1a45500a3588099e3abfd4c18c

https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git/commit/?h=dev&id=8e81cd35d20e64426bc2e517983ab7021a0298f2

Thanks,

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
