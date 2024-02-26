Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD6A8670F3
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Feb 2024 11:28:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1reYE0-0003us-MQ;
	Mon, 26 Feb 2024 10:28:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1reYDu-0003uH-Jw
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Feb 2024 10:28:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qRBFXTJCVRtEGA+hrXGUuCjVOI5AX562PyFUCsem+h8=; b=VVaSRsPRSK3l0cmHIuK2XY8rJQ
 ERGeNZfHkYcTRbGkhVHftA7XnQYbcWoDcgjuqt6TPu0im9e+rnnHvLesteS72ZGYgqRKctVxVRxfE
 cPhTRaSaFDrHqNjqsyZt9kmD1wTuWDJUw1faCwZo7joYvlQ6PVYJMNHt5845YbjRDNKE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qRBFXTJCVRtEGA+hrXGUuCjVOI5AX562PyFUCsem+h8=; b=Ntvet/cJ0hF3m8ziA96rWmgoC7
 OAu2O6TP0pFs6TRcBlQCVMCN8gkoLXb+deGgMFCLwpuidgxXetOnSSk54WTWipNMW+Auo12NNQlsk
 nU/jtRW4xpPCKjNfblxOEKbiVyLnRTbcKrtzXFFGNYkAOYUsiR9MQKrmkoG1AYz8ZgX4=;
Received: from mail-ed1-f46.google.com ([209.85.208.46])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1reYDp-0006Dk-HC for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Feb 2024 10:28:37 +0000
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-5654f700705so3830050a12.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 26 Feb 2024 02:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708943302; x=1709548102; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qRBFXTJCVRtEGA+hrXGUuCjVOI5AX562PyFUCsem+h8=;
 b=UGsfzip87cqVJbLYGoVV7CpEjdYLOoQ8vrdobZ7fIN12ZSNl4imWlg8o/8sjq8/Goi
 te4+t+iP7xF0JrE50E73o2Jv0Szx8eqXvLhihcA0F4gXOMup7FGDkzn/fQPOfWRFzSaL
 0wbM60JiGoOsmJwHcm8tqZ5h0dSJkQlyCh6hqTDxLXCrlA8KIx2kBKSLOyylzjxEofCf
 puumpIJh+5+bIHyQH98raMapaR9N/GDdtth6FZr1EuvD7EHqOcAFqJApZpyQWLZRdG+j
 oAkYFxMhMnLXK6sgs7lPnxXp/9JBXlsUUE9sPU1exjV9EYM7jD+F4OvuPwr57hwZGneZ
 Y2Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708943302; x=1709548102;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qRBFXTJCVRtEGA+hrXGUuCjVOI5AX562PyFUCsem+h8=;
 b=fDzD/AK7Kyq5VwhQ8slKdGxVrF9MfZ6Agm3Mwax11WkeoveEgli/IVN2/cVS2IHSLs
 Tlub5f9tOMz9EoYmNSmrKgjTFr5UCo0KpYBtt2BUaYiIUcYME9YMpmAir+6tgknxcCjD
 dxTjWcq70P7h7eOxHJsmmipBifdFmDH2JAtU+gscbqyHJHBfZ8ALG9IU4E+/0VYfAHPt
 e5OMUtoXRp7wVryogyl/Slh6cJm6SUKhagCoz+pz00/8LyXJ4TH2L25/B2uRsdS2uJmN
 qiABYdeFDaxYBrCmsMLEfD7JnelCJzjgVngINYS7xI5qu/wswR0MKprA7imvLBxr2uiR
 67Tw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFJUuv1d/tRitf2JnlFOpFFR4kAHb2qOoagT3agBZnwn0DPrpYbz8R/RHL1ft38Y4sGErvMOi05PJx0Vj9hzMjb2SBHG6wtya/oN1rMUgWRvBMhfOH7A==
X-Gm-Message-State: AOJu0Yz6ioVvmAqK0YDF8vS25LQyaM3/oaeMp4neQh2huoWpfw7ah5O6
 2x0RVzsoJ7r73Dotwnlx/wWVQqXVvdo3UiwY/96PdnRV1Db11TjtCdeGON8mH9u4oa+h3+KO7QK
 dxOLvPtBsKR+HAd4BBOKYSIZVEXJezqLtvK4=
X-Google-Smtp-Source: AGHT+IEM17THi24tm4/ZbX2IZRgGybQnFgdb8eGO52rCgNXjgcYRwkRPk9ipp/IYJlbRLhY8Rm3MCt9QtGkH+RLfpIo=
X-Received: by 2002:aa7:d841:0:b0:566:f60:4fc4 with SMTP id
 f1-20020aa7d841000000b005660f604fc4mr786873eds.37.1708943301723; Mon, 26 Feb
 2024 02:28:21 -0800 (PST)
MIME-Version: 1.0
References: <20240222121851.883141-1-chao@kernel.org>
 <20240222121851.883141-3-chao@kernel.org>
 <873304dc-112d-4c34-b966-e0905ee748fb@kernel.org>
In-Reply-To: <873304dc-112d-4c34-b966-e0905ee748fb@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Mon, 26 Feb 2024 18:28:10 +0800
Message-ID: <CAHJ8P3LvAJxHwq3yy7kg1mfcDi6mSUf95ODaEkiWcAw9JXD+MQ@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Mon, Feb 26, 2024 at 3:46 PM Chao Yu wrote: > > Loop
   to Zhiguo, > > On 2024/2/22 20:18, Chao Yu wrote: > > If CONFIG_F2FS_CHECK_FS
    is off, and for very rare corner case that > > we run out of f [...] 
 
 Content analysis details:   (0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [niuzhiguo84[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [niuzhiguo84[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.208.46 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.208.46 listed in wl.mailspike.net]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1reYDp-0006Dk-HC
Subject: Re: [f2fs-dev] [PATCH 3/4] f2fs: fix to handle segment allocation
 failure correctly
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
Cc: jaegeuk@kernel.org, Zhiguo Niu <zhiguo.niu@unisoc.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gTW9uLCBGZWIgMjYsIDIwMjQgYXQgMzo0NuKAr1BNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9y
Zz4gd3JvdGU6Cj4KPiBMb29wIHRvIFpoaWd1bywKPgo+IE9uIDIwMjQvMi8yMiAyMDoxOCwgQ2hh
byBZdSB3cm90ZToKPiA+IElmIENPTkZJR19GMkZTX0NIRUNLX0ZTIGlzIG9mZiwgYW5kIGZvciB2
ZXJ5IHJhcmUgY29ybmVyIGNhc2UgdGhhdAo+ID4gd2UgcnVuIG91dCBvZiBmcmVlIHNlZ21lbnQs
IHdlIHNob3VsZCBub3QgcGFuaWMga2VybmVsLCBpbnN0ZWFkLAo+ID4gbGV0J3MgaGFuZGxlIHN1
Y2ggZXJyb3IgY29ycmVjdGx5IGluIGl0cyBjYWxsZXIuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTog
Q2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPgpUZXN0ZWQtYnk6IFpoaWd1byBOaXUgPHpoaWd1by5u
aXVAdW5pc29jLmNvbT4KVGhhbmtzIQo+ID4gLS0tCj4gPiAgIGZzL2YyZnMvZGF0YS5jICAgIHwg
IDcgKysrKystLQo+ID4gICBmcy9mMmZzL2YyZnMuaCAgICB8ICAyICstCj4gPiAgIGZzL2YyZnMv
ZmlsZS5jICAgIHwgIDcgKysrKysrLQo+ID4gICBmcy9mMmZzL2djLmMgICAgICB8ICA3ICsrKysr
Ky0KPiA+ICAgZnMvZjJmcy9zZWdtZW50LmMgfCA0NiArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKystLS0tLS0tCj4gPiAgIDUgZmlsZXMgY2hhbmdlZCwgNTcgaW5zZXJ0aW9u
cygrKSwgMTIgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZGF0YS5j
IGIvZnMvZjJmcy9kYXRhLmMKPiA+IGluZGV4IDBjOWFhMzA4MmZjZi4uYzIxYjkyZjE4NDYzIDEw
MDY0NAo+ID4gLS0tIGEvZnMvZjJmcy9kYXRhLmMKPiA+ICsrKyBiL2ZzL2YyZnMvZGF0YS5jCj4g
PiBAQCAtMTQxNiw4ICsxNDE2LDExIEBAIHN0YXRpYyBpbnQgX19hbGxvY2F0ZV9kYXRhX2Jsb2Nr
KHN0cnVjdCBkbm9kZV9vZl9kYXRhICpkbiwgaW50IHNlZ190eXBlKQo+ID4KPiA+ICAgICAgIHNl
dF9zdW1tYXJ5KCZzdW0sIGRuLT5uaWQsIGRuLT5vZnNfaW5fbm9kZSwgbmkudmVyc2lvbik7Cj4g
PiAgICAgICBvbGRfYmxrYWRkciA9IGRuLT5kYXRhX2Jsa2FkZHI7Cj4gPiAtICAgICBmMmZzX2Fs
bG9jYXRlX2RhdGFfYmxvY2soc2JpLCBOVUxMLCBvbGRfYmxrYWRkciwgJmRuLT5kYXRhX2Jsa2Fk
ZHIsCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmc3VtLCBzZWdfdHlwZSwgTlVM
TCk7Cj4gPiArICAgICBlcnIgPSBmMmZzX2FsbG9jYXRlX2RhdGFfYmxvY2soc2JpLCBOVUxMLCBv
bGRfYmxrYWRkciwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZkbi0+ZGF0YV9i
bGthZGRyLCAmc3VtLCBzZWdfdHlwZSwgTlVMTCk7Cj4gPiArICAgICBpZiAoZXJyKQo+ID4gKyAg
ICAgICAgICAgICByZXR1cm4gZXJyOwo+ID4gKwo+ID4gICAgICAgaWYgKEdFVF9TRUdOTyhzYmks
IG9sZF9ibGthZGRyKSAhPSBOVUxMX1NFR05PKQo+ID4gICAgICAgICAgICAgICBmMmZzX2ludmFs
aWRhdGVfaW50ZXJuYWxfY2FjaGUoc2JpLCBvbGRfYmxrYWRkcik7Cj4gPgo+ID4gZGlmZiAtLWdp
dCBhL2ZzL2YyZnMvZjJmcy5oIGIvZnMvZjJmcy9mMmZzLmgKPiA+IGluZGV4IGZiYmU5YTBhNDIy
MS4uNjM5MGMzZDU1MWNiIDEwMDY0NAo+ID4gLS0tIGEvZnMvZjJmcy9mMmZzLmgKPiA+ICsrKyBi
L2ZzL2YyZnMvZjJmcy5oCj4gPiBAQCAtMzcyNiw3ICszNzI2LDcgQEAgdm9pZCBmMmZzX3JlcGxh
Y2VfYmxvY2soc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBzdHJ1Y3QgZG5vZGVfb2ZfZGF0YSAq
ZG4sCj4gPiAgICAgICAgICAgICAgICAgICAgICAgYmxvY2tfdCBvbGRfYWRkciwgYmxvY2tfdCBu
ZXdfYWRkciwKPiA+ICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBjaGFyIHZlcnNpb24s
IGJvb2wgcmVjb3Zlcl9jdXJzZWcsCj4gPiAgICAgICAgICAgICAgICAgICAgICAgYm9vbCByZWNv
dmVyX25ld2FkZHIpOwo+ID4gLXZvaWQgZjJmc19hbGxvY2F0ZV9kYXRhX2Jsb2NrKHN0cnVjdCBm
MmZzX3NiX2luZm8gKnNiaSwgc3RydWN0IHBhZ2UgKnBhZ2UsCj4gPiAraW50IGYyZnNfYWxsb2Nh
dGVfZGF0YV9ibG9jayhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIHN0cnVjdCBwYWdlICpwYWdl
LAo+ID4gICAgICAgICAgICAgICAgICAgICAgIGJsb2NrX3Qgb2xkX2Jsa2FkZHIsIGJsb2NrX3Qg
Km5ld19ibGthZGRyLAo+ID4gICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBmMmZzX3N1bW1h
cnkgKnN1bSwgaW50IHR5cGUsCj4gPiAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGYyZnNf
aW9faW5mbyAqZmlvKTsKPiA+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2ZpbGUuYyBiL2ZzL2YyZnMv
ZmlsZS5jCj4gPiBpbmRleCAwODhkMGU3OWZiYmMuLmQ2ZWM3NDRmMTU0NSAxMDA2NDQKPiA+IC0t
LSBhL2ZzL2YyZnMvZmlsZS5jCj4gPiArKysgYi9mcy9mMmZzL2ZpbGUuYwo+ID4gQEAgLTIyNjIs
OCArMjI2MiwxMSBAQCBzdGF0aWMgaW50IGYyZnNfaW9jX3NodXRkb3duKHN0cnVjdCBmaWxlICpm
aWxwLCB1bnNpZ25lZCBsb25nIGFyZykKPiA+ICAgICAgIGNhc2UgRjJGU19HT0lOR19ET1dOX01F
VEFTWU5DOgo+ID4gICAgICAgICAgICAgICAvKiBkbyBjaGVja3BvaW50IG9ubHkgKi8KPiA+ICAg
ICAgICAgICAgICAgcmV0ID0gZjJmc19zeW5jX2ZzKHNiLCAxKTsKPiA+IC0gICAgICAgICAgICAg
aWYgKHJldCkKPiA+ICsgICAgICAgICAgICAgaWYgKHJldCkgewo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgIGlmIChyZXQgPT0gLUVJTykKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHJldCA9IDA7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgZ290byBvdXQ7Cj4gPiArICAgICAg
ICAgICAgIH0KPiA+ICAgICAgICAgICAgICAgZjJmc19zdG9wX2NoZWNrcG9pbnQoc2JpLCBmYWxz
ZSwgU1RPUF9DUF9SRUFTT05fU0hVVERPV04pOwo+ID4gICAgICAgICAgICAgICBicmVhazsKPiA+
ICAgICAgIGNhc2UgRjJGU19HT0lOR19ET1dOX05PU1lOQzoKPiA+IEBAIC0yMjc5LDYgKzIyODIs
OCBAQCBzdGF0aWMgaW50IGYyZnNfaW9jX3NodXRkb3duKHN0cnVjdCBmaWxlICpmaWxwLCB1bnNp
Z25lZCBsb25nIGFyZykKPiA+ICAgICAgICAgICAgICAgc2V0X3NiaV9mbGFnKHNiaSwgU0JJX0lT
X0RJUlRZKTsKPiA+ICAgICAgICAgICAgICAgLyogZG8gY2hlY2twb2ludCBvbmx5ICovCj4gPiAg
ICAgICAgICAgICAgIHJldCA9IGYyZnNfc3luY19mcyhzYiwgMSk7Cj4gPiArICAgICAgICAgICAg
IGlmIChyZXQgPT0gLUVJTykKPiA+ICsgICAgICAgICAgICAgICAgICAgICByZXQgPSAwOwo+ID4g
ICAgICAgICAgICAgICBnb3RvIG91dDsKPiA+ICAgICAgIGRlZmF1bHQ6Cj4gPiAgICAgICAgICAg
ICAgIHJldCA9IC1FSU5WQUw7Cj4gPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9nYy5jIGIvZnMvZjJm
cy9nYy5jCj4gPiBpbmRleCA2ZDE2MGQ1MGUxNGUuLjQyZTc1ZTliOGI2YiAxMDA2NDQKPiA+IC0t
LSBhL2ZzL2YyZnMvZ2MuYwo+ID4gKysrIGIvZnMvZjJmcy9nYy5jCj4gPiBAQCAtMTM1OCw4ICsx
MzU4LDEzIEBAIHN0YXRpYyBpbnQgbW92ZV9kYXRhX2Jsb2NrKHN0cnVjdCBpbm9kZSAqaW5vZGUs
IGJsb2NrX3QgYmlkeCwKPiA+ICAgICAgIHNldF9zdW1tYXJ5KCZzdW0sIGRuLm5pZCwgZG4ub2Zz
X2luX25vZGUsIG5pLnZlcnNpb24pOwo+ID4KPiA+ICAgICAgIC8qIGFsbG9jYXRlIGJsb2NrIGFk
ZHJlc3MgKi8KPiA+IC0gICAgIGYyZnNfYWxsb2NhdGVfZGF0YV9ibG9jayhmaW8uc2JpLCBOVUxM
LCBmaW8ub2xkX2Jsa2FkZHIsICZuZXdhZGRyLAo+ID4gKyAgICAgZXJyID0gZjJmc19hbGxvY2F0
ZV9kYXRhX2Jsb2NrKGZpby5zYmksIE5VTEwsIGZpby5vbGRfYmxrYWRkciwgJm5ld2FkZHIsCj4g
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmc3VtLCB0eXBlLCBOVUxMKTsKPiA+ICsg
ICAgIGlmIChlcnIpIHsKPiA+ICsgICAgICAgICAgICAgZjJmc19wdXRfcGFnZShtcGFnZSwgMSk7
Cj4gPiArICAgICAgICAgICAgIC8qIGZpbGVzeXN0ZW0gc2hvdWxkIHNodXRkb3duLCBubyBuZWVk
IHRvIHJlY292ZXJ5IGJsb2NrICovCj4gPiArICAgICAgICAgICAgIGdvdG8gdXBfb3V0Owo+ID4g
KyAgICAgfQo+ID4KPiA+ICAgICAgIGZpby5lbmNyeXB0ZWRfcGFnZSA9IGYyZnNfcGFnZWNhY2hl
X2dldF9wYWdlKE1FVEFfTUFQUElORyhmaW8uc2JpKSwKPiA+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIG5ld2FkZHIsIEZHUF9MT0NLIHwgRkdQX0NSRUFULCBHRlBfTk9GUyk7Cj4gPiBk
aWZmIC0tZ2l0IGEvZnMvZjJmcy9zZWdtZW50LmMgYi9mcy9mMmZzL3NlZ21lbnQuYwo+ID4gaW5k
ZXggOGVkYzQyMDcxZTZmLi43MWY1MjM0MzFlODcgMTAwNjQ0Cj4gPiAtLS0gYS9mcy9mMmZzL3Nl
Z21lbnQuYwo+ID4gKysrIGIvZnMvZjJmcy9zZWdtZW50LmMKPiA+IEBAIC00MDAsNiArNDAwLDkg
QEAgaW50IGYyZnNfY29tbWl0X2F0b21pY193cml0ZShzdHJ1Y3QgaW5vZGUgKmlub2RlKQo+ID4g
ICAgKi8KPiA+ICAgdm9pZCBmMmZzX2JhbGFuY2VfZnMoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2Jp
LCBib29sIG5lZWQpCj4gPiAgIHsKPiA+ICsgICAgIGlmIChmMmZzX2NwX2Vycm9yKHNiaSkpCj4g
PiArICAgICAgICAgICAgIHJldHVybjsKPiA+ICsKPiA+ICAgICAgIGlmICh0aW1lX3RvX2luamVj
dChzYmksIEZBVUxUX0NIRUNLUE9JTlQpKQo+ID4gICAgICAgICAgICAgICBmMmZzX3N0b3BfY2hl
Y2twb2ludChzYmksIGZhbHNlLCBTVE9QX0NQX1JFQVNPTl9GQVVMVF9JTkpFQ1QpOwo+ID4KPiA+
IEBAIC0yNjM2LDcgKzI2MzksNyBAQCBzdGF0aWMgaW50IGlzX25leHRfc2VnbWVudF9mcmVlKHN0
cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKPiA+ICAgICogRmluZCBhIG5ldyBzZWdtZW50IGZyb20g
dGhlIGZyZWUgc2VnbWVudHMgYml0bWFwIHRvIHJpZ2h0IG9yZGVyCj4gPiAgICAqIFRoaXMgZnVu
Y3Rpb24gc2hvdWxkIGJlIHJldHVybmVkIHdpdGggc3VjY2Vzcywgb3RoZXJ3aXNlIEJVRwo+ID4g
ICAgKi8KPiA+IC1zdGF0aWMgdm9pZCBnZXRfbmV3X3NlZ21lbnQoc3RydWN0IGYyZnNfc2JfaW5m
byAqc2JpLAo+ID4gK3N0YXRpYyBpbnQgZ2V0X25ld19zZWdtZW50KHN0cnVjdCBmMmZzX3NiX2lu
Zm8gKnNiaSwKPiA+ICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgKm5ld3NlZywg
Ym9vbCBuZXdfc2VjLCBib29sIHBpbm5pbmcpCj4gPiAgIHsKPiA+ICAgICAgIHN0cnVjdCBmcmVl
X3NlZ21hcF9pbmZvICpmcmVlX2kgPSBGUkVFX0koc2JpKTsKPiA+IEBAIC0yNzExLDYgKzI3MTQs
NyBAQCBzdGF0aWMgdm9pZCBnZXRfbmV3X3NlZ21lbnQoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2Jp
LAo+ID4gICAgICAgICAgICAgICBmMmZzX3N0b3BfY2hlY2twb2ludChzYmksIGZhbHNlLCBTVE9Q
X0NQX1JFQVNPTl9OT19TRUdNRU5UKTsKPiA+ICAgICAgICAgICAgICAgZjJmc19idWdfb24oc2Jp
LCAxKTsKPiA+ICAgICAgIH0KPiA+ICsgICAgIHJldHVybiByZXQ7Cj4gPiAgIH0KPiA+Cj4gPiAg
IHN0YXRpYyB2b2lkIHJlc2V0X2N1cnNlZyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIGludCB0
eXBlLCBpbnQgbW9kaWZpZWQpCj4gPiBAQCAtMjcxOSw2ICsyNzIzLDEwIEBAIHN0YXRpYyB2b2lk
IHJlc2V0X2N1cnNlZyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIGludCB0eXBlLCBpbnQgbW9k
aWZpZWQpCj4gPiAgICAgICBzdHJ1Y3Qgc3VtbWFyeV9mb290ZXIgKnN1bV9mb290ZXI7Cj4gPiAg
ICAgICB1bnNpZ25lZCBzaG9ydCBzZWdfdHlwZSA9IGN1cnNlZy0+c2VnX3R5cGU7Cj4gPgo+ID4g
KyAgICAgLyogb25seSBoYXBwZW4gd2hlbiBnZXRfbmV3X3NlZ21lbnQoKSBmYWlscyAqLwo+ID4g
KyAgICAgaWYgKGN1cnNlZy0+bmV4dF9zZWdubyA9PSBOVUxMX1NFR05PKQo+ID4gKyAgICAgICAg
ICAgICByZXR1cm47Cj4gPiArCj4gPiAgICAgICBjdXJzZWctPmluaXRlZCA9IHRydWU7Cj4gPiAg
ICAgICBjdXJzZWctPnNlZ25vID0gY3Vyc2VnLT5uZXh0X3NlZ25vOwo+ID4gICAgICAgY3Vyc2Vn
LT56b25lID0gR0VUX1pPTkVfRlJPTV9TRUcoc2JpLCBjdXJzZWctPnNlZ25vKTsKPiA+IEBAIC0y
NzgzLDcgKzI3OTEsMTAgQEAgc3RhdGljIGludCBuZXdfY3Vyc2VnKHN0cnVjdCBmMmZzX3NiX2lu
Zm8gKnNiaSwgaW50IHR5cGUsIGJvb2wgbmV3X3NlYykKPiA+ICAgICAgICAgICAgICAgd3JpdGVf
c3VtX3BhZ2Uoc2JpLCBjdXJzZWctPnN1bV9ibGssIEdFVF9TVU1fQkxPQ0soc2JpLCBzZWdubykp
Owo+ID4KPiA+ICAgICAgIHNlZ25vID0gX19nZXRfbmV4dF9zZWdubyhzYmksIHR5cGUpOwo+ID4g
LSAgICAgZ2V0X25ld19zZWdtZW50KHNiaSwgJnNlZ25vLCBuZXdfc2VjLCBwaW5uaW5nKTsKPiA+
ICsgICAgIGlmIChnZXRfbmV3X3NlZ21lbnQoc2JpLCAmc2Vnbm8sIG5ld19zZWMsIHBpbm5pbmcp
KSB7Cj4gPiArICAgICAgICAgICAgIGN1cnNlZy0+c2Vnbm8gPSBOVUxMX1NFR05POwo+ID4gKyAg
ICAgICAgICAgICByZXR1cm4gLUVOT1NQQzsKPiA+ICsgICAgIH0KPiA+ICAgICAgIGlmIChuZXdf
c2VjICYmIHBpbm5pbmcgJiYKPiA+ICAgICAgICAgICAhZjJmc192YWxpZF9waW5uZWRfYXJlYShz
YmksIFNUQVJUX0JMT0NLKHNiaSwgc2Vnbm8pKSkgewo+ID4gICAgICAgICAgICAgICBfX3NldF9m
cmVlKHNiaSwgc2Vnbm8pOwo+ID4gQEAgLTM0MjUsNyArMzQzNiw3IEBAIHN0YXRpYyB2b2lkIGYy
ZnNfcmFuZG9taXplX2NodW5rKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKPiA+ICAgICAgICAg
ICAgICAgZ2V0X3JhbmRvbV91MzJfaW5jbHVzaXZlKDEsIHNiaS0+bWF4X2ZyYWdtZW50X2hvbGUp
Owo+ID4gICB9Cj4gPgo+ID4gLXZvaWQgZjJmc19hbGxvY2F0ZV9kYXRhX2Jsb2NrKHN0cnVjdCBm
MmZzX3NiX2luZm8gKnNiaSwgc3RydWN0IHBhZ2UgKnBhZ2UsCj4gPiAraW50IGYyZnNfYWxsb2Nh
dGVfZGF0YV9ibG9jayhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIHN0cnVjdCBwYWdlICpwYWdl
LAo+ID4gICAgICAgICAgICAgICBibG9ja190IG9sZF9ibGthZGRyLCBibG9ja190ICpuZXdfYmxr
YWRkciwKPiA+ICAgICAgICAgICAgICAgc3RydWN0IGYyZnNfc3VtbWFyeSAqc3VtLCBpbnQgdHlw
ZSwKPiA+ICAgICAgICAgICAgICAgc3RydWN0IGYyZnNfaW9faW5mbyAqZmlvKQo+ID4gQEAgLTM0
NDIsNiArMzQ1Myw5IEBAIHZvaWQgZjJmc19hbGxvY2F0ZV9kYXRhX2Jsb2NrKHN0cnVjdCBmMmZz
X3NiX2luZm8gKnNiaSwgc3RydWN0IHBhZ2UgKnBhZ2UsCj4gPiAgICAgICBtdXRleF9sb2NrKCZj
dXJzZWctPmN1cnNlZ19tdXRleCk7Cj4gPiAgICAgICBkb3duX3dyaXRlKCZzaXRfaS0+c2VudHJ5
X2xvY2spOwo+ID4KPiA+ICsgICAgIGlmIChjdXJzZWctPnNlZ25vID09IE5VTExfU0VHTk8pCj4g
PiArICAgICAgICAgICAgIGdvdG8gb3V0X2VycjsKPiA+ICsKPiA+ICAgICAgIGlmIChmcm9tX2dj
KSB7Cj4gPiAgICAgICAgICAgICAgIGYyZnNfYnVnX29uKHNiaSwgR0VUX1NFR05PKHNiaSwgb2xk
X2Jsa2FkZHIpID09IE5VTExfU0VHTk8pOwo+ID4gICAgICAgICAgICAgICBzZSA9IGdldF9zZWdf
ZW50cnkoc2JpLCBHRVRfU0VHTk8oc2JpLCBvbGRfYmxrYWRkcikpOwo+ID4gQEAgLTM1MDAsNiAr
MzUxNCw5IEBAIHZvaWQgZjJmc19hbGxvY2F0ZV9kYXRhX2Jsb2NrKHN0cnVjdCBmMmZzX3NiX2lu
Zm8gKnNiaSwgc3RydWN0IHBhZ2UgKnBhZ2UsCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBjaGFuZ2VfY3Vyc2VnKHNiaSwgdHlwZSk7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAg
c3RhdF9pbmNfc2VnX3R5cGUoc2JpLCBjdXJzZWcpOwo+ID4gICAgICAgICAgICAgICB9Cj4gPiAr
Cj4gPiArICAgICAgICAgICAgIGlmIChjdXJzZWctPnNlZ25vID09IE5VTExfU0VHTk8pCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgZ290byBvdXRfZXJyOwo+ID4gICAgICAgfQo+ID4KPiA+ICAg
c2tpcF9uZXdfc2VnbWVudDoKPiA+IEBAIC0zNTM0LDggKzM1NTEsMTUgQEAgdm9pZCBmMmZzX2Fs
bG9jYXRlX2RhdGFfYmxvY2soc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBzdHJ1Y3QgcGFnZSAq
cGFnZSwKPiA+ICAgICAgIH0KPiA+Cj4gPiAgICAgICBtdXRleF91bmxvY2soJmN1cnNlZy0+Y3Vy
c2VnX211dGV4KTsKPiA+IC0KPiA+ICAgICAgIGYyZnNfdXBfcmVhZCgmU01fSShzYmkpLT5jdXJz
ZWdfbG9jayk7Cj4gPiArICAgICByZXR1cm4gMDsKPiA+ICtvdXRfZXJyOgo+ID4gKyAgICAgKm5l
d19ibGthZGRyID0gTlVMTF9BRERSOwo+ID4gKyAgICAgdXBfd3JpdGUoJnNpdF9pLT5zZW50cnlf
bG9jayk7Cj4gPiArICAgICBtdXRleF91bmxvY2soJmN1cnNlZy0+Y3Vyc2VnX211dGV4KTsKPiA+
ICsgICAgIGYyZnNfdXBfcmVhZCgmU01fSShzYmkpLT5jdXJzZWdfbG9jayk7Cj4gPiArICAgICBy
ZXR1cm4gLUVOT1NQQzsKPiA+ICsKPiA+ICAgfQo+ID4KPiA+ICAgdm9pZCBmMmZzX3VwZGF0ZV9k
ZXZpY2Vfc3RhdGUoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBuaWRfdCBpbm8sCj4gPiBAQCAt
MzU3Myw4ICszNTk3LDE2IEBAIHN0YXRpYyB2b2lkIGRvX3dyaXRlX3BhZ2Uoc3RydWN0IGYyZnNf
c3VtbWFyeSAqc3VtLCBzdHJ1Y3QgZjJmc19pb19pbmZvICpmaW8pCj4gPiAgICAgICBpZiAoa2Vl
cF9vcmRlcikKPiA+ICAgICAgICAgICAgICAgZjJmc19kb3duX3JlYWQoJmZpby0+c2JpLT5pb19v
cmRlcl9sb2NrKTsKPiA+Cj4gPiAtICAgICBmMmZzX2FsbG9jYXRlX2RhdGFfYmxvY2soZmlvLT5z
YmksIGZpby0+cGFnZSwgZmlvLT5vbGRfYmxrYWRkciwKPiA+IC0gICAgICAgICAgICAgICAgICAg
ICAmZmlvLT5uZXdfYmxrYWRkciwgc3VtLCB0eXBlLCBmaW8pOwo+ID4gKyAgICAgaWYgKGYyZnNf
YWxsb2NhdGVfZGF0YV9ibG9jayhmaW8tPnNiaSwgZmlvLT5wYWdlLCBmaW8tPm9sZF9ibGthZGRy
LAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICZmaW8tPm5ld19ibGthZGRyLCBzdW0sIHR5cGUs
IGZpbykpIHsKPiA+ICsgICAgICAgICAgICAgaWYgKGZzY3J5cHRfaW5vZGVfdXNlc19mc19sYXll
cl9jcnlwdG8oZmlvLT5wYWdlLT5tYXBwaW5nLT5ob3N0KSkKPiA+ICsgICAgICAgICAgICAgICAg
ICAgICBmc2NyeXB0X2ZpbmFsaXplX2JvdW5jZV9wYWdlKCZmaW8tPmVuY3J5cHRlZF9wYWdlKTsK
PiA+ICsgICAgICAgICAgICAgaWYgKFBhZ2VXcml0ZWJhY2soZmlvLT5wYWdlKSkKPiA+ICsgICAg
ICAgICAgICAgICAgICAgICBlbmRfcGFnZV93cml0ZWJhY2soZmlvLT5wYWdlKTsKPiA+ICsgICAg
ICAgICAgICAgaWYgKGYyZnNfaW5fd2FybV9ub2RlX2xpc3QoZmlvLT5zYmksIGZpby0+cGFnZSkp
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgZjJmc19kZWxfZnN5bmNfbm9kZV9lbnRyeShmaW8t
PnNiaSwgZmlvLT5wYWdlKTsKPiA+ICsgICAgICAgICAgICAgZ290byBvdXQ7Cj4gPiArICAgICB9
Cj4gPiAgICAgICBpZiAoR0VUX1NFR05PKGZpby0+c2JpLCBmaW8tPm9sZF9ibGthZGRyKSAhPSBO
VUxMX1NFR05PKQo+ID4gICAgICAgICAgICAgICBmMmZzX2ludmFsaWRhdGVfaW50ZXJuYWxfY2Fj
aGUoZmlvLT5zYmksIGZpby0+b2xkX2Jsa2FkZHIpOwo+ID4KPiA+IEBAIC0zNTgyLDcgKzM2MTQs
NyBAQCBzdGF0aWMgdm9pZCBkb193cml0ZV9wYWdlKHN0cnVjdCBmMmZzX3N1bW1hcnkgKnN1bSwg
c3RydWN0IGYyZnNfaW9faW5mbyAqZmlvKQo+ID4gICAgICAgZjJmc19zdWJtaXRfcGFnZV93cml0
ZShmaW8pOwo+ID4KPiA+ICAgICAgIGYyZnNfdXBkYXRlX2RldmljZV9zdGF0ZShmaW8tPnNiaSwg
ZmlvLT5pbm8sIGZpby0+bmV3X2Jsa2FkZHIsIDEpOwo+ID4gLQo+ID4gK291dDoKPiA+ICAgICAg
IGlmIChrZWVwX29yZGVyKQo+ID4gICAgICAgICAgICAgICBmMmZzX3VwX3JlYWQoJmZpby0+c2Jp
LT5pb19vcmRlcl9sb2NrKTsKPiA+ICAgfQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYy
ZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2Uu
bmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
