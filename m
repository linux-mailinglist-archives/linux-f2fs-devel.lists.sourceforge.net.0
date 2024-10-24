Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6329AE191
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 24 Oct 2024 11:55:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t3uYq-0007nj-Hu;
	Thu, 24 Oct 2024 09:55:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sunyibuaa@gmail.com>) id 1t3uYp-0007nd-MO
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Oct 2024 09:55:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=re9grESPsROw4zpnxpNKH6B4r66eUYUwYnoDT6vR9H8=; b=DO7w+f3AnmU6quKtktZy7b3NRX
 n699RbwL49pakgPuk4k6yAQ9mcoF51o+yeVma+OaN8Pxwla2cmpEe4fvIXRUb9K81UZXzEDXlTa/v
 LcIZm3C0qOF8KVEkvAD2WccUtbWjD3VNaC1HAK7sTi1in19mPIYd2V5F73Cx+MsU2mCI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=re9grESPsROw4zpnxpNKH6B4r66eUYUwYnoDT6vR9H8=; b=HWA6iGpUwGjL6f/osvemclvmR5
 bfGaemvf7H7f29dTnUyvHUiY5RKn5suGUbeMTqgCBL/gt+XcekS6+o0SlDzMVhEOm6Euq9l3N05At
 2oAUhCnErm40jTlVYp/PJY7VCR47ISt18R+7lF+cTmr+DJdbDvmdVwu3/PZLLFRW1h34=;
Received: from mail-lf1-f48.google.com ([209.85.167.48])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1t3uYp-0006kn-Ja for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Oct 2024 09:55:20 +0000
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-53a097aa3daso563068e87.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 24 Oct 2024 02:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729763708; x=1730368508; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=re9grESPsROw4zpnxpNKH6B4r66eUYUwYnoDT6vR9H8=;
 b=Grmki7cbr1wmutz78skc1QVQALJ9k3V+ylUPK/opbxeOCv9Dxxlfqgg7Y1rV+EvA1V
 ExMwmBhlW0P9k8BXygOC8Pdewz3+vGRAZdJM8R6Wr6/J3jRkEuO9Zu7YlCXMZWicMVc7
 j07tyi5Lm/H9/26JLKS89CQobumFMm9Ef6KpEhG6OeIrDXPPgZnt4GVQeB1WxhnNywB3
 ZGdFRRcrTbjq506X8Xp0+HK+4LiXnuFBvjVKBH/52fnQELY3+PlTeSZ2LEP3KPI1FEBL
 Fg+I25yXPay4hO3TEmi9P02QMyGqLysV8pMGUYbhlGXApVdzhDpzdHFKsVryk/C4Wysp
 6I7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729763708; x=1730368508;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=re9grESPsROw4zpnxpNKH6B4r66eUYUwYnoDT6vR9H8=;
 b=mFpUKGB3BmiLf55xnbvkINe7qv0xDyP6cFShAtERKxPtlta6pivuQ5rg/nFW2LsTuj
 ZmOtUTfE4W+wUfu5eJ+fR0Z2VilO8ir7/eDoe8m4Quir8gG8toZDfhsErKMa09nwyrrO
 KfVEmtXIe2/krkix4suxWjCvvv/ggD0PINdHikAYSze2zA/AcDfQJuVCg+Pe35qFX3Ea
 WU1J/okZIva+DHjDu2a/HUbM4390qyJnvGYMFSvQE6hepL4mBAms+6zspaBrLbttxEtn
 fiY+aXA4AEKq8ZOT4i6V0mPoesC5Kf4L86ZGsdXQwRba1kZ+FbvcQrwptpiVhPUpAOgd
 it9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvE+Rzm3eWybBKGs5hOsbUJvn20ZEoBlEJSqHgnam0Pb7RFExArIdnZNixw6iCrupLwMwiEzCi2u/BJ9wT8iuX@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyOq2XN/+UFq+386uadZLrg3Ju9I6sWZbgRn494Cla3XWTNAtgT
 cTWwlg8WwQcCnFvVizFlkAaMyF5KeB2dAY4IFTcfk4caXqstriA2/Y9DmlAkBe+HFR8IW7lqVyw
 flfpO6jnEYsfx6uzdcEO+HAbVD9g=
X-Google-Smtp-Source: AGHT+IHFMgZjQwnppJJD5ToFmpbYjTIfZdG6r2ymPeWmUdrtkmEzH2ZGpePnZY+S1uiLAD/brsBTnlVAc32YtKUkcSI=
X-Received: by 2002:a05:6512:10c9:b0:539:964c:16d9 with SMTP id
 2adb3069b0e04-53b1a381324mr3031885e87.57.1729763707656; Thu, 24 Oct 2024
 02:55:07 -0700 (PDT)
MIME-Version: 1.0
References: <20241016052758.3400359-1-yi.sun@unisoc.com>
 <20241016052758.3400359-3-yi.sun@unisoc.com>
 <52de7b11-e118-433d-b187-0642e81428ef@kernel.org>
In-Reply-To: <52de7b11-e118-433d-b187-0642e81428ef@kernel.org>
From: yi sun <sunyibuaa@gmail.com>
Date: Thu, 24 Oct 2024 17:54:31 +0800
Message-ID: <CALpufv3fCZXM4aD9cUkOQVk6Er-GxjVXhu-ceFnPAC4Mvnnbzw@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -1.9 (-)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Thu, Oct 17, 2024 at 9:40 AM Chao Yu wrote: > > On 2024/10/16
    13:27, Yi Sun wrote: > > When doing truncate, consecutive blocks in the same
    segment > > can be processed at the same time. So that [...] 
 
 Content analysis details:   (-1.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.167.48 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [sunyibuaa[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -1.7 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.167.48 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
X-Headers-End: 1t3uYp-0006kn-Ja
Subject: Re: [f2fs-dev] [RFC PATCH 2/2] f2fs: introduce
 f2fs_invalidate_consecutive_blocks()
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
Cc: ke.wang@unisoc.com, Yi Sun <yi.sun@unisoc.com>,
 linux-kernel@vger.kernel.org, yi sun <sunyibuaa@gmail.com>, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, hao_hao.wang@unisoc.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVGh1LCBPY3QgMTcsIDIwMjQgYXQgOTo0MOKAr0FNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9y
Zz4gd3JvdGU6Cj4KPiBPbiAyMDI0LzEwLzE2IDEzOjI3LCBZaSBTdW4gd3JvdGU6Cj4gPiBXaGVu
IGRvaW5nIHRydW5jYXRlLCBjb25zZWN1dGl2ZSBibG9ja3MgaW4gdGhlIHNhbWUgc2VnbWVudAo+
ID4gY2FuIGJlIHByb2Nlc3NlZCBhdCB0aGUgc2FtZSB0aW1lLiBTbyB0aGF0IHRoZSBlZmZpY2ll
bmN5IG9mCj4gPiBkb2luZyB0cnVuY2F0ZSBjYW4gYmUgaW1wcm92ZWQuCj4gPgo+ID4gQWRkIGYy
ZnNfaW52YWxpZGF0ZV9jb21wcmVzc19wYWdlc19yYW5nZSgpIG9ubHkgZm9yIGRvaW5nIHRydW5j
YXRlLgo+ID4gQWRkIGNoZWNrX2YyZnNfaW52YWxpZGF0ZV9jb25zZWN1dGl2ZV9ibG9ja3MoKSBv
bmx5IGZvciBkb2luZwo+ID4gdHJ1bmNhdGUgYW5kIHRvIGRldGVybWluZSB3aGV0aGVyIHRoZSBi
bG9ja3MgYXJlIGNvbnRpbnVvdXMgYW5kCj4gPiBiZWxvbmcgdG8gdGhlIHNhbWUgc2VnbWVudC4K
PiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBZaSBTdW4gPHlpLnN1bkB1bmlzb2MuY29tPgo+ID4gLS0t
Cj4gPiAgIGZzL2YyZnMvY29tcHJlc3MuYyB8IDE0ICsrKysrKysrKysrKysrCj4gPiAgIGZzL2Yy
ZnMvZjJmcy5oICAgICB8ICA1ICsrKysrCj4gPiAgIGZzL2YyZnMvZmlsZS5jICAgICB8IDM0ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0KPiA+ICAgZnMvZjJmcy9zZWdtZW50LmMg
IHwgMjUgKysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gICA0IGZpbGVzIGNoYW5nZWQsIDc3
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZnMvZjJm
cy9jb21wcmVzcy5jIGIvZnMvZjJmcy9jb21wcmVzcy5jCj4gPiBpbmRleCA3ZjI2NDQwZTg1OTUu
LjcwOTI5YTg3ZTliZiAxMDA2NDQKPiA+IC0tLSBhL2ZzL2YyZnMvY29tcHJlc3MuYwo+ID4gKysr
IGIvZnMvZjJmcy9jb21wcmVzcy5jCj4gPiBAQCAtMjAxNCw2ICsyMDE0LDIwIEBAIHZvaWQgZjJm
c19pbnZhbGlkYXRlX2NvbXByZXNzX3BhZ2VzKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgbmlk
X3QgaW5vKQo+ID4gICAgICAgfSB3aGlsZSAoaW5kZXggPCBlbmQpOwo+ID4gICB9Cj4gPgo+ID4g
K3ZvaWQgZjJmc19pbnZhbGlkYXRlX2NvbXByZXNzX3BhZ2VzX3JhbmdlKHN0cnVjdCBmMmZzX3Ni
X2luZm8gKnNiaSwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYmxv
Y2tfdCBibGthZGRyLCBpbnQgY250KQo+ID4gK3sKPiA+ICsgICAgIGlmICghc2JpLT5jb21wcmVz
c19pbm9kZSkKPiA+ICsgICAgICAgICAgICAgcmV0dXJuOwo+ID4gKwo+ID4gKyAgICAgaWYgKGNu
dCA8IDEpIHsKPiA+ICsgICAgICAgICAgICAgZjJmc19idWdfb24oc2JpLCAxKTsKPiA+ICsgICAg
ICAgICAgICAgY250ID0gMTsKPiA+ICsgICAgIH0KPiA+ICsKPiA+ICsgICAgIGludmFsaWRhdGVf
bWFwcGluZ19wYWdlcyhDT01QUkVTU19NQVBQSU5HKHNiaSksIGJsa2FkZHIsIGJsa2FkZHIgKyBj
bnQgLSAxKTsKPiA+ICt9Cj4gPiArCj4gPiAgIGludCBmMmZzX2luaXRfY29tcHJlc3NfaW5vZGUo
c3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKQo+ID4gICB7Cj4gPiAgICAgICBzdHJ1Y3QgaW5vZGUg
Kmlub2RlOwo+ID4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZjJmcy5oIGIvZnMvZjJmcy9mMmZzLmgK
PiA+IGluZGV4IGNlMDBjYjU0NmY0YS4uOTk3NjdmMzU2NzhmIDEwMDY0NAo+ID4gLS0tIGEvZnMv
ZjJmcy9mMmZzLmgKPiA+ICsrKyBiL2ZzL2YyZnMvZjJmcy5oCj4gPiBAQCAtMzcxNiw2ICszNzE2
LDcgQEAgaW50IGYyZnNfY3JlYXRlX2ZsdXNoX2NtZF9jb250cm9sKHN0cnVjdCBmMmZzX3NiX2lu
Zm8gKnNiaSk7Cj4gPiAgIGludCBmMmZzX2ZsdXNoX2RldmljZV9jYWNoZShzdHJ1Y3QgZjJmc19z
Yl9pbmZvICpzYmkpOwo+ID4gICB2b2lkIGYyZnNfZGVzdHJveV9mbHVzaF9jbWRfY29udHJvbChz
dHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIGJvb2wgZnJlZSk7Cj4gPiAgIHZvaWQgZjJmc19pbnZh
bGlkYXRlX2Jsb2NrcyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIGJsb2NrX3QgYWRkcik7Cj4g
PiArdm9pZCBmMmZzX2ludmFsaWRhdGVfY29uc2VjdXRpdmVfYmxvY2tzKHN0cnVjdCBmMmZzX3Ni
X2luZm8gKnNiaSwgYmxvY2tfdCBhZGRyLCBpbnQgY250KTsKPiA+ICAgYm9vbCBmMmZzX2lzX2No
ZWNrcG9pbnRlZF9kYXRhKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgYmxvY2tfdCBibGthZGRy
KTsKPiA+ICAgaW50IGYyZnNfc3RhcnRfZGlzY2FyZF90aHJlYWQoc3RydWN0IGYyZnNfc2JfaW5m
byAqc2JpKTsKPiA+ICAgdm9pZCBmMmZzX2Ryb3BfZGlzY2FyZF9jbWQoc3RydWN0IGYyZnNfc2Jf
aW5mbyAqc2JpKTsKPiA+IEBAIC00Mzc1LDYgKzQzNzYsOCBAQCB2b2lkIGYyZnNfY2FjaGVfY29t
cHJlc3NlZF9wYWdlKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgc3RydWN0IHBhZ2UgKnBhZ2Us
Cj4gPiAgIGJvb2wgZjJmc19sb2FkX2NvbXByZXNzZWRfcGFnZShzdHJ1Y3QgZjJmc19zYl9pbmZv
ICpzYmksIHN0cnVjdCBwYWdlICpwYWdlLAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBibG9ja190IGJsa2FkZHIpOwo+ID4g
ICB2b2lkIGYyZnNfaW52YWxpZGF0ZV9jb21wcmVzc19wYWdlcyhzdHJ1Y3QgZjJmc19zYl9pbmZv
ICpzYmksIG5pZF90IGlubyk7Cj4gPiArdm9pZCBmMmZzX2ludmFsaWRhdGVfY29tcHJlc3NfcGFn
ZXNfcmFuZ2Uoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLAo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBibG9ja190IGJsa2FkZHIsIGludCBjbnQpOwo+ID4gICAjZGVm
aW5lIGluY19jb21wcl9pbm9kZV9zdGF0KGlub2RlKSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIFwKPiA+ICAgICAgIGRvIHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiAgICAgICAgICAgICAgIHN0cnVjdCBmMmZz
X3NiX2luZm8gKnNiaSA9IEYyRlNfSV9TQihpbm9kZSk7ICAgICAgICAgICAgXAo+ID4gQEAgLTQ0
MzIsNiArNDQzNSw4IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBmMmZzX2xvYWRfY29tcHJlc3NlZF9w
YWdlKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHN0cnVjdCBwYWdlICpwYWdlLCBibG9ja190IGJsa2FkZHIpIHsgcmV0dXJuIGZhbHNl
OyB9Cj4gPiAgIHN0YXRpYyBpbmxpbmUgdm9pZCBmMmZzX2ludmFsaWRhdGVfY29tcHJlc3NfcGFn
ZXMoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbmlkX3QgaW5vKSB7IH0KPiA+ICtzdGF0aWMg
aW5saW5lIHZvaWQgZjJmc19pbnZhbGlkYXRlX2NvbXByZXNzX3BhZ2VzX3JhbmdlKHN0cnVjdCBm
MmZzX3NiX2luZm8gKnNiaSwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBibG9ja190IGJsa2FkZHIsIGludCBjbnQpIHsgfQo+ID4gICAjZGVmaW5lIGlu
Y19jb21wcl9pbm9kZV9zdGF0KGlub2RlKSAgICAgICAgIGRvIHsgfSB3aGlsZSAoMCkKPiA+ICAg
c3RhdGljIGlubGluZSBpbnQgZjJmc19pc19jb21wcmVzc2VkX2NsdXN0ZXIoCj4gPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgaW5vZGUgKmlub2RlLAo+ID4gZGlmZiAtLWdp
dCBhL2ZzL2YyZnMvZmlsZS5jIGIvZnMvZjJmcy9maWxlLmMKPiA+IGluZGV4IDcwNTdlZmE4ZWMx
Ny4uNjM0NjkxZTNiNWYxIDEwMDY0NAo+ID4gLS0tIGEvZnMvZjJmcy9maWxlLmMKPiA+ICsrKyBi
L2ZzL2YyZnMvZmlsZS5jCj4gPiBAQCAtNjEyLDYgKzYxMiwxOCBAQCBzdGF0aWMgaW50IGYyZnNf
ZmlsZV9vcGVuKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBmaWxlICpmaWxwKQo+ID4gICAg
ICAgcmV0dXJuIGZpbmlzaF9wcmVhbGxvY2F0ZV9ibG9ja3MoaW5vZGUpOwo+ID4gICB9Cj4gPgo+
ID4gK3N0YXRpYyBib29sIGNoZWNrX2YyZnNfaW52YWxpZGF0ZV9jb25zZWN1dGl2ZV9ibG9ja3Mo
c3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBibG9ja190IGJsa2FkZHIxLCBibG9ja190IGJsa2FkZHIyKQo+ID4gK3sKPiA+
ICsgICAgIGlmIChibGthZGRyMiAtIGJsa2FkZHIxICE9IDEpCj4gPiArICAgICAgICAgICAgIHJl
dHVybiBmYWxzZTsKPiA+ICsKPiA+ICsgICAgIGlmIChHRVRfU0VHTk8oc2JpLCBibGthZGRyMSkg
IT0gR0VUX1NFR05PKHNiaSwgYmxrYWRkcjIpKQo+ID4gKyAgICAgICAgICAgICByZXR1cm4gZmFs
c2U7Cj4gPiArCj4gPiArICAgICByZXR1cm4gdHJ1ZTsKPiA+ICt9Cj4gPiArCj4gPiAgIHZvaWQg
ZjJmc190cnVuY2F0ZV9kYXRhX2Jsb2Nrc19yYW5nZShzdHJ1Y3QgZG5vZGVfb2ZfZGF0YSAqZG4s
IGludCBjb3VudCkKPiA+ICAgewo+ID4gICAgICAgc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpID0g
RjJGU19JX1NCKGRuLT5pbm9kZSk7Cj4gPiBAQCAtNjIxLDYgKzYzMyw5IEBAIHZvaWQgZjJmc190
cnVuY2F0ZV9kYXRhX2Jsb2Nrc19yYW5nZShzdHJ1Y3QgZG5vZGVfb2ZfZGF0YSAqZG4sIGludCBj
b3VudCkKPiA+ICAgICAgIGludCBjbHVzdGVyX2luZGV4ID0gMCwgdmFsaWRfYmxvY2tzID0gMDsK
PiA+ICAgICAgIGludCBjbHVzdGVyX3NpemUgPSBGMkZTX0koZG4tPmlub2RlKS0+aV9jbHVzdGVy
X3NpemU7Cj4gPiAgICAgICBib29sIHJlbGVhc2VkID0gIWF0b21pY19yZWFkKCZGMkZTX0koZG4t
Pmlub2RlKS0+aV9jb21wcl9ibG9ja3MpOwo+ID4gKyAgICAgYmxvY2tfdCBjb25fc3RhcnQ7Cj4g
PiArICAgICBib29sIHJ1bl9pbnZhbGlkID0gdHJ1ZTsKPiA+ICsgICAgIGludCBjb25fY250ID0g
MTsKPiA+Cj4gPiAgICAgICBhZGRyID0gZ2V0X2Rub2RlX2FkZHIoZG4tPmlub2RlLCBkbi0+bm9k
ZV9wYWdlKSArIG9mczsKPiA+Cj4gPiBAQCAtNjUyLDcgKzY2NywyNCBAQCB2b2lkIGYyZnNfdHJ1
bmNhdGVfZGF0YV9ibG9ja3NfcmFuZ2Uoc3RydWN0IGRub2RlX29mX2RhdGEgKmRuLCBpbnQgY291
bnQpCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2YWxpZF9ibG9ja3MrKzsKPiA+
ICAgICAgICAgICAgICAgfQo+ID4KPiA+IC0gICAgICAgICAgICAgZjJmc19pbnZhbGlkYXRlX2Js
b2NrcyhzYmksIGJsa2FkZHIpOwo+ID4gKyAgICAgICAgICAgICBpZiAocnVuX2ludmFsaWQpCj4g
PiArICAgICAgICAgICAgICAgICAgICAgY29uX3N0YXJ0ID0gYmxrYWRkcjsKPiA+ICsKPiA+ICsg
ICAgICAgICAgICAgaWYgKGNvdW50ID4gMSAmJgo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGNo
ZWNrX2YyZnNfaW52YWxpZGF0ZV9jb25zZWN1dGl2ZV9ibG9ja3Moc2JpLCBibGthZGRyLAo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGUzMl90b19jcHUoKihhZGRyICsgMSkpKSkg
ewo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHJ1bl9pbnZhbGlkID0gZmFsc2U7Cj4gPiArCj4g
PiArICAgICAgICAgICAgICAgICAgICAgaWYgKGNvbl9jbnQrKyA9PSAxKQo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgY29uX3N0YXJ0ID0gYmxrYWRkcjsKPiA+ICsgICAgICAgICAg
ICAgfSBlbHNlIHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICBydW5faW52YWxpZCA9IHRydWU7
Cj4gPiArICAgICAgICAgICAgIH0KPiA+ICsKPiA+ICsgICAgICAgICAgICAgaWYgKHJ1bl9pbnZh
bGlkKSB7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgZjJmc19pbnZhbGlkYXRlX2NvbnNlY3V0
aXZlX2Jsb2NrcyhzYmksIGNvbl9zdGFydCwgY29uX2NudCk7Cj4gPiArICAgICAgICAgICAgICAg
ICAgICAgY29uX2NudCA9IDE7Cj4gPiArICAgICAgICAgICAgIH0KPiA+Cj4gPiAgICAgICAgICAg
ICAgIGlmICghcmVsZWFzZWQgfHwgYmxrYWRkciAhPSBDT01QUkVTU19BRERSKQo+ID4gICAgICAg
ICAgICAgICAgICAgICAgIG5yX2ZyZWUrKzsKPiA+IGRpZmYgLS1naXQgYS9mcy9mMmZzL3NlZ21l
bnQuYyBiL2ZzL2YyZnMvc2VnbWVudC5jCj4gPiBpbmRleCBmMTE4ZmFmMzZkMzUuLmVkYjhhNzg5
ODViYSAxMDA2NDQKPiA+IC0tLSBhL2ZzL2YyZnMvc2VnbWVudC5jCj4gPiArKysgYi9mcy9mMmZz
L3NlZ21lbnQuYwo+ID4gQEAgLTI1NzAsNiArMjU3MCwzMSBAQCB2b2lkIGYyZnNfaW52YWxpZGF0
ZV9ibG9ja3Moc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBibG9ja190IGFkZHIpCj4gPiAgICAg
ICB1cF93cml0ZSgmc2l0X2ktPnNlbnRyeV9sb2NrKTsKPiA+ICAgfQo+ID4KPiA+ICt2b2lkIGYy
ZnNfaW52YWxpZGF0ZV9jb25zZWN1dGl2ZV9ibG9ja3Moc3RydWN0IGYyZnNfc2JfaW5mbyAqc2Jp
LCBibG9ja190IGFkZHIsIGludCBjbnQpCj4gPiArewo+ID4gKyAgICAgdW5zaWduZWQgaW50IHNl
Z25vID0gR0VUX1NFR05PKHNiaSwgYWRkcik7Cj4gPiArICAgICB1bnNpZ25lZCBpbnQgc2Vnbm8y
ID0gR0VUX1NFR05PKHNiaSwgYWRkciArIGNudCAtIDEpOwo+ID4gKyAgICAgc3RydWN0IHNpdF9p
bmZvICpzaXRfaSA9IFNJVF9JKHNiaSk7Cj4gPiArCj4gPiArICAgICBmMmZzX2J1Z19vbihzYmks
IGFkZHIgPT0gTlVMTF9BRERSIHx8IHNlZ25vICE9IHNlZ25vMik7Cj4gPiArICAgICBpZiAoYWRk
ciA9PSBORVdfQUREUiB8fCBhZGRyID09IENPTVBSRVNTX0FERFIpCj4gPiArICAgICAgICAgICAg
IHJldHVybjsKPiA+ICsKPiA+ICsgICAgIGYyZnNfdHJ1bmNhdGVfbWV0YV9pbm9kZV9wYWdlcyhz
YmksIGFkZHIsIGNudCk7Cj4gPiArICAgICBmMmZzX2ludmFsaWRhdGVfY29tcHJlc3NfcGFnZXNf
cmFuZ2Uoc2JpLCBhZGRyLCBjbnQpOwo+ID4gKwo+ID4gKyAgICAgLyogYWRkIGl0IGludG8gc2l0
IG1haW4gYnVmZmVyICovCj4gPiArICAgICBkb3duX3dyaXRlKCZzaXRfaS0+c2VudHJ5X2xvY2sp
Owo+ID4gKwo+ID4gKyAgICAgdXBkYXRlX3NlZ21lbnRfbXRpbWUoc2JpLCBhZGRyLCAwKTsKPiA+
ICsgICAgIHVwZGF0ZV9zaXRfZW50cnkoc2JpLCBhZGRyLCAtY250KTsKPiA+ICsKPiA+ICsgICAg
IC8qIGFkZCBpdCBpbnRvIGRpcnR5IHNlZ2xpc3QgKi8KPiA+ICsgICAgIGxvY2F0ZV9kaXJ0eV9z
ZWdtZW50KHNiaSwgc2Vnbm8pOwo+ID4gKwo+ID4gKyAgICAgdXBfd3JpdGUoJnNpdF9pLT5zZW50
cnlfbG9jayk7Cj4KPiBJIHRoaW5rIGl0IG5lZWRzIHRvIGNsZWFuIHVwIHRoaXMgcGF0Y2hzZXQs
IHdoYXQgYWJvdXQgZXhwYW5kaW5nCj4gZjJmc19pbnZhbGlkYXRlX2Jsb2NrcygpIHRvIHN1cHBv
cnQgaW52YWxpZGF0aW5nIGJsb2NrIGFkZHJlc3MgZXh0ZW50Pwo+Cj4gU29tZXRoaW5nIGxpa2Ug
dGhpczoKPgo+IHZvaWQgZjJmc19pbnZhbGlkYXRlX2Jsb2NrcyhzdHJ1Y3QgZjJmc19zYl9pbmZv
ICpzYmksIGJsb2NrX3QgYmxrYWRkciwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgbGVuKQo+IHsKPiAgICAgICAgIHN0cnVjdCBz
aXRfaW5mbyAqc2l0X2kgPSBTSVRfSShzYmkpOwo+ICAgICAgICAgaW50IGk7Cj4KPiAgICAgICAg
IC8qIFRPRE86IGRvIHNhbml0eSBjaGVjayBvbiBibGthZGRyIGV4dGVudCAqLwo+Cj4gICAgICAg
ICBkb3duX3dyaXRlKCZzaXRfaS0+c2VudHJ5X2xvY2spOwo+Cj4gICAgICAgICAvKiBUT0RPOiBl
eHBhbmQgZjJmc19pbnZhbGlkYXRlX2ludGVybmFsX2NhY2hlKCkgdG8gaW52YWxpZGF0ZSBibGth
ZGRyIGV4dGVudCAqLwo+ICAgICAgICAgZjJmc19pbnZhbGlkYXRlX2ludGVybmFsX2NhY2hlKHNi
aSwgYmxrYWRkciwgbGVuKTsKPgo+ICAgICAgICAgZm9yIChpID0gMDsgaSA8IGxlbjsgaSsrKSB7
Cj4gICAgICAgICAgICAgICAgIHVwZGF0ZV9zZWdtZW50X210aW1lKHNiaSwgYmxrYWRkciwgMCk7
Cj4gICAgICAgICAgICAgICAgIHVwZGF0ZV9zaXRfZW50cnkoc2JpLCBibGthZGRyLCAtMSk7Cj4K
PiAgICAgICAgICAgICAgICAgLyogYWRkIGl0IGludG8gZGlydHkgc2VnbGlzdCAqLwo+ICAgICAg
ICAgICAgICAgICBsb2NhdGVfZGlydHlfc2VnbWVudChzYmksIEdFVF9TRUdOTyhzYmksIGJsa2Fk
ZHIpKTsKPiAgICAgICAgIH0KPgo+ICAgICAgICAgdXBfd3JpdGUoJnNpdF9pLT5zZW50cnlfbG9j
ayk7Cj4gfQo+Cj4gVGhhbmtzLAo+CgpIaSBDaGFvLApUaGUgY29kZSBzdHJ1Y3R1cmUgeW91IHBy
b3Bvc2VkIGlzIHZlcnkgZ29vZCBhbmQgdmVyeSBjbGVhci4KSSByZXRlc3RlZCB1c2luZyB0aGlz
IGNvZGUgc3RydWN0dXJlIGFuZCBmb3VuZCB0aGF0IHRoZSBzcGVlZApvZiBkb2luZyB0cnVuY2F0
ZSBhbHNvIGltcHJvdmVkLCBidXQgdGhlIGltcHJvdmVtZW50IHdhcyBzbWFsbGVyLgoKU28gaXQg
bWlnaHQgYmUgYmV0dGVyIHRvIHVzZSB0aGUgZm9sbG93aW5nIGNvZGUgc3RydWN0dXJlLgp2b2lk
IGYyZnNfaW52YWxpZGF0ZV9ibG9ja3MoLi4uICwgbGVuKQp7CiAgICBkb3duX3dyaXRlKCk7CiAg
ICAvLyBQcm9jZXNzIGluIHNlZ21lbnRzIGluc3RlYWQgb2YgYmxvY2tzLgogICAgZm9yIChpID0g
MDsgaSA8IHNlZ21lbnRfbnVtOyBpKyspIHsKICAgICAgICB1cGRhdGVfc2VnbWVudF9tdGltZSgp
OwogICAgICAgIHVwZGF0ZV9zaXRfZW50cnkoKTsKCiAgICAgICAgIC8qIGFkZCBpdCBpbnRvIGRp
cnR5IHNlZ2xpc3QgKi8KICAgICAgICBsb2NhdGVfZGlydHlfc2VnbWVudCgpOwogICAgIH0KICAg
IHVwX3dyaXRlKCk7Cn0KClRpbWUgQ29tcGFyaXNvbiBvZiBybToKb3JpZ2luYWwgICAgb3B0aW1p
emF0aW9uKHNlZ21lbnQgdW5pdCkgICAgcmF0aW8oc2VnbWVudCB1bml0KQo3LjE3cyAgICAgICAg
ICAgMy4yN3MgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgNTQuMzklCiAgICAgICAg
ICAgICAgIG9wdGltaXphdGlvbihibG9jayB1bml0KSAgICAgICAgICByYXRpbyhibG9jayB1bml0
KQogICAgICAgICAgICAgICAgICAgIDUuMTJzICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIDI4LjYlCgpOZXcgcGF0Y2hlcyB3aWxsIGJlIHNlbnQgb3V0IGJ5IGVtYWlsIGFmdGVyIHRo
ZXkgYXJlIHNvcnRlZCBvdXQuClRoYW5rIHlvdSBmb3IgeW91ciB2YWx1YWJsZSBzdWdnZXN0aW9u
cy4KCj4gPiArfQo+ID4gKwo+ID4gICBib29sIGYyZnNfaXNfY2hlY2twb2ludGVkX2RhdGEoc3Ry
dWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBibG9ja190IGJsa2FkZHIpCj4gPiAgIHsKPiA+ICAgICAg
IHN0cnVjdCBzaXRfaW5mbyAqc2l0X2kgPSBTSVRfSShzYmkpOwo+CgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5n
IGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0
cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
