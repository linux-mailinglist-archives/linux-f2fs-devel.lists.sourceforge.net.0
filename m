Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F93B14114
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Jul 2025 19:15:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C76Lss+juC/OKqs5arH0yev5Jd/UIZ/YkeidWGO20qQ=; b=iKTdTiQyw4I1Y8j8am+OVMn0Zv
	D5rN366i7GAnRvyVm29nmADwN6SqFkG92gA/9hj4biGftkKlEFl4g34pHFiEvxsJgJeJ+IHSx1SwC
	bRgnv3IDEydkjrtEM9VhH1jcr5T+lYTgRXiYudWXbgoB6x9ydH6X02IQSWJUgAIptGqU=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ugRRo-0004vI-HJ;
	Mon, 28 Jul 2025 17:15:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1ugRRl-0004ux-P2
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Jul 2025 17:15:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RTGKD6oRdle3dCegGleyS8Dn8yFdf/mVbo6/PiRr7Jk=; b=cDxg7o0gHrMPPzOBrRjZb3mYt3
 iyxTFHq2z0aR0pqhVfoqPtBsz01dJqIHKO0RLnsylHqd0aa0WWzaGTvr/dU9dv+ovgkxtkfFz/eLX
 hvBfDQflZMdl3LYKBVheMzmkHX5o+RAv3aPO51V8tbOgr6eOU9aa4KIHpUh1CufuOnFo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RTGKD6oRdle3dCegGleyS8Dn8yFdf/mVbo6/PiRr7Jk=; b=N1ClyU3JsYMdxTpI+kcjL2fbsE
 EfFLtaFih1ok5fWazEBnvl2ET6Vgv9XBs/tF2MLzBcpon2LB+QSfsCKlLF0i06ZXYyY14kEY/M4/o
 wZisgFJ21rdUHGAqxhW3+MIjtats/P8sEdfpem7g4Cetw05C3JBZjMfnQw7w2ctj3vdQ=;
Received: from mail-ua1-f49.google.com ([209.85.222.49])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ugRRm-0001au-2z for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Jul 2025 17:15:34 +0000
Received: by mail-ua1-f49.google.com with SMTP id
 a1e0cc1a2514c-884f2b3bc2eso889293241.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 28 Jul 2025 10:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753722922; x=1754327722; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RTGKD6oRdle3dCegGleyS8Dn8yFdf/mVbo6/PiRr7Jk=;
 b=XSYglKVkOmVfNUKtG9AXA2Ed9WjynxFN38V5Rehoz7k62jCw2SaPUWiew3K5PEXAAc
 iLx2oRZj2m4mJ177zwv0yCmVUSMBjbF0WJget1jjW4usKZ4vUu0CXVlvGK4ujoXEdsuA
 CpSRMkpRa6db52ImrhZkLpvbrQQXNy88S1me60MGrUNihvu3tVWiiMrBlEccmg58rYMi
 Llji1aNfjdYWLbuSRE4AgUU05LnHAc6bVPI9r27GCJhaOcej/GdboS9CCSFxI6a3isf9
 klYQlFLrWbcw3jpr4gf6hhewcdNEuiR7TC2r+oLD4CRbRrSuTRNc/YJMa78tERAj356T
 fXMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753722922; x=1754327722;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RTGKD6oRdle3dCegGleyS8Dn8yFdf/mVbo6/PiRr7Jk=;
 b=laih8a258yGXtQq699uO2yDa1b43b2HM1TAgkdWBBTxNGC2eGRbxRVJtFfUCd1JAF6
 zCHgkfcSmg5mvIecBRtxurVlok6ij6VMkjvlVzUGLsQy0ttxFv6OojFUZFNVlVfuj5SR
 zrXRvG8piHe2msZ2BxVAAnxTkHJV/+Y6R3Yxe63YHvsuxlLcOAIrF+U7+bKNvc/tf4tN
 BObhxptWyOgxn4GVDlWgLEsiTS45qy0xqSJYZQM4NAxZpcJRPEtUBRZohvjRaHbjT3LU
 x+HXMpeBXtfpJTl/bs/JQ3MfQq3O301LDOrBCViJth1YDqkyDHJoLyS1eYvOC+PrncRI
 vikA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpSEJ05KgewwHX3djWpC5A0Qwp9fo9mbU1GfmmU+LkVMl2OX/5g4Lxgqd2v1kzerC/wTciAEtP6EgEYN9aKTyc@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yz8FeAkUePxUlXf2S39RQoOiixfyM4IJ8/+ziRdreAbqeZMr/no
 3peXqpF25zFvH/Hb0ySjp4BbHgrHanSG1K1IfOCN6fNtPDLfBCghUdR7Kr6o8D0s+VR754fad6R
 x0BV2YqlgRiGaKP1VxpE0RX47CSXNbPs=
X-Gm-Gg: ASbGncstDb0VoeaaVq4weHktCUhhewoki+y5YZ0Xv9KbTVRqN/sET7vlQN3NSvUs2I9
 +1SdoTvunLxF6tAg5z2vi8Q3P7ZBhR8j6xVXKoPX+v1qsC0XVTZQbeAE7E5O9yatsFV2zc+qnBW
 Hv2u0vXraUwn2xCY4k7hTcprFwvZsaAC7q1bjB5mgGeB9EXuk3/DiaMib2ZCfzsyYPzsJ0GmkJV
 NRhTIOUZVYVCGKm9ErFl99cMM5QcnJOUYfDTwoq
X-Google-Smtp-Source: AGHT+IFkgX9qtsaANYaIy6eAwZiNaf47ITgsQx/tyC+DkleSdSH+Y/Iu5SVMrSi3gJPK7vC6ZZT24V09AuzFI+UDklg=
X-Received: by 2002:a05:6102:41a1:b0:4e7:db33:5725 with SMTP id
 ada2fe7eead31-4fa3fc459fcmr4798539137.3.1753722922465; Mon, 28 Jul 2025
 10:15:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250728163628.1043162-1-daeho43@gmail.com>
 <aIeo-kTFqsUs7L0v@google.com>
In-Reply-To: <aIeo-kTFqsUs7L0v@google.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Mon, 28 Jul 2025 10:15:11 -0700
X-Gm-Features: Ac12FXw-dpASSJsVJddB5j4Bjd1GWMs2Vqw35ntGZK1ivt99qkvKIf7zgLdYdvM
Message-ID: <CACOAw_zBpmVR4fKQuRcf3L+kJrJ1Rx8EzXDc6MDSVQdAOKmTvw@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Sorry. The below line should belong to "f2fs: add
 gc_boost_gc_multiple
 sysfs node", too. + boosted. the range should be from 1 to the segment count
 in a section. On Mon, Jul 28, 2025 at 9:44 AM Jaegeuk Kim wrote: > > Please
 check > >
 https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/log/?h=dev-test
 > > On 07/28, Daeho Jeong wrote: > > From: Da [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [daeho43(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [daeho43(at)gmail.com]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [209.85.222.49 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.49 listed in wl.mailspike.net]
X-Headers-End: 1ugRRm-0001au-2z
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: add gc_boost_gc_multiple sysfs node
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

U29ycnkuCgpUaGUgYmVsb3cgbGluZSBzaG91bGQgYmVsb25nIHRvICJmMmZzOiBhZGQgZ2NfYm9v
c3RfZ2NfbXVsdGlwbGUgc3lzZnMKbm9kZSIsIHRvby4KKyBib29zdGVkLiB0aGUgcmFuZ2Ugc2hv
dWxkIGJlIGZyb20gMSB0byB0aGUgc2VnbWVudCBjb3VudCBpbiBhIHNlY3Rpb24uCgpPbiBNb24s
IEp1bCAyOCwgMjAyNSBhdCA5OjQ04oCvQU0gSmFlZ2V1ayBLaW0gPGphZWdldWtAa2VybmVsLm9y
Zz4gd3JvdGU6Cj4KPiBQbGVhc2UgY2hlY2sKPgo+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHVi
L3NjbS9saW51eC9rZXJuZWwvZ2l0L2phZWdldWsvZjJmcy5naXQvbG9nLz9oPWRldi10ZXN0Cj4K
PiBPbiAwNy8yOCwgRGFlaG8gSmVvbmcgd3JvdGU6Cj4gPiBGcm9tOiBEYWVobyBKZW9uZyA8ZGFl
aG9qZW9uZ0Bnb29nbGUuY29tPgo+ID4KPiA+IEFkZCBhIHN5c2ZzIGtub2IgdG8gc2V0IGEgbXVs
dGlwbGllciBmb3IgdGhlIGJhY2tncm91bmQgR0MgbWlncmF0aW9uCj4gPiB3aW5kb3cgd2hlbiBG
MkZTIEdhcmJhZ2UgQ29sbGVjdGlvbiBpcyBib29zdGVkLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6
IERhZWhvIEplb25nIDxkYWVob2plb25nQGdvb2dsZS5jb20+Cj4gPiAtLS0KPiA+IHYzOiBmaXgg
dGhlIHJhbmdlIGNoZWNrIGNvbmRpdGlvbgo+ID4gdjI6IGxpbWl0IHRoZSBhdmFpbGFibGUgdmFs
dWUgcmFuZ2UKPiA+IC0tLQo+ID4gIERvY3VtZW50YXRpb24vQUJJL3Rlc3Rpbmcvc3lzZnMtZnMt
ZjJmcyB8IDggKysrKysrKysKPiA+ICBmcy9mMmZzL2djLmMgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAzICsrLQo+ID4gIGZzL2YyZnMvZ2MuaCAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8IDEgKwo+ID4gIGZzL2YyZnMvc3lzZnMuYyAgICAgICAgICAgICAgICAgICAgICAgICB8IDkg
KysrKysrKysrCj4gPiAgNCBmaWxlcyBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vQUJJL3Rlc3Rpbmcvc3lz
ZnMtZnMtZjJmcyBiL0RvY3VtZW50YXRpb24vQUJJL3Rlc3Rpbmcvc3lzZnMtZnMtZjJmcwo+ID4g
aW5kZXggYmYwMzI2M2I5ZjQ2Li45MzFjMWY2M2FhMmUgMTAwNjQ0Cj4gPiAtLS0gYS9Eb2N1bWVu
dGF0aW9uL0FCSS90ZXN0aW5nL3N5c2ZzLWZzLWYyZnMKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24v
QUJJL3Rlc3Rpbmcvc3lzZnMtZnMtZjJmcwo+ID4gQEAgLTg2MSwzICs4NjEsMTEgQEAgRGVzY3Jp
cHRpb246ICAgICBUaGlzIGlzIGEgcmVhZC1vbmx5IGVudHJ5IHRvIHNob3cgdGhlIHZhbHVlIG9m
IHNiLnNfZW5jb2RpbmdfZmxhZ3MsCj4gPiAgICAgICAgICAgICAgIFNCX0VOQ19TVFJJQ1RfTU9E
RV9GTCAgICAgICAgICAgIDB4MDAwMDAwMDEKPiA+ICAgICAgICAgICAgICAgU0JfRU5DX05PX0NP
TVBBVF9GQUxMQkFDS19GTCAgICAgMHgwMDAwMDAwMgo+ID4gICAgICAgICAgICAgICA9PT09PT09
PT09PT09PT09PT09PT09PT09PT09ICAgICA9PT09PT09PT09Cj4gPiArCj4gPiArV2hhdDogICAg
ICAgICAgICAgICAgL3N5cy9mcy9mMmZzLzxkaXNrPi9nY19ib29zdF9nY19tdWx0aXBsZQo+ID4g
K0RhdGU6ICAgICAgICAgICAgICAgIEp1bmUgMjAyNQo+ID4gK0NvbnRhY3Q6ICAgICAiRGFlaG8g
SmVvbmciIDxkYWVob2plb25nQGdvb2dsZS5jb20+Cj4gPiArRGVzY3JpcHRpb246IFNldCBhIG11
bHRpcGxpZXIgZm9yIHRoZSBiYWNrZ3JvdW5kIEdDIG1pZ3JhdGlvbiB3aW5kb3cgd2hlbiBGMkZT
IEdDIGlzCj4gPiArICAgICAgICAgICAgIGJvb3N0ZWQuCj4gPiArICAgICAgICAgICAgIERlZmF1
bHQ6IDUKPiA+ICsKPiA+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2djLmMgYi9mcy9mMmZzL2djLmMK
PiA+IGluZGV4IDNjYjUyNDJmNGRkZi4uZGU3ZTU5YmMwOTA2IDEwMDY0NAo+ID4gLS0tIGEvZnMv
ZjJmcy9nYy5jCj4gPiArKysgYi9mcy9mMmZzL2djLmMKPiA+IEBAIC0xOTcsNiArMTk3LDcgQEAg
aW50IGYyZnNfc3RhcnRfZ2NfdGhyZWFkKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSkKPiA+Cj4g
PiAgICAgICBnY190aC0+dXJnZW50X3NsZWVwX3RpbWUgPSBERUZfR0NfVEhSRUFEX1VSR0VOVF9T
TEVFUF9USU1FOwo+ID4gICAgICAgZ2NfdGgtPnZhbGlkX3RocmVzaF9yYXRpbyA9IERFRl9HQ19U
SFJFQURfVkFMSURfVEhSRVNIX1JBVElPOwo+ID4gKyAgICAgZ2NfdGgtPmJvb3N0X2djX211bHRp
cGxlID0gQk9PU1RfR0NfTVVMVElQTEU7Cj4gPgo+ID4gICAgICAgaWYgKGYyZnNfc2JfaGFzX2Js
a3pvbmVkKHNiaSkpIHsKPiA+ICAgICAgICAgICAgICAgZ2NfdGgtPm1pbl9zbGVlcF90aW1lID0g
REVGX0dDX1RIUkVBRF9NSU5fU0xFRVBfVElNRV9aT05FRDsKPiA+IEBAIC0xNzQ5LDcgKzE3NTAs
NyBAQCBzdGF0aWMgaW50IGRvX2dhcmJhZ2VfY29sbGVjdChzdHJ1Y3QgZjJmc19zYl9pbmZvICpz
YmksCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICFoYXNfZW5vdWdo
X2ZyZWVfYmxvY2tzKHNiaSwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgc2JpLT5nY190aHJlYWQtPmJvb3N0X3pvbmVkX2djX3BlcmNlbnQpKQo+ID4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgd2luZG93X2dyYW51bGFyaXR5ICo9Cj4gPiAtICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIEJPT1NUX0dDX01VTFRJUExFOwo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzYmktPmdjX3RocmVhZC0+Ym9vc3RfZ2Nf
bXVsdGlwbGU7Cj4gPgo+ID4gICAgICAgICAgICAgICAgICAgICAgIGVuZF9zZWdubyA9IHN0YXJ0
X3NlZ25vICsgd2luZG93X2dyYW51bGFyaXR5Owo+ID4gICAgICAgICAgICAgICB9Cj4gPiBkaWZm
IC0tZ2l0IGEvZnMvZjJmcy9nYy5oIGIvZnMvZjJmcy9nYy5oCj4gPiBpbmRleCA1YzFlYWY1NWUx
MjcuLmVmYTE5Njg4MTBhMCAxMDA2NDQKPiA+IC0tLSBhL2ZzL2YyZnMvZ2MuaAo+ID4gKysrIGIv
ZnMvZjJmcy9nYy5oCj4gPiBAQCAtNjgsNiArNjgsNyBAQCBzdHJ1Y3QgZjJmc19nY19rdGhyZWFk
IHsKPiA+ICAgICAgIHVuc2lnbmVkIGludCBub196b25lZF9nY19wZXJjZW50Owo+ID4gICAgICAg
dW5zaWduZWQgaW50IGJvb3N0X3pvbmVkX2djX3BlcmNlbnQ7Cj4gPiAgICAgICB1bnNpZ25lZCBp
bnQgdmFsaWRfdGhyZXNoX3JhdGlvOwo+ID4gKyAgICAgdW5zaWduZWQgaW50IGJvb3N0X2djX211
bHRpcGxlOwo+ID4gIH07Cj4gPgo+ID4gIHN0cnVjdCBnY19pbm9kZV9saXN0IHsKPiA+IGRpZmYg
LS1naXQgYS9mcy9mMmZzL3N5c2ZzLmMgYi9mcy9mMmZzL3N5c2ZzLmMKPiA+IGluZGV4IDc1MTM0
ZDY5YTBiZC4uYjQxN2I2NTVkNGU4IDEwMDY0NAo+ID4gLS0tIGEvZnMvZjJmcy9zeXNmcy5jCj4g
PiArKysgYi9mcy9mMmZzL3N5c2ZzLmMKPiA+IEBAIC04MjQsNiArODI0LDEzIEBAIHN0YXRpYyBz
c2l6ZV90IF9fc2JpX3N0b3JlKHN0cnVjdCBmMmZzX2F0dHIgKmEsCj4gPiAgICAgICAgICAgICAg
IHJldHVybiBjb3VudDsKPiA+ICAgICAgIH0KPiA+Cj4gPiArICAgICBpZiAoIXN0cmNtcChhLT5h
dHRyLm5hbWUsICJnY19ib29zdF9nY19tdWx0aXBsZSIpKSB7Cj4gPiArICAgICAgICAgICAgIGlm
ICh0IDwgMSB8fCB0ID4gU0VHU19QRVJfU0VDKHNiaSkpCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgcmV0dXJuIC1FSU5WQUw7Cj4gPiArICAgICAgICAgICAgIHNiaS0+Z2NfdGhyZWFkLT5ib29z
dF9nY19tdWx0aXBsZSA9ICh1bnNpZ25lZCBpbnQpdDsKPiA+ICsgICAgICAgICAgICAgcmV0dXJu
IGNvdW50Owo+ID4gKyAgICAgfQo+ID4gKwo+ID4gICAgICAgKnVpID0gKHVuc2lnbmVkIGludCl0
Owo+ID4KPiA+ICAgICAgIHJldHVybiBjb3VudDsKPiA+IEBAIC0xMDUwLDYgKzEwNTcsNyBAQCBH
Q19USFJFQURfUldfQVRUUihnY19ub19nY19zbGVlcF90aW1lLCBub19nY19zbGVlcF90aW1lKTsK
PiA+ICBHQ19USFJFQURfUldfQVRUUihnY19ub196b25lZF9nY19wZXJjZW50LCBub196b25lZF9n
Y19wZXJjZW50KTsKPiA+ICBHQ19USFJFQURfUldfQVRUUihnY19ib29zdF96b25lZF9nY19wZXJj
ZW50LCBib29zdF96b25lZF9nY19wZXJjZW50KTsKPiA+ICBHQ19USFJFQURfUldfQVRUUihnY192
YWxpZF90aHJlc2hfcmF0aW8sIHZhbGlkX3RocmVzaF9yYXRpbyk7Cj4gPiArR0NfVEhSRUFEX1JX
X0FUVFIoZ2NfYm9vc3RfZ2NfbXVsdGlwbGUsIGJvb3N0X2djX211bHRpcGxlKTsKPiA+Cj4gPiAg
LyogU01fSU5GTyBBVFRSICovCj4gPiAgU01fSU5GT19SV19BVFRSKHJlY2xhaW1fc2VnbWVudHMs
IHJlY19wcmVmcmVlX3NlZ21lbnRzKTsKPiA+IEBAIC0xMjIwLDYgKzEyMjgsNyBAQCBzdGF0aWMg
c3RydWN0IGF0dHJpYnV0ZSAqZjJmc19hdHRyc1tdID0gewo+ID4gICAgICAgQVRUUl9MSVNUKGdj
X25vX3pvbmVkX2djX3BlcmNlbnQpLAo+ID4gICAgICAgQVRUUl9MSVNUKGdjX2Jvb3N0X3pvbmVk
X2djX3BlcmNlbnQpLAo+ID4gICAgICAgQVRUUl9MSVNUKGdjX3ZhbGlkX3RocmVzaF9yYXRpbyks
Cj4gPiArICAgICBBVFRSX0xJU1QoZ2NfYm9vc3RfZ2NfbXVsdGlwbGUpLAo+ID4gICAgICAgQVRU
Ul9MSVNUKGdjX2lkbGUpLAo+ID4gICAgICAgQVRUUl9MSVNUKGdjX3VyZ2VudCksCj4gPiAgICAg
ICBBVFRSX0xJU1QocmVjbGFpbV9zZWdtZW50cyksCj4gPiAtLQo+ID4gMi41MC4xLjQ3MC5nNmJh
NjA3ODgwZC1nb29nCj4gPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxA
bGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3Rz
L2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
