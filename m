Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B088453C20B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  3 Jun 2022 04:12:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nwwnU-00036w-Js; Fri, 03 Jun 2022 02:12:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <fengnanchang@gmail.com>) id 1nwwnT-00036q-Mj
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 03 Jun 2022 02:12:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=E03GHyPZBERDifUJjSJrBufnixEUpf1+BDfjdk0CrLQ=; b=MQC7unMYOyEl9RFEEUBuTJJCo4
 IVfWReXcAAdTW+bl30N4KYpCUMrW3V4OpeBd6FJ95MxWZwnzpZcTXrNkk3Im3YwvovqAvC1dlw4OJ
 eTknZg7035CaxVnuIjf5FVRrYogBQ84W0l0nnNJmGxRrItI7gGa7hlxOh7JuvadKZf2c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=E03GHyPZBERDifUJjSJrBufnixEUpf1+BDfjdk0CrLQ=; b=QrYB3jPzL0sfjUXdMOAI9K0Eyw
 dC4G0dv39jGQcMIE3sCDnTAqHjFtC4ug09qLGfqceT2DeqO9gI4kZRHE9oL581oELqTQiLhyvsoqK
 XoWNszlMZz8ZLO6mDeiKm8wvwrczDp9uQsJc/Xn1yv3qy8Jw1VBMGGqiAQclSndNg/K0=;
Received: from mail-lf1-f42.google.com ([209.85.167.42])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nwwnT-0031y8-8Y
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 03 Jun 2022 02:12:19 +0000
Received: by mail-lf1-f42.google.com with SMTP id a15so10496735lfb.9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 02 Jun 2022 19:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=E03GHyPZBERDifUJjSJrBufnixEUpf1+BDfjdk0CrLQ=;
 b=gbvrqG2RFUeC8KBdQlLwq+9J1hqQuUJoH/Huct91eM0Os1L63tXKYqfOoJpGqBruII
 eS5/wh/Ad4hcsokwLdR4Y89KG5mrJ+PO60blJlDWeUPPeHQ2hDohNayXqedkxNz39BaQ
 02Dwqvzx2+wNpD1l+zDnnhiV5vE3ThgvplaeSWmpQw1DJSDWM/vjNPuotdtdLdYiYRKJ
 e0Up6BjnWz1N68GF89nF94dIWNmJx/w7TA5ybv+rDDBy49iek4pV06ZqkdnyO+DsgvNv
 cyFCtvW3nPjH7xGQKXKWG8KdCewwF06JnN0UTrdLrRQLUREgLni0Y/DL87U8dcIS6DUX
 DAOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=E03GHyPZBERDifUJjSJrBufnixEUpf1+BDfjdk0CrLQ=;
 b=PaKR+J/3cI48lFblxBRoeOQutzBq2DcAxM8QUkU14NG8kQHygYHAUrdrezMsOb+o0n
 DfaZhAQNCj6V1LyozUIAkIEaAIVR/6yHkf6tb4p/mZG4kgczJcH+oDxA9rOqK5szVoHN
 OKhSG6ZGtesbqHhrdew9w08eyZKdNwVSB01wsYXpgvlMg6xJl3WK3FO4Ag/LO8MdABXv
 1IWggdB35j878gxQkHldvdLtXd+9+PYKJED4yzko+qoBoWgcPaQq5QJxqExmGpPbzCMo
 5VLUoE4mpcxPMP9YZbYRRWt8RJGtV9KntIpISWD4Yj121zcJlJq0x1/MlE2ha2bHvcN0
 kLUw==
X-Gm-Message-State: AOAM530VVhaCh3KS7q/2ECpAuJvUmcRL8CS05ABBpHpinfAoYkMSxJDF
 Vx31979hWEW8IxwvD8YlpSImTq0OYIoQmRpTiTyQ8fD23eU=
X-Google-Smtp-Source: ABdhPJy6op+phMQfhVONadDMO6TlzcrLoo4dSvKmcegv35gXu9WZTyWQNm3+6aQlbwSVm+gRCAkl6/dSuykywVjfG58=
X-Received: by 2002:a05:6512:22c2:b0:478:3ed7:f0f7 with SMTP id
 g2-20020a05651222c200b004783ed7f0f7mr5678951lfu.112.1654222332604; Thu, 02
 Jun 2022 19:12:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220511071419.100386-1-fengnanchang@gmail.com>
In-Reply-To: <20220511071419.100386-1-fengnanchang@gmail.com>
From: fengnan chang <fengnanchang@gmail.com>
Date: Fri, 3 Jun 2022 10:12:01 +0800
Message-ID: <CALWNXx-u=Q5d7Yhz=r+D0Oyr7OL-UkigQPGAecokk1f+-My65Q@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  ping... Fengnan Chang 于2022年5月11日周三 15:14写道：
    > > When decompressed failed, f2fs_prepare_compress_overwrite will enter
   > endless loop, may casue hungtask. > > [ 14.088665] F2FS-fs (nvme0n1) [...]
    
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.167.42 listed in list.dnswl.org]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [fengnanchang[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.167.42 listed in wl.mailspike.net]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nwwnT-0031y8-8Y
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix hungtask when decompressed fail
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

cGluZy4uLgoKRmVuZ25hbiBDaGFuZyA8ZmVuZ25hbmNoYW5nQGdtYWlsLmNvbT4g5LqOMjAyMuW5
tDXmnIgxMeaXpeWRqOS4iSAxNToxNOWGmemBk++8mgo+Cj4gV2hlbiBkZWNvbXByZXNzZWQgZmFp
bGVkLCBmMmZzX3ByZXBhcmVfY29tcHJlc3Nfb3ZlcndyaXRlIHdpbGwgZW50ZXIKPiBlbmRsZXNz
IGxvb3AsIG1heSBjYXN1ZSBodW5ndGFzay4KPgo+IFsgICAxNC4wODg2NjVdIEYyRlMtZnMgKG52
bWUwbjEpOiBsejQgZGVjb21wcmVzcyBmYWlsZWQsIHJldDotNDE1NQo+IFsgICAxNC4wODk4NTFd
IEYyRlMtZnMgKG52bWUwbjEpOiBsejQgZGVjb21wcmVzcyBmYWlsZWQsIHJldDotNDE1NQo+Cj4g
U2lnbmVkLW9mZi1ieTogRmVuZ25hbiBDaGFuZyA8ZmVuZ25hbmNoYW5nQGdtYWlsLmNvbT4KPiAt
LS0KPiAgZnMvZjJmcy9jb21wcmVzcy5jIHwgOSArKysrKysrLS0KPiAgMSBmaWxlIGNoYW5nZWQs
IDcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9mcy9mMmZz
L2NvbXByZXNzLmMgYi9mcy9mMmZzL2NvbXByZXNzLmMKPiBpbmRleCAxMmE1NmY5ZTE1NzIuLjZh
NjU0NDNmZDliMyAxMDA2NDQKPiAtLS0gYS9mcy9mMmZzL2NvbXByZXNzLmMKPiArKysgYi9mcy9m
MmZzL2NvbXByZXNzLmMKPiBAQCAtMTA2MCw3ICsxMDYwLDcgQEAgc3RhdGljIGludCBwcmVwYXJl
X2NvbXByZXNzX292ZXJ3cml0ZShzdHJ1Y3QgY29tcHJlc3NfY3R4ICpjYywKPiAgICAgICAgIHNl
Y3Rvcl90IGxhc3RfYmxvY2tfaW5fYmlvOwo+ICAgICAgICAgdW5zaWduZWQgZmdwX2ZsYWcgPSBG
R1BfTE9DSyB8IEZHUF9XUklURSB8IEZHUF9DUkVBVDsKPiAgICAgICAgIHBnb2ZmX3Qgc3RhcnRf
aWR4ID0gc3RhcnRfaWR4X29mX2NsdXN0ZXIoY2MpOwo+IC0gICAgICAgaW50IGksIHJldDsKPiAr
ICAgICAgIGludCBpLCByZXQsIHJldHJ5X2NvdW50ID0gMzsKPgo+ICByZXRyeToKPiAgICAgICAg
IHJldCA9IGYyZnNfaXNfY29tcHJlc3NlZF9jbHVzdGVyKGNjLT5pbm9kZSwgc3RhcnRfaWR4KTsK
PiBAQCAtMTEyMCw3ICsxMTIwLDEyIEBAIHN0YXRpYyBpbnQgcHJlcGFyZV9jb21wcmVzc19vdmVy
d3JpdGUoc3RydWN0IGNvbXByZXNzX2N0eCAqY2MsCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ZjJmc19wdXRfcnBhZ2VzKGNjKTsKPiAgICAgICAgICAgICAgICAgICAgICAgICBmMmZzX3VubG9j
a19ycGFnZXMoY2MsIGkgKyAxKTsKPiAgICAgICAgICAgICAgICAgICAgICAgICBmMmZzX2Rlc3Ry
b3lfY29tcHJlc3NfY3R4KGNjLCB0cnVlKTsKPiAtICAgICAgICAgICAgICAgICAgICAgICBnb3Rv
IHJldHJ5Owo+ICsgICAgICAgICAgICAgICAgICAgICAgIGlmIChyZXRyeV9jb3VudC0tKQo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ290byByZXRyeTsKPiArICAgICAgICAgICAg
ICAgICAgICAgICBlbHNlIHsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldCA9
IC1FSU87Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBnb3RvIG91dDsKPiArICAg
ICAgICAgICAgICAgICAgICAgICB9Cj4gICAgICAgICAgICAgICAgIH0KPiAgICAgICAgIH0KPgo+
IC0tCj4gMi4yNS4xCj4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxp
c3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9s
aXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
