Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F272F6F7F4
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 Jul 2019 05:28:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hpOzq-0005EV-Kz; Mon, 22 Jul 2019 03:28:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <bugzilla-daemon@bugzilla.kernel.org>)
 id 1hpOzo-0005EN-Ta
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 22 Jul 2019 03:28:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SwrvqTgtbfBzbWv6pVvq7IhujxBHyr4YtFPvd4VBFBE=; b=HJry8gwi+PsrPs57JbqBjEpbhl
 qaUdNOQFWXAgIY8TYAS8q1badRbr1RNhmMsncIoTHCoRfaR24IbphZfJLwcCTKvQLzFDalzCmAQ6w
 GXFHuuzopKtf/1Vz7WxVvgqVorQC7683C0LisXHnwjzyf/RrAqy9BOobtqyS0d/nXTSM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SwrvqTgtbfBzbWv6pVvq7IhujxBHyr4YtFPvd4VBFBE=; b=FpZZ+mugQABJRraTOGgALoRbui
 emptK6tx2jDK1IVSxeUH9z2LvXIjM8nO8f//NtZhfyFm2jOIUiRGTm2KoWbiV6eklh/ITOYppPNX7
 hKsQUmux24FrD4cggFGc48b2t1K4pL04Cz7JVQ0amVG4/wTQnHxDGoDmTyVyy+QvJUZk=;
Received: from mail.wl.linuxfoundation.org ([198.145.29.98])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hpOzn-009qVs-Cs
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 22 Jul 2019 03:28:16 +0000
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id D164C28492
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 22 Jul 2019 03:28:09 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id C55AE284CE; Mon, 22 Jul 2019 03:28:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=ham version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 22 Jul 2019 03:28:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: midwinter1993@gmail.com
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204193-202145-mNSSltTGAn@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204193-202145@https.bugzilla.kernel.org/>
References: <bug-204193-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hpOzn-009qVs-Cs
Subject: [f2fs-dev] [Bug 204193] BUG: KASAN: null-ptr-deref in
 f2fs_write_end_io+0x215/0x650
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

https://bugzilla.kernel.org/show_bug.cgi?id=204193

--- Comment #4 from midwinter1993@gmail.com ---
(In reply to Chao Yu from comment #3)
> Thanks, I can reproduce it now.
> 
> I've made a patch for this issue, could you verify it?
> 
> https://lore.kernel.org/linux-f2fs-devel/20190718083959.32321-1-
> yuchao0@huawei.com/T/#u


Hi! I used the script to test the patched code several times, this bug does not
manifest again. :-P

-- 
You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
