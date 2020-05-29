Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDEF1E8930
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 May 2020 22:49:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jelwE-0003KD-5t; Fri, 29 May 2020 20:49:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jelwD-0003K7-MK
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 29 May 2020 20:49:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jvpGbyJmdX9wJbkII15cGI5UTFMJvf2b5C5Q31hPh4A=; b=m1n+lBH7UXo04uk1gxGy+9FhmP
 o67E3EPrTo02CW6w6/6m2bL5mpyX4LAWJb643dm2WoYmvYmTQRFswvCTtOeJP+FwBlvdgCdhdliE2
 XUljsYesr0bnmCDt5EGURIRvjV+tA063YCnZoaCYpWKhsx4a5ihUvIK3+q4+FzGz6I0A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=jvpGbyJmdX9wJbkII15cGI5UTFMJvf2b5C5Q31hPh4A=; b=j
 9Mj/mMwV8dM96g9VAx2TQ5umKYtvDCQr5j/12ulpW0nkV6awh4DEmmPc+iCnZ01py1B4ayk2Y/hFs
 Q7l08YZmVsQSjtWzaMTLuu+ACIF7BpBWnFAMNQ1Vx+/ENWiAs7h+6wLyzzksz3HuRfVT3y7o8CH9t
 +IlftU/OBBYoKenI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jelwA-0009Ze-Sr
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 29 May 2020 20:49:09 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 82D38207BC;
 Fri, 29 May 2020 20:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590785336;
 bh=OrXcLTjnHoOMqDVc0Rvej4SxdBia1jRzd8ZCFORUllk=;
 h=From:To:Cc:Subject:Date:From;
 b=VRYRn+X/QvHO98wQpMVG29lxhzUe5GECU8Vq/eI5cqOcqfkuXJoN4rxHvd7mOVr+r
 fW7M9TRcdXQAnIZPa0/JBwdfMSmAWOtnnU/rJZzhzR/gLbACvmiyjekmniS3IhPsQ5
 SFyOtbCfVlqb3DzPwrTfiFy0cCnP43YuoEmDYSuM=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Fri, 29 May 2020 13:47:38 -0700
Message-Id: <20200529204738.52339-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.27.0.rc0.183.gde8f92d652-goog
MIME-Version: 1.0
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jelwA-0009Ze-Sr
Subject: [f2fs-dev] [PATCH] fsck.f2fs: fix dirent position check for
 encrypted+casefolded dentries
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
Cc: Daniel Rosenberg <drosen@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

RnJvbTogRXJpYyBCaWdnZXJzIDxlYmlnZ2Vyc0Bnb29nbGUuY29tPgoKZnNjay5mMmZzIHJlcG9y
dHMgY29ycnVwdGlvbiBpZiB0aGUgZmlsZXN5c3RlbSBjb250YWlucyBhbnkgZW5jcnlwdGVkICsK
Y2FzZWZvbGRlZCBkaXJlY3RvcmllcyB3aXRoIGFueSBzdWJzdGFudGlhbCBudW1iZXIgb2YgZGVu
dHJpZXM6CgogICAgW0FTU0VSVF0gKGYyZnNfY2hlY2tfZGlyZW50X3Bvc2l0aW9uOjEzNzQpICAt
LT4gV3JvbmcgcG9zaXRpb24gb2YgZGlyZW50IHBpbm86OCwgbmFtZTrbn++/vVtJ77+9Xirvv70o
77+9NX7vv71977+9RO+/ve+/vSNdN++/vTjvv73Lju+/vSwgbGV2ZWw6MSwgZGlyX2xldmVsOjAs
IHBnb2ZzOjQsIGNvcnJlY3QgcmFuZ2U6WzIsIDNdCgpUaGUgcHJvYmxlbSBpcyB0aGF0IGYyZnNf
Y2hlY2tfZGlyZW50X3Bvc2l0aW9uKCkgY29tcHV0ZXMgdGhlIHdyb25nIGhhc2gKZm9yIGVuY3J5
cHRlZCtjYXNlZm9sZGVkIGRlbnRyaWVzLiAgSXQncyBub3QgYWN0dWFsbHkgcG9zc2libGUgZm9y
IGl0IHRvCmNvbXB1dGUgdGhlIGNvcnJlY3QgaGFzaCwgYmVjYXVzZSBpdCB3b3VsZCBuZWVkIHRo
ZSBlbmNyeXB0aW9uIGtleS4KCkhvd2V2ZXIsIHRoZSBvbi1kaXNrIGRlbnRyeSBhbHJlYWR5IGNv
bnRhaW5zIHRoZSBoYXNoIGNvZGUsIGFuZCBpdHMKY29ycmVjdG5lc3Mgd2FzIGFscmVhZHkgdmVy
aWZpZWQgYnkgZjJmc19jaGVja19oYXNoX2NvZGUoKSBpZiBwb3NzaWJsZS4KClNvLCBtYWtlIGYy
ZnNfY2hlY2tfZGlyZW50X3Bvc2l0aW9uKCkgdXNlIHRoZSBoYXNoIGNvZGUgZnJvbSBkaXNrIHJh
dGhlcgp0aGFuIHJlY29tcHV0ZSBpdC4KCkFsc28gZml4IGl0IHRvIHByaW50IHRoZSBmaWxlbmFt
ZSBpbiBodW1hbi1yZWFkYWJsZSBmb3JtLgoKVGhpcyBidWcgd2FzIGNhdXNpbmcgJ2t2bS14ZnN0
ZXN0cyAtYyBmMmZzL2VuY3J5cHQgLWcgY2FzZWZvbGQnCnRvIGZhaWwgd2l0aCB0aGUgdGVzdF9k
dW1teV9lbmNyeXB0aW9uX3YyIGFuZCBlbmNyeXB0aW9uK2Nhc2Vmb2xkaW5nCmtlcm5lbCBwYXRj
aGVzIGFwcGxpZWQuCgpGaXhlczogN2YzNzY3ZWU4ZGM1ICgiZjJmcy10b29sczogQ2FzZWZvbGRl
ZCBFbmNyeXB0aW9uIHN1cHBvcnQiKQpDYzogRGFuaWVsIFJvc2VuYmVyZyA8ZHJvc2VuQGdvb2ds
ZS5jb20+ClNpZ25lZC1vZmYtYnk6IEVyaWMgQmlnZ2VycyA8ZWJpZ2dlcnNAZ29vZ2xlLmNvbT4K
LS0tCiBmc2NrL2ZzY2suYyB8IDIxICsrKysrKysrKysrLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDExIGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2ZzY2sv
ZnNjay5jIGIvZnNjay9mc2NrLmMKaW5kZXggMDM4OTE0Ni4uYzI0OWRmYSAxMDA2NDQKLS0tIGEv
ZnNjay9mc2NrLmMKKysrIGIvZnNjay9mc2NrLmMKQEAgLTEzNDgsMTEgKzEzNDgsMTAgQEAgc3Rh
dGljIGludCBfX2dldF9jdXJyZW50X2xldmVsKGludCBkaXJfbGV2ZWwsIHUzMiBwZ29mcykKIAly
ZXR1cm4gaTsKIH0KIAotc3RhdGljIGludCBmMmZzX2NoZWNrX2RpcmVudF9wb3NpdGlvbihpbnQg
ZW5jb2RpbmcsIGludCBjYXNlZm9sZGVkLAotCQkJCQkJdTggKm5hbWUsIHUxNiBuYW1lX2xlbiwg
dTMyIHBnb2ZzLAotCQkJCQkJdTggZGlyX2xldmVsLCB1MzIgcGlubykKK3N0YXRpYyBpbnQgZjJm
c19jaGVja19kaXJlbnRfcG9zaXRpb24oY29uc3Qgc3RydWN0IGYyZnNfZGlyX2VudHJ5ICpkZW50
cnksCisJCQkJICAgICAgY29uc3QgY2hhciAqcHJpbnRhYmxlX25hbWUsCisJCQkJICAgICAgdTMy
IHBnb2ZzLCB1OCBkaXJfbGV2ZWwsIHUzMiBwaW5vKQogewotCWYyZnNfaGFzaF90IG5hbWVoYXNo
ID0gZjJmc19kZW50cnlfaGFzaChlbmNvZGluZywgY2FzZWZvbGRlZCwgbmFtZSwgbmFtZV9sZW4p
OwogCXVuc2lnbmVkIGludCBuYnVja2V0LCBuYmxvY2s7CiAJdW5zaWduZWQgaW50IGJpZHgsIGVu
ZF9ibG9jazsKIAlpbnQgbGV2ZWw7CkBAIC0xMzYzLDcgKzEzNjIsNyBAQCBzdGF0aWMgaW50IGYy
ZnNfY2hlY2tfZGlyZW50X3Bvc2l0aW9uKGludCBlbmNvZGluZywgaW50IGNhc2Vmb2xkZWQsCiAJ
bmJsb2NrID0gYnVja2V0X2Jsb2NrcyhsZXZlbCk7CiAKIAliaWR4ID0gZGlyX2Jsb2NrX2luZGV4
KGxldmVsLCBkaXJfbGV2ZWwsCi0JCQkJCWxlMzJfdG9fY3B1KG5hbWVoYXNoKSAlIG5idWNrZXQp
OworCQkJICAgICAgIGxlMzJfdG9fY3B1KGRlbnRyeS0+aGFzaF9jb2RlKSAlIG5idWNrZXQpOwog
CWVuZF9ibG9jayA9IGJpZHggKyBuYmxvY2s7CiAKIAlpZiAocGdvZnMgPj0gYmlkeCAmJiBwZ29m
cyA8IGVuZF9ibG9jaykKQEAgLTEzNzEsNyArMTM3MCw4IEBAIHN0YXRpYyBpbnQgZjJmc19jaGVj
a19kaXJlbnRfcG9zaXRpb24oaW50IGVuY29kaW5nLCBpbnQgY2FzZWZvbGRlZCwKIAogCUFTU0VS
VF9NU0coIldyb25nIHBvc2l0aW9uIG9mIGRpcmVudCBwaW5vOiV1LCBuYW1lOiVzLCBsZXZlbDol
ZCwgIgogCQkiZGlyX2xldmVsOiVkLCBwZ29mczoldSwgY29ycmVjdCByYW5nZTpbJXUsICV1XVxu
IiwKLQkJcGlubywgbmFtZSwgbGV2ZWwsIGRpcl9sZXZlbCwgcGdvZnMsIGJpZHgsIGVuZF9ibG9j
ayAtIDEpOworCQlwaW5vLCBwcmludGFibGVfbmFtZSwgbGV2ZWwsIGRpcl9sZXZlbCwgcGdvZnMs
IGJpZHgsCisJCWVuZF9ibG9jayAtIDEpOwogCXJldHVybiAxOwogfQogCkBAIC0xNTUyLDEwICsx
NTUyLDEyIEBAIHN0YXRpYyBpbnQgX19jaGtfZGVudHJpZXMoc3RydWN0IGYyZnNfc2JfaW5mbyAq
c2JpLCBpbnQgY2FzZWZvbGRlZCwKIAkJaWYgKGYyZnNfY2hlY2tfaGFzaF9jb2RlKGdldF9lbmNv
ZGluZyhzYmkpLCBjYXNlZm9sZGVkLCBkZW50cnkgKyBpLCBuYW1lLCBuYW1lX2xlbiwgZW5jX25h
bWUpKQogCQkJZml4ZWQgPSAxOwogCisJCXByZXR0eV9wcmludF9maWxlbmFtZShuYW1lLCBuYW1l
X2xlbiwgZW4sIGVuY19uYW1lKTsKKwogCQlpZiAobWF4ID09IE5SX0RFTlRSWV9JTl9CTE9DSykg
ewotCQkJcmV0ID0gZjJmc19jaGVja19kaXJlbnRfcG9zaXRpb24oZ2V0X2VuY29kaW5nKHNiaSks
IGNhc2Vmb2xkZWQsCi0JCQkJCW5hbWUsIG5hbWVfbGVuLAljaGlsZC0+cGdvZnMsCi0JCQkJCWNo
aWxkLT5kaXJfbGV2ZWwsIGNoaWxkLT5wX2lubyk7CisJCQlyZXQgPSBmMmZzX2NoZWNrX2RpcmVu
dF9wb3NpdGlvbihkZW50cnkgKyBpLCBlbiwKKwkJCQkJY2hpbGQtPnBnb2ZzLCBjaGlsZC0+ZGly
X2xldmVsLAorCQkJCQljaGlsZC0+cF9pbm8pOwogCQkJaWYgKHJldCkgewogCQkJCWlmIChjLmZp
eF9vbikgewogCQkJCQlGSVhfTVNHKCJDbGVhciBiYWQgZGVudHJ5IDB4JXgiLCBpKTsKQEAgLTE1
NjgsNyArMTU3MCw2IEBAIHN0YXRpYyBpbnQgX19jaGtfZGVudHJpZXMoc3RydWN0IGYyZnNfc2Jf
aW5mbyAqc2JpLCBpbnQgY2FzZWZvbGRlZCwKIAkJCX0KIAkJfQogCi0JCXByZXR0eV9wcmludF9m
aWxlbmFtZShuYW1lLCBuYW1lX2xlbiwgZW4sIGVuY19uYW1lKTsKIAkJREJHKDEsICJbJTN1XS1b
MHgleF0gbmFtZVslc10gbGVuWzB4JXhdIGlub1sweCV4XSB0eXBlWzB4JXhdXG4iLAogCQkJCWZz
Y2stPmRlbnRyeV9kZXB0aCwgaSwgZW4sIG5hbWVfbGVuLAogCQkJCWxlMzJfdG9fY3B1KGRlbnRy
eVtpXS5pbm8pLAotLSAKMi4yNy4wLnJjMC4xODMuZ2RlOGY5MmQ2NTItZ29vZwoKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVs
IG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRw
czovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVs
Cg==
