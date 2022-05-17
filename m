Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C91152964A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 May 2022 02:56:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nqlW6-0001zM-IK; Tue, 17 May 2022 00:56:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1nqlW5-0001zF-47
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 May 2022 00:56:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/804ffDdGuolB5QnSsNxfE8rBPNI7IbdrTZQ0b7fEXA=; b=c7RphvHfQOEtIXb9N252MvMvMT
 2L0wqYh0s3BB7RhTusxEVH5tnBkCSw/AhjWp2V/mUTAkwxDisFdoaXamSTrilbaRYiZG+rUXWaFV1
 YOvadqc0FoZk8PPx80kpcT2QczygtTmuGLYz2ZP4h0eok2eSs5809hQyb6AZPgaSm8pk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/804ffDdGuolB5QnSsNxfE8rBPNI7IbdrTZQ0b7fEXA=; b=QQoYYWfwzmeeLr94csuUwWsuKm
 kohpCWtgltZaD6JvwzjyAERPuIFd1iP4zAcCnSrzaW1eHSE8HD733GnxaVAyo2BJxTuZ3Ekbwj/pn
 OBem3nDjWbnVBCuCnFNs3sRUFiWpD2K6yK6LIZTFKxakN/sxDYMBJH4eKYWYvb93MLFQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nqlW4-00050J-Rh
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 May 2022 00:56:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7C61461003
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 17 May 2022 00:56:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D8D3EC34113
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 17 May 2022 00:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652749002;
 bh=/804ffDdGuolB5QnSsNxfE8rBPNI7IbdrTZQ0b7fEXA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=N7ae5lJookw0laaMLHltQTMF5y2KInPQS5v1devlZPyCxxqtXe0kaYIX/F3THBcJ1
 qRV7fTO7WYbToF/88kBEGmY9dgGT/1d+S5TaA5UcP8ngaOSZDhgFRAM8G8HHtkWvCY
 MmehZDGEyaaq8dDZlKQfiAKIWAQHJyHm/JrHYg6nwe41cjQEX+zFkrY62GyI5foKII
 sAcLCmeeiYRIybvRAtxgouXIHWKgq4A7cSdXPYHcddFOprDg0po+mpWxcBcac8l+M3
 mwkIv7ceA8AfbdLlChRNtJ7YtnKfWfDtyirjWwLBaPjj/4eKQMbPsSHARtRCLOTvfZ
 YhuPd97nWdtMQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id BF72EC05FD2; Tue, 17 May 2022 00:56:42 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 17 May 2022 00:56:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: Zhiguo.Niu@unisoc.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215984-202145-GtgsRSwONa@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215984-202145@https.bugzilla.kernel.org/>
References: <bug-215984-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -5.5 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=215984 ---
 Comment
 #2 from Zhiguo.Niu (Zhiguo.Niu@unisoc.com) --- (In reply to Chao Yu from
 comment #1) > bugzilla is the place people reports bug against upstream linux
 kernels, > I don't think this thread [...] 
 Content analysis details:   (-5.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nqlW4-00050J-Rh
Subject: [f2fs-dev] [Bug 215984] Is there a f2fs_sload tool used on windows?
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

https://bugzilla.kernel.org/show_bug.cgi?id=215984

--- Comment #2 from Zhiguo.Niu (Zhiguo.Niu@unisoc.com) ---
(In reply to Chao Yu from comment #1)
> bugzilla is the place people reports bug against upstream linux kernels,
> I don't think this thread is openned in the right place.
> 
> BTW, I guess there is no such tool yet...

Dear Chao,

sorry, I got it, 
thanks for your kindly reply.

thanks again.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
