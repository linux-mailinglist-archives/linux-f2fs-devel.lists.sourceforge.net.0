Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBD3517B56
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 May 2022 02:56:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nlgqQ-0006JC-V3; Tue, 03 May 2022 00:56:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1nlgqQ-0006J6-0a
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 May 2022 00:56:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=I6jpbYfrdSHQj8Qt/UwldHEL9yqpzc+0MgRRx4he9h4=; b=RfQfYzdgiWndBzuttu+Zttb0nT
 8eVxH8Nz6ECDGfvutH+ZC90ch439Tn0XrREqwe05AarfkRl3gfEH014qYCk6DVA34zUyn5cA+2H/L
 flDGZqwbEdoxLVFmjZnSxOLhKDey9wCv3Eaq8a5ie6PkK1o0T3Fl+anSktUT9UfZg1Bw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=I6jpbYfrdSHQj8Qt/UwldHEL9yqpzc+0MgRRx4he9h4=; b=ZqCXqOJl/dd/55x9O4DBFe5BUK
 OV7jMJ7zLMc0svkSJCoBcvH990samdLEs/cLr9tRedkSZzD9VbWjL3bGX4VeDn1yaLMRQu3aZ7yOZ
 ug6iiHoWa6QTIkVajQKsSNf1JedNkVgB9qKDge2fhqIb60B45nCh41Qk0zq87so/+hJA=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nlgqP-00H6AZ-FI
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 May 2022 00:56:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1263BB81AEC
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  3 May 2022 00:56:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D1AF4C385AE
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  3 May 2022 00:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651539401;
 bh=UVKmL6KJGcupjiTwSwpmymkeVA8itWfM8Wf+dCZ6/NQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=dG39pEEJAFtqfU/5wNwGbZQQlLx2MggORIrBdmhvQCQi6dLcX4IM7oCJgD5+I49BW
 WYz5yxJqXNAurjaklpbnNszSewwn0gW1Iwte8OYWdyTiMmAJq/P9XQFaheTfQAZhNr
 t0HATOtel59Xob/COnjbDUlmhJMj5kV7iK2xx5AGbDNA5RiHd4pQDX1duL/r1dB7Eu
 Re9sew4ArrKEqyM49WPidLBJWA22wsmYmeH0jrs3Z0BPXtycEzBA7VCJpf/e5q5J/1
 sS1Y/LzS8VDt3PgAjVtnNU3ly4R0obPhdCucOvs2uMnXzs5L0FqwdpNNwK6XVjmcuu
 Bdgpus0/NgtZQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id BE0F6C05FD0; Tue,  3 May 2022 00:56:41 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 03 May 2022 00:56:41 +0000
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
Message-ID: <bug-215905-202145-MTAIq5tes2@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215905-202145@https.bugzilla.kernel.org/>
References: <bug-215905-202145@https.bugzilla.kernel.org/>
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
 Content preview:  https://bugzilla.kernel.org/show_bug.cgi?id=215905 Chao Yu
 (chao@kernel.org) changed: What |Removed |Added Status|ASSIGNED |RESOLVED
 Resolution|--- |CODE_FIX 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nlgqP-00H6AZ-FI
Subject: [f2fs-dev] [Bug 215905] BUG: KASAN: slab-out-of-bounds in
 f2fs_allocate_data_block+0x23d0/0x31f0
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

https://bugzilla.kernel.org/show_bug.cgi?id=215905

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
