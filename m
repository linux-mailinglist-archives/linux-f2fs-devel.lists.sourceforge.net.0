Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9981896F777
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  6 Sep 2024 16:53:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1smaKo-0000M8-LI;
	Fri, 06 Sep 2024 14:53:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qkrwngud825@gmail.com>) id 1smaKn-0000M2-Il
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 06 Sep 2024 14:53:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LSKiMfs9aMnFyQyhX6SOjUqLA0h3EptDIsaiVAy0A54=; b=FMGtRYgB9gx3ZLEolb3LFa+EJJ
 3FkoOFuQyNWqhEjgilBlTf1VJtI5tywfxjWXT3z1a9128pLVV4Qh91935HkiFNRyADNfDOycf9S2p
 mPLhuYIcaoOBHDH8q7FNQeevBcKmt8UGapvjAhDd1PigNggUNK2jX1pWwLsc/kVcals4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LSKiMfs9aMnFyQyhX6SOjUqLA0h3EptDIsaiVAy0A54=; b=feK/FXEYgNfIkZ7agziXVEsul5
 bqfacEXj2UXIKrtK8/z+fXpay65EBbS7roR+3zdUzLEzF+QNDX9lRqaHuWDqKo11WRmAhdB0rqub/
 1vRJ2IvXhSafDfgzRwyE9xHKA2gTnQnkfeYMdO42WCoE8OerK60I60JkSpTDVFTjoUzQ=;
Received: from mail-ej1-f51.google.com ([209.85.218.51])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1smaKn-0001R1-Dg for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 06 Sep 2024 14:53:14 +0000
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-a7a81bd549eso227912366b.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 06 Sep 2024 07:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725634382; x=1726239182; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LSKiMfs9aMnFyQyhX6SOjUqLA0h3EptDIsaiVAy0A54=;
 b=F1vxa/Vm71Ex2hYqx2VzNl9bSuaKZIB+CpfVaHx9fbZytDEpLuKBQm1Sx85MEk+mE+
 ZsyeRVlMQArywukUl93+pYBTfr/a+6HDDadlH/uEqcAC8fue2r84sBwAb4PpuCHB6e2E
 u8PeH0VyVZDkU2dSWge+efX/sxj2v3i0nSRHDkn7xGr3mfM69OtoVLr+du8oZYpFHAbx
 0vKmPUTgq8ij6tKFuNYT7GxBneacoZq5ZUWSdcO8PiiE+njWfFggIdiEBpRnFyH52cq0
 MtCRkuuQsVxFK+DNMYmYDtuAS0xcOcy0tyFSQoacI09w7OGIgr1oIcZ93QMeT+PqIXir
 Fj9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725634382; x=1726239182;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LSKiMfs9aMnFyQyhX6SOjUqLA0h3EptDIsaiVAy0A54=;
 b=cPlkaXYGvJoCMuyHFe3AiS5aLQ8YmNZfR7qBjDLmwsxLgK3Y1mtLS/b1s/QRZpSnN1
 3pwd74wWT7+VhEyc9lwPBWgza367BvKolMY05RpFFQoQjYN+2kZAbs07VGfVCQyrE93B
 Pf0tYjr92IF5zo94JmQiqBjvZwjb8TncTgScnuER9Rm2ZqyKEup1TZvh85uVVi7+ae06
 EY6IrtUT+lDxlgAJ6ZkCyezszDIFUsZ3r5v/tSYlMIMHCfTnOagLCwCQafxcx7q1juwI
 xAp8oa9C2GUnQVqFJ8H98Xtz/54KFbWYTa8X5PiZ+nJSW8dcz1Mw5XC/B2bc2gcR/DIA
 g8ig==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFPJYEHwi4Wt1qmPjXnBGD0llgdIx0uSHUGzWmGK/TWrYB7g16Ivvs+XRFypXXC23HqK1uNijFTOJJiBcthqvc@lists.sourceforge.net
X-Gm-Message-State: AOJu0YySLExiiOd51eucRQJ82lQjViX0OfrvLNxC/Vjuxlgg0gPLsD89
 ubS9J7avXLOF1TJi275iqyuflODiaBu9cmH6Zq5smYTQKMp0p38vHgDKkaji4q/kDn/M/7nvrw0
 Lz6Gb+ow6hAov5mQXQQ/SJzkLgoUxZj044iw=
X-Google-Smtp-Source: AGHT+IGSCYvIyHPy2NOXwx9s40epCDFEmq4coQUJ8uqhiW8V76tMRHqZXafdgsFDVApYkHxpim7eOryrbHt2ZOBK7es=
X-Received: by 2002:a17:907:724a:b0:a88:a49a:59e2 with SMTP id
 a640c23a62f3a-a8a88841c57mr189074166b.44.1725634381271; Fri, 06 Sep 2024
 07:53:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAD14+f2M+C_21h2bV6=GMhNwgWzLVaCL5jv1SQxsuKoveX6P_w@mail.gmail.com>
 <20240906105727.3666561-1-bo.wu@vivo.com>
In-Reply-To: <20240906105727.3666561-1-bo.wu@vivo.com>
From: Juhyung Park <qkrwngud825@gmail.com>
Date: Fri, 6 Sep 2024 23:52:49 +0900
Message-ID: <CAD14+f349Fsx9syBzEtgbOXEts0FRrHWU8vUgbpRO-SJ8DMmJw@mail.gmail.com>
To: Wu Bo <bo.wu@vivo.com>
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi Wu, On Fri, Sep 6, 2024 at 7:42 PM Wu Bo wrote: > > On
    Fri, Sep 06, 2024 at 06:02:42PM +0900, Juhyung Park wrote: > > Hi Wu, > >
    > > Interesting patch-set. > > > > A quick test here on my daily-driver [...]
    
 
 Content analysis details:   (0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.1 HK_RANDOM_FROM         From username looks random
  0.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.218.51 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [qkrwngud825[at]gmail.com]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [qkrwngud825[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [209.85.218.51 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1smaKn-0001R1-Dg
Subject: Re: [f2fs-dev] [PATCH 00/13] f2fs: introduce inline tail
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
Cc: Wu Bo <wubo.oduw@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGkgV3UsCgpPbiBGcmksIFNlcCA2LCAyMDI0IGF0IDc6NDLigK9QTSBXdSBCbyA8Ym8ud3VAdml2
by5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCBTZXAgMDYsIDIwMjQgYXQgMDY6MDI6NDJQTSArMDkw
MCwgSnVoeXVuZyBQYXJrIHdyb3RlOgo+ID4gSGkgV3UsCj4gPgo+ID4gSW50ZXJlc3RpbmcgcGF0
Y2gtc2V0Lgo+ID4KPiA+IEEgcXVpY2sgdGVzdCBoZXJlIG9uIG15IGRhaWx5LWRyaXZlciBwaG9u
ZSdzIGRhdGEgKDc4NTU1OCBpbm9kZXMpIHdpdGgKPiA+IGJvdGggY29tcHJlc3Npb24gYW5kIGVu
Y3J5cHRpb24gZGlzYWJsZWQsIGNvcGllZCB2aWEgcnN5bmMgdG8gMiBmcmVzaAo+ID4gZjJmcyBw
YXJ0aXRpb25zIHdpdGggYW5kIHdpdGhvdXQgaW5saW5lIHRhaWw6Cj4gPiBCZWZvcmU6IDE3MDA2
NDkyOEtpQgo+ID4gQWZ0ZXI6IDE2OTI0OTc4MEtpQgo+ID4KPiA+IFNvIGFib3V0IDAuNDglIHNh
dmVkLgo+ID4KPiBIaSBKdWh5dW5nLAo+Cj4gVGhhbmtzIGZvciB5b3VyIHRlc3QuIElmIGl0J3Mg
bm90IHRvbyBtdWNoIHRyb3VibGUsIHBsZWFzZSBoZWxwIGNoZWNrIHRoZSBmMmZzCj4gc3RhdGlz
dGljczoKPiBjYXQgL3N5cy9rZXJuZWwvZGVidWcvZjJmcy9zdGF0dXMgfCBncmVwIFV0aWxpemF0
aW9uCgojIHcvbyBpbmxpbmUgdGFpbApVdGlsaXphdGlvbjogNzAlICg0MjE1MzIyNCB2YWxpZCBi
bG9ja3MsIDAgZGlzY2FyZCBibG9ja3MpCiMgdy8gaW5saW5lIHRhaWwKVXRpbGl6YXRpb246IDY5
JSAoNDE5NDk0MzcgdmFsaWQgYmxvY2tzLCAwIGRpc2NhcmQgYmxvY2tzKQoKPgo+IEhvd2V2ZXIs
IGl04oCZcyBtb3JlIGxpa2VseSB0aGF0IHRoZSBiZW5lZml0cyBvZiBpbmxpbmUgdGFpbCBhcmUg
aW5kZWVkIGxpbWl0ZWQgb24KPiBtb2JpbGUgZGV2aWNlcy4gSSBwcmV2aW91c2x5IGV2YWx1YXRl
ZCB0aGUgZ2FpbnMgb24gbXkgb3duIHBob25lLCBhbmQgdGhleSB3ZXJlCj4gbGVzcyB0aGFuIDEl
IHRvby4KPgo+IEZyb20gdGhlIGRhdGEgb24geW91ciBwaG9uZSwgdGhlIGF2ZXJhZ2Ugc2l6ZSBp
cyAxNzAwNjQ5MjhLaUIvNzg1NTU44omIMjAwS2lCLgo+IFN0b3JhZ2Ugc3BhY2Ugb24gcGhvbmVz
IGlzIHByaW1hcmlseSBjb25zdW1lZCBieSBtdWx0aW1lZGlhIGZpbGVzLCBzbyB0aGUKPiBwcm9w
b3J0aW9uIG9mIGZpbGVzIHNtYWxsZXIgdGhhbiA2NEtCIGlzIHF1aXRlIHNtYWxsLgo+Cj4gVGhl
cmVmb3JlLCBjb21wYXJlZCB0byBwaG9uZSBzdG9yYWdlLCBzY2VuYXJpb3MgbGlrZSBzdG9yaW5n
IExpbnV4IHNvdXJjZSBjb2RlLAo+IHdoaWNoIGludm9sdmUgbWFueSBzbWFsbCBmaWxlcywgYXJl
IG1vcmUgbGlrZWx5IHRvIHlpZWxkIG5vdGljZWFibGUgYmVuZWZpdHMuCgpNbW0uCgpJIGRvIGhh
dmUgbXkgb3duIExpbnV4IHNldHVwcyB1c2luZyBmMmZzIGFzIHdlbGwgd2l0aCBleHRlbmRlZCBu
b2RlIGJpdG1hcDoKIyBXb3Jrc3RhdGlvbiwgMi41VC8zLjVULCA1NTYwMjQwNCBpbm9kZXMKVXRp
bGl6YXRpb246IDcwJSAoNjU3NDIxNzIwIHZhbGlkIGJsb2NrcywgOTAyIGRpc2NhcmQgYmxvY2tz
KQojIExhcHRvcCwgNzM2Ry8xLjlULCAxMjIyOTM4MCBpbm9kZXMKVXRpbGl6YXRpb246IDM5JSAo
MTkwOTgwODY4IHZhbGlkIGJsb2NrcywgMjg4NyBkaXNjYXJkIGJsb2NrcykKCkkgZG8gaGF2ZSBh
IGxvdCBvZiBzbWFsbCBmaWxlcyBoZXJlLCBpdCdsbCBiZSBpbnRlcmVzdGluZyB0byB0ZXN0IHRo
aXMKb3V0IGJ1dCBJIGNhbid0IGFmZm9yZCB0byBydW4gYW4gdW5zdGFibGUga2VybmVsIGZvciB0
aG9zZSBhdG0uIChOb3QKdG8gbWVudGlvbiBmaW5kaW5nIGEgbmV3IFNTRCBmb3IgbWlncmF0aW9u
LikKCj4KPiBIb3dldmVyLCBkb24ndCBiZSB0b28gZGlzYXBwb2ludGVkIHdpdGggaXQsIGFzIGl0
IGNhbiBzdGlsbCBkb3VibGUgdGhlIGJlbmVmaXRzCj4gYmFzZWQgb24gdGhlIGV4aXN0aW5nIGdh
aW5zIGZyb20gaW5saW5lIGRhdGEuCj4gSW5saW5lIGRhdGE6Cj4gaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvbGludXgtZjJmcy1kZXZlbC8xMzg0MDk2NDAxLTI1MTY5LTEtZ2l0LXNlbmQtZW1haWwt
aHVhanVuLmxpLmxlZUBnbWFpbC5jb20vVC8jdQo+Cj4gVGhhbmtzLAo+IFd1IEJvCj4KPiA+IExl
dCBtZSBrbm93IGlmIHRoaXMgaXMgYW4gdW5leHBlY3RlZCByZXN1bHQuCj4gPgo+ID4gVGhhbmtz
LAo+ID4KPiA+IE9uIFR1ZSwgU2VwIDMsIDIwMjQgYXQgNTo0MuKAr1BNIFd1IEJvIHZpYSBMaW51
eC1mMmZzLWRldmVsCj4gPiA8bGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQ+
IHdyb3RlOgo+ID4gPgo+ID4gPiBUaGUgaW5vZGUgaW4gRjJGUyBvY2N1cGllcyBhbiBlbnRpcmUg
NGsgYmxvY2suIEZvciBtYW55IHNtYWxsIGZpbGVzLCB0aGlzIG1lYW5zCj4gPiA+IHRoZXkgY29u
c3VtZSBtdWNoIG1vcmUgc3BhY2UgdGhhbiB0aGVpciBhY3R1YWwgc2l6ZS4gVGhlcmVmb3JlLCB0
aGVyZSBpcwo+ID4gPiBzaWduaWZpY2FudCBwb3RlbnRpYWwgdG8gYmV0dGVyIHV0aWxpemUgdGhl
IGlub2RlIGJsb2NrIHNwYWNlLgo+ID4gPgo+ID4gPiBDdXJyZW50bHksIEYyRlMgaGFzIHR3byBm
ZWF0dXJlcyB0byBtYWtlIHVzZSBvZiB0aGUgaW5vZGUgYmxvY2sgc3BhY2U6IGlubGluZQo+ID4g
PiBkYXRhIGFuZCBpbmxpbmUgeGF0dHIuCj4gPiA+Cj4gPiA+IElubGluZSBkYXRhIHN0b3JlcyBm
aWxlIHdoaWNoIHNpemUgaXMgc21hbGxlciB0aGVuIDMuNWsgaW4gaW5vZGUgYmxvY2suIEhvd2V2
ZXIsCj4gPiA+IGZvciBzbGlnaHRseSBsYXJnZXIgc21hbGwgZmlsZXMsIHRoZXJlIHN0aWxsIGhh
dmUgbXVjaCB3YXN0ZS4KPiA+ID4gRm9yIGV4YW1wbGUsIGEgNWsgZmlsZSByZXF1aXJlcyAzIGJs
b2NrcywgdG90YWxpbmcgMTJrIG9mIHNwYWNlLCB3aGljaCBpcwo+ID4gPiBtb3JlIHRoYW4gdHdp
Y2UgdGhlIHNpemUgb2YgdGhlIGZpbGUgaXRzZWxmIQo+ID4gPgo+ID4gPiBBZGRpdGlvbmFsbHks
IHRoZSBlbmQgb2YgYSBmaWxlIG9mdGVuIGRvZXMgbm90IG9jY3VweSBhbiBlbnRpcmUgYmxvY2su
IElmIHdlIGNhbgo+ID4gPiBzdG9yZSB0aGUgZW5kIG9mIHRoZSBmaWxlIGRhdGEgd2l0aGluIHRo
ZSBpbm9kZSBibG9jaywgd2UgY2FuIHNhdmUgYW4gZW50aXJlCj4gPiA+IGJsb2NrIGZvciB0aGUg
ZmlsZS4gVGhpcyBpcyBwYXJ0aWN1bGFybHkgaW1wb3J0YW50IGZvciBzbWFsbCBmaWxlcy4KPiA+
ID4KPiA+ID4gSW4gZmFjdCwgdGhlIGN1cnJlbnQgaW5saW5lIGRhdGEgaXMgYSBzcGVjaWFsIGNh
c2Ugb2YgaW5saW5lIHRhaWwsIGFuZAo+ID4gPiBpbmxpbmUgdGFpbCBpcyBhbiBleHRlbnNpb24g
b2YgaW5saW5lIGRhdGEuCj4gPiA+Cj4gPiA+IFRvIG1ha2UgaXQgc2ltcGxlLCBpbmxpbmUgdGFp
bCBvbmx5IG9uIHNtYWxsIGZpbGVzKDw2NGspLiBBbmQgZm9yIGxhcmdlciBmaWxlcywKPiA+ID4g
aW5saW5lIHRhaWxzIGRvbid0IHByb3ZpZGUgYW55IHNpZ25pZmljYW50IGJlbmVmaXRzLgo+ID4g
Pgo+ID4gPiBUaGUgbGF5b3V0IG9mIGFuIGlubGluZSB0YWlsIGlub2RlIGJsb2NrIGlzIGZvbGxv
d2luZzoKPiA+ID4KPiA+ID4gfCBpbm9kZSBibG9jayAgICAgfCA0MDk2IHwgICAgIGlubGluZSB0
YWlsIGVuYWJsZSAgICB8Cj4gPiA+IHwgLS0tLS0tLS0tLS0tLS0tIHwgLS0tLSB8IC0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tfAo+ID4gPiB8IGlub2RlIGluZm8gICAgICB8IDM2MCAgfCAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwKPiA+ID4gfCAtLS0tLS0tLS0tLS0tLS0gfCAtLS0tIHwg
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS18Cj4gPiA+IHwgICAgICAgICAgICAgICAgIHwgICAg
ICB8IGV4dHJhIGluZm8gICAgICAgICB8IDB+MzYgfAo+ID4gPiB8ICAgICAgICAgICAgICAgICB8
ICAgICAgfCAqKmNvbXBhY3RfYWRkclsxNl0gfCA2NCAgIHwKPiA+ID4gfCBhZGRyIHRhYmxlWzky
M10gfCAzNjkyIHwgcmVzZXJ2ZWQgICAgICAgICAgIHwgNCAgICB8Cj4gPiA+IHwgICAgICAgICAg
ICAgICAgIHwgICAgICB8ICoqdGFpbCBkYXRhICAgICAgICB8ICAgICAgfAo+ID4gPiB8ICAgICAg
ICAgICAgICAgICB8ICAgICAgfCBpbmxpbmVfeGF0dHIgICAgICAgfCAyMDAgIHwKPiA+ID4gfCAt
LS0tLS0tLS0tLS0tLS0gfCAtLS0tIHwgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS18Cj4gPiA+
IHwgbmlkIHRhYmxlWzVdICAgIHwgMjAgICB8Cj4gPiA+IHwgbm9kZSBmb290ZXIgICAgIHwgMjQg
ICB8Cj4gPiA+Cj4gPiA+IEYyZnMtdG9vbHMgdG8gc3VwcG9ydCBpbmxpbmUgdGFpbDoKPiA+ID4g
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtZjJmcy1kZXZlbC8yMDI0MDkwMzA3NTkzMS4z
MzM5NTg0LTEtYm8ud3VAdml2by5jb20KPiA+ID4KPiA+ID4gSSB0ZXN0ZWQgaW5saW5lIHRhaWwg
YnkgY29weWluZyB0aGUgc291cmNlIGNvZGUgb2YgTGludXggNi45LjcuIFRoZSBzdG9yYWdlCj4g
PiA+IHNwYWNlIHdhcyByZWR1Y2VkIGJ5IGFwcHJveGltYXRlbHkgOCUuIEFkZGl0aW9uYWxseSwg
ZHVlIHRvIHRoZSByZWR1Y2VkIElPLCB0aGUKPiA+ID4gY29weSB0aW1lIGFsc28gcmVkdWNlZCBi
eSBhcm91bmQgMTAlLgo+ID4gPgo+ID4gPiBUaGlzIHBhdGNoIHNlcmllcyBoYXMgYmVlbiB0ZXN0
ZWQgd2l0aCB4ZnN0ZXN0cyBieSBydW5uaW5nICdrdm0teGZzdGVzdHMgLWMgZjJmcwo+ID4gPiAt
ZyBxdWljaycgYm90aCB3aXRoIGFuZCB3aXRob3V0IHRoZSBwYXRjaDsgbm8gcmVncmVzc2lvbnMg
d2VyZSBvYnNlcnZlZC4KPiA+ID4gVGhlIHRlc3QgcmVzdWx0IGlzOgo+ID4gPiBmMmZzL2RlZmF1
bHQ6IDU4MyB0ZXN0cywgNiBmYWlsdXJlcywgMjEzIHNraXBwZWQsIDY1MCBzZWNvbmRzCj4gPiA+
ICAgRmFpbHVyZXM6IGdlbmVyaWMvMDUwIGdlbmVyaWMvMDY0IGdlbmVyaWMvMjUwIGdlbmVyaWMv
MjUyIGdlbmVyaWMvNTYzCj4gPiA+ICAgICAgIGdlbmVyaWMvNzM1Cj4gPiA+ICAgICAgIFRvdGFs
czogNjA3IHRlc3RzLCAyMTMgc2tpcHBlZCwgMzAgZmFpbHVyZXMsIDAgZXJyb3JzLCA1NzlzCj4g
PiA+Cj4gPiA+IFd1IEJvICgxMyk6Cj4gPiA+ICAgZjJmczogYWRkIGlubGluZSB0YWlsIG1vdW50
IG9wdGlvbgo+ID4gPiAgIGYyZnM6IGFkZCBpbmxpbmUgdGFpbCBkaXNrIGxheW91dCBkZWZpbml0
aW9uCj4gPiA+ICAgZjJmczogaW1wbGVtZW50IGlubGluZSB0YWlsIHdyaXRlICYgdHJ1bmNhdGUK
PiA+ID4gICBmMmZzOiBpbXBsZW1lbnQgaW5saW5lIHRhaWwgcmVhZCAmIGZpZW1hcAo+ID4gPiAg
IGYyZnM6IHNldCBpbmxpbmUgdGFpbCBmbGFnIHdoZW4gY3JlYXRlIGlub2RlCj4gPiA+ICAgZjJm
czogZml4IGFkZHJlc3MgaW5mbyBoYXMgYmVlbiB0cnVuY2F0ZWQKPiA+ID4gICBmMmZzOiBzdXBw
b3J0IHNlZWsgZm9yIGlubGluZSB0YWlsCj4gPiA+ICAgZjJmczogY29udmVydCBpbmxpbmUgdGFp
bCB3aGVuIGlub2RlIGV4cGFuZAo+ID4gPiAgIGYyZnM6IGZpeCBkYXRhIGxvc3MgZHVyaW5nIGlu
bGluZSB0YWlsIHdyaXRpbmcKPiA+ID4gICBmMmZzOiBhdm9pZCBpbmxpbmluZyBxdW90YSBmaWxl
cwo+ID4gPiAgIGYyZnM6IGZpeCBpbmxpbmUgdGFpbCBkYXRhIGxvc3QKPiA+ID4gICBmMmZzOiBj
b252ZXJ0IGlubGluZSB0YWlscyB0byBhdm9pZCBwb3RlbnRpYWwgaXNzdWVzCj4gPiA+ICAgZjJm
czogaW1wbGVtZW50IGlubGluZSB0YWlsIGZvcndhcmQgcmVjb3ZlcnkKPiA+ID4KPiA+ID4gIGZz
L2YyZnMvZGF0YS5jICAgICB8ICA5MyArKysrKysrKysrKysrKysrKysrKysrKysrLQo+ID4gPiAg
ZnMvZjJmcy9mMmZzLmggICAgIHwgIDQ2ICsrKysrKysrKysrKy0KPiA+ID4gIGZzL2YyZnMvZmls
ZS5jICAgICB8ICA4NSArKysrKysrKysrKysrKysrKysrKysrKy0KPiA+ID4gIGZzL2YyZnMvaW5s
aW5lLmMgICB8IDE1OSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0t
LS0KPiA+ID4gIGZzL2YyZnMvaW5vZGUuYyAgICB8ICAgNiArKwo+ID4gPiAgZnMvZjJmcy9uYW1l
aS5jICAgIHwgICAzICsKPiA+ID4gIGZzL2YyZnMvbm9kZS5jICAgICB8ICAgNiArLQo+ID4gPiAg
ZnMvZjJmcy9yZWNvdmVyeS5jIHwgICA5ICsrLQo+ID4gPiAgZnMvZjJmcy9zdXBlci5jICAgIHwg
IDI1ICsrKysrKysKPiA+ID4gIGZzL2YyZnMvdmVyaXR5LmMgICB8ICAgNCArKwo+ID4gPiAgMTAg
ZmlsZXMgY2hhbmdlZCwgNDA5IGluc2VydGlvbnMoKyksIDI3IGRlbGV0aW9ucygtKQo+ID4gPgo+
ID4gPiAtLQo+ID4gPiAyLjM1LjMKPiA+ID4KPiA+ID4KPiA+ID4KPiA+ID4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+ID4gTGludXgtZjJmcy1kZXZl
bCBtYWlsaW5nIGxpc3QKPiA+ID4gTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5u
ZXQKPiA+ID4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGlu
dXgtZjJmcy1kZXZlbAo+ID4KPiA+Cj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+ID4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPiA+IExp
bnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4gPiBodHRwczovL2xpc3RzLnNv
dXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBt
YWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6
Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
