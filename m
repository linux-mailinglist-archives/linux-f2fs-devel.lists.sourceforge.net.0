Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3DB652A9D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Dec 2022 01:47:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p7nGe-0004KR-72;
	Wed, 21 Dec 2022 00:47:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1p7nGa-0004KJ-TG
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Dec 2022 00:47:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=P+pd29CgCA1kFWlOL939l9wE5kAiR1T2HIRc0bieVVo=; b=F1aYon7/h9RZ7YJxWELSF/paKE
 nTUPI1CX1CsGz9EkJQKfY++Y5D7FxEsbr+laNxq6W32Bcy7wqNNGRoyHlLHfgt26zXmCu5oxpWGA6
 QZMyConQaZ4YRm8lLbPFpfL5zxvvngay6osOUhS4H1OF5t4bZcXGuBNTB3h8MFbp7kAg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=P+pd29CgCA1kFWlOL939l9wE5kAiR1T2HIRc0bieVVo=; b=lmfD+Jld1ayvl4FoeKahgCiFlE
 u1/HLgu+G8uQlp1e0h1TzVK0tHVwmC4EUhboSoucZA/AADyXKRVKYYGrqUQETIBITI8ebrvNt+CLh
 wbEvpQ3uRpHC55+Kpt6+Aa/7mbRqUMKwDGPRmYwHyickXGx0pLGALkk6sCmONKPwIgeI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p7nGa-0002Ue-9u for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Dec 2022 00:47:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DC95C61615
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 21 Dec 2022 00:47:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4ADD6C433D2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 21 Dec 2022 00:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671583642;
 bh=wUv/fW6Ch4N5yE6ymfPuXxvo4VpubJt0mKk8zmCanZc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=muBZfSudDXV4fDJ1TMMjxm3Vuu4+OtK5dlG6CZr1Wdrf12wKdQDgmkJ6BuAEZTwS0
 JvS16VD1HG0bRAis43mN1C6ael7f0OEj1A9sXpVPRKPUw6u+bO3q9YJQpaBKrefRHK
 WN1vNQzdtQ0Ift7xEdg/CaZN82wVgeTLZ1lViUo4L49JSOMqBmjwx+sVVPx2OfDO4d
 mee9UK+75z4YOh1HOuCY5Rd2eqjgpxYuZrvfQ6A1y/VsgwcfVnD7fks2AjzwdE2B2l
 FJombM2v92EZ1GLzaWtNa4XhW2xSVMj+hp13xWTpro4Wjn3mQsVEMOgwYJaZ2Jz+vK
 9r8IYJqb3RDpA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 2629EC43142; Wed, 21 Dec 2022 00:47:22 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 21 Dec 2022 00:47:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: yuriy.garin@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216050-202145-ysd2d5QYuA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216050-202145@https.bugzilla.kernel.org/>
References: <bug-216050-202145@https.bugzilla.kernel.org/>
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
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=216050 ---
 Comment
 #118 from Yuriy Garin (yuriy.garin@gmail.com) --- Created attachment 303439
 --> https://bugzilla.kernel.org/attachment.cgi?id=303439&action=edit debug
 patch - print page/folio/ref_count 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p7nGa-0002Ue-9u
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

--- Comment #118 from Yuriy Garin (yuriy.garin@gmail.com) ---
Created attachment 303439
  --> https://bugzilla.kernel.org/attachment.cgi?id=303439&action=edit
debug patch - print page/folio/ref_count

This debug patch prints page, folio and folio reference count.

As far as I understand logic behind 'f2fs_put_page(page, 1); goto repeat;' -
it's an attempt to "unlock" page, release it from page cache and reload again.

(I've found it not easy to distinguish between page and folio pointer - it's a
C union, sometimes used as page, sometimes used as folio - definitely requires
more kernel expertise. Please, tell me what should be done better.)

After two weeks of running this patch, I've caught this GC problem and have a
log. Attaching it in the next message.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
