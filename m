Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E57ABD1FEDF
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Jan 2026 16:49:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jqOAOPL5AiVUrLEhPRv4WEu9ZduXwjyOivd5IJZ+7b0=; b=bkxuRTKa3tMyTRdegLNx4PWpFi
	TmDenz9rIGEAy6IwVdfX8oTQus8/dokL1NujH3zpJx9NTJOFdbmpXwLEzOypN+HCaSJWwJEfjusr6
	BjmEN4/e0/cPalduSw6y0MnF/JVWekzgCdCf4B07l+lGsB8C59jf85pBXPiDn5HgeNK8=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vg37N-000492-FO;
	Wed, 14 Jan 2026 15:49:09 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1vg37M-00048t-Cu
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Jan 2026 15:49:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jmYJEArZbk3rYWA6U5r8lF3FjjgErpj5QN7oIrIm6XE=; b=RJQs3q/VrTIBF/JfTWPxMwgmC9
 K5l6ZbFp+Eq2LW26aShNaGVRi7LkxrzvuZlK42ZP5D0W7kly678XTvO4H18zPMYrmxzfb2h5PWxEj
 Wiff9In8dXrvWjvLCb+07d+EnNp+zqlklHA6ENcljx5xp0onHA+rzPiRrSX5oxM7thwo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jmYJEArZbk3rYWA6U5r8lF3FjjgErpj5QN7oIrIm6XE=; b=DYWnXspLoAuDIqJA6C6dgqUvT1
 mITvmgJEuulSfFumywQCdS0KEQAidJv9EGl8NOG7Kc2rX7K7XHrBwSR+Zqy1KGrSO2Ne4gCoxtrIB
 m4ZFGuxNzI+UNTtPP4oOksBaShAFIiAOFJS91jgf6EsUGLpJAlOBEYvSTzvb7toIcK/4=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vg37L-0004n7-Rs for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Jan 2026 15:49:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 33FD160052
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 14 Jan 2026 15:49:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E1162C19425
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 14 Jan 2026 15:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768405741;
 bh=jmYJEArZbk3rYWA6U5r8lF3FjjgErpj5QN7oIrIm6XE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=BsIbjV8Lq6aT2tsC0PuCCGSH2xr71ONDMLqdEc9aGcVZgI1NzXR8Fvn9iJ5lZ/dk8
 Iji2/diC6YLu4x1/o42bvZIncG/nly8347VU07PQLoKYsPwtD+AurNxACihIXOym86
 8ib5Ed+HZYpDMFkG8Fj6hLLgKuNUBGsqKS+Cn/1fI6l8aEJO1wjAw6zhZNG/lo6ZX7
 eVjdxpq39cdIygGa4MnfZ8gVldd9luAs1vg0EeB0RUHpoV0JXi9I1gTfeX+j5qFofJ
 XM/u1uw9VGm5zO87+ZJDIu8QeG086k2lbAM9xkkXo95Y9m2VaDRFURZHxOjnvMSrLO
 yYlzVH/YAdiQA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id D2762C41612; Wed, 14 Jan 2026 15:49:01 +0000 (UTC)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 14 Jan 2026 15:49:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: guoxiaolong2008@gmail.com
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220951-202145-cYA88o5Iex@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220951-202145@https.bugzilla.kernel.org/>
References: <bug-220951-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=220951 ---
 Comment
 #5 from guoxiaolong2008@gmail.com --- Hi Chao Yu: I have no concerns for
 it Thanks for your support. -- You may reply to this email to add a comment.
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vg37L-0004n7-Rs
Subject: [f2fs-dev] [Bug 220951] swapfile activation bug causes data
 corruption when swapfile < 2MB with fragmented extents
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

https://bugzilla.kernel.org/show_bug.cgi?id=220951

--- Comment #5 from guoxiaolong2008@gmail.com ---
Hi Chao Yu:
I have no concerns for it
Thanks for your support.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
