Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A06B83E129
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Jan 2024 19:17:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rTQlj-0005D1-Bh;
	Fri, 26 Jan 2024 18:17:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1rTQlg-0005Cj-5Y
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Jan 2024 18:17:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KDzPmeQkHrpI5XFKI2TgWRa68Bt+XbqFDvv7zmvmDME=; b=Z3FRjTu3AUaf0G09Ax7QahiACo
 CT9i3KX3ZrrFqQN1GMPAxYrazwBWvcce/zCiQgqa6b0TxjPEcSEb/ubQuaAJHDZ7AZMbz2N63Zodz
 WI9i1AU6rHrjkC07N3BExjT6aONqtgEOjtQTyB8oowK5j91TX0HzpGCoXt9W0h2feFjY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KDzPmeQkHrpI5XFKI2TgWRa68Bt+XbqFDvv7zmvmDME=; b=QnksPLbOL3RTO9vidU/khCshQB
 5hzH31B0QLlf5Is6VDJcpP3BidwVcBWQQkvjLwm6XGqjHm5gUIoOjC8N4nCLqCcgfZasmPSZwl2JP
 txM3NFgnvUgctJHSCt/lMENMsnMIUoNCGY4nbnL54TQqN5V37HzYseMkF6gt1PEAV6ds=;
Received: from mail-vk1-f175.google.com ([209.85.221.175])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rTQlc-00023I-Du for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Jan 2024 18:17:32 +0000
Received: by mail-vk1-f175.google.com with SMTP id
 71dfb90a1353d-4b739b49349so118745e0c.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 26 Jan 2024 10:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706293043; x=1706897843; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KDzPmeQkHrpI5XFKI2TgWRa68Bt+XbqFDvv7zmvmDME=;
 b=bNQfMEuLrlWdS6e5vpW3Bveu1zKO5zei7AlFM/ZZTxjSDfMqctfrdXWlHa5daZah1n
 hpVuy7Cmi6QzyGaEqO50mzrwQ6UuLADzHVXQ7y28+0yYMBnI/onVii20uORUXRty9IoZ
 tNs6KHXSG8AOl6rF1e/f5wFzKfJJp8IMIFgZJ3UtaymFBubb6sAqlXLuXwaCf1TCKy/1
 GEv4r4zOlr/ySYIWUI1TWUIkr4sgIwwYGRLst0t0ZHYl7sr70HsSwpldfXF86JSVI7bg
 52z2siuZWDGiJPNZtw2xTb0YN9DAiPWj/+t9FH7aDcILRaB2d/h2SSXDYRiYpB7zBZSV
 g+sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706293043; x=1706897843;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KDzPmeQkHrpI5XFKI2TgWRa68Bt+XbqFDvv7zmvmDME=;
 b=eZ+XGOVclFVWVS9IhNoM6qa0sgNs9o/OvJxZb99aQQ+WytLiPXzwLj1F/dqh/tBKRj
 38bj1UIXx9Z+NZ3yOCPkpN2LwUN8ebQU0/QwmsGoPT0FxsphWfNjAHSWHquc25JYW2y5
 QdjGTd4pMawzhatrizYr+BfmpU4OlGCdF6pfMru+vYkKxBLdNnMzgIvNWKBAoOoKychm
 wKzhls1IgX2Vditb80SuFbS1fe1TTrjJ9K8MmxO8MBQBtEB6jWy+m80droi3Tk9qCr1t
 IsHXEHMH+rVniVcwNczUUtCOIRczUP+kvlzufXkIKEaZkBaYTRC3c/9JMU2JMEL7X5gs
 Q1hQ==
X-Gm-Message-State: AOJu0YyIK76nnmQ+E1pX18oAU+VcKl6HfEhNEXpZSTuPT3gAogUvFVJC
 d2XJnrw/IXyRJ67hVGyLgzAv50zSOCZozsZCWR3XjnUOJlu3pmrE6kBEGnUlQXCtf49LVVjTFVq
 qczzYsUp2qpHJ8kenmIrN8JT5YsE=
X-Google-Smtp-Source: AGHT+IFY1bvX/lr35a97PlGA5IQKTrRHO4kPzqY+aCB5bHdtUoZm/oqZm9/8L8J5IvINAVxo4QmfJBW9pqWop3YX7hg=
X-Received: by 2002:a05:6122:905:b0:4b6:d44e:2897 with SMTP id
 j5-20020a056122090500b004b6d44e2897mr184702vka.33.1706293043136; Fri, 26 Jan
 2024 10:17:23 -0800 (PST)
MIME-Version: 1.0
References: <20240117230032.2312067-1-daeho43@gmail.com>
 <df9645d9-1e9a-4bd2-88bb-26425cf45811@kernel.org>
 <CACOAw_yjEuGSvo_qyoA13U0HwOr3gOzGtNf2Twhes01SNSGQeg@mail.gmail.com>
 <b18c286a-cc72-439c-b373-98e0d6504618@kernel.org>
In-Reply-To: <b18c286a-cc72-439c-b373-98e0d6504618@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Fri, 26 Jan 2024 10:17:12 -0800
Message-ID: <CACOAw_yqrtEhq4wtJbs7CVn260h7iZyC7koCWH1iMyeQo5140g@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Thu, Jan 25, 2024 at 5:27 PM Chao Yu wrote: > > On 2024/1/26
    0:25, Daeho Jeong wrote: > > On Wed, Jan 24, 2024 at 7:34 PM Chao Yu wrote:
    > >> > >> +Cc Yongpeng Yang > >> > >> Daeho, > >> > [...] 
 
 Content analysis details:   (0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.175 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.221.175 listed in list.dnswl.org]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rTQlc-00023I-Du
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: allocate logs after conventional
 area for HM zoned devices
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

T24gVGh1LCBKYW4gMjUsIDIwMjQgYXQgNToyN+KAr1BNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9y
Zz4gd3JvdGU6Cj4KPiBPbiAyMDI0LzEvMjYgMDoyNSwgRGFlaG8gSmVvbmcgd3JvdGU6Cj4gPiBP
biBXZWQsIEphbiAyNCwgMjAyNCBhdCA3OjM04oCvUE0gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3Jn
PiB3cm90ZToKPiA+Pgo+ID4+ICtDYyBZb25ncGVuZyBZYW5nCj4gPj4KPiA+PiBEYWVobywKPiA+
Pgo+ID4+IFlvbmdwZW5nIHJlcG9ydHMgYSBwb3RlbnRpYWwgaXNzdWU6IGlmIGMuZGV2aWNlc1sw
XS50b3RhbF9zZWdtZW50cyBpcwo+ID4+IGxhcmdlciB0aGFuIHNlZ21lbnRzIG9mIG1haW5hcmVh
LCBjLmN1cl9zZWdbQ1VSU0VHX0hPVF9OT0RFXSB3aWxsIGV4Y2VlZAo+ID4+IGVuZCBib3VuZGFy
eSBvZiBtYWluYXJlYS4gQ291bGQgeW91IHBsZWFzZSBjaGVjayB0aGF0PyB0aG91Z2ggaXQncyBh
IGNvcm5lcgo+ID4+IGNhc2UuCj4gPgo+ID4gQ2FuIHlvdSBlbGFib3JhdGUgbW9yZT8KPgo+IFNp
bmNlIGMuY3VyX3NlZ1tDVVJTRUdfSE9UX05PREVdIGlzIGFuIG9mZnNldCBzdGFydGVkIGZyb20g
bWFpbl9ibGthZGRyLgoKT2gsIEdvdCBpdC4KVGhlbiwgaG93IGFib3V0IHRoaXM/CgogICAgICAg
ICBjLmN1cl9zZWdbQ1VSU0VHX0hPVF9OT0RFXSA9IGMuem9uZWRfbW9kZWwgPT0gRjJGU19aT05F
RF9ITSA/CiAgICAgICAgICAgICAgICAgICAgICAgICAoYy5kZXZpY2VzWzFdLnN0YXJ0X2Jsa2Fk
ZHIgLQpnZXRfc2IobWFpbl9ibGthZGRyKSkgLyBjLmJsa3NfcGVyX3NlZyA6IDA7Cgo+IElmIGMu
Y3VyX3NlZ1tDVVJTRUdfSE9UX05PREVdIHdhcyBhc3NpZ25lZCB3LyBjLmRldmljZXNbMF0udG90
YWxfc2VnbWVudHMsCj4gYW5kIGMuZGV2aWNlc1swXS50b3RhbF9zZWdtZW50cyBpcyBsYXJnZXIg
dGhhbiBzZWdtZW50cyBvZiBtYWluYXJlLAo+IGMuY3VyX3NlZ1tDVVJTRUdfSE9UX05PREVdIHdp
bGwgZXhjZWVkIHRoZSBlbmQgYm91bmRhcnkgb2YgbWFpbmFyZWEuCj4KPiAgICAgICAgIGMuY3Vy
X3NlZ1tDVVJTRUdfSE9UX05PREVdID0gYy56b25lZF9tb2RlbCA9PSBGMkZTX1pPTkVEX0hNID8K
PiAgICAgICAgICAgICAgICAgICAgICAgICBjLmRldmljZXNbMF0udG90YWxfc2VnbWVudHMgOiAw
Owo+Cj4gPiBJbiB0aGUgY2FzZSBvZiBGMkZTX1pPTkVEX0hNLCB3ZSBoYXZlIHRoZSBkZXZpY2Vz
WzFdLgo+ID4gRG8geW91IG1lYW4gdGhlIGNhc2Ugd2UgZm9ybWF0IHRoZSBmaWxlc3lzdGVtIGlu
dGVudGlvbmFsbHkgc21hbGxlcgo+ID4gdGhhbiB3aGF0IGRldmljZXMgaGF2ZT8KPgo+IEkgbWVh
biBibGV3IGNhc2U6Cj4gZGV2aWNlWzBdOiBjb252ZW50aW9uYWwgZGV2aWNlIHNpemUgPSAxMDI0
MCBNQgo+IGRldmljZVsxXTogem9uZSBkZXZpY2Ugc2l6ZSA9IDIgTUIKPgo+IFRoYW5rcywKPgo+
ID4KPiA+Pgo+ID4+IE9uIDIwMjQvMS8xOCA3OjAwLCBEYWVobyBKZW9uZyB3cm90ZToKPiA+Pj4g
RnJvbTogRGFlaG8gSmVvbmcgPGRhZWhvamVvbmdAZ29vZ2xlLmNvbT4KPiA+Pj4KPiA+Pj4gTWFr
ZSB0byBhbGxvY2F0ZSBsb2dzIGFmdGVyIGNvbnZlbnRpb25hbCBhcmVhIGZvciBITSB6b25lZCBk
ZXZpY2VzIHRvCj4gPj4+IHNwYXJlIHRoZW0gZm9yIGZpbGUgcGlubmluZyBzdXBwb3J0Lgo+ID4+
Pgo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBEYWVobyBKZW9uZyA8ZGFlaG9qZW9uZ0Bnb29nbGUuY29t
Pgo+ID4+PiAtLS0KPiA+Pj4gICAgbWtmcy9mMmZzX2Zvcm1hdC5jIHwgMyArKy0KPiA+Pj4gICAg
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4+Pgo+ID4+
PiBkaWZmIC0tZ2l0IGEvbWtmcy9mMmZzX2Zvcm1hdC5jIGIvbWtmcy9mMmZzX2Zvcm1hdC5jCj4g
Pj4+IGluZGV4IGYyODQwYzguLjkxYTdmNGIgMTAwNjQ0Cj4gPj4+IC0tLSBhL21rZnMvZjJmc19m
b3JtYXQuYwo+ID4+PiArKysgYi9ta2ZzL2YyZnNfZm9ybWF0LmMKPiA+Pj4gQEAgLTU1Nyw3ICs1
NTcsOCBAQCBzdGF0aWMgaW50IGYyZnNfcHJlcGFyZV9zdXBlcl9ibG9jayh2b2lkKQo+ID4+PiAg
ICAgICAgICAgICAgICBjLmN1cl9zZWdbQ1VSU0VHX0NPTERfREFUQV0gPSAwOwo+ID4+PiAgICAg
ICAgICAgICAgICBjLmN1cl9zZWdbQ1VSU0VHX1dBUk1fREFUQV0gPSBuZXh0X3pvbmUoQ1VSU0VH
X0NPTERfREFUQSk7Cj4gPj4+ICAgICAgICB9IGVsc2UgaWYgKGMuem9uZWRfbW9kZSkgewo+ID4+
PiAtICAgICAgICAgICAgIGMuY3VyX3NlZ1tDVVJTRUdfSE9UX05PREVdID0gMDsKPiA+Pj4gKyAg
ICAgICAgICAgICBjLmN1cl9zZWdbQ1VSU0VHX0hPVF9OT0RFXSA9IGMuem9uZWRfbW9kZWwgPT0g
RjJGU19aT05FRF9ITSA/Cj4gPj4+ICsgICAgICAgICAgICAgICAgICAgICBjLmRldmljZXNbMF0u
dG90YWxfc2VnbWVudHMgOiAwOwo+ID4+PiAgICAgICAgICAgICAgICBjLmN1cl9zZWdbQ1VSU0VH
X1dBUk1fTk9ERV0gPSBuZXh0X3pvbmUoQ1VSU0VHX0hPVF9OT0RFKTsKPiA+Pj4gICAgICAgICAg
ICAgICAgYy5jdXJfc2VnW0NVUlNFR19DT0xEX05PREVdID0gbmV4dF96b25lKENVUlNFR19XQVJN
X05PREUpOwo+ID4+PiAgICAgICAgICAgICAgICBjLmN1cl9zZWdbQ1VSU0VHX0hPVF9EQVRBXSA9
IG5leHRfem9uZShDVVJTRUdfQ09MRF9OT0RFKTsKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51
eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZv
cmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
