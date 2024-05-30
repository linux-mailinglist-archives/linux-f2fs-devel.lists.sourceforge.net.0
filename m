Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 184358D48E8
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 30 May 2024 11:50:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sCcQ3-0000Th-FD;
	Thu, 30 May 2024 09:49:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1sCcQ1-0000TY-PP
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 30 May 2024 09:49:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ou7/re3lRwcgcNyKTGkXvwqkQT9+iebWGeN2EOTv3AM=; b=QWwsFe4t0m7rShbbIKTmvMVFTd
 QHOdwf0+tT7dLe3SyfyKEqdnLgDd0hsKwMDcJCPzyoV/476j7WME7uzB/lNCuYyRoTE6geyPWAGsr
 VH2Cbr37PdPVcTcZ/w62f0OFF+O/J7QNnfWNZ7ffj6qqzItvwAxQoxkX3g2/IQn00pyI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ou7/re3lRwcgcNyKTGkXvwqkQT9+iebWGeN2EOTv3AM=; b=BuPxNoLl1GkLNHa2pW1ng9vmb2
 qwSsaPWHTYC8oMPowzGgsTyVJnX/CZAH/30ChEMff0GIxwrcVkgqHAs2QVHPUaljCLezspHBRgY2d
 OypeN4DdO+/KvR94jZMLHyH0A2amv22h+L3jBazTNHftZfTcCiTjj+DO5xZ9CvJuaZkQ=;
Received: from mail-wr1-f48.google.com ([209.85.221.48])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sCcPy-0001St-Gi for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 30 May 2024 09:49:58 +0000
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-354be94c874so487101f8f.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 30 May 2024 02:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717062582; x=1717667382; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ou7/re3lRwcgcNyKTGkXvwqkQT9+iebWGeN2EOTv3AM=;
 b=dnbBaofZ/qS+qDchRb8Umc7U2XRetM3s3DsYcKTr8EZ4gW+tccLTRMralRp5//+LdR
 aVX2Kt8dgF3FPP5rwFZ2yuTxLnNm+E7ZehoxXnZuOdz9sq2ZePOdCgAISPLSC/rVbRn4
 DAjIdmtkzDvqmtrvG+h6C/q9MG0L7mSW8sCzIunqIYA9o2tRQEhqtfHjSaB/FuBrpHfe
 KnOEdXhlLSOtvAX5TKRImFn8RQwwC4F+W5DsM7t0lgLkuDpPR1WK6EEuCO0dpVg4/lkb
 2+2ON4bqMoo3JJGATmXSIKy0CEkL6lTAEpSCOzNmHI2KpkVJUybk4e3Pn38vk6HYuL2U
 AnOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717062582; x=1717667382;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ou7/re3lRwcgcNyKTGkXvwqkQT9+iebWGeN2EOTv3AM=;
 b=GXyWKS/CUTzYgvJqGpBCWTtAVfK7EBSgefhcv98e4d55Qg3TdpuukanN7Jz/tR9z/3
 mmH+Fex02F/qYdWUPrzJvxJKx1xIRBO2UqQ4NYrsgFG9g/kp3TAl1LtlHa+cw3NoEipm
 fVOodb+3Dzvbj3Luk7wjkkGlAHtqqPAfuAN2ndgeTcqt+cF/DUgWupT8Il1hr5Zrgc54
 2wbsFfaLhvrwuc9SxvX9pe5gh1j9s0xxabqAvOAqPh4oGVZglLTgFxkDRTJ/eP4BVfBo
 c8maxRzDZu6ph5UEFjiXdrxUL0mA7/Js13bWBp8vXKbtop+gPXpMNbx2VvmipFf9mmxt
 kuYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4YzsuoSvA0lvpI9LGMPW6HCSMWZ4I2GGOErCn+PLrYAcRxtOfkyXciW2ZMVEIGNFp/nWXv2OB4hU7MZznFBCc3arq0AAst7ey8222Zv5Py9beIVziag==
X-Gm-Message-State: AOJu0YzapeN6oBEa0vIbFBdZ+bNmWUjqk9ijqhPIJvpGar1KBX4lBvUj
 UJHbQH3rGch9kimR7jnXxqvre5ULAmP5LEe9uv/y1I1bWYgdY7ZRBF1iHAbKTUt4dJauXwkhpf5
 3VzA333PWgh3u+6eve9xgPSFwPVg=
X-Google-Smtp-Source: AGHT+IEjQDQ6uEg4JbtAD/ivMW1amNAemiInuIQiVjoRJK+OE1744Qu9ueJxqowtj9ltrNYo8iCENN3zD8l/lz9+hsY=
X-Received: by 2002:a05:6000:1188:b0:354:fa5b:62ab with SMTP id
 ffacd0b85a97d-35dc00924e7mr1913281f8f.18.1717062581967; Thu, 30 May 2024
 02:49:41 -0700 (PDT)
MIME-Version: 1.0
References: <1716204978-29455-1-git-send-email-zhiguo.niu@unisoc.com>
 <1d67715b-5f88-4940-969d-e098fd80ae2a@kernel.org>
 <CAHJ8P3LXYWQ+bLZHPn_5FLu3oi83ei8C9ZCzAXwa9oBdEKVDNA@mail.gmail.com>
In-Reply-To: <CAHJ8P3LXYWQ+bLZHPn_5FLu3oi83ei8C9ZCzAXwa9oBdEKVDNA@mail.gmail.com>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Thu, 30 May 2024 17:49:30 +0800
Message-ID: <CAHJ8P3+ro9YsU7jZWeAfiUh9uNFEj_=Wiaf2YRLVLBD5_9fM0g@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Mon, May 27, 2024 at 12:07 PM Zhiguo Niu wrote: > > On
    Mon, May 27, 2024 at 11:49 AM Chao Yu wrote: > > > > On 2024/5/20 19:36,
    Zhiguo Niu wrote: > > > Now atgc can be enabled based on the [...] 
 
 Content analysis details:   (0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [niuzhiguo84[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.221.48 listed in bl.score.senderscore.com]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [niuzhiguo84[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.48 listed in wl.mailspike.net]
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sCcPy-0001St-Gi
Subject: Re: [f2fs-dev] [PATCH] f2fs: enable atgc if atgc_age_threshold from
 user is less than elapsed_time
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
Cc: jaegeuk@kernel.org, ke.wang@unisoc.com, Zhiguo Niu <zhiguo.niu@unisoc.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gTW9uLCBNYXkgMjcsIDIwMjQgYXQgMTI6MDfigK9QTSBaaGlndW8gTml1IDxuaXV6aGlndW84
NEBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBNYXkgMjcsIDIwMjQgYXQgMTE6NDnigK9B
TSBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIDIwMjQvNS8yMCAx
OTozNiwgWmhpZ3VvIE5pdSB3cm90ZToKPiA+ID4gTm93IGF0Z2MgY2FuIGJlIGVuYWJsZWQgYmFz
ZWQgb24gdGhlIGZvbGxvd2luZyBjb25kaXRpb25zOgo+ID4gPiAtQVRHQyBtb3VudCBvcHRpb24g
aXMgc2V0Cj4gPiA+IC1lbGFwc2VkX3RpbWUgaXMgbW9yZSB0aGFuIGF0Z2NfYWdlX3RocmVzaG9s
ZCBhbHJlYWR5Cj4gPiA+IGJ1dCB0aGVzZSBjb25kaXRpb25zIGFyZSBjaGVjayB3aGVuIHVtb3Vu
dGVkLT5tb3VudGVkIGRldmljZSBhZ2Fpbi4KPiA+ID4gSWYgdGhlIGRldmljZSBoYXMgbm90IGJl
IHVtb3VudGVkLT5tb3VudGVkIGZvciBhIGxvbmcgdGltZSwgYXRnYyBjYW4KPiA+ID4gbm90IHdv
cmsgZXZlbiB0aGUgYWJvdmUgY29uZGl0aW9ucyBtZXQuCj4gPgo+ID4gWmhpZ3VvLCBJIGRpZG4n
dCBnZXQgaXQsIGNhbiB5b3UgcGxlYXNlIGV4cGxhaW4gbW9yZSBhYm91dCB0aGlzIGlzc3VlPwo+
ID4KPiA+IFRoYW5rcywKPiBIaSBDaGFvLAo+Cj4gQXQgcHJlc2VudCwgdGhlIHBvaW50IG9mIGF0
Z2MgZW5hbGUgaXMgY2hlY2tlZCBkdXJpbmcgdGhlIG1vdW50Cj4gcHJvY2Vzcy4gV2hhdCBJIG1l
YW4gaXMgdGhhdCBpZiBhIGRldmljZSBoYXMgbm90IGJlZW4gcmVib290ZWQKPiAocmUtbW91bnRl
ZCkgZm9yIGEgbG9uZyB0aW1lLCBldmVuIGlmIHRoZSBhYm92ZSB0d28gY29uZGl0aW9ucyBhcmUK
PiBtZXQoQVRHQyBtb3VudCBvcHRpb24gaXMgc2V0LCBhbmQgdGhlIGRldmljZSBoYXMgYmVlbiBw
b3dlcmVkIG9uIGxvbmcKPiBlbm91Z2jvvIwgbW9yZSB0aGFuIGF0Z2MgZGVmYXVsdCB0aHJlc2hv
bGQgKSwgYXRnYyBjYW5ub3QgYmUgZHluYW1pY2FsbHkKPiBlbmFibGVkLgo+Cj4gSWYgdGhlIHVz
ZXIgaXMgdXNlZCB0byBub3QgcmVzdGFydGluZyB0aGUgcGhvbmUgYWZ0ZXIgdHVybmluZyBpdCBv
biwKPiBpdCB3aWxsIGJlIGRpZmZpY3VsdCB0byB1c2UgYXRnYy4KPiB0aGFua3MhCkhpIENoYW8s
CkRvIHlvdSBoYXZlIGFueSBzdWdnZXN0aW9ucyBvciBjb21tZW50cyBvbiB0aGlzPwp0aGFua3Pv
vIEKCj4gPgo+ID4gPgo+ID4gPiBJdCBpcyBiZXR0ZXIgdG8gZW5hYmxlIGF0Z2MgZHluYW1pY2xs
eSB3aGVuIHVzZXIgY2hhbmdlIGF0Z2NfYWdlX3RocmVzaG9sZAo+ID4gPiBtZWFud2hpbGUgdGhp
cyB2YWxlIGlzIGxlc3MgdGhhbiBlbGFwc2VkX3RpbWUgYW5kIEFUR0MgbW91bnQgb3B0aW9uIGlz
IG9uLgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBaaGlndW8gTml1IDx6aGlndW8ubml1QHVu
aXNvYy5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgIGZzL2YyZnMvZjJmcy5oICAgIHwgIDEgKwo+ID4g
PiAgIGZzL2YyZnMvc2VnbWVudC5jIHwgIDkgKysrKy0tLS0tCj4gPiA+ICAgZnMvZjJmcy9zeXNm
cy5jICAgfCAxNiArKysrKysrKysrKysrKysrCj4gPiA+ICAgMyBmaWxlcyBjaGFuZ2VkLCAyMSBp
bnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvZnMv
ZjJmcy9mMmZzLmggYi9mcy9mMmZzL2YyZnMuaAo+ID4gPiBpbmRleCAxOTc0YjZhLi5lNDQxZDJk
IDEwMDY0NAo+ID4gPiAtLS0gYS9mcy9mMmZzL2YyZnMuaAo+ID4gPiArKysgYi9mcy9mMmZzL2Yy
ZnMuaAo+ID4gPiBAQCAtMzY5NCw2ICszNjk0LDcgQEAgdm9pZCBmMmZzX2NsZWFyX3ByZWZyZWVf
c2VnbWVudHMoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLAo+ID4gPiAgIGludCBmMmZzX2luaXRf
aW5tZW1fY3Vyc2VnKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSk7Cj4gPiA+ICAgdm9pZCBmMmZz
X3NhdmVfaW5tZW1fY3Vyc2VnKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSk7Cj4gPiA+ICAgdm9p
ZCBmMmZzX3Jlc3RvcmVfaW5tZW1fY3Vyc2VnKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSk7Cj4g
PiA+ICtpbnQgZjJmc19pbml0X2F0Z2NfY3Vyc2VnKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSk7
Cj4gPiA+ICAgaW50IGYyZnNfYWxsb2NhdGVfc2VnbWVudF9mb3JfcmVzaXplKHN0cnVjdCBmMmZz
X3NiX2luZm8gKnNiaSwgaW50IHR5cGUsCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgdW5zaWduZWQgaW50IHN0YXJ0LCB1bnNpZ25lZCBpbnQgZW5kKTsKPiA+ID4g
ICBpbnQgZjJmc19hbGxvY2F0ZV9uZXdfc2VjdGlvbihzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmks
IGludCB0eXBlLCBib29sIGZvcmNlKTsKPiA+ID4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvc2VnbWVu
dC5jIGIvZnMvZjJmcy9zZWdtZW50LmMKPiA+ID4gaW5kZXggNzFkYzgwNDIuLjQ0OTIzZDQgMTAw
NjQ0Cj4gPiA+IC0tLSBhL2ZzL2YyZnMvc2VnbWVudC5jCj4gPiA+ICsrKyBiL2ZzL2YyZnMvc2Vn
bWVudC5jCj4gPiA+IEBAIC0yOTMxLDE0ICsyOTMxLDExIEBAIHN0YXRpYyBpbnQgZ2V0X2F0c3Ny
X3NlZ21lbnQoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBpbnQgdHlwZSwKPiA+ID4gICAgICAg
cmV0dXJuIHJldDsKPiA+ID4gICB9Cj4gPiA+Cj4gPiA+IC1zdGF0aWMgaW50IF9fZjJmc19pbml0
X2F0Z2NfY3Vyc2VnKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSkKPiA+ID4gK2ludCBmMmZzX2lu
aXRfYXRnY19jdXJzZWcoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKQo+ID4gPiAgIHsKPiA+ID4g
ICAgICAgc3RydWN0IGN1cnNlZ19pbmZvICpjdXJzZWcgPSBDVVJTRUdfSShzYmksIENVUlNFR19B
TExfREFUQV9BVEdDKTsKPiA+ID4gICAgICAgaW50IHJldCA9IDA7Cj4gPiA+Cj4gPiA+IC0gICAg
IGlmICghc2JpLT5hbS5hdGdjX2VuYWJsZWQpCj4gPiA+IC0gICAgICAgICAgICAgcmV0dXJuIDA7
Cj4gPiA+IC0KPiA+ID4gICAgICAgZjJmc19kb3duX3JlYWQoJlNNX0koc2JpKS0+Y3Vyc2VnX2xv
Y2spOwo+ID4gPgo+ID4gPiAgICAgICBtdXRleF9sb2NrKCZjdXJzZWctPmN1cnNlZ19tdXRleCk7
Cj4gPiA+IEBAIC0yOTU1LDcgKzI5NTIsOSBAQCBzdGF0aWMgaW50IF9fZjJmc19pbml0X2F0Z2Nf
Y3Vyc2VnKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSkKPiA+ID4gICB9Cj4gPiA+ICAgaW50IGYy
ZnNfaW5pdF9pbm1lbV9jdXJzZWcoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKQo+ID4gPiAgIHsK
PiA+ID4gLSAgICAgcmV0dXJuIF9fZjJmc19pbml0X2F0Z2NfY3Vyc2VnKHNiaSk7Cj4gPiA+ICsg
ICAgIGlmICghc2JpLT5hbS5hdGdjX2VuYWJsZWQpCj4gPiA+ICsgICAgICAgICAgICAgcmV0dXJu
IDA7Cj4gPiA+ICsgICAgIHJldHVybiBmMmZzX2luaXRfYXRnY19jdXJzZWcoc2JpKTsKPiA+ID4g
ICB9Cj4gPiA+Cj4gPiA+ICAgc3RhdGljIHZvaWQgX19mMmZzX3NhdmVfaW5tZW1fY3Vyc2VnKHN0
cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgaW50IHR5cGUpCj4gPiA+IGRpZmYgLS1naXQgYS9mcy9m
MmZzL3N5c2ZzLmMgYi9mcy9mMmZzL3N5c2ZzLmMKPiA+ID4gaW5kZXggMDlkM2VjZi4uNzI2NzZj
NSAxMDA2NDQKPiA+ID4gLS0tIGEvZnMvZjJmcy9zeXNmcy5jCj4gPiA+ICsrKyBiL2ZzL2YyZnMv
c3lzZnMuYwo+ID4gPiBAQCAtNjczLDYgKzY3MywyMiBAQCBzdGF0aWMgc3NpemVfdCBfX3NiaV9z
dG9yZShzdHJ1Y3QgZjJmc19hdHRyICphLAo+ID4gPiAgICAgICAgICAgICAgIHJldHVybiBjb3Vu
dDsKPiA+ID4gICAgICAgfQo+ID4gPgo+ID4gPiArICAgICBpZiAoIXN0cmNtcChhLT5hdHRyLm5h
bWUsICJhdGdjX2FnZV90aHJlc2hvbGQiKSkgewo+ID4gPiArICAgICAgICAgICAgIGlmICh0IDwg
MCkKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ID4gPiArICAg
ICAgICAgICAgIHNiaS0+YW0uYWdlX3RocmVzaG9sZCA9IHQ7Cj4gPiA+ICsgICAgICAgICAgICAg
aWYgKHNiaS0+YW0uYXRnY19lbmFibGVkKQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgcmV0
dXJuIGNvdW50Owo+ID4gPiArCj4gPiA+ICsgICAgICAgICAgICAgaWYgKHRlc3Rfb3B0KHNiaSwg
QVRHQykgJiYKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgIGxlNjRfdG9fY3B1KHNiaS0+Y2tw
dC0+ZWxhcHNlZF90aW1lKSA+PSB0KSB7Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICBpZiAo
ZjJmc19pbml0X2F0Z2NfY3Vyc2VnKHNiaSkpCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHJldHVybiAtRUlOVkFMOwo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgc2JpLT5h
bS5hdGdjX2VuYWJsZWQgPSB0cnVlOwo+ID4gPiArICAgICAgICAgICAgIH0KPiA+ID4gKyAgICAg
ICAgICAgICByZXR1cm4gY291bnQ7Cj4gPiA+ICsgICAgIH0KPiA+ID4gKwo+ID4gPiAgICAgICBp
ZiAoIXN0cmNtcChhLT5hdHRyLm5hbWUsICJnY19zZWdtZW50X21vZGUiKSkgewo+ID4gPiAgICAg
ICAgICAgICAgIGlmICh0IDwgTUFYX0dDX01PREUpCj4gPiA+ICAgICAgICAgICAgICAgICAgICAg
ICBzYmktPmdjX3NlZ21lbnRfbW9kZSA9IHQ7CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgt
ZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
