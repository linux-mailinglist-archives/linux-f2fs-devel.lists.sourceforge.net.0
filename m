Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE0C9D4A42
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 21 Nov 2024 10:54:49 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tE3tb-0005QL-NZ;
	Thu, 21 Nov 2024 09:54:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1tE3ta-0005QE-GU
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 21 Nov 2024 09:54:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LNK7yy+C9P+ozjAbeQDW5yVw6U7uKhe2PTGVTodDqFQ=; b=Wj7yuO8vbZGzPe5tKxaWq51I7Q
 oyS1r4DWvY2tV4TisjnGtzwQF4uRzUVvMuXYTbARCFui/TtUznBH0qnCVStT+Yhszp1XV8iY/MNW+
 eDq/wFu7xi6bo9T6gqmP0EwyV3WCj+rwtY2je4iQKBhIsWjexTnt7IT755pb6H+dGUDk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LNK7yy+C9P+ozjAbeQDW5yVw6U7uKhe2PTGVTodDqFQ=; b=lSsEehdjLsyIo3VTALEXYa75GT
 FerbtImmKuAJC5HkKHk9WDlIaubtS7PEAgptEYw1AyBH7Jovu8IOvlXiVi/X++gKzW24VnNTVOhPD
 fEQwfddL8RZBUur9EhrYpMrv6mHOROT6lylcyHay2eLae9qonIm1WtUr5m6lTdrqWW1Y=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tE3ta-0001DC-KR for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 21 Nov 2024 09:54:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 94467A4019B
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 21 Nov 2024 09:52:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9D00EC4CECC
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 21 Nov 2024 09:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732182871;
 bh=LNK7yy+C9P+ozjAbeQDW5yVw6U7uKhe2PTGVTodDqFQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=EGnvIwNR31HQ+XnJIWqeZipSvMMNpFqo2zQPaPCaGbbfitKTGBNg4Q7v2aFHEBhFj
 ME2233+AgcubJUKPnAwQ1Ysm9as9g2pE9zIJE930jCpuqWK5OxfKtNIkFf/HJUo9TM
 6spzfU/7Exn34lzo43OQQA8JEi9wLyT/UGY6xbhUZmsc+2JZaz5B+3hBATKg7HCFir
 3GIfQN4a1woU7VihxMHJ5SosDArkSVpO2XaVYjrQkqSPchOW2IFcpO331HDxeRkjjA
 GAPqbZaXNRAg3EIHulUJZVigw2ehHUb6YasblxqUSPKmUMVQtnW3tqrCNp6Rl9GLH4
 1xcbqQDUaxyLA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 9385FC53BBF; Thu, 21 Nov 2024 09:54:31 +0000 (UTC)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 21 Nov 2024 09:54:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: chao@kernel.org
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219484-202145-UItptoV9mA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219484-202145@https.bugzilla.kernel.org/>
References: <bug-219484-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=219484 ---
 Comment
 #7 from Chao Yu (chao@kernel.org) --- (In reply to piergiorgio.sartor from
 comment #3) > One more thing,
 possibly important. > > When I create the snapshot, 
 with the working kernel, while [...] 
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tE3ta-0001DC-KR
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

--- Comment #7 from Chao Yu (chao@kernel.org) ---
(In reply to piergiorgio.sartor from comment #3)
> One more thing, possibly important.
> 
> When I create the snapshot, with the working kernel, while
> "max_discard_segments" is still "1", the other two, "discard_max_bytes" and
> "discard_max_hw_bytes" are both "0", instead of "2147450880".

Thanks for the hint, I think that would be a key to the truth.

Thanks,

> 
> Hope this helps,
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
