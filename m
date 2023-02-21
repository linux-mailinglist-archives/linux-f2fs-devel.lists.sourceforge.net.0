Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B0E69DD0E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Feb 2023 10:40:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pUP8W-0004lD-RK;
	Tue, 21 Feb 2023 09:40:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1pUP8K-0004l5-Cd
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Feb 2023 09:40:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NR89ogrHnaw+K6Qq67D8VWR4MOIMXX0zkHo9OEBkPws=; b=DlO7fr+sb5/lg76SkotgiLcoys
 ckzbimhSXK3jCqKCncE3ZJnhbs4BhyI9HR986pOKa6ORww1LEJLYQa369Rbz2jvdGW7I0xgi2oxVK
 v/mayNbZnnfaJr66ht97Rl6yNTlHUHS2vCI4Xzks89qwEbeKOTsePm7uCpsAjn6l67nc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NR89ogrHnaw+K6Qq67D8VWR4MOIMXX0zkHo9OEBkPws=; b=keSO+OGy4DW/iHv6zeM9DlHR8V
 rMzvhEdL6YTfBlCOhjna5XNa4SbykonBxgo3t4ZN9ByHZopMNoCNtpuXd2zZGcqLAUtGVfoXwmUCt
 w7RRrE04Cx+Y0UhYbMyo5i27/VxaSmHmgh7U0eDo3OIXeA1k/gCpc0vnC9vvQI6Cl7HE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pUP8J-00C7j6-Ur for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Feb 2023 09:40:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 573ED60F83
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 21 Feb 2023 09:40:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BD95EC4339B
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 21 Feb 2023 09:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676972414;
 bh=NR89ogrHnaw+K6Qq67D8VWR4MOIMXX0zkHo9OEBkPws=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=UZS8B2o2Blcv4T4uVHABrF+99/GeqgiHaC6JegAzHvqpZaWFnqFUB3YYvBVuz+Kyl
 VNUhGjhNhgGsYgSb7w6CF1n4SWKij+G83FjUjMx66E1M4ns5ImB4f1aJSG49UcSxAv
 6LR/8WUuYB0h97SgyJP/Xf09tlnhwfXYHjtFRSCUrkFdPPFoTP6Gx+m5BdQbiYg5Wc
 V18IPf9aw6teZTpHPTn/eNSShEdmmnkde6YWJ3dKfT8EOfAswh3VwRHYHy+lgAnVxv
 fNtyjTVnGrvkTmCRubMSv/fweXK0wcp6DtGZL0LkS1k8BEhYHQkyZdslLPOvWWKfzH
 UHnFfTealCQbA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id A26BCC43142; Tue, 21 Feb 2023 09:40:14 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 21 Feb 2023 09:40:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: guido.iodice@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216050-202145-trfw2At8Gr@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216050-202145@https.bugzilla.kernel.org/>
References: <bug-216050-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=216050 ---
 Comment
 #133 from Guido (guido.iodice@gmail.com) --- I tried to apply the patch on
 6.2 but it failed because the repeat is missing @1328. -- You may reply to
 this email to add a comment. 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pUP8J-00C7j6-Ur
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

--- Comment #133 from Guido (guido.iodice@gmail.com) ---
I tried to apply the patch on 6.2 but it failed because the repeat is missing
@1328.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
