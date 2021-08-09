Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C832A3E47CE
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  9 Aug 2021 16:41:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mD6T7-0003f1-JT; Mon, 09 Aug 2021 14:41:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <bugzilla-daemon@bugzilla.kernel.org>)
 id 1mD6T6-0003ek-KZ
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Aug 2021 14:41:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Xj91JM/D1Da8dlyZjfPf91M1/DLd5ul+7eevZ9hr8NY=; b=E6zOGNJO1KHaAkLmvu4993XPKK
 jOfiDBz8WXCY4YiAHLaqIB4RM6RAdWTmbIeYFy6eKpI+Am4rHbSmlft6Y0TFjq+xolr3FUqJUdb2o
 TXMkhWNVL01wlx4p2kVfp/LOcpEy2OnNFHv8qvlqWkwELz6t8b48v6uBQfmfxB2Z/K1E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Xj91JM/D1Da8dlyZjfPf91M1/DLd5ul+7eevZ9hr8NY=; b=eqr1T2UHzCkBepyM9JWNDfiJWe
 kj1mh+8vk8YiGfvpuu3YLLnl0hTenCpw+EajGAhuHlLA3Ka3LLIa5KKuPWofSot/prtjV0UABbqGB
 y9q3ixW3IEnUCaEysyLID3vWOcrq4rQAv9ekMDagtuY94zbDhFwQZMgyjb+GewdsStl8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mD6T5-000fxD-B5
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Aug 2021 14:41:32 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id E5AE561019
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  9 Aug 2021 14:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628520085;
 bh=Qgskzpod5eMNFQSTOQN0RtYNmkmWw1mXtQMl5AsD39M=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=sO2YufJW5Sm7W1YOD9ESlJ/b7Bn8LUDFzkcpF4tl+H+ccd1bXoVLSklw7xeKFjlQ3
 T3l17s7irfBxPBkVaPcpzt/8NlrBHFj4b1+2epRPjumUPf1j2lVx3w47UO1upOwnB3
 TtF5xVawEZAf8OLiiQnAs9aT6t01iAfieP7TfueOhIx4lARrGS1uM9316nWukSZsI8
 XCadFDgIlmseVIGSYblU6I7VCF+PbchxfMPK/MVCJgw3UeEnzl6ZOJnkMfb7Q7hZH2
 1qUdbXF0C7RnYttMjfSqrOi4aWI2c2qjnFAthvvQPBQc7FNCbDzRI87hxPIOb9q77W
 7JaPdeOEujEgw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id D493A60E4D; Mon,  9 Aug 2021 14:41:25 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 09 Aug 2021 14:41:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bezirg@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-214009-202145-UkAaJ8QIzt@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214009-202145@https.bugzilla.kernel.org/>
References: <bug-214009-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mD6T5-000fxD-B5
Subject: [f2fs-dev] [Bug 214009] Compression has no real effect in disk usage
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

https://bugzilla.kernel.org/show_bug.cgi?id=214009

Nikolaos Bezirgiannis (bezirg@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|---                         |INVALID

--- Comment #2 from Nikolaos Bezirgiannis (bezirg@gmail.com) ---
Thank you, I was not aware of this. Reading some articles on f2fs led me to
believe that the "transparent compression" acted similarly to btrfs or zfs
whereas the free space is automatically/transparently reclaimed.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
