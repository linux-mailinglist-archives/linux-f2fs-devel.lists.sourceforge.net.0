Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EA59F0241
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Dec 2024 02:32:40 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tLuXg-0005n9-66;
	Fri, 13 Dec 2024 01:32:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1tLuXf-0005n0-9E
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Dec 2024 01:32:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dC/Eo3VR1mC8+nucmhi67lPJymPG1z5UUBjyWyso5fs=; b=XUM1zsy1iE+1SdpHItpVZEVer+
 H87FYkQmlDC/nLdpUumCVx4tF1NgZHgGDjUGCvoLiH7zJJS5e+ICkajwrxo2XeI22hdtBMivsfYeq
 larNhrBAleStCEWx8AuiP+wExlXi20WmTNcjKrJvR7sCaBzL5ElOxQrcaykd93mzJ3y0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dC/Eo3VR1mC8+nucmhi67lPJymPG1z5UUBjyWyso5fs=; b=jkBvj463YM6jIN5L6V6CC+CLAE
 zWNZLX06oxSYbwOujvqVD1k1Fwj/1lMm0Abae4ppCo72/4FV7yo2+nExAWzL45ponm7FpYcoTTKrv
 FBqIXYBELRo19V7n1f6XHBFPJsTKNpExsyaQZpg8u5drrPrOKGT3Rz+m1gT06kH0z1JQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tLuXe-0005xN-2i for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Dec 2024 01:32:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 528335C56AF
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 13 Dec 2024 01:31:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5CB98C4CED3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 13 Dec 2024 01:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734053539;
 bh=dC/Eo3VR1mC8+nucmhi67lPJymPG1z5UUBjyWyso5fs=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=hqQg0aUekyfTFQliTSMIqEzFgerce0DWx64BqZksKy9DoJkf35aZ0lUJdd9QmPi+o
 qjmZ8LDIg0G345RHvFKaaOYLtWh88f4KcPoovgNTR9qrCCvepClf4DMKQRK9SINGRk
 H7gxHX3wnc2ICvTngwUScFKzRnsja/OdRafn4irT6Ul+ZSpFc8Q5NuByYnSdcBIQqB
 9qJyZTvZ94i93AbL78872GFbV/EomybmrjB6G1MkhEFPqepOR3AtWodu6tEb5PC2Oo
 hvCSQ316u8WaHA7EUfL4XbaONWOoW5z0UVEaL1O+fmf8ZlddQ1UFbLjP1VbTIZTM/W
 CMXuJnQ7JlEyw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 4A7FFC3279F; Fri, 13 Dec 2024 01:32:19 +0000 (UTC)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 13 Dec 2024 01:32:19 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: hanqi@vivo.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219586-202145-TqHHnawyNT@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219586-202145@https.bugzilla.kernel.org/>
References: <bug-219586-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -5.7 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=219586 ---
 Comment
 #6 from HanQi (hanqi@vivo.com) --- (In reply to Chao Yu from comment #5)
 > (In reply to HanQi from comment #0) > > Hi everybody, > > The f2fs filesystem
 is unable to read some files with s [...] 
 Content analysis details:   (-5.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tLuXe-0005xN-2i
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
b21tZW50ICM2IGZyb20gSGFuUWkgKGhhbnFpQHZpdm8uY29tKSAtLS0KKEluIHJlcGx5IHRvIENo
YW8gWXUgZnJvbSBjb21tZW50ICM1KQo+IChJbiByZXBseSB0byBIYW5RaSBmcm9tIGNvbW1lbnQg
IzApCj4gPiBIaSBldmVyeWJvZHksCj4gPiBUaGUgZjJmcyBmaWxlc3lzdGVtIGlzIHVuYWJsZSB0
byByZWFkIHNvbWUgZmlsZXMgd2l0aCBzcGVjaWFsIGNoYXJhY3RlcnMsCj4gPiBzdWNoIGFzIOKd
pO+4jywgYWZ0ZXIgdGhlIGtlcm5lbCB3YXMgdXBkYXRlZCB3aXRoIHRoZSBmb2xsb3dpbmcgcGF0
Y2g6Cj4gPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9z
dGFibGUvbGludXguZ2l0L2NvbW1pdC8KPiA+ID9pZD0xOGI1ZjQ3ZTdkYTQ2ZDNhMGQ3MzMxZTQ4
YmVmY2FmMTUxZWQyZGRmCj4gCj4gSGkgSGFuUWksIEkgZ3Vlc3MgeW91IGNhbiByZXBvcnQgdGhp
cyBidWcgdG8gR2FicmllbCBLcmlzbWFuIEJlcnRhemkKPiA8a3Jpc21hbkBrZXJuZWwub3JnPj8K
PiAKPiBUaGFua3MsCgpIaSBDaGFvLCBLcmlzbWFuIGFscmVhZHkga25vd3MgYWJvdXQgdGhlIGJ1
Zy4gWW91IGNhbiBzZWUgdGhlCmxpbms6aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC84NzV4
bnF1ZHIxLmZzZkBtYWlsaG9zdC5rcmlzbWFuLmJlLwoKLS0gCllvdSBtYXkgcmVwbHkgdG8gdGhp
cyBlbWFpbCB0byBhZGQgYSBjb21tZW50LgoKWW91IGFyZSByZWNlaXZpbmcgdGhpcyBtYWlsIGJl
Y2F1c2U6CllvdSBhcmUgd2F0Y2hpbmcgdGhlIGFzc2lnbmVlIG9mIHRoZSBidWcuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVs
IG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRw
czovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVs
Cg==
