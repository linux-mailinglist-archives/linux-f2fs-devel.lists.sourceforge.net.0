Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2F7A175E7
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Jan 2025 03:16:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ta3op-0007jb-7W;
	Tue, 21 Jan 2025 02:16:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Zhiguo.Niu@unisoc.com>) id 1ta3on-0007jV-Cz
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Jan 2025 02:16:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LMN0Rb/9BxJnZmTPrbOncZVPwiBhiZjfDOJF6zVtjc8=; b=iDwyPCpRK65YSwl3omEYyS4mjk
 t8Rl+TtaMkhY7k9a+ctCxuac8dG0DN+UZOzHZSWwCnSJLgvyDouvagWXiyYVC5Yf6AsmzfWf6UUv4
 xuBZzJ4BdFfulmVEEocKRRRkf6HL8Q30WKJvXrc7U3rTimvl9bJNhyrHKFfaamWiqazw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=LMN0Rb/9BxJnZmTPrbOncZVPwiBhiZjfDOJF6zVtjc8=; b=O
 gX1uyPTWW7p0qcCnq1/zVwiaX4e4+KYNI+nXDusQkhMP2h0xIPNtITo0hh2G/mdTj+iulTBfOOX30
 TvMeVC8sSWOhD0fITgkNWwgjJF0M404XlS79AC8ZpxBxgzSOsrrOJH3R2Fx9hucviiHyuDlLjogon
 H4t5ADJrg7FhdjXs=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ta3ol-0002u8-SU for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Jan 2025 02:16:41 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 50L2G3d2021703;
 Tue, 21 Jan 2025 10:16:03 +0800 (+08)
 (envelope-from Zhiguo.Niu@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx02.spreadtrum.com [10.0.64.8])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4YcW1z1j65z2Mx5Jb;
 Tue, 21 Jan 2025 10:12:39 +0800 (CST)
Received: from bj08434pcu.spreadtrum.com (10.0.73.87) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Tue, 21 Jan 2025 10:16:00 +0800
From: Zhiguo Niu <zhiguo.niu@unisoc.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Tue, 21 Jan 2025 10:15:41 +0800
Message-ID: <1737425741-3004-1-git-send-email-zhiguo.niu@unisoc.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.0.73.87]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL: SHSQR01.spreadtrum.com 50L2G3d2021703
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The following two 'check only recovery' processes are very
 dependent on the return value of f2fs_recover_fsync_data, especially when
 the return value is greater than 0. 1. when device has readonly mod [...]
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [222.66.158.135 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [222.66.158.135 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1ta3ol-0002u8-SU
Subject: [f2fs-dev] [PATCH] f2fs: fix to avoid changing 'check only' behaior
 of recovery
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
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, zhiguo.niu@unisoc.com,
 Hao_hao.Wang@unisoc.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

VGhlIGZvbGxvd2luZyB0d28gJ2NoZWNrIG9ubHkgcmVjb3ZlcnknIHByb2Nlc3NlcyBhcmUgdmVy
eSBkZXBlbmRlbnQgb24KdGhlIHJldHVybiB2YWx1ZSBvZiBmMmZzX3JlY292ZXJfZnN5bmNfZGF0
YSwgZXNwZWNpYWxseSB3aGVuIHRoZSByZXR1cm4KdmFsdWUgaXMgZ3JlYXRlciB0aGFuIDAuCjEu
IHdoZW4gZGV2aWNlIGhhcyByZWFkb25seSBtb2RlLCBzaG93biBhcyBjb21taXQKMjM3MzhlNzQ0
NzJmICgiZjJmczogZml4IHRvIHJlc3RyaWN0IG1vdW50IGNvbmRpdGlvbiBvbiByZWFkb25seSBi
bG9jayBkZXZpY2UiKQoyLiBtb3VudCBvcHRpb250IE5PUkVDT1ZFUlkgb3IgRElTQUJMRV9ST0xM
X0ZPUldBUkQgaXMgc2V0LCBzaG93biBhcyBjb21taXQKNjc4MWVhYmJhMWJkICgiZjJmczogZ2l2
ZSAtRUlOVkFMIGZvciBub3JlY292ZXJ5IGFuZCBydyBtb3VudCIpCgpIb3dldmVyLCBjb21taXQg
YzQyNmQ5OTEyN2IxICgiZjJmczogQ2hlY2sgd3JpdGUgcG9pbnRlciBjb25zaXN0ZW5jeSBvZiBv
cGVuIHpvbmVzIikKd2lsbCBjaGFuZ2UgdGhlIHJldHVybiB2YWx1ZSB1bmV4cGVjdGVkbHksIHRo
ZXJlYnkgY2hhbmdpbmcgdGhlIGNhbGxlcidzIGJlaGF2aW9yCgpUaGlzIHBhdGNoIGxldCB0aGUg
ZjJmc19yZWNvdmVyX2ZzeW5jX2RhdGEgcmV0dXJuIGNvcnJlY3QgdmFsdWUsYW5kIG5vdCBkbwpm
MmZzX2NoZWNrX2FuZF9maXhfd3JpdGVfcG9pbnRlciB3aGVuIHRoZSBkZXZpY2UgaXMgcmVhZC1v
bmx5LgoKRml4ZXM6IGM0MjZkOTkxMjdiMSAoImYyZnM6IENoZWNrIHdyaXRlIHBvaW50ZXIgY29u
c2lzdGVuY3kgb2Ygb3BlbiB6b25lcyIpClNpZ25lZC1vZmYtYnk6IFpoaWd1byBOaXUgPHpoaWd1
by5uaXVAdW5pc29jLmNvbT4KLS0tCiBmcy9mMmZzL3JlY292ZXJ5LmMgfCA0ICstLS0KIGZzL2Yy
ZnMvc2VnbWVudC5jICB8IDQgKysrLQogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyks
IDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZnMvZjJmcy9yZWNvdmVyeS5jIGIvZnMvZjJm
cy9yZWNvdmVyeS5jCmluZGV4IGYzNWJlMmMuLjY5YTIwMjcgMTAwNjQ0Ci0tLSBhL2ZzL2YyZnMv
cmVjb3ZlcnkuYworKysgYi9mcy9mMmZzL3JlY292ZXJ5LmMKQEAgLTg5OSwxMCArODk5LDggQEAg
aW50IGYyZnNfcmVjb3Zlcl9mc3luY19kYXRhKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgYm9v
bCBjaGVja19vbmx5KQogICAgICAgICAqIGFuZCB0aGUgZjJmcyBpcyBub3QgcmVhZCBvbmx5LCBj
aGVjayBhbmQgZml4IHpvbmVkIGJsb2NrIGRldmljZXMnCiAgICAgICAgICogd3JpdGUgcG9pbnRl
ciBjb25zaXN0ZW5jeS4KICAgICAgICAgKi8KLSAgICAgICBpZiAoIWVycikgeworICAgICAgIGlm
ICghZXJyKQogICAgICAgICAgICAgICAgZXJyID0gZjJmc19jaGVja19hbmRfZml4X3dyaXRlX3Bv
aW50ZXIoc2JpKTsKLSAgICAgICAgICAgICAgIHJldCA9IGVycjsKLSAgICAgICB9CgogICAgICAg
IGlmICghZXJyKQogICAgICAgICAgICAgICAgY2xlYXJfc2JpX2ZsYWcoc2JpLCBTQklfUE9SX0RP
SU5HKTsKZGlmZiAtLWdpdCBhL2ZzL2YyZnMvc2VnbWVudC5jIGIvZnMvZjJmcy9zZWdtZW50LmMK
aW5kZXggODEzMjU0ZC4uYzliNmQ5YSAxMDA2NDQKLS0tIGEvZnMvZjJmcy9zZWdtZW50LmMKKysr
IGIvZnMvZjJmcy9zZWdtZW50LmMKQEAgLTU0NjIsNyArNTQ2Miw5IEBAIGludCBmMmZzX2NoZWNr
X2FuZF9maXhfd3JpdGVfcG9pbnRlcihzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkpCiB7CiAgICAg
ICAgaW50IHJldDsKCi0gICAgICAgaWYgKCFmMmZzX3NiX2hhc19ibGt6b25lZChzYmkpIHx8IGYy
ZnNfcmVhZG9ubHkoc2JpLT5zYikpCisgICAgICAgaWYgKCFmMmZzX3NiX2hhc19ibGt6b25lZChz
YmkpIHx8CisgICAgICAgICAgICAgICBmMmZzX3JlYWRvbmx5KHNiaS0+c2IpIHx8CisgICAgICAg
ICAgICAgICBmMmZzX2h3X2lzX3JlYWRvbmx5KHNiaSkpCiAgICAgICAgICAgICAgICByZXR1cm4g
MDsKCiAgICAgICAgZjJmc19ub3RpY2Uoc2JpLCAiQ2hlY2tpbmcgZW50aXJlIHdyaXRlIHBvaW50
ZXJzIik7Ci0tCjEuOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwogVGhpcyBl
bWFpbCAoaW5jbHVkaW5nIGl0cyBhdHRhY2htZW50cykgaXMgaW50ZW5kZWQgb25seSBmb3IgdGhl
IHBlcnNvbiBvciBlbnRpdHkgdG8gd2hpY2ggaXQgaXMgYWRkcmVzc2VkIGFuZCBtYXkgY29udGFp
biBpbmZvcm1hdGlvbiB0aGF0IGlzIHByaXZpbGVnZWQsIGNvbmZpZGVudGlhbCBvciBvdGhlcndp
c2UgcHJvdGVjdGVkIGZyb20gZGlzY2xvc3VyZS4gVW5hdXRob3JpemVkIHVzZSwgZGlzc2VtaW5h
dGlvbiwgZGlzdHJpYnV0aW9uIG9yIGNvcHlpbmcgb2YgdGhpcyBlbWFpbCBvciB0aGUgaW5mb3Jt
YXRpb24gaGVyZWluIG9yIHRha2luZyBhbnkgYWN0aW9uIGluIHJlbGlhbmNlIG9uIHRoZSBjb250
ZW50cyBvZiB0aGlzIGVtYWlsIG9yIHRoZSBpbmZvcm1hdGlvbiBoZXJlaW4sIGJ5IGFueW9uZSBv
dGhlciB0aGFuIHRoZSBpbnRlbmRlZCByZWNpcGllbnQsIG9yIGFuIGVtcGxveWVlIG9yIGFnZW50
IHJlc3BvbnNpYmxlIGZvciBkZWxpdmVyaW5nIHRoZSBtZXNzYWdlIHRvIHRoZSBpbnRlbmRlZCBy
ZWNpcGllbnQsIGlzIHN0cmljdGx5IHByb2hpYml0ZWQuIElmIHlvdSBhcmUgbm90IHRoZSBpbnRl
bmRlZCByZWNpcGllbnQsIHBsZWFzZSBkbyBub3QgcmVhZCwgY29weSwgdXNlIG9yIGRpc2Nsb3Nl
IGFueSBwYXJ0IG9mIHRoaXMgZS1tYWlsIHRvIG90aGVycy4gUGxlYXNlIG5vdGlmeSB0aGUgc2Vu
ZGVyIGltbWVkaWF0ZWx5IGFuZCBwZXJtYW5lbnRseSBkZWxldGUgdGhpcyBlLW1haWwgYW5kIGFu
eSBhdHRhY2htZW50cyBpZiB5b3UgcmVjZWl2ZWQgaXQgaW4gZXJyb3IuIEludGVybmV0IGNvbW11
bmljYXRpb25zIGNhbm5vdCBiZSBndWFyYW50ZWVkIHRvIGJlIHRpbWVseSwgc2VjdXJlLCBlcnJv
ci1mcmVlIG9yIHZpcnVzLWZyZWUuIFRoZSBzZW5kZXIgZG9lcyBub3QgYWNjZXB0IGxpYWJpbGl0
eSBmb3IgYW55IGVycm9ycyBvciBvbWlzc2lvbnMuCuacrOmCruS7tuWPiuWFtumZhOS7tuWFt+ac
ieS/neWvhuaAp+i0qO+8jOWPl+azleW+i+S/neaKpOS4jeW+l+azhOmcsu+8jOS7heWPkemAgee7
meacrOmCruS7tuaJgOaMh+eJueWumuaUtuS7tuS6uuOAguS4peemgemdnue7j+aOiOadg+S9v+eU
qOOAgeWuo+S8oOOAgeWPkeW4g+aIluWkjeWItuacrOmCruS7tuaIluWFtuWGheWuueOAguiLpemd
nuivpeeJueWumuaUtuS7tuS6uu+8jOivt+WLv+mYheivu+OAgeWkjeWItuOAgSDkvb/nlKjmiJbm
iqvpnLLmnKzpgq7ku7bnmoTku7vkvZXlhoXlrrnjgILoi6Xor6/mlLbmnKzpgq7ku7bvvIzor7fk
u47ns7vnu5/kuK3msLjkuYXmgKfliKDpmaTmnKzpgq7ku7blj4rmiYDmnInpmYTku7bvvIzlubbk
u6Xlm57lpI3pgq7ku7bnmoTmlrnlvI/ljbPliLvlkYrnn6Xlj5Hku7bkurrjgILml6Dms5Xkv53o
r4HkupLogZTnvZHpgJrkv6Hlj4rml7bjgIHlronlhajjgIHml6Dor6/miJbpmLLmr5LjgILlj5Hk
u7bkurrlr7nku7vkvZXplJnmvI/lnYfkuI3mib/mi4XotKPku7vjgIIKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxp
bmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xp
c3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
