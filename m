Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1284696AECD
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Sep 2024 04:53:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1slg8n-0006qH-V2;
	Wed, 04 Sep 2024 02:53:05 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1slg8m-0006q8-3Q
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Sep 2024 02:53:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gOOBx3QtPTmrvcsY+NQ7mLw9fjjRxUnCt6gWbxiIBig=; b=eQKBljFlI/f4LrOZtDMWcCulKR
 y9k18hMx4Zcw73ibOfUlyXXOT8DwmY93nKXI31Rzn8fX8+P72djmBlZeoC82OxuUJ9C2hJ5Tx9L7Q
 zcmsHa9Bo2cnp7l2hajgF9hh1VHytKYyrs/msufqstXHjwHCAv6vxmxlumdlpZ4OqfQ0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gOOBx3QtPTmrvcsY+NQ7mLw9fjjRxUnCt6gWbxiIBig=; b=SHemJyqDwCUsiZGBfUJ6bcFdEX
 puIR7zL8+m9uCeAGAONNuZK05aUBciv6XJNh0w6vBL+KzLJ02MNWWxhXwffEb/Cx3bVabOc/Ml29z
 uRiu5k7j14So6IjERMxNFKDgipzJ/nsaAI5Pa7HBBDbsMg3tdjx2mQQ7n3VkmhKblYbw=;
Received: from mail-ua1-f49.google.com ([209.85.222.49])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1slg8k-0003xi-Ng for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Sep 2024 02:53:03 +0000
Received: by mail-ua1-f49.google.com with SMTP id
 a1e0cc1a2514c-846db33f4e5so105524241.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 03 Sep 2024 19:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725418372; x=1726023172; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gOOBx3QtPTmrvcsY+NQ7mLw9fjjRxUnCt6gWbxiIBig=;
 b=T6lSkB8iWEjkPq5t7tTW25wG1RfFYy2HJPCmfzcpPSkAqM6nry8bNYfJ1wMCAFg5RB
 ZpGKyQxT2lVWGnOqLcuJg8pMhs1/pjJnCrCbv0Zk8fLDfalHNBUhW6pdtBkUtfPEJSSp
 oJ/XWryqIYHFc3QRikz9MGmoZEGZtplg8fiOyJ/r7n/GQFzZ2j+XZ169GuW4YahIQ9sf
 lIGRx2yhKyV1BwuWjjt117lSFH3F6+lj+jKksS8P4WWNUYslZsFO2VmJZsJA0INviCfk
 TtTLQwCzclhHu0da+HxlUgyrTjCvHrsJrimcaSkf3+w18Xhoylj3xqYQlnfo3AUu2i3D
 egGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725418372; x=1726023172;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gOOBx3QtPTmrvcsY+NQ7mLw9fjjRxUnCt6gWbxiIBig=;
 b=Y1tHFOwIBGpqYs8a2vlSQybJzzVYG2gHzDJ0KAjUu3FQCHIIDfFHCeg4yRzrc8a72C
 1C0dvEvL7ijzQeLBrqkkME8xcvkGaPr0WDcuo7Mqz0n4Xu//Usk59tOAkYLIaKUq2Z+5
 hh1n7s82kjScmMXx9JGP8QhHq9PVmVujcaMI1YbJG3gFMXRpSYvt1G+XlxtGw7dLIiIg
 7iXtZI1OMWDRoJpU4KYXpKSOoYRJc7decF4nMl7OzvGO5LrxVZPhAF114RqyvzHdEUyh
 CghEEupFkxXb+T+oPY/UynjgdiTrurKZONSPFEtgiYLl4CQ0Ja2Lg+wiVQXa6utD0j8b
 Qv3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWf83nZTdO2sNomh/7mBISvQzfSFMxXa38OrtnaaeYkvJuXgRd1uHuJX1V0C1QQUn5R24Of7/fmHCStKtwRsv+Q@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyAP6k0HnJkJJdaeN6nEg2jkqRUR45PO1TEI6VLbRUBOLuw8nnf
 /LcD6mo8lGEU+7BOBvS1YNa95TGz4dlkYzCQQGBjy+pNAIhLqlvZ+NthtrbtFWVTjLgCsd6oUFE
 IY1Xob7EyKxnNej1twOlIlRKSMXo=
X-Google-Smtp-Source: AGHT+IENBRa9rPvI6TtSBIQWGOPOw17L31IEWTUJU5QaoCJJEvx/YHqQOT/FfUSaAo/7LPiQc418I1n6R9AtM8HYFG0=
X-Received: by 2002:a05:6122:328f:b0:4f5:14f9:e12c with SMTP id
 71dfb90a1353d-4fff16ee678mr22343219e0c.13.1725418371659; Tue, 03 Sep 2024
 19:52:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240826202352.2150294-1-daeho43@gmail.com>
 <45a8a9f3-27b8-433e-a0ac-e457f4cdf1eb@kernel.org>
 <CACOAw_xMipooJy3GrZTc2CSpMoSs9FsErdxjqMWXVQ6iDiEZ0Q@mail.gmail.com>
 <d4f218ad-7a01-4b5b-a438-c0e4e14bbc96@kernel.org>
In-Reply-To: <d4f218ad-7a01-4b5b-a438-c0e4e14bbc96@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Tue, 3 Sep 2024 19:52:31 -0700
Message-ID: <CACOAw_zvNyD3cmMpJsidEMyrtnZYU4kR4BmE_cygroPyYoiGvA@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Tue, Sep 3, 2024 at 7:26 PM Chao Yu wrote: > > On 2024/9/4
    1:07, Daeho Jeong wrote: > > On Mon, Sep 2, 2024 at 3:08 AM Chao Yu wrote:
    > >> > >> On 2024/8/27 4:23, Daeho Jeong wrote: > >>> F [...] 
 
 Content analysis details:   (0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.222.49 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.222.49 listed in wl.mailspike.net]
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1slg8k-0003xi-Ng
Subject: Re: [f2fs-dev] [PATCH] f2fs: prevent atomic file from being dirtied
 before commit
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

T24gVHVlLCBTZXAgMywgMjAyNCBhdCA3OjI24oCvUE0gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3Jn
PiB3cm90ZToKPgo+IE9uIDIwMjQvOS80IDE6MDcsIERhZWhvIEplb25nIHdyb3RlOgo+ID4gT24g
TW9uLCBTZXAgMiwgMjAyNCBhdCAzOjA44oCvQU0gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiB3
cm90ZToKPiA+Pgo+ID4+IE9uIDIwMjQvOC8yNyA0OjIzLCBEYWVobyBKZW9uZyB3cm90ZToKPiA+
Pj4gRnJvbTogRGFlaG8gSmVvbmcgPGRhZWhvamVvbmdAZ29vZ2xlLmNvbT4KPiA+Pj4KPiA+Pj4g
S2VlcCBhdG9taWMgZmlsZSBjbGVhbiB3aGlsZSB1cGRhdGluZyBhbmQgbWFrZSBpdCBkaXJ0aWVk
IGR1cmluZyBjb21taXQKPiA+Pj4gaW4gb3JkZXIgdG8gYXZvaWQgdW5uZWNlc3NhcnkgYW5kIGV4
Y2Vzc2l2ZSBpbm9kZSB1cGRhdGVzIGluIHRoZSBwcmV2aW91cwo+ID4+PiBmaXguCj4gPj4+Cj4g
Pj4+IEZpeGVzOiA0YmY3ODMyMjM0NmYgKCJmMmZzOiBtYXJrIGlub2RlIGRpcnR5IGZvciBGSV9B
VE9NSUNfQ09NTUlUVEVEIGZsYWciKQo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBEYWVobyBKZW9uZyA8
ZGFlaG9qZW9uZ0Bnb29nbGUuY29tPgo+ID4+PiAtLS0KPiA+Pj4gICAgZnMvZjJmcy9mMmZzLmgg
ICAgfCAgMyArLS0KPiA+Pj4gICAgZnMvZjJmcy9pbm9kZS5jICAgfCAxMCArKysrKystLS0tCj4g
Pj4+ICAgIGZzL2YyZnMvc2VnbWVudC5jIHwgMTAgKysrKysrKystLQo+ID4+PiAgICAzIGZpbGVz
IGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCj4gPj4+Cj4gPj4+IGRp
ZmYgLS1naXQgYS9mcy9mMmZzL2YyZnMuaCBiL2ZzL2YyZnMvZjJmcy5oCj4gPj4+IGluZGV4IDQ2
NWIyZmQ1MGM3MC4uNWE3ZjZmYThiNTg1IDEwMDY0NAo+ID4+PiAtLS0gYS9mcy9mMmZzL2YyZnMu
aAo+ID4+PiArKysgYi9mcy9mMmZzL2YyZnMuaAo+ID4+PiBAQCAtODAxLDcgKzgwMSw3IEBAIGVu
dW0gewo+ID4+PiAgICAgICAgRklfQ09NUFJFU1NfUkVMRUFTRUQsICAgLyogY29tcHJlc3NlZCBi
bG9ja3Mgd2VyZSByZWxlYXNlZCAqLwo+ID4+PiAgICAgICAgRklfQUxJR05FRF9XUklURSwgICAg
ICAgLyogZW5hYmxlIGFsaWduZWQgd3JpdGUgKi8KPiA+Pj4gICAgICAgIEZJX0NPV19GSUxFLCAg
ICAgICAgICAgIC8qIGluZGljYXRlIENPVyBmaWxlICovCj4gPj4+IC0gICAgIEZJX0FUT01JQ19D
T01NSVRURUQsICAgIC8qIGluZGljYXRlIGF0b21pYyBjb21taXQgY29tcGxldGVkIGV4Y2VwdCBk
aXNrIHN5bmMgKi8KPiA+Pj4gKyAgICAgRklfQVRPTUlDX0RJUlRJRUQsICAgICAgLyogaW5kaWNh
dGUgYXRvbWljIGZpbGUgaXMgZGlydGllZCAqLwo+ID4+PiAgICAgICAgRklfQVRPTUlDX1JFUExB
Q0UsICAgICAgLyogaW5kaWNhdGUgYXRvbWljIHJlcGxhY2UgKi8KPiA+Pj4gICAgICAgIEZJX09Q
RU5FRF9GSUxFLCAgICAgICAgIC8qIGluZGljYXRlIGZpbGUgaGFzIGJlZW4gb3BlbmVkICovCj4g
Pj4+ICAgICAgICBGSV9NQVgsICAgICAgICAgICAgICAgICAvKiBtYXggZmxhZywgbmV2ZXIgYmUg
dXNlZCAqLwo+ID4+PiBAQCAtMzA0Miw3ICszMDQyLDYgQEAgc3RhdGljIGlubGluZSB2b2lkIF9f
bWFya19pbm9kZV9kaXJ0eV9mbGFnKHN0cnVjdCBpbm9kZSAqaW5vZGUsCj4gPj4+ICAgICAgICBj
YXNlIEZJX0lOTElORV9ET1RTOgo+ID4+PiAgICAgICAgY2FzZSBGSV9QSU5fRklMRToKPiA+Pj4g
ICAgICAgIGNhc2UgRklfQ09NUFJFU1NfUkVMRUFTRUQ6Cj4gPj4+IC0gICAgIGNhc2UgRklfQVRP
TUlDX0NPTU1JVFRFRDoKPiA+Pj4gICAgICAgICAgICAgICAgZjJmc19tYXJrX2lub2RlX2RpcnR5
X3N5bmMoaW5vZGUsIHRydWUpOwo+ID4+PiAgICAgICAgfQo+ID4+PiAgICB9Cj4gPj4+IGRpZmYg
LS1naXQgYS9mcy9mMmZzL2lub2RlLmMgYi9mcy9mMmZzL2lub2RlLmMKPiA+Pj4gaW5kZXggMWVi
MjUwYzZiMzkyLi41ZGQzZTU1ZDJiZTIgMTAwNjQ0Cj4gPj4+IC0tLSBhL2ZzL2YyZnMvaW5vZGUu
Ywo+ID4+PiArKysgYi9mcy9mMmZzL2lub2RlLmMKPiA+Pj4gQEAgLTM1LDYgKzM1LDExIEBAIHZv
aWQgZjJmc19tYXJrX2lub2RlX2RpcnR5X3N5bmMoc3RydWN0IGlub2RlICppbm9kZSwgYm9vbCBz
eW5jKQo+ID4+PiAgICAgICAgaWYgKGYyZnNfaW5vZGVfZGlydGllZChpbm9kZSwgc3luYykpCj4g
Pj4KPiA+PiBJdCB3aWxsIHJldHVybiBkaXJlY3RseSBoZXJlIGlmIGlub2RlIHdhcyBkaXJ0aWVk
LCBzbyBpdCBtYXkgbWlzc2VkIHRvIHNldAo+ID4+IEZJX0FUT01JQ19ESVJUSUVEIGZsYWc/Cj4g
Pgo+ID4gSXMgaXQgcG9zc2libGUgZm9yIGl0IHRvIGJlIGFscmVhZHkgZGlydHksIHNpbmNlIHdl
IGFscmVhZHkgbWFkZSBpdAo+ID4gY2xlYW4gd2l0aCBmMmZzX3dyaXRlX2lub2RlKCkgd2hlbiB3
ZSBzdGFydGVkIHRoZSBhdG9taWMgd3JpdGU/Cj4KPiBTb21lIGlvY3RsIGludGVyZmFjZXMgbWF5
IHJhY2Ugdy8gYXRvbWljIHdyaXRlPyBlLmcuIHNldF9waW5fZmlsZSB3b24ndAo+IGNoZWNrIGF0
b21pY19maWxlIHN0YXR1cywgYW5kIG1heSBkaXJ0eSBpbm9kZSBhZnRlciB3ZSBzdGFydGVkIGF0
b21pYwo+IHdyaXRlLCBzbyB3ZSdkIGJldHRlciBkZXRlY3Qgc3VjaCByYWNlIGNvbmRpdGlvbiBh
bmQgYnJlYWsgaW9jdGwgdG8KPiBhdm9pZCBydWluIGF0b21pYyB3cml0ZT8gYW5kIG1heWJlIHdl
IGNhbiBhZGQgZjJmc19idWdfb24oKSBpbgo+IGYyZnNfbWFya19pbm9kZV9kaXJ0eV9zeW5jKCkg
dG8gZGV0ZWN0IGFueSBvdGhlciBtaXNzaW5nIGNhc2VzPwo+CgpIb3cgYWJvdXQgZXhjaGFuZ2lu
ZyB0aGUgcG9zaXRpb25zIG9mIGYyZnNfd3JpdGVfaW5vZGUoKSBhbmQKc2V0X2lub2RlX2ZsYWco
KSBpbiBmMmZzX2lvY19zdGFydF9hdG9taWNfd3JpdGUoKT8KCi4uLgogICAgICAgIGYyZnNfd3Jp
dGVfaW5vZGUoaW5vZGUsIE5VTEwpOwoKICAgICAgICBzdGF0X2luY19hdG9taWNfaW5vZGUoaW5v
ZGUpOwoKICAgICAgICBzZXRfaW5vZGVfZmxhZyhpbm9kZSwgRklfQVRPTUlDX0ZJTEUpOwouLi4K
Cj4gVGhhbmtzLAo+Cj4gPgo+ID4+Cj4gPj4gVGhhbmtzLAo+ID4+Cj4gPj4+ICAgICAgICAgICAg
ICAgIHJldHVybjsKPiA+Pj4KPiA+Pj4gKyAgICAgaWYgKGYyZnNfaXNfYXRvbWljX2ZpbGUoaW5v
ZGUpKSB7Cj4gPj4+ICsgICAgICAgICAgICAgc2V0X2lub2RlX2ZsYWcoaW5vZGUsIEZJX0FUT01J
Q19ESVJUSUVEKTsKPiA+Pj4gKyAgICAgICAgICAgICByZXR1cm47Cj4gPj4+ICsgICAgIH0KPiA+
Pj4gKwo+ID4+PiAgICAgICAgbWFya19pbm9kZV9kaXJ0eV9zeW5jKGlub2RlKTsKPiA+Pj4gICAg
fQo+ID4+Pgo+ID4+PiBAQCAtNjUzLDEwICs2NTgsNyBAQCB2b2lkIGYyZnNfdXBkYXRlX2lub2Rl
KHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBwYWdlICpub2RlX3BhZ2UpCj4gPj4+ICAgICAg
ICByaS0+aV9naWQgPSBjcHVfdG9fbGUzMihpX2dpZF9yZWFkKGlub2RlKSk7Cj4gPj4+ICAgICAg
ICByaS0+aV9saW5rcyA9IGNwdV90b19sZTMyKGlub2RlLT5pX25saW5rKTsKPiA+Pj4gICAgICAg
IHJpLT5pX2Jsb2NrcyA9IGNwdV90b19sZTY0KFNFQ1RPUl9UT19CTE9DSyhpbm9kZS0+aV9ibG9j
a3MpICsgMSk7Cj4gPj4+IC0KPiA+Pj4gLSAgICAgaWYgKCFmMmZzX2lzX2F0b21pY19maWxlKGlu
b2RlKSB8fAo+ID4+PiAtICAgICAgICAgICAgICAgICAgICAgaXNfaW5vZGVfZmxhZ19zZXQoaW5v
ZGUsIEZJX0FUT01JQ19DT01NSVRURUQpKQo+ID4+PiAtICAgICAgICAgICAgIHJpLT5pX3NpemUg
PSBjcHVfdG9fbGU2NChpX3NpemVfcmVhZChpbm9kZSkpOwo+ID4+PiArICAgICByaS0+aV9zaXpl
ID0gY3B1X3RvX2xlNjQoaV9zaXplX3JlYWQoaW5vZGUpKTsKPiA+Pj4KPiA+Pj4gICAgICAgIGlm
IChldCkgewo+ID4+PiAgICAgICAgICAgICAgICByZWFkX2xvY2soJmV0LT5sb2NrKTsKPiA+Pj4g
ZGlmZiAtLWdpdCBhL2ZzL2YyZnMvc2VnbWVudC5jIGIvZnMvZjJmcy9zZWdtZW50LmMKPiA+Pj4g
aW5kZXggNzhjMzE5OGE2MzA4Li4yYjUzOTFiMjI5YTggMTAwNjQ0Cj4gPj4+IC0tLSBhL2ZzL2Yy
ZnMvc2VnbWVudC5jCj4gPj4+ICsrKyBiL2ZzL2YyZnMvc2VnbWVudC5jCj4gPj4+IEBAIC0xOTYs
OSArMTk2LDEyIEBAIHZvaWQgZjJmc19hYm9ydF9hdG9taWNfd3JpdGUoc3RydWN0IGlub2RlICpp
bm9kZSwgYm9vbCBjbGVhbikKPiA+Pj4gICAgICAgICAgICAgICAgdHJ1bmNhdGVfaW5vZGVfcGFn
ZXNfZmluYWwoaW5vZGUtPmlfbWFwcGluZyk7Cj4gPj4+Cj4gPj4+ICAgICAgICByZWxlYXNlX2F0
b21pY193cml0ZV9jbnQoaW5vZGUpOwo+ID4+PiAtICAgICBjbGVhcl9pbm9kZV9mbGFnKGlub2Rl
LCBGSV9BVE9NSUNfQ09NTUlUVEVEKTsKPiA+Pj4gICAgICAgIGNsZWFyX2lub2RlX2ZsYWcoaW5v
ZGUsIEZJX0FUT01JQ19SRVBMQUNFKTsKPiA+Pj4gICAgICAgIGNsZWFyX2lub2RlX2ZsYWcoaW5v
ZGUsIEZJX0FUT01JQ19GSUxFKTsKPiA+Pj4gKyAgICAgaWYgKGlzX2lub2RlX2ZsYWdfc2V0KGlu
b2RlLCBGSV9BVE9NSUNfRElSVElFRCkpIHsKPiA+Pj4gKyAgICAgICAgICAgICBjbGVhcl9pbm9k
ZV9mbGFnKGlub2RlLCBGSV9BVE9NSUNfRElSVElFRCk7Cj4gPj4+ICsgICAgICAgICAgICAgZjJm
c19tYXJrX2lub2RlX2RpcnR5X3N5bmMoaW5vZGUsIHRydWUpOwo+ID4+PiArICAgICB9Cj4gPj4+
ICAgICAgICBzdGF0X2RlY19hdG9taWNfaW5vZGUoaW5vZGUpOwo+ID4+Pgo+ID4+PiAgICAgICAg
RjJGU19JKGlub2RlKS0+YXRvbWljX3dyaXRlX3Rhc2sgPSBOVUxMOwo+ID4+PiBAQCAtMzY1LDcg
KzM2OCwxMCBAQCBzdGF0aWMgaW50IF9fZjJmc19jb21taXRfYXRvbWljX3dyaXRlKHN0cnVjdCBp
bm9kZSAqaW5vZGUpCj4gPj4+ICAgICAgICAgICAgICAgIHNiaS0+cmV2b2tlZF9hdG9taWNfYmxv
Y2sgKz0gZmktPmF0b21pY193cml0ZV9jbnQ7Cj4gPj4+ICAgICAgICB9IGVsc2Ugewo+ID4+PiAg
ICAgICAgICAgICAgICBzYmktPmNvbW1pdHRlZF9hdG9taWNfYmxvY2sgKz0gZmktPmF0b21pY193
cml0ZV9jbnQ7Cj4gPj4+IC0gICAgICAgICAgICAgc2V0X2lub2RlX2ZsYWcoaW5vZGUsIEZJX0FU
T01JQ19DT01NSVRURUQpOwo+ID4+PiArICAgICAgICAgICAgIGlmIChpc19pbm9kZV9mbGFnX3Nl
dChpbm9kZSwgRklfQVRPTUlDX0RJUlRJRUQpKSB7Cj4gPj4+ICsgICAgICAgICAgICAgICAgICAg
ICBjbGVhcl9pbm9kZV9mbGFnKGlub2RlLCBGSV9BVE9NSUNfRElSVElFRCk7Cj4gPj4+ICsgICAg
ICAgICAgICAgICAgICAgICBmMmZzX21hcmtfaW5vZGVfZGlydHlfc3luYyhpbm9kZSwgdHJ1ZSk7
Cj4gPj4+ICsgICAgICAgICAgICAgfQo+ID4+PiAgICAgICAgfQo+ID4+Pgo+ID4+PiAgICAgICAg
X19jb21wbGV0ZV9yZXZva2VfbGlzdChpbm9kZSwgJnJldm9rZV9saXN0LCByZXQgPyB0cnVlIDog
ZmFsc2UpOwo+ID4+Cj4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxp
c3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9s
aXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
