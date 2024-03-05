Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 80515872B0D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  6 Mar 2024 00:30:32 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rheEv-0006Z7-Lb;
	Tue, 05 Mar 2024 23:30:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1rheEu-0006Yx-AS
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Mar 2024 23:30:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=foPvl4RCF4cvx3dJO8eDXRDlVt1ycd8Qa4N8CkfOJY4=; b=X0nvhRA1kM8Ttu4Ia+E6BiL3AS
 tUWqemy3Z3BpvDcLV2vOE82Pe16FPoO05rZEYcE7uglATY5k5CtrEO6t2ObFsGaudVAfDHFECPIWd
 MAemjtMOr12tMCgyGhVmAYU9GWZijNsqPUlX0jZcipJiKkPkSAVJWqJTNDf0XF9I1kw8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=foPvl4RCF4cvx3dJO8eDXRDlVt1ycd8Qa4N8CkfOJY4=; b=BrVdI4r+aLGeMl60R2DjkvMTFt
 BuLyt1vrqao3bqW6xiVCBjzcGF77usjSflPkYgNq2qjWTqWqeOUD1vcMZE2h+UjJG+f6xjPjQXF2f
 Og1iqmAzoMU3LazYEdcHmnGu7aJ1snEgobKg/09cC/RYu9nx8IWuimmbabdpJOeDXP3M=;
Received: from mail-ua1-f47.google.com ([209.85.222.47])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rheEn-0003xc-Ja for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Mar 2024 23:30:28 +0000
Received: by mail-ua1-f47.google.com with SMTP id
 a1e0cc1a2514c-7db4484672bso1136656241.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 05 Mar 2024 15:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709681417; x=1710286217; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=foPvl4RCF4cvx3dJO8eDXRDlVt1ycd8Qa4N8CkfOJY4=;
 b=IvuUqsf6ilcx1Y4IoYTN9vU7nPWx2ho6i95paipEDvjnkP903fL1ZYhzTXLUybPyuK
 CH4olOtkbMIrtXB9ZY9NNd++W7ECyJBu2RnRHqt6KsfIPnJkUsQca8aJoGKlP065bPdk
 E4TPxU1MSPBrUYkw/yGR82ymwjjF0/jDbxZnqerc64WujsK3EZplSgtrNYh+KxWOuwwl
 LXSej+hAjqdZ5Z8bnzLSm+mFRphrmtRiQA18vjIAP8eY8my6hLhKxovWczFXyyYAJOmo
 BVVUkvKawvu3Z9J6IqZU2aArsJSVeN25YCAJhp+6gE9fVO9SgOYI4f23lUVx+rnPMaNM
 xIAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709681417; x=1710286217;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=foPvl4RCF4cvx3dJO8eDXRDlVt1ycd8Qa4N8CkfOJY4=;
 b=lNU9qwwcRjj9o1GbB5eD6EmsmHpBBCjjZbz9yKj9DurJsKjRK1UXMSM4LtYqQq2pF6
 seKOlgqaFwvqXz1femUS3xqtChOKBzrwZ977q57qpfnruTsKeYV+iwGaUVddoePowUXY
 WGXDyO/2k+9q9YHPD1CAQTwpoc8iNZwLcAc0a/5UpaQSyFM112cnsQPrbGooLgblgehJ
 63KKt9Js1PyFocis2FBWk2wvfnmGlX8dKDTHx25pHi2QlBFIAWpeCAUOoNH8npP45Z+g
 qaCASuEBaFaHhCJfHCp5OwjMhiVZJaBQRcvp2CCr7gr0edRQCOpbt/LP+SZLymma9qSw
 O3rg==
X-Gm-Message-State: AOJu0YySPb0kh+J3dfyC7KzBm2qmXr5jcpoDRjNE1873ilYmeWYCH0Ll
 hG4/PRkQjUHaBm6oGRRaBI2sQrtS0b8nsKC9CYc1YFX2psSoGUCL+BNnTilUln/S5+LiBToVs9f
 E4paffyUcuLo4PR6uD/MpJ7dR7Cz5ccUHUt4=
X-Google-Smtp-Source: AGHT+IEaCYlCbJ6vxM7jwbWcHFfmDKo87np7r9fRDVGF5K2RH38p6+MsvJHRdwRNjoU4FvQof1ZMDdpScpe972IRCls=
X-Received: by 2002:a67:e9cf:0:b0:472:e8a6:12fc with SMTP id
 q15-20020a67e9cf000000b00472e8a612fcmr771303vso.25.1709681416669; Tue, 05 Mar
 2024 15:30:16 -0800 (PST)
MIME-Version: 1.0
References: <20240305204834.101697-1-jaegeuk@kernel.org>
In-Reply-To: <20240305204834.101697-1-jaegeuk@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Tue, 5 Mar 2024 15:30:05 -0800
Message-ID: <CACOAw_zFusiW3VaQdW=UMjK8Q835L7h4zCe=DQwNYdN9pH_FyA@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Reviewed-by: Daeho Jeong On Tue, Mar 5, 2024 at 12:50 PM
    Jaegeuk Kim wrote: > > This fixes some android build failures due to the
   missing permission when > checking the loop device. Until we get a better
   solution, let's i [...] 
 
 Content analysis details:   (0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.222.47 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.222.47 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rheEn-0003xc-Ja
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: deal with permission denial on
 non-root user
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

UmV2aWV3ZWQtYnk6IERhZWhvIEplb25nIDxkYWVob2plb25nQGdvb2dsZS5jb20+CgpPbiBUdWUs
IE1hciA1LCAyMDI0IGF0IDEyOjUw4oCvUE0gSmFlZ2V1ayBLaW0gPGphZWdldWtAa2VybmVsLm9y
Zz4gd3JvdGU6Cj4KPiBUaGlzIGZpeGVzIHNvbWUgYW5kcm9pZCBidWlsZCBmYWlsdXJlcyBkdWUg
dG8gdGhlIG1pc3NpbmcgcGVybWlzc2lvbiB3aGVuCj4gY2hlY2tpbmcgdGhlIGxvb3AgZGV2aWNl
LiBVbnRpbCB3ZSBnZXQgYSBiZXR0ZXIgc29sdXRpb24sIGxldCdzIGlnbm9yZQo+IHRoZSBlcnJv
ciB3aXRoIHdhcm5pbmdzLgo+Cj4gU2lnbmVkLW9mZi1ieTogSmFlZ2V1ayBLaW0gPGphZWdldWtA
a2VybmVsLm9yZz4KPiAtLS0KPiAgbGliL2xpYmYyZnMuYyB8IDEyICsrKysrKysrKy0tLQo+ICAx
IGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAt
LWdpdCBhL2xpYi9saWJmMmZzLmMgYi9saWIvbGliZjJmcy5jCj4gaW5kZXggZDUxZTQ4NTM2MWVl
Li4xY2ZiZjMxYTljODUgMTAwNjQ0Cj4gLS0tIGEvbGliL2xpYmYyZnMuYwo+ICsrKyBiL2xpYi9s
aWJmMmZzLmMKPiBAQCAtODU0LDkgKzg1NCwxNSBAQCBpbnQgZjJmc19kZXZfaXNfdW1vdW50ZWQo
Y2hhciAqcGF0aCkKPgo+ICAgICAgICAgICAgICAgICAgICAgICAgIGxvb3BfZmQgPSBvcGVuKG1u
dC0+bW50X2ZzbmFtZSwgT19SRE9OTFkpOwo+ICAgICAgICAgICAgICAgICAgICAgICAgIGlmIChs
b29wX2ZkIDwgMCkgewo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLyogbm9uLXJv
b3QgdXNlcnMgaGF2ZSBubyBwZXJtaXNzaW9uICovCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBpZiAoZXJybm8gPT0gRVBFUk0gfHwgZXJybm8gPT0gRUFDQ0VTKSB7Cj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE1TRygwLCAiSW5mbzogb3BlbiAlcyBm
YWlsZWQgZXJybm86JWQgLSBiZSBjYXJlZnVsIHRvIG92ZXJ3cml0ZSBhIG1vdW50ZWQgbG9vcGJh
Y2sgZmlsZS5cbiIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBtbnQtPm1udF9mc25hbWUsIGVycm5vKTsKPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB9Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBNU0coMCwgIklu
Zm86IG9wZW4gJXMgZmFpbGVkIGVycm5vOiVkXG4iLAo+IC0gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBtbnQtPm1udF9mc25hbWUsIGVycm5vKTsKPiAtICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHJldHVybiAtMTsKPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1udC0+bW50X2ZzbmFtZSwgZXJybm8pOwo+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1lcnJubzsKPiAgICAgICAg
ICAgICAgICAgICAgICAgICB9Cj4KPiAgICAgICAgICAgICAgICAgICAgICAgICBlcnIgPSBpb2N0
bChsb29wX2ZkLCBMT09QX0dFVF9TVEFUVVM2NCwgJmxvb3BpbmZvKTsKPiBAQCAtODY0LDcgKzg3
MCw3IEBAIGludCBmMmZzX2Rldl9pc191bW91bnRlZChjaGFyICpwYXRoKQo+ICAgICAgICAgICAg
ICAgICAgICAgICAgIGlmIChlcnIgPCAwKSB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBNU0coMCwgIlx0RXJyb3I6IGlvY3RsIExPT1BfR0VUX1NUQVRVUzY0IGZhaWxlZCBlcnJu
bzolZCFcbiIsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVycm5v
KTsKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtMTsKPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtZXJybm87Cj4gICAgICAgICAgICAgICAg
ICAgICAgICAgfQo+Cj4gICAgICAgICAgICAgICAgICAgICAgICAgaWYgKHN0X2J1Zi5zdF9kZXYg
PT0gbG9vcGluZm8ubG9fZGV2aWNlICYmCj4gLS0KPiAyLjQ0LjAuMjc4LmdlMDM0YmIyZTFkLWdv
b2cKPgo+Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4gTGludXgtZjJmcy1kZXZlbEBsaXN0
cy5zb3VyY2Vmb3JnZS5uZXQKPiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9s
aXN0aW5mby9saW51eC1mMmZzLWRldmVsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJm
cy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5u
ZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
