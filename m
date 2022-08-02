Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B3C58792E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  2 Aug 2022 10:40:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oInS5-0007yB-7e; Tue, 02 Aug 2022 08:40:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1oInS2-0007xl-CS
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Aug 2022 08:40:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=i8+GOhyd4ObtvhLrquhfTWr8sOns1oHCKJrtzGe2MWw=; b=hmtrOv0ZJ6YEw2HWiqzbe4p0FM
 8aHdCt2PKt4h5fPZVBYhly1Q3eOcEDbkajFb1XFhBRtPGF8Jgi/v6/1eOlJISWiEAfjO+ZfnrAd15
 xQcGGP/DjzuSOo+w82ir2no6h82qtXTs2rIBI8uhxqeoSpkSi78pju+p8IgeWAVxxeYU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=i8+GOhyd4ObtvhLrquhfTWr8sOns1oHCKJrtzGe2MWw=; b=avarpTeIFciKrZX3/BeFCogWgM
 Kn+Ob6HfBYezgdr1fhP2BPQelEy+1WHFzxaqb48vccPC1B8pjMHOS/kEPoMWz1iuJDdZAeKXn1+tO
 9C8lezwNhZwbIOBMKSZF92U+4Jg/K8kDLouqmXWb8qPEf/hCmKcvo1blNCEdbI2A89uw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oInS1-0000A5-Ci
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Aug 2022 08:40:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 080D86010F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  2 Aug 2022 08:40:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 69F21C433D7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  2 Aug 2022 08:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659429623;
 bh=bOShVAM1WYuG08T95XdsNQhNOS+H6MpZLdjGD/N9zK4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=RU3un0u9X8Rl0+cvj8uC6XwajX4og66rPRrYpsRCjFPUxNpCRWSI7fpOyNSu2li41
 gMQT27IVMA6h+w60+i9OZqY6M/24S57r/iTJNCtxXMGAeTAZFFEHe3m+GUt/NvozRr
 eo6LCb1A5+PqQ4FB06v9P8hC3xYmZ/EmYGj3noDtqg1SuDMFhK4e8/C3OVjreSlGWD
 J6ZJy0NmF5ZDrdWQVwVuWSZfQhbTSmKBESVjrEI9AG5OVhB1q8EH7dphvFrojq8vpG
 qLg5xu2JiczPS4w48dEcHS1MeEcK/78CLIgo6rGoo8fnl//QH/NBbbILD9a2NXLTjT
 GoNQ2phnHOM0A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 505CBC433E4; Tue,  2 Aug 2022 08:40:23 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 02 Aug 2022 08:40:23 +0000
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
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216050-202145-AUZm4bGZs6@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216050-202145@https.bugzilla.kernel.org/>
References: <bug-216050-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=216050 ---
 Comment
 #45 from Chao Yu (chao@kernel.org) --- Created attachment 301519 -->
 https://bugzilla.kernel.org/attachment.cgi?id=301519&action=edit
 debug patch v2 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oInS1-0000A5-Ci
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

--- Comment #45 from Chao Yu (chao@kernel.org) ---
Created attachment 301519
  --> https://bugzilla.kernel.org/attachment.cgi?id=301519&action=edit
debug patch v2

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
