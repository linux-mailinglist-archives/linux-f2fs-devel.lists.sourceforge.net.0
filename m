Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B975583E967
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 27 Jan 2024 03:08:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rTY7O-0004dh-Gx;
	Sat, 27 Jan 2024 02:08:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qwjhust@gmail.com>) id 1rTY7M-0004db-Fr
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 Jan 2024 02:08:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/xNPHrDRbEwgseEcXWiWvKYi6gCDcCUo7j4+QwPqXQg=; b=aCK/aEtRZC6UzpdgFHKkHf17Aq
 DylWFwSwQicR/O27ABUqDtLVL3NahJzEF0mddRNn+P/0ToYef02XgDpwxrhsKsYJB3044W14orRW0
 8GpluUidr9nfmQXIaTWyt2xoU/2zrdJ6KTbcTf/ON72fHobUZYUrHNYhGKw1CQeyVOFI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/xNPHrDRbEwgseEcXWiWvKYi6gCDcCUo7j4+QwPqXQg=; b=fDilNj+4IOO6hlmzlpShZshIBo
 Q2HYhnJdireDP6BjxfuqemJQV+yQs4dxaAZpmeV2yheNwzUIFNPKqUa5FctJOIwDPBXWEsbXNTm+J
 wMJ1+ZNH8pkkRf4nLo1BxgbRG9U81hCrHI59+fR1kD1JtTS0/8TQ2vkc+Ye5qzMm0Fy4=;
Received: from mail-qt1-f182.google.com ([209.85.160.182])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rTY7I-0004Za-AB for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 Jan 2024 02:08:25 +0000
Received: by mail-qt1-f182.google.com with SMTP id
 d75a77b69052e-42a8a398cb2so1806221cf.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 26 Jan 2024 18:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706321290; x=1706926090; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/xNPHrDRbEwgseEcXWiWvKYi6gCDcCUo7j4+QwPqXQg=;
 b=K7HzHiorLkk6CsJXsrkMXmo2XKRslHXqEbsECBW3NE6tWb4ek3HVgCYKQKcrPgDqo/
 tTJdjmghk+RVBqDwfbQWRHwc6AcwpS38mKK12oh7CoosdZwmkOJ+pvWLUv25yG72ZbZC
 Z0G94MKZJy5HCOgzrrJkXZ72GbwM1c4yGiKPHlHzL9CRIO3sh0lkY7zQkeLCE5VD3HTM
 ux4L0Fqvy1/mH8CwI3Fx5UmEo182jzME553ZW5JgHdw+mEo8DBsu4PfmgWaGe/SV9ouP
 +QFyuRFErpZLBRUnoliX6t6q4iSZ0WOBtlboTzDBeACo0jL40bZ04pD+B4sqgUmJE6mU
 evbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706321290; x=1706926090;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/xNPHrDRbEwgseEcXWiWvKYi6gCDcCUo7j4+QwPqXQg=;
 b=YzT/Lmu/BX5o2rMx34Y/cutkFCiTO7+lgRHh2Q2AQkqoBcoqYeyUVyVl5wicYd4YrW
 TD1fgY4qn7PfxsHfkpyDshuz4CcUyfR1aBmGybyiT4/JyiwLlvpmXd3lFL6XV4ihp1OW
 si9sYX4RKYPhiJeDQELvgPK09r0HXSyNfS8LBsPFOmM92AlCRpND6VvRP0zG8Dbwd/0V
 RoZ/5dcZbO6M2f5CWleTaFshRqho2jceAZgdNb03QmDtrr2J6nHPyK+7Dn6hQjSzdsWq
 unuiV3BWi/3Aiq0ylItcTxSyh4gJB9eQBNxiDekyJepB52F+AB/IYS9hUVoT4q6igmJT
 ML1g==
X-Gm-Message-State: AOJu0Yz3P9P2dQeFflHtHbrItHeC2Cxshv9ocEIf4qt3HGK5Ipkdw97o
 psSFNKFbheiXFVDr1dVwTsseqDJo+L+RCxG/MSEGNJsfZzxOrJp+67YCeeq3n1uww8YnS29i1CA
 0gCvSy5rBZuLG8BSnZV5Gh/+erLI=
X-Google-Smtp-Source: AGHT+IHSjxcCejNgIcI9TPSg2zRU5MRffZ1qU+PozDV0/9CBYwez4Z5MAq/kiCKGrWU/4d32ygrLFUjHRNxbabGZwYs=
X-Received: by 2002:a05:622a:1192:b0:42a:84a3:2d6b with SMTP id
 m18-20020a05622a119200b0042a84a32d6bmr1108950qtk.61.1706321289852; Fri, 26
 Jan 2024 18:08:09 -0800 (PST)
MIME-Version: 1.0
References: <20240109035804.642-1-qwjhust@gmail.com>
 <ZbQ7XmFpAMSXslkU@google.com>
In-Reply-To: <ZbQ7XmFpAMSXslkU@google.com>
From: Wenjie Qi <qwjhust@gmail.com>
Date: Sat, 27 Jan 2024 10:07:59 +0800
Message-ID: <CAGFpFsQ8j4H8hym8FkdbF1U_k-ns36kF=HQ0LWtnTAj8z_CuAg@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello Jaegeuk, Thank you for your suggestions. I have split
 this patch into three patches. Here is a link to the latest email list. The
 [1] of these links is the patch for the third point above. [1] [2] [3] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [qwjhust[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.160.182 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.182 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1rTY7I-0004Za-AB
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix max open zone constraints
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
Cc: linux-kernel@vger.kernel.org, hustqwj@hust.edu.cn,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGVsbG8gSmFlZ2V1aywKClRoYW5rIHlvdSBmb3IgeW91ciBzdWdnZXN0aW9ucy4gSSBoYXZlIHNw
bGl0IHRoaXMgcGF0Y2ggaW50byB0aHJlZSBwYXRjaGVzLgpIZXJlIGlzIGEgbGluayB0byB0aGUg
bGF0ZXN0IGVtYWlsIGxpc3QuClRoZSBbMV0gb2YgdGhlc2UgbGlua3MgaXMgdGhlIHBhdGNoIGZv
ciB0aGUgdGhpcmQgcG9pbnQgYWJvdmUuCgpbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGlu
dXgtZjJmcy1kZXZlbC9DQUdGcEZzVDZYeVROUFJ4clRnKz1GX2VRXy1jcnloZFlkLWs3clh4eTFv
Sm40RjRvTEFAbWFpbC5nbWFpbC5jb20vVC8jdApbMl0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
bGludXgtZjJmcy1kZXZlbC9DQUdGcEZzVEpBSlhqcmtSVDJuOW9GSENNVy1WM0JnVm1vdVJfOC1H
RDRacXhDMm5fbndAbWFpbC5nbWFpbC5jb20vVC8jdApbM10gaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvbGludXgtZjJmcy1kZXZlbC9jZWRiNDg3NS01Nzk1LTQ3ODktYTAxMC1hOWM2NmZhNjE3MDdA
b3Bwby5jb20vVC8jdAoKCk9uIFNhdCwgSmFuIDI3LCAyMDI0IGF0IDc6MDjigK9BTSBKYWVnZXVr
IEtpbSA8amFlZ2V1a0BrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIDAxLzA5LCBXZW5qaWUgd3Jv
dGU6Cj4gPiBGcm9tOiBXZW5qaWUgUWkgPHF3amh1c3RAZ21haWwuY29tPgo+ID4KPiA+IDEuIElm
IHRoZSBtYXggYWN0aXZlIHpvbmVzIG9mIHpvbmVkIGRldmljZXMgYXJlIGxlc3MgdGhhbgo+ID4g
dGhlIGFjdGl2ZSBsb2dzIG9mIEYyRlMsIHRoZSBkZXZpY2UgbWF5IGVycm9yIGR1ZSB0bwo+ID4g
aW5zdWZmaWNpZW50IHpvbmUgcmVzb3VyY2VzIHdoZW4gbXVsdGlwbGUgYWN0aXZlIGxvZ3MgYXJl
Cj4gPiBiZWluZyB3cml0dGVuIGF0IHRoZSBzYW1lIHRpbWUuCj4gPgo+ID4gMi4gV2UgY2FuIGdl
dCB0aGUgbnVtYmVyIG9mIHJlbWFpbmluZyBhdmFpbGFibGUgem9uZQo+ID4gcmVzb3VyY2VzIGJ5
IHN1YnRyYWN0aW5nIHRoZSBudW1iZXIgb2YgYWN0aXZlIGxvZ3MgZnJvbQo+ID4gdGhlIG51bWJl
ciBvZiBtYXggYWN0aXZlIHpvbmVzIG9mIHpvbmVkIGRldmljZXMuICBXZSBjYW4KPiA+IHVzZSB0
aGVzZSBhdmFpbGFibGUgem9uZSByZXNvdXJjZXMgdG8gcmVkdWNlIHRoZSBudW1iZXIKPiA+IG9m
IHBlbmRpbmcgYmlvIHdoZW4gc3dpdGNoaW5nIHpvbmVzLgo+ID4KPiA+IDMuIFRoZSBvcmlnaW5h
bCBjb2RlIGZvciBkZXRlcm1pbmluZyB6b25lIGVuZCB3YXMKPiA+IGFmdGVyICJvdXQiOiwgd2hp
Y2ggd291bGQgaGF2ZSBtaXNzZWQgc29tZSBmaW8ncwo+ID4gd2hlcmUgaXNfZW5kX3pvbmVfYmxr
YWRkcihzYmksIGZpby0+bmV3X2Jsa2FkZHIpCj4gPiB3YXMgdHJ1ZS4gSSd2ZSBtb3ZlZCB0aGlz
IGNvZGUgYmVmb3JlICJza2lwOiIgdG8KPiA+IG1ha2Ugc3VyZSBpdCdzIGRvbmUgZm9yIGVhY2gg
ZmlvLgo+Cj4gQ291bGQgeW91IHBsZWFzZSBrZWVwICMzIGFzIGEgc2VwYXJhdGUgcGF0Y2g/Cj4K
PiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBXZW5qaWUgUWkgPHF3amh1c3RAZ21haWwuY29tPgo+ID4g
LS0tCj4gPiAgZnMvZjJmcy9kYXRhLmMgIHwgMzggKysrKysrKysrKysrKysrKysrKysrKysrKysr
Ky0tLS0tLS0tLS0KPiA+ICBmcy9mMmZzL2YyZnMuaCAgfCAgMiArKwo+ID4gIGZzL2YyZnMvc3Vw
ZXIuYyB8ICA5ICsrKysrKysrKwo+ID4gIDMgZmlsZXMgY2hhbmdlZCwgMzkgaW5zZXJ0aW9ucygr
KSwgMTAgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZGF0YS5jIGIv
ZnMvZjJmcy9kYXRhLmMKPiA+IGluZGV4IGRjZThkZWZkZjRjNy4uNmIxMTM2NGU5NGI4IDEwMDY0
NAo+ID4gLS0tIGEvZnMvZjJmcy9kYXRhLmMKPiA+ICsrKyBiL2ZzL2YyZnMvZGF0YS5jCj4gPiBA
QCAtMzkyLDYgKzM5MiwxOSBAQCBzdGF0aWMgdm9pZCBmMmZzX3pvbmVfd3JpdGVfZW5kX2lvKHN0
cnVjdCBiaW8gKmJpbykKPiA+ICAgICAgIGNvbXBsZXRlKCZpby0+em9uZV93YWl0KTsKPiA+ICAg
ICAgIGYyZnNfd3JpdGVfZW5kX2lvKGJpbyk7Cj4gPiAgfQo+ID4gKwo+ID4gK3N0YXRpYyB2b2lk
IGYyZnNfem9uZV93cml0ZV9lbmRfaW9fbm93YWl0KHN0cnVjdCBiaW8gKmJpbykKPiA+ICt7Cj4g
PiArI2lmZGVmIENPTkZJR19GMkZTX0lPU1RBVAo+ID4gKyAgICAgc3RydWN0IGJpb19pb3N0YXRf
Y3R4ICppb3N0YXRfY3R4ID0gYmlvLT5iaV9wcml2YXRlOwo+ID4gKyAgICAgc3RydWN0IGYyZnNf
c2JfaW5mbyAqc2JpID0gaW9zdGF0X2N0eC0+c2JpOwo+ID4gKyNlbHNlCj4gPiArICAgICBzdHJ1
Y3QgZjJmc19zYl9pbmZvICpzYmkgPSAoc3RydWN0IGYyZnNfc2JfaW5mbyAqKWJpby0+YmlfcHJp
dmF0ZTsKPiA+ICsjZW5kaWYKPiA+ICsKPiA+ICsgICAgIGF0b21pY19pbmMoJnNiaS0+YXZhaWxh
YmxlX2FjdGl2ZV96b25lcyk7Cj4gPiArICAgICBmMmZzX3dyaXRlX2VuZF9pbyhiaW8pOwo+ID4g
K30KPiA+ICAjZW5kaWYKPiA+Cj4gPiAgc3RydWN0IGJsb2NrX2RldmljZSAqZjJmc190YXJnZXRf
ZGV2aWNlKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKPiA+IEBAIC0xMDgwLDIyICsxMDkzLDI3
IEBAIHZvaWQgZjJmc19zdWJtaXRfcGFnZV93cml0ZShzdHJ1Y3QgZjJmc19pb19pbmZvICpmaW8p
Cj4gPiAgICAgICBpby0+bGFzdF9ibG9ja19pbl9iaW8gPSBmaW8tPm5ld19ibGthZGRyOwo+ID4K
PiA+ICAgICAgIHRyYWNlX2YyZnNfc3VibWl0X3BhZ2Vfd3JpdGUoZmlvLT5wYWdlLCBmaW8pOwo+
ID4gLXNraXA6Cj4gPiAtICAgICBpZiAoZmlvLT5pbl9saXN0KQo+ID4gLSAgICAgICAgICAgICBn
b3RvIG5leHQ7Cj4gPiAtb3V0Ogo+ID4gICNpZmRlZiBDT05GSUdfQkxLX0RFVl9aT05FRAo+ID4g
ICAgICAgaWYgKGYyZnNfc2JfaGFzX2Jsa3pvbmVkKHNiaSkgJiYgYnR5cGUgPCBNRVRBICYmCj4g
PiAgICAgICAgICAgICAgICAgICAgICAgaXNfZW5kX3pvbmVfYmxrYWRkcihzYmksIGZpby0+bmV3
X2Jsa2FkZHIpKSB7Cj4gPiAtICAgICAgICAgICAgIGJpb19nZXQoaW8tPmJpbyk7Cj4gPiAtICAg
ICAgICAgICAgIHJlaW5pdF9jb21wbGV0aW9uKCZpby0+em9uZV93YWl0KTsKPiA+IC0gICAgICAg
ICAgICAgaW8tPmJpX3ByaXZhdGUgPSBpby0+YmlvLT5iaV9wcml2YXRlOwo+ID4gLSAgICAgICAg
ICAgICBpby0+YmlvLT5iaV9wcml2YXRlID0gaW87Cj4gPiAtICAgICAgICAgICAgIGlvLT5iaW8t
PmJpX2VuZF9pbyA9IGYyZnNfem9uZV93cml0ZV9lbmRfaW87Cj4gPiAtICAgICAgICAgICAgIGlv
LT56b25lX3BlbmRpbmdfYmlvID0gaW8tPmJpbzsKPiA+ICsgICAgICAgICAgICAgaWYgKCFhdG9t
aWNfYWRkX25lZ2F0aXZlKC0xLCAmc2JpLT5hdmFpbGFibGVfYWN0aXZlX3pvbmVzKSkgewo+ID4g
KyAgICAgICAgICAgICAgICAgICAgIGlvLT5iaW8tPmJpX2VuZF9pbyA9IGYyZnNfem9uZV93cml0
ZV9lbmRfaW9fbm93YWl0Owo+ID4gKyAgICAgICAgICAgICB9IGVsc2Ugewo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgIGF0b21pY19pbmMoJnNiaS0+YXZhaWxhYmxlX2FjdGl2ZV96b25lcyk7Cj4g
PiArICAgICAgICAgICAgICAgICAgICAgYmlvX2dldChpby0+YmlvKTsKPiA+ICsgICAgICAgICAg
ICAgICAgICAgICByZWluaXRfY29tcGxldGlvbigmaW8tPnpvbmVfd2FpdCk7Cj4gPiArICAgICAg
ICAgICAgICAgICAgICAgaW8tPmJpX3ByaXZhdGUgPSBpby0+YmlvLT5iaV9wcml2YXRlOwo+ID4g
KyAgICAgICAgICAgICAgICAgICAgIGlvLT5iaW8tPmJpX3ByaXZhdGUgPSBpbzsKPiA+ICsgICAg
ICAgICAgICAgICAgICAgICBpby0+YmlvLT5iaV9lbmRfaW8gPSBmMmZzX3pvbmVfd3JpdGVfZW5k
X2lvOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGlvLT56b25lX3BlbmRpbmdfYmlvID0gaW8t
PmJpbzsKPiA+ICsgICAgICAgICAgICAgfQo+ID4gICAgICAgICAgICAgICBfX3N1Ym1pdF9tZXJn
ZWRfYmlvKGlvKTsKPiA+ICAgICAgIH0KPiA+ICAjZW5kaWYKPiA+ICtza2lwOgo+ID4gKyAgICAg
aWYgKGZpby0+aW5fbGlzdCkKPiA+ICsgICAgICAgICAgICAgZ290byBuZXh0Owo+ID4gK291dDoK
PiA+ICAgICAgIGlmIChpc19zYmlfZmxhZ19zZXQoc2JpLCBTQklfSVNfU0hVVERPV04pIHx8Cj4g
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAhZjJmc19pc19jaGVja3BvaW50X3JlYWR5
KHNiaSkpCj4gPiAgICAgICAgICAgICAgIF9fc3VibWl0X21lcmdlZF9iaW8oaW8pOwo+ID4gZGlm
ZiAtLWdpdCBhL2ZzL2YyZnMvZjJmcy5oIGIvZnMvZjJmcy9mMmZzLmgKPiA+IGluZGV4IDY1Mjk0
ZTNiMGJlZi4uMWIxODMzZTFkMTBlIDEwMDY0NAo+ID4gLS0tIGEvZnMvZjJmcy9mMmZzLmgKPiA+
ICsrKyBiL2ZzL2YyZnMvZjJmcy5oCj4gPiBAQCAtMTU1MSw2ICsxNTUxLDggQEAgc3RydWN0IGYy
ZnNfc2JfaW5mbyB7Cj4gPgo+ID4gICNpZmRlZiBDT05GSUdfQkxLX0RFVl9aT05FRAo+ID4gICAg
ICAgdW5zaWduZWQgaW50IGJsb2Nrc19wZXJfYmxrejsgICAgICAgICAgIC8qIEYyRlMgYmxvY2tz
IHBlciB6b25lICovCj4gPiArICAgICB1bnNpZ25lZCBpbnQgbWF4X2FjdGl2ZV96b25lczsgICAg
ICAgICAgLyogbWF4IHpvbmUgcmVzb3VyY2VzIG9mIHRoZSB6b25lZCBkZXZpY2UgKi8KPiA+ICsg
ICAgIGF0b21pY190IGF2YWlsYWJsZV9hY3RpdmVfem9uZXM7ICAgICAgICAgICAgICAgIC8qIHJl
bWFpbmluZyB6b25lIHJlc291cmNlcyAqLwo+ID4gICNlbmRpZgo+ID4KPiA+ICAgICAgIC8qIGZv
ciBub2RlLXJlbGF0ZWQgb3BlcmF0aW9ucyAqLwo+ID4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvc3Vw
ZXIuYyBiL2ZzL2YyZnMvc3VwZXIuYwo+ID4gaW5kZXggMjA2ZDAzYzgyZDk2Li5jNzk5MTk0MjVk
NjMgMTAwNjQ0Cj4gPiAtLS0gYS9mcy9mMmZzL3N1cGVyLmMKPiA+ICsrKyBiL2ZzL2YyZnMvc3Vw
ZXIuYwo+ID4gQEAgLTM5MzIsNiArMzkzMiwxNSBAQCBzdGF0aWMgaW50IGluaXRfYmxrel9pbmZv
KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgaW50IGRldmkpCj4gPiAgICAgICBpZiAoIWYyZnNf
c2JfaGFzX2Jsa3pvbmVkKHNiaSkpCj4gPiAgICAgICAgICAgICAgIHJldHVybiAwOwo+ID4KPiA+
ICsgICAgIHNiaS0+bWF4X2FjdGl2ZV96b25lcyA9IGJkZXZfbWF4X2FjdGl2ZV96b25lcyhiZGV2
KTsKPiA+ICsgICAgIGlmIChzYmktPm1heF9hY3RpdmVfem9uZXMgJiYgKHNiaS0+bWF4X2FjdGl2
ZV96b25lcyA8IEYyRlNfT1BUSU9OKHNiaSkuYWN0aXZlX2xvZ3MpKSB7Cj4gPiArICAgICAgICAg
ICAgIGYyZnNfZXJyKHNiaSwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAiem9uZWQ6IG1heCBh
Y3RpdmUgem9uZXMgJXUgaXMgdG9vIHNtYWxsLCBuZWVkIGF0IGxlYXN0ICV1IGFjdGl2ZSB6b25l
cyIsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2JpLT5tYXhfYWN0aXZlX3pv
bmVzLCBGMkZTX09QVElPTihzYmkpLmFjdGl2ZV9sb2dzKTsKPiA+ICsgICAgICAgICAgICAgcmV0
dXJuIC1FSU5WQUw7Cj4gPiArICAgICB9Cj4gPiArICAgICBhdG9taWNfc2V0KCZzYmktPmF2YWls
YWJsZV9hY3RpdmVfem9uZXMsIHNiaS0+bWF4X2FjdGl2ZV96b25lcyAtIEYyRlNfT1BUSU9OKHNi
aSkuYWN0aXZlX2xvZ3MpOwo+ID4gKwo+ID4gICAgICAgem9uZV9zZWN0b3JzID0gYmRldl96b25l
X3NlY3RvcnMoYmRldik7Cj4gPiAgICAgICBpZiAoIWlzX3Bvd2VyX29mXzIoem9uZV9zZWN0b3Jz
KSkgewo+ID4gICAgICAgICAgICAgICBmMmZzX2VycihzYmksICJGMkZTIGRvZXMgbm90IHN1cHBv
cnQgbm9uIHBvd2VyIG9mIDIgem9uZSBzaXplc1xuIik7Cj4gPiAtLQo+ID4gMi4zNC4xCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1k
ZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQK
aHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1k
ZXZlbAo=
