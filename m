Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CC51653BB6C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  2 Jun 2022 17:13:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nwmVg-0004Kg-Sl; Thu, 02 Jun 2022 15:13:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1nwmVf-0004KV-6R
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 02 Jun 2022 15:13:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CA92+FixRrXpH8COI84legJlRVuXAuKiWD6p+tYrI10=; b=AzN5iphJCl/Tg3/0lpoxQfB5b1
 2zsOqaP4y22xgt44VkjU2EJagJNBnzQmrRK9qi4lHcYdriqcJT55iMhpfdkBo9GUnbraOglSMaPox
 jm38+Ndwf4dzSbceKD18NU1RFL3x80RjHJN65jVeYvl8TH1tJjlCuHJWRlLJDfXmhlac=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CA92+FixRrXpH8COI84legJlRVuXAuKiWD6p+tYrI10=; b=dH7l01/Q8vQxRGr6/zTekXDDUH
 6Gv0Msyg+opM1vUiOFnYDDhUWCoZ0A7DftAsMtIolVuNC+sEv8JqTzmdgBMpy/rbUZZVolYhqdCbu
 4LxXX6bzgEvqd3tj4QmP+BeuqmzDrGyzOo9n39/cPsWxMIGSX56PIznvLrNBN2ODtRuE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nwmVb-002Pie-L7
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 02 Jun 2022 15:13:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 61A4B60F14
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  2 Jun 2022 15:13:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C02BFC34114
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  2 Jun 2022 15:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654182780;
 bh=RIuBPlri/fvsogFL5rvOnaJ0g/bRyqujQB4ImNAmxQ8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=DEx0XXvyOLcwxl3MFbyJ131Yx980jCY4vgL74eQWeQruOmB35Oi4ky8gdvELalVoR
 r/V3HYpnZxuNLT0eVGyjLVN04Eq6dLgF/qaHV6AdeAZZ92RZ7or/L1gHYITXIs0qAz
 Wytm8tmjSIPUKOqspSNF21oDcFOLKoQwwunwjbw8UaqSSoHcJ8NxXqWotabExqrXpp
 aIjo2dNT/hDVjmsUebOW4puaXBNoLyfgIT/33vwsBsSjufAYwdv1lu3BI0TkD1mga+
 bzIcW4m6Y7QPJ/8haRxWBmvxQ+GfV30n/tT75SwyIi066YHKLMHSAorifr/opH4tKn
 CRPDo7L3xk2MA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id A8E2EC05FF5; Thu,  2 Jun 2022 15:13:00 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 02 Jun 2022 15:13:00 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216050-202145-hjKPRWyKEB@https.bugzilla.kernel.org/>
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
 #16 from Chao Yu (chao@kernel.org) --- (In reply to Jaegeuk Kim from comment
 #14) > Re #9,
 > > Thank you so much. > > f2fs_gc-254:2-1156 [013] ..... 22290.243361:
 > f2fs_lookup_extent_tree [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nwmVb-002Pie-L7
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

--- Comment #16 from Chao Yu (chao@kernel.org) ---
(In reply to Jaegeuk Kim from comment #14)
> Re #9,
> 
> Thank you so much.
> 
>    f2fs_gc-254:2-1156    [013] ..... 22290.243361:
> f2fs_lookup_extent_tree_end: dev = (254,2), ino = 1409621, pgofs = 234,
> ext_info(fofs: 0, blk: 0, len: 0) 
>    f2fs_gc-254:2-1156    [013] ..... 22290.243362:
> f2fs_lookup_extent_tree_start: dev = (254,2), ino = 1409621, pgofs = 234
>    f2fs_gc-254:2-1156    [013] ..... 22290.243362:
> f2fs_lookup_extent_tree_end: dev = (254,2), ino = 1409621, pgofs = 234,
> ext_info(fofs: 0, blk: 0, len: 0) 
>    f2fs_gc-254:2-1156    [013] ..... 22290.243362:
> f2fs_lookup_extent_tree_start: dev = (254,2), ino = 1409621, pgofs = 234
>    f2fs_gc-254:2-1156    [013] ..... 22290.243362:
> f2fs_lookup_extent_tree_end: dev = (254,2), ino = 1409621, pgofs = 234,
> ext_info(fofs: 0, blk: 0, len: 0) 
>    f2fs_gc-254:2-1156    [013] ..... 22290.243362:
> f2fs_lookup_extent_tree_start: dev = (254,2), ino = 1409621, pgofs = 234
>    f2fs_gc-254:2-1156    [013] ..... 22290.243362:
> f2fs_lookup_extent_tree_end: dev = (254,2), ino = 1409621, pgofs = 234,
> ext_info(fofs: 0, blk: 0, len: 0) 
>    f2fs_gc-254:2-1156    [013] ..... 22290.243362:
> f2fs_lookup_extent_tree_start: dev = (254,2), ino = 1409621, pgofs = 234
> 
> 
> It seems this disk is dm-2, since the extent hit count is something below.
>     - Hit Ratio: 0% (38193 / 78044163449)
> 
> I'm suspecting this flow, but not sure where it goes into a loop.
> 
> f2fs_gc
>  -> gc_data_segment
>   -> f2fs_get_read_data_page
>     -> f2fs_lookup_extent_cache

I suspect this path, it looks impossible though...

- move_data_page
 - f2fs_get_lock_data_page
  - f2fs_get_read_data_page

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
