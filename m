Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA2489CB42
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  8 Apr 2024 19:55:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rttDP-00013O-IK;
	Mon, 08 Apr 2024 17:55:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1rttDN-00013F-Uk
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 08 Apr 2024 17:55:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=v45pq8/uwjlj99h7LlBgjJsO6OHXTwrlJDf4H+3gFA4=; b=AcwfJCZvaygREtfjgWLC0Py0y6
 fzsu4JrefV8GiMW3PUlotWR9fSt500naIL0rvOJofUeGTFhnnEUChhsYKdtpTC33Deu7xRm8ZX4PI
 MGb4NFJiLhJ+8LyvG0NVp8RMkklLIGK2wog4ReSKfJ2YtPUtIG55s6hSraOEK80nbtMs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=v45pq8/uwjlj99h7LlBgjJsO6OHXTwrlJDf4H+3gFA4=; b=KbnWE5sY+pn3mxCtip9YOeJRQV
 GWpxyXbEVczJaiiy4XzHxJFtvDC5KdM7nmFxB4QUV32nwD89V+X0VsZUwZy9jdbZ3URywkjHksEJW
 oOiHR/oJvjONJof3R6CvZbsnCKXB2ZKFQkUvexUmei2ZN+t4pYMPK0qP4iLfJAVBdyZ4=;
Received: from mail-vk1-f173.google.com ([209.85.221.173])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rttDK-0002K2-99 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 08 Apr 2024 17:55:30 +0000
Received: by mail-vk1-f173.google.com with SMTP id
 71dfb90a1353d-4dac3cbc8fdso999469e0c.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 08 Apr 2024 10:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712598915; x=1713203715; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v45pq8/uwjlj99h7LlBgjJsO6OHXTwrlJDf4H+3gFA4=;
 b=iR8y5hNGqclzJnVLeqv9s4182qAIvdEHMXuvvmbycyev9MsCvH72zgj07UXadjOnmX
 Sj+kJ13+CDoFJZS+PGaSdpajEer/aK/JIEWexf2Haei4c7LYipm3SgGaD9mFmo6tO/O9
 Ffep3tDSScCvwi1GMZ3M6wQsM2VB8xBmYH/6PU8edtBfE26BnyP+114tsKD+3nbyZPKt
 yfYcbsocg0wycxlOCNBjsHWWW3iESFz+YrnzECgL2QrSZ6RrHTaiWXl68NsN6w6l5eH2
 nIrCBlLxtoYB1Gk4vIbCFzuLNhoHPm1vgb9I/aXDUiu6Pbku+HVKvMwiAuauis0nyw4/
 gZjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712598915; x=1713203715;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v45pq8/uwjlj99h7LlBgjJsO6OHXTwrlJDf4H+3gFA4=;
 b=I3GoqUMCf7dmtWy5oMiwEiqaMIJNzHUtqgSDxfSsI6hnh2qykkSs0UcBeudl0Zdnc3
 h/2CwPrfC+g0i6t4VQko0SoAsLEeSrrSdMfGr5TmI2sqkzOwuIJ1mmp/BT3voeAnJiKi
 dQBTa2q0kjBfEg+jDaxcAA9epXvhc+8thkzztcLMb3Qz9snm9uVaIyLYAYUvWWYDYcxc
 PFyYWwOoyG7GAAZUJY5BvLJti2AUU+bHzFYYXF6UetVYdkSPtZjRQ/SAHGe3mLN3cM3O
 Swtgi1ejRIzA1GnDsRHv5ys0wRSCR0c56qKW7mtwBmAuraZj5A9cnE724pfHu8MCraoA
 l3eg==
X-Gm-Message-State: AOJu0YxokLPWAtRuSBNHhPM/0Iv2/YJhD2KO2d6WEN7Qi1vxqLYKjBuj
 5qxd09/my4CaZoQOxUr9C+KdMWkQxNNhwJryhe/Fb5m8Ri5iWieMoRvSXc9TtOgcVjM2h6KbsqE
 EkB3gTcI75J6pTM0LuilaAth6EgL7azq4Rh0=
X-Google-Smtp-Source: AGHT+IH5YMzbThNfSq/v2id9cN5YPwhKVwtV5zgBtlurqisdbpTTViL7p/N8MD67H72+2G8+rCT+VFWXaKQZ0cp4wBs=
X-Received: by 2002:a1f:de01:0:b0:4d3:362f:f9c1 with SMTP id
 v1-20020a1fde01000000b004d3362ff9c1mr6130501vkg.13.1712598915548; Mon, 08 Apr
 2024 10:55:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240402235447.132195-1-jaegeuk@kernel.org>
In-Reply-To: <20240402235447.132195-1-jaegeuk@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Mon, 8 Apr 2024 10:55:04 -0700
Message-ID: <CACOAw_yAqCtjhTVWF3crSXaENFeA-tt+uTncN8wFN9_VZ=ZX5w@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Tue, Apr 2, 2024 at 4:56 PM Jaegeuk Kim wrote: > > This
    addresses high GC cost at runtime. > > Signed-off-by: Jaegeuk Kim > --- >
    include/f2fs_fs.h | 8 +++++++- > mkfs/f2fs_format.c | 5 +++-- [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.221.173 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.173 listed in wl.mailspike.net]
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
X-Headers-End: 1rttDK-0002K2-99
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: give 6 sections for
 overprovision buffer
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVHVlLCBBcHIgMiwgMjAyNCBhdCA0OjU24oCvUE0gSmFlZ2V1ayBLaW0gPGphZWdldWtAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBUaGlzIGFkZHJlc3NlcyBoaWdoIEdDIGNvc3QgYXQgcnVudGlt
ZS4KPgo+IFNpZ25lZC1vZmYtYnk6IEphZWdldWsgS2ltIDxqYWVnZXVrQGtlcm5lbC5vcmc+Cj4g
LS0tCj4gIGluY2x1ZGUvZjJmc19mcy5oICB8IDggKysrKysrKy0KPiAgbWtmcy9mMmZzX2Zvcm1h
dC5jIHwgNSArKystLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDMgZGVs
ZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9mMmZzX2ZzLmggYi9pbmNsdWRlL2Yy
ZnNfZnMuaAo+IGluZGV4IGZjNTYzOTZmYTM1OC4uODcwYTZlNDgyM2QyIDEwMDY0NAo+IC0tLSBh
L2luY2x1ZGUvZjJmc19mcy5oCj4gKysrIGIvaW5jbHVkZS9mMmZzX2ZzLmgKPiBAQCAtMTc3NSw2
ICsxNzc1LDEyIEBAIHN0YXRpYyBpbmxpbmUgdWludDMyX3QgZ2V0X3Jlc2VydmVkKHN0cnVjdCBm
MmZzX3N1cGVyX2Jsb2NrICpzYiwgZG91YmxlIG92cCkKPiAgICAgICAgIHJldHVybiByb3VuZF91
cChyZXNlcnZlZCwgc2Vnc19wZXJfc2VjKSAqIHNlZ3NfcGVyX3NlYzsKPiAgfQo+Cj4gK3N0YXRp
YyBpbmxpbmUgdWludDMyX3Qgb3ZlcnByb3Zpc2lvbl9zZWdtZW50X2J1ZmZlcihzdHJ1Y3QgZjJm
c19zdXBlcl9ibG9jayAqc2IpCj4gK3sKPiArICAgICAgIC8qIEdpdmUgNiBjdXJyZW50IHNlY3Rp
b25zIHRvIGF2b2lkIGh1Z2UgR0Mgb3ZlcmhlYWRzLiAqLwo+ICsgICAgICAgcmV0dXJuIDYgKiBn
ZXRfc2Ioc2Vnc19wZXJfc2VjKTsKPiArfQo+ICsKPiAgc3RhdGljIGlubGluZSBkb3VibGUgZ2V0
X2Jlc3Rfb3ZlcnByb3Zpc2lvbihzdHJ1Y3QgZjJmc19zdXBlcl9ibG9jayAqc2IpCj4gIHsKPiAg
ICAgICAgIGRvdWJsZSBvdnAsIGNhbmRpZGF0ZSwgZW5kLCBkaWZmLCBzcGFjZTsKPiBAQCAtMTc5
OCw3ICsxODA0LDcgQEAgc3RhdGljIGlubGluZSBkb3VibGUgZ2V0X2Jlc3Rfb3ZlcnByb3Zpc2lv
bihzdHJ1Y3QgZjJmc19zdXBlcl9ibG9jayAqc2IpCj4gICAgICAgICAgICAgICAgIGlmIChvdnAg
PCAwKQo+ICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+ICAgICAgICAgICAgICAg
ICBzcGFjZSA9IHVzYWJsZV9tYWluX3NlZ3MgLSBtYXgoKGRvdWJsZSlyZXNlcnZlZCwgb3ZwKSAt
Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDIgKiBnZXRfc2Ioc2Vn
c19wZXJfc2VjKTsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgb3Zl
cnByb3Zpc2lvbl9zZWdtZW50X2J1ZmZlcihzYik7Cj4gICAgICAgICAgICAgICAgIGlmIChtYXhf
c3BhY2UgPCBzcGFjZSkgewo+ICAgICAgICAgICAgICAgICAgICAgICAgIG1heF9zcGFjZSA9IHNw
YWNlOwo+ICAgICAgICAgICAgICAgICAgICAgICAgIG1heF9vdnAgPSBjYW5kaWRhdGU7Cj4gZGlm
ZiAtLWdpdCBhL21rZnMvZjJmc19mb3JtYXQuYyBiL21rZnMvZjJmc19mb3JtYXQuYwo+IGluZGV4
IDhmNjMyZjhkNzRiNC4uZTI2YTUxM2VkODBjIDEwMDY0NAo+IC0tLSBhL21rZnMvZjJmc19mb3Jt
YXQuYwo+ICsrKyBiL21rZnMvZjJmc19mb3JtYXQuYwo+IEBAIC03NzgsNyArNzc4LDggQEAgc3Rh
dGljIGludCBmMmZzX3dyaXRlX2NoZWNrX3BvaW50X3BhY2sodm9pZCkKPiAgICAgICAgICAgICAg
ICAgICogSW4gbm9uIGNvbmZpZ3VyYWJsZSByZXNlcnZlZCBzZWN0aW9uIGNhc2UsIG92ZXJwcm92
aXNpb24KPiAgICAgICAgICAgICAgICAgICogc2VnbWVudHMgYXJlIGFsd2F5cyBiaWdnZXIgdGhh
biB0d28gc2VjdGlvbnMuCj4gICAgICAgICAgICAgICAgICAqLwo+IC0gICAgICAgICAgICAgICBp
ZiAoZ2V0X2NwKG92ZXJwcm92X3NlZ21lbnRfY291bnQpIDwgMiAqIGdldF9zYihzZWdzX3Blcl9z
ZWMpKSB7Cj4gKyAgICAgICAgICAgICAgIGlmIChnZXRfY3Aob3ZlcnByb3Zfc2VnbWVudF9jb3Vu
dCkgPAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBvdmVycHJvdmlz
aW9uX3NlZ21lbnRfYnVmZmVyKHNiKSkgewo+ICAgICAgICAgICAgICAgICAgICAgICAgIE1TRygw
LCAiXHRFcnJvcjogTm90IGVub3VnaCBvdmVycHJvdmlzaW9uIHNlZ21lbnRzICgldSlcbiIsCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdldF9jcChvdmVycHJvdl9zZWdtZW50X2NvdW50
KSk7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgZ290byBmcmVlX2NwX3BheWxvYWQ7Cj4gQEAg
LTc4Nyw3ICs3ODgsNyBAQCBzdGF0aWMgaW50IGYyZnNfd3JpdGVfY2hlY2tfcG9pbnRfcGFjayh2
b2lkKQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ2V0X2NwKHJzdmRfc2VnbWVu
dF9jb3VudCkpOwo+ICAgICAgICAgIH0gZWxzZSB7Cj4gICAgICAgICAgICAgICAgIHNldF9jcChv
dmVycHJvdl9zZWdtZW50X2NvdW50LCBnZXRfY3Aob3ZlcnByb3Zfc2VnbWVudF9jb3VudCkgKwo+
IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMiAqIGdldF9zYihzZWdzX3Blcl9zZWMp
KTsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG92ZXJwcm92aXNpb25fc2VnbWVu
dF9idWZmZXIoc2IpKTsKPiAgICAgICAgICB9Cj4KPiAgICAgICAgIGlmIChmMmZzX2dldF91c2Fi
bGVfc2VnbWVudHMoc2IpIDw9IGdldF9jcChvdmVycHJvdl9zZWdtZW50X2NvdW50KSkgewo+IC0t
Cj4gMi40NC4wLjQ3OC5nZDkyNjM5OWVmOS1nb29nCj4KPgo+CgpSZXZpZXdlZC1ieTogRGFlaG8g
SmVvbmcgPGRhZWhvamVvbmdAZ29vZ2xlLmNvbT4KCgo+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QK
PiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+IGh0dHBzOi8vbGlzdHMu
c291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVs
IG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRw
czovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVs
Cg==
