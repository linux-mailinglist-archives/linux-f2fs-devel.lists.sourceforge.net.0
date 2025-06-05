Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B1BACE89C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  5 Jun 2025 05:26:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VARfZvQfKBy9M8CkMmQ2EO7uoFpVQh2gv3WApLAVgKk=; b=A/VsM8pnI6dzmPNIPwFPuWCj5c
	zvKTWxA8/bGLVJg5J2Jh+ikGLvH/ANFDcfF3VRFNFEi+Xz2uekmoRz82H/jlViqLWhcKTIlNXFZi4
	byYCcyq72My7C//P6/+0/f428XIRTnRAGB+3GrbXh4UOWN/RpCr4WHdcY9ZNA2axZG5U=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uN1Ff-0002gO-SC;
	Thu, 05 Jun 2025 03:26:47 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uN1Ff-0002gI-75
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Jun 2025 03:26:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tifGNQTBnirI5UC1xtXY/MgLIEP+gh43UVV4iVKkT+o=; b=EnSQsNKMz9pXgdIz1+4y0lz6T7
 yO53tLk87qiuDpQHX8OPO/jsdci3e3Kq2lK1RJcGlyQbgLVeNC4WubBwnfTo1F7/bAJGyGLW6SJu6
 CpKyGTFzGakpKuQ4cbzPqRxo0As6xARDHdHfHQ1LCfUalyaSgtpIuMuELQ9CGTgbAxWA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=tifGNQTBnirI5UC1xtXY/MgLIEP+gh43UVV4iVKkT+o=; b=L
 L4XOG2OWvsLobHbvd8QFy18lVIJiHvQFuWdWwi363eOFwGOgjX82HqShjrbUTGT4VWnkun02ekvk/
 HOGKifHM4Pc4+e2BJ1Kn9jJRJtF7XjcaKzdFED2J3/8VqMw7wFjwwO/diaSZBcw/b5sAMsSpMXwGi
 Tq/TsF93/0XALdCw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uN1Fe-00081g-Kn for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Jun 2025 03:26:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 745DE5C31BC
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  5 Jun 2025 03:24:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83AB5C4CEE4;
 Thu,  5 Jun 2025 03:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749094000;
 bh=amdy+vC90TIDwJevb0wzptOLcp9AWTshWlmocsdoUYQ=;
 h=From:To:Cc:Subject:Date:From;
 b=E6p2b2BUKZU7SIgrgPzep7EcX9jhRdUs3FcEM4fasZDV1pQiXx4Vx0434z6CZPTmu
 GJlm6QmZDi7/ZOTHRBuVwmBbdM5btAe8+oszDK63/QzXE4ZHJh6Fl+4D0sRElecgFy
 hfPQRwjN2lWOQvQYMsLRPcJt1Z7ENBayK/Etl9HM1Dc7+GnFVpxYfQJl4/WFa9FxeP
 zov5XBkOGapk2IWpLfbnTqJ0zJmEzjcbIO/QwnnGSXoKyJo+bWrrYWViJIVSSZZw+5
 /jTccRoHsnrTYW233p5dg9b+YX124uZgnuoB6cQ/1LgkxEcXwljP3sD0kN8AFdyNuG
 BZymWaQPgY6Cw==
To: jaegeuk@kernel.org
Date: Thu,  5 Jun 2025 11:26:33 +0800
Message-ID: <20250605032633.2744434-1-chao@kernel.org>
X-Mailer: git-send-email 2.49.0.1266.g31b7d2e469-goog
MIME-Version: 1.0
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  fstest reports a f2fs bug: generic/363 42s ... [failed, exit
 status 1]- output mismatch (see
 /share/git/fstests/results//generic/363.out.bad)
 --- tests/generic/363.out 2025-01-12 21:57:40.271440542 +0800 +++
 /share/git/fstests/ [...] 
 Content analysis details:   (-0.5 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uN1Fe-00081g-Kn
Subject: [f2fs-dev] [PATCH v3] f2fs: fix to zero post-eof page
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: stable@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

ZnN0ZXN0IHJlcG9ydHMgYSBmMmZzIGJ1ZzoKCmdlbmVyaWMvMzYzIDQycyAuLi4gW2ZhaWxlZCwg
ZXhpdCBzdGF0dXMgMV0tIG91dHB1dCBtaXNtYXRjaCAoc2VlIC9zaGFyZS9naXQvZnN0ZXN0cy9y
ZXN1bHRzLy9nZW5lcmljLzM2My5vdXQuYmFkKQogICAgLS0tIHRlc3RzL2dlbmVyaWMvMzYzLm91
dCAgIDIwMjUtMDEtMTIgMjE6NTc6NDAuMjcxNDQwNTQyICswODAwCiAgICArKysgL3NoYXJlL2dp
dC9mc3Rlc3RzL3Jlc3VsdHMvL2dlbmVyaWMvMzYzLm91dC5iYWQgMjAyNS0wNS0xOSAxOTo1NTo1
OC4wMDAwMDAwMDAgKzA4MDAKICAgIEBAIC0xLDIgKzEsNzggQEAKICAgICBRQSBvdXRwdXQgY3Jl
YXRlZCBieSAzNjMKICAgICBmc3ggLXEgLVMgMCAtZSAxIC1OIDEwMDAwMAogICAgK1JFQUQgQkFE
IERBVEE6IG9mZnNldCA9IDB4ZDZmYiwgc2l6ZSA9IDB4ZjA0NCwgZm5hbWUgPSAvbW50L2YyZnMv
anVuawogICAgK09GRlNFVCAgICAgIEdPT0QgICAgQkFEICAgICBSQU5HRQogICAgKzB4MTU0MGQg
ICAgIDB4MDAwMCAgMHgyYTI1ICAweDAKICAgICtvcGVyYXRpb24jIChtb2QgMjU2KSBmb3IgdGhl
IGJhZCBkYXRhIG1heSBiZSAzNwogICAgKzB4MTU0MGUgICAgIDB4MDAwMCAgMHgyNTI3ICAweDEK
ICAgIC4uLgogICAgKFJ1biAnZGlmZiAtdSAvc2hhcmUvZ2l0L2ZzdGVzdHMvdGVzdHMvZ2VuZXJp
Yy8zNjMub3V0IC9zaGFyZS9naXQvZnN0ZXN0cy9yZXN1bHRzLy9nZW5lcmljLzM2My5vdXQuYmFk
JyAgdG8gc2VlIHRoZSBlbnRpcmUgZGlmZikKUmFuOiBnZW5lcmljLzM2MwpGYWlsdXJlczogZ2Vu
ZXJpYy8zNjMKRmFpbGVkIDEgb2YgMSB0ZXN0cwoKVGhlIHJvb3QgY2F1c2UgaXMgdXNlciBjYW4g
dXBkYXRlIHBvc3QtZW9mIHBhZ2UgdmlhIG1tYXAgWzFdLCBob3dldmVyLCBmMmZzCm1pc3NlZCB0
byB6ZXJvIHBvc3QtZW9mIHBhZ2UgaW4gYmVsb3cgb3BlcmF0aW9ucywgc28sIG9uY2UgaXQgZXhw
YW5kcyBpX3NpemUsCnRoZW4gaXQgd2lsbCBpbmNsdWRlIGR1bW15IGRhdGEgbG9jYXRlcyBwcmV2
aW91cyBwb3N0LWVvZiBwYWdlLCBzbyBkdXJpbmcKYmVsb3cgb3BlcmF0aW9ucywgd2UgbmVlZCB0
byB6ZXJvIHBvc3QtZW9mIHBhZ2UuCgpPcGVyYXRpb25zIHdoaWNoIGNhbiBpbmNsdWRlIGR1bW15
IGRhdGEgYWZ0ZXIgcHJldmlvdXMgaV9zaXplIGFmdGVyIGV4cGFuZGluZwppX3NpemU6Ci0gd3Jp
dGUKLSBtYXB3cml0ZSBbMV0KLSB0cnVuY2F0ZQotIGZhbGxvY2F0ZQogKiBwcmVhbGxvY2F0ZQog
KiB6ZXJvX3JhbmdlCiAqIGluc2VydF9yYW5nZQogKiBjb2xsYXBzZV9yYW5nZQotIGNsb25lX3Jh
bmdlIChkb2VzbuKAmXQgc3VwcG9ydCBpbiBmMmZzKQotIGNvcHlfcmFuZ2UgKGRvZXNu4oCZdCBz
dXBwb3J0IGluIGYyZnMpCgpbMV0gaHR0cHM6Ly9tYW43Lm9yZy9saW51eC9tYW4tcGFnZXMvbWFu
Mi9tbWFwLjIuaHRtbCAnQlVHIHNlY3Rpb24nCgpDYzogc3RhYmxlQGtlcm5lbC5vcmcKU2lnbmVk
LW9mZi1ieTogQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPgotLS0KdjM6Ci0gZml4IGNoZWNrIGNv
bmRpdGlvbiBpbiBmMmZzX3plcm9fcG9zdF9lb2ZfcGFnZSgpCi0gZml4IHdyb25nIHBhcmFtZXRl
ciBwYXNzZWQgZnJvbSBmMmZzX3NldGF0dHIoKSB0bwotIGFkZCBhIHJlZmVyZW5jZQpmMmZzX3pl
cm9fcG9zdF9lb2ZfcGFnZSgpCiBmcy9mMmZzL2ZpbGUuYyB8IDM4ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMzggaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZmlsZS5jIGIvZnMvZjJmcy9maWxlLmMKaW5kZXggNmJkM2Rl
NjRmMmE4Li42OTYxMzFlNjU1ZWQgMTAwNjQ0Ci0tLSBhL2ZzL2YyZnMvZmlsZS5jCisrKyBiL2Zz
L2YyZnMvZmlsZS5jCkBAIC0zNSw2ICszNSwxNyBAQAogI2luY2x1ZGUgPHRyYWNlL2V2ZW50cy9m
MmZzLmg+CiAjaW5jbHVkZSA8dWFwaS9saW51eC9mMmZzLmg+CiAKK3N0YXRpYyB2b2lkIGYyZnNf
emVyb19wb3N0X2VvZl9wYWdlKHN0cnVjdCBpbm9kZSAqaW5vZGUsIGxvZmZfdCBuZXdfc2l6ZSkK
K3sKKwlsb2ZmX3Qgb2xkX3NpemUgPSBpX3NpemVfcmVhZChpbm9kZSk7CisKKwlpZiAob2xkX3Np
emUgPj0gbmV3X3NpemUpCisJCXJldHVybjsKKworCS8qIHplcm8gb3IgZHJvcCBwYWdlcyBvbmx5
IGluIHJhbmdlIG9mIFtvbGRfc2l6ZSwgbmV3X3NpemVdICovCisJdHJ1bmNhdGVfcGFnZWNhY2hl
KGlub2RlLCBvbGRfc2l6ZSk7Cit9CisKIHN0YXRpYyB2bV9mYXVsdF90IGYyZnNfZmlsZW1hcF9m
YXVsdChzdHJ1Y3Qgdm1fZmF1bHQgKnZtZikKIHsKIAlzdHJ1Y3QgaW5vZGUgKmlub2RlID0gZmls
ZV9pbm9kZSh2bWYtPnZtYS0+dm1fZmlsZSk7CkBAIC0xMDMsOCArMTE0LDEzIEBAIHN0YXRpYyB2
bV9mYXVsdF90IGYyZnNfdm1fcGFnZV9ta3dyaXRlKHN0cnVjdCB2bV9mYXVsdCAqdm1mKQogCiAJ
ZjJmc19idWdfb24oc2JpLCBmMmZzX2hhc19pbmxpbmVfZGF0YShpbm9kZSkpOwogCisJZmlsZW1h
cF9pbnZhbGlkYXRlX2xvY2soaW5vZGUtPmlfbWFwcGluZyk7CisJZjJmc196ZXJvX3Bvc3RfZW9m
X3BhZ2UoaW5vZGUsIChmb2xpby0+aW5kZXggKyAxKSA8PCBQQUdFX1NISUZUKTsKKwlmaWxlbWFw
X2ludmFsaWRhdGVfdW5sb2NrKGlub2RlLT5pX21hcHBpbmcpOworCiAJZmlsZV91cGRhdGVfdGlt
ZSh2bWYtPnZtYS0+dm1fZmlsZSk7CiAJZmlsZW1hcF9pbnZhbGlkYXRlX2xvY2tfc2hhcmVkKGlu
b2RlLT5pX21hcHBpbmcpOworCiAJZm9saW9fbG9jayhmb2xpbyk7CiAJaWYgKHVubGlrZWx5KGZv
bGlvLT5tYXBwaW5nICE9IGlub2RlLT5pX21hcHBpbmcgfHwKIAkJCWZvbGlvX3Bvcyhmb2xpbykg
PiBpX3NpemVfcmVhZChpbm9kZSkgfHwKQEAgLTExMDksNiArMTEyNSw4IEBAIGludCBmMmZzX3Nl
dGF0dHIoc3RydWN0IG1udF9pZG1hcCAqaWRtYXAsIHN0cnVjdCBkZW50cnkgKmRlbnRyeSwKIAkJ
ZjJmc19kb3duX3dyaXRlKCZmaS0+aV9nY19yd3NlbVtXUklURV0pOwogCQlmaWxlbWFwX2ludmFs
aWRhdGVfbG9jayhpbm9kZS0+aV9tYXBwaW5nKTsKIAorCQlpZiAoYXR0ci0+aWFfc2l6ZSA+IG9s
ZF9zaXplKQorCQkJZjJmc196ZXJvX3Bvc3RfZW9mX3BhZ2UoaW5vZGUsIGF0dHItPmlhX3NpemUp
OwogCQl0cnVuY2F0ZV9zZXRzaXplKGlub2RlLCBhdHRyLT5pYV9zaXplKTsKIAogCQlpZiAoYXR0
ci0+aWFfc2l6ZSA8PSBvbGRfc2l6ZSkKQEAgLTEyMjcsNiArMTI0NSwxMCBAQCBzdGF0aWMgaW50
IGYyZnNfcHVuY2hfaG9sZShzdHJ1Y3QgaW5vZGUgKmlub2RlLCBsb2ZmX3Qgb2Zmc2V0LCBsb2Zm
X3QgbGVuKQogCWlmIChyZXQpCiAJCXJldHVybiByZXQ7CiAKKwlmaWxlbWFwX2ludmFsaWRhdGVf
bG9jayhpbm9kZS0+aV9tYXBwaW5nKTsKKwlmMmZzX3plcm9fcG9zdF9lb2ZfcGFnZShpbm9kZSwg
b2Zmc2V0ICsgbGVuKTsKKwlmaWxlbWFwX2ludmFsaWRhdGVfdW5sb2NrKGlub2RlLT5pX21hcHBp
bmcpOworCiAJcGdfc3RhcnQgPSAoKHVuc2lnbmVkIGxvbmcgbG9uZykgb2Zmc2V0KSA+PiBQQUdF
X1NISUZUOwogCXBnX2VuZCA9ICgodW5zaWduZWQgbG9uZyBsb25nKSBvZmZzZXQgKyBsZW4pID4+
IFBBR0VfU0hJRlQ7CiAKQEAgLTE1MTAsNiArMTUzMiw4IEBAIHN0YXRpYyBpbnQgZjJmc19kb19j
b2xsYXBzZShzdHJ1Y3QgaW5vZGUgKmlub2RlLCBsb2ZmX3Qgb2Zmc2V0LCBsb2ZmX3QgbGVuKQog
CWYyZnNfZG93bl93cml0ZSgmRjJGU19JKGlub2RlKS0+aV9nY19yd3NlbVtXUklURV0pOwogCWZp
bGVtYXBfaW52YWxpZGF0ZV9sb2NrKGlub2RlLT5pX21hcHBpbmcpOwogCisJZjJmc196ZXJvX3Bv
c3RfZW9mX3BhZ2UoaW5vZGUsIG9mZnNldCArIGxlbik7CisKIAlmMmZzX2xvY2tfb3Aoc2JpKTsK
IAlmMmZzX2Ryb3BfZXh0ZW50X3RyZWUoaW5vZGUpOwogCXRydW5jYXRlX3BhZ2VjYWNoZShpbm9k
ZSwgb2Zmc2V0KTsKQEAgLTE2MzEsNiArMTY1NSwxMCBAQCBzdGF0aWMgaW50IGYyZnNfemVyb19y
YW5nZShzdHJ1Y3QgaW5vZGUgKmlub2RlLCBsb2ZmX3Qgb2Zmc2V0LCBsb2ZmX3QgbGVuLAogCWlm
IChyZXQpCiAJCXJldHVybiByZXQ7CiAKKwlmaWxlbWFwX2ludmFsaWRhdGVfbG9jayhtYXBwaW5n
KTsKKwlmMmZzX3plcm9fcG9zdF9lb2ZfcGFnZShpbm9kZSwgb2Zmc2V0ICsgbGVuKTsKKwlmaWxl
bWFwX2ludmFsaWRhdGVfdW5sb2NrKG1hcHBpbmcpOworCiAJcGdfc3RhcnQgPSAoKHVuc2lnbmVk
IGxvbmcgbG9uZykgb2Zmc2V0KSA+PiBQQUdFX1NISUZUOwogCXBnX2VuZCA9ICgodW5zaWduZWQg
bG9uZyBsb25nKSBvZmZzZXQgKyBsZW4pID4+IFBBR0VfU0hJRlQ7CiAKQEAgLTE3NjIsNiArMTc5
MCw4IEBAIHN0YXRpYyBpbnQgZjJmc19pbnNlcnRfcmFuZ2Uoc3RydWN0IGlub2RlICppbm9kZSwg
bG9mZl90IG9mZnNldCwgbG9mZl90IGxlbikKIAkvKiBhdm9pZCBnYyBvcGVyYXRpb24gZHVyaW5n
IGJsb2NrIGV4Y2hhbmdlICovCiAJZjJmc19kb3duX3dyaXRlKCZGMkZTX0koaW5vZGUpLT5pX2dj
X3J3c2VtW1dSSVRFXSk7CiAJZmlsZW1hcF9pbnZhbGlkYXRlX2xvY2sobWFwcGluZyk7CisKKwlm
MmZzX3plcm9fcG9zdF9lb2ZfcGFnZShpbm9kZSwgb2Zmc2V0ICsgbGVuKTsKIAl0cnVuY2F0ZV9w
YWdlY2FjaGUoaW5vZGUsIG9mZnNldCk7CiAKIAl3aGlsZSAoIXJldCAmJiBpZHggPiBwZ19zdGFy
dCkgewpAQCAtMTgxOSw2ICsxODQ5LDEwIEBAIHN0YXRpYyBpbnQgZjJmc19leHBhbmRfaW5vZGVf
ZGF0YShzdHJ1Y3QgaW5vZGUgKmlub2RlLCBsb2ZmX3Qgb2Zmc2V0LAogCWlmIChlcnIpCiAJCXJl
dHVybiBlcnI7CiAKKwlmaWxlbWFwX2ludmFsaWRhdGVfbG9jayhpbm9kZS0+aV9tYXBwaW5nKTsK
KwlmMmZzX3plcm9fcG9zdF9lb2ZfcGFnZShpbm9kZSwgb2Zmc2V0ICsgbGVuKTsKKwlmaWxlbWFw
X2ludmFsaWRhdGVfdW5sb2NrKGlub2RlLT5pX21hcHBpbmcpOworCiAJZjJmc19iYWxhbmNlX2Zz
KHNiaSwgdHJ1ZSk7CiAKIAlwZ19zdGFydCA9ICgodW5zaWduZWQgbG9uZyBsb25nKW9mZnNldCkg
Pj4gUEFHRV9TSElGVDsKQEAgLTQ4NjAsNiArNDg5NCwxMCBAQCBzdGF0aWMgc3NpemVfdCBmMmZz
X3dyaXRlX2NoZWNrcyhzdHJ1Y3Qga2lvY2IgKmlvY2IsIHN0cnVjdCBpb3ZfaXRlciAqZnJvbSkK
IAllcnIgPSBmaWxlX21vZGlmaWVkKGZpbGUpOwogCWlmIChlcnIpCiAJCXJldHVybiBlcnI7CisK
KwlmaWxlbWFwX2ludmFsaWRhdGVfbG9jayhpbm9kZS0+aV9tYXBwaW5nKTsKKwlmMmZzX3plcm9f
cG9zdF9lb2ZfcGFnZShpbm9kZSwgaW9jYi0+a2lfcG9zICsgaW92X2l0ZXJfY291bnQoZnJvbSkp
OworCWZpbGVtYXBfaW52YWxpZGF0ZV91bmxvY2soaW5vZGUtPmlfbWFwcGluZyk7CiAJcmV0dXJu
IGNvdW50OwogfQogCi0tIAoyLjQ5LjAKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJm
cy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5u
ZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
