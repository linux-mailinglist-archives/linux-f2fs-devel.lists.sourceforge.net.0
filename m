Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 513EFD7EDE
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 15 Oct 2019 20:25:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iKRW1-0005Ok-I7; Tue, 15 Oct 2019 18:25:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <SRS0=uAX6=YI=bugzilla.kernel.org=bugzilla-daemon@kernel.org>)
 id 1iKRW0-0005Od-Jv
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 15 Oct 2019 18:25:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sLrAxxX+NECMgLJzOy1atmC9boGDWFsvkXXCf6KllmE=; b=lY9NvKSChq8Ds5dfykvkKLXAea
 Eq1Xw+3Ej+VUxJO+t6SGuvRKBiqmmDKM8zctg/1PpMLn4OUopvBv5Nt8sNGkO7H5a0dwjgk8g1IOk
 GJypAdcvyL9NM3sBYJNcgygvYcAaRHOp7qoekSZgFBVQHZz8lottLdjDDaoN4E+PNYZQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Date:
 Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=sLrAxxX+NECMgLJzOy1atmC9boGDWFsvkXXCf6KllmE=; b=F
 vdwM8dSdoqKDhUochS9OQmRtdDTqKI81T8NfZi5mtnoYNwCgASyHMKRXixYQ/HPViNcvfk02DWaOW
 woPScaGJjhHbMrY6Y+cUZXnRNkVnt1G81rN0eX6paH/m7Q1LhLQ9zbIBZBseKXS5SYaGDC9IMRpr7
 8HYP1/MaX1MOOTaY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iKRVy-002Yeo-Q9
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 15 Oct 2019 18:25:48 +0000
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 15 Oct 2019 18:25:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: yfdyh000@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-205203-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iKRVy-002Yeo-Q9
Subject: [f2fs-dev] [Bug 205203] New: ram_thresh default (DEF_RAM_THRESHOLD)
 is wrong (outdated) in f2fs document
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDUyMDMKCiAgICAg
ICAgICAgIEJ1ZyBJRDogMjA1MjAzCiAgICAgICAgICAgU3VtbWFyeTogcmFtX3RocmVzaCBkZWZh
dWx0IChERUZfUkFNX1RIUkVTSE9MRCkgaXMgd3JvbmcKICAgICAgICAgICAgICAgICAgICAob3V0
ZGF0ZWQpIGluIGYyZnMgZG9jdW1lbnQKICAgICAgICAgICBQcm9kdWN0OiBGaWxlIFN5c3RlbQog
ICAgICAgICAgIFZlcnNpb246IDIuNQogICAgS2VybmVsIFZlcnNpb246IGFsbAogICAgICAgICAg
SGFyZHdhcmU6IEFsbAogICAgICAgICAgICAgICAgT1M6IExpbnV4CiAgICAgICAgICAgICAgVHJl
ZTogTWFpbmxpbmUKICAgICAgICAgICAgU3RhdHVzOiBORVcKICAgICAgICAgIFNldmVyaXR5OiBs
b3cKICAgICAgICAgIFByaW9yaXR5OiBQMQogICAgICAgICBDb21wb25lbnQ6IGYyZnMKICAgICAg
ICAgIEFzc2lnbmVlOiBmaWxlc3lzdGVtX2YyZnNAa2VybmVsLWJ1Z3Mua2VybmVsLm9yZwogICAg
ICAgICAgUmVwb3J0ZXI6IHlmZHloMDAwQGdtYWlsLmNvbQogICAgICAgIFJlZ3Jlc3Npb246IE5v
CgpUaGUgZGVmYXVsdCB2YWx1ZSBhcHBlYXJzIHRvIGhhdmUgYmVlbiBjb3JyZWN0ZWQgYnkgImYy
ZnM6IGZpeCB3cm9uZwpwZXJjZW50YWdlIiBjb21taXRbMV0sIGJ1dCBzdGlsbCB0aGUgb2xkIHZh
bHVlcyDigIvigItpbiB0aGUgZjJmcyBkb2N1bWVudFsyXS4KCgpyZWY6CjE6Cmh0dHBzOi8vZ2l0
aHViLmNvbS90b3J2YWxkcy9saW51eC9jb21taXQvMjk3MTBiY2Y5NDI2Yzg0YmI2YTliMWQ5NDMx
Njg5NWVkNjE0MzgxMwoyOiBodHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9Eb2N1bWVudGF0aW9u
L2ZpbGVzeXN0ZW1zL2YyZnMudHh0CgppbnRyb2R1Y2VzIHJhbV90aHJlc2g6IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL3BhdGNod29yay9wYXRjaC80NTA0NzYvCgpkZWZpbmUgREVGX1JBTV9USFJF
U0hPTEQgICAgICAgIDE6Cmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJu
ZWwvZ2l0L2phZWdldWsvZjJmcy1zdGFibGUuZ2l0L3RyZWUvZnMvZjJmcy9ub2RlLmg/aD1saW51
eC00LjE5LnkjbjIzCgotLSAKWW91IGFyZSByZWNlaXZpbmcgdGhpcyBtYWlsIGJlY2F1c2U6Cllv
dSBhcmUgd2F0Y2hpbmcgdGhlIGFzc2lnbmVlIG9mIHRoZSBidWcuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcg
bGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3Rz
LnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
