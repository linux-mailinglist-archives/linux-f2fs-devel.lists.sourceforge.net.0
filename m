Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A68B8CDDBF
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 24 May 2024 01:34:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sAHx9-0006tB-It;
	Thu, 23 May 2024 23:34:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1sAHx8-0006t5-ED
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 May 2024 23:34:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tTm2YDNjNBizV+DFxPPNZcW9EOalW/DEyAAa0MdqFUo=; b=GttxkgH+E5H97yTeMYdZ3rC6Kf
 EktyhAYtT94elOyTq2jsF9OGBIIuCM0EPnZLn3FyCa8/oEDIXfeJxTZixA+W1a9hRZPXQDYsBm7G4
 UD0yPsgGS/djNXXYyMYSrvq34Sy9bjo8XxE3JKvcOb4iAERGcuPb039D9/Wp9UF0dVBc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tTm2YDNjNBizV+DFxPPNZcW9EOalW/DEyAAa0MdqFUo=; b=XN3K8sHsMcNBDviXF3TRJgsLyI
 PQK7IRRmxEUJ6lTZu+uyDfnsmfMU3Cfu+Ul43fd2DSPHZta7PeTNCq8d/cRloOIkV84vpobSRPUd9
 iUlZBhwYU8jUiNPIvAAiBj65eFenPuCUSRVyPyb3oQF/BOPgrqQ5VfiZeBZ2TCzP4nF0=;
Received: from mail-vk1-f178.google.com ([209.85.221.178])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sAHx7-0007U2-UF for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 May 2024 23:34:29 +0000
Received: by mail-vk1-f178.google.com with SMTP id
 71dfb90a1353d-4e15ef06569so1322813e0c.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 23 May 2024 16:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716507263; x=1717112063; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tTm2YDNjNBizV+DFxPPNZcW9EOalW/DEyAAa0MdqFUo=;
 b=BjxsFcYK4oKIFoeWiwstWoDjUmT2U+dtMfAhdBv4hWWzsRCl8xfc6OrCz/MsEpSnsz
 BvMXP8HTf6pZvqL7XBGJaF5iT+MaBRXQH7IHOy7ngKuFkCgZTMAeEMGcvfQy/4Xhzc+d
 nM69UbVwNMUAPuq4WOQrHjPwVvCeB484jftSY5TIl21Lq/G+mPtngFEQYEK+gVzuNo30
 xk5LGXy+syektljYYaPc/UljbA9BJ4DFpJOqdHtsQPAzXw9dbWyd58wxLaUkC/fschLo
 uRxGgdgzljXzkwIM1gxA3CaONLuGa0J/f9aN/Y4gYG20we24Tcq3m6f1iNKHZPDKwTjr
 MHqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716507263; x=1717112063;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tTm2YDNjNBizV+DFxPPNZcW9EOalW/DEyAAa0MdqFUo=;
 b=V2FCJOdfPv9XcM+eUX0lOaXU9Sxz7D6RM6oMgPJec0NWyRXebY42131YveDCYqvvok
 bqSdlfVycovdIrmz3OIbBClbKU6n56/fQiuqr6Qf8+iPCEDh7+hoxDgiLtktgViSreFR
 r8ciI4sT0ajvuiTrlkTY9EZEW58m8qNpNsu7L/Fy1XfsENNEfPu5bh5QjpZ2lvSWpjbM
 ZLDx5ymL8wGs4oxbAjdjx2Pi8eedFGVkmda3wRm1JY9y+aF2GkC4oF8mK+nAL7YZYvbB
 hBRA5A4KdjSShQSSIyivXCQDLznfGcj0qswSMaEDpLmBflnoh0vcVM1iI44yipukBDPK
 /cOg==
X-Gm-Message-State: AOJu0YxU0t5DJOvvAJt+dd1nmp612obSlvWmoz+J+A/DG35dr8HaqfZC
 eG0tNWZrkNXBikvHksQLbPKrelfeIt9DitNb75DoViSIgNVpHeQiAQVkfOeGqOJh/2/7+s8OKCy
 YeNILI06QNIUVbzIITf+sm98gnuc=
X-Google-Smtp-Source: AGHT+IHMnUwsAmN4A8+9Fai5CUmPEOEaU9WO/poNfWRfCKNIgCkJJU5LfP3N5LZ095pBAg7hGJFsIO0fBC1oNdW2TXw=
X-Received: by 2002:a05:6122:a1b:b0:4da:ae51:b755 with SMTP id
 71dfb90a1353d-4e4efb4d928mr780972e0c.3.1716507262138; Thu, 23 May 2024
 16:34:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240523224700.265251-1-drosen@google.com>
 <20240523224700.265251-2-drosen@google.com>
In-Reply-To: <20240523224700.265251-2-drosen@google.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Thu, 23 May 2024 16:34:11 -0700
Message-ID: <CACOAw_xJ4ARUJz=3GcZUA7gBh6Vh9SNzjwvdn-8CvYA3jqVgbg@mail.gmail.com>
To: Daniel Rosenberg <drosen@google.com>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Thu, May 23, 2024 at 3:48 PM Daniel Rosenberg via Linux-f2fs-devel
    wrote: > > Xattrs for files with inline data were being skipped. This dumps
    those, > as well as xattrs for folders. > > Signed [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
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
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.178 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
X-Headers-End: 1sAHx7-0007U2-UF
Subject: Re: [f2fs-dev] [PATCH v4 2/2] dump.f2fs: Fix xattr dumping
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, kernel-team@android.com,
 Daeho Jeong <daehojeong@google.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVGh1LCBNYXkgMjMsIDIwMjQgYXQgMzo0OOKAr1BNIERhbmllbCBSb3NlbmJlcmcgdmlhIExp
bnV4LWYyZnMtZGV2ZWwKPGxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0PiB3
cm90ZToKPgo+IFhhdHRycyBmb3IgZmlsZXMgd2l0aCBpbmxpbmUgZGF0YSB3ZXJlIGJlaW5nIHNr
aXBwZWQuIFRoaXMgZHVtcHMgdGhvc2UsCj4gYXMgd2VsbCBhcyB4YXR0cnMgZm9yIGZvbGRlcnMu
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgUm9zZW5iZXJnIDxkcm9zZW5AZ29vZ2xlLmNvbT4K
PiBSZXZpZXdlZC1ieTogRGFlaG8gSmVvbmcgPGRhZWhvamVvbmdAZ29vZ2xlLmNvbT4KPiAtLS0K
PiAgZnNjay9kdW1wLmMgfCAzOSArKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0t
LS0KPiAgMSBmaWxlIGNoYW5nZWQsIDI3IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQo+
Cj4gZGlmZiAtLWdpdCBhL2ZzY2svZHVtcC5jIGIvZnNjay9kdW1wLmMKPiBpbmRleCBmYTY4NDU2
Li45MGUzZTBlIDEwMDY0NAo+IC0tLSBhL2ZzY2svZHVtcC5jCj4gKysrIGIvZnNjay9kdW1wLmMK
PiBAQCAtMzc3LDcgKzM3Nyw3IEBAIHN0YXRpYyB2b2lkIGR1bXBfbm9kZV9ibGsoc3RydWN0IGYy
ZnNfc2JfaW5mbyAqc2JpLCBpbnQgbnR5cGUsCj4gIH0KPgo+ICAjaWZkZWYgSEFWRV9GU0VUWEFU
VFIKPiAtc3RhdGljIHZvaWQgZHVtcF94YXR0cihzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIHN0
cnVjdCBmMmZzX25vZGUgKm5vZGVfYmxrKQo+ICtzdGF0aWMgdm9pZCBkdW1wX3hhdHRyKHN0cnVj
dCBmMmZzX3NiX2luZm8gKnNiaSwgc3RydWN0IGYyZnNfbm9kZSAqbm9kZV9ibGssIGludCBpc19k
aXIpCj4gIHsKPiAgICAgICAgIHZvaWQgKnhhdHRyOwo+ICAgICAgICAgdm9pZCAqbGFzdF9iYXNl
X2FkZHI7Cj4gQEAgLTQzMSwxMiArNDMxLDI0IEBAIHN0YXRpYyB2b2lkIGR1bXBfeGF0dHIoc3Ry
dWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBzdHJ1Y3QgZjJmc19ub2RlICpub2RlX2JsaykKPgo+ICAg
ICAgICAgICAgICAgICBEQkcoMSwgImZkICVkIHhhdHRyX25hbWUgJXNcbiIsIGMuZHVtcF9mZCwg
eGF0dHJfbmFtZSk7Cj4gICNpZiBkZWZpbmVkKF9fbGludXhfXykKPiAtICAgICAgICAgICAgICAg
cmV0ID0gZnNldHhhdHRyKGMuZHVtcF9mZCwgeGF0dHJfbmFtZSwgdmFsdWUsCj4gLSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBsZTE2X3RvX2NwdShlbnQtPmVfdmFsdWVfc2l6ZSksIDAp
Owo+ICsgICAgICAgICAgICAgICBpZiAoaXNfZGlyKSB7Cj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgcmV0ID0gc2V0eGF0dHIoIi4iLCB4YXR0cl9uYW1lLCB2YWx1ZSwKPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxlMTZfdG9fY3B1KGVu
dC0+ZV92YWx1ZV9zaXplKSwgMCk7Cj4gKyAgICAgICAgICAgICAgIH0gZWxzZSB7Cj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgcmV0ID0gZnNldHhhdHRyKGMuZHVtcF9mZCwgeGF0dHJfbmFtZSwg
dmFsdWUsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBsZTE2X3RvX2NwdShlbnQtPmVfdmFsdWVfc2l6ZSksIDApOwo+ICsgICAgICAgICAg
ICAgICB9Cj4gKwo+ICAjZWxpZiBkZWZpbmVkKF9fQVBQTEVfXykKPiAtICAgICAgICAgICAgICAg
cmV0ID0gZnNldHhhdHRyKGMuZHVtcF9mZCwgeGF0dHJfbmFtZSwgdmFsdWUsCj4gLSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBsZTE2X3RvX2NwdShlbnQtPmVfdmFsdWVfc2l6ZSksIDAs
Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBYQVRUUl9DUkVBVEUpOwo+ICsgICAg
ICAgICAgICAgICBpZiAoaXNfZGlyKSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0ID0g
c2V0eGF0dHIoIi4iLCB4YXR0cl9uYW1lLCB2YWx1ZSwKPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgbGUxNl90b19jcHUoZW50LT5lX3ZhbHVlX3NpemUpLCAwLAo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBYQVRUUl9DUkVBVEUpOwo+ICsg
ICAgICAgICAgICAgICB9IGVsc2Ugewo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldCA9IGZz
ZXR4YXR0cihjLmR1bXBfZmQsIHhhdHRyX25hbWUsIHZhbHVlLAo+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBsZTE2X3RvX2NwdShlbnQtPmVfdmFsdWVfc2l6ZSksIDAs
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFhBVFRSX0NSRUFURSk7
Cj4gKyAgICAgICAgICAgICAgIH0KPiAgI2VuZGlmCj4gICAgICAgICAgICAgICAgIGlmIChyZXQp
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgTVNHKDAsICJYQVRUUiBpbmRleCAweCV4IHNldCB4
YXR0ciBmYWlsZWQgZXJyb3IgJWRcbiIsCj4gQEAgLTQ0OSw3ICs0NjEsNyBAQCBzdGF0aWMgdm9p
ZCBkdW1wX3hhdHRyKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgc3RydWN0IGYyZnNfbm9kZSAq
bm9kZV9ibGspCj4gIH0KPiAgI2Vsc2UKPiAgc3RhdGljIHZvaWQgZHVtcF94YXR0cihzdHJ1Y3Qg
ZjJmc19zYl9pbmZvICpVTlVTRUQoc2JpKSwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHN0cnVjdCBmMmZzX25vZGUgKlVOVVNFRChub2RlX2JsaykpCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBzdHJ1Y3QgZjJmc19ub2RlICpVTlVTRUQobm9kZV9ibGspLCBpbnQg
VU5VU0VEKGlzX2RpcikpCj4gIHsKPiAgICAgICAgIE1TRygwLCAiWEFUVFIgZG9lcyBub3Qgc3Vw
cG9ydFxuIik7Cj4gIH0KPiBAQCAtNDYyLDEzICs0NzQsMTUgQEAgc3RhdGljIGludCBkdW1wX2lu
b2RlX2JsayhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIHUzMiBuaWQsCj4gICAgICAgICB1NjQg
b2ZzID0gMDsKPiAgICAgICAgIHUzMiBhZGRyX3Blcl9ibG9jazsKPiAgICAgICAgIGJvb2wgaXNf
ZGlyID0gU19JU0RJUihsZTE2X3RvX2NwdShub2RlX2Jsay0+aS5pX21vZGUpKTsKPiArICAgICAg
IGludCByZXQgPSAwOwo+Cj4gICAgICAgICBpZiAoKG5vZGVfYmxrLT5pLmlfaW5saW5lICYgRjJG
U19JTkxJTkVfREFUQSkpIHsKPiAgICAgICAgICAgICAgICAgREJHKDMsICJpbm9bMHgleF0gaGFz
IGlubGluZSBkYXRhIVxuIiwgbmlkKTsKPiAgICAgICAgICAgICAgICAgLyogcmVjb3ZlciBmcm9t
IGlubGluZSBkYXRhICovCj4gICAgICAgICAgICAgICAgIGRldl93cml0ZV9kdW1wKCgodW5zaWdu
ZWQgY2hhciAqKW5vZGVfYmxrKSArIElOTElORV9EQVRBX09GRlNFVCwKPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAwLCBNQVhfSU5MSU5FX0RBVEEobm9k
ZV9ibGspKTsKPiAtICAgICAgICAgICAgICAgcmV0dXJuIC0xOwo+ICsgICAgICAgICAgICAgICBy
ZXQgPSAtMTsKPiArICAgICAgICAgICAgICAgZ290byBkdW1wX3hhdHRyOwo+ICAgICAgICAgfQo+
Cj4gICAgICAgICBpZiAoKG5vZGVfYmxrLT5pLmlfaW5saW5lICYgRjJGU19JTkxJTkVfREVOVFJZ
KSkgewo+IEBAIC00ODAsNyArNDk0LDggQEAgc3RhdGljIGludCBkdW1wX2lub2RlX2JsayhzdHJ1
Y3QgZjJmc19zYl9pbmZvICpzYmksIHUzMiBuaWQsCj4gICAgICAgICAgICAgICAgIERCRygzLCAi
aW5vWzB4JXhdIGhhcyBpbmxpbmUgZGVudHJpZXMhXG4iLCBuaWQpOwo+ICAgICAgICAgICAgICAg
ICAvKiByZWNvdmVyIGZyb20gaW5saW5lIGRlbnRyeSAqLwo+ICAgICAgICAgICAgICAgICBkdW1w
X2ZvbGRlcl9jb250ZW50cyhzYmksIGQuYml0bWFwLCBkLmRlbnRyeSwgZC5maWxlbmFtZSwgZC5t
YXgpOwo+IC0gICAgICAgICAgICAgICByZXR1cm4gLTE7Cj4gKyAgICAgICAgICAgICAgIHJldCA9
IC0xOwo+ICsgICAgICAgICAgICAgICBnb3RvIGR1bXBfeGF0dHI7Cj4gICAgICAgICB9Cj4KPiAg
ICAgICAgIGMuc2hvd19maWxlX21hcF9tYXhfb2Zmc2V0ID0gZjJmc19tYXhfZmlsZV9vZmZzZXQo
Jm5vZGVfYmxrLT5pKTsKPiBAQCAtNTE2LDkgKzUzMSw5IEBAIHN0YXRpYyBpbnQgZHVtcF9pbm9k
ZV9ibGsoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCB1MzIgbmlkLAo+ICAgICAgICAgfQo+ICAg
ICAgICAgLyogbGFzdCBibG9jayBpbiBleHRlbnQgY2FjaGUgKi8KPiAgICAgICAgIHByaW50X2V4
dGVudCh0cnVlKTsKPiAtCj4gLSAgICAgICBkdW1wX3hhdHRyKHNiaSwgbm9kZV9ibGspOwo+IC0g
ICAgICAgcmV0dXJuIDA7Cj4gK2R1bXBfeGF0dHI6Cj4gKyAgICAgICBkdW1wX3hhdHRyKHNiaSwg
bm9kZV9ibGssIGlzX2Rpcik7Cj4gKyAgICAgICByZXR1cm4gcmV0Owo+ICB9Cj4KPiAgc3RhdGlj
IHZvaWQgZHVtcF9maWxlKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgc3RydWN0IG5vZGVfaW5m
byAqbmksCj4gLS0KPiAyLjQ1LjEuMjg4LmcwZTBjZDI5OWYxLWdvb2cKPgo+CgpSZXZpZXdlZC1i
eTogRGFlaG8gSmVvbmcgPGRhZWhvamVvbmdAZ29vZ2xlLmNvbT4KClRoYW5rcywKCj4KPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4LWYyZnMt
ZGV2ZWwgbWFpbGluZyBsaXN0Cj4gTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5u
ZXQKPiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1m
MmZzLWRldmVsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5z
b3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGlu
Zm8vbGludXgtZjJmcy1kZXZlbAo=
