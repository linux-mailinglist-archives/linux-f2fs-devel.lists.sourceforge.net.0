Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 54490AB622E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 May 2025 07:16:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t003HkeVuzA6aevl9hTu695ptkI+PA+WN8bg0qPYhw8=; b=JgC11LrDjDFsMmQ8ielPBfXyi7
	i/S2yuTFVOC6aiFjqsnxUc+01ec7ra+W3wFkUtewTnq0BqeqVVqnAIoGgBixCoSGcQxrm7B2wt78L
	+lr1X09Ocld/Xavv6QmDMGNQ3uKmrpLziTXeiJhCi0fQfiYpEc3XO++jvO64/rvgHEw0=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uF4Tg-0004CS-BM;
	Wed, 14 May 2025 05:16:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1uF4Tb-0004CI-El
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 May 2025 05:16:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pwHKojcbf8a57CVNqf7OB6oRsAYLrrVLmdCF6qhC+9U=; b=YzydS57eNvkWNHazm1BWOi6PTE
 0ZflhMmhhNsHkQAs6HO+wyKqou015pFzUEkMIhAUgMRRcuUt9Ez91QeRf8pOTd84wvEanGK81tEcd
 yrsbLMi++lifeL3/wuJqJ0buvjV2yGgTVQa5nUFmqqmhYTAzQ3O8KlqI5nqQ51AA+Qy8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pwHKojcbf8a57CVNqf7OB6oRsAYLrrVLmdCF6qhC+9U=; b=BF2Q9ne5ZcHgMUspp5h2j3PbV2
 yXTd+hQfGM+fVW37kNpePkMzyC3i9xFv1XXXw8q85p+PG741pOA3IWbr9wq7OZ2BxaWmuT2D9rDCX
 v8rtbNED5h8V+HtIxPWojvGgO5hVO/Fo3+mstHvxJVWrSO+OTHvdKBqNXIytTfIgE5M0=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uF4Ta-0003WP-Uj for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 May 2025 05:16:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 48A86A4DBE4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 14 May 2025 05:16:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E2BC6C4CEF0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 14 May 2025 05:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747199767;
 bh=UKMJRLvzpnJdsVmmYovRZAQros7zNwARq7t2CxDoyHg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=KdDOGVtftQarUOlJfjjdrCQPQ1RnhJOjHOJuZ515JpgdNgimZpm2+I+KAOv3fkVO/
 2nmCrIyOjqZsWwDaLBRLnT2eF4Xv2OwqTmGO5BHPjEUeRwoKt2tAKs+dfIWrKrZQ2W
 s9LvPXFW6dO7XKPoLfgxglOO4JOkNwgjfE8ZaSyI6kVZac9lLwnrBpcexkLuk16fPG
 lrJv0Fv2ZKiwtdtDlxgvMCb0Kd4WBZ+Lk5X+JebWcGmfkfB9Sp9+WuCrz1gH8pSaOV
 OkjoP7ZNA6rtiLi1wTRcySPrRB2dvUQzbUmr5zZmQ7SbEhnJoh+Qnocw9RdXx/OYJl
 Cf815xg2pSn1w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id D410BC41612; Wed, 14 May 2025 05:16:07 +0000 (UTC)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 14 May 2025 05:16:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: Other
X-Bugzilla-Component: Spam
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: w568w@outlook.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status component resolution product short_desc
Message-ID: <bug-220124-202145-OwclxYIyP1@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220124-202145@https.bugzilla.kernel.org/>
References: <bug-220124-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -3.9 (---)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=220124
 w568w@outlook.com
 changed: What |Removed |Added Status|NEW |RESOLVED Component|f2fs |Spam
 Resolution|---
 |INVALID Product|File System |Other Summary| [...] 
 Content analysis details:   (-3.9 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The query to
 Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The query to
 Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
X-Headers-End: 1uF4Ta-0003WP-Uj
Subject: [f2fs-dev] [Bug 220124] [deletion request]
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

https://bugzilla.kernel.org/show_bug.cgi?id=220124

w568w@outlook.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
          Component|f2fs                        |Spam
         Resolution|---                         |INVALID
            Product|File System                 |Other
            Summary|overlayfs                   |[deletion request]

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
