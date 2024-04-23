Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2F68AF780
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 23 Apr 2024 21:47:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rzM7C-0002ko-Tp;
	Tue, 23 Apr 2024 19:47:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1rzM79-0002ke-Qk
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Apr 2024 19:47:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3X1Pj4rvDW2qcTYjO5QNvL4SiyuRLUqGZU3rIwevn/g=; b=hlY8hCI8x+cLE4iycSV1aTd6lz
 ZWzLJtHSJeNDQwMXGEYM/STGOYLM1KZULCyp/40ppCwogSJNE1uGjH+vDVl/R1/j1SBN+x3AcZwf6
 cGlAsXhDTDPwy401MYeOYHGL42xJ7Rmj8jow8tYSolYutdHdnJReN0kzrb0bgCFo1OZs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3X1Pj4rvDW2qcTYjO5QNvL4SiyuRLUqGZU3rIwevn/g=; b=FG/bJwHRQ0/46OO2cRiBb48ESc
 1ZFfwQjHoXak5Gl78hFuTw7unfywk3sDnX9AQtW50o1r3o5V4hiMdsMcv9oG00RnUaYj1ERqLrtBT
 4ssUKdinRGzzGyqHUwM2L3xkXzeJIXdqG6qu3gbPLK7lOd1ciWwNl8bmLmQ6iOwWe+yw=;
Received: from mail-vs1-f46.google.com ([209.85.217.46])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rzM78-0004f7-Qr for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Apr 2024 19:47:40 +0000
Received: by mail-vs1-f46.google.com with SMTP id
 ada2fe7eead31-479dc603962so1848641137.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 23 Apr 2024 12:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713901648; x=1714506448; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3X1Pj4rvDW2qcTYjO5QNvL4SiyuRLUqGZU3rIwevn/g=;
 b=SlQ4x4hHa9iSk0JxFTDmCrEiKoPCpeB9Tb4N8g2nWy4FA42COdu0b06Gh6kuyAIHyg
 LliFIP43zm0wPM9fyaz9vWMxEmUF4rjkmgk5dEAkAYPsuHN79vHroyZagWU139yaUw6S
 5gbSecFmYE1umN0pJk1zxv49HopHPUuHUpsFDMpSEp5OtVqi4FaMnnIdHQqEt/Pd9ykg
 WobgnTPzUl7Ona659KWNlLWhaLCP6zZbE5KDxBgjk5Rm4LHEpOrnyTmqDwcHmqlO2cvl
 f311T+VolFCu4WoljN7p1CFtqCdE1yquzKmPGAGgS7B9T3Jc5F7LspJOWY8eHzogMnGh
 xFMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713901648; x=1714506448;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3X1Pj4rvDW2qcTYjO5QNvL4SiyuRLUqGZU3rIwevn/g=;
 b=s2WZ5dmVIfIFlkbol2z2C12TOeptTFOUIeIUHK4XMIk40aKVX2bnGl/hSK5KQ9iebQ
 1ox6baiUSemLSzVUCIBd9zKsVu2FzS97L9fLkASglYrCS+7zXi5wp5BRHXTfgx/8JD5C
 71m1POtE6Y7WZaaMf8G2vxYNZNXxD3pQLDc+lUbwApXpChpFjgSVwfK7fgV/EK82S+qg
 gW2+Z1Ktv8VnqTEcOzsCXFIlg/V2B/JKKWn29BQs7QbXfX3CaOqFVUVPOeY2ZC5qzJIx
 q9LhbAK9BtkOYDnjCaxqJJ8+6EndJ4sMC96I6Uyh8SykENn28MmCNSoyrcPgvQeH+VUQ
 vCLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZ/UW+XJS+ZNiOoOuxtlb9UTJ7OUsMdxaZIaa0in+2oI1SciL3AGmFyPCRUvyNIy+kCWr6nwvZd33faJ73EtCO/uh/7OzMXp3rWoot7TjDQu6lCQCMBQ==
X-Gm-Message-State: AOJu0YzDwU4PqWiAjNXmbsO2Yd88Ww8LNWKyqMPdRc8mjIpIOV0rOuY6
 u7x3fV//k2MP8lBknwjGGjsokYRBUSkpQmBc52X44y+r+xr8uVIE0aUZxi5RVy8oTjCw14lTSxo
 wv5CdE5axl1ZsywFsbYjYWGlgDRHdpgrd
X-Google-Smtp-Source: AGHT+IEDnwEBiAnsWON58YUBYpIr+20dclfUR56nUp7H83ShCPGLA4U6di9UDmPMhEf9toxB66zGdLZK/DE5OOZEqws=
X-Received: by 2002:a05:6102:3a6b:b0:47b:be9f:aec8 with SMTP id
 bf11-20020a0561023a6b00b0047bbe9faec8mr525981vsb.14.1713901648461; Tue, 23
 Apr 2024 12:47:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240409203411.1885121-1-jaegeuk@kernel.org>
 <20240409203411.1885121-2-jaegeuk@kernel.org>
 <Zh6r_yLKOnNkMedZ@google.com>
In-Reply-To: <Zh6r_yLKOnNkMedZ@google.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Tue, 23 Apr 2024 12:47:17 -0700
Message-ID: <CACOAw_zn1BX=pw4+XpiT6XGK6iHm9tMLznziOVu8j6w3gmPsKA@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Tue, Apr 16, 2024 at 9:50 AM Jaegeuk Kim wrote: > > Let's
    stop issuing compressed writes and clear their writeback flags. > > Signed-off-by:
    Jaegeuk Kim > --- > > Now, I don't see any kernel [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.217.46 listed in wl.mailspike.net]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
X-Headers-End: 1rzM78-0004f7-Qr
Subject: Re: [f2fs-dev] [PATCH 2/3 v2] f2fs: clear writeback when
 compression failed
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVHVlLCBBcHIgMTYsIDIwMjQgYXQgOTo1MOKAr0FNIEphZWdldWsgS2ltIDxqYWVnZXVrQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gTGV0J3Mgc3RvcCBpc3N1aW5nIGNvbXByZXNzZWQgd3JpdGVz
IGFuZCBjbGVhciB0aGVpciB3cml0ZWJhY2sgZmxhZ3MuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKYWVn
ZXVrIEtpbSA8amFlZ2V1a0BrZXJuZWwub3JnPgo+IC0tLQo+Cj4gIE5vdywgSSBkb24ndCBzZWUg
YW55IGtlcm5lbCBoYW5nIGZvciAyNGhvdXJzLgo+Cj4gIENoYW5nZSBsb2cgZnJvbSB2MToKPiAg
IC0gZml4IGJ1Z3MKPgo+ICBmcy9mMmZzL2NvbXByZXNzLmMgfCA0MCArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzOCBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvY29tcHJlc3MuYyBi
L2ZzL2YyZnMvY29tcHJlc3MuYwo+IGluZGV4IGQ2N2M0NzFhYjVkZi4uYjEyZDNhNDliZmRhIDEw
MDY0NAo+IC0tLSBhL2ZzL2YyZnMvY29tcHJlc3MuYwo+ICsrKyBiL2ZzL2YyZnMvY29tcHJlc3Mu
Ywo+IEBAIC0xMDMxLDYgKzEwMzEsMzEgQEAgc3RhdGljIHZvaWQgc2V0X2NsdXN0ZXJfd3JpdGVi
YWNrKHN0cnVjdCBjb21wcmVzc19jdHggKmNjKQo+ICAgICAgICAgfQo+ICB9Cj4KPiArc3RhdGlj
IHZvaWQgY2FuY2VsX2NsdXN0ZXJfd3JpdGViYWNrKHN0cnVjdCBjb21wcmVzc19jdHggKmNjLAo+
ICsgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBjb21wcmVzc19pb19jdHggKmNpYywgaW50
IHN1Ym1pdHRlZCkKPiArewo+ICsgICAgICAgaW50IGk7Cj4gKwo+ICsgICAgICAgLyogV2FpdCBm
b3Igc3VibWl0dGVkIElPcy4gKi8KPiArICAgICAgIGlmIChzdWJtaXR0ZWQgPiAxKSB7Cj4gKyAg
ICAgICAgICAgICAgIGYyZnNfc3VibWl0X21lcmdlZF93cml0ZShGMkZTX0lfU0IoY2MtPmlub2Rl
KSwgREFUQSk7Cj4gKyAgICAgICAgICAgICAgIHdoaWxlIChhdG9taWNfcmVhZCgmY2ljLT5wZW5k
aW5nX3BhZ2VzKSAhPQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAo
Y2MtPnZhbGlkX25yX2NwYWdlcyAtIHN1Ym1pdHRlZCArIDEpKQo+ICsgICAgICAgICAgICAgICAg
ICAgICAgIGYyZnNfaW9fc2NoZWR1bGVfdGltZW91dChERUZBVUxUX0lPX1RJTUVPVVQpOwo+ICsg
ICAgICAgfQo+ICsKPiArICAgICAgIC8qIENhbmNlbCB3cml0ZWJhY2sgYW5kIHN0YXkgbG9ja2Vk
LiAqLwo+ICsgICAgICAgZm9yIChpID0gMDsgaSA8IGNjLT5jbHVzdGVyX3NpemU7IGkrKykgewo+
ICsgICAgICAgICAgICAgICBpZiAoaSA8IHN1Ym1pdHRlZCkgewo+ICsgICAgICAgICAgICAgICAg
ICAgICAgIGlub2RlX2luY19kaXJ0eV9wYWdlcyhjYy0+aW5vZGUpOwo+ICsgICAgICAgICAgICAg
ICAgICAgICAgIGxvY2tfcGFnZShjYy0+cnBhZ2VzW2ldKTsKPiArICAgICAgICAgICAgICAgfQo+
ICsgICAgICAgICAgICAgICBjbGVhcl9wYWdlX3ByaXZhdGVfZ2NpbmcoY2MtPnJwYWdlc1tpXSk7
Cj4gKyAgICAgICAgICAgICAgIGlmIChmb2xpb190ZXN0X3dyaXRlYmFjayhwYWdlX2ZvbGlvKGNj
LT5ycGFnZXNbaV0pKSkKPiArICAgICAgICAgICAgICAgICAgICAgICBlbmRfcGFnZV93cml0ZWJh
Y2soY2MtPnJwYWdlc1tpXSk7Cj4gKyAgICAgICB9Cj4gK30KPiArCj4gIHN0YXRpYyB2b2lkIHNl
dF9jbHVzdGVyX2RpcnR5KHN0cnVjdCBjb21wcmVzc19jdHggKmNjKQo+ICB7Cj4gICAgICAgICBp
bnQgaTsKPiBAQCAtMTIzMiw3ICsxMjU3LDYgQEAgc3RhdGljIGludCBmMmZzX3dyaXRlX2NvbXBy
ZXNzZWRfcGFnZXMoc3RydWN0IGNvbXByZXNzX2N0eCAqY2MsCj4gICAgICAgICAgICAgICAgIC5w
YWdlID0gTlVMTCwKPiAgICAgICAgICAgICAgICAgLmVuY3J5cHRlZF9wYWdlID0gTlVMTCwKPiAg
ICAgICAgICAgICAgICAgLmNvbXByZXNzZWRfcGFnZSA9IE5VTEwsCj4gLSAgICAgICAgICAgICAg
IC5zdWJtaXR0ZWQgPSAwLAo+ICAgICAgICAgICAgICAgICAuaW9fdHlwZSA9IGlvX3R5cGUsCj4g
ICAgICAgICAgICAgICAgIC5pb193YmMgPSB3YmMsCj4gICAgICAgICAgICAgICAgIC5lbmNyeXB0
ZWQgPSBmc2NyeXB0X2lub2RlX3VzZXNfZnNfbGF5ZXJfY3J5cHRvKGNjLT5pbm9kZSkgPwo+IEBA
IC0xMzU4LDcgKzEzODIsMTYgQEAgc3RhdGljIGludCBmMmZzX3dyaXRlX2NvbXByZXNzZWRfcGFn
ZXMoc3RydWN0IGNvbXByZXNzX2N0eCAqY2MsCj4gICAgICAgICAgICAgICAgICAgICAgICAgZmlv
LmNvbXByZXNzZWRfcGFnZSA9IGNjLT5jcGFnZXNbaSAtIDFdOwo+Cj4gICAgICAgICAgICAgICAg
IGNjLT5jcGFnZXNbaSAtIDFdID0gTlVMTDsKPiArICAgICAgICAgICAgICAgZmlvLnN1Ym1pdHRl
ZCA9IDA7Cj4gICAgICAgICAgICAgICAgIGYyZnNfb3V0cGxhY2Vfd3JpdGVfZGF0YSgmZG4sICZm
aW8pOwo+ICsgICAgICAgICAgICAgICBpZiAodW5saWtlbHkoIWZpby5zdWJtaXR0ZWQpKSB7Cj4g
KyAgICAgICAgICAgICAgICAgICAgICAgY2FuY2VsX2NsdXN0ZXJfd3JpdGViYWNrKGNjLCBjaWMs
IGkpOwo+ICsKPiArICAgICAgICAgICAgICAgICAgICAgICAvKiBUbyBjYWxsIGZzY3J5cHRfZmlu
YWxpemVfYm91bmNlX3BhZ2UgKi8KPiArICAgICAgICAgICAgICAgICAgICAgICBpID0gY2MtPnZh
bGlkX25yX2NwYWdlczsKPiArICAgICAgICAgICAgICAgICAgICAgICAqc3VibWl0dGVkID0gMDsK
PiArICAgICAgICAgICAgICAgICAgICAgICBnb3RvIG91dF9kZXN0cm95X2NyeXB0Owo+ICsgICAg
ICAgICAgICAgICB9Cj4gICAgICAgICAgICAgICAgICgqc3VibWl0dGVkKSsrOwo+ICB1bmxvY2tf
Y29udGludWU6Cj4gICAgICAgICAgICAgICAgIGlub2RlX2RlY19kaXJ0eV9wYWdlcyhjYy0+aW5v
ZGUpOwo+IEBAIC0xMzkyLDggKzE0MjUsMTEgQEAgc3RhdGljIGludCBmMmZzX3dyaXRlX2NvbXBy
ZXNzZWRfcGFnZXMoc3RydWN0IGNvbXByZXNzX2N0eCAqY2MsCj4gIG91dF9kZXN0cm95X2NyeXB0
Ogo+ICAgICAgICAgcGFnZV9hcnJheV9mcmVlKGNjLT5pbm9kZSwgY2ljLT5ycGFnZXMsIGNjLT5j
bHVzdGVyX3NpemUpOwo+Cj4gLSAgICAgICBmb3IgKC0taTsgaSA+PSAwOyBpLS0pCj4gKyAgICAg
ICBmb3IgKC0taTsgaSA+PSAwOyBpLS0pIHsKPiArICAgICAgICAgICAgICAgaWYgKCFjYy0+Y3Bh
Z2VzW2ldKQo+ICsgICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+ICAgICAgICAgICAg
ICAgICBmc2NyeXB0X2ZpbmFsaXplX2JvdW5jZV9wYWdlKCZjYy0+Y3BhZ2VzW2ldKTsKPiArICAg
ICAgIH0KPiAgb3V0X3B1dF9jaWM6Cj4gICAgICAgICBrbWVtX2NhY2hlX2ZyZWUoY2ljX2VudHJ5
X3NsYWIsIGNpYyk7Cj4gIG91dF9wdXRfZG5vZGU6Cj4gLS0KPiAyLjQ0LjAuNjgzLmc3OTYxYzgz
OGFjLWdvb2cKPgo+Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4gTGludXgtZjJmcy1kZXZl
bEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9s
aXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCgpSZXZpZXdlZC1ieTogRGFlaG8gSmVvbmcg
PGRhZWhvamVvbmdAZ29vZ2xlLmNvbT4KClRoYW5rcywKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApM
aW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJj
ZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
