Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B21023E5AD
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  7 Aug 2020 04:03:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k3riv-00069j-R5; Fri, 07 Aug 2020 02:03:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1k3rit-00069Y-MI
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 07 Aug 2020 02:03:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=j/41R339vOOfhQIciGJu2n4v8Lln1lXrOjJjTMAo1e4=; b=Qz4Q/mDTSFxElVrmjBOVDmkp3A
 Pqj7fyHqfMt0kiSvR3bMPF9VccjcuIXqV68Yniglb8adB1GktjSlM9zbgJ9AYEFSjumsly7WvNSng
 sbwovu4N1hZQg4dCgi4/cw9FWhHOszZe+JYpMgnXCIzxRKn2YYrf0jmla4U7HG1rwzII=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=j/41R339vOOfhQIciGJu2n4v8Lln1lXrOjJjTMAo1e4=; b=h
 uKkUtxNCAxwWN1y4V6zHMZU4a/Qv3EorMWaLvs11f3VIFnByWt2ETsR/pDCedIxELRgmlFfXWSbSN
 4o4bLFNjomp6rlxGmp69jRFIgMIddHjaubV3or3xNi4HtkIZMHjwV2pSfTegTnvNAUmra0XKvZWHh
 U8qdfMtbrqcO3vMg=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1k3rip-009TtL-Us
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 07 Aug 2020 02:03:07 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id D0EB87F6BBE746BD7457;
 Fri,  7 Aug 2020 10:02:52 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.487.0; Fri, 7 Aug 2020 10:02:43 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Fri, 7 Aug 2020 10:02:31 +0800
Message-ID: <20200807020231.118576-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.6 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1k3rip-009TtL-Us
Subject: [f2fs-dev] [PATCH v2] fsck.f2fs: correct return value
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
d2VpLmNvbT4KLS0tCnYyOgotIGNhdGNoIHJldHVybiB2YWx1ZSBvZiBkb19mc2NrKCkKIGZzY2sv
ZnNjay5oIHwgMTEgKysrKysrKysrKysKIGZzY2svbWFpbi5jIHwgMzkgKysrKysrKysrKysrKysr
KysrKysrKysrKysrLS0tLS0tLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDM4IGluc2VydGlvbnMo
KyksIDEyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2ZzY2svZnNjay5oIGIvZnNjay9mc2Nr
LmgKaW5kZXggZTg2NzMwYzM0ZmM0Li5jNWU4NWZlZmEwN2IgMTAwNjQ0Ci0tLSBhL2ZzY2svZnNj
ay5oCisrKyBiL2ZzY2svZnNjay5oCkBAIC0xMyw2ICsxMywxNyBAQAogCiAjaW5jbHVkZSAiZjJm
cy5oIgogCitlbnVtIHsKKwlGU0NLX1NVQ0NFU1MgICAgICAgICAgICAgICAgID0gMCwKKwlGU0NL
X0VSUk9SX0NPUlJFQ1RFRCAgICAgICAgID0gMSA8PCAwLAorCUZTQ0tfU1lTVEVNX1NIT1VMRF9S
RUJPT1QgICAgPSAxIDw8IDEsCisJRlNDS19FUlJPUlNfTEVGVF9VTkNPUlJFQ1RFRCA9IDEgPDwg
MiwKKwlGU0NLX09QRVJBVElPTkFMX0VSUk9SICAgICAgID0gMSA8PCAzLAorCUZTQ0tfVVNBR0Vf
T1JfU1lOVEFYX0VSUk9SICAgPSAxIDw8IDQsCisJRlNDS19VU0VSX0NBTkNFTExFRCAgICAgICAg
ICA9IDEgPDwgNSwKKwlGU0NLX1NIQVJFRF9MSUJfRVJST1IgICAgICAgID0gMSA8PCA3LAorfTsK
Kwogc3RydWN0IHF1b3RhX2N0eDsKIAogI2RlZmluZSBGU0NLX1VOTUFUQ0hFRF9FWFRFTlQJCTB4
MDAwMDAwMDEKZGlmZiAtLWdpdCBhL2ZzY2svbWFpbi5jIGIvZnNjay9tYWluLmMKaW5kZXggOWEx
NTk2ZjM1ZTc5Li4zMjU1OWYxYTViM2QgMTAwNjQ0Ci0tLSBhL2ZzY2svbWFpbi5jCisrKyBiL2Zz
Y2svbWFpbi5jCkBAIC02MzAsNyArNjMwLDcgQEAgdm9pZCBmMmZzX3BhcnNlX29wdGlvbnMoaW50
IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKIAllcnJvcl9vdXQocHJvZyk7CiB9CiAKLXN0YXRpYyB2b2lk
IGRvX2ZzY2soc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKQorc3RhdGljIGludCBkb19mc2NrKHN0
cnVjdCBmMmZzX3NiX2luZm8gKnNiaSkKIHsKIAlzdHJ1Y3QgZjJmc19jaGVja3BvaW50ICpja3B0
ID0gRjJGU19DS1BUKHNiaSk7CiAJdTMyIGZsYWcgPSBsZTMyX3RvX2NwdShja3B0LT5ja3B0X2Zs
YWdzKTsKQEAgLTY1NSw3ICs2NTUsNyBAQCBzdGF0aWMgdm9pZCBkb19mc2NrKHN0cnVjdCBmMmZz
X3NiX2luZm8gKnNiaSkKIAkJCX0gZWxzZSB7CiAJCQkJTVNHKDAsICJbRlNDS10gRjJGUyBtZXRh
ZGF0YSAgIFtPay4uXSIpOwogCQkJCWZzY2tfZnJlZShzYmkpOwotCQkJCXJldHVybjsKKwkJCQly
ZXR1cm4gRlNDS19TVUNDRVNTOwogCQkJfQogCiAJCQlpZiAoIWMucm8pCkBAIC02ODcsNyArNjg3
LDcgQEAgc3RhdGljIHZvaWQgZG9fZnNjayhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkpCiAJCXJl
dCA9IHF1b3RhX2luaXRfY29udGV4dChzYmkpOwogCQlpZiAocmV0KSB7CiAJCQlBU1NFUlRfTVNH
KCJxdW90YV9pbml0X2NvbnRleHQgZmFpbHVyZTogJWQiLCByZXQpOwotCQkJcmV0dXJuOworCQkJ
cmV0dXJuIEZTQ0tfT1BFUkFUSU9OQUxfRVJST1I7CiAJCX0KIAl9CiAJZnNja19jaGtfb3JwaGFu
X25vZGUoc2JpKTsKQEAgLTY5NSw4ICs2OTUsMTQgQEAgc3RhdGljIHZvaWQgZG9fZnNjayhzdHJ1
Y3QgZjJmc19zYl9pbmZvICpzYmkpCiAJCQlGMkZTX0ZUX0RJUiwgVFlQRV9JTk9ERSwgJmJsa19j
bnQsIE5VTEwpOwogCWZzY2tfY2hrX3F1b3RhX2ZpbGVzKHNiaSk7CiAKLQlmc2NrX3ZlcmlmeShz
YmkpOworCXJldCA9IGZzY2tfdmVyaWZ5KHNiaSk7CiAJZnNja19mcmVlKHNiaSk7CisKKwlpZiAo
IWMuYnVnX29uKQorCQlyZXR1cm4gRlNDS19TVUNDRVNTOworCWlmICghcmV0KQorCQlyZXR1cm4g
RlNDS19FUlJPUl9DT1JSRUNURUQ7CisJcmV0dXJuIEZTQ0tfRVJST1JTX0xFRlRfVU5DT1JSRUNU
RUQ7CiB9CiAKIHN0YXRpYyB2b2lkIGRvX2R1bXAoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKQpA
QCAtODIzLDcgKzgyOSw3IEBAIHN0YXRpYyB1NjQgZ2V0X2Jvb3R0aW1lX25zKCkKIGludCBtYWlu
KGludCBhcmdjLCBjaGFyICoqYXJndikKIHsKIAlzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmk7Ci0J
aW50IHJldCA9IDA7CisJaW50IHJldCA9IDAsIHJldDI7CiAJdTY0IHN0YXJ0ID0gZ2V0X2Jvb3R0
aW1lX25zKCk7CiAKIAlmMmZzX2luaXRfY29uZmlndXJhdGlvbigpOwpAQCAtODMzLDExICs4Mzks
MTUgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKiphcmd2KQogCWlmIChjLmZ1bmMgIT0gRFVN
UCAmJiBmMmZzX2RldnNfYXJlX3Vtb3VudGVkKCkgPCAwKSB7CiAJCWlmIChlcnJubyA9PSBFQlVT
WSkgewogCQkJcmV0ID0gLTE7CisJCQlpZiAoYy5mdW5jID09IEZTQ0spCisJCQkJcmV0ID0gRlND
S19PUEVSQVRJT05BTF9FUlJPUjsKIAkJCWdvdG8gcXVpY2tfZXJyOwogCQl9CiAJCWlmICghYy5y
byB8fCBjLmZ1bmMgPT0gREVGUkFHKSB7CiAJCQlNU0coMCwgIlx0RXJyb3I6IE5vdCBhdmFpbGFi
bGUgb24gbW91bnRlZCBkZXZpY2UhXG4iKTsKIAkJCXJldCA9IC0xOworCQkJaWYgKGMuZnVuYyA9
PSBGU0NLKQorCQkJCXJldCA9IEZTQ0tfT1BFUkFUSU9OQUxfRVJST1I7CiAJCQlnb3RvIHF1aWNr
X2VycjsKIAkJfQogCkBAIC04NTQsNiArODY0LDggQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIg
Kiphcmd2KQogCS8qIEdldCBkZXZpY2UgKi8KIAlpZiAoZjJmc19nZXRfZGV2aWNlX2luZm8oKSA8
IDApIHsKIAkJcmV0ID0gLTE7CisJCWlmIChjLmZ1bmMgPT0gRlNDSykKKwkJCXJldCA9IEZTQ0tf
T1BFUkFUSU9OQUxfRVJST1I7CiAJCWdvdG8gcXVpY2tfZXJyOwogCX0KIApAQCAtODczLDcgKzg4
NSw3IEBAIGZzY2tfYWdhaW46CiAKIAlzd2l0Y2ggKGMuZnVuYykgewogCWNhc2UgRlNDSzoKLQkJ
ZG9fZnNjayhzYmkpOworCQlyZXQgPSBkb19mc2NrKHNiaSk7CiAJCWJyZWFrOwogI2lmZGVmIFdJ
VEhfRFVNUAogCWNhc2UgRFVNUDoKQEAgLTkyMSw4ICs5MzMsOCBAQCBmc2NrX2FnYWluOgogCQkJ
Y2hhciBhbnNbMjU1XSA9IHswfTsKIHJldHJ5OgogCQkJcHJpbnRmKCJEbyB5b3Ugd2FudCB0byBm
aXggdGhpcyBwYXJ0aXRpb24/IFtZL05dICIpOwotCQkJcmV0ID0gc2NhbmYoIiVzIiwgYW5zKTsK
LQkJCUFTU0VSVChyZXQgPj0gMCk7CisJCQlyZXQyID0gc2NhbmYoIiVzIiwgYW5zKTsKKwkJCUFT
U0VSVChyZXQyID49IDApOwogCQkJaWYgKCFzdHJjYXNlY21wKGFucywgInkiKSkKIAkJCQljLmZp
eF9vbiA9IDE7CiAJCQllbHNlIGlmICghc3RyY2FzZWNtcChhbnMsICJuIikpCkBAIC05MzQsMTIg
Kzk0NiwxNSBAQCByZXRyeToKIAkJCQlnb3RvIGZzY2tfYWdhaW47CiAJCX0KIAl9Ci0JcmV0ID0g
ZjJmc19maW5hbGl6ZV9kZXZpY2UoKTsKLQlpZiAocmV0IDwgMCkKLQkJcmV0dXJuIHJldDsKKwly
ZXQyID0gZjJmc19maW5hbGl6ZV9kZXZpY2UoKTsKKwlpZiAocmV0MikgeworCQlpZiAoYy5mdW5j
ID09IEZTQ0spCisJCQlyZXR1cm4gRlNDS19PUEVSQVRJT05BTF9FUlJPUjsKKwkJcmV0dXJuIHJl
dDI7CisJfQogCiAJcHJpbnRmKCJcbkRvbmU6ICVsZiBzZWNzXG4iLCAoZ2V0X2Jvb3R0aW1lX25z
KCkgLSBzdGFydCkgLyAxMDAwMDAwMDAwLjApOwotCXJldHVybiAwOworCXJldHVybiByZXQ7CiAK
IG91dF9lcnI6CiAJaWYgKHNiaS0+Y2twdCkKLS0gCjIuMjYuMgoKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcg
bGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3Rz
LnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
