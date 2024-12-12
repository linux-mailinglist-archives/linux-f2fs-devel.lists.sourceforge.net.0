Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BAC9EEB89
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Dec 2024 16:26:02 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tLl4d-0002fu-7p;
	Thu, 12 Dec 2024 15:25:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1tLl4L-0002fa-V6
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Dec 2024 15:25:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rSi1xdI5od5ZCAM650iQb9lLqRtVtvFFaJK5BCH8wRM=; b=QL5DHcpiyes+TcrZZH7FjRYjSf
 AUgWlZtZAbKCCLfBS/FB55lklxDN6CGU+OK9CVHV0sKRvXu4s3SSDlf2ypa/fwOva+XpwydCMAULJ
 qZokEU8ePKSGb3zqtUL0sDvUjXDshx70kUgrMCcPpvadYXrC3259QqylgFwUE3dnzp64=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rSi1xdI5od5ZCAM650iQb9lLqRtVtvFFaJK5BCH8wRM=; b=KFwLzvWAuQL31crVMqVwngIp0P
 re3QTlUi6y9FMSLuxZyJdXWGEwC0YseV1Vo9B4MRjfdu+tpjB0iH6IKRWPpLcap0D+eNcWy7lACT1
 5H4IkjK2fzVKdQAnuCjBVBNPsk71B6THvAx18qMQ1Ot3sK1ECHHY4L7zwYw8FP4Hw3lU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tLl4M-0002K7-3f for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Dec 2024 15:25:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 48C545C61EB
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 12 Dec 2024 15:24:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 607CFC4CED7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 12 Dec 2024 15:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734017127;
 bh=rSi1xdI5od5ZCAM650iQb9lLqRtVtvFFaJK5BCH8wRM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=cxsJ8NUjiC4hrsKDzNn+S5Hxl4FJa5twdyQoLbwUfctqIacHzZifT2d07WQ1NuXZY
 im6LVSktflW3lpTDGuE3GIKgM49tFp3iW/ZaYh9hNEiaslHrOiXJUZJQz383V5PUAH
 fdAHHxIuliPD3Hq0fbDRQvNM9yanecty2D4uiU45dIv6WDhsdec5S1FZwHQsYpnv1/
 lAFWwjlJZCb8zk9Fs7p8SuQgSKdhL8H3GCj5zgUMlOWuZI1Paxg+q1R+a4yGd0x87c
 WDyydagg2hGvHjtvEveQBtU8UdYeDTBw69zsp/yFUKtfVesvw9ikNHiv0icq48EaUh
 brCl4q4yT8ypw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 52267C3279F; Thu, 12 Dec 2024 15:25:27 +0000 (UTC)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 12 Dec 2024 15:25:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: chao@kernel.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219586-202145-3ER8J0qwQV@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219586-202145@https.bugzilla.kernel.org/>
References: <bug-219586-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -5.7 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  https://bugzilla.kernel.org/show_bug.cgi?id=219586 --- Comment
    #5 from Chao Yu (chao@kernel.org) --- (In reply to HanQi from comment #0)
    > Hi everybody, > The f2fs filesystem is unable to read some files with special
    characters, > such as ❤️, afte [...] 
 
 Content analysis details:   (-5.7 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                            [139.178.84.217 listed in bl.score.senderscore.com]
  0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                         [139.178.84.217 listed in sa-trusted.bondedsender.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tLl4M-0002K7-3f
Subject: [f2fs-dev] [Bug 219586] Unable to find file after unicode change
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMTk1ODYKCi0tLSBD
b21tZW50ICM1IGZyb20gQ2hhbyBZdSAoY2hhb0BrZXJuZWwub3JnKSAtLS0KKEluIHJlcGx5IHRv
IEhhblFpIGZyb20gY29tbWVudCAjMCkKPiBIaSBldmVyeWJvZHksCj4gVGhlIGYyZnMgZmlsZXN5
c3RlbSBpcyB1bmFibGUgdG8gcmVhZCBzb21lIGZpbGVzIHdpdGggc3BlY2lhbCBjaGFyYWN0ZXJz
LAo+IHN1Y2ggYXMg4p2k77iPLCBhZnRlciB0aGUga2VybmVsIHdhcyB1cGRhdGVkIHdpdGggdGhl
IGZvbGxvd2luZyBwYXRjaDoKPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgv
a2VybmVsL2dpdC9zdGFibGUvbGludXguZ2l0L2NvbW1pdC8KPiA/aWQ9MThiNWY0N2U3ZGE0NmQz
YTBkNzMzMWU0OGJlZmNhZjE1MWVkMmRkZgoKSGkgSGFuUWksIEkgZ3Vlc3MgeW91IGNhbiByZXBv
cnQgdGhpcyBidWcgdG8gR2FicmllbCBLcmlzbWFuIEJlcnRhemkKPGtyaXNtYW5Aa2VybmVsLm9y
Zz4/CgpUaGFua3MsCgotLSAKWW91IG1heSByZXBseSB0byB0aGlzIGVtYWlsIHRvIGFkZCBhIGNv
bW1lbnQuCgpZb3UgYXJlIHJlY2VpdmluZyB0aGlzIG1haWwgYmVjYXVzZToKWW91IGFyZSB3YXRj
aGluZyB0aGUgYXNzaWduZWUgb2YgdGhlIGJ1Zy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4
LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9y
Z2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
