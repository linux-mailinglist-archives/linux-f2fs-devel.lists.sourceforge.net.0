Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B94AFB2A0
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Jul 2025 13:51:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3fsbl098DDemPJz6yLvptKpnhS62OxDhWzIZaQ3l3C4=; b=RCAR9NXAvS4CjWM6s+09glsaTF
	nNV6rM9KbPDdRQEroV0NBbG85liBmkxS1YJWmkyTsN+9qG4nnJzaVqw3sn14xaVDI30p+UIRmoi6y
	FoS2ZWC1eZ7paenqSOVwzaRykWz9XRKD0YS+9hZxyD3h3ISpgmkIaKjPB9rziqZ4IEUE=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uYkO1-0002eI-Ck;
	Mon, 07 Jul 2025 11:51:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1uYkNM-0002di-Ck
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Jul 2025 11:51:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pTrD9ZsP1iIcv3GuDQ/D2moEVohIGxM2eitI9zmq6OQ=; b=BtMs7FQG3p/VbmuiNJAxgXz/vQ
 X0WKcTsRDKBNfsJ3zt7gloOSmmTF6rVOFuHgb65200+6nBGwg/WvycV21b8VulJBLmYx2E5jHVDrp
 9EE7NsncetXRkIpMph4uxuXdp2V5czaXU83eLTHYX2U7jPuqsq764mIkzdIWzUwkQpTk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pTrD9ZsP1iIcv3GuDQ/D2moEVohIGxM2eitI9zmq6OQ=; b=idckisUFttFgf2qtDvoccZKm2N
 qfahsUTuZvj+W66AX5K34QHOoh0ZCVaU0NcWE5FLCMzC35k2V1ZyTkbcR7Q1pX3UlRR7WFmqxLt69
 jg/wR08Y1+NSHlJC72x9D7TenGdncDqxl/bw2csjUSyGWN6FalyqfEJxtFd19rLAPJXs=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uYkNL-0005jz-VO for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Jul 2025 11:51:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9BFD046378
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  7 Jul 2025 11:51:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7AAEAC4CEF5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  7 Jul 2025 11:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751889061;
 bh=lpK/9UdaVcmguEAVUfUPXXR2YwOJwOySXNUUu3qso2c=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=sy9ICUTNM8D5FWqZmowRj6ciM+qB7PKxkr+T7Z2hfCn8ffIt06HN3Y9LWq7ZV3g+U
 ozWvk6Xfgqw2W/9jA/vchE5e/v5G/vxYSljZKiFpFMdTcZFyRvREkO+uzjCb2gsgJT
 Y4jr8TDr0PYoszQgmXFwI+MwpXPT0QgzvSVtCRAXuVnhgT8gjfA5Drx87YQKiqLtuE
 7h1EmEGn4mcdS6FD9XoCtHu/LniHZNaLwS3a540aQ3vRGOwf3Et22tM/MGDXrEv/uH
 lG22BJHP1vw5kiAKJS+9veQVi9uwejMaVQxsI+wADzmZTltgODP0kHkT0xlO+oOra2
 d28mCdWbs3fxg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 6AAB5C4160E; Mon,  7 Jul 2025 11:51:01 +0000 (UTC)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 07 Jul 2025 11:51:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: chao@kernel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-220321-202145-gtXqJBIMLC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220321-202145@https.bugzilla.kernel.org/>
References: <bug-220321-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  https://bugzilla.kernel.org/show_bug.cgi?id=220321 Chao Yu
 (chao@kernel.org) changed: What |Removed |Added CC| |chao@kernel.org 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uYkNL-0005jz-VO
Subject: [f2fs-dev] [Bug 220321] F2FS: workqueue: WQ_MEM_RECLAIM
 writeback:wb_workfn is flushing !WQ_MEM_RECLAIM
 events_unbound:quota_release_workfn
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

https://bugzilla.kernel.org/show_bug.cgi?id=220321

Chao Yu (chao@kernel.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |chao@kernel.org

--- Comment #1 from Chao Yu (chao@kernel.org) ---
IIUC, do you mean it needs to create wb_workfn workqueue w/ WQ_MEM_RECLAIM?

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
