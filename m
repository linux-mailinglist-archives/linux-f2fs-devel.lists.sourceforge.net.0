Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7428B214AF9
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  5 Jul 2020 09:40:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jrzGa-0005Uo-Tg; Sun, 05 Jul 2020 07:40:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <SRS0=BgzH=AQ=bugzilla.kernel.org=bugzilla-daemon@kernel.org>)
 id 1jrzGZ-0005Ug-Ag
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 05 Jul 2020 07:40:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eO0+RSOtDm4TppRTTjhFRzGZQwg71Lubjp5+MZyN9EE=; b=H17s/X9KEqsedYTHL5IPblRrfI
 B0QPEf7R9z7J//eCXIa4X/Vde4+PSLwg32esycAkurh+Sr7zClyalSm0Hf+JF3JabtKkBYRdPGir5
 mtgCMY0w4WdIfw9CbL4PF+apRReKEI9OEmE5iBTi9PFvCdnZLvOgCHs3vAfwrPbK+Tms=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eO0+RSOtDm4TppRTTjhFRzGZQwg71Lubjp5+MZyN9EE=; b=efkCwSo0208s5dEF7vBQlKLutQ
 eyMzRVFYBI8DpEBNNwJy/pud2IuWgdqGoywP+fQUCj0hKkISYKAV1Uli4WDcLDQAkh9xr3NJsNUkX
 ssZTRpEENXFG0GLOwAuxN4AT04LBTpYF5XP7NIpOBBeUNow5pOu1o0ogGj0XLD4+UEgc=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jrzGY-00Dcy2-24
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 05 Jul 2020 07:40:47 +0000
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sun, 05 Jul 2020 07:40:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: zKqri0@gmail.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-208325-202145-V14Q6de6l7@https.bugzilla.kernel.org/>
In-Reply-To: <bug-208325-202145@https.bugzilla.kernel.org/>
References: <bug-208325-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jrzGY-00Dcy2-24
Subject: [f2fs-dev] [Bug 208325] f2fs inconsistent node block
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

https://bugzilla.kernel.org/show_bug.cgi?id=208325

--- Comment #6 from zKqri0@gmail.com ---
(In reply to Chao Yu from comment #5)
> (In reply to zKqri0 from comment #4)
> > >[print_node_info: 271] Node ID [0x203a7962:540703074] is direct node or
> > >>indirect node.
> > >[0]                    [0x5452202c : 1414668332]
> > >[1]                    [0x45445f4d : 1162108749]
> > >[2]                    [0x4444414c : 1145323852]
> > >[3]                    [0x202c2952 : 539765074]
> > >[4]                    [0x6e657665 : 1852143205]
> > >[5]                    [0x6f687420 : 1869116448]
> > >[6]                    [0x20686775 : 543713141]
> > >[7]                    [0x69207469 : 1763734633]
> > >[8]                    [0x6f6e2073 : 1869488243]
> > >[9]                    [0x46202e74 : 1176514164]
> > >[10]                   [0x69207869 : 1763735657]
> > >Invalid (i)node block
> 
> I don't see any valid information from this, could you please upload the raw
> block if possible?

yeah there probably isnt because it seems like blk_addr is pointing to an
invalid address. i took a dump of the node with "dd if=/dev/sda2 of=./node.bin
bs=4096 skip=2900324352 count=4096 iflag=skip_bytes,count_bytes" with
2900324352 being "blk_addr >> 12" and it was part of a random git commit
message and not a node block. anything else that would be useful to dump ?

-- 
You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
