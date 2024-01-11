Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2B582B3D8
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 11 Jan 2024 18:17:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rNygT-0006DS-4c;
	Thu, 11 Jan 2024 17:17:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1rNygR-0006DK-2c
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 11 Jan 2024 17:17:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JljDCXTDI/7l0Qx8Rn44RazHxwBpD6tDFdZc+qfx8CA=; b=YBI7ll8hLG33n9wG9hoUwCGlgY
 HDmH89leS/eDZVw0k2mLddU/RKa3uieYTdy1HbbZ+QC7nbXFgRC4qDcgG+iFNmX5FX3rf7Yeufd5U
 FaA/9JXhie6Q4utxO+8fHMTEjjyxcOvfCNn2Hb4tK3flqWbI/lHAFhS7wk2XoBlsImXY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JljDCXTDI/7l0Qx8Rn44RazHxwBpD6tDFdZc+qfx8CA=; b=Ah/hHde+LAm7l5rRP4MJ4jgYIb
 4oNUAJFj9dMSLqfgjD/DrG+smMFuKUKPX//Mq0S7JdxuBE3AWeg2vjXT57ZFRxH/5lHZ7+ysP7vZi
 /VD75bsOlGhTkzQKxKF3k90YUDAXiRLjyamzQkoqFL2sQKNLsDdm6gm3Jqa+AJMiHk1k=;
Received: from mail-vk1-f176.google.com ([209.85.221.176])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rNygQ-0005xT-9m for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 11 Jan 2024 17:17:35 +0000
Received: by mail-vk1-f176.google.com with SMTP id
 71dfb90a1353d-4b71b86ef81so1051821e0c.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 11 Jan 2024 09:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704993443; x=1705598243; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JljDCXTDI/7l0Qx8Rn44RazHxwBpD6tDFdZc+qfx8CA=;
 b=CQVRQLpGIA2lI28bOmL61de2HpMJhulygfIexrHKpHp+ILo8cBCIMu/aBHw9gBgiS/
 0yECZ7FO6sXlCZhceEkISOYZQEbv4YjUMyQguQsCSEm5LZf34bcShL83dtTOk+RIA/28
 X7UUNFJXMWx9gsuFmduYRLXP8gmtTlYK+sSsxyG4JFXPud/0OXMNrlNFTtd1DyrgMcIa
 Tw2gY7q7q2mgIXMD0l61NG4znwM+kCPU1KPTa942vZi0EeET9EOOOmfJxY/s29ErqGNH
 +8wD1VgM8Q2HJASZId5Tg3GfX6m4AcF3erldStfPznGbPXRVTiVjgYTsH3YT6kaRpypg
 7iKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704993443; x=1705598243;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JljDCXTDI/7l0Qx8Rn44RazHxwBpD6tDFdZc+qfx8CA=;
 b=TN8PzfSiPvGU3HVgGQ4NGERtYX47AsLEdJ/i990mKZme6FjbKMKToUGXbBfvORIeXF
 psuKogdb4L5b6aCZErjM3Lj/QNjmTPtkliAu83i4HSoVoVqKEdWQllxT6zqon+b30Fft
 WLGdeHMs44yWjPGibFHpPI8VITZZ3J+w9rX7eCt9mW9+VJWWzXM3lIacmyOgwTmuq6Uw
 SCMLBZvTFTNF/mb60ZP8UjWD+KHYy700387wMwQdCHnQEsVwUUoFwmEG9L8rdGzDeMGs
 /aAQyTFKOgjtEIw8Z4rfxrb32o1BbVV9MpOue7Vf3leVO4+X0Ns4t/AYkTYmZ/C6gKaB
 kG/w==
X-Gm-Message-State: AOJu0Yz98NtGOcy/7G1wXhy4gEza/isGwOxT8xZUMgA2W/zjB8VSvboN
 36xp9L5e9FYhg8GyabhVhUIMWMw+DNWXsG9QlNY=
X-Google-Smtp-Source: AGHT+IFam9uWy1vkwWojbcvxb000l0KFofS7gMtWL7ZScMT4pPuV1oxtmt9VU9gOyB4Dea+gvFiEwF2SbKJtjQykW3Q=
X-Received: by 2002:a05:6122:1812:b0:4b6:d49f:c228 with SMTP id
 ay18-20020a056122181200b004b6d49fc228mr185717vkb.26.1704993443317; Thu, 11
 Jan 2024 09:17:23 -0800 (PST)
MIME-Version: 1.0
References: <20231228143152.1543509-1-chao@kernel.org>
 <CACOAw_xXGUt=2JJgq5yfW5ZG7EfZMm1iNTVxvfA9FoJVDwbH_A@mail.gmail.com>
 <dcefc352-d528-41e3-bc7a-5cb388f43240@kernel.org>
In-Reply-To: <dcefc352-d528-41e3-bc7a-5cb388f43240@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Thu, 11 Jan 2024 09:17:12 -0800
Message-ID: <CACOAw_z=kVrD8ZctrK=ejh8TSMgzMf0-jaUM7q6CYtB3=Bqb8A@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Wed, Jan 10, 2024 at 5:26 PM Chao Yu wrote: > > On 2024/1/11
    8:55, Daeho Jeong wrote: > > On Thu, Dec 28, 2023 at 6:33 AM Chao Yu wrote:
    > >> > >> If data block in compressed cluster is not [...] 
 
 Content analysis details:   (0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.221.176 listed in list.dnswl.org]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.176 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rNygQ-0005xT-9m
Subject: Re: [f2fs-dev] [PATCH v3 1/6] f2fs: compress: fix to guarantee
 persisting compressed blocks by CP
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gV2VkLCBKYW4gMTAsIDIwMjQgYXQgNToyNuKAr1BNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9y
Zz4gd3JvdGU6Cj4KPiBPbiAyMDI0LzEvMTEgODo1NSwgRGFlaG8gSmVvbmcgd3JvdGU6Cj4gPiBP
biBUaHUsIERlYyAyOCwgMjAyMyBhdCA2OjMz4oCvQU0gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3Jn
PiB3cm90ZToKPiA+Pgo+ID4+IElmIGRhdGEgYmxvY2sgaW4gY29tcHJlc3NlZCBjbHVzdGVyIGlz
IG5vdCBwZXJzaXN0ZWQgd2l0aCBtZXRhZGF0YQo+ID4+IGR1cmluZyBjaGVja3BvaW50LCBhZnRl
ciBTUE9SLCB0aGUgZGF0YSBtYXkgYmUgY29ycnVwdGVkLCBsZXQncwo+ID4+IGd1YXJhbnRlZSB0
byB3cml0ZSBjb21wcmVzc2VkIHBhZ2UgYnkgY2hlY2twb2ludC4KPiA+Pgo+ID4+IEZpeGVzOiA0
YzhmZjcwOTViZWYgKCJmMmZzOiBzdXBwb3J0IGRhdGEgY29tcHJlc3Npb24iKQo+ID4+IFNpZ25l
ZC1vZmYtYnk6IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4KPiA+PiAtLS0KPiA+PiB2MzoKPiA+
PiAtIHRyZWF0IGNvbXByZXNzZWQgcGFnZSBhcyBDUCBndWFyYW50ZWVkIGRhdGEgZXhwbGljdGx5
Lgo+ID4+ICAgZnMvZjJmcy9jb21wcmVzcy5jIHwgIDQgKysrLQo+ID4+ICAgZnMvZjJmcy9kYXRh
LmMgICAgIHwgMTcgKysrKysrKysrLS0tLS0tLS0KPiA+PiAgIGZzL2YyZnMvZjJmcy5oICAgICB8
ICA0ICsrKy0KPiA+PiAgIDMgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMTAgZGVs
ZXRpb25zKC0pCj4gPj4KPiA+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9jb21wcmVzcy5jIGIvZnMv
ZjJmcy9jb21wcmVzcy5jCj4gPj4gaW5kZXggYzVhNDM2NGM0NDgyLi45OTQwYjc4ODZlNWQgMTAw
NjQ0Cj4gPj4gLS0tIGEvZnMvZjJmcy9jb21wcmVzcy5jCj4gPj4gKysrIGIvZnMvZjJmcy9jb21w
cmVzcy5jCj4gPj4gQEAgLTE0MTgsNiArMTQxOCw4IEBAIHZvaWQgZjJmc19jb21wcmVzc193cml0
ZV9lbmRfaW8oc3RydWN0IGJpbyAqYmlvLCBzdHJ1Y3QgcGFnZSAqcGFnZSkKPiA+PiAgICAgICAg
ICBzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkgPSBiaW8tPmJpX3ByaXZhdGU7Cj4gPj4gICAgICAg
ICAgc3RydWN0IGNvbXByZXNzX2lvX2N0eCAqY2ljID0KPiA+PiAgICAgICAgICAgICAgICAgICAg
ICAgICAgKHN0cnVjdCBjb21wcmVzc19pb19jdHggKilwYWdlX3ByaXZhdGUocGFnZSk7Cj4gPj4g
KyAgICAgICBlbnVtIGNvdW50X3R5cGUgdHlwZSA9IFdCX0RBVEFfVFlQRShwYWdlLAo+ID4+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZjJmc19pc19jb21wcmVzc2VkX3BhZ2UocGFn
ZSkpOwo+ID4+ICAgICAgICAgIGludCBpOwo+ID4+Cj4gPj4gICAgICAgICAgaWYgKHVubGlrZWx5
KGJpby0+Ymlfc3RhdHVzKSkKPiA+PiBAQCAtMTQyNSw3ICsxNDI3LDcgQEAgdm9pZCBmMmZzX2Nv
bXByZXNzX3dyaXRlX2VuZF9pbyhzdHJ1Y3QgYmlvICpiaW8sIHN0cnVjdCBwYWdlICpwYWdlKQo+
ID4+Cj4gPj4gICAgICAgICAgZjJmc19jb21wcmVzc19mcmVlX3BhZ2UocGFnZSk7Cj4gPj4KPiA+
PiAtICAgICAgIGRlY19wYWdlX2NvdW50KHNiaSwgRjJGU19XQl9EQVRBKTsKPiA+PiArICAgICAg
IGRlY19wYWdlX2NvdW50KHNiaSwgdHlwZSk7Cj4gPj4KPiA+PiAgICAgICAgICBpZiAoYXRvbWlj
X2RlY19yZXR1cm4oJmNpYy0+cGVuZGluZ19wYWdlcykpCj4gPj4gICAgICAgICAgICAgICAgICBy
ZXR1cm47Cj4gPj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZGF0YS5jIGIvZnMvZjJmcy9kYXRhLmMK
PiA+PiBpbmRleCBkY2U4ZGVmZGY0YzcuLjgxZjllMmNjNDllMiAxMDA2NDQKPiA+PiAtLS0gYS9m
cy9mMmZzL2RhdGEuYwo+ID4+ICsrKyBiL2ZzL2YyZnMvZGF0YS5jCj4gPj4gQEAgLTQ4LDcgKzQ4
LDcgQEAgdm9pZCBmMmZzX2Rlc3Ryb3lfYmlvc2V0KHZvaWQpCj4gPj4gICAgICAgICAgYmlvc2V0
X2V4aXQoJmYyZnNfYmlvc2V0KTsKPiA+PiAgIH0KPiA+Pgo+ID4+IC1zdGF0aWMgYm9vbCBfX2lz
X2NwX2d1YXJhbnRlZWQoc3RydWN0IHBhZ2UgKnBhZ2UpCj4gPj4gK2Jvb2wgZjJmc19pc19jcF9n
dWFyYW50ZWVkKHN0cnVjdCBwYWdlICpwYWdlKQo+ID4+ICAgewo+ID4+ICAgICAgICAgIHN0cnVj
dCBhZGRyZXNzX3NwYWNlICptYXBwaW5nID0gcGFnZS0+bWFwcGluZzsKPiA+PiAgICAgICAgICBz
dHJ1Y3QgaW5vZGUgKmlub2RlOwo+ID4+IEBAIC02NSw4ICs2NSw2IEBAIHN0YXRpYyBib29sIF9f
aXNfY3BfZ3VhcmFudGVlZChzdHJ1Y3QgcGFnZSAqcGFnZSkKPiA+PiAgICAgICAgICAgICAgICAg
ICAgICAgICAgU19JU0RJUihpbm9kZS0+aV9tb2RlKSkKPiA+PiAgICAgICAgICAgICAgICAgIHJl
dHVybiB0cnVlOwo+ID4+Cj4gPj4gLSAgICAgICBpZiAoZjJmc19pc19jb21wcmVzc2VkX3BhZ2Uo
cGFnZSkpCj4gPj4gLSAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKPiA+Cj4gPiBPdXQgb2Yg
Y3VyaW9zaXR5LCB3aHkgZG9uJ3Qgd2Ugc2ltcGx5IGNoYW5nZSB0aGUgYWJvdmUgdG8gInJldHVy
biB0cnVlIj8KPgo+IERhZWhvLAo+Cj4gSSB1c2VkIHRoZSBpbXBsZW1lbnRhdGlvbiwgcGxlYXNl
IGNoZWNrIHYxIGFuZCByZWxhdGVkIGNvbW1lbnRzCj4gZnJvbSBKYWVnZXVrIGFuZCBtZSwgbGV0
IG1lIGtub3cgaWYgdGhhdCB3YXMgbm90IGNsZWFyIGVub3VnaC4gOikKPgo+IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2xpbnV4LWYyZnMtZGV2ZWwvYWFlNjU0ZTctOGE3ZS00NzhkLTlmNWEtNjU4
MDdhMGUwMzQzQGtlcm5lbC5vcmcvCgpPaCwgSSBtaXNzZWQgaXQuIFNvcnJ5fgoKPgo+ID4KPiA+
PiAgICAgICAgICBpZiAoKFNfSVNSRUcoaW5vZGUtPmlfbW9kZSkgJiYgSVNfTk9RVU9UQShpbm9k
ZSkpIHx8Cj4gPj4gICAgICAgICAgICAgICAgICAgICAgICAgIHBhZ2VfcHJpdmF0ZV9nY2luZyhw
YWdlKSkKPiA+PiAgICAgICAgICAgICAgICAgIHJldHVybiB0cnVlOwo+ID4+IEBAIC0zMzgsNyAr
MzM2LDcgQEAgc3RhdGljIHZvaWQgZjJmc193cml0ZV9lbmRfaW8oc3RydWN0IGJpbyAqYmlvKQo+
ID4+Cj4gPj4gICAgICAgICAgYmlvX2Zvcl9lYWNoX3NlZ21lbnRfYWxsKGJ2ZWMsIGJpbywgaXRl
cl9hbGwpIHsKPiA+PiAgICAgICAgICAgICAgICAgIHN0cnVjdCBwYWdlICpwYWdlID0gYnZlYy0+
YnZfcGFnZTsKPiA+PiAtICAgICAgICAgICAgICAgZW51bSBjb3VudF90eXBlIHR5cGUgPSBXQl9E
QVRBX1RZUEUocGFnZSk7Cj4gPj4gKyAgICAgICAgICAgICAgIGVudW0gY291bnRfdHlwZSB0eXBl
ID0gV0JfREFUQV9UWVBFKHBhZ2UsIGZhbHNlKTsKPiA+Pgo+ID4+ICAgICAgICAgICAgICAgICAg
aWYgKHBhZ2VfcHJpdmF0ZV9kdW1teShwYWdlKSkgewo+ID4+ICAgICAgICAgICAgICAgICAgICAg
ICAgICBjbGVhcl9wYWdlX3ByaXZhdGVfZHVtbXkocGFnZSk7Cj4gPj4gQEAgLTc2Miw3ICs3NjAs
NyBAQCBpbnQgZjJmc19zdWJtaXRfcGFnZV9iaW8oc3RydWN0IGYyZnNfaW9faW5mbyAqZmlvKQo+
ID4+ICAgICAgICAgICAgICAgICAgd2JjX2FjY291bnRfY2dyb3VwX293bmVyKGZpby0+aW9fd2Jj
LCBmaW8tPnBhZ2UsIFBBR0VfU0laRSk7Cj4gPj4KPiA+PiAgICAgICAgICBpbmNfcGFnZV9jb3Vu
dChmaW8tPnNiaSwgaXNfcmVhZF9pbyhmaW8tPm9wKSA/Cj4gPj4gLSAgICAgICAgICAgICAgICAg
ICAgICAgX19yZWFkX2lvX3R5cGUocGFnZSkgOiBXQl9EQVRBX1RZUEUoZmlvLT5wYWdlKSk7Cj4g
Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgX19yZWFkX2lvX3R5cGUocGFnZSkgOiBXQl9EQVRB
X1RZUEUoZmlvLT5wYWdlLCBmYWxzZSkpOwo+ID4+Cj4gPj4gICAgICAgICAgaWYgKGlzX3JlYWRf
aW8oYmlvX29wKGJpbykpKQo+ID4+ICAgICAgICAgICAgICAgICAgZjJmc19zdWJtaXRfcmVhZF9i
aW8oZmlvLT5zYmksIGJpbywgZmlvLT50eXBlKTsKPiA+PiBAQCAtOTczLDcgKzk3MSw3IEBAIGlu
dCBmMmZzX21lcmdlX3BhZ2VfYmlvKHN0cnVjdCBmMmZzX2lvX2luZm8gKmZpbykKPiA+PiAgICAg
ICAgICBpZiAoZmlvLT5pb193YmMpCj4gPj4gICAgICAgICAgICAgICAgICB3YmNfYWNjb3VudF9j
Z3JvdXBfb3duZXIoZmlvLT5pb193YmMsIGZpby0+cGFnZSwgUEFHRV9TSVpFKTsKPiA+Pgo+ID4+
IC0gICAgICAgaW5jX3BhZ2VfY291bnQoZmlvLT5zYmksIFdCX0RBVEFfVFlQRShwYWdlKSk7Cj4g
Pj4gKyAgICAgICBpbmNfcGFnZV9jb3VudChmaW8tPnNiaSwgV0JfREFUQV9UWVBFKHBhZ2UsIGZh
bHNlKSk7Cj4gPj4KPiA+PiAgICAgICAgICAqZmlvLT5sYXN0X2Jsb2NrID0gZmlvLT5uZXdfYmxr
YWRkcjsKPiA+PiAgICAgICAgICAqZmlvLT5iaW8gPSBiaW87Cj4gPj4gQEAgLTEwMDcsNiArMTAw
NSw3IEBAIHZvaWQgZjJmc19zdWJtaXRfcGFnZV93cml0ZShzdHJ1Y3QgZjJmc19pb19pbmZvICpm
aW8pCj4gPj4gICAgICAgICAgZW51bSBwYWdlX3R5cGUgYnR5cGUgPSBQQUdFX1RZUEVfT0ZfQklP
KGZpby0+dHlwZSk7Cj4gPj4gICAgICAgICAgc3RydWN0IGYyZnNfYmlvX2luZm8gKmlvID0gc2Jp
LT53cml0ZV9pb1tidHlwZV0gKyBmaW8tPnRlbXA7Cj4gPj4gICAgICAgICAgc3RydWN0IHBhZ2Ug
KmJpb19wYWdlOwo+ID4+ICsgICAgICAgZW51bSBjb3VudF90eXBlIHR5cGU7Cj4gPj4KPiA+PiAg
ICAgICAgICBmMmZzX2J1Z19vbihzYmksIGlzX3JlYWRfaW8oZmlvLT5vcCkpOwo+ID4+Cj4gPj4g
QEAgLTEwNDYsNyArMTA0NSw4IEBAIHZvaWQgZjJmc19zdWJtaXRfcGFnZV93cml0ZShzdHJ1Y3Qg
ZjJmc19pb19pbmZvICpmaW8pCj4gPj4gICAgICAgICAgLyogc2V0IHN1Ym1pdHRlZCA9IHRydWUg
YXMgYSByZXR1cm4gdmFsdWUgKi8KPiA+PiAgICAgICAgICBmaW8tPnN1Ym1pdHRlZCA9IDE7Cj4g
Pj4KPiA+PiAtICAgICAgIGluY19wYWdlX2NvdW50KHNiaSwgV0JfREFUQV9UWVBFKGJpb19wYWdl
KSk7Cj4gPj4gKyAgICAgICB0eXBlID0gV0JfREFUQV9UWVBFKGJpb19wYWdlLCBmaW8tPmNvbXBy
ZXNzZWRfcGFnZSk7Cj4gPj4gKyAgICAgICBpbmNfcGFnZV9jb3VudChzYmksIHR5cGUpOwo+ID4+
Cj4gPj4gICAgICAgICAgaWYgKGlvLT5iaW8gJiYKPiA+PiAgICAgICAgICAgICAgKCFpb19pc19t
ZXJnZWFibGUoc2JpLCBpby0+YmlvLCBpbywgZmlvLCBpby0+bGFzdF9ibG9ja19pbl9iaW8sCj4g
Pj4gQEAgLTEwNTksNyArMTA1OSw4IEBAIHZvaWQgZjJmc19zdWJtaXRfcGFnZV93cml0ZShzdHJ1
Y3QgZjJmc19pb19pbmZvICpmaW8pCj4gPj4gICAgICAgICAgICAgICAgICBpZiAoRjJGU19JT19B
TElHTkVEKHNiaSkgJiYKPiA+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAoZmlv
LT50eXBlID09IERBVEEgfHwgZmlvLT50eXBlID09IE5PREUpICYmCj4gPj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgZmlvLT5uZXdfYmxrYWRkciAmIEYyRlNfSU9fU0laRV9NQVNL
KHNiaSkpIHsKPiA+PiAtICAgICAgICAgICAgICAgICAgICAgICBkZWNfcGFnZV9jb3VudChzYmks
IFdCX0RBVEFfVFlQRShiaW9fcGFnZSkpOwo+ID4+ICsgICAgICAgICAgICAgICAgICAgICAgIGRl
Y19wYWdlX2NvdW50KHNiaSwgV0JfREFUQV9UWVBFKGJpb19wYWdlLAo+ID4+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZpby0+Y29tcHJlc3NlZF9wYWdl
KSk7Cj4gPj4gICAgICAgICAgICAgICAgICAgICAgICAgIGZpby0+cmV0cnkgPSAxOwo+ID4+ICAg
ICAgICAgICAgICAgICAgICAgICAgICBnb3RvIHNraXA7Cj4gPj4gICAgICAgICAgICAgICAgICB9
Cj4gPj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZjJmcy5oIGIvZnMvZjJmcy9mMmZzLmgKPiA+PiBp
bmRleCA2NTI5NGUzYjBiZWYuLjUwZjNkNTQ2ZGVkOCAxMDA2NDQKPiA+PiAtLS0gYS9mcy9mMmZz
L2YyZnMuaAo+ID4+ICsrKyBiL2ZzL2YyZnMvZjJmcy5oCj4gPj4gQEAgLTEwODAsNyArMTA4MCw4
IEBAIHN0cnVjdCBmMmZzX3NtX2luZm8gewo+ID4+ICAgICogZjJmcyBtb25pdG9ycyB0aGUgbnVt
YmVyIG9mIHNldmVyYWwgYmxvY2sgdHlwZXMgc3VjaCBhcyBvbi13cml0ZWJhY2ssCj4gPj4gICAg
KiBkaXJ0eSBkZW50cnkgYmxvY2tzLCBkaXJ0eSBub2RlIGJsb2NrcywgYW5kIGRpcnR5IG1ldGEg
YmxvY2tzLgo+ID4+ICAgICovCj4gPj4gLSNkZWZpbmUgV0JfREFUQV9UWVBFKHApICAgICAgICAo
X19pc19jcF9ndWFyYW50ZWVkKHApID8gRjJGU19XQl9DUF9EQVRBIDogRjJGU19XQl9EQVRBKQo+
ID4+ICsjZGVmaW5lIFdCX0RBVEFfVFlQRShwLCBmKSAgICAgICAgICAgICAgICAgICAgIFwKPiA+
PiArICAgICAgIChmIHx8IGYyZnNfaXNfY3BfZ3VhcmFudGVlZChwKSA/IEYyRlNfV0JfQ1BfREFU
QSA6IEYyRlNfV0JfREFUQSkKPiA+PiAgIGVudW0gY291bnRfdHlwZSB7Cj4gPj4gICAgICAgICAg
RjJGU19ESVJUWV9ERU5UUywKPiA+PiAgICAgICAgICBGMkZTX0RJUlRZX0RBVEEsCj4gPj4gQEAg
LTM4MDQsNiArMzgwNSw3IEBAIHZvaWQgZjJmc19pbml0X2NrcHRfcmVxX2NvbnRyb2woc3RydWN0
IGYyZnNfc2JfaW5mbyAqc2JpKTsKPiA+PiAgICAqLwo+ID4+ICAgaW50IF9faW5pdCBmMmZzX2lu
aXRfYmlvc2V0KHZvaWQpOwo+ID4+ICAgdm9pZCBmMmZzX2Rlc3Ryb3lfYmlvc2V0KHZvaWQpOwo+
ID4+ICtib29sIGYyZnNfaXNfY3BfZ3VhcmFudGVlZChzdHJ1Y3QgcGFnZSAqcGFnZSk7Cj4gPj4g
ICBpbnQgZjJmc19pbml0X2Jpb19lbnRyeV9jYWNoZSh2b2lkKTsKPiA+PiAgIHZvaWQgZjJmc19k
ZXN0cm95X2Jpb19lbnRyeV9jYWNoZSh2b2lkKTsKPiA+PiAgIHZvaWQgZjJmc19zdWJtaXRfcmVh
ZF9iaW8oc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBzdHJ1Y3QgYmlvICpiaW8sCj4gPj4gLS0K
PiA+PiAyLjQwLjEKPiA+Pgo+ID4+Cj4gPj4KPiA+PiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+ID4+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0
Cj4gPj4gTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPiA+PiBodHRwczov
L2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJm
cy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5u
ZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJm
cy1kZXZlbAo=
