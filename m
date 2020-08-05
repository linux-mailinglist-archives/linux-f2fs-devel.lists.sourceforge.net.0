Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1562A23C765
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  5 Aug 2020 10:09:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k3EUb-00012P-7A; Wed, 05 Aug 2020 08:09:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1k3EUZ-00012D-22
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 05 Aug 2020 08:09:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CwrNMLAkONLeV6jNygpDTVvuj9a/4Nw3N24DeuVtWnA=; b=YxF2HJVTGk3hMcyFT9E8aJ6udX
 LUSuPQy5w16Vm0cPEBvIsClw+BzZFM27qFLzwplfr6esaD32BRnqByukyAuALc6vcrHVLVg4PzBWc
 3TRS4vTFo5LMd+L6k4CnCt1zQpc7aIjnJXCbqmBVCGXfSEZm4f2Ri/dh1giRmRZHBicg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=CwrNMLAkONLeV6jNygpDTVvuj9a/4Nw3N24DeuVtWnA=; b=Q
 SQLWuAJLKQgFYPN4hhXT+YkRUXxy6aIb2n4VL61waJt0FWkHSSGG9xRaEQ+LiwSeB0k/W4kzXhxBY
 0yCel5sAcNXG2WljBH1nUvuiumyMy/IgwR2OuBFFL/C8LANbLFY162Tcr8QDIT+B97FvT/478N9Nx
 QSJk/1r16iQqmOeo=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1k3EUV-00BJD9-UJ
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 05 Aug 2020 08:09:43 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 5BCB7E1C9C3BEE932FF7;
 Wed,  5 Aug 2020 16:09:27 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.487.0; Wed, 5 Aug 2020 16:09:19 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Wed, 5 Aug 2020 16:09:13 +0800
Message-ID: <20200805080913.48133-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: die.net]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1k3EUV-00BJD9-UJ
Subject: [f2fs-dev] [PATCH] fsck.f2fs: correct return value
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
Cc: nolange79@gmail.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

QXMgTm9yYmVydCBMYW5nZSByZXBvcnRlZDoKCiIKJCBmc2NrLmYyZnMgLWEgL2Rldi9tbWNibGsw
cDU7IGVjaG8gJD8KSW5mbzogRml4IHRoZSByZXBvcnRlZCBjb3JydXB0aW9uLgpJbmZvOiBNb3Vu
dGVkIGRldmljZSEKSW5mbzogQ2hlY2sgRlMgb25seSBvbiBSTyBtb3VudGVkIGRldmljZQpFcnJv
cjogRmFpbGVkIHRvIG9wZW4gdGhlIGRldmljZSEKMjU1CiIKCk1pY2hhZWwgTGHDnyByZW1pbmRz
OgoKIgpJIHRoaW5rIHRoZSByZXR1cm4gdmFsdWUgaXMgZXhhY3RseSB0aGUgcHJvYmxlbSBoZXJl
LiBTZWUgZnNjayg4KSAoCmh0dHBzOi8vbGludXguZGllLm5ldC9tYW4vOC9mc2NrKSB3aGljaCBz
cGVjaWZpZXMgdGhlIHJldHVybiB2YWx1ZXMuClN5c3RlbWQgbG9va3MgYXQgdGhlc2UgYW5kIGRl
Y2lkZXMgaG93IHRvIHByb2NlZWQ6CgpodHRwczovL2dpdGh1Yi5jb20vc3lzdGVtZC9zeXN0ZW1k
L2Jsb2IvYTg1OWFiZjA2MmNlZjE1MTFlNDg3OWM0ZWUzOWM2MDM2ZWJlYWVjOC9zcmMvZnNjay9m
c2NrLmMjTDQwNwoKVGhhdCBtZWFucywgaWYgZnNjay5mMmZzIHJldHVybnMgMjU1LCB0aGVuCnRo
ZSBGU0NLX1NZU1RFTV9TSE9VTERfUkVCT09UIGJpdCBpcyBzZXQgYW5kIHN5c3RlbWQgd2lsbCBy
ZWJvb3QuCiIKClNvIHRoZSBwcm9ibGVtIGhlcmUgaXMgZnNjay5mMmZzIGRpZG4ndCByZXR1cm4g
Y29ycmVjdCB2YWx1ZSB0byB1c2Vyc3BhY2UKYXBwcywgcmVzdWx0IGluIGxhdGVyIHVuZXhwZWN0
ZWQgYmVoYXZpb3Igb2YgcmVib290aW5nLCBsZXQncyBmaXggdGhpcy4KClJlcG9ydGVkLWJ5OiBO
b3JiZXJ0IExhbmdlIDxub2xhbmdlNzlAZ21haWwuY29tPgpSZXBvcnRlZC1ieTogTWljaGFlbCBM
YcOfIDxiZXZhbkBiaS1jby5uZXQ+ClNpZ25lZC1vZmYtYnk6IENoYW8gWXUgPHl1Y2hhbzBAaHVh
d2VpLmNvbT4KLS0tCiBmc2NrL2ZzY2suaCB8IDExICsrKysrKysrKysrCiBmc2NrL21haW4uYyB8
IDI3ICsrKysrKysrKysrKysrKysrKysrKy0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCAzMiBpbnNl
cnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2ZzY2svZnNjay5oIGIvZnNj
ay9mc2NrLmgKaW5kZXggZTg2NzMwYzM0ZmM0Li5jNWU4NWZlZmEwN2IgMTAwNjQ0Ci0tLSBhL2Zz
Y2svZnNjay5oCisrKyBiL2ZzY2svZnNjay5oCkBAIC0xMyw2ICsxMywxNyBAQAogCiAjaW5jbHVk
ZSAiZjJmcy5oIgogCitlbnVtIHsKKwlGU0NLX1NVQ0NFU1MgICAgICAgICAgICAgICAgID0gMCwK
KwlGU0NLX0VSUk9SX0NPUlJFQ1RFRCAgICAgICAgID0gMSA8PCAwLAorCUZTQ0tfU1lTVEVNX1NI
T1VMRF9SRUJPT1QgICAgPSAxIDw8IDEsCisJRlNDS19FUlJPUlNfTEVGVF9VTkNPUlJFQ1RFRCA9
IDEgPDwgMiwKKwlGU0NLX09QRVJBVElPTkFMX0VSUk9SICAgICAgID0gMSA8PCAzLAorCUZTQ0tf
VVNBR0VfT1JfU1lOVEFYX0VSUk9SICAgPSAxIDw8IDQsCisJRlNDS19VU0VSX0NBTkNFTExFRCAg
ICAgICAgICA9IDEgPDwgNSwKKwlGU0NLX1NIQVJFRF9MSUJfRVJST1IgICAgICAgID0gMSA8PCA3
LAorfTsKKwogc3RydWN0IHF1b3RhX2N0eDsKIAogI2RlZmluZSBGU0NLX1VOTUFUQ0hFRF9FWFRF
TlQJCTB4MDAwMDAwMDEKZGlmZiAtLWdpdCBhL2ZzY2svbWFpbi5jIGIvZnNjay9tYWluLmMKaW5k
ZXggOWExNTk2ZjM1ZTc5Li4xMWQ0NzJiOTk0MWMgMTAwNjQ0Ci0tLSBhL2ZzY2svbWFpbi5jCisr
KyBiL2ZzY2svbWFpbi5jCkBAIC02MzAsNyArNjMwLDcgQEAgdm9pZCBmMmZzX3BhcnNlX29wdGlv
bnMoaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKIAllcnJvcl9vdXQocHJvZyk7CiB9CiAKLXN0YXRp
YyB2b2lkIGRvX2ZzY2soc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKQorc3RhdGljIGludCBkb19m
c2NrKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSkKIHsKIAlzdHJ1Y3QgZjJmc19jaGVja3BvaW50
ICpja3B0ID0gRjJGU19DS1BUKHNiaSk7CiAJdTMyIGZsYWcgPSBsZTMyX3RvX2NwdShja3B0LT5j
a3B0X2ZsYWdzKTsKQEAgLTY1NSw3ICs2NTUsNyBAQCBzdGF0aWMgdm9pZCBkb19mc2NrKHN0cnVj
dCBmMmZzX3NiX2luZm8gKnNiaSkKIAkJCX0gZWxzZSB7CiAJCQkJTVNHKDAsICJbRlNDS10gRjJG
UyBtZXRhZGF0YSAgIFtPay4uXSIpOwogCQkJCWZzY2tfZnJlZShzYmkpOwotCQkJCXJldHVybjsK
KwkJCQlyZXR1cm4gRlNDS19TVUNDRVNTOwogCQkJfQogCiAJCQlpZiAoIWMucm8pCkBAIC02ODcs
NyArNjg3LDcgQEAgc3RhdGljIHZvaWQgZG9fZnNjayhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkp
CiAJCXJldCA9IHF1b3RhX2luaXRfY29udGV4dChzYmkpOwogCQlpZiAocmV0KSB7CiAJCQlBU1NF
UlRfTVNHKCJxdW90YV9pbml0X2NvbnRleHQgZmFpbHVyZTogJWQiLCByZXQpOwotCQkJcmV0dXJu
OworCQkJcmV0dXJuIEZTQ0tfT1BFUkFUSU9OQUxfRVJST1I7CiAJCX0KIAl9CiAJZnNja19jaGtf
b3JwaGFuX25vZGUoc2JpKTsKQEAgLTY5NSw4ICs2OTUsMTQgQEAgc3RhdGljIHZvaWQgZG9fZnNj
ayhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkpCiAJCQlGMkZTX0ZUX0RJUiwgVFlQRV9JTk9ERSwg
JmJsa19jbnQsIE5VTEwpOwogCWZzY2tfY2hrX3F1b3RhX2ZpbGVzKHNiaSk7CiAKLQlmc2NrX3Zl
cmlmeShzYmkpOworCXJldCA9IGZzY2tfdmVyaWZ5KHNiaSk7CiAJZnNja19mcmVlKHNiaSk7CisK
KwlpZiAoIWMuYnVnX29uKQorCQlyZXR1cm4gRlNDS19TVUNDRVNTOworCWlmICghcmV0KQorCQly
ZXR1cm4gRlNDS19FUlJPUl9DT1JSRUNURUQ7CisJcmV0dXJuIEZTQ0tfRVJST1JTX0xFRlRfVU5D
T1JSRUNURUQ7CiB9CiAKIHN0YXRpYyB2b2lkIGRvX2R1bXAoc3RydWN0IGYyZnNfc2JfaW5mbyAq
c2JpKQpAQCAtODMzLDExICs4MzksMTUgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKiphcmd2
KQogCWlmIChjLmZ1bmMgIT0gRFVNUCAmJiBmMmZzX2RldnNfYXJlX3Vtb3VudGVkKCkgPCAwKSB7
CiAJCWlmIChlcnJubyA9PSBFQlVTWSkgewogCQkJcmV0ID0gLTE7CisJCQlpZiAoYy5mdW5jID09
IEZTQ0spCisJCQkJcmV0ID0gRlNDS19PUEVSQVRJT05BTF9FUlJPUjsKIAkJCWdvdG8gcXVpY2tf
ZXJyOwogCQl9CiAJCWlmICghYy5ybyB8fCBjLmZ1bmMgPT0gREVGUkFHKSB7CiAJCQlNU0coMCwg
Ilx0RXJyb3I6IE5vdCBhdmFpbGFibGUgb24gbW91bnRlZCBkZXZpY2UhXG4iKTsKIAkJCXJldCA9
IC0xOworCQkJaWYgKGMuZnVuYyA9PSBGU0NLKQorCQkJCXJldCA9IEZTQ0tfT1BFUkFUSU9OQUxf
RVJST1I7CiAJCQlnb3RvIHF1aWNrX2VycjsKIAkJfQogCkBAIC04NTQsNiArODY0LDggQEAgaW50
IG1haW4oaW50IGFyZ2MsIGNoYXIgKiphcmd2KQogCS8qIEdldCBkZXZpY2UgKi8KIAlpZiAoZjJm
c19nZXRfZGV2aWNlX2luZm8oKSA8IDApIHsKIAkJcmV0ID0gLTE7CisJCWlmIChjLmZ1bmMgPT0g
RlNDSykKKwkJCXJldCA9IEZTQ0tfT1BFUkFUSU9OQUxfRVJST1I7CiAJCWdvdG8gcXVpY2tfZXJy
OwogCX0KIApAQCAtODczLDcgKzg4NSw3IEBAIGZzY2tfYWdhaW46CiAKIAlzd2l0Y2ggKGMuZnVu
YykgewogCWNhc2UgRlNDSzoKLQkJZG9fZnNjayhzYmkpOworCQlyZXQgPSBkb19mc2NrKHNiaSk7
CiAJCWJyZWFrOwogI2lmZGVmIFdJVEhfRFVNUAogCWNhc2UgRFVNUDoKQEAgLTkzNSw4ICs5NDcs
MTEgQEAgcmV0cnk6CiAJCX0KIAl9CiAJcmV0ID0gZjJmc19maW5hbGl6ZV9kZXZpY2UoKTsKLQlp
ZiAocmV0IDwgMCkKKwlpZiAocmV0KSB7CisJCWlmIChjLmZ1bmMgPT0gRlNDSykKKwkJCXJldHVy
biBGU0NLX09QRVJBVElPTkFMX0VSUk9SOwogCQlyZXR1cm4gcmV0OworCX0KIAogCXByaW50Zigi
XG5Eb25lOiAlbGYgc2Vjc1xuIiwgKGdldF9ib290dGltZV9ucygpIC0gc3RhcnQpIC8gMTAwMDAw
MDAwMC4wKTsKIAlyZXR1cm4gMDsKLS0gCjIuMjYuMgoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApM
aW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJj
ZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
