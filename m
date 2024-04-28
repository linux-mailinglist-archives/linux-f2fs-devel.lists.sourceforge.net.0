Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D527B8B490F
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 28 Apr 2024 03:24:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s0tH4-0000Xk-1u;
	Sun, 28 Apr 2024 01:24:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1s0tH1-0000Xd-Jv
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 28 Apr 2024 01:24:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bDm1xlTeJ62qRqjr/MjwxR+LT5/CX/cKG3RA29L+Igk=; b=EOTYHYdxHgeqa7g5bFnjSIoiuj
 1VMJ07wF1bKI2v9PYg/2pIDFo0TCs1Q0WsiDSwZXbSc20zVCErZ/6NvrkZGZNkGLr6a53Pvq9E7u6
 1xR6EmrjPazj3au2wugzXiB1/CnDe+1laR4HQqmh+RucMqXkUYBZuILIhvuogxNEQdEY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bDm1xlTeJ62qRqjr/MjwxR+LT5/CX/cKG3RA29L+Igk=; b=h785fAtPM3LxJx8joNEcIQIywF
 XNAzHwECLn2wCexYdUuQAd9hBCQKO1Qj/JNpHPut9SV39WFqtwfPT1W6OUQrHjbQTmDeSO7Ox3ig3
 v4pkyWGNhSgKug0qNe9kBxPLZv2pwc5uev6l9FmE66H0rwG60LsmbBs8CjYq/s8fSAdY=;
Received: from mail-ua1-f54.google.com ([209.85.222.54])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1s0tH0-0001pP-Rz for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 28 Apr 2024 01:24:12 +0000
Received: by mail-ua1-f54.google.com with SMTP id
 a1e0cc1a2514c-7ebe09eb289so757282241.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 27 Apr 2024 18:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714267445; x=1714872245; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bDm1xlTeJ62qRqjr/MjwxR+LT5/CX/cKG3RA29L+Igk=;
 b=ZQOv7KznlYSzXbKT6HG9+UM6z2Vw9nRssiKaC72kJDxlkYmkje83mRYKdZ/a4VSniW
 GiTOQc3/hys4DB4vKeKexAqVubufAgpMiS3v81AvN6fdunXNx/dtTnht/C+3QDiWcO+l
 AEhONfEriqINc53Gjzw2XSOyYp9ihlvooIRzoExj/wR30+MyOcLp1hje/YoIGsIoJ7hQ
 U1cr+SMrdkYQEyMM0a2J0AQyabUtMa52cTuWNSIepeemId+P8r1hVxvGXdpaL6SsDr+R
 jE56wQJkRJmzebeKt0OEZZTKGw3ZE8zWv18nc2jJwoHTvrhlGvMtJxEURmapn8tbR5+5
 SQ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714267445; x=1714872245;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bDm1xlTeJ62qRqjr/MjwxR+LT5/CX/cKG3RA29L+Igk=;
 b=Bl6tngOhxTPTEtump5MT7AukQ4werljL8DhMpKfu3p+5nPZ6HNVeaLbLjLIx7CGn8R
 hCjZwImZ0gdfoC8BuGU40ILxkhDf4BqpUVsMCHeWMc82k/78sNmiZUll4AynQn/AfBf0
 SmLw49Cb15uC2YIxtCMcfZBCfbXqosZLSORJRNEqZwpdwMRcEbMp5m/pHQYzMa5zZLgd
 839MK/fgGJbJ88RgOkGhaJfeV+B68CZEsPindSlfJWEB3V1v9mBHG+oacyIKwtKtxuH1
 dbU4RiKICmqopyIoSUOOgOaxU25pQHhpyb9tjcihKI8bjR8o6EsWBvI9UENneTJDbeeI
 RLiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSxcSFThq6b9iX+fJ1SZLwWj8ZoDg/4K0kp5jK8cM5eICkG5/UcFvNab16obnbFLl/mCJXqAY7bP6DUVtIpmzzVipRiQfRnN4770DyiJZYwE8cC3RQ1w==
X-Gm-Message-State: AOJu0Yz950hADo3PZT+BBCqrM2+ikeno+EJJG3csCBWdnNG5O13n3lkZ
 sGdi6ce1vxiTJ2PB2hmHwIugPE3we19Ql3jBBb2KVDLwylbrofNemwSLL2/00Odxprlkrwv7Z8P
 PN/l5Y4SApmVtrrMJGJqYn/yocD8=
X-Google-Smtp-Source: AGHT+IHcu6QpbQsdFiqLX6Pb8PeBjCFGPHT+zykUoeAC0/R+hXjsCA8MnWuvHKcvn0corxOZ9LTH9arxOXvhvQeJq7o=
X-Received: by 2002:a67:f707:0:b0:47b:6d0b:e893 with SMTP id
 m7-20020a67f707000000b0047b6d0be893mr6529902vso.28.1714267445312; Sat, 27 Apr
 2024 18:24:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240409203411.1885121-1-jaegeuk@kernel.org>
 <20240409203411.1885121-3-jaegeuk@kernel.org>
 <050a93dc-d9a8-44bd-9a83-83718e95f04d@kernel.org>
 <Zhmf4klcOr4eplin@google.com>
 <CAD14+f0Scnc1GTjqR1izHqPerCqgHsLMR9mfKocUxw_4hyZ+Zg@mail.gmail.com>
 <49a4cc15-299f-432c-85c7-ab1b1daaaad1@kernel.org>
In-Reply-To: <49a4cc15-299f-432c-85c7-ab1b1daaaad1@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Sat, 27 Apr 2024 18:23:54 -0700
Message-ID: <CACOAw_wbCJfOpfHzsznofkP8nb=gigjwmMqrCaeUR+ago8Xo7Q@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Thu, Apr 25, 2024 at 12:30 AM Chao Yu wrote: > > On 2024/4/19
    18:27, Juhyung Park wrote: > > On Sat, Apr 13, 2024 at 5:57 AM Jaegeuk
   Kim wrote: > >> > >> On 04/11, Chao Yu wrote: > >>> On 2 [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
  0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
                             DNSWL was blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [209.85.222.54 listed in list.dnswl.org]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.222.54 listed in wl.mailspike.net]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
X-Headers-End: 1s0tH0-0001pP-Rz
Subject: Re: [f2fs-dev] [PATCH 3/3] f2fs: fix false alarm on invalid block
 address
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVGh1LCBBcHIgMjUsIDIwMjQgYXQgMTI6MzDigK9BTSBDaGFvIFl1IDxjaGFvQGtlcm5lbC5v
cmc+IHdyb3RlOgo+Cj4gT24gMjAyNC80LzE5IDE4OjI3LCBKdWh5dW5nIFBhcmsgd3JvdGU6Cj4g
PiBPbiBTYXQsIEFwciAxMywgMjAyNCBhdCA1OjU34oCvQU0gSmFlZ2V1ayBLaW0gPGphZWdldWtA
a2VybmVsLm9yZz4gd3JvdGU6Cj4gPj4KPiA+PiBPbiAwNC8xMSwgQ2hhbyBZdSB3cm90ZToKPiA+
Pj4gT24gMjAyNC80LzEwIDQ6MzQsIEphZWdldWsgS2ltIHdyb3RlOgo+ID4+Pj4gZjJmc19yYV9t
ZXRhX3BhZ2VzIGNhbiB0cnkgdG8gcmVhZCBhaGVhZCBvbiBpbnZhbGlkIGJsb2NrIGFkZHJlc3Mg
d2hpY2ggaXMKPiA+Pj4+IG5vdCB0aGUgY29ycnVwdGlvbiBjYXNlLgo+ID4+Pgo+ID4+PiBJbiB3
aGljaCBjYXNlIHdlIHdpbGwgcmVhZCBhaGVhZCBpbnZhbGlkIG1ldGEgcGFnZXM/IHJlY292ZXJ5
IHcvIE1FVEFfUE9SPwo+ID4KPiA+IEluIG15IGNhc2UsIGl0IHNlZW1zIGxpa2UgaXQncyBNRVRB
X1NJVCwgYW5kIGl0J3MgdHJpZ2dlcmVkIHJpZ2h0IGFmdGVyIG1vdW50Lgo+Cj4gQWgsIEkgc2Vl
LCBhY3R1YWxseSBpdCBoaXRzIGF0IHRoaXMgY2FzZSwgdGhhbmtzIGZvciB0aGUgaW5mb3JtYXRp
b24uCj4KPiBUaGFua3MsCj4KPiA+IGZzY2sgZGV0ZWN0cyBpbnZhbGlkX2Jsa2FkZHIsIGFuZCB3
aGVuIHRoZSBrZXJuZWwgbW91bnRzIGl0LCBpdAo+ID4gaW1tZWRpYXRlbHkgZmxhZ3MgaW52YWxp
ZF9ibGthZGRyIGFnYWluOgo+ID4KPiA+IFsgICAgNi4zMzM0OThdIGluaXQ6IFtsaWJmc19tZ3Jd
IFJ1bm5pbmcgL3N5c3RlbS9iaW4vZnNjay5mMmZzIC1hIC1jCj4gPiAxMDAwMCAtLWRlYnVnLWNh
Y2hlIC9kZXYvYmxvY2svc2RhMTMKPiA+IFsgICAgNi4zMzc2NzFdIGZzY2suZjJmczogSW5mbzog
Rml4IHRoZSByZXBvcnRlZCBjb3JydXB0aW9uLgo+ID4gWyAgICA2LjMzNzk0N10gZnNjay5mMmZz
OiBJbmZvOiBub3QgZXhpc3QgL3Byb2MvdmVyc2lvbiEKPiA+IFsgICAgNi4zMzgwMTBdIGZzY2su
ZjJmczogSW5mbzogY2FuJ3QgZmluZCAvc3lzLCBhc3N1bWluZyBub3JtYWwgYmxvY2sgZGV2aWNl
Cj4gPiBbICAgIDYuMzM4Mjk0XSBmc2NrLmYyZnM6IEluZm86IE1LRlMgdmVyc2lvbgo+ID4gWyAg
ICA2LjMzODMxOV0gZnNjay5mMmZzOiAgICI1LjEwLjE2MC1hbmRyb2lkMTItOS1nZTVjZmVjNDFj
OGUyIgo+ID4gWyAgICA2LjMzODM2Nl0gZnNjay5mMmZzOiBJbmZvOiBGU0NLIHZlcnNpb24KPiA+
IFsgICAgNi4zMzgzODBdIGZzY2suZjJmczogICBmcm9tICI1LjEwLWFydGVyOTciCj4gPiBbICAg
IDYuMzM4MzkzXSBmc2NrLmYyZnM6ICAgICB0byAiNS4xMC1hcnRlcjk3Igo+ID4gWyAgICA2LjMz
ODQxNF0gZnNjay5mMmZzOiBJbmZvOiBzdXBlcmJsb2NrIGZlYXR1cmVzID0gMTQ5OSA6ICBlbmNy
eXB0Cj4gPiB2ZXJpdHkgZXh0cmFfYXR0ciBwcm9qZWN0X3F1b3RhIHF1b3RhX2lubyBjYXNlZm9s
ZAo+ID4gWyAgICA2LjMzODQyOV0gZnNjay5mMmZzOiBJbmZvOiBzdXBlcmJsb2NrIGVuY3J5cHQg
bGV2ZWwgPSAwLCBzYWx0ID0KPiA+IDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwCj4g
PiBbICAgIDYuMzM4NDQyXSBmc2NrLmYyZnM6IEluZm86IGNoZWNrcG9pbnQgc3RvcCByZWFzb246
IHNodXRkb3duKDE4MCkKPiA+IFsgICAgNi4zMzg0NTVdIGZzY2suZjJmczogSW5mbzogZnMgZXJy
b3JzOiBpbnZhbGlkX2Jsa2FkZHIKPiA+IFsgICAgNi4zMzg0NjhdIGZzY2suZjJmczogSW5mbzog
U2VnbWVudHMgcGVyIHNlY3Rpb24gPSAxCj4gPiBbICAgIDYuMzM4NDgwXSBmc2NrLmYyZnM6IElu
Zm86IFNlY3Rpb25zIHBlciB6b25lID0gMQo+ID4gWyAgICA2LjMzODQ5Ml0gZnNjay5mMmZzOiBJ
bmZvOiB0b3RhbCBGUyBzZWN0b3JzID0gNTg5NzE1NzEgKDIzMDM1NyBNQikKPiA+IFsgICAgNi4z
NDA1OTldIGZzY2suZjJmczogSW5mbzogQ0tQVCB2ZXJzaW9uID0gMmI3ZTNiMjkKPiA+IFsgICAg
Ni4zNDA2MjBdIGZzY2suZjJmczogSW5mbzogdmVyc2lvbiB0aW1lc3RhbXAgY3VyOiAxOTc4OTI5
NiwgcHJldjogMTg0MDcwMDgKPiA+IFsgICAgNi42NzcwNDFdIGZzY2suZjJmczogSW5mbzogY2hl
Y2twb2ludCBzdGF0ZSA9IDQ2IDogIGNyYwo+ID4gY29tcGFjdGVkX3N1bW1hcnkgb3JwaGFuX2lu
b2RlcyBzdWRkZW4tcG93ZXItb2ZmCj4gPiBbICAgIDYuNjc3MDUyXSBmc2NrLmYyZnM6IFtGU0NL
XSBDaGVjayBub2RlIDEgLyA3MTI5MzcgKDAuMDAlKQo+ID4gWyAgICA4Ljk5NzkyMl0gZnNjay5m
MmZzOiBbRlNDS10gQ2hlY2sgbm9kZSA3MTI5NCAvIDcxMjkzNyAoMTAuMDAlKQo+ID4gWyAgIDEw
LjYyOTIwNV0gZnNjay5mMmZzOiBbRlNDS10gQ2hlY2sgbm9kZSAxNDI1ODcgLyA3MTI5MzcgKDIw
LjAwJSkKPiA+IFsgICAxMi4yNzgxODZdIGZzY2suZjJmczogW0ZTQ0tdIENoZWNrIG5vZGUgMjEz
ODgwIC8gNzEyOTM3ICgzMC4wMCUpCj4gPiBbICAgMTMuNzY4MTc3XSBmc2NrLmYyZnM6IFtGU0NL
XSBDaGVjayBub2RlIDI4NTE3MyAvIDcxMjkzNyAoNDAuMDAlKQo+ID4gWyAgIDE3LjQ0Njk3MV0g
ZnNjay5mMmZzOiBbRlNDS10gQ2hlY2sgbm9kZSAzNTY0NjYgLyA3MTI5MzcgKDUwLjAwJSkKPiA+
IFsgICAxOS44OTE2MjNdIGZzY2suZjJmczogW0ZTQ0tdIENoZWNrIG5vZGUgNDI3NzU5IC8gNzEy
OTM3ICg2MC4wMCUpCj4gPiBbICAgMjMuMjUxMzI3XSBmc2NrLmYyZnM6IFtGU0NLXSBDaGVjayBu
b2RlIDQ5OTA1MiAvIDcxMjkzNyAoNzAuMDAlKQo+ID4gWyAgIDI4LjQ5MzQ1N10gZnNjay5mMmZz
OiBbRlNDS10gQ2hlY2sgbm9kZSA1NzAzNDUgLyA3MTI5MzcgKDgwLjAwJSkKPiA+IFsgICAyOS42
NDA4MDBdIGZzY2suZjJmczogW0ZTQ0tdIENoZWNrIG5vZGUgNjQxNjM4IC8gNzEyOTM3ICg5MC4w
MCUpCj4gPiBbICAgMzAuNzE4MzQ3XSBmc2NrLmYyZnM6IFtGU0NLXSBDaGVjayBub2RlIDcxMjkz
MSAvIDcxMjkzNyAoMTAwLjAwJSkKPiA+IFsgICAzMC43MjQxNzZdIGZzY2suZjJmczoKPiA+IFsg
ICAzMC43MzcxNjBdIGZzY2suZjJmczogW0ZTQ0tdIE1heCBpbWFnZSBzaXplOiAxNjc1MDYgTUIs
IEZyZWUgc3BhY2U6IDYyODUwIE1CCj4gPiBbICAgMzAuNzM3MTY0XSBmc2NrLmYyZnM6IFtGU0NL
XSBVbnJlYWNoYWJsZSBuYXQgZW50cmllcwo+ID4gICAgICAgICAgIFtPay4uXSBbMHgwXQo+ID4g
WyAgIDMwLjczNzYzOF0gZnNjay5mMmZzOiBbRlNDS10gU0lUIHZhbGlkIGJsb2NrIGJpdG1hcCBj
aGVja2luZwo+ID4gICAgICAgICAgIFtPay4uXQo+ID4gWyAgIDMwLjczNzY0MF0gZnNjay5mMmZz
OiBbRlNDS10gSGFyZCBsaW5rIGNoZWNraW5nIGZvciByZWd1bGFyIGZpbGUKPiA+ICAgICAgICAg
ICBbT2suLl0gWzB4ZF0KPiA+IFsgICAzMC43Mzc2NDFdIGZzY2suZjJmczogW0ZTQ0tdIHZhbGlk
X2Jsb2NrX2NvdW50IG1hdGNoaW5nIHdpdGggQ1AKPiA+ICAgICAgICAgICBbT2suLl0gWzB4Mjhi
OThlNl0KPiA+IFsgICAzMC43Mzc2NDRdIGZzY2suZjJmczogW0ZTQ0tdIHZhbGlkX25vZGVfY291
bnQgbWF0Y2hpbmcgd2l0aCBDUCAoZGUKPiA+IGxvb2t1cCkgIFtPay4uXSBbMHhhZTBlOV0KPiA+
IFsgICAzMC43Mzc2NDZdIGZzY2suZjJmczogW0ZTQ0tdIHZhbGlkX25vZGVfY291bnQgbWF0Y2hp
bmcgd2l0aCBDUAo+ID4gKG5hdCBsb29rdXApIFtPay4uXSBbMHhhZTBlOV0KPiA+IFsgICAzMC43
Mzc2NDddIGZzY2suZjJmczogW0ZTQ0tdIHZhbGlkX2lub2RlX2NvdW50IG1hdGNoZWQgd2l0aCBD
UAo+ID4gICAgICAgICAgIFtPay4uXSBbMHhhNzRhM10KPiA+IFsgICAzMC43Mzc2NDldIGZzY2su
ZjJmczogW0ZTQ0tdIGZyZWUgc2VnbWVudF9jb3VudCBtYXRjaGVkIHdpdGggQ1AKPiA+ICAgICAg
ICAgICBbT2suLl0gWzB4N2FhM10KPiA+IFsgICAzMC43Mzc2NjJdIGZzY2suZjJmczogW0ZTQ0td
IG5leHQgYmxvY2sgb2Zmc2V0IGlzIGZyZWUKPiA+ICAgICAgICAgICBbT2suLl0KPiA+IFsgICAz
MC43Mzc2NjNdIGZzY2suZjJmczogW0ZTQ0tdIGZpeGluZyBTSVQgdHlwZXMKPiA+IFsgICAzMC43
Mzc4NjddIGZzY2suZjJmczogW0ZTQ0tdIG90aGVyIGNvcnJ1cHRlZCBidWdzCj4gPiAgICAgICAg
ICAgW09rLi5dCj4gPiBbICAgMzAuNzM3ODkzXSBmc2NrLmYyZnM6IFt1cGRhdGVfc3VwZXJibG9j
azogNzY1XSBJbmZvOiBEb25lIHRvCj4gPiB1cGRhdGUgc3VwZXJibG9jawo+ID4gWyAgIDMwLjk2
MDYxMF0gZnNjay5mMmZzOgo+ID4gWyAgIDMwLjk2MDYxOF0gZnNjay5mMmZzOiBEb25lOiAyNC42
MjI5NTYgc2Vjcwo+ID4gWyAgIDMwLjk2MDYyMF0gZnNjay5mMmZzOgo+ID4gWyAgIDMwLjk2MDYy
Ml0gZnNjay5mMmZzOiBjLCB1LCBSQSwgQ0gsIENNLCBSZXBsPQo+ID4gWyAgIDMwLjk2MDYyN10g
ZnNjay5mMmZzOiAxMDAwMCAxMDAwMCA0MzYwMDUxNyA0MjYwNTQzNCA5OTUwODMgOTg1MDgzCj4g
PiBbICAgMzAuOTYzMjc0XSBGMkZTLWZzIChzZGExMyk6IFVzaW5nIGVuY29kaW5nIGRlZmluZWQg
Ynkgc3VwZXJibG9jazoKPiA+IHV0ZjgtMTIuMS4wIHdpdGggZmxhZ3MgMHgwCj4gPiBbICAgMzAu
OTk1MzYwXSBfX2YyZnNfaXNfdmFsaWRfYmxrYWRkcjogdHlwZT0yCj4gPgo+ID4gKE1hbnVhbGx5
IGFkZGVkIHRoYXQgcHJpbnQgXikKPiA+Cj4gPiBbICAgMzAuOTk1MzY5XSAtLS0tLS0tLS0tLS1b
IGN1dCBoZXJlIF0tLS0tLS0tLS0tLS0KPiA+IFsgICAzMC45OTUzNzVdIFdBUk5JTkc6IENQVTog
NyBQSUQ6IDEgYXQgZjJmc19oYW5kbGVfZXJyb3IrMHgxOC8weDNjCj4gPiBbICAgMzAuOTk1Mzc4
XSBDUFU6IDcgUElEOiAxIENvbW06IGluaXQgVGFpbnRlZDogRyBTICAgICAgVwo+ID4gNS4xMC4y
MDktYXJ0ZXI5Ny1yMTUta2VybmVsc3UtZzA4NjdkMGU0ZjFkMiAjNgo+ID4gWyAgIDMwLjk5NTM3
OV0gSGFyZHdhcmUgbmFtZTogUXVhbGNvbW0gVGVjaG5vbG9naWVzLCBJbmMuIENhcGUgUVJECj4g
PiB3aXRoIFBNODAxMCAoRFQpCj4gPiBbICAgMzAuOTk1MzgwXSBwc3RhdGU6IDIyNDAwMDA1IChu
ekN2IGRhaWYgK1BBTiAtVUFPICtUQ08gQlRZUEU9LS0pCj4gPiBbICAgMzAuOTk1MzgyXSBwYyA6
IGYyZnNfaGFuZGxlX2Vycm9yKzB4MTgvMHgzYwo+ID4gWyAgIDMwLjk5NTM4NF0gbHIgOiBfX2Yy
ZnNfaXNfdmFsaWRfYmxrYWRkcisweDJhNC8weDJiMAo+ID4gWyAgIDMwLjk5NTM4NV0gc3AgOiBm
ZmZmZmY4MDIwOWU3OWIwCj4gPiBbICAgMzAuOTk1Mzg2XSB4Mjk6IGZmZmZmZjgwMjA5ZTc5YjAg
eDI4OiAwMDAwMDAwMDAwMDAwMDM3Cj4gPiBbICAgMzAuOTk1Mzg4XSB4Mjc6IDAwMDAwMDAwMDAw
MDAxYzcgeDI2OiAwMDAwMDAwMDIwMTIwMTIxCj4gPiBbICAgMzAuOTk1Mzg5XSB4MjU6IDAwMDAw
MDAwMDAwMDAwZDkgeDI0OiAwMDAwMDAwMDAwMDAwMDAwCj4gPiBbICAgMzAuOTk1MzkwXSB4MjM6
IGZmZmZmZmZmMDBmMWE3MDAgeDIyOiAwMDAwMDAwMDAwMDAwODI4Cj4gPiBbICAgMzAuOTk1Mzkx
XSB4MjE6IGZmZmZmZjgwNDYyYWEwMDAgeDIwOiBmZmZmZmY4MDQ2MmFhMDAwCj4gPiBbICAgMzAu
OTk1MzkyXSB4MTk6IDAwMDAwMDAwMDAwMDAwMDIgeDE4OiBmZmZmZmZmZmZmZmZmZmZmCj4gPiBb
ICAgMzAuOTk1MzkzXSB4MTc6IDAwMDAwMDAwMDAwMDAwMDAgeDE2OiAwMDAwMDAwMGZmZmYwMDAw
Cj4gPiBbICAgMzAuOTk1Mzk0XSB4MTU6IDAwMDAwMDAwMDAwMDAwMDQgeDE0OiBmZmZmZmZkMTY3
NWFjNmQwCj4gPiBbICAgMzAuOTk1Mzk1XSB4MTM6IDAwMDAwMDAwMDAwMDAwMDMgeDEyOiAwMDAw
MDAwMDAwMDAwMDAzCj4gPiBbICAgMzAuOTk1Mzk2XSB4MTE6IDAwMDAwMDAwZmZmZmZmZmYgeDEw
OiAwMDAwMDAwMDAwMDAwMDAwCj4gPiBbICAgMzAuOTk1Mzk3XSB4OSA6IDAwMDAwMDAxMDAwMDAw
MDEgeDggOiAwMDAwMDAwMTAwMDAwMDAwCj4gPiBbICAgMzAuOTk1Mzk4XSB4NyA6IDY0Njk2YzYx
NzY1ZjczNjkgeDYgOiBmZmZmZmZkMTY4MTI3OWU4Cj4gPiBbICAgMzAuOTk1Mzk5XSB4NSA6IDAw
MDAwMDAwMDAwMDAwMWYgeDQgOiAwMDAwMDAwMDAwMDAwMDAxCj4gPiBbICAgMzAuOTk1NDAwXSB4
MyA6IDAwMDAwMDAwMDAwMDAwMDAgeDIgOiBmZmZmZmY4OWYwM2RlZGM4Cj4gPiBbICAgMzAuOTk1
NDAxXSB4MSA6IDAwMDAwMDAwMDAwMDAwMDIgeDAgOiBmZmZmZmY4MDQ2MmFhMDAwCj4gPiBbICAg
MzAuOTk1NDAzXSBDYWxsIHRyYWNlOgo+ID4gWyAgIDMwLjk5NTQwNF0gZjJmc19oYW5kbGVfZXJy
b3IrMHgxOC8weDNjCj4gPiBbICAgMzAuOTk1NDA1XSBfX2YyZnNfaXNfdmFsaWRfYmxrYWRkcisw
eDJhNC8weDJiMAo+ID4gWyAgIDMwLjk5NTQwNl0gZjJmc19pc192YWxpZF9ibGthZGRyKzB4MTAv
MHgyMAo+ID4gWyAgIDMwLjk5NTQwN10gZjJmc19yYV9tZXRhX3BhZ2VzKzB4ZTAvMHgyMzAKPiA+
IFsgICAzMC45OTU0MDldIGJ1aWxkX3NpdF9lbnRyaWVzKzB4YTgvMHg1ODAKPiA+IFsgICAzMC45
OTU0MTFdIGYyZnNfYnVpbGRfc2VnbWVudF9tYW5hZ2VyKzB4MTI0LzB4MTcwCj4gPiBbICAgMzAu
OTk1NDEyXSBmMmZzX2ZpbGxfc3VwZXIrMHg3OGMvMHhkMWMKPiA+IFsgICAzMC45OTU0MTVdIG1v
dW50X2JkZXYrMHgxNjgvMHgxYWMKPiA+IFsgICAzMC45OTU0MTZdIGYyZnNfbW91bnQrMHgxOC8w
eDI0Cj4gPiBbICAgMzAuOTk1NDE4XSBsZWdhY3lfZ2V0X3RyZWUubGx2bS45MTQ3ODQ1Nzc5NTU5
NzE1MDgzKzB4MzAvMHg1Ywo+ID4gWyAgIDMwLjk5NTQxOV0gdmZzX2dldF90cmVlKzB4MzAvMHhl
MAo+ID4gWyAgIDMwLjk5NTQyMV0gZG9fbmV3X21vdW50KzB4MTQwLzB4MzU4Cj4gPiBbICAgMzAu
OTk1NDIyXSBwYXRoX21vdW50KzB4MWZjLzB4NGU4Cj4gPiBbICAgMzAuOTk1NDIzXSBfX2FybTY0
X3N5c19tb3VudCsweDE1MC8weDI5NAo+ID4gWyAgIDMwLjk5NTQyNV0gZWwwX3N2Y19jb21tb24u
bGx2bS4xNTY5ODQ1NDk1MjE1NDk2NTc4NysweGE4LzB4MTM4Cj4gPiBbICAgMzAuOTk1NDI2XSBk
b19lbDBfc3ZjKzB4MjQvMHg5MAo+ID4gWyAgIDMwLjk5NTQyOV0gZWwwX3N2YysweDEwLzB4MWMK
PiA+IFsgICAzMC45OTU0MzBdIGVsMF9zeW5jX2hhbmRsZXIrMHhjYy8weGU0Cj4gPiBbICAgMzAu
OTk1NDMyXSBlbDBfc3luYysweDFhMC8weDFjMAo+ID4gWyAgIDMwLjk5NTQzM10gLS0tWyBlbmQg
dHJhY2UgM2I4MzI5NWUwY2RhYzk0ZSBdLS0tCj4gPiBbICAgMzEuMDA1MDExXSBGMkZTLWZzIChz
ZGExMyk6IE1vdW50ZWQgd2l0aCBjaGVja3BvaW50IHZlcnNpb24gPSAyYjdlM2IyOQo+ID4gWyAg
IDMxLjAwNTE3Nl0gaW5pdDogW2xpYmZzX21ncl0KPiA+IF9fbW91bnQoc291cmNlPS9kZXYvYmxv
Y2svYm9vdGRldmljZS9ieS1uYW1lL3VzZXJkYXRhLHRhcmdldD0vZGF0YSx0eXBlPWYyZnMpPTA6
Cj4gPiBTdWNjZXNzCj4gPiBbICAgMzEuMDA3NzQ5XSBpbml0OiBVc2VyZGF0YSBtb3VudGVkIHVz
aW5nIC92ZW5kb3IvZXRjL2ZzdGFiLnFjb20gcmVzdWx0IDogMAo+ID4KPiA+Cj4gPiBJIHdhcyBi
aXNlY3RpbmcgYSBsb25nIGJvb3QgdGltZSAoMjQgYWRkaXRpb25hbCBzZWNvbmRzKSBpc3N1ZSwg
d2hpY2gKPiA+IGlzIGFsd2F5cyByZXByb2R1Y2libGUsIGFuZCBmb3VuZCBjb21taXQgMzFmODVj
Y2M4NGI4ICgiZjJmczogdW5pZnkKPiA+IHRoZSBlcnJvciBoYW5kbGluZyBvZiBmMmZzX2lzX3Zh
bGlkX2Jsa2FkZHIiKSB0byBiZSBjYXVzaW5nIGl0Lgo+ID4KPiA+IEknbGwganVzdCByZXZlcnQg
dGhhdCBwYXRjaCBsb2NhbGx5LiBTZWVtcyBsaWtlIEphZWdldWsncyBkZXYgYnJhbmNoCj4gPiBk
b2Vzbid0IGhhdmUgdGhlIGZpeCBmb3IgdGhpcyBzcGVjaWZpY2FsbHkgeWV0Lgo+ID4KPiA+IFRo
YW5rcy4KPiA+Cj4gPj4KPiA+PiBJIHdhcyB0cnlpbmcgdG8gZGVidWcgYW5vdGhlciBpc3N1ZSwg
YnV0IGZvdW5kIHRoZSByb290IGNhdXNlLiBMZXQgbWUgZHJvcCB0aGlzCj4gPj4gcGF0Y2guCj4g
Pj4KPiA+Pj4KPiA+Pj4gVGhhbmtzLAo+ID4+Pgo+ID4+Pj4KPiA+Pj4+IEZpeGVzOiAzMWY4NWNj
Yzg0YjggKCJmMmZzOiB1bmlmeSB0aGUgZXJyb3IgaGFuZGxpbmcgb2YgZjJmc19pc192YWxpZF9i
bGthZGRyIikKPiA+Pj4+IFNpZ25lZC1vZmYtYnk6IEphZWdldWsgS2ltIDxqYWVnZXVrQGtlcm5l
bC5vcmc+Cj4gPj4+PiAtLS0KPiA+Pj4+ICAgIGZzL2YyZnMvY2hlY2twb2ludC5jIHwgOSArKysr
Ky0tLS0KPiA+Pj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDQgZGVsZXRp
b25zKC0pCj4gPj4+Pgo+ID4+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvY2hlY2twb2ludC5jIGIv
ZnMvZjJmcy9jaGVja3BvaW50LmMKPiA+Pj4+IGluZGV4IGVhYzY5OGI4ZGQzOC4uYjAxMzIwNTAy
NjI0IDEwMDY0NAo+ID4+Pj4gLS0tIGEvZnMvZjJmcy9jaGVja3BvaW50LmMKPiA+Pj4+ICsrKyBi
L2ZzL2YyZnMvY2hlY2twb2ludC5jCj4gPj4+PiBAQCAtMTc5LDIyICsxNzksMjIgQEAgc3RhdGlj
IGJvb2wgX19mMmZzX2lzX3ZhbGlkX2Jsa2FkZHIoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLAo+
ID4+Pj4gICAgICAgICAgICAgIGJyZWFrOwo+ID4+Pj4gICAgICBjYXNlIE1FVEFfU0lUOgo+ID4+
Pj4gICAgICAgICAgICAgIGlmICh1bmxpa2VseShibGthZGRyID49IFNJVF9CTEtfQ05UKHNiaSkp
KQo+ID4+Pj4gLSAgICAgICAgICAgICAgICAgICBnb3RvIGVycjsKPiA+Pj4+ICsgICAgICAgICAg
ICAgICAgICAgZ290byBjaGVja19vbmx5Owo+ID4+Pj4gICAgICAgICAgICAgIGJyZWFrOwo+ID4+
Pj4gICAgICBjYXNlIE1FVEFfU1NBOgo+ID4+Pj4gICAgICAgICAgICAgIGlmICh1bmxpa2VseShi
bGthZGRyID49IE1BSU5fQkxLQUREUihzYmkpIHx8Cj4gPj4+PiAgICAgICAgICAgICAgICAgICAg
ICBibGthZGRyIDwgU01fSShzYmkpLT5zc2FfYmxrYWRkcikpCj4gPj4+PiAtICAgICAgICAgICAg
ICAgICAgIGdvdG8gZXJyOwo+ID4+Pj4gKyAgICAgICAgICAgICAgICAgICBnb3RvIGNoZWNrX29u
bHk7Cj4gPj4+PiAgICAgICAgICAgICAgYnJlYWs7Cj4gPj4+PiAgICAgIGNhc2UgTUVUQV9DUDoK
PiA+Pj4+ICAgICAgICAgICAgICBpZiAodW5saWtlbHkoYmxrYWRkciA+PSBTSVRfSShzYmkpLT5z
aXRfYmFzZV9hZGRyIHx8Cj4gPj4+PiAgICAgICAgICAgICAgICAgICAgICBibGthZGRyIDwgX19z
dGFydF9jcF9hZGRyKHNiaSkpKQo+ID4+Pj4gLSAgICAgICAgICAgICAgICAgICBnb3RvIGVycjsK
PiA+Pj4+ICsgICAgICAgICAgICAgICAgICAgZ290byBjaGVja19vbmx5Owo+ID4+Pj4gICAgICAg
ICAgICAgIGJyZWFrOwo+ID4+Pj4gICAgICBjYXNlIE1FVEFfUE9SOgo+ID4+Pj4gICAgICAgICAg
ICAgIGlmICh1bmxpa2VseShibGthZGRyID49IE1BWF9CTEtBRERSKHNiaSkgfHwKPiA+Pj4+ICAg
ICAgICAgICAgICAgICAgICAgIGJsa2FkZHIgPCBNQUlOX0JMS0FERFIoc2JpKSkpCj4gPj4+PiAt
ICAgICAgICAgICAgICAgICAgIGdvdG8gZXJyOwo+ID4+Pj4gKyAgICAgICAgICAgICAgICAgICBn
b3RvIGNoZWNrX29ubHk7Cj4gPj4+PiAgICAgICAgICAgICAgYnJlYWs7Cj4gPj4+PiAgICAgIGNh
c2UgREFUQV9HRU5FUklDOgo+ID4+Pj4gICAgICBjYXNlIERBVEFfR0VORVJJQ19FTkhBTkNFOgo+
ID4+Pj4gQEAgLTIyOCw2ICsyMjgsNyBAQCBzdGF0aWMgYm9vbCBfX2YyZnNfaXNfdmFsaWRfYmxr
YWRkcihzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksCj4gPj4+PiAgICAgIHJldHVybiB0cnVlOwo+
ID4+Pj4gICAgZXJyOgo+ID4+Pj4gICAgICBmMmZzX2hhbmRsZV9lcnJvcihzYmksIEVSUk9SX0lO
VkFMSURfQkxLQUREUik7Cj4gPj4+PiArY2hlY2tfb25seToKPiA+Pj4+ICAgICAgcmV0dXJuIGZh
bHNlOwo+ID4+Pj4gICAgfQo+ID4+Cj4gPj4KPiA+PiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+ID4+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0
Cj4gPj4gTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPiA+PiBodHRwczov
L2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCj4K
Pgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTGlu
dXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJj
ZWZvcmdlLm5ldAo+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZv
L2xpbnV4LWYyZnMtZGV2ZWwKCkkgaGF2ZSBhIHF1ZXN0aW9uLiBJcyBpdCBva2F5IGZvciBNRVRB
X0dFTkVSSUM/CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5z
b3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGlu
Zm8vbGludXgtZjJmcy1kZXZlbAo=
