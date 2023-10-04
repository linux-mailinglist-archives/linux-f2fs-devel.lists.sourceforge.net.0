Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D838E7B98BC
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  5 Oct 2023 01:37:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qoBR1-0005rO-5w;
	Wed, 04 Oct 2023 23:37:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1qoBR0-0005rI-8s
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Oct 2023 23:37:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fORUCfyg1OYLIckpVuIRlc6CrB2QtpkrB5qEQj0FaD0=; b=miBAxkBpUBNCQauINPXZkjZqax
 pOr0WRnHy0YFw8m6KaRGtfgoSNGLynapX4u+sNl8zucmkF7M7uTElGJ4VhYfmVfChpieln0W0YWeQ
 SyriZqcxVa3jDnXWABEzyh1mhceIERTmIuJL7vgKZWbzLVElBGzKnL/8BQii48ziZSBE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fORUCfyg1OYLIckpVuIRlc6CrB2QtpkrB5qEQj0FaD0=; b=XeD9k2kUko7wJlk17RfNLHkYBP
 r8PyBRhbs2pRXe10BIe8BQGVL76zETG2N5e9adDimzP9VZBg50mrWzbFymxTj59Dd1mxnKQ23comQ
 wd4ExX4Y4B/gJAyzPV6PuXZLZJsxWITu4Y2PJVIu3fwcq8+BDJYoyR07OZO5aUPBvefQ=;
Received: from mail-vs1-f45.google.com ([209.85.217.45])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qoBQv-001uQb-VZ for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Oct 2023 23:37:41 +0000
Received: by mail-vs1-f45.google.com with SMTP id
 ada2fe7eead31-4526b9404b0so1025223137.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 04 Oct 2023 16:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696462652; x=1697067452; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fORUCfyg1OYLIckpVuIRlc6CrB2QtpkrB5qEQj0FaD0=;
 b=Q1ub4P8Om74lbQ0Ms0W9cRElipQH+2Jd7uUollY6kInmpSqzXipN8ewakDPKW4zG6v
 h8o0mwqfbsfjvpCXFxDGXIPNSv2J3QjcmvQtI5B4Wpofy273ZarsFVv4NcYUrR7gciJ1
 3Z4n8SlP6+KwRYqv+0R2JCuk9ruKHjbydCeSVcRWJ5Fa89V0e0bJiiUgy2sfVmN0ek2b
 HhRkJrsG1jyInnO0o+zb9GcFvEfxJGURRtERvvUKMyYvvmcDpEKaExI+aif8hexXmta+
 GyKm3YS1HTM9a0wHqCJ6SOcuh0hLgwzf0kQFdBik2cUgtEUPdtUm1fp5ogZ5L9kpsTB5
 Ig4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696462652; x=1697067452;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fORUCfyg1OYLIckpVuIRlc6CrB2QtpkrB5qEQj0FaD0=;
 b=DY1/rXRZPzqUv3XnblbUe1IKKEjKsN3NW8+uQ/IbyfslzZ6mwr3NisEp6pJK6nZsf7
 HbiwOoEBzPwHIy6nZmLWFbGu0+F94hsrY3tbgz5RCajNPKyvVlNQufxQpiSN7UEM1kVZ
 8MSvq2s837eHv0ykTs+4LCn+42othpiEbUHl4GPfRd0UBLR75n0eq4a6EHQCVXUty4Cm
 Cf9qQW12OfPAU8O9x3xs/zsLf5FerMRzx8RCGYBa0dM8ZIHW9TNsRsiqSzZtep6JZtFS
 +BfAPFyE4CJXAy6mf19E4vg3h3iaVi671SFwlU4Cm87GPe9nRExAnf6S3pkUZVVganRG
 qePA==
X-Gm-Message-State: AOJu0YwnrV5F0egGn5JHs2swBPEFNwBWDHgB02nizPrElvsnhy9JZM8f
 Nn5dyhANcHqz/h2liCZuwdmcbn/EW8ecBiLlQq4=
X-Google-Smtp-Source: AGHT+IFKnn1oa+t5Dn9nijO5q6UPOuEvfOjfjTA0p/MzsUo+nnM3v/XLNwYpW1znkfZZc5U/EjbBDa41v5Y1ZoTg1y4=
X-Received: by 2002:a05:6102:40b:b0:44d:42c4:f4bf with SMTP id
 d11-20020a056102040b00b0044d42c4f4bfmr557391vsq.10.1696462652097; Wed, 04 Oct
 2023 16:37:32 -0700 (PDT)
MIME-Version: 1.0
References: <20231003230155.355807-1-daeho43@gmail.com>
 <ZR30mNQEyRjzr0jm@google.com>
In-Reply-To: <ZR30mNQEyRjzr0jm@google.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Wed, 4 Oct 2023 16:37:20 -0700
Message-ID: <CACOAw_zSvAPTREb0dSv6srRuxuKxDZp4rMhLyWTk+uJ3WKSWKA@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Wed, Oct 4, 2023 at 4:26 PM Jaegeuk Kim wrote: > > On
    10/03, Daeho Jeong wrote: > > From: Daeho Jeong > > > > For direct nodes,
    we have to use DEF_ADDRS_PER_BLOCK. > > > > Signed-off-by: Daeh [...] 
 
 Content analysis details:   (-0.4 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.5 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.217.45 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.217.45 listed in list.dnswl.org]
X-Headers-End: 1qoBQv-001uQb-VZ
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: use proper address entry count
 for direct nodes
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

T24gV2VkLCBPY3QgNCwgMjAyMyBhdCA0OjI24oCvUE0gSmFlZ2V1ayBLaW0gPGphZWdldWtAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiAxMC8wMywgRGFlaG8gSmVvbmcgd3JvdGU6Cj4gPiBGcm9t
OiBEYWVobyBKZW9uZyA8ZGFlaG9qZW9uZ0Bnb29nbGUuY29tPgo+ID4KPiA+IEZvciBkaXJlY3Qg
bm9kZXMsIHdlIGhhdmUgdG8gdXNlIERFRl9BRERSU19QRVJfQkxPQ0suCj4gPgo+ID4gU2lnbmVk
LW9mZi1ieTogRGFlaG8gSmVvbmcgPGRhZWhvamVvbmdAZ29vZ2xlLmNvbT4KPiA+IC0tLQo+ID4g
IGZzY2svZnNjay5jIHwgMiArLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9mc2NrL2ZzY2suYyBiL2ZzY2svZnNj
ay5jCj4gPiBpbmRleCA3OGZmZGI2Li41NmE3ZDMxIDEwMDY0NAo+ID4gLS0tIGEvZnNjay9mc2Nr
LmMKPiA+ICsrKyBiL2ZzY2svZnNjay5jCj4gPiBAQCAtMjg5NCw3ICsyODk0LDcgQEAgc3RhdGlj
IHZvaWQgZnNja19mYWlsZWRfcmVjb25uZWN0X2ZpbGVfZG5vZGUoc3RydWN0IGYyZnNfc2JfaW5m
byAqc2JpLAo+ID4gICAgICAgZnNjay0+Y2hrLnZhbGlkX2Jsa19jbnQtLTsKPiA+ICAgICAgIGYy
ZnNfY2xlYXJfbWFpbl9iaXRtYXAoc2JpLCBuaS5ibGtfYWRkcik7Cj4gPgo+ID4gLSAgICAgZm9y
IChpID0gMDsgaSA8IEFERFJTX1BFUl9CTE9DSygmbm9kZS0+aSk7IGkrKykgewo+ID4gKyAgICAg
Zm9yIChpID0gMDsgaSA8IERFRl9BRERSU19QRVJfQkxPQ0s7IGkrKykgewo+Cj4gSXQgc2VlbXMg
d2UgbmVlZCB0byB1c2UgdGhlIGlub2RlIGJsb2NrIHBhc3NpbmcgYnkgZnNja19mYWlsZWRfcmVj
b25uZWN0X2ZpbGUoKS4KClRoaXMgZnVuY3Rpb24gaXMgZm9yIGRpcmVjdCBub2Rlcy4gSXMgaXQg
Y29ycmVjdCB0byB1c2UgaW5vZGUgYmxvY2sgaGVyZT8KCj4KPiA+ICAgICAgICAgICAgICAgYWRk
ciA9IGxlMzJfdG9fY3B1KG5vZGUtPmRuLmFkZHJbaV0pOwo+ID4gICAgICAgICAgICAgICBpZiAo
IWFkZHIpCj4gPiAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4KPiAzMDEyICAgICAg
ICAgICAgICAgICAgICAgICAgIGZzY2stPmNoay52YWxpZF9ibGtfY250LS07Cj4gMzAxMyAgICAg
ICAgICAgICAgICAgICAgICAgICBpZiAoYWRkciA9PSBORVdfQUREUikKPgo+IEFuZCwgd2UgYWxz
byBuZWVkIHRvIHNraXAgaWYgYWRkciA9PSBDT01QUkVTU19BRERSIGhlcmU/Cj4KPiAzMDE0ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4gMzAxNSAgICAgICAgICAg
ICAgICAgICAgICAgICBmMmZzX2NsZWFyX21haW5fYml0bWFwKHNiaSwgYWRkcik7Cj4gMzAxNiAg
ICAgICAgICAgICAgICAgfQo+Cj4gPiAtLQo+ID4gMi40Mi4wLjU4Mi5nOGNjZDIwZDcwZC1nb29n
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
ZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgt
ZjJmcy1kZXZlbAo=
