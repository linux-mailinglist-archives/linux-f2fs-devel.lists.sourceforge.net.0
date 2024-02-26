Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC0A868059
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Feb 2024 20:03:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1regGQ-0006pv-Ny;
	Mon, 26 Feb 2024 19:03:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1regGO-0006pm-QJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Feb 2024 19:03:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xuvPxKO4uVcD2vgzVVeLbz3odA34taf8iIIWEI+/hXQ=; b=YvklxJeKBQUZUyOJQjVCQTrQza
 B6YcRpE5HHrgOmNmxX8qgchx7LGWWFnkhUm3KSST+MMXGTe0FzUB20+u2hY8ew7Hn26+aMQKItqSR
 6NB4urqsjJ6ifgST2dmIUqoJrhTCoI096yj6cJbBCzfYvNRDjkxq4j91c3ZQaWE21zxo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xuvPxKO4uVcD2vgzVVeLbz3odA34taf8iIIWEI+/hXQ=; b=iRi+AS3F1Iesl3gamejqi3Y3C8
 nh/LWs6ASXS3qWQ6WtMF56VYJs941en8jYFW1lhD75n7u3wXGQ1aD8j/LrRvHIcyrZbAujfj/Rp+D
 DflYSv98mHMfCM+7BXzHb/WVQHSJ3ocq5WUpBkMFrCKiIemMWFZZs1/lTGSl1nsMH5QY=;
Received: from mail-oi1-f171.google.com ([209.85.167.171])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1regGM-0007bt-3A for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Feb 2024 19:03:45 +0000
Received: by mail-oi1-f171.google.com with SMTP id
 5614622812f47-3c19aaedfdaso1117974b6e.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 26 Feb 2024 11:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708974211; x=1709579011; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xuvPxKO4uVcD2vgzVVeLbz3odA34taf8iIIWEI+/hXQ=;
 b=U04WZ4NyxJAyCvfnjf4Zwb16F1jyc6LAoODmbE01SAKVNnjSneq+83S5pkQk90th5d
 ZjJNPAuNHgXLln0PueinJk/bRntKQ2OKpN820V6dsFpd4Qc3UJG8/pG2arcyRC2gaTtH
 hvwbkNkSORiHPr2pEeF3jd7XAseQAiC2yIXQQsCkWNGCFtjpPCvpfPWBh5KpQt9UaCNv
 UV2JBfyT+xZPRsHZYwdxBn3WV19qefL5YH6LW++3dKpWjMTkSn7/QIHr6YhrTAd2uuFX
 lajxJKaswzKGSMGhhrJEnbJkPpPaAUoG3VNMfFbCERPglIaBMuZUOVrWRL0mXGIIvnDz
 nACQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708974211; x=1709579011;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xuvPxKO4uVcD2vgzVVeLbz3odA34taf8iIIWEI+/hXQ=;
 b=TMcOV4FsC+bFJCfpXKHwWvog/ZJ+oW+Ha6kX7tVEtjcxK07Z8HFAccSGebogXhEGdR
 nSIUeOBfGFxHM+B7enDLIHKQ/NpHxFw4VVGyoTILrHeoBaXVouNMkafyC6Tt8+bzMtXK
 SNxZxx3vRvP0a1OaM7ImDyp/dycZnVs7qEP7meTj2ijbJKN3yk113hs4OsyHJHm01fPV
 /vl0k3hW5Q18tmy0lw8X/jBJZcRVS7Uh+OplfAmjwlmScKvPhjZY53PRdedZJ9xNp2AE
 cRr0HNH4CWwbP9pUUWW6hwL/5mYpQauh9zHcMRDvWhYPpGV4L4sRB7O7oYUnLy3ocPD0
 R3Vg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHuKazUa+5pfpHh219U7/lc6FF8VzuUe6wpV2wRuwl1vxVBhiD/ytUeK9s/qGAgmecqhEEpoA68vc9QGad250NDRYAeFLNcrTgHqczG/zc70u5GraMtQ==
X-Gm-Message-State: AOJu0YxKuh9tBn2r2jSHkW2n7XuAK4sBbRJuc7BM68veL3lhafChnfpr
 F3VjDUF934ojiirjAI0LQ4QA6FXYYxFTg668mvdPwXmbvNEOwm4OZWdrROo5jagFkCxjQpg2omn
 P15BJ8tVTLRLY9nx6wmZp8dAj2v4=
X-Google-Smtp-Source: AGHT+IFIGq6hMpMFJZJrdbZS097cdfFD0C17fWtOJ02dFrT1kKywN2eSdVZhPHgFkg8ilBoOrBSXpJWRTtM9THiKgIU=
X-Received: by 2002:a05:6808:4086:b0:3c1:a93c:1255 with SMTP id
 db6-20020a056808408600b003c1a93c1255mr33176oib.26.1708974211350; Mon, 26 Feb
 2024 11:03:31 -0800 (PST)
MIME-Version: 1.0
References: <20240223205535.307307-1-jaegeuk@kernel.org>
 <20240223205535.307307-3-jaegeuk@kernel.org>
In-Reply-To: <20240223205535.307307-3-jaegeuk@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Mon, 26 Feb 2024 11:03:20 -0800
Message-ID: <CACOAw_x1CtXDm5zf+e5y9PZfWY7rCVc5+Cpg6Hr01q3QJSyJ+Q@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Fri, Feb 23, 2024 at 12:56 PM Jaegeuk Kim wrote: > >
   No functional change, but add some more logs. > > Signed-off-by: Jaegeuk Kim
    > --- > fs/f2fs/segment.c | 34 ++++++++++++++++++++++++------ [...] 
 
 Content analysis details:   (0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.167.171 listed in list.dnswl.org]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.167.171 listed in wl.mailspike.net]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1regGM-0007bt-3A
Subject: Re: [f2fs-dev] [PATCH 3/5] f2fs: print zone status in string and
 some log
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

T24gRnJpLCBGZWIgMjMsIDIwMjQgYXQgMTI6NTbigK9QTSBKYWVnZXVrIEtpbSA8amFlZ2V1a0Br
ZXJuZWwub3JnPiB3cm90ZToKPgo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlLCBidXQgYWRkIHNvbWUg
bW9yZSBsb2dzLgo+Cj4gU2lnbmVkLW9mZi1ieTogSmFlZ2V1ayBLaW0gPGphZWdldWtAa2VybmVs
Lm9yZz4KPiAtLS0KPiAgZnMvZjJmcy9zZWdtZW50LmMgfCAzNCArKysrKysrKysrKysrKysrKysr
KysrKystLS0tLS0tLS0tCj4gIGZzL2YyZnMvc3VwZXIuYyAgIHwgIDEgKwo+ICAyIGZpbGVzIGNo
YW5nZWQsIDI1IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBh
L2ZzL2YyZnMvc2VnbWVudC5jIGIvZnMvZjJmcy9zZWdtZW50LmMKPiBpbmRleCBkNGYyMjhlNmY3
NzEuLjZkNTg2YWU4YjU1ZiAxMDA2NDQKPiAtLS0gYS9mcy9mMmZzL3NlZ21lbnQuYwo+ICsrKyBi
L2ZzL2YyZnMvc2VnbWVudC5jCj4gQEAgLTQ5MTIsNiArNDkxMiwxNiBAQCBzdGF0aWMgaW50IHNh
bml0eV9jaGVja19jdXJzZWcoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKQo+ICB9Cj4KPiAgI2lm
ZGVmIENPTkZJR19CTEtfREVWX1pPTkVECj4gK2NvbnN0IGNoYXIgKmYyZnNfem9uZV9zdGF0dXNb
QkxLX1pPTkVfQ09ORF9PRkZMSU5FICsgMV0gPSB7Cj4gKyAgICAgICBbQkxLX1pPTkVfQ09ORF9O
T1RfV1BdICAgICAgICAgID0gIk5PVF9XUCIsCj4gKyAgICAgICBbQkxLX1pPTkVfQ09ORF9FTVBU
WV0gICAgICAgICAgID0gIkVNUFRZIiwKPiArICAgICAgIFtCTEtfWk9ORV9DT05EX0lNUF9PUEVO
XSAgICAgICAgPSAiSU1QTElDSVRFX09QRU4iLAo+ICsgICAgICAgW0JMS19aT05FX0NPTkRfRVhQ
X09QRU5dICAgICAgICA9ICJFWFBMSUNJVEVfT1BFTiIsCj4gKyAgICAgICBbQkxLX1pPTkVfQ09O
RF9DTE9TRURdICAgICAgICAgID0gIkNMT1NFRCIsCj4gKyAgICAgICBbQkxLX1pPTkVfQ09ORF9S
RUFET05MWV0gICAgICAgID0gIlJFQURPTkxZIiwKPiArICAgICAgIFtCTEtfWk9ORV9DT05EX0ZV
TExdICAgICAgICAgICAgPSAiRlVMTCIsCj4gKyAgICAgICBbQkxLX1pPTkVfQ09ORF9PRkZMSU5F
XSAgICAgICAgID0gIk9GRkxJTkUiLAo+ICt9Owo+Cj4gIHN0YXRpYyBpbnQgY2hlY2tfem9uZV93
cml0ZV9wb2ludGVyKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZjJmc19kZXZfaW5mbyAqZmRldiwKPiBAQCAtNDky
OCwxOCArNDkzOCwyMiBAQCBzdGF0aWMgaW50IGNoZWNrX3pvbmVfd3JpdGVfcG9pbnRlcihzdHJ1
Y3QgZjJmc19zYl9pbmZvICpzYmksCj4gICAgICAgICB6b25lX2Jsb2NrID0gZmRldi0+c3RhcnRf
YmxrICsgKHpvbmUtPnN0YXJ0ID4+IGxvZ19zZWN0b3JzX3Blcl9ibG9jayk7Cj4gICAgICAgICB6
b25lX3NlZ25vID0gR0VUX1NFR05PKHNiaSwgem9uZV9ibG9jayk7Cj4KPiArICAgICAgIC8qCj4g
KyAgICAgICAgKiBHZXQgIyBvZiB2YWxpZCBibG9jayBvZiB0aGUgem9uZS4KPiArICAgICAgICAq
Lwo+ICsgICAgICAgdmFsaWRfYmxvY2tfY250ID0gZ2V0X3ZhbGlkX2Jsb2NrcyhzYmksIHpvbmVf
c2Vnbm8sIHRydWUpOwo+ICsKPiAgICAgICAgIC8qCj4gICAgICAgICAgKiBTa2lwIGNoZWNrIG9m
IHpvbmVzIGN1cnNlZ3MgcG9pbnQgdG8sIHNpbmNlCj4gICAgICAgICAgKiBmaXhfY3Vyc2VnX3dy
aXRlX3BvaW50ZXIoKSBjaGVja3MgdGhlbS4KPiAgICAgICAgICAqLwo+ICAgICAgICAgaWYgKHpv
bmVfc2Vnbm8gPj0gTUFJTl9TRUdTKHNiaSkgfHwKCkhvdyBhYm91dCB0aGlzIG5vdCB0byB1c2Ug
YSB3cm9uZyBzZWdubyB2YWx1ZSBmb3IgZ2V0X3ZhbGlkX2Jsb2NrcygpCmFuZCBub3QgdG8gcHJp
bnQgYSB3cm9uZyBzZWdtZW50IGluZm8/CgogICAgaWYgKHpvbmVfc2Vnbm8gPj0gTUFJTl9TRUdT
KHNiaSkpCiAgICAgICAgcmV0dXJuIDA7CgogICAgdmFsaWRfYmxvY2tfY250ID0gZ2V0X3ZhbGlk
X2Jsb2NrcyhzYmksIHpvbmVfc2Vnbm8sIHRydWUpOwoKPiAtICAgICAgICAgICBJU19DVVJTRUMo
c2JpLCBHRVRfU0VDX0ZST01fU0VHKHNiaSwgem9uZV9zZWdubykpKQo+ICsgICAgICAgICAgIElT
X0NVUlNFQyhzYmksIEdFVF9TRUNfRlJPTV9TRUcoc2JpLCB6b25lX3NlZ25vKSkpIHsKPiArICAg
ICAgICAgICAgICAgZjJmc19ub3RpY2Uoc2JpLCAiT3BlbiB6b25lczogdmFsaWQgYmxvY2tbMHgl
eCwweCV4XSBjb25kWyVzXSIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB6b25l
X3NlZ25vLCB2YWxpZF9ibG9ja19jbnQsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBmMmZzX3pvbmVfc3RhdHVzW3pvbmUtPmNvbmRdKTsKPiAgICAgICAgICAgICAgICAgcmV0dXJu
IDA7Cj4gLQo+IC0gICAgICAgLyoKPiAtICAgICAgICAqIEdldCAjIG9mIHZhbGlkIGJsb2NrIG9m
IHRoZSB6b25lLgo+IC0gICAgICAgICovCj4gLSAgICAgICB2YWxpZF9ibG9ja19jbnQgPSBnZXRf
dmFsaWRfYmxvY2tzKHNiaSwgem9uZV9zZWdubywgdHJ1ZSk7Cj4gKyAgICAgICB9Cj4KPiAgICAg
ICAgIGlmICgoIXZhbGlkX2Jsb2NrX2NudCAmJiB6b25lLT5jb25kID09IEJMS19aT05FX0NPTkRf
RU1QVFkpIHx8Cj4gICAgICAgICAgICAgKHZhbGlkX2Jsb2NrX2NudCAmJiB6b25lLT5jb25kID09
IEJMS19aT05FX0NPTkRfRlVMTCkpCj4gQEAgLTQ5NDcsOCArNDk2MSw4IEBAIHN0YXRpYyBpbnQg
Y2hlY2tfem9uZV93cml0ZV9wb2ludGVyKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKPgo+ICAg
ICAgICAgaWYgKCF2YWxpZF9ibG9ja19jbnQpIHsKPiAgICAgICAgICAgICAgICAgZjJmc19ub3Rp
Y2Uoc2JpLCAiWm9uZSB3aXRob3V0IHZhbGlkIGJsb2NrIGhhcyBub24temVybyB3cml0ZSAiCj4g
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICJwb2ludGVyLiBSZXNldCB0aGUgd3JpdGUgcG9p
bnRlcjogY29uZFsweCV4XSIsCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgIHpvbmUtPmNv
bmQpOwo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAicG9pbnRlci4gUmVzZXQgdGhlIHdy
aXRlIHBvaW50ZXI6IGNvbmRbJXNdIiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgZjJm
c196b25lX3N0YXR1c1t6b25lLT5jb25kXSk7Cj4gICAgICAgICAgICAgICAgIHJldCA9IF9fZjJm
c19pc3N1ZV9kaXNjYXJkX3pvbmUoc2JpLCBmZGV2LT5iZGV2LCB6b25lX2Jsb2NrLAo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB6b25lLT5sZW4gPj4gbG9nX3NlY3Rv
cnNfcGVyX2Jsb2NrKTsKPiAgICAgICAgICAgICAgICAgaWYgKHJldCkKPiBAQCAtNDk2NSw4ICs0
OTc5LDggQEAgc3RhdGljIGludCBjaGVja196b25lX3dyaXRlX3BvaW50ZXIoc3RydWN0IGYyZnNf
c2JfaW5mbyAqc2JpLAo+ICAgICAgICAgICogc2VsZWN0ZWQgZm9yIHdyaXRlIG9wZXJhdGlvbiB1
bnRpbCBpdCBnZXQgZGlzY2FyZGVkLgo+ICAgICAgICAgICovCj4gICAgICAgICBmMmZzX25vdGlj
ZShzYmksICJWYWxpZCBibG9ja3MgYXJlIG5vdCBhbGlnbmVkIHdpdGggd3JpdGUgIgo+IC0gICAg
ICAgICAgICAgICAgICAgInBvaW50ZXI6IHZhbGlkIGJsb2NrWzB4JXgsMHgleF0gY29uZFsweCV4
XSIsCj4gLSAgICAgICAgICAgICAgICAgICB6b25lX3NlZ25vLCB2YWxpZF9ibG9ja19jbnQsIHpv
bmUtPmNvbmQpOwo+ICsgICAgICAgICAgICAgICAgICAgInBvaW50ZXI6IHZhbGlkIGJsb2NrWzB4
JXgsMHgleF0gY29uZFslc10iLAo+ICsgICAgICAgICAgICAgICAgICAgem9uZV9zZWdubywgdmFs
aWRfYmxvY2tfY250LCBmMmZzX3pvbmVfc3RhdHVzW3pvbmUtPmNvbmRdKTsKPgo+ICAgICAgICAg
cmV0ID0gYmxrZGV2X3pvbmVfbWdtdChmZGV2LT5iZGV2LCBSRVFfT1BfWk9ORV9GSU5JU0gsCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB6b25lLT5zdGFydCwgem9uZS0+bGVuLCBH
RlBfTk9GUyk7Cj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvc3VwZXIuYyBiL2ZzL2YyZnMvc3VwZXIu
Ywo+IGluZGV4IDRkMDNjZTExMDlhZC4uZmM3ZjFhOWZiYmRhIDEwMDY0NAo+IC0tLSBhL2ZzL2Yy
ZnMvc3VwZXIuYwo+ICsrKyBiL2ZzL2YyZnMvc3VwZXIuYwo+IEBAIC00Njc0LDYgKzQ2NzQsNyBA
QCBzdGF0aWMgaW50IGYyZnNfZmlsbF9zdXBlcihzdHJ1Y3Qgc3VwZXJfYmxvY2sgKnNiLCB2b2lk
ICpkYXRhLCBpbnQgc2lsZW50KQo+ICAgICAgICAgICogY2hlY2sgem9uZWQgYmxvY2sgZGV2aWNl
cycgd3JpdGUgcG9pbnRlciBjb25zaXN0ZW5jeS4KPiAgICAgICAgICAqLwo+ICAgICAgICAgaWYg
KCFmMmZzX3JlYWRvbmx5KHNiKSAmJiBmMmZzX3NiX2hhc19ibGt6b25lZChzYmkpKSB7Cj4gKyAg
ICAgICAgICAgICAgIGYyZnNfbm90aWNlKHNiaSwgIkNoZWNraW5nIGVudGlyZSB3cml0ZSBwb2lu
dGVycyIpOwo+ICAgICAgICAgICAgICAgICBlcnIgPSBmMmZzX2NoZWNrX3dyaXRlX3BvaW50ZXIo
c2JpKTsKPiAgICAgICAgICAgICAgICAgaWYgKGVycikKPiAgICAgICAgICAgICAgICAgICAgICAg
ICBnb3RvIGZyZWVfbWV0YTsKPiAtLQo+IDIuNDQuMC5yYzAuMjU4Lmc3MzIwZTk1ODg2LWdvb2cK
Pgo+Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4gTGludXgtZjJmcy1kZXZlbEBsaXN0cy5z
b3VyY2Vmb3JnZS5uZXQKPiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0
aW5mby9saW51eC1mMmZzLWRldmVsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1k
ZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQv
bGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
