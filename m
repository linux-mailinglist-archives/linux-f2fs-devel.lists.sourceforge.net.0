Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A25BC51872E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 May 2022 16:49:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nltpu-00016O-FH; Tue, 03 May 2022 14:49:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <Hanes.Thomas23877@asda.co.uk>) id 1nltps-00016A-Te
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 May 2022 14:49:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:Date:Subject:To:From:Reply-To:Sender:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zNtAsWeLrT+hMmBfpsv2ozXy9Ct9cbEvCVJ9isHcRw0=; b=aNx/wqS8NEDmkUS1LWdQzsMpz/
 LITGAx/N72iIsAgpBPLGVQE5JTSMpFWK7GF44y6jzL0XlQZ8ipUP8yO2RzKEsveqzh8t8M6B2FKJl
 wlut56X0CQiMjj6r9B8Xl5ZwuRIJUD4T3FF8K3Pv7whjj9OulKCfo6lPvjs0Du/VagcE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
 Subject:To:From:Reply-To:Sender:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=zNtAsWeLrT+hMmBfpsv2ozXy9Ct9cbEvCVJ9isHcRw0=; b=b
 TGKUibCc7pQYksHwNqKQfl1Bhf1JMFlk3UG3ehclzKewtNnkGLDI7rYurHsz1/37SalyeIAP3dht4
 WJ5Dt2o0AIhpU/biW/G0weJiXVvjSh9Ffqt/KGUSFeY8loIiNkP0oqhk/rMs3+Be6Sg/A3gHympI8
 YVyz4NYg7oZDKRsE=;
Received: from mail.megasoftsol.com ([43.231.250.141])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nltps-0004Ai-Du
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 May 2022 14:49:09 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.megasoftsol.com (Postfix) with ESMTP id 6A60390E9E2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  3 May 2022 20:16:32 +0530 (IST)
Received: from mail.megasoftsol.com ([127.0.0.1])
 by localhost (mail.megasoftsol.com [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id El912Q1lbqIY
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  3 May 2022 20:16:32 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
 by mail.megasoftsol.com (Postfix) with ESMTP id EEF4990E9DE
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  3 May 2022 20:16:31 +0530 (IST)
X-Virus-Scanned: amavisd-new at megasoftsol.com
Received: from mail.megasoftsol.com ([127.0.0.1])
 by localhost (mail.megasoftsol.com [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id XJ8Y_EI8JHRh
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  3 May 2022 20:16:31 +0530 (IST)
Received: from asda.co.uk (unknown [20.97.211.134])
 (Authenticated sender: admin)
 by mail.megasoftsol.com (Postfix) with ESMTPSA id 27C2090E9DB
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  3 May 2022 20:16:30 +0530 (IST)
From: ASDA Stores Limited <Hanes.Thomas23877@asda.co.uk>
To: linux-f2fs-devel@lists.sourceforge.net
Date: 03 May 2022 14:48:59 +0000
Message-ID: <20220503092157.4602C6F4E614B692@asda.co.uk>
MIME-Version: 1.0
X-Spam-Score: 4.2 (++++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Dear linux-f2fs-devel We are interested in having some of
 your hot selling product in our stores and outlets spread all over United
 Kingdom, Northern Island and Africa. ASDA Stores Limited is one of the highest-
 ranking Wh [...] 
 Content analysis details:   (4.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.2 RCVD_IN_BL_SPAMCOP_NET RBL: Received via a relay in
 bl.spamcop.net
 [Blocked - see <https://www.spamcop.net/bl.shtml?43.231.250.141>]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 1.0 SPF_SOFTFAIL           SPF: sender does not match SPF record (softfail)
 2.0 PYZOR_CHECK            Listed in Pyzor
 (https://pyzor.readthedocs.io/en/latest/)
X-Headers-End: 1nltps-0004Ai-Du
Subject: [f2fs-dev] 2nd Quater puchase request
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
Reply-To: sales@asdaa.uk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

RGVhciBsaW51eC1mMmZzLWRldmVsCgpXZSBhcmUgaW50ZXJlc3RlZCBpbiBoYXZpbmcgc29tZSBv
ZiB5b3VyIGhvdCBzZWxsaW5nIHByb2R1Y3QgaW4gCm91ciBzdG9yZXMgYW5kIG91dGxldHMgc3By
ZWFkIGFsbCBvdmVyIFVuaXRlZCBLaW5nZG9tLCBOb3J0aGVybiAKSXNsYW5kIGFuZCBBZnJpY2Eu
IEFTREEgU3RvcmVzIExpbWl0ZWQgaXMgb25lIG9mIHRoZSBoaWdoZXN0LQpyYW5raW5nIFdob2xl
c2FsZSAmIFJldGFpbCBvdXRsZXRzIGluIHRoZSBVbml0ZWQgS2luZ2RvbS4gCiAgCldlIHNoYWxs
IGZ1cm5pc2ggb3VyIGRldGFpbGVkIGNvbXBhbnkgcHJvZmlsZSBpbiBvdXIgbmV4dCAKY29ycmVz
cG9uZGVudC4gSG93ZXZlciwgaXQgd291bGQgYmUgYXBwcmVjaWF0ZWQgaWYgeW91IGNhbiBzZW5k
IAp1cyB5b3VyIGNhdGFsb2cgdGhyb3VnaCBlbWFpbCB0byBsZWFybiBtb3JlIGFib3V0IHlvdXIg
Y29tcGFueSdzIApwcm9kdWN0cyBhbmQgd2hvbGVzYWxlIHF1b3RlLiBJdCBpcyBob3BlZnVsIHRo
YXQgd2UgY2FuIHN0YXJ0IGEgCnZpYWJsZSBsb25nLWxhc3RpbmcgYnVzaW5lc3MgcmVsYXRpb25z
aGlwIChwYXJ0bmVyc2hpcCkgd2l0aCB5b3UuICAKICAKICAKWW91ciBwcm9tcHQgcmVzcG9uc2Ug
d291bGQgYmUgZGVsaWdodGZ1bGx5IGFwcHJlY2lhdGVkLiAKICAKQmVzdCBXaXNoZXMgCiAgCiAg
CkhhbmVzIFMuIFRob21hcyAKUHJvY3VyZW1lbnQgT2ZmaWNlLiAKQVNEQSBTdG9yZXMgTGltaXRl
ZCAKVGVsOiAgKyA0NCAtIDc0NTEyNzE2NTAgCldoYXRzQXBwOiArIDQ0IOKAkyA3NDQxNDQwMzYw
IApXZWJzaXRlOiB3d3cuYXNkYS5jby51awoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYy
ZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2Uu
bmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
