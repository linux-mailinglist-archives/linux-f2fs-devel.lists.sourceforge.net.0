Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C89AA567BCA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  6 Jul 2022 04:06:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o8uR1-0006kP-O8; Wed, 06 Jul 2022 02:06:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <duguoweisz@gmail.com>) id 1o8uR0-0006kJ-Px
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 06 Jul 2022 02:06:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uUYx/nMpPRZZ7T3OJcp0ViMS4SfBN+r9mg60+It2koY=; b=f5MmWBNcPifc4N9TWQReURHCnX
 qhSL7+Qz/ypjrPih8hwK85I1ADVGXWQNf8Prhfc2C9hYUmjhZPQpc2ixIhCAjKoGpDrG9IBP6Wv99
 PeAVw1u4AuugLKfQlnTsJsDuxMbjRWfia3BT/jpSUtG34PsddO14iCWUte+icYxeQQeM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=uUYx/nMpPRZZ7T3OJcp0ViMS4SfBN+r9mg60+It2koY=; b=V
 yU0B9dlf0Hqnh0+QDtQ2oiuFckgP/LiKbWIkLY1OrrjQmYENTo5Xd34h4t4Jc9FJLy/Ah1uEr7cDI
 G7uxBH8K8MFBzMg9ZGYpIS5kV1dBo36XzpfRtRn9fSnPtNVIv6yCARYMKt6bftGd7mDkcOKIpuOaf
 AamZnomkMfUJPnVM=;
Received: from mail-pl1-f182.google.com ([209.85.214.182])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1o8uQy-008N21-MR
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 06 Jul 2022 02:06:33 +0000
Received: by mail-pl1-f182.google.com with SMTP id z1so6674738plb.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 05 Jul 2022 19:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uUYx/nMpPRZZ7T3OJcp0ViMS4SfBN+r9mg60+It2koY=;
 b=d6XsyRYc5VWPdjScT++7C/ZlgNyGhk6CLnTXXvXdD4UwuZSxr8M+SWAxA+PZbjZhwY
 Dhm9jdYWXA6Q1lTGNEy4Sl+tdQM0Pq+Y2/GGSc7xmwDONTI35x1b3yLwhpxAgpytD21b
 12p0Yg4IXeFZPkXG+MqGz3mulGFMpzDohuIZzNZNtbhGnJtOK9hzhOKtbZB9wbDAxHcY
 htYJs/Fx1ugeJMWvc76YmzYHmYCzvo/hdxkr7wq7ZR72BaPnynnpoUtdnX+MRvveNWIk
 q3YefMRabt4oR+hqrRIrI+4+MekUXi+TwA0qFeJjgfEcKnqkTYmlC+tVPcuT1ucDCCZ+
 //SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uUYx/nMpPRZZ7T3OJcp0ViMS4SfBN+r9mg60+It2koY=;
 b=q9djGo1S3yIG06Bm5WIwm+neG4AXhpm7isTB8rP0L4ESaIqjeh/h3nmjcnzaTu48Uc
 gJkx5U/xiZf9e6Wzp5uLopvOwIfsrdoSAOb8CxTArEGjjMfTi4hKl85CoIWPShf8HJea
 QHqEsS9Bd7BQa26Rmz61sn0aQuKUX1Pb3KCVpNvk0Xe6yKrM9s7/7ompEQdiF3zHeCtc
 dBv0G+WHT0Unp5aynXZ1Z0QP7U4lGVwEW8Z6nQIMbcwTDm+mIy5w9mQhKnnzOSUvKTto
 82iqXtxza8w7OJxeFG1g6yuUki4IT4vuZdZgYyTQPyEyzqxSS0MfN7+crhvFJ84uUst7
 /Y0w==
X-Gm-Message-State: AJIora+AgDPhMkh3e/qiZ6qRolK5+RV18z1/xApobZRGpKLYqW9bnHU8
 42bRb58iOiaSV8MmfJQzu5pMiO7gcmUwxLGC
X-Google-Smtp-Source: AGRyM1twbylijzBnLpfEZfmVSXG72ZKveb2t2MZtM2qOX+aHeHkHb+737e81WqT8tIdgRrY2KMJ0mw==
X-Received: by 2002:a17:902:e808:b0:16a:75be:2ba with SMTP id
 u8-20020a170902e80800b0016a75be02bamr44746280plg.85.1657073187042; 
 Tue, 05 Jul 2022 19:06:27 -0700 (PDT)
Received: from mi-HP-ProDesk-680-G4-MT.mioffice.cn ([43.224.245.232])
 by smtp.gmail.com with ESMTPSA id
 b1-20020a170902a9c100b0016a1e2c2efcsm23998925plr.223.2022.07.05.19.06.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 19:06:26 -0700 (PDT)
From: Guowei Du <duguoweisz@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Wed,  6 Jul 2022 10:06:15 +0800
Message-Id: <20220706020615.29938-1-duguoweisz@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: duguowei There are two ways to show meta segment
 information, 
 one is by dump.f2fs, another is by sysfs node. But, sometimes dump needs
 root privilege,So adding a few sysfs nodes. The generic permission of node
 is 0444(S_IRUGO). 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [duguoweisz[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.182 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.182 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1o8uQy-008N21-MR
Subject: [f2fs-dev] [PATCH] f2fs: add some sysfs nodes for segment
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
Cc: linux-kernel@vger.kernel.org, duguowei <duguowei@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

RnJvbTogZHVndW93ZWkgPGR1Z3Vvd2VpQHhpYW9taS5jb20+CgpUaGVyZSBhcmUgdHdvIHdheXMg
dG8gc2hvdyBtZXRhIHNlZ21lbnQgaW5mb3JtYXRpb24sCm9uZSBpcyBieSBkdW1wLmYyZnMsIGFu
b3RoZXIgaXMgYnkgc3lzZnMgbm9kZS4gQnV0LApzb21ldGltZXMgZHVtcCBuZWVkcyByb290IHBy
aXZpbGVnZSxTbyBhZGRpbmcgYQpmZXcgc3lzZnMgbm9kZXMuCgpUaGUgZ2VuZXJpYyBwZXJtaXNz
aW9uIG9mIG5vZGUgaXMgMDQ0NChTX0lSVUdPKS4KCiQgY2QgL3N5cy9mcy9mMmZzL0RFVklDRS8u
Li4KJCBscyAtbAouLi4KLXItLXItLXItLSAxIHJvb3Qgcm9vdCA0MDk2IDfmnIggICA1IDIzOjIx
IHJlc2VydmVkX3NlZ21lbnRzCi1yLS1yLS1yLS0gMSByb290IHJvb3QgNDA5NiA35pyIICAgNSAy
MzoyMSBzZWdtZW50X2NvdW50Ci1yLS1yLS1yLS0gMSByb290IHJvb3QgNDA5NiA35pyIICAgNSAy
MzoyMSBzZWdtZW50X2NvdW50X2NrcHQKLXItLXItLXItLSAxIHJvb3Qgcm9vdCA0MDk2IDfmnIgg
ICA1IDIzOjIxIHNlZ21lbnRfY291bnRfbWFpbgotci0tci0tci0tIDEgcm9vdCByb290IDQwOTYg
N+aciCAgIDUgMjM6MjEgc2VnbWVudF9jb3VudF9uYXQKLXItLXItLXItLSAxIHJvb3Qgcm9vdCA0
MDk2IDfmnIggICA1IDIzOjIxIHNlZ21lbnRfY291bnRfc2l0Ci1yLS1yLS1yLS0gMSByb290IHJv
b3QgNDA5NiA35pyIICAgNSAyMzoyMSBzZWdtZW50X2NvdW50X3NzYQouLi4KCiQgc3VkbyBkdW1w
LmYyZnMgLWQgMSBERVZJQ0UKLi4uClN1cGVyIGJsb2NrCnNlZ21lbnRfY291bnQgICAgICAgICAg
ICAgICAgICAgICAgICAgICBbMHggICAgICAyNiA6IDM4XQpzZWdtZW50X2NvdW50X2NrcHQgICAg
ICAgICAgICAgICAgICAgICAgWzB4ICAgICAgIDIgOiAyXQpzZWdtZW50X2NvdW50X3NpdCAgICAg
ICAgICAgICAgICAgICAgICAgWzB4ICAgICAgIDIgOiAyXQpzZWdtZW50X2NvdW50X25hdCAgICAg
ICAgICAgICAgICAgICAgICAgWzB4ICAgICAgIDIgOiAyXQpzZWdtZW50X2NvdW50X3NzYSAgICAg
ICAgICAgICAgICAgICAgICAgWzB4ICAgICAgIDEgOiAxXQpzZWdtZW50X2NvdW50X21haW4gICAg
ICAgICAgICAgICAgICAgICAgWzB4ICAgICAgMWYgOiAzMV0KLi4uCkNoZWNrcG9pbnQKcnN2ZF9z
ZWdtZW50X2NvdW50ICAgICAgICAgICAgICAgICAgICAgIFsweCAgICAgICBlIDogMTRdCi4uLgoK
U2lnbmVkLW9mZi1ieTogZHVndW93ZWkgPGR1Z3Vvd2VpQHhpYW9taS5jb20+Ci0tLQogZnMvZjJm
cy9zeXNmcy5jIHwgNjMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDYzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9m
cy9mMmZzL3N5c2ZzLmMgYi9mcy9mMmZzL3N5c2ZzLmMKaW5kZXggNGM1MGFlZGQ1MTQ0Li4wNTM1
MGJiYTJjODMgMTAwNjQ0Ci0tLSBhL2ZzL2YyZnMvc3lzZnMuYworKysgYi9mcy9mMmZzL3N5c2Zz
LmMKQEAgLTY5Nyw2ICs2OTcsNTUgQEAgc3RhdGljIHNzaXplX3QgZjJmc19zYl9mZWF0dXJlX3No
b3coc3RydWN0IGYyZnNfYXR0ciAqYSwKIAlyZXR1cm4gc3ByaW50ZihidWYsICJ1bnN1cHBvcnRl
ZFxuIik7CiB9CiAKK3N0YXRpYyBzc2l6ZV90IHNlZ21lbnRfY291bnRfc2hvdyhzdHJ1Y3QgZjJm
c19hdHRyICphLAorCQlzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIGNoYXIgKmJ1ZikKK3sKKwly
ZXR1cm4gc3ByaW50ZihidWYsICIlbGx1XG4iLAorCQkJKHVuc2lnbmVkIGxvbmcgbG9uZykoRjJG
U19SQVdfU1VQRVIoc2JpKS0+c2VnbWVudF9jb3VudCkpOworfQorCitzdGF0aWMgc3NpemVfdCBz
ZWdtZW50X2NvdW50X2NrcHRfc2hvdyhzdHJ1Y3QgZjJmc19hdHRyICphLAorCQlzdHJ1Y3QgZjJm
c19zYl9pbmZvICpzYmksIGNoYXIgKmJ1ZikKK3sKKwlyZXR1cm4gc3ByaW50ZihidWYsICIlbGx1
XG4iLAorCQkJKHVuc2lnbmVkIGxvbmcgbG9uZykoRjJGU19SQVdfU1VQRVIoc2JpKS0+c2VnbWVu
dF9jb3VudF9ja3B0KSk7Cit9CisKK3N0YXRpYyBzc2l6ZV90IHNlZ21lbnRfY291bnRfc2l0X3No
b3coc3RydWN0IGYyZnNfYXR0ciAqYSwKKwkJc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBjaGFy
ICpidWYpCit7CisJcmV0dXJuIHNwcmludGYoYnVmLCAiJWxsdVxuIiwKKwkJCSh1bnNpZ25lZCBs
b25nIGxvbmcpKEYyRlNfUkFXX1NVUEVSKHNiaSktPnNlZ21lbnRfY291bnRfc2l0KSk7Cit9CisK
K3N0YXRpYyBzc2l6ZV90IHNlZ21lbnRfY291bnRfbmF0X3Nob3coc3RydWN0IGYyZnNfYXR0ciAq
YSwKKwkJc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBjaGFyICpidWYpCit7CisJcmV0dXJuIHNw
cmludGYoYnVmLCAiJWxsdVxuIiwKKwkJCSh1bnNpZ25lZCBsb25nIGxvbmcpKEYyRlNfUkFXX1NV
UEVSKHNiaSktPnNlZ21lbnRfY291bnRfbmF0KSk7Cit9CisKK3N0YXRpYyBzc2l6ZV90IHNlZ21l
bnRfY291bnRfc3NhX3Nob3coc3RydWN0IGYyZnNfYXR0ciAqYSwKKwkJc3RydWN0IGYyZnNfc2Jf
aW5mbyAqc2JpLCBjaGFyICpidWYpCit7CisJcmV0dXJuIHNwcmludGYoYnVmLCAiJWxsdVxuIiwK
KwkJCSh1bnNpZ25lZCBsb25nIGxvbmcpKEYyRlNfUkFXX1NVUEVSKHNiaSktPnNlZ21lbnRfY291
bnRfc3NhKSk7Cit9CisKK3N0YXRpYyBzc2l6ZV90IHNlZ21lbnRfY291bnRfbWFpbl9zaG93KHN0
cnVjdCBmMmZzX2F0dHIgKmEsCisJCXN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgY2hhciAqYnVm
KQoreworCXJldHVybiBzcHJpbnRmKGJ1ZiwgIiVsbHVcbiIsCisJCQkodW5zaWduZWQgbG9uZyBs
b25nKShGMkZTX1JBV19TVVBFUihzYmkpLT5zZWdtZW50X2NvdW50X21haW4pKTsKK30KKworc3Rh
dGljIHNzaXplX3QgcmVzZXJ2ZWRfc2VnbWVudHNfc2hvdyhzdHJ1Y3QgZjJmc19hdHRyICphLAor
CQlzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIGNoYXIgKmJ1ZikKK3sKKwlyZXR1cm4gc3ByaW50
ZihidWYsICIlbGx1XG4iLAorCQkJKHVuc2lnbmVkIGxvbmcgbG9uZykocmVzZXJ2ZWRfc2VnbWVu
dHMoc2JpKSkpOworfQorCiAjZGVmaW5lIEYyRlNfU0JfRkVBVFVSRV9ST19BVFRSKF9uYW1lLCBf
ZmVhdCkJCQlcCiBzdGF0aWMgc3RydWN0IGYyZnNfYXR0ciBmMmZzX2F0dHJfc2JfIyNfbmFtZSA9
IHsJCVwKIAkuYXR0ciA9IHsubmFtZSA9IF9fc3RyaW5naWZ5KF9uYW1lKSwgLm1vZGUgPSAwNDQ0
IH0sCVwKQEAgLTgwMSw2ICs4NTAsMTMgQEAgRjJGU19HRU5FUkFMX1JPX0FUVFIobW92ZWRfYmxv
Y2tzX2JhY2tncm91bmQpOwogRjJGU19HRU5FUkFMX1JPX0FUVFIobW92ZWRfYmxvY2tzX2ZvcmVn
cm91bmQpOwogRjJGU19HRU5FUkFMX1JPX0FUVFIoYXZnX3ZibG9ja3MpOwogI2VuZGlmCitGMkZT
X0dFTkVSQUxfUk9fQVRUUihzZWdtZW50X2NvdW50KTsKK0YyRlNfR0VORVJBTF9ST19BVFRSKHNl
Z21lbnRfY291bnRfY2twdCk7CitGMkZTX0dFTkVSQUxfUk9fQVRUUihzZWdtZW50X2NvdW50X3Np
dCk7CitGMkZTX0dFTkVSQUxfUk9fQVRUUihzZWdtZW50X2NvdW50X25hdCk7CitGMkZTX0dFTkVS
QUxfUk9fQVRUUihzZWdtZW50X2NvdW50X3NzYSk7CitGMkZTX0dFTkVSQUxfUk9fQVRUUihzZWdt
ZW50X2NvdW50X21haW4pOworRjJGU19HRU5FUkFMX1JPX0FUVFIocmVzZXJ2ZWRfc2VnbWVudHMp
OwogCiAjaWZkZWYgQ09ORklHX0ZTX0VOQ1JZUFRJT04KIEYyRlNfRkVBVFVSRV9ST19BVFRSKGVu
Y3J5cHRpb24pOwpAQCAtOTM0LDYgKzk5MCwxMyBAQCBzdGF0aWMgc3RydWN0IGF0dHJpYnV0ZSAq
ZjJmc19hdHRyc1tdID0gewogCUFUVFJfTElTVChnY19yZWNsYWltZWRfc2VnbWVudHMpLAogCUFU
VFJfTElTVChtYXhfZnJhZ21lbnRfY2h1bmspLAogCUFUVFJfTElTVChtYXhfZnJhZ21lbnRfaG9s
ZSksCisJQVRUUl9MSVNUKHNlZ21lbnRfY291bnQpLAorCUFUVFJfTElTVChzZWdtZW50X2NvdW50
X2NrcHQpLAorCUFUVFJfTElTVChzZWdtZW50X2NvdW50X3NpdCksCisJQVRUUl9MSVNUKHNlZ21l
bnRfY291bnRfbmF0KSwKKwlBVFRSX0xJU1Qoc2VnbWVudF9jb3VudF9zc2EpLAorCUFUVFJfTElT
VChzZWdtZW50X2NvdW50X21haW4pLAorCUFUVFJfTElTVChyZXNlcnZlZF9zZWdtZW50cyksCiAJ
TlVMTCwKIH07CiBBVFRSSUJVVEVfR1JPVVBTKGYyZnMpOwotLSAKMi4zNi4xCgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwg
bWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBz
Oi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
