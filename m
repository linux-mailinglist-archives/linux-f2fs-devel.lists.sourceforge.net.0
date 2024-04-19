Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B12398AACCB
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 19 Apr 2024 12:27:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rxlT9-0005o0-97;
	Fri, 19 Apr 2024 10:27:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qkrwngud825@gmail.com>) id 1rxlT7-0005nt-Bd
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 Apr 2024 10:27:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ymktnwao7az+LFVgnqD7jFOZn9xsvS/2Wg2WVoxC6nM=; b=IGOoLiLtAm5yh3FQDhJA0uH5PM
 /GITAfQp8lMnpABV6D2e6Ec27NVSoxSCJJnj+GSWFcJfpTbN6u9DKAjqb+ne0ZBUOGlryLByOImyP
 FU74QacHOH/Yz8rtz1DgIIVbB243TX5AksDmPlIoWnk+3TEKxaFGZbVlmAwsl0Q4iBao=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ymktnwao7az+LFVgnqD7jFOZn9xsvS/2Wg2WVoxC6nM=; b=Gr2NijH9EfoBLHUoF3NQnLueVd
 IDpxX2AGK5Okrrc7G8ZtwOEEpBYZ8BdHwH+WVgGM9BqPCyg88/9NiWwQd65orBpc/IPn5EJ9W90u5
 5Snvymdx5j9leK+C97fIxRhdlgk5sdksyCryujRT0AhJZ3X2aa9pYDZaboVoPnh+oX38=;
Received: from mail-ed1-f44.google.com ([209.85.208.44])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rxlT5-0004mH-CQ for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 Apr 2024 10:27:44 +0000
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-56e1f3462caso2387282a12.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 19 Apr 2024 03:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713522452; x=1714127252; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ymktnwao7az+LFVgnqD7jFOZn9xsvS/2Wg2WVoxC6nM=;
 b=L5vnTJOGunyGSFSRwlcDaUzUf1pB4W6G7FHcW+Hbhx2UVu0/0lXtadFeWpnvI+um0b
 yggiK8eKGSQUJNe/eFZMj8oYmrBnw91H8a0o3JS2eQ0bl6Eh2u+LR0O/AxF9Y6szgHMZ
 FxsH6UZBMfiEhdwcdfJa5hALq1x4/bXesNIJwKMXnkdOyX00MWT1t5UHlYMAm/juwQzx
 xog2UT1NmIAMeW61AogHs7IFEwXLIqSTZZeW7GjVkhMIBG5C2BGittH5C8HvJvJgIBeU
 Pt4mbs2tlwZj7/m9fOUIiBhpxMubw5SRP+XDEepttKKYnHXdVO+mdbViwVTf9fOeF1E6
 dvJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713522452; x=1714127252;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ymktnwao7az+LFVgnqD7jFOZn9xsvS/2Wg2WVoxC6nM=;
 b=PsoeW8+BEDoFedwxVqJ8zBH+T3K8MqpK/VinWNu6udETeHiKHAKblzAZ8pcSAysWky
 KDgiXU3PpY5DWrfCCAbsqZW4M14W+l6EI04+zhIvcC1UP0S/8P6qj8+iXJ21kQIPdLJo
 NxGwB6WLdLn/xAxK5o6EWwgRLU8Y0b9BPtVLeSsMiOgXhy6Fr8Jc+hWdHGY033+rNji1
 Wtysyvh4X5BVV0/7QAFaOB8LMGSEUed9j93dOMjh9EvOz3W6bLL/mdHBSpUQ8Re69pik
 SaIFXXCEN4xPyNfMO4k6HdYNnMqEMW1R4SbPwz7Ox5HX5iHsKWZu8jw32q1BFTXG4oXj
 pWIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+6u0NArTDDkbUjJB27TAH+5ZJcsQxCoalmb58jCA5yUe3nxCyyfMo+ASpjoQ9kx9cV/8bP4A+qFNWm66VexrARTaXqmAxCyn/8/49pCxenqrcKlwfug==
X-Gm-Message-State: AOJu0YzO37oU/QtALerX/pfJojcj9S9HDnvOjeWBHOiTM/qxxwSvlTLW
 DDAamFlenRNNJA52Aile+EaK/otavbIt0jtsikVmxop/BFr2s03NVaCiYUKUEOFjMNUFUphQOPl
 +b/xohYonh0hGkhJ0U2GlXLgOdXPsesxK
X-Google-Smtp-Source: AGHT+IGNgyYc3Ns8gPxZxDY0qvdByFCwb6qp9WjshdssbYI1zEO97pv9KF5rehMhOHBnSyL86mcxAo8wECu8xQfQNKQ=
X-Received: by 2002:a17:906:7fc6:b0:a52:3f01:e11d with SMTP id
 r6-20020a1709067fc600b00a523f01e11dmr1268730ejs.34.1713522452118; Fri, 19 Apr
 2024 03:27:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240409203411.1885121-1-jaegeuk@kernel.org>
 <20240409203411.1885121-3-jaegeuk@kernel.org>
 <050a93dc-d9a8-44bd-9a83-83718e95f04d@kernel.org>
 <Zhmf4klcOr4eplin@google.com>
In-Reply-To: <Zhmf4klcOr4eplin@google.com>
From: Juhyung Park <qkrwngud825@gmail.com>
Date: Fri, 19 Apr 2024 19:27:20 +0900
Message-ID: <CAD14+f0Scnc1GTjqR1izHqPerCqgHsLMR9mfKocUxw_4hyZ+Zg@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -4.0 (----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Sat, Apr 13, 2024 at 5:57 AM Jaegeuk Kim wrote: > > On
    04/11, Chao Yu wrote: > > On 2024/4/10 4:34, Jaegeuk Kim wrote: > > > f2fs_ra_meta_pages
    can try to read ahead on invalid block address wh [...] 
 
 Content analysis details:   (-4.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
  1.0 HK_RANDOM_FROM         From username looks random
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [qkrwngud825[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [qkrwngud825[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.208.44 listed in wl.mailspike.net]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [209.85.208.44 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
X-Headers-End: 1rxlT5-0004mH-CQ
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gU2F0LCBBcHIgMTMsIDIwMjQgYXQgNTo1N+KAr0FNIEphZWdldWsgS2ltIDxqYWVnZXVrQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gMDQvMTEsIENoYW8gWXUgd3JvdGU6Cj4gPiBPbiAyMDI0
LzQvMTAgNDozNCwgSmFlZ2V1ayBLaW0gd3JvdGU6Cj4gPiA+IGYyZnNfcmFfbWV0YV9wYWdlcyBj
YW4gdHJ5IHRvIHJlYWQgYWhlYWQgb24gaW52YWxpZCBibG9jayBhZGRyZXNzIHdoaWNoIGlzCj4g
PiA+IG5vdCB0aGUgY29ycnVwdGlvbiBjYXNlLgo+ID4KPiA+IEluIHdoaWNoIGNhc2Ugd2Ugd2ls
bCByZWFkIGFoZWFkIGludmFsaWQgbWV0YSBwYWdlcz8gcmVjb3Zlcnkgdy8gTUVUQV9QT1I/CgpJ
biBteSBjYXNlLCBpdCBzZWVtcyBsaWtlIGl0J3MgTUVUQV9TSVQsIGFuZCBpdCdzIHRyaWdnZXJl
ZCByaWdodCBhZnRlciBtb3VudC4KZnNjayBkZXRlY3RzIGludmFsaWRfYmxrYWRkciwgYW5kIHdo
ZW4gdGhlIGtlcm5lbCBtb3VudHMgaXQsIGl0CmltbWVkaWF0ZWx5IGZsYWdzIGludmFsaWRfYmxr
YWRkciBhZ2FpbjoKClsgICAgNi4zMzM0OThdIGluaXQ6IFtsaWJmc19tZ3JdIFJ1bm5pbmcgL3N5
c3RlbS9iaW4vZnNjay5mMmZzIC1hIC1jCjEwMDAwIC0tZGVidWctY2FjaGUgL2Rldi9ibG9jay9z
ZGExMwpbICAgIDYuMzM3NjcxXSBmc2NrLmYyZnM6IEluZm86IEZpeCB0aGUgcmVwb3J0ZWQgY29y
cnVwdGlvbi4KWyAgICA2LjMzNzk0N10gZnNjay5mMmZzOiBJbmZvOiBub3QgZXhpc3QgL3Byb2Mv
dmVyc2lvbiEKWyAgICA2LjMzODAxMF0gZnNjay5mMmZzOiBJbmZvOiBjYW4ndCBmaW5kIC9zeXMs
IGFzc3VtaW5nIG5vcm1hbCBibG9jayBkZXZpY2UKWyAgICA2LjMzODI5NF0gZnNjay5mMmZzOiBJ
bmZvOiBNS0ZTIHZlcnNpb24KWyAgICA2LjMzODMxOV0gZnNjay5mMmZzOiAgICI1LjEwLjE2MC1h
bmRyb2lkMTItOS1nZTVjZmVjNDFjOGUyIgpbICAgIDYuMzM4MzY2XSBmc2NrLmYyZnM6IEluZm86
IEZTQ0sgdmVyc2lvbgpbICAgIDYuMzM4MzgwXSBmc2NrLmYyZnM6ICAgZnJvbSAiNS4xMC1hcnRl
cjk3IgpbICAgIDYuMzM4MzkzXSBmc2NrLmYyZnM6ICAgICB0byAiNS4xMC1hcnRlcjk3IgpbICAg
IDYuMzM4NDE0XSBmc2NrLmYyZnM6IEluZm86IHN1cGVyYmxvY2sgZmVhdHVyZXMgPSAxNDk5IDog
IGVuY3J5cHQKdmVyaXR5IGV4dHJhX2F0dHIgcHJvamVjdF9xdW90YSBxdW90YV9pbm8gY2FzZWZv
bGQKWyAgICA2LjMzODQyOV0gZnNjay5mMmZzOiBJbmZvOiBzdXBlcmJsb2NrIGVuY3J5cHQgbGV2
ZWwgPSAwLCBzYWx0ID0KMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAKWyAgICA2LjMz
ODQ0Ml0gZnNjay5mMmZzOiBJbmZvOiBjaGVja3BvaW50IHN0b3AgcmVhc29uOiBzaHV0ZG93bigx
ODApClsgICAgNi4zMzg0NTVdIGZzY2suZjJmczogSW5mbzogZnMgZXJyb3JzOiBpbnZhbGlkX2Js
a2FkZHIKWyAgICA2LjMzODQ2OF0gZnNjay5mMmZzOiBJbmZvOiBTZWdtZW50cyBwZXIgc2VjdGlv
biA9IDEKWyAgICA2LjMzODQ4MF0gZnNjay5mMmZzOiBJbmZvOiBTZWN0aW9ucyBwZXIgem9uZSA9
IDEKWyAgICA2LjMzODQ5Ml0gZnNjay5mMmZzOiBJbmZvOiB0b3RhbCBGUyBzZWN0b3JzID0gNTg5
NzE1NzEgKDIzMDM1NyBNQikKWyAgICA2LjM0MDU5OV0gZnNjay5mMmZzOiBJbmZvOiBDS1BUIHZl
cnNpb24gPSAyYjdlM2IyOQpbICAgIDYuMzQwNjIwXSBmc2NrLmYyZnM6IEluZm86IHZlcnNpb24g
dGltZXN0YW1wIGN1cjogMTk3ODkyOTYsIHByZXY6IDE4NDA3MDA4ClsgICAgNi42NzcwNDFdIGZz
Y2suZjJmczogSW5mbzogY2hlY2twb2ludCBzdGF0ZSA9IDQ2IDogIGNyYwpjb21wYWN0ZWRfc3Vt
bWFyeSBvcnBoYW5faW5vZGVzIHN1ZGRlbi1wb3dlci1vZmYKWyAgICA2LjY3NzA1Ml0gZnNjay5m
MmZzOiBbRlNDS10gQ2hlY2sgbm9kZSAxIC8gNzEyOTM3ICgwLjAwJSkKWyAgICA4Ljk5NzkyMl0g
ZnNjay5mMmZzOiBbRlNDS10gQ2hlY2sgbm9kZSA3MTI5NCAvIDcxMjkzNyAoMTAuMDAlKQpbICAg
MTAuNjI5MjA1XSBmc2NrLmYyZnM6IFtGU0NLXSBDaGVjayBub2RlIDE0MjU4NyAvIDcxMjkzNyAo
MjAuMDAlKQpbICAgMTIuMjc4MTg2XSBmc2NrLmYyZnM6IFtGU0NLXSBDaGVjayBub2RlIDIxMzg4
MCAvIDcxMjkzNyAoMzAuMDAlKQpbICAgMTMuNzY4MTc3XSBmc2NrLmYyZnM6IFtGU0NLXSBDaGVj
ayBub2RlIDI4NTE3MyAvIDcxMjkzNyAoNDAuMDAlKQpbICAgMTcuNDQ2OTcxXSBmc2NrLmYyZnM6
IFtGU0NLXSBDaGVjayBub2RlIDM1NjQ2NiAvIDcxMjkzNyAoNTAuMDAlKQpbICAgMTkuODkxNjIz
XSBmc2NrLmYyZnM6IFtGU0NLXSBDaGVjayBub2RlIDQyNzc1OSAvIDcxMjkzNyAoNjAuMDAlKQpb
ICAgMjMuMjUxMzI3XSBmc2NrLmYyZnM6IFtGU0NLXSBDaGVjayBub2RlIDQ5OTA1MiAvIDcxMjkz
NyAoNzAuMDAlKQpbICAgMjguNDkzNDU3XSBmc2NrLmYyZnM6IFtGU0NLXSBDaGVjayBub2RlIDU3
MDM0NSAvIDcxMjkzNyAoODAuMDAlKQpbICAgMjkuNjQwODAwXSBmc2NrLmYyZnM6IFtGU0NLXSBD
aGVjayBub2RlIDY0MTYzOCAvIDcxMjkzNyAoOTAuMDAlKQpbICAgMzAuNzE4MzQ3XSBmc2NrLmYy
ZnM6IFtGU0NLXSBDaGVjayBub2RlIDcxMjkzMSAvIDcxMjkzNyAoMTAwLjAwJSkKWyAgIDMwLjcy
NDE3Nl0gZnNjay5mMmZzOgpbICAgMzAuNzM3MTYwXSBmc2NrLmYyZnM6IFtGU0NLXSBNYXggaW1h
Z2Ugc2l6ZTogMTY3NTA2IE1CLCBGcmVlIHNwYWNlOiA2Mjg1MCBNQgpbICAgMzAuNzM3MTY0XSBm
c2NrLmYyZnM6IFtGU0NLXSBVbnJlYWNoYWJsZSBuYXQgZW50cmllcwogICAgICAgICBbT2suLl0g
WzB4MF0KWyAgIDMwLjczNzYzOF0gZnNjay5mMmZzOiBbRlNDS10gU0lUIHZhbGlkIGJsb2NrIGJp
dG1hcCBjaGVja2luZwogICAgICAgICBbT2suLl0KWyAgIDMwLjczNzY0MF0gZnNjay5mMmZzOiBb
RlNDS10gSGFyZCBsaW5rIGNoZWNraW5nIGZvciByZWd1bGFyIGZpbGUKICAgICAgICAgW09rLi5d
IFsweGRdClsgICAzMC43Mzc2NDFdIGZzY2suZjJmczogW0ZTQ0tdIHZhbGlkX2Jsb2NrX2NvdW50
IG1hdGNoaW5nIHdpdGggQ1AKICAgICAgICAgW09rLi5dIFsweDI4Yjk4ZTZdClsgICAzMC43Mzc2
NDRdIGZzY2suZjJmczogW0ZTQ0tdIHZhbGlkX25vZGVfY291bnQgbWF0Y2hpbmcgd2l0aCBDUCAo
ZGUKbG9va3VwKSAgW09rLi5dIFsweGFlMGU5XQpbICAgMzAuNzM3NjQ2XSBmc2NrLmYyZnM6IFtG
U0NLXSB2YWxpZF9ub2RlX2NvdW50IG1hdGNoaW5nIHdpdGggQ1AKKG5hdCBsb29rdXApIFtPay4u
XSBbMHhhZTBlOV0KWyAgIDMwLjczNzY0N10gZnNjay5mMmZzOiBbRlNDS10gdmFsaWRfaW5vZGVf
Y291bnQgbWF0Y2hlZCB3aXRoIENQCiAgICAgICAgIFtPay4uXSBbMHhhNzRhM10KWyAgIDMwLjcz
NzY0OV0gZnNjay5mMmZzOiBbRlNDS10gZnJlZSBzZWdtZW50X2NvdW50IG1hdGNoZWQgd2l0aCBD
UAogICAgICAgICBbT2suLl0gWzB4N2FhM10KWyAgIDMwLjczNzY2Ml0gZnNjay5mMmZzOiBbRlND
S10gbmV4dCBibG9jayBvZmZzZXQgaXMgZnJlZQogICAgICAgICBbT2suLl0KWyAgIDMwLjczNzY2
M10gZnNjay5mMmZzOiBbRlNDS10gZml4aW5nIFNJVCB0eXBlcwpbICAgMzAuNzM3ODY3XSBmc2Nr
LmYyZnM6IFtGU0NLXSBvdGhlciBjb3JydXB0ZWQgYnVncwogICAgICAgICBbT2suLl0KWyAgIDMw
LjczNzg5M10gZnNjay5mMmZzOiBbdXBkYXRlX3N1cGVyYmxvY2s6IDc2NV0gSW5mbzogRG9uZSB0
bwp1cGRhdGUgc3VwZXJibG9jawpbICAgMzAuOTYwNjEwXSBmc2NrLmYyZnM6ClsgICAzMC45NjA2
MThdIGZzY2suZjJmczogRG9uZTogMjQuNjIyOTU2IHNlY3MKWyAgIDMwLjk2MDYyMF0gZnNjay5m
MmZzOgpbICAgMzAuOTYwNjIyXSBmc2NrLmYyZnM6IGMsIHUsIFJBLCBDSCwgQ00sIFJlcGw9Clsg
ICAzMC45NjA2MjddIGZzY2suZjJmczogMTAwMDAgMTAwMDAgNDM2MDA1MTcgNDI2MDU0MzQgOTk1
MDgzIDk4NTA4MwpbICAgMzAuOTYzMjc0XSBGMkZTLWZzIChzZGExMyk6IFVzaW5nIGVuY29kaW5n
IGRlZmluZWQgYnkgc3VwZXJibG9jazoKdXRmOC0xMi4xLjAgd2l0aCBmbGFncyAweDAKWyAgIDMw
Ljk5NTM2MF0gX19mMmZzX2lzX3ZhbGlkX2Jsa2FkZHI6IHR5cGU9MgoKKE1hbnVhbGx5IGFkZGVk
IHRoYXQgcHJpbnQgXikKClsgICAzMC45OTUzNjldIC0tLS0tLS0tLS0tLVsgY3V0IGhlcmUgXS0t
LS0tLS0tLS0tLQpbICAgMzAuOTk1Mzc1XSBXQVJOSU5HOiBDUFU6IDcgUElEOiAxIGF0IGYyZnNf
aGFuZGxlX2Vycm9yKzB4MTgvMHgzYwpbICAgMzAuOTk1Mzc4XSBDUFU6IDcgUElEOiAxIENvbW06
IGluaXQgVGFpbnRlZDogRyBTICAgICAgVwo1LjEwLjIwOS1hcnRlcjk3LXIxNS1rZXJuZWxzdS1n
MDg2N2QwZTRmMWQyICM2ClsgICAzMC45OTUzNzldIEhhcmR3YXJlIG5hbWU6IFF1YWxjb21tIFRl
Y2hub2xvZ2llcywgSW5jLiBDYXBlIFFSRAp3aXRoIFBNODAxMCAoRFQpClsgICAzMC45OTUzODBd
IHBzdGF0ZTogMjI0MDAwMDUgKG56Q3YgZGFpZiArUEFOIC1VQU8gK1RDTyBCVFlQRT0tLSkKWyAg
IDMwLjk5NTM4Ml0gcGMgOiBmMmZzX2hhbmRsZV9lcnJvcisweDE4LzB4M2MKWyAgIDMwLjk5NTM4
NF0gbHIgOiBfX2YyZnNfaXNfdmFsaWRfYmxrYWRkcisweDJhNC8weDJiMApbICAgMzAuOTk1Mzg1
XSBzcCA6IGZmZmZmZjgwMjA5ZTc5YjAKWyAgIDMwLjk5NTM4Nl0geDI5OiBmZmZmZmY4MDIwOWU3
OWIwIHgyODogMDAwMDAwMDAwMDAwMDAzNwpbICAgMzAuOTk1Mzg4XSB4Mjc6IDAwMDAwMDAwMDAw
MDAxYzcgeDI2OiAwMDAwMDAwMDIwMTIwMTIxClsgICAzMC45OTUzODldIHgyNTogMDAwMDAwMDAw
MDAwMDBkOSB4MjQ6IDAwMDAwMDAwMDAwMDAwMDAKWyAgIDMwLjk5NTM5MF0geDIzOiBmZmZmZmZm
ZjAwZjFhNzAwIHgyMjogMDAwMDAwMDAwMDAwMDgyOApbICAgMzAuOTk1MzkxXSB4MjE6IGZmZmZm
ZjgwNDYyYWEwMDAgeDIwOiBmZmZmZmY4MDQ2MmFhMDAwClsgICAzMC45OTUzOTJdIHgxOTogMDAw
MDAwMDAwMDAwMDAwMiB4MTg6IGZmZmZmZmZmZmZmZmZmZmYKWyAgIDMwLjk5NTM5M10geDE3OiAw
MDAwMDAwMDAwMDAwMDAwIHgxNjogMDAwMDAwMDBmZmZmMDAwMApbICAgMzAuOTk1Mzk0XSB4MTU6
IDAwMDAwMDAwMDAwMDAwMDQgeDE0OiBmZmZmZmZkMTY3NWFjNmQwClsgICAzMC45OTUzOTVdIHgx
MzogMDAwMDAwMDAwMDAwMDAwMyB4MTI6IDAwMDAwMDAwMDAwMDAwMDMKWyAgIDMwLjk5NTM5Nl0g
eDExOiAwMDAwMDAwMGZmZmZmZmZmIHgxMDogMDAwMDAwMDAwMDAwMDAwMApbICAgMzAuOTk1Mzk3
XSB4OSA6IDAwMDAwMDAxMDAwMDAwMDEgeDggOiAwMDAwMDAwMTAwMDAwMDAwClsgICAzMC45OTUz
OThdIHg3IDogNjQ2OTZjNjE3NjVmNzM2OSB4NiA6IGZmZmZmZmQxNjgxMjc5ZTgKWyAgIDMwLjk5
NTM5OV0geDUgOiAwMDAwMDAwMDAwMDAwMDFmIHg0IDogMDAwMDAwMDAwMDAwMDAwMQpbICAgMzAu
OTk1NDAwXSB4MyA6IDAwMDAwMDAwMDAwMDAwMDAgeDIgOiBmZmZmZmY4OWYwM2RlZGM4ClsgICAz
MC45OTU0MDFdIHgxIDogMDAwMDAwMDAwMDAwMDAwMiB4MCA6IGZmZmZmZjgwNDYyYWEwMDAKWyAg
IDMwLjk5NTQwM10gQ2FsbCB0cmFjZToKWyAgIDMwLjk5NTQwNF0gZjJmc19oYW5kbGVfZXJyb3Ir
MHgxOC8weDNjClsgICAzMC45OTU0MDVdIF9fZjJmc19pc192YWxpZF9ibGthZGRyKzB4MmE0LzB4
MmIwClsgICAzMC45OTU0MDZdIGYyZnNfaXNfdmFsaWRfYmxrYWRkcisweDEwLzB4MjAKWyAgIDMw
Ljk5NTQwN10gZjJmc19yYV9tZXRhX3BhZ2VzKzB4ZTAvMHgyMzAKWyAgIDMwLjk5NTQwOV0gYnVp
bGRfc2l0X2VudHJpZXMrMHhhOC8weDU4MApbICAgMzAuOTk1NDExXSBmMmZzX2J1aWxkX3NlZ21l
bnRfbWFuYWdlcisweDEyNC8weDE3MApbICAgMzAuOTk1NDEyXSBmMmZzX2ZpbGxfc3VwZXIrMHg3
OGMvMHhkMWMKWyAgIDMwLjk5NTQxNV0gbW91bnRfYmRldisweDE2OC8weDFhYwpbICAgMzAuOTk1
NDE2XSBmMmZzX21vdW50KzB4MTgvMHgyNApbICAgMzAuOTk1NDE4XSBsZWdhY3lfZ2V0X3RyZWUu
bGx2bS45MTQ3ODQ1Nzc5NTU5NzE1MDgzKzB4MzAvMHg1YwpbICAgMzAuOTk1NDE5XSB2ZnNfZ2V0
X3RyZWUrMHgzMC8weGUwClsgICAzMC45OTU0MjFdIGRvX25ld19tb3VudCsweDE0MC8weDM1OApb
ICAgMzAuOTk1NDIyXSBwYXRoX21vdW50KzB4MWZjLzB4NGU4ClsgICAzMC45OTU0MjNdIF9fYXJt
NjRfc3lzX21vdW50KzB4MTUwLzB4Mjk0ClsgICAzMC45OTU0MjVdIGVsMF9zdmNfY29tbW9uLmxs
dm0uMTU2OTg0NTQ5NTIxNTQ5NjU3ODcrMHhhOC8weDEzOApbICAgMzAuOTk1NDI2XSBkb19lbDBf
c3ZjKzB4MjQvMHg5MApbICAgMzAuOTk1NDI5XSBlbDBfc3ZjKzB4MTAvMHgxYwpbICAgMzAuOTk1
NDMwXSBlbDBfc3luY19oYW5kbGVyKzB4Y2MvMHhlNApbICAgMzAuOTk1NDMyXSBlbDBfc3luYysw
eDFhMC8weDFjMApbICAgMzAuOTk1NDMzXSAtLS1bIGVuZCB0cmFjZSAzYjgzMjk1ZTBjZGFjOTRl
IF0tLS0KWyAgIDMxLjAwNTAxMV0gRjJGUy1mcyAoc2RhMTMpOiBNb3VudGVkIHdpdGggY2hlY2tw
b2ludCB2ZXJzaW9uID0gMmI3ZTNiMjkKWyAgIDMxLjAwNTE3Nl0gaW5pdDogW2xpYmZzX21ncl0K
X19tb3VudChzb3VyY2U9L2Rldi9ibG9jay9ib290ZGV2aWNlL2J5LW5hbWUvdXNlcmRhdGEsdGFy
Z2V0PS9kYXRhLHR5cGU9ZjJmcyk9MDoKU3VjY2VzcwpbICAgMzEuMDA3NzQ5XSBpbml0OiBVc2Vy
ZGF0YSBtb3VudGVkIHVzaW5nIC92ZW5kb3IvZXRjL2ZzdGFiLnFjb20gcmVzdWx0IDogMAoKCkkg
d2FzIGJpc2VjdGluZyBhIGxvbmcgYm9vdCB0aW1lICgyNCBhZGRpdGlvbmFsIHNlY29uZHMpIGlz
c3VlLCB3aGljaAppcyBhbHdheXMgcmVwcm9kdWNpYmxlLCBhbmQgZm91bmQgY29tbWl0IDMxZjg1
Y2NjODRiOCAoImYyZnM6IHVuaWZ5CnRoZSBlcnJvciBoYW5kbGluZyBvZiBmMmZzX2lzX3ZhbGlk
X2Jsa2FkZHIiKSB0byBiZSBjYXVzaW5nIGl0LgoKSSdsbCBqdXN0IHJldmVydCB0aGF0IHBhdGNo
IGxvY2FsbHkuIFNlZW1zIGxpa2UgSmFlZ2V1aydzIGRldiBicmFuY2gKZG9lc24ndCBoYXZlIHRo
ZSBmaXggZm9yIHRoaXMgc3BlY2lmaWNhbGx5IHlldC4KClRoYW5rcy4KCj4KPiBJIHdhcyB0cnlp
bmcgdG8gZGVidWcgYW5vdGhlciBpc3N1ZSwgYnV0IGZvdW5kIHRoZSByb290IGNhdXNlLiBMZXQg
bWUgZHJvcCB0aGlzCj4gcGF0Y2guCj4KPiA+Cj4gPiBUaGFua3MsCj4gPgo+ID4gPgo+ID4gPiBG
aXhlczogMzFmODVjY2M4NGI4ICgiZjJmczogdW5pZnkgdGhlIGVycm9yIGhhbmRsaW5nIG9mIGYy
ZnNfaXNfdmFsaWRfYmxrYWRkciIpCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEphZWdldWsgS2ltIDxq
YWVnZXVrQGtlcm5lbC5vcmc+Cj4gPiA+IC0tLQo+ID4gPiAgIGZzL2YyZnMvY2hlY2twb2ludC5j
IHwgOSArKysrKy0tLS0KPiA+ID4gICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA0
IGRlbGV0aW9ucygtKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9jaGVja3BvaW50
LmMgYi9mcy9mMmZzL2NoZWNrcG9pbnQuYwo+ID4gPiBpbmRleCBlYWM2OThiOGRkMzguLmIwMTMy
MDUwMjYyNCAxMDA2NDQKPiA+ID4gLS0tIGEvZnMvZjJmcy9jaGVja3BvaW50LmMKPiA+ID4gKysr
IGIvZnMvZjJmcy9jaGVja3BvaW50LmMKPiA+ID4gQEAgLTE3OSwyMiArMTc5LDIyIEBAIHN0YXRp
YyBib29sIF9fZjJmc19pc192YWxpZF9ibGthZGRyKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwK
PiA+ID4gICAgICAgICAgICAgYnJlYWs7Cj4gPiA+ICAgICBjYXNlIE1FVEFfU0lUOgo+ID4gPiAg
ICAgICAgICAgICBpZiAodW5saWtlbHkoYmxrYWRkciA+PSBTSVRfQkxLX0NOVChzYmkpKSkKPiA+
ID4gLSAgICAgICAgICAgICAgICAgICBnb3RvIGVycjsKPiA+ID4gKyAgICAgICAgICAgICAgICAg
ICBnb3RvIGNoZWNrX29ubHk7Cj4gPiA+ICAgICAgICAgICAgIGJyZWFrOwo+ID4gPiAgICAgY2Fz
ZSBNRVRBX1NTQToKPiA+ID4gICAgICAgICAgICAgaWYgKHVubGlrZWx5KGJsa2FkZHIgPj0gTUFJ
Tl9CTEtBRERSKHNiaSkgfHwKPiA+ID4gICAgICAgICAgICAgICAgICAgICBibGthZGRyIDwgU01f
SShzYmkpLT5zc2FfYmxrYWRkcikpCj4gPiA+IC0gICAgICAgICAgICAgICAgICAgZ290byBlcnI7
Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgZ290byBjaGVja19vbmx5Owo+ID4gPiAgICAgICAg
ICAgICBicmVhazsKPiA+ID4gICAgIGNhc2UgTUVUQV9DUDoKPiA+ID4gICAgICAgICAgICAgaWYg
KHVubGlrZWx5KGJsa2FkZHIgPj0gU0lUX0koc2JpKS0+c2l0X2Jhc2VfYWRkciB8fAo+ID4gPiAg
ICAgICAgICAgICAgICAgICAgIGJsa2FkZHIgPCBfX3N0YXJ0X2NwX2FkZHIoc2JpKSkpCj4gPiA+
IC0gICAgICAgICAgICAgICAgICAgZ290byBlcnI7Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAg
Z290byBjaGVja19vbmx5Owo+ID4gPiAgICAgICAgICAgICBicmVhazsKPiA+ID4gICAgIGNhc2Ug
TUVUQV9QT1I6Cj4gPiA+ICAgICAgICAgICAgIGlmICh1bmxpa2VseShibGthZGRyID49IE1BWF9C
TEtBRERSKHNiaSkgfHwKPiA+ID4gICAgICAgICAgICAgICAgICAgICBibGthZGRyIDwgTUFJTl9C
TEtBRERSKHNiaSkpKQo+ID4gPiAtICAgICAgICAgICAgICAgICAgIGdvdG8gZXJyOwo+ID4gPiAr
ICAgICAgICAgICAgICAgICAgIGdvdG8gY2hlY2tfb25seTsKPiA+ID4gICAgICAgICAgICAgYnJl
YWs7Cj4gPiA+ICAgICBjYXNlIERBVEFfR0VORVJJQzoKPiA+ID4gICAgIGNhc2UgREFUQV9HRU5F
UklDX0VOSEFOQ0U6Cj4gPiA+IEBAIC0yMjgsNiArMjI4LDcgQEAgc3RhdGljIGJvb2wgX19mMmZz
X2lzX3ZhbGlkX2Jsa2FkZHIoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLAo+ID4gPiAgICAgcmV0
dXJuIHRydWU7Cj4gPiA+ICAgZXJyOgo+ID4gPiAgICAgZjJmc19oYW5kbGVfZXJyb3Ioc2JpLCBF
UlJPUl9JTlZBTElEX0JMS0FERFIpOwo+ID4gPiArY2hlY2tfb25seToKPiA+ID4gICAgIHJldHVy
biBmYWxzZTsKPiA+ID4gICB9Cj4KPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPiBMaW51eC1m
MmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9y
Z2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcg
bGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3Rz
LnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
