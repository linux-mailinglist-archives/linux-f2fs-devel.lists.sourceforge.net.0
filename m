Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A65324446
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Feb 2021 20:03:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lEzRh-00028U-Af; Wed, 24 Feb 2021 19:03:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <gustavoars@kernel.org>) id 1lEzRf-00028M-S0
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 24 Feb 2021 19:03:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eigZdwtXsLboXw1wgkN0U9JLNu8sM+aRtcRXW6kKfk8=; b=EFHvoatRv1im0OsOizs0FQakiu
 6zdE+WDjn5sBVQlnxh62mXrl2IUmK02IvEv0sNzFY3NheqAxjPoRjttjuF2JXCzNtdNftAs1rwnuS
 szL53QZSJLyHDZ31mfB6dKsiR19MGFm+mhL1Uft+/XDq/V5Xze+tXQJvtTCw1Zer/Qxg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc
 :To:From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=eigZdwtXsLboXw1wgkN0U9JLNu8sM+aRtcRXW6kKfk8=; b=A
 /p1W8TAKH2/c7IoGXm1RoW6F8Wa2E6QBIWIrTuLs//tXsXNSgxXLcJF6WyfGb+V/XmJVLOZ7JudqH
 XaOaxZ1JCQd44JWSZ0np9ZaddZILEeNJkGU/u2U0//SCGVRxABDARhk9nikYDBjrxd1uqh9pUmNbM
 Z5d4bSsUSZXIqEkc=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lEzRX-0002Hz-W0
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 24 Feb 2021 19:03:35 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 527A164F16;
 Wed, 24 Feb 2021 19:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614193395;
 bh=PxDG3veJbNLyGyeroA2Pjfvxfc8wcJtTEAXzJyz6Q1U=;
 h=Date:From:To:Cc:Subject:From;
 b=kSL75zfidFWCa3nX4HBG5O0E4kB4mRGvnehoXEbkmf5DSSY1Mmy25DEzopyXCN1Y0
 RR2JqUARIdspqhgdROz0cjWbp6tLBdX/8egll1JmtiM3mLDTSKm4TH/H/KUdqOXtWX
 dH2jxkvjHiFejfCatI1wTmCc9re12Vkr7ynGoCHj7VbUn1qRj6UsOXACJb+jkxxfZv
 TWpu8GSR1CSF7kGH3jdhC4+rwGKarf/PbvmjU1iQv37Oaj9l/BbyEo73R98XoTn0mD
 MzF67+fc4EpAYz5MMg3Q3pcAlP4raIFcIe+O9tvf/2MYbZKpi7EiMr7Y6dB93G+4Oi
 CHDlTB0rijKSQ==
Date: Wed, 24 Feb 2021 13:03:13 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
Message-ID: <20210224190313.GA144040@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: wikipedia.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lEzRX-0002Hz-W0
Subject: [f2fs-dev] [PATCH][next] f2fs: Replace one-element array with
 flexible-array member
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
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

VGhlcmUgaXMgYSByZWd1bGFyIG5lZWQgaW4gdGhlIGtlcm5lbCB0byBwcm92aWRlIGEgd2F5IHRv
IGRlY2xhcmUgaGF2aW5nCmEgZHluYW1pY2FsbHkgc2l6ZWQgc2V0IG9mIHRyYWlsaW5nIGVsZW1l
bnRzIGluIGEgc3RydWN0dXJlLiBLZXJuZWwgY29kZQpzaG91bGQgYWx3YXlzIHVzZSDigJxmbGV4
aWJsZSBhcnJheSBtZW1iZXJz4oCdWzFdIGZvciB0aGVzZSBjYXNlcy4gVGhlIG9sZGVyCnN0eWxl
IG9mIG9uZS1lbGVtZW50IG9yIHplcm8tbGVuZ3RoIGFycmF5cyBzaG91bGQgbm8gbG9uZ2VyIGJl
IHVzZWRbMl0uCgpSZWZhY3RvciB0aGUgY29kZSBhY2NvcmRpbmcgdG8gdGhlIHVzZSBvZiBhIGZs
ZXhpYmxlLWFycmF5IG1lbWJlciBpbgpzdHJ1Y3QgZjJmc19jaGVja3BvaW50LCBpbnN0ZWFkIG9m
IGEgb25lLWVsZW1lbnQgYXJyYXlzLgoKTm90aWNlIHRoYXQgYSB0ZW1wb3JhcnkgcG9pbnRlciB0
byB2b2lkICcqdG1wX3B0cicgd2FzIHVzZWQgaW4gb3JkZXIgdG8KZml4IHRoZSBmb2xsb3dpbmcg
ZXJyb3JzIHdoZW4gdXNpbmcgYSBmbGV4aWJsZSBhcnJheSBpbnN0ZWFkIG9mIGEgb25lCmVsZW1l
bnQgYXJyYXkgaW4gc3RydWN0IGYyZnNfY2hlY2twb2ludDoKCiAgQ0MgW01dICBmcy9mMmZzL2Rp
ci5vCkluIGZpbGUgaW5jbHVkZWQgZnJvbSBmcy9mMmZzL2Rpci5jOjEzOgpmcy9mMmZzL2YyZnMu
aDogSW4gZnVuY3Rpb24g4oCYX19iaXRtYXBfcHRy4oCZOgpmcy9mMmZzL2YyZnMuaDoyMjI3OjQw
OiBlcnJvcjogaW52YWxpZCB1c2Ugb2YgZmxleGlibGUgYXJyYXkgbWVtYmVyCiAyMjI3IHwgICBy
ZXR1cm4gJmNrcHQtPnNpdF9uYXRfdmVyc2lvbl9iaXRtYXAgKyBvZmZzZXQgKyBzaXplb2YoX19s
ZTMyKTsKICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeCmZz
L2YyZnMvZjJmcy5oOjIyMjc6NDk6IGVycm9yOiBpbnZhbGlkIHVzZSBvZiBmbGV4aWJsZSBhcnJh
eSBtZW1iZXIKIDIyMjcgfCAgIHJldHVybiAmY2twdC0+c2l0X25hdF92ZXJzaW9uX2JpdG1hcCAr
IG9mZnNldCArIHNpemVvZihfX2xlMzIpOwogICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIF4KZnMvZjJmcy9mMmZzLmg6MjIzODo0MDogZXJyb3I6
IGludmFsaWQgdXNlIG9mIGZsZXhpYmxlIGFycmF5IG1lbWJlcgogMjIzOCB8ICAgcmV0dXJuICZj
a3B0LT5zaXRfbmF0X3ZlcnNpb25fYml0bWFwICsgb2Zmc2V0OwogICAgICB8ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KbWFrZVsyXTogKioqIFtzY3JpcHRzL01ha2Vm
aWxlLmJ1aWxkOjI4NzogZnMvZjJmcy9kaXIub10gRXJyb3IgMQptYWtlWzFdOiAqKiogW3Njcmlw
dHMvTWFrZWZpbGUuYnVpbGQ6NTMwOiBmcy9mMmZzXSBFcnJvciAyCm1ha2U6ICoqKiBbTWFrZWZp
bGU6MTgxOTogZnNdIEVycm9yIDIKClsxXSBodHRwczovL2VuLndpa2lwZWRpYS5vcmcvd2lraS9G
bGV4aWJsZV9hcnJheV9tZW1iZXIKWzJdIGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL2h0bWwv
djUuOS9wcm9jZXNzL2RlcHJlY2F0ZWQuaHRtbCN6ZXJvLWxlbmd0aC1hbmQtb25lLWVsZW1lbnQt
YXJyYXlzCgpMaW5rOiBodHRwczovL2dpdGh1Yi5jb20vS1NQUC9saW51eC9pc3N1ZXMvNzkKQnVp
bGQtdGVzdGVkLWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4KTGluazogaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC82MDM2NDdlNC5EZUVGYmw0ZXFsanV3QVVlJTI1bGtw
QGludGVsLmNvbS8KU2lnbmVkLW9mZi1ieTogR3VzdGF2byBBLiBSLiBTaWx2YSA8Z3VzdGF2b2Fy
c0BrZXJuZWwub3JnPgotLS0KIGZzL2YyZnMvZjJmcy5oICAgICAgICAgIHwgNSArKystLQogaW5j
bHVkZS9saW51eC9mMmZzX2ZzLmggfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9u
cygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9mcy9mMmZzL2YyZnMuaCBiL2ZzL2Yy
ZnMvZjJmcy5oCmluZGV4IGUyZDMwMmFlM2E0Ni4uM2Y1Y2IwOTdjMzBmIDEwMDY0NAotLS0gYS9m
cy9mMmZzL2YyZnMuaAorKysgYi9mcy9mMmZzL2YyZnMuaApAQCAtMjIxNSw2ICsyMjE1LDcgQEAg
c3RhdGljIGlubGluZSBibG9ja190IF9fY3BfcGF5bG9hZChzdHJ1Y3QgZjJmc19zYl9pbmZvICpz
YmkpCiBzdGF0aWMgaW5saW5lIHZvaWQgKl9fYml0bWFwX3B0cihzdHJ1Y3QgZjJmc19zYl9pbmZv
ICpzYmksIGludCBmbGFnKQogewogCXN0cnVjdCBmMmZzX2NoZWNrcG9pbnQgKmNrcHQgPSBGMkZT
X0NLUFQoc2JpKTsKKwl2b2lkICp0bXBfcHRyID0gJmNrcHQtPnNpdF9uYXRfdmVyc2lvbl9iaXRt
YXA7CiAJaW50IG9mZnNldDsKIAogCWlmIChpc19zZXRfY2twdF9mbGFncyhzYmksIENQX0xBUkdF
X05BVF9CSVRNQVBfRkxBRykpIHsKQEAgLTIyMjQsNyArMjIyNSw3IEBAIHN0YXRpYyBpbmxpbmUg
dm9pZCAqX19iaXRtYXBfcHRyKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgaW50IGZsYWcpCiAJ
CSAqIGlmIGxhcmdlX25hdF9iaXRtYXAgZmVhdHVyZSBpcyBlbmFibGVkLCBsZWF2ZSBjaGVja3N1
bQogCQkgKiBwcm90ZWN0aW9uIGZvciBhbGwgbmF0L3NpdCBiaXRtYXBzLgogCQkgKi8KLQkJcmV0
dXJuICZja3B0LT5zaXRfbmF0X3ZlcnNpb25fYml0bWFwICsgb2Zmc2V0ICsgc2l6ZW9mKF9fbGUz
Mik7CisJCXJldHVybiB0bXBfcHRyICsgb2Zmc2V0ICsgc2l6ZW9mKF9fbGUzMik7CiAJfQogCiAJ
aWYgKF9fY3BfcGF5bG9hZChzYmkpID4gMCkgewpAQCAtMjIzNSw3ICsyMjM2LDcgQEAgc3RhdGlj
IGlubGluZSB2b2lkICpfX2JpdG1hcF9wdHIoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBpbnQg
ZmxhZykKIAl9IGVsc2UgewogCQlvZmZzZXQgPSAoZmxhZyA9PSBOQVRfQklUTUFQKSA/CiAJCQls
ZTMyX3RvX2NwdShja3B0LT5zaXRfdmVyX2JpdG1hcF9ieXRlc2l6ZSkgOiAwOwotCQlyZXR1cm4g
JmNrcHQtPnNpdF9uYXRfdmVyc2lvbl9iaXRtYXAgKyBvZmZzZXQ7CisJCXJldHVybiB0bXBfcHRy
ICsgb2Zmc2V0OwogCX0KIH0KIApkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9mMmZzX2ZzLmgg
Yi9pbmNsdWRlL2xpbnV4L2YyZnNfZnMuaAppbmRleCBjNmNjMGE1NjZlZjUuLjU0ODdhODA2MTdh
MyAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9mMmZzX2ZzLmgKKysrIGIvaW5jbHVkZS9saW51
eC9mMmZzX2ZzLmgKQEAgLTE2OCw3ICsxNjgsNyBAQCBzdHJ1Y3QgZjJmc19jaGVja3BvaW50IHsK
IAl1bnNpZ25lZCBjaGFyIGFsbG9jX3R5cGVbTUFYX0FDVElWRV9MT0dTXTsKIAogCS8qIFNJVCBh
bmQgTkFUIHZlcnNpb24gYml0bWFwICovCi0JdW5zaWduZWQgY2hhciBzaXRfbmF0X3ZlcnNpb25f
Yml0bWFwWzFdOworCXVuc2lnbmVkIGNoYXIgc2l0X25hdF92ZXJzaW9uX2JpdG1hcFtdOwogfSBf
X3BhY2tlZDsKIAogI2RlZmluZSBDUF9DSEtTVU1fT0ZGU0VUCTQwOTIJLyogZGVmYXVsdCBjaGtz
dW0gb2Zmc2V0IGluIGNoZWNrcG9pbnQgKi8KLS0gCjIuMjcuMAoKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcg
bGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3Rz
LnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
