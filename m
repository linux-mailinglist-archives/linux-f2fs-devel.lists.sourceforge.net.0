Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA8382FD56
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jan 2024 23:59:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rPsOq-0003f4-E7;
	Tue, 16 Jan 2024 22:59:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1rPsOp-0003ey-Cx
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jan 2024 22:59:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lMnHpL+vhTW2DCzeEp+JjD4dTKshtiO76qcppsELxrs=; b=g5a0HqsVWrl4EZSXYS8Am+1kuw
 AJc/GYs7XDWGpSihRJiXVmj76sTPANDVyxGe2AuIqzkjaTZC4gDjcrE9lMO1wVFbPQekyJbybayzS
 znk9utgIzf1EFqQdzMzmoCJUTi9WmiUbXcHEgVTU6mARoPMTJktruskMvKmKxvbPVGTs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lMnHpL+vhTW2DCzeEp+JjD4dTKshtiO76qcppsELxrs=; b=FyO2sHGuEvedgr7czavZRWlv5W
 T4YTPmUBD55qIw7CU0g0AAyCZGF1YipewRDc0EHStjOwlA90PTy/kxMsX77fiGLJQXOz6N2uihDs3
 SZjQdFSeOzUNKXf0ZsNirRAfur+zYiTjp8Drd1ixUm50XRLTWjeVr7yd6omC8VR6d6mM=;
Received: from mail-ua1-f47.google.com ([209.85.222.47])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rPsOk-0003ya-La for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jan 2024 22:59:15 +0000
Received: by mail-ua1-f47.google.com with SMTP id
 a1e0cc1a2514c-7cdb67ec4caso3067875241.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 16 Jan 2024 14:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705445946; x=1706050746; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lMnHpL+vhTW2DCzeEp+JjD4dTKshtiO76qcppsELxrs=;
 b=Kfb9o4fKPSdBJWgmuAWMrb98yZhTrtz7FLN3yyZ6zI1KxjgmPFSV/Qk2MbV4C7PRSB
 0OW8S3D08Hx+zhD0Gtv9zD8cuSZESQvlBct0SPQOOO5nooUS7ukrTMTQlxdHZ7TJturW
 1KqUfGJkSH70jtsvybfuaQkNKUJQTlsOR1GpAA76NOeQ4m0QOmS/jm9h0DR5TxhXDoUV
 LSB2pqpG9KmaNrLFF0g95urumY84ROpGmDZDl0z4KKKoAQHbOEnAnc/Yu24E8Mn/9vW3
 ZF1tV2BQR3O+m4+SQfRhnfAXp301y7c49D99TxF4hnOo3wCWbZQHYVcYhMO8+S/o046E
 mMyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705445946; x=1706050746;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lMnHpL+vhTW2DCzeEp+JjD4dTKshtiO76qcppsELxrs=;
 b=KwBPuJHl3EhogM1b3hA0jZ8yvnxCGME0NRuG2JPUT9dkBYyWpkK4WZmiOoOMJQNAia
 zIdjNMetppajZRSu1XOTzBDflhuO62nRcCGaVEs1DcCy+OigDvdjCCpt0P0NU8CSRzEL
 +npjXXDEdzFtKDKEdNqUnszrCfRjkYYS2KAU2puZY4+/ptIyo2Qvt9C4w60EGbVxV9zS
 zo7PTB1Nu9JtArdez4IAZIuT89PfQJK8kb1UzNJgCvn/nc9na7T5yjNpSri+Ilgj2heL
 /z6S5koNGzew0zJJ++IcTgy8GuKT0mCHA1cbp8yZQOpBN9TSFst14uat3kukTLPWoUsH
 x0pQ==
X-Gm-Message-State: AOJu0YwB/BkZ0HcaCo84rfiUeHmTMm+jqugj50UxbR9rW2/G1lLv07uT
 zLHOoHeO3mwdacU1JtAyBMk2FvaLGK3XBWNxW0zvDCealzg=
X-Google-Smtp-Source: AGHT+IHWq/tEZLCUuFynVNiAxScW31SKXfD359pdij+7fjmjDwJHwaJMjLO/OhGHOkleKQFY4FtoqimceHAxrZGHfeI=
X-Received: by 2002:a67:fb91:0:b0:467:cd7c:b9f1 with SMTP id
 n17-20020a67fb91000000b00467cd7cb9f1mr4253480vsr.12.1705445945695; Tue, 16
 Jan 2024 14:59:05 -0800 (PST)
MIME-Version: 1.0
References: <20240116143422.1268-1-qwjhust@gmail.com>
In-Reply-To: <20240116143422.1268-1-qwjhust@gmail.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Tue, 16 Jan 2024 14:58:54 -0800
Message-ID: <CACOAw_zP_=w21p__X5hD8Br8tARLHozn5REA5maW8OU2M=AAhg@mail.gmail.com>
To: Wenjie Qi <qwjhust@gmail.com>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Tue, Jan 16, 2024 at 6:36 AM Wenjie Qi wrote: > > We
   can get the number of remaining available zone > resources by subtracting
   the number of active logs from > the number of max active zones of [...] 
 
 Content analysis details:   (0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.222.47 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.222.47 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rPsOk-0003ya-La
Subject: Re: [f2fs-dev] [PATCH v1] f2fs: fix max open zone constraints
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org, hustqwj@hust.edu.cn,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVHVlLCBKYW4gMTYsIDIwMjQgYXQgNjozNuKAr0FNIFdlbmppZSBRaSA8cXdqaHVzdEBnbWFp
bC5jb20+IHdyb3RlOgo+Cj4gV2UgY2FuIGdldCB0aGUgbnVtYmVyIG9mIHJlbWFpbmluZyBhdmFp
bGFibGUgem9uZQo+IHJlc291cmNlcyBieSBzdWJ0cmFjdGluZyB0aGUgbnVtYmVyIG9mIGFjdGl2
ZSBsb2dzIGZyb20KPiB0aGUgbnVtYmVyIG9mIG1heCBhY3RpdmUgem9uZXMgb2Ygem9uZWQgZGV2
aWNlcy4gV2UgY2FuCj4gdXNlIHRoZXNlIGF2YWlsYWJsZSB6b25lIHJlc291cmNlcyB0byByZWR1
Y2UgdGhlIG51bWJlcgo+IG9mIHBlbmRpbmcgYmlvIHdoZW4gc3dpdGNoaW5nIHpvbmVzLgo+IElm
IG1heCBhY3RpdmUgem9uZXMgaXMgMCwgdGhlcmUgaXMgbm8gbGltaXQuCj4KPiBTaWduZWQtb2Zm
LWJ5OiBXZW5qaWUgUWkgPHF3amh1c3RAZ21haWwuY29tPgo+IC0tLQo+ICBmcy9mMmZzL2RhdGEu
YyAgfCAzMiArKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLQo+ICBmcy9mMmZzL2YyZnMu
aCAgfCAgMiArKwo+ICBmcy9mMmZzL3N1cGVyLmMgfCAxMSArKysrKysrKysrKwo+ICAzIGZpbGVz
IGNoYW5nZWQsIDM4IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0
IGEvZnMvZjJmcy9kYXRhLmMgYi9mcy9mMmZzL2RhdGEuYwo+IGluZGV4IGRjZThkZWZkZjRjNy4u
MGI2MmNhMjk2MDc0IDEwMDY0NAo+IC0tLSBhL2ZzL2YyZnMvZGF0YS5jCj4gKysrIGIvZnMvZjJm
cy9kYXRhLmMKPiBAQCAtMzkyLDYgKzM5MiwxOSBAQCBzdGF0aWMgdm9pZCBmMmZzX3pvbmVfd3Jp
dGVfZW5kX2lvKHN0cnVjdCBiaW8gKmJpbykKPiAgICAgICAgIGNvbXBsZXRlKCZpby0+em9uZV93
YWl0KTsKPiAgICAgICAgIGYyZnNfd3JpdGVfZW5kX2lvKGJpbyk7Cj4gIH0KPiArCj4gK3N0YXRp
YyB2b2lkIGYyZnNfem9uZV93cml0ZV9lbmRfaW9fbm93YWl0KHN0cnVjdCBiaW8gKmJpbykKPiAr
ewo+ICsjaWZkZWYgQ09ORklHX0YyRlNfSU9TVEFUCj4gKyAgICAgICBzdHJ1Y3QgYmlvX2lvc3Rh
dF9jdHggKmlvc3RhdF9jdHggPSBiaW8tPmJpX3ByaXZhdGU7Cj4gKyAgICAgICBzdHJ1Y3QgZjJm
c19zYl9pbmZvICpzYmkgPSBpb3N0YXRfY3R4LT5zYmk7Cj4gKyNlbHNlCj4gKyAgICAgICBzdHJ1
Y3QgZjJmc19zYl9pbmZvICpzYmkgPSAoc3RydWN0IGYyZnNfc2JfaW5mbyAqKWJpby0+YmlfcHJp
dmF0ZTsKPiArI2VuZGlmCj4gKwo+ICsgICAgICAgYXRvbWljX2luYygmc2JpLT5hdmFpbGFibGVf
YWN0aXZlX3pvbmVzKTsKPiArICAgICAgIGYyZnNfd3JpdGVfZW5kX2lvKGJpbyk7Cj4gK30KPiAg
I2VuZGlmCgpJIGRvbid0IHRoaW5rIHRoaXMgd29ya3MuIExldCdzIGFzc3VtZSB3ZSBzdGFydCB3
aXRoIDIKYXZhaWxhYmxlX2FjdGl2ZV96b25lcyBhbmQgNCBhY3RpdmUgbG9ncy4KSG93IGFib3V0
IDQgYWN0aXZlIGxvZ3MgcmVhY2ggYXQgdGhlIGVuZCBvZiB0aGUgem9uZXMgYXQgdGhlIHNhbWUg
dGltZT8KCj4KPiAgc3RydWN0IGJsb2NrX2RldmljZSAqZjJmc190YXJnZXRfZGV2aWNlKHN0cnVj
dCBmMmZzX3NiX2luZm8gKnNiaSwKPiBAQCAtMTA4NSwxNCArMTA5OCwxOSBAQCB2b2lkIGYyZnNf
c3VibWl0X3BhZ2Vfd3JpdGUoc3RydWN0IGYyZnNfaW9faW5mbyAqZmlvKQo+ICAgICAgICAgICAg
ICAgICBnb3RvIG5leHQ7Cj4gIG91dDoKPiAgI2lmZGVmIENPTkZJR19CTEtfREVWX1pPTkVECj4g
LSAgICAgICBpZiAoZjJmc19zYl9oYXNfYmxrem9uZWQoc2JpKSAmJiBidHlwZSA8IE1FVEEgJiYK
PiArICAgICAgIGlmIChmMmZzX3NiX2hhc19ibGt6b25lZChzYmkpICYmIHNiaS0+bWF4X2FjdGl2
ZV96b25lcyAmJiBidHlwZSA8IE1FVEEgJiYKPiAgICAgICAgICAgICAgICAgICAgICAgICBpc19l
bmRfem9uZV9ibGthZGRyKHNiaSwgZmlvLT5uZXdfYmxrYWRkcikpIHsKPiAtICAgICAgICAgICAg
ICAgYmlvX2dldChpby0+YmlvKTsKPiAtICAgICAgICAgICAgICAgcmVpbml0X2NvbXBsZXRpb24o
JmlvLT56b25lX3dhaXQpOwo+IC0gICAgICAgICAgICAgICBpby0+YmlfcHJpdmF0ZSA9IGlvLT5i
aW8tPmJpX3ByaXZhdGU7Cj4gLSAgICAgICAgICAgICAgIGlvLT5iaW8tPmJpX3ByaXZhdGUgPSBp
bzsKPiAtICAgICAgICAgICAgICAgaW8tPmJpby0+YmlfZW5kX2lvID0gZjJmc196b25lX3dyaXRl
X2VuZF9pbzsKPiAtICAgICAgICAgICAgICAgaW8tPnpvbmVfcGVuZGluZ19iaW8gPSBpby0+Ymlv
Owo+ICsgICAgICAgICAgICAgICBpZiAoIWF0b21pY19hZGRfbmVnYXRpdmUoLTEsICZzYmktPmF2
YWlsYWJsZV9hY3RpdmVfem9uZXMpKSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgaW8tPmJp
by0+YmlfZW5kX2lvID0gZjJmc196b25lX3dyaXRlX2VuZF9pb19ub3dhaXQ7Cj4gKyAgICAgICAg
ICAgICAgIH0gZWxzZSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgYXRvbWljX2luYygmc2Jp
LT5hdmFpbGFibGVfYWN0aXZlX3pvbmVzKTsKPiArICAgICAgICAgICAgICAgICAgICAgICBiaW9f
Z2V0KGlvLT5iaW8pOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJlaW5pdF9jb21wbGV0aW9u
KCZpby0+em9uZV93YWl0KTsKPiArICAgICAgICAgICAgICAgICAgICAgICBpby0+YmlfcHJpdmF0
ZSA9IGlvLT5iaW8tPmJpX3ByaXZhdGU7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgaW8tPmJp
by0+YmlfcHJpdmF0ZSA9IGlvOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIGlvLT5iaW8tPmJp
X2VuZF9pbyA9IGYyZnNfem9uZV93cml0ZV9lbmRfaW87Cj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgaW8tPnpvbmVfcGVuZGluZ19iaW8gPSBpby0+YmlvOwo+ICsgICAgICAgICAgICAgICB9Cj4g
ICAgICAgICAgICAgICAgIF9fc3VibWl0X21lcmdlZF9iaW8oaW8pOwo+ICAgICAgICAgfQo+ICAj
ZW5kaWYKPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9mMmZzLmggYi9mcy9mMmZzL2YyZnMuaAo+IGlu
ZGV4IDY1Mjk0ZTNiMGJlZi4uMmFhZGUzNjdhYzY2IDEwMDY0NAo+IC0tLSBhL2ZzL2YyZnMvZjJm
cy5oCj4gKysrIGIvZnMvZjJmcy9mMmZzLmgKPiBAQCAtMTU1MSw2ICsxNTUxLDggQEAgc3RydWN0
IGYyZnNfc2JfaW5mbyB7Cj4KPiAgI2lmZGVmIENPTkZJR19CTEtfREVWX1pPTkVECj4gICAgICAg
ICB1bnNpZ25lZCBpbnQgYmxvY2tzX3Blcl9ibGt6OyAgICAgICAgICAgLyogRjJGUyBibG9ja3Mg
cGVyIHpvbmUgKi8KPiArICAgICAgIHVuc2lnbmVkIGludCBtYXhfYWN0aXZlX3pvbmVzOyAgICAg
ICAgICAvKiBtYXggem9uZSByZXNvdXJjZXMgb2YgdGhlIHpvbmVkIGRldmljZSAqLwo+ICsgICAg
ICAgYXRvbWljX3QgYXZhaWxhYmxlX2FjdGl2ZV96b25lczsgICAgICAgIC8qIHJlbWFpbmluZyB6
b25lIHJlc291cmNlcyBmb3Igem9uZSBzd2l0Y2ggKi8KPiAgI2VuZGlmCj4KPiAgICAgICAgIC8q
IGZvciBub2RlLXJlbGF0ZWQgb3BlcmF0aW9ucyAqLwo+IGRpZmYgLS1naXQgYS9mcy9mMmZzL3N1
cGVyLmMgYi9mcy9mMmZzL3N1cGVyLmMKPiBpbmRleCAyMDZkMDNjODJkOTYuLjY3MTEyODNmZjE4
NyAxMDA2NDQKPiAtLS0gYS9mcy9mMmZzL3N1cGVyLmMKPiArKysgYi9mcy9mMmZzL3N1cGVyLmMK
PiBAQCAtMjM4NSw2ICsyMzg1LDEyIEBAIHN0YXRpYyBpbnQgZjJmc19yZW1vdW50KHN0cnVjdCBz
dXBlcl9ibG9jayAqc2IsIGludCAqZmxhZ3MsIGNoYXIgKmRhdGEpCj4gICAgICAgICBpZiAoZXJy
KQo+ICAgICAgICAgICAgICAgICBnb3RvIHJlc3RvcmVfb3B0czsKPgo+ICsjaWZkZWYgQ09ORklH
X0JMS19ERVZfWk9ORUQKPiArICAgICAgIGlmIChzYmktPm1heF9hY3RpdmVfem9uZXMpCj4gKyAg
ICAgICAgICAgICAgIGF0b21pY19zZXQoJnNiaS0+YXZhaWxhYmxlX2FjdGl2ZV96b25lcywKPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNiaS0+bWF4X2FjdGl2ZV96b25lcyAtIEYy
RlNfT1BUSU9OKHNiaSkuYWN0aXZlX2xvZ3MpOwo+ICsjZW5kaWYKPiArCj4gICAgICAgICAvKiBm
bHVzaCBvdXRzdGFuZGluZyBlcnJvcnMgYmVmb3JlIGNoYW5naW5nIGZzIHN0YXRlICovCj4gICAg
ICAgICBmbHVzaF93b3JrKCZzYmktPnNfZXJyb3Jfd29yayk7Cj4KPiBAQCAtMzkzMiw2ICszOTM4
LDExIEBAIHN0YXRpYyBpbnQgaW5pdF9ibGt6X2luZm8oc3RydWN0IGYyZnNfc2JfaW5mbyAqc2Jp
LCBpbnQgZGV2aSkKPiAgICAgICAgIGlmICghZjJmc19zYl9oYXNfYmxrem9uZWQoc2JpKSkKPiAg
ICAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4KPiArICAgICAgIHNiaS0+bWF4X2FjdGl2ZV96b25l
cyA9IGJkZXZfbWF4X2FjdGl2ZV96b25lcyhiZGV2KTsKPiArICAgICAgIGlmIChzYmktPm1heF9h
Y3RpdmVfem9uZXMpCj4gKyAgICAgICAgICAgICAgIGF0b21pY19zZXQoJnNiaS0+YXZhaWxhYmxl
X2FjdGl2ZV96b25lcywKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNiaS0+bWF4
X2FjdGl2ZV96b25lcyAtIEYyRlNfT1BUSU9OKHNiaSkuYWN0aXZlX2xvZ3MpOwo+ICsKCk5lZWQg
dG8gbWFrZSBhdmFpbGFibGVfYWN0aXZlX3pvbmVzIG5vdCBiZSBuZWdhdGl2ZSwgcmlnaHQ/Ckht
bSwgbmVlZCB0byBtYWtlIHN1cmUgYWN0aXZlX2xvZ3Mgc2hvdWxkIGJlIGVxdWFsIG9yIGxlc3Mg
dGhhbgptYXhfYWN0aXZlX3pvbmVzLgoKPiAgICAgICAgIHpvbmVfc2VjdG9ycyA9IGJkZXZfem9u
ZV9zZWN0b3JzKGJkZXYpOwo+ICAgICAgICAgaWYgKCFpc19wb3dlcl9vZl8yKHpvbmVfc2VjdG9y
cykpIHsKPiAgICAgICAgICAgICAgICAgZjJmc19lcnIoc2JpLCAiRjJGUyBkb2VzIG5vdCBzdXBw
b3J0IG5vbiBwb3dlciBvZiAyIHpvbmUgc2l6ZXNcbiIpOwo+IC0tCj4gMi4zNC4xCj4KPgo+Cj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51eC1m
MmZzLWRldmVsIG1haWxpbmcgbGlzdAo+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9y
Z2UubmV0Cj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGlu
dXgtZjJmcy1kZXZlbAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlz
dHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xp
c3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
