Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C340B993F8
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Sep 2025 11:51:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TPY3J+/AWHDNSWoSUUhf/d7Z7pBnJYT3PuAMqBiXTQE=; b=E1SahCvS2l2JgZzVME3roqukKy
	vNGdT7hxsjrgS2bBqeZ234zTP8sAk+yflfYARIHv1vz36sJtCJbb0VuFIJLuMZPK7m+NE7lQlc0j+
	zieBxPFe/ZSl2q8dBjKY4VuoxuYfI36DLndT5dLv85n3X+tPZFPPlbOQ47WxiLHhQtHU=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v1M9b-0007kI-Vl;
	Wed, 24 Sep 2025 09:51:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1v1M9a-0007kA-Cq
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Sep 2025 09:51:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kO2mHsING2Fj/ljQbIpf6ddTNH+gjn6aHcN2X6j1+MU=; b=dR+S/wulPRIF5lwNBcRAAgnzAY
 jbWdBv+xxl8AnfMg0xnW09rv8YP5IoqVDjaCL1P4sK38OB8B8GxQ8xN9rJhT65EMyWLDzVCt8kYPv
 y9qyxa0CU3WfCxZJJCfIFMfLFGPB5GXREzSrR2LECdGcIdCb87ItUQ9EdrHBR8WjivOk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kO2mHsING2Fj/ljQbIpf6ddTNH+gjn6aHcN2X6j1+MU=; b=IWvh73Z6qN4lkiS3+2Gs3YWT38
 gKlceZ/Qm3PY+/hyZDZ7DyQkD7fU8Be/vIZnRKzBkpFlZ2E+Ct+Z2SdjmlOIEf53rUnfLfXltFy2E
 mytoIM/HdvN2OzWpF6IFSydFqI9ublROrWnmV6WHZoYRO7gxMzv+gi1yJhLIvhPuKsp4=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v1M9Z-000678-1y for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Sep 2025 09:51:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id AA1E54010C
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 24 Sep 2025 09:51:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 89397C113CF
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 24 Sep 2025 09:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758707462;
 bh=VMgOv5soGecJ0GlfOvCFJ/dm0d5YuVmPH6UDoKdGtAY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=jmpZOjr9KNy2sPYWBWv7JZWIijXDQ/ljuus4zw/T6XFawMjMHmDaLzDLypD3DdeQW
 wnQ2mTSWX9F5+qkoMBSLggjvwxcFMRWm+As3xlfaEzno7nzJnwPBLBz3H05bBEHkxR
 7YvMGuhtmQ4xi5jdhgQJElynY3X/LPT7qBoMQDN6ofhAfPDq3yA6j2RHEu49L8OFGE
 Ewx+f6qrY0rpuVo2fYzICiBNPB3d5rcrsTO+IiQd93LQpjp+pCl9TZkT1AkQGwkdJE
 Ee0caf8oWfMCA2DOIWRTj1siF9jY5mPgcz4ivxGQugFKhZwUYSF/3n9McHAPFSHBRR
 CW0rNagUsRAkA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 77B10C3279F; Wed, 24 Sep 2025 09:51:02 +0000 (UTC)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 24 Sep 2025 09:51:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: JY.Ho@mediatek.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220575-202145-QegXOqzmkm@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220575-202145@https.bugzilla.kernel.org/>
References: <bug-220575-202145@https.bugzilla.kernel.org/>
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
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=220575 ---
 Comment
 #6 from JY (JY.Ho@mediatek.com) --- (In reply to Chao Yu from comment #5)
 > If this is reproducible, could you check whether we're suffer panic in
 > f2fs_submit_page_bio()? if it is, could [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v1M9Z-000678-1y
Subject: [f2fs-dev] [Bug 220575] Unable to handle kernel NULL pointer
 dereference at virtual address 0000000000000000
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

https://bugzilla.kernel.org/show_bug.cgi?id=220575

--- Comment #6 from JY (JY.Ho@mediatek.com) ---
(In reply to Chao Yu from comment #5)
> If this is reproducible, could you check whether we're suffer panic in
> f2fs_submit_page_bio()? if it is, could you please have a try w/ below fix:
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 82ae31b8ecc4..959614de878f 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -716,7 +716,7 @@ int f2fs_submit_page_bio(struct f2fs_io_info *fio)
>                 wbc_account_cgroup_owner(fio->io_wbc, fio_folio, PAGE_SIZE);
>  
>         inc_page_count(fio->sbi, is_read_io(fio->op) ?
> -                       __read_io_type(data_folio) :
> WB_DATA_TYPE(fio->folio, false));
> +                       __read_io_type(data_folio) :
> WB_DATA_TYPE(data_folio, false));
>  
>         if (is_read_io(bio_op(bio)))
>                 f2fs_submit_read_bio(fio->sbi, bio, fio->type);


It's reproducible after maybe one day of stress testing, and it panics in 
inc_page_count(fio->sbi, WB_DATA_TYPE(page, false));

https://github.com/torvalds/linux/blob/b8fcb8423053adaa27723010260aea90474b431a/fs/f2fs/data.c#L917

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
