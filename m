Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A74D66B7B2
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 16 Jan 2023 08:00:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pHJTr-0005ej-OF;
	Mon, 16 Jan 2023 07:00:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1pHJTq-0005eV-Il
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 16 Jan 2023 07:00:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5M/iA3Mq70kTnqBKjm9FaNMTfnO1hgV3dnPgbH4nSzk=; b=GczsrrcHuf7lsKsY2640c6MxRi
 GDruc8kIiVtBaiYnSKiZ3W0nGIflN8tuFFhe1w9OE3/iiVo+FXHFbTljjOVjDUsHm//KzCjuwKCoa
 HVwAziBSzBkeY9K7BuokFEGAMW/L7KhMmLj8sJa7OFMM7tQ5aVQWLeWMn7W2Fk4F3cWw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Date:
 Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=5M/iA3Mq70kTnqBKjm9FaNMTfnO1hgV3dnPgbH4nSzk=; b=k
 dRx60mky/gbWGVDXBGkYV8pdOX5WBurzKYRQ5Oz4k9LCmibrXv7PJFPgN+r2M9lXxcfW30VUR8iOZ
 YI00BKBKrcaOqqcWgWgPzpq9XGfK9zu5ZahlaxO7ONjhQtxLGVuqxxfLH99ABWgK681yXtiesFzTl
 4D1BRrwnJmYOnVAg=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pHJTk-005S6p-5K for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 16 Jan 2023 07:00:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5B350B80D50
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 16 Jan 2023 07:00:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0694FC433D2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 16 Jan 2023 07:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673852416;
 bh=xHGlhUOFRIRSMLdJd0fRLLteeKD3sVIzBBaRKabgKiU=;
 h=From:To:Subject:Date:From;
 b=XkxzCZtGB5VwrlqmHgKC05z97DxTCk9pN8nxkjsljsLFIUQL4Wk7gVFNRbwPjW3ze
 9PeflCL5iKAFWCVGs0oy16+7/eoHFK99ZFVKKZ1uuGX3kw8TUH9VGohkWOiI78eU2S
 dBir93T0EsPe4vJ9JvPG+r+i98L1fyx+em5WOcPEkjIdAeumxD276DBHV7q8ukWdJF
 XtjXl2eA9xp9SKjAKOLKco/YwgT07+xKfKOwHuvi1IlNarX07VzqBd0AcNti3LhPKG
 UZAiXblNrHKBDN6vxvOJpmF7N8NsJj1cGXoY5MSnVN+d+YTDygA7f+/OH/1IY7husS
 qU2Mv9EuR8n8Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id DBA11C43141; Mon, 16 Jan 2023 07:00:15 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 16 Jan 2023 07:00:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pub@rickyrockrat.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-216938-202145@https.bugzilla.kernel.org/>
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
 Content preview:  https://bugzilla.kernel.org/show_bug.cgi?id=216938 Bug ID:
 216938 Summary: Huge stack dump on the first write to a newly created file
 system Product: File System Version: 2.5 Kernel Version: 6.2.0 Hardware:
 ARM OS: Linux Tree: Mainline Status: NEW Se [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pHJTk-005S6p-5K
Subject: [f2fs-dev] [Bug 216938] New: Huge stack dump on the first write to
 a newly created file system
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

https://bugzilla.kernel.org/show_bug.cgi?id=216938

            Bug ID: 216938
           Summary: Huge stack dump on the first write to a newly created
                    file system
           Product: File System
           Version: 2.5
    Kernel Version: 6.2.0
          Hardware: ARM
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: f2fs
          Assignee: filesystem_f2fs@kernel-bugs.kernel.org
          Reporter: pub@rickyrockrat.net
        Regression: No

Created attachment 303612
  --> https://bugzilla.kernel.org/attachment.cgi?id=303612&action=edit
Stack Dump

This file system was created using tools from an X86_64 (alpine Linux) system
running kernel 5.15.82-0-lts (alpine Linux build) and mkfs.f2fs 1.15.0. The
target system is a NanoPi NEO, and the root file system is f2fs, running 6.2.0
kernel built from source.

The first write using the NEO created the stack dump.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
