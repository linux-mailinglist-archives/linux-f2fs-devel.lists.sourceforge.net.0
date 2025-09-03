Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D2364B4111D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  3 Sep 2025 02:04:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j5pD8isjrtbEKhSFgUF1ILCVYrePOkmWxXYahOwD8wQ=; b=LjJNf4mchosA11AbX1oscbSZL+
	6rlfNPzT5ZFD0IGby8spp7RoX9s69J5AlPhlTn1JKfeb1Os88ft5jsoRGquf2a59JkcjQ+SIHIhkV
	JHzx6Yb4HAuqVM6rfC92uhlvGwwj2cDP/z49rkkU7f5X7eVe7p1AH+EEUDFAtrfw5z8g=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1utazS-00062o-Mv;
	Wed, 03 Sep 2025 00:04:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1utazQ-00062X-Qj
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 03 Sep 2025 00:04:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VFT0993H0f3lSRwLyOXZyKYupjb06de0ECwWb05sIzE=; b=JNDC0SQBCINv7WhrcQmSboYX3u
 oPrrtSNNNO5/YUUJmIgAz9MPveKbM9JZneHYIGiYLRjJyMvv326g1C9XrlNax4DQU9tTaoRBRIT1E
 9tr4Nsj93QEBSwG7b2kgx6VyfleQU7nVXieRv1RdI0Fq7h0Xb0r9iwOeygUPPw+uw04s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VFT0993H0f3lSRwLyOXZyKYupjb06de0ECwWb05sIzE=; b=QsLrMRmBQA1/1C2KkZ/FU4lfkO
 ccA4554mnzlggtt04sZbVjbnlS+O5XrqulsnGLnC9Ct710PJLAXv7NM8UrPhbbOReEp5Hcs0sJYVn
 Oc2Lj6fOA74IUmaXJlFukvT6NRw/ZXZ44Z4jltcGFshxJAuyMVAFQm34xdF5qn+qLiRg=;
Received: from mail-wr1-f51.google.com ([209.85.221.51])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1utazR-0000TO-56 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 03 Sep 2025 00:04:41 +0000
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-3d6af847306so320883f8f.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 02 Sep 2025 17:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756857875; x=1757462675; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VFT0993H0f3lSRwLyOXZyKYupjb06de0ECwWb05sIzE=;
 b=VZZ8AG8Zb00ox591pBYHkk4m35ZqfVWk7Df6xHZqdhUmiCpOQjwVSuEd34+N5PdFXb
 EKc3zq31pkJFOCkpYpUQ5r9K4tvCVdkYPPibZ9szthEXbGSDy1RxidFF2XcDsNrjazQp
 +X0V3QNXyihVw0wq3eXEvQOCFlssf4zDI17Fg7kUtWlX1eqhYH06quwbMUxC1xW8364+
 qURNZrH67AQjaD5Vn5faxk+NJgz1qN9OfV14GjrPlhxMwVOrHFHTFEyew1m8W+4QlhA3
 jwDWoNfHLYfe73F9kf9ET/8GnS+mPz2oA49NnuqkPBSwZXIp94wIC+/lXzipBVXxBFPI
 jkaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756857875; x=1757462675;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VFT0993H0f3lSRwLyOXZyKYupjb06de0ECwWb05sIzE=;
 b=P2vIj6fGJ4o9eTe5A/XbScEtGgCMf5KdPvF+6RA13tNh8zbAI5Wvm3RwYa9hK5hRMc
 3AqqiS8kR/Tftu9s+9MLgCCDlDBL5o4ClIh0pUVLzm1CKRT69Vm/5kFD5VXV8ds68c6R
 tCHkUWoYMuZeXU5i0O2mXDDt67HSJBCiYwOf9sR9aQ4xo35qT78EMn9iCHTtHtY4v4uT
 0UNtHGuUMbh8Ar2cUr7kuyev6YcVJ5KHW7yfGp3NuUoYozPdhSq+/b2PdFlISs+49jK4
 ZNtmL3JBRjC1BKVstfCpegR9+PLwO073W34jtbihblupwpoenKLPIIXHE4QevAQPbiNA
 31cA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhNL3AZB8qLmv9fCU9O7V5Vi71yVKuCMpeXF/eYfboLCbLkZtbPCbflCHfnyVO6Y6K5Toxqki+Tgs9NM6sS8Xy@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yz9Hu+eaicy80MsqlWCRLyOVb5IeyN3gKxyA6p28o/aEYuLAENx
 f0MFLpzc4W+EcjRH46mpX+Nmh3uDYmzCXl9wwneVriq69+tHZe3Y6qzcsTXMsA6cD/GdfU2pMI+
 dVPWBakGsVTCniRspg9jQV3FXYI6JId0=
X-Gm-Gg: ASbGncskiyOvCATwKdWVCnWNzLGlbLw6Sd65X5s73nlHeSWfMOKpiSfeAClvcqtWKQF
 Q5+xjsn+h6RU5+Xxksw2PJ99zRfsD1rL7PZfQ12kMwM9fRvRinOLv/U4GuTxpCrq8QILzj0ghTT
 PiSBo4U8JTp0PV7H+UqYTHSLWEsM4sHOrDtzwe4QfKHEUt6F/NWsoS0wcQRSVn3nZ+GjBeER1+K
 C9Fz1PF
X-Google-Smtp-Source: AGHT+IGqW35H5UgfmfxDfBL9yusOur8P4EnLb/epAceWy5YZVyLSodTUjHQMG3MHtkX0sWJEhvbg18RydhRPS0Eotg8=
X-Received: by 2002:a05:6000:2482:b0:3ce:f0a5:d576 with SMTP id
 ffacd0b85a97d-3d0fb7e9163mr6244228f8f.7.1756857874400; Tue, 02 Sep 2025
 17:04:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250901020416.2172182-1-chao@kernel.org>
In-Reply-To: <20250901020416.2172182-1-chao@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Wed, 3 Sep 2025 08:04:22 +0800
X-Gm-Features: Ac12FXygM-8n9olifRKUqf3wFjXBZ84sBgxB75imDizF56WMYg93MrmCvQJ8zxo
Message-ID: <CAHJ8P3+NJfE+F-Tsbw4Rz6PyT9o2F74kyrJncLqyQv+YeOSvgA@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-1.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Chao Yu via Linux-f2fs-devel 于2025年9月1日周一 10:08写道：
    > > It reports a bug from device w/ zufs: > > F2FS-fs (dm-64): Inconsistent
    segment (173822) type [1, 0] in SSA and SIT > F2FS-fs [...] 
 
 Content analysis details:   (0.1 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail provider
                             [niuzhiguo84(at)gmail.com]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
                             digit
                             [niuzhiguo84(at)gmail.com]
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.51 listed in wl.mailspike.net]
X-Headers-End: 1utazR-0000TO-56
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to avoid migrating empty section
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Daeho Jeong <daehojeong@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Q2hhbyBZdSB2aWEgTGludXgtZjJmcy1kZXZlbCA8bGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQ+CuS6jjIwMjXlubQ55pyIMeaXpeWRqOS4gCAxMDowOOWGmemBk++8mgo+Cj4g
SXQgcmVwb3J0cyBhIGJ1ZyBmcm9tIGRldmljZSB3LyB6dWZzOgo+Cj4gRjJGUy1mcyAoZG0tNjQp
OiBJbmNvbnNpc3RlbnQgc2VnbWVudCAoMTczODIyKSB0eXBlIFsxLCAwXSBpbiBTU0EgYW5kIFNJ
VAo+IEYyRlMtZnMgKGRtLTY0KTogU3RvcHBlZCBmaWxlc3lzdGVtIGR1ZSB0byByZWFzb246IDQK
Pgo+IFRocmVhZCBBICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBUaHJlYWQgQgo+IC0g
ZjJmc19leHBhbmRfaW5vZGVfZGF0YQo+ICAtIGYyZnNfYWxsb2NhdGVfcGlubmluZ19zZWN0aW9u
Cj4gICAtIGYyZnNfZ2NfcmFuZ2UKPiAgICAtIGRvX2dhcmJhZ2VfY29sbGVjdCB3LyBzZWdubyAj
eAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtIHdyaXRlcGFnZQo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLSBmMmZzX2FsbG9jYXRl
X2RhdGFfYmxvY2sKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAt
IG5ld19jdXJzZWcKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
LSBhbGxvY2F0ZSBzZWdubyAjeAo+Cj4gVGhlIHJvb3QgY2F1c2UgaXM6IGZhbGxvY2F0ZSBvbiBw
aW5uaW5nIGZpbGUgbWF5IHJhY2Ugdy8gYmxvY2sgYWxsb2NhdGlvbgo+IGFzIGFib3ZlLCByZXN1
bHQgaW4gZG9fZ2FyYmFnZV9jb2xsZWN0KCkgZnJvbSBmYWxsb2NhdGUoKSBtYXkgbWlncmF0ZQo+
IHNlZ21lbnQgd2hpY2ggaXMganVzdCBhbGxvY2F0ZWQgYnkgYSBsb2csIHRoZSBsb2cgd2lsbCB1
cGRhdGUgc2VnbWVudCB0eXBlCj4gaW4gaXRzIGluLW1lbW9yeSBzdHJ1Y3R1cmUsIGhvd2V2ZXIg
R0Mgd2lsbCBnZXQgc2VnbWVudCB0eXBlIGZyb20gb24tZGlzawo+IFNTQSBibG9jaywgb25jZSBz
ZWdtZW50IHR5cGUgY2hhbmdlcyBieSBsb2csIHdlIGNhbiBkZXRlY3Qgc3VjaAo+IGluY29uc2lz
dGVuY3ksIHRoZW4gc2h1dGRvd24gZmlsZXN5c3RlbS4KPgo+IEluIHRoaXMgY2FzZSwgb24tZGlz
ayBTU0Egc2hvd3MgdHlwZSBvZiBzZWdubyAjMTczODIyIGlzIDEgKFNVTV9UWVBFX05PREUpLAo+
IGhvd2V2ZXIgc2Vnbm8gIzE3MzgyMiB3YXMganVzdCBhbGxvY2F0ZWQgYXMgZGF0YSB0eXBlIHNl
Z21lbnQsIHNvIGluLW1lbW9yeQo+IFNJVCBzaG93cyB0eXBlIG9mIHNlZ25vICMxNzM4MjIgaXMg
MCAoU1VNX1RZUEVfREFUQSkuCj4KPiBDaGFuZ2UgYXMgYmVsb3cgdG8gZml4IHRoaXMgaXNzdWU6
Cj4gLSBjaGVjayB3aGV0aGVyIGN1cnJlbnQgc2VjdGlvbiBpcyBlbXB0eSBiZWZvcmUgZ2MKPiAt
IGFkZCBzYW5pdHkgY2hlY2tzIG9uIGRvX2dhcmJhZ2VfY29sbGVjdCgpIHRvIGF2b2lkIGFueSBy
YWNlIGNhc2UsIHJlc3VsdAo+IGluIG1pZ3JhdGluZyBzZWdtZW50IHVzZWQgYnkgbG9nLgo+IC0g
YnR3LCBpdCBmaXhlcyBtaXNjIGlzc3VlIGluIHByaW50ZWQgbG9nczogIlNTQSBhbmQgU0lUIiAt
PiAiU0lUIGFuZCBTU0EiLgo+Cj4gRml4ZXM6IDk3MDNkNjlkOWQxNSAoImYyZnM6IHN1cHBvcnQg
ZmlsZSBwaW5uaW5nIGZvciB6b25lZCBkZXZpY2VzIikKPiBDYzogRGFlaG8gSmVvbmcgPGRhZWhv
amVvbmdAZ29vZ2xlLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBDaGFvIFl1IDxjaGFvQGtlcm5lbC5v
cmc+Cj4gLS0tCj4gIGZzL2YyZnMvZ2MuYyB8IDE2ICsrKysrKysrKysrKysrKy0KPiAgMSBmaWxl
IGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQg
YS9mcy9mMmZzL2djLmMgYi9mcy9mMmZzL2djLmMKPiBpbmRleCBlZDNhY2JmYzgzY2EuLmE3NzA4
Y2Y4MGMwNCAxMDA2NDQKPiAtLS0gYS9mcy9mMmZzL2djLmMKPiArKysgYi9mcy9mMmZzL2djLmMK
PiBAQCAtMTc5NCw2ICsxNzk0LDEzIEBAIHN0YXRpYyBpbnQgZG9fZ2FyYmFnZV9jb2xsZWN0KHN0
cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKPiAgICAgICAgICAgICAgICAgc3RydWN0IGZvbGlvICpz
dW1fZm9saW8gPSBmaWxlbWFwX2dldF9mb2xpbyhNRVRBX01BUFBJTkcoc2JpKSwKPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgR0VUX1NVTV9CTE9DSyhzYmksIHNlZ25v
KSk7Cj4KPiArICAgICAgICAgICAgICAgaWYgKGlzX2N1cnNlYyhzYmksIEdFVF9TRUNfRlJPTV9T
RUcoc2JpLCBzZWdubykpKSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgZjJmc19lcnIoc2Jp
LCAiJXM6IHNlZ21lbnQgJXUgaXMgdXNlZCBieSBsb2ciLAo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgX19mdW5jX18sIHNlZ25vKTsKPiAr
ICAgICAgICAgICAgICAgICAgICAgICBmMmZzX2J1Z19vbihzYmksIDEpOwpIaSBDaGFvLApEbyB3
ZSBuZWVkIGYyZnNfYnVnX29uIGhlcmU/ICBvciBpdCBpcyBlbm91Z2ggdG8gc2tpcCBjdXJyZW50
IHNlZ25vCmFuZCBsZXQgZ2MgY29udGludWU/ClRoYW5rcyEKPiArICAgICAgICAgICAgICAgICAg
ICAgICBnb3RvIHNraXA7Cj4gKyAgICAgICAgICAgICAgIH0KPiArCj4gICAgICAgICAgICAgICAg
IGlmIChnZXRfdmFsaWRfYmxvY2tzKHNiaSwgc2Vnbm8sIGZhbHNlKSA9PSAwKQo+ICAgICAgICAg
ICAgICAgICAgICAgICAgIGdvdG8gZnJlZWQ7Cj4gICAgICAgICAgICAgICAgIGlmIChnY190eXBl
ID09IEJHX0dDICYmIF9faXNfbGFyZ2Vfc2VjdGlvbihzYmkpICYmCj4gQEAgLTE4MDUsNyArMTgx
Miw3IEBAIHN0YXRpYyBpbnQgZG9fZ2FyYmFnZV9jb2xsZWN0KHN0cnVjdCBmMmZzX3NiX2luZm8g
KnNiaSwKPgo+ICAgICAgICAgICAgICAgICBzdW0gPSBmb2xpb19hZGRyZXNzKHN1bV9mb2xpbyk7
Cj4gICAgICAgICAgICAgICAgIGlmICh0eXBlICE9IEdFVF9TVU1fVFlQRSgoJnN1bS0+Zm9vdGVy
KSkpIHsKPiAtICAgICAgICAgICAgICAgICAgICAgICBmMmZzX2VycihzYmksICJJbmNvbnNpc3Rl
bnQgc2VnbWVudCAoJXUpIHR5cGUgWyVkLCAlZF0gaW4gU1NBIGFuZCBTSVQiLAo+ICsgICAgICAg
ICAgICAgICAgICAgICAgIGYyZnNfZXJyKHNiaSwgIkluY29uc2lzdGVudCBzZWdtZW50ICgldSkg
dHlwZSBbJWQsICVkXSBpbiBTSVQgYW5kIFNTQSIsCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgc2Vnbm8sIHR5cGUsIEdFVF9TVU1fVFlQRSgoJnN1bS0+Zm9vdGVyKSkpOwo+ICAg
ICAgICAgICAgICAgICAgICAgICAgIGYyZnNfc3RvcF9jaGVja3BvaW50KHNiaSwgZmFsc2UsCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBTVE9QX0NQX1JFQVNPTl9DT1JSVVBURURf
U1VNTUFSWSk7Cj4gQEAgLTIwNjgsNiArMjA3NSwxMyBAQCBpbnQgZjJmc19nY19yYW5nZShzdHJ1
Y3QgZjJmc19zYl9pbmZvICpzYmksCj4gICAgICAgICAgICAgICAgICAgICAgICAgLmlyb290ID0g
UkFESVhfVFJFRV9JTklUKGdjX2xpc3QuaXJvb3QsIEdGUF9OT0ZTKSwKPiAgICAgICAgICAgICAg
ICAgfTsKPgo+ICsgICAgICAgICAgICAgICAvKgo+ICsgICAgICAgICAgICAgICAgKiBhdm9pZCBt
aWdyYXRpbmcgZW1wdHkgc2VjdGlvbiwgYXMgaXQgY2FuIGJlIGFsbG9jYXRlZCBieQo+ICsgICAg
ICAgICAgICAgICAgKiBsb2cgaW4gcGFyYWxsZWwuCj4gKyAgICAgICAgICAgICAgICAqLwo+ICsg
ICAgICAgICAgICAgICBpZiAoIWdldF92YWxpZF9ibG9ja3Moc2JpLCBzZWdubywgdHJ1ZSkpCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4gKwo+ICAgICAgICAgICAgICAgICBp
ZiAoaXNfY3Vyc2VjKHNiaSwgR0VUX1NFQ19GUk9NX1NFRyhzYmksIHNlZ25vKSkpCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4KPiAtLQo+IDIuNDkuMAo+Cj4KPgo+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTGludXgtZjJmcy1k
ZXZlbCBtYWlsaW5nIGxpc3QKPiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5l
dAo+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYy
ZnMtZGV2ZWwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNv
dXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5m
by9saW51eC1mMmZzLWRldmVsCg==
