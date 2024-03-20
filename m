Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9918816B7
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Mar 2024 18:42:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rmzxL-0000pV-CG;
	Wed, 20 Mar 2024 17:42:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1rmzxJ-0000pM-Hn
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Mar 2024 17:42:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NW19ZZi2sVI9kzIhS7t3Wxp6wjDVebKp4FeXycGbrmk=; b=GLE6CCIZJTP4yaE0lF+9nUM7AE
 iQiv6IWlADxX8ndYMlcKzm9x0sa4zjtTlDEZDw1Aey6UN9luxUk4QRwqZQtpM1M+hVeM897Estekf
 p7qpfALp+3IMT24FvEXcqguz7P6H5o2Uup/cCasZPMYa9Nq+QI6QLIyklxnCfeRq9/cg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NW19ZZi2sVI9kzIhS7t3Wxp6wjDVebKp4FeXycGbrmk=; b=S4dWIg+5VmWNLT4S+AiCHv6Rk5
 N8nlJp8y2VbegyFtQ1YB5UNBE9XuHQ3ZwAHux8/wC6zewr7WjRc6EtSUNj82igmEai0tsPXuTu1dB
 b8shJRE5RuH/anFbD6BG1+ftYqlE1jfQpkgBH8/HTvWev7zxvYWpwChJXrhVJCx+JaDc=;
Received: from mail-vs1-f45.google.com ([209.85.217.45])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rmzxA-0001Gy-4I for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Mar 2024 17:42:25 +0000
Received: by mail-vs1-f45.google.com with SMTP id
 ada2fe7eead31-476794adf30so1250979137.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 20 Mar 2024 10:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710956533; x=1711561333; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NW19ZZi2sVI9kzIhS7t3Wxp6wjDVebKp4FeXycGbrmk=;
 b=Wy0JWLKvzALPW/Yf1YR9fmt9TnismFE0wycZPCGBn50kVDP+6KtLqKXpPuJXNHGbcn
 ePKe772Dty09S/okiRJqlhtq0DzIflAnfJ3qJWmXyasI4Jwe+iUJstgcR2CNdYXospxk
 fCgY2RlfoJm9e7Ns9+cMEw8xBNZ9bdIFjlhwAvrntKitZ7ZO80svAqRXIXFsTCQxSCIi
 voMvS70GC5NRxWODx8Or5lsWIkuifAl7plProTqYtV/UPp0UhUoKxGzqGrqts6c3dPkp
 1SHBUSHX7krFKr7CxYbkmNlhfqBAedCrbnfYXzvygq9Dvl3qbd8BkbowVADPNVW9/cuY
 u5qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710956533; x=1711561333;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NW19ZZi2sVI9kzIhS7t3Wxp6wjDVebKp4FeXycGbrmk=;
 b=lbFd/XsSUXbaIXRepE6cWQDMVjgQdbfPMZwW3lZan+h4jST11XqMHMo7S6l9uA4mL0
 2DnvUkN82lkASyf6WEDKoXZq9it0WHSCdSLGKsrkdqrrz8H/sOaO+EIqxZB3z6COpGgH
 w/xTa6t/4QWwtQOJDF4oV5Uc91qM326rkxcMM9DN2F699EYslAhRHyUWxiSrgWtgZIRc
 3QtbebKzfFSuvSXCwPtd+y8pL9O/z+Esotc0d/9ooPbplDDE2mQP6T9YZGGZyDrvY4pO
 i/G6KRl0Z7iKxart2mmFGvslvRgozELMPjJF0q+3JDCE3kkwXwDdszhgjUzUVonzyeCI
 iF5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyR1GT4r20k8VwUVtbGJqerNbCVxxw6dBNmyzEJLgt/cV0XI1Y1jn7Vp2927zGAO2/Pkjyx+vlHa8nhMvDPf5b3NHjg8Ic9obYhXb1D2tB+CQ9+7F2rg==
X-Gm-Message-State: AOJu0YxPyk+T3KcIuJVzvRblTNue8vlBKs8PguQ+yIwQmMNuPyuFc+q6
 DwZks7S05IZ9framv1G/Lwrv5XydTwWg1Uk7yVwLDFzrKqOUWcBRO7rraCt/ietLPOniWzSUaNA
 YVbU+paOB8zJd6N22cQbFkTVC40k=
X-Google-Smtp-Source: AGHT+IF+OiH30Ak1ZIPDrfPiWCrr77p7WnNH2Gz47qu2eWme2cStI+UdwFIiEtA2ErBVpGZw05MEhC3fqogHCKhTqQ8=
X-Received: by 2002:a67:b64b:0:b0:476:5404:5f11 with SMTP id
 e11-20020a67b64b000000b0047654045f11mr15013127vsm.25.1710956532744; Wed, 20
 Mar 2024 10:42:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240319212316.4193790-1-daeho43@gmail.com>
 <712f380c-68ef-4743-bd9b-7342e838ced7@kernel.org>
In-Reply-To: <712f380c-68ef-4743-bd9b-7342e838ced7@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Wed, 20 Mar 2024 10:42:01 -0700
Message-ID: <CACOAw_yAWGbx2Bx2or1OyVUUw6HSgTd=fo3e151d1JHU+Op5qQ@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Wed, Mar 20, 2024 at 2:38 AM Chao Yu wrote: > > On 2024/3/20
    5:23, Daeho Jeong wrote: > > From: Daeho Jeong > > > > In a case writing
   without fallocate(), we can't guarantee it's allocated > [...] 
 
 Content analysis details:   (0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.217.45 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.217.45 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rmzxA-0001Gy-4I
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: prevent writing without fallocate()
 for pinned files
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gV2VkLCBNYXIgMjAsIDIwMjQgYXQgMjozOOKAr0FNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9y
Zz4gd3JvdGU6Cj4KPiBPbiAyMDI0LzMvMjAgNToyMywgRGFlaG8gSmVvbmcgd3JvdGU6Cj4gPiBG
cm9tOiBEYWVobyBKZW9uZyA8ZGFlaG9qZW9uZ0Bnb29nbGUuY29tPgo+ID4KPiA+IEluIGEgY2Fz
ZSB3cml0aW5nIHdpdGhvdXQgZmFsbG9jYXRlKCksIHdlIGNhbid0IGd1YXJhbnRlZSBpdCdzIGFs
bG9jYXRlZAo+ID4gaW4gdGhlIGNvbnZlbnRpb25hbCBhcmVhIGZvciB6b25lZCBzdHJvYWdlLgo+
ID4KPiA+IFNpZ25lZC1vZmYtYnk6IERhZWhvIEplb25nIDxkYWVob2plb25nQGdvb2dsZS5jb20+
Cj4gPiAtLS0KPiA+IHYyOiBjb3ZlcmVkIHRoZSBkaXJlY3QgaW8gY2FzZQo+ID4gdjM6IGNvdmVy
ZWQgdGhlIG1rd3JpdGUgY2FzZQo+ID4gLS0tCj4gPiAgIGZzL2YyZnMvZGF0YS5jIHwgMTQgKysr
KysrKysrKysrLS0KPiA+ICAgZnMvZjJmcy9maWxlLmMgfCAxNiArKysrKysrKy0tLS0tLS0tCj4g
PiAgIDIgZmlsZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCj4g
Pgo+ID4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZGF0YS5jIGIvZnMvZjJmcy9kYXRhLmMKPiA+IGlu
ZGV4IGMyMWI5MmYxODQ2My4uZDNlNWFiMjczNmE2IDEwMDY0NAo+ID4gLS0tIGEvZnMvZjJmcy9k
YXRhLmMKPiA+ICsrKyBiL2ZzL2YyZnMvZGF0YS5jCj4gPiBAQCAtMTU4NCw4ICsxNTg0LDExIEBA
IGludCBmMmZzX21hcF9ibG9ja3Moc3RydWN0IGlub2RlICppbm9kZSwgc3RydWN0IGYyZnNfbWFw
X2Jsb2NrcyAqbWFwLCBpbnQgZmxhZykKPiA+Cj4gPiAgICAgICAvKiB1c2Ugb3V0LXBsYWNlLXVw
ZGF0ZSBmb3IgZGlyZWN0IElPIHVuZGVyIExGUyBtb2RlICovCj4gPiAgICAgICBpZiAobWFwLT5t
X21heV9jcmVhdGUgJiYKPiA+IC0gICAgICAgICAoaXNfaG9sZSB8fCAoZjJmc19sZnNfbW9kZShz
YmkpICYmIGZsYWcgPT0gRjJGU19HRVRfQkxPQ0tfRElPKSkpIHsKPiA+IC0gICAgICAgICAgICAg
aWYgKHVubGlrZWx5KGYyZnNfY3BfZXJyb3Ioc2JpKSkpIHsKPiA+ICsgICAgICAgICAoaXNfaG9s
ZSB8fCAoZjJmc19sZnNfbW9kZShzYmkpICYmIGZsYWcgPT0gRjJGU19HRVRfQkxPQ0tfRElPICYm
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICFmMmZzX2lzX3Bpbm5lZF9maWxlKGlub2RlKSkp
KSB7Cj4gPiArICAgICAgICAgICAgIGlmICh1bmxpa2VseShmMmZzX2NwX2Vycm9yKHNiaSkpIHx8
Cj4gPiArICAgICAgICAgICAgICAgICAoZjJmc19pc19waW5uZWRfZmlsZShpbm9kZSkgJiYgaXNf
aG9sZSAmJgo+ID4gKyAgICAgICAgICAgICAgICAgIGZsYWcgIT0gRjJGU19HRVRfQkxPQ0tfUFJF
X0RJTykpIHsKPiA+ICAgICAgICAgICAgICAgICAgICAgICBlcnIgPSAtRUlPOwo+ID4gICAgICAg
ICAgICAgICAgICAgICAgIGdvdG8gc3luY19vdXQ7Cj4gPiAgICAgICAgICAgICAgIH0KPiA+IEBA
IC0zMzc4LDYgKzMzODEsOCBAQCBzdGF0aWMgaW50IHByZXBhcmVfd3JpdGVfYmVnaW4oc3RydWN0
IGYyZnNfc2JfaW5mbyAqc2JpLAo+ID4gICAgICAgICAgICAgICBmMmZzX21hcF9sb2NrKHNiaSwg
ZmxhZyk7Cj4gPiAgICAgICAgICAgICAgIGxvY2tlZCA9IHRydWU7Cj4gPiAgICAgICB9IGVsc2Ug
aWYgKChwb3MgJiBQQUdFX01BU0spID49IGlfc2l6ZV9yZWFkKGlub2RlKSkgewo+ID4gKyAgICAg
ICAgICAgICBpZiAoZjJmc19pc19waW5uZWRfZmlsZShpbm9kZSkpCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgcmV0dXJuIC1FSU87Cj4gPiAgICAgICAgICAgICAgIGYyZnNfbWFwX2xvY2soc2Jp
LCBmbGFnKTsKPiA+ICAgICAgICAgICAgICAgbG9ja2VkID0gdHJ1ZTsKPiA+ICAgICAgIH0KPiA+
IEBAIC0zNDA3LDYgKzM0MTIsMTEgQEAgc3RhdGljIGludCBwcmVwYXJlX3dyaXRlX2JlZ2luKHN0
cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKPiA+Cj4gPiAgICAgICBpZiAoIWYyZnNfbG9va3VwX3Jl
YWRfZXh0ZW50X2NhY2hlX2Jsb2NrKGlub2RlLCBpbmRleCwKPiA+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJmRuLmRhdGFfYmxrYWRkcikpIHsKPiA+ICsg
ICAgICAgICAgICAgaWYgKGYyZnNfaXNfcGlubmVkX2ZpbGUoaW5vZGUpKSB7Cj4gPiArICAgICAg
ICAgICAgICAgICAgICAgZXJyID0gLUVJTzsKPiA+ICsgICAgICAgICAgICAgICAgICAgICBnb3Rv
IG91dDsKPiA+ICsgICAgICAgICAgICAgfQo+ID4gKwo+ID4gICAgICAgICAgICAgICBpZiAobG9j
a2VkKSB7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgZXJyID0gZjJmc19yZXNlcnZlX2Jsb2Nr
KCZkbiwgaW5kZXgpOwo+ID4gICAgICAgICAgICAgICAgICAgICAgIGdvdG8gb3V0Owo+ID4gZGlm
ZiAtLWdpdCBhL2ZzL2YyZnMvZmlsZS5jIGIvZnMvZjJmcy9maWxlLmMKPiA+IGluZGV4IDgyMjc3
ZTk1Yzg4Zi4uNGRiM2IyMWM4MDRiIDEwMDY0NAo+ID4gLS0tIGEvZnMvZjJmcy9maWxlLmMKPiA+
ICsrKyBiL2ZzL2YyZnMvZmlsZS5jCj4gPiBAQCAtNTcsNyArNTcsNyBAQCBzdGF0aWMgdm1fZmF1
bHRfdCBmMmZzX3ZtX3BhZ2VfbWt3cml0ZShzdHJ1Y3Qgdm1fZmF1bHQgKnZtZikKPiA+ICAgICAg
IHN0cnVjdCBpbm9kZSAqaW5vZGUgPSBmaWxlX2lub2RlKHZtZi0+dm1hLT52bV9maWxlKTsKPiA+
ICAgICAgIHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSA9IEYyRlNfSV9TQihpbm9kZSk7Cj4gPiAg
ICAgICBzdHJ1Y3QgZG5vZGVfb2ZfZGF0YSBkbjsKPiA+IC0gICAgIGJvb2wgbmVlZF9hbGxvYyA9
IHRydWU7Cj4gPiArICAgICBib29sIG5lZWRfYWxsb2MgPSAhZjJmc19pc19waW5uZWRfZmlsZShp
bm9kZSk7Cj4KPiBXaWxsIHRoaXMgY2hlY2sgcmFjZXMgdy8gcGluZmlsZSBnZXR8c2V0PwoKRG8g
eW91IG1lYW4gInNldC9jbGVhciIgY2FzZT8gSSBiZWxpZXZlICJzZXQiIGNhc2UgaXMgb2theSwg
c2luY2Ugd2UKY2FuJ3Qgc2V0IGlmIHRoZSBpbm9kZSBhbHJlYWR5IGhhcyBhIGRhdGEgYmxvY2su
IEZvciAiY2xlYXIiIGNhc2UsIEkKYmVsaWV2ZSBta3dyaXRlIGZhaWx1cmUgaXMgb2theSBpbiBy
YWN5IGNvbmRpdGlvbnMgY2F1c2VkIGJ5IGNsZWFyaW5nCnRoZSBwaW4gZmxhZy4gV2hhdCBkbyB5
b3UgdGhpbms/Cgo+Cj4gVGhhbmtzLAo+Cj4gPiAgICAgICBpbnQgZXJyID0gMDsKPiA+ICAgICAg
IHZtX2ZhdWx0X3QgcmV0Owo+ID4KPiA+IEBAIC0xMTQsMTkgKzExNCwxNSBAQCBzdGF0aWMgdm1f
ZmF1bHRfdCBmMmZzX3ZtX3BhZ2VfbWt3cml0ZShzdHJ1Y3Qgdm1fZmF1bHQgKnZtZikKPiA+ICAg
ICAgICAgICAgICAgZ290byBvdXRfc2VtOwo+ID4gICAgICAgfQo+ID4KPiA+ICsgICAgIHNldF9u
ZXdfZG5vZGUoJmRuLCBpbm9kZSwgTlVMTCwgTlVMTCwgMCk7Cj4gPiAgICAgICBpZiAobmVlZF9h
bGxvYykgewo+ID4gICAgICAgICAgICAgICAvKiBibG9jayBhbGxvY2F0aW9uICovCj4gPiAtICAg
ICAgICAgICAgIHNldF9uZXdfZG5vZGUoJmRuLCBpbm9kZSwgTlVMTCwgTlVMTCwgMCk7Cj4gPiAg
ICAgICAgICAgICAgIGVyciA9IGYyZnNfZ2V0X2Jsb2NrX2xvY2tlZCgmZG4sIHBhZ2UtPmluZGV4
KTsKPiA+IC0gICAgIH0KPiA+IC0KPiA+IC0jaWZkZWYgQ09ORklHX0YyRlNfRlNfQ09NUFJFU1NJ
T04KPiA+IC0gICAgIGlmICghbmVlZF9hbGxvYykgewo+ID4gLSAgICAgICAgICAgICBzZXRfbmV3
X2Rub2RlKCZkbiwgaW5vZGUsIE5VTEwsIE5VTEwsIDApOwo+ID4gKyAgICAgfSBlbHNlIHsKPiA+
ICAgICAgICAgICAgICAgZXJyID0gZjJmc19nZXRfZG5vZGVfb2ZfZGF0YSgmZG4sIHBhZ2UtPmlu
ZGV4LCBMT09LVVBfTk9ERSk7Cj4gPiAgICAgICAgICAgICAgIGYyZnNfcHV0X2Rub2RlKCZkbik7
Cj4gPiAgICAgICB9Cj4gPiAtI2VuZGlmCj4gPiArCj4gPiAgICAgICBpZiAoZXJyKSB7Cj4gPiAg
ICAgICAgICAgICAgIHVubG9ja19wYWdlKHBhZ2UpOwo+ID4gICAgICAgICAgICAgICBnb3RvIG91
dF9zZW07Cj4gPiBAQCAtNDYxMSw2ICs0NjA3LDEwIEBAIHN0YXRpYyBpbnQgZjJmc19wcmVhbGxv
Y2F0ZV9ibG9ja3Moc3RydWN0IGtpb2NiICppb2NiLCBzdHJ1Y3QgaW92X2l0ZXIgKml0ZXIsCj4g
PiAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPiA+ICAgICAgIH0KPiA+Cj4gPiAr
ICAgICAvKiBGb3IgcGlubmVkIGZpbGVzLCBpdCBzaG91bGQgYmUgZmFsbG9jYXRlKCktZWQgaW4g
YWR2YW5jZS4gKi8KPiA+ICsgICAgIGlmIChmMmZzX2lzX3Bpbm5lZF9maWxlKGlub2RlKSkKPiA+
ICsgICAgICAgICAgICAgcmV0dXJuIDA7Cj4gPiArCj4gPiAgICAgICAvKiBEbyBub3QgcHJlYWxs
b2NhdGUgYmxvY2tzIHRoYXQgd2lsbCBiZSB3cml0dGVuIHBhcnRpYWxseSBpbiA0S0IuICovCj4g
PiAgICAgICBtYXAubV9sYmxrID0gRjJGU19CTEtfQUxJR04ocG9zKTsKPiA+ICAgICAgIG1hcC5t
X2xlbiA9IEYyRlNfQllURVNfVE9fQkxLKHBvcyArIGNvdW50KTsKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcg
bGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3Rz
LnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
