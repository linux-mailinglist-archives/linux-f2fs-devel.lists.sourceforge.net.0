Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 07FD26DFF10
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Apr 2023 21:50:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pmgTd-0000CN-Gs;
	Wed, 12 Apr 2023 19:49:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1pmgTb-0000CH-PB
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Apr 2023 19:49:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Kg6n6cZVEEz0sW2nByq0R7IWqMfD9WH4VYXLoaftGvo=; b=RTM2PtCjuhK/oqsxSQj5hoqGmO
 hYXg3h9LoekF30Ic9/w2X9CoDWovKpO9P7OfBl93KsOSWXGL6NnzwcCk1FZnmQhg+EwYiNpYW6iNf
 FuWbe5hHHIVtXAM9l8FA2yca5kCvlDM5outHz/aw93PDHYnYtVI1wePgEyb1H0N37E5Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Kg6n6cZVEEz0sW2nByq0R7IWqMfD9WH4VYXLoaftGvo=; b=RyxK4Ng262JrBEV1/FKLy0bTYf
 23d1DjFQraDybGD945g9BOLUActfd4WKR7TrmSGnNnl97og5hdyVilUtuv0nrR8bOLuW42Jx01eqT
 6d/zASGxpUVBcvR1UHiMlEfnW7RquE9vB8GCjClZPkKimZTA2gC5TLtT9oCq4KE7o4Eg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pmgTX-0000e4-MK for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Apr 2023 19:49:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 38414611FD
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 12 Apr 2023 19:49:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9A8B5C4339B
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 12 Apr 2023 19:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681328985;
 bh=Kg6n6cZVEEz0sW2nByq0R7IWqMfD9WH4VYXLoaftGvo=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=TGenP+MVUSjzJ3R7/6Cw1tcBVY86HNRpTsUoZ4ZpFg3o4WsMxABdrsw2irjXqAZux
 z2FCD5OcUcAFRPhiuFKMsy0WnGi+q8GMJDSKygfntTH0C858R1HVgE24bmeyn35Vs6
 iTA/3zfHT0fKTHapEkK6ddsgdDNi6RdToc50nkpmROoVqrn0sSurwX/PVNJIA2Pzge
 ej7LTZGdNKzb5jgWjtRDKjIev9xuRwbVZ3K9l0G7W+hpQXVbJ3TVdkBkstHfGQZOk3
 p6hwQy4dTT1HYt0bLfq2eFyqEAH3b0Cy9TCHEq+HT/MyCT9YyT2+0VE6qbbBXbvBxm
 SoZ1Ike2kbJLg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 7DF0EC43141; Wed, 12 Apr 2023 19:49:45 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 12 Apr 2023 19:49:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: pikatenor@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216050-202145-t0umQPxZlh@https.bugzilla.kernel.org/>
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
 #156 from Ryotaro Ko (pikatenor@gmail.com) --- I fetched the archlinux kernel
 (https://github.com/archlinux/linux/tree/v6.2.10-arch1) and rebased
 f2fs-stable onto it, so if the pre-existin [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
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
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pmgTX-0000e4-MK
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

--- Comment #156 from Ryotaro Ko (pikatenor@gmail.com) ---
I fetched the archlinux kernel
(https://github.com/archlinux/linux/tree/v6.2.10-arch1) and rebased f2fs-stable
onto it, so if the pre-existing stable tree did not contain that (third) patch,
I applied only two patches.

(In reply to Jaegeuk Kim from comment #154)
> Could you please reapply and test three patches here again?

Are you referring to the patch in comment #131?

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
