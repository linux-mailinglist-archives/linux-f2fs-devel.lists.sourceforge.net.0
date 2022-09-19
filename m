Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 588E95BC4F6
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Sep 2022 11:05:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oaCir-0006wH-1b;
	Mon, 19 Sep 2022 09:05:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1oaChm-0006v1-Dd
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Sep 2022 09:04:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/h7odZb9dxgyM4W3k6FoaEQHK+OxgpHkDVczSMJYx/w=; b=l31c+D+TJpCfB2SBE/xORVF0+E
 AKy7pQP1XuvUqBu+vEayrHxNDrcPdXEm9aoypFUTL4B9gODS1ne02JoS9wkAAgM/ksYR3hAq+hVgx
 7RSeOtmwvgPV80msxU15eyB+qRxeLD9nK75DYKOGJD19ln0YvPbZLhovlmJmMFe0Ngac=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/h7odZb9dxgyM4W3k6FoaEQHK+OxgpHkDVczSMJYx/w=; b=gT/orhRRH+djR1gNHzFzbHmrnB
 metSrjjChVxv2y5qO/qBNrgSWAr4OHsBiW/caYk/mNY4D+JFEIX35y+CKt7qsV2XQUBT2ZNhktBoI
 Gb2V2E0kmw7jghO78BluqFNnwpSOejXDUP7o+bCj/etp5eygG1LG6oz0naQCcUXGZ1ss=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oaChj-00DAIW-Bo for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Sep 2022 09:04:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1ECDDB81624
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 19 Sep 2022 09:04:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CA399C433D7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 19 Sep 2022 09:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663578271;
 bh=s0KnnjNuRPavPdmG8RPKMUpYeEpwQFxaJ44chyWoP8k=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=A7ixsz4ocDNL+LECBNFlzI11riM/W3wLkBBxvjveDyl1cvS7O3y/+/CJF4rz8zluL
 uOX++GZZpEgQYkxF2rXTo8DlnFx1uw8bRdRxI1a1e+j2vk4aEgufaC7Y5D8KD8Gpa5
 vc4Of4BPzFwqe7mNeD3TWxzwTcOvGkiUisIrRBR+pClaHaDDtjXYZoI8JYzPP57z+4
 DmQ1SuiMwnoF070EK59FqAjTOp5qjpS2oHKGh0urVS+CexTdr731Vqrox8qG+dGBoh
 b3cUaDr9/A8e3x1GoUey8yWC8dJdPa9dX374Qw+AP7FN4Z37CxaHeIfh609Gm07mHf
 Mqc3r2qCRdIpg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id B9793C433E4; Mon, 19 Sep 2022 09:04:31 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 19 Sep 2022 09:04:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: chao@kernel.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-216285-202145-twzfJJa5xX@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216285-202145@https.bugzilla.kernel.org/>
References: <bug-216285-202145@https.bugzilla.kernel.org/>
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
 Content preview:  https://bugzilla.kernel.org/show_bug.cgi?id=216285 Chao Yu
 (chao@kernel.org) changed: What |Removed |Added Status|ASSIGNED |RESOLVED
 Resolution|--- |CODE_FIX 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oaChj-00DAIW-Bo
Subject: [f2fs-dev] [Bug 216285] KASAN: slab-out-of-bounds in mutex_lock and
 NULL pointer dereference at fs/f2fs/segment.c: f2fs_update_meta_page() when
 mount a crafted f2fs image
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

https://bugzilla.kernel.org/show_bug.cgi?id=216285

Chao Yu (chao@kernel.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|---                         |CODE_FIX

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
