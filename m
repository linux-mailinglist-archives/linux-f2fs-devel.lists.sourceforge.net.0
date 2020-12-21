Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D2EAD2DFA16
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 21 Dec 2020 09:44:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1krGnu-0001JA-1P; Mon, 21 Dec 2020 08:44:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <bugzilla-daemon@bugzilla.kernel.org>)
 id 1krGnt-0001J4-6y
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 21 Dec 2020 08:44:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lT5GS+Uyizchjv8mS/RQrF9Gnh2GRo5zsb7hgpdXD3w=; b=Sb5soNP+Xy0NmRRpNbO9jfZZAk
 EsZGcTEcgRocPwyx40v8sThdam0pGYpi7BdtWmuksoDObyn5ne8EW/MpeuVZJcxDwPiUIaVe1vipT
 EQwNajXMhUtIMXhq/vREHFn6vyE6N0jm8qCRa6T1HH4u3bqRw/jIVlHkv1mJqxIax30E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lT5GS+Uyizchjv8mS/RQrF9Gnh2GRo5zsb7hgpdXD3w=; b=gT39l/QbGfywT46YNFQRKWMQaD
 RgwD87p7dtAXk82EXyDZYCiZcLeijn5npuVj3TDBeMWwGz1Eql0CmPO5vroPuYPZbxJ270QAqoMkp
 dcEvO6po5hqgu+uSYR3moFXeKu6MMXWyseBkEP4+BcpnCwue1x1zGUQxCwInMFkA6owE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1krGnq-004Rw1-Bj
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 21 Dec 2020 08:44:29 +0000
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 21 Dec 2020 08:44:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: chao@kernel.org
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-210745-202145-IkBCIxovmW@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210745-202145@https.bugzilla.kernel.org/>
References: <bug-210745-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1krGnq-004Rw1-Bj
Subject: [f2fs-dev] [Bug 210745] kernel crash during umounting a partition
 with f2fs filesystem
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

https://bugzilla.kernel.org/show_bug.cgi?id=210745

--- Comment #4 from Chao Yu (chao@kernel.org) ---
(In reply to Zhiguo.Niu from comment #2)
> hi Chao, 
> 
> Thanks for your reply, I have checked my codebase, there is no any other
> private patches in current version.
> 
> I find that local variables natvec & setvec in f2fs_destroy_node_manager may
> be inited as 0xaa and 0xaaaaaaaaaaaaaaaa, just like :
> 
> void f2fs_destroy_node_manager(struct f2fs_sb_info *sbi)
> {
>       struct f2fs_nm_info *nm_i = NM_I(sbi);
>       struct free_nid *i, *next_i;
>       struct nat_entry *natvec[NATVEC_SIZE];
>       struct nat_entry_set *setvec[SETVEC_SIZE];
> 

I don't think so, natvec array will be assigned in __gang_lookup_nat_cache(),
and natvec[0..found - 1] will be valid, in "destroy nat cache" loop, we will
not access natvec array out-of-range.

Can you please check whether @found is valid or not (@found should be less or
equal than NATVEC_SIZE)?

BTW, one possible case could be stack overflow, but during umount(), would
that really happen?

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
