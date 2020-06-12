Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9EB1F711F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Jun 2020 02:01:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jjX8e-0001Nv-NK; Fri, 12 Jun 2020 00:01:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1jjX8P-0001NN-1j
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 12 Jun 2020 00:01:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=69MnTpFDJK4LtDPAHdkNHQCCDPBuXyYRUZTZxf0W1QA=; b=PFoZl08QUvYUupBP2mNzKWz7L8
 mFHZ6vDcfA3freSli/b5eRjIg1z4Th+p0jaBc+qqC59xG6mT8wS3c2JOeiX/2RgGEvATN3o2i9PnL
 J90PphUi4kYdQYC0Q4ih55sM+6GHYZtDSSPfWEewVt/bm+I1F0SXLs9tAdnqYpoUgRLE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=69MnTpFDJK4LtDPAHdkNHQCCDPBuXyYRUZTZxf0W1QA=; b=ORtLmU6gowD6V0X8+Zo5Mh27Ag
 3GdKBdFCYHq4OJ5pSP7m9e8Sjoc7ucvQVmQE+tkVtOWn1UbYon/mCo+sR8Xhq6Uh0QH7iDeej8ekc
 2raD80xrBnxGgEMLAGWA/ZvppX11GtobWaAc33NAgpSno/v5UvsYIGYrkZpuA/qIp/yU=;
Received: from mail-lj1-f194.google.com ([209.85.208.194])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jjX8N-002YmZ-Jj
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 12 Jun 2020 00:01:25 +0000
Received: by mail-lj1-f194.google.com with SMTP id n24so9002041lji.10
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 11 Jun 2020 17:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=69MnTpFDJK4LtDPAHdkNHQCCDPBuXyYRUZTZxf0W1QA=;
 b=JKqqRUn9urXpgo+mw0qGabqO3diMkUoq6fb8MaF7hRwxtNrUQ3YFkp7m71qOR0xgnq
 vAxB+FD0hTfdvpxj77Y7u9hKh33BmXscgIT6xsrRxRzAPXGgyBpcbLRk+g2KCGWZlVCo
 S32qiOpKaGpAuDLGaXYJjVLGYSJHROWvMFU/sSLWbmMR8et5500nIFLUJmtDGY04kklT
 DQI08qWjfKpJoW6Ovzh4AjK49JwTi4TogwTqTi+zZ5s10F2nmKllNL9eultVp6x/6fl5
 y75H5OBAZ2gvQd0V8+2R9PZ62RbIEmQBUQAxbibUZnAFMyMlEQv4Jbyz/vzxKHnReEqS
 r4WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=69MnTpFDJK4LtDPAHdkNHQCCDPBuXyYRUZTZxf0W1QA=;
 b=LzkfmAXlwd0m4GkzJyE88LmHNjpY59CFoeDNATHmaGW3VpdqZBdqjaZUCUvqW0LKhf
 D5e9bN14esaz3cp7sEduM88b5Nwyxrx5MByGTovWYrnq2422CD5SoIY+0WZ5HBzy/pwh
 a8wrX5L5DK8+Hfr3hHH26rw1iSTYjjR/kUbYasJdUwARlFYVP1ng0H1/rs1iQY6ML0hI
 PI5y6IsaaAliEiq3tQyj3CJhEJZhLL9JJR2/gF6LGiwPZtO8rkTtd4kk16SD74q/m+Q6
 8BM1UhcUPi/EOJOTZ2lRr3UUDoo8OfRIubuDzAdl/Ur5v1WxETvA4Y6S3LzD7A3GdqsI
 tNgw==
X-Gm-Message-State: AOAM533yHYUJ+jY5JP5xfJwJvnJVPiCuPc9o8shNAPXKaUbX4cs9Loxu
 +5heAo48SyyPDnbyc55bM6EUDzOz7HskXk6TPAA=
X-Google-Smtp-Source: ABdhPJzrlEajDrnfjNM3TEqVmLY4lQVwpZwf2IKM3U82wD8FutIWkee2t3UponlBZu6OMjSr7pg49nRJ4KR8skeqvso=
X-Received: by 2002:a2e:8107:: with SMTP id d7mr5820605ljg.363.1591920069655; 
 Thu, 11 Jun 2020 17:01:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200611031652.200401-1-daeho43@gmail.com>
 <20200611162721.GB1152@sol.localdomain>
 <CACOAw_zKC24BhNOF2BpuRfuYzBEsis82MafU9HqXwLj2sZ3Azg@mail.gmail.com>
 <20200611230043.GA18185@gmail.com>
In-Reply-To: <20200611230043.GA18185@gmail.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Fri, 12 Jun 2020 09:00:58 +0900
Message-ID: <CACOAw_zZY4W9PYY4VAZ_5tGB5LxCEZKh6Sc523MRzVCvKNhinQ@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.194 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.194 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jjX8N-002YmZ-Jj
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: add F2FS_IOC_SEC_TRIM_FILE ioctl
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

Rm9yIHRoZSBpbmNyZW1lbnRhbCB3YXkgb2YgZXJhc2luZywgd2UgbWlnaHQgYXMgd2VsbCBzdXBw
b3J0IHRoZQoob2Zmc2V0LCBsZW5ndGgpIG9wdGlvbiBpbiBhIHVuaXQgb2YgNEtpQi4KClNvLCB5
b3UgbWlnaHQgdXNlIHRoaXMgaW9jdGwgbGlrZSB0aGUgYmVsb3cuIERvZXMgaXQgd29yayBmb3Ig
eW91PwpzdHJ1Y3QgZjJmc19zZWNfdHJpbSB7CiAgICAgICAgdTY0IHN0YXJ0YmxrOwogICAgICAg
IHU2NCBibGtsZW47CiAgICAgICAgdTMyIGZsYWdzOwp9OwoKc2VjdHJpbS5zdGFydGJsayA9IDA7
CnNlY3RyaW0uYmxrbGVuID0gMjU2OyAgICAgLy8gMU1pQgpzZWN0cmltLmZsYWdzID0gRjJGU19U
UklNX0ZJTEVfRElTQ0FSRCB8IEYyRlNfVFJJTV9GSUxFX1pFUk9PVVQ7CnJldCA9IGlvY3RsKGZk
LCBGMkZTX1NFQ19UUklNX0ZJTEUsICZzZWN0cmltKTsKCjIwMjDrhYQgNuyblCAxMuydvCAo6riI
KSDsmKTsoIQgODowMCwgRXJpYyBCaWdnZXJzIDxlYmlnZ2Vyc0BrZXJuZWwub3JnPuuLmOydtCDs
npHshLE6Cgo+Cj4gT24gRnJpLCBKdW4gMTIsIDIwMjAgYXQgMDc6NDk6MTJBTSArMDkwMCwgRGFl
aG8gSmVvbmcgd3JvdGU6Cj4gPiAyMDIw64WEIDbsm5QgMTLsnbwgKOq4iCkg7Jik7KCEIDE6Mjcs
IEVyaWMgQmlnZ2VycyA8ZWJpZ2dlcnNAa2VybmVsLm9yZz7ri5jsnbQg7J6R7ISxOgo+ID4gPgo+
ID4gPiBPbiBUaHUsIEp1biAxMSwgMjAyMCBhdCAxMjoxNjo1MlBNICswOTAwLCBEYWVobyBKZW9u
ZyB3cm90ZToKPiA+ID4gPiArICAgICBmb3IgKGluZGV4ID0gcGdfc3RhcnQ7IGluZGV4IDwgcGdf
ZW5kOykgewo+ID4gPiA+ICsgICAgICAgICAgICAgc3RydWN0IGRub2RlX29mX2RhdGEgZG47Cj4g
PiA+ID4gKyAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgZW5kX29mZnNldDsKPiA+ID4gPiArCj4g
PiA+ID4gKyAgICAgICAgICAgICBzZXRfbmV3X2Rub2RlKCZkbiwgaW5vZGUsIE5VTEwsIE5VTEws
IDApOwo+ID4gPiA+ICsgICAgICAgICAgICAgcmV0ID0gZjJmc19nZXRfZG5vZGVfb2ZfZGF0YSgm
ZG4sIGluZGV4LCBMT09LVVBfTk9ERSk7Cj4gPiA+ID4gKyAgICAgICAgICAgICBpZiAocmV0KQo+
ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICBnb3RvIG91dDsKPiA+ID4gPiArCj4gPiA+ID4g
KyAgICAgICAgICAgICBlbmRfb2Zmc2V0ID0gQUREUlNfUEVSX1BBR0UoZG4ubm9kZV9wYWdlLCBp
bm9kZSk7Cj4gPiA+ID4gKyAgICAgICAgICAgICBpZiAocGdfZW5kIDwgZW5kX29mZnNldCArIGlu
ZGV4KQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICBlbmRfb2Zmc2V0ID0gcGdfZW5kIC0g
aW5kZXg7Cj4gPiA+ID4gKwo+ID4gPiA+ICsgICAgICAgICAgICAgZm9yICg7IGRuLm9mc19pbl9u
b2RlIDwgZW5kX29mZnNldDsKPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBk
bi5vZnNfaW5fbm9kZSsrLCBpbmRleCsrKSB7Cj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAg
IHN0cnVjdCBibG9ja19kZXZpY2UgKmN1cl9iZGV2Owo+ID4gPiA+ICsgICAgICAgICAgICAgICAg
ICAgICBibG9ja190IGJsa2FkZHIgPSBmMmZzX2RhdGFfYmxrYWRkcigmZG4pOwo+ID4gPiA+ICsK
PiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgaWYgKF9faXNfdmFsaWRfZGF0YV9ibGthZGRy
KGJsa2FkZHIpKSB7Cj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaWYgKCFm
MmZzX2lzX3ZhbGlkX2Jsa2FkZHIoRjJGU19JX1NCKGlub2RlKSwKPiA+ID4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJsa2FkZHIsIERBVEFfR0VORVJJQ19FTkhBTkNF
KSkgewo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0ID0g
LUVGU0NPUlJVUFRFRDsKPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGdvdG8gb3V0Owo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH0KPiA+
ID4gPiArICAgICAgICAgICAgICAgICAgICAgfSBlbHNlCj4gPiA+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgY29udGludWU7Cj4gPiA+ID4gKwo+ID4gPiA+ICsgICAgICAgICAgICAg
ICAgICAgICBjdXJfYmRldiA9IGYyZnNfdGFyZ2V0X2RldmljZShzYmksIGJsa2FkZHIsIE5VTEwp
Owo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICBpZiAoZjJmc19pc19tdWx0aV9kZXZpY2Uo
c2JpKSkgewo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGludCBpID0gZjJm
c190YXJnZXRfZGV2aWNlX2luZGV4KHNiaSwgYmxrYWRkcik7Cj4gPiA+ID4gKwo+ID4gPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJsa2FkZHIgLT0gRkRFVihpKS5zdGFydF9ibGs7
Cj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgIH0KPiA+ID4gPiArCj4gPiA+ID4gKyAgICAg
ICAgICAgICAgICAgICAgIGlmIChsZW4pIHsKPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBpZiAocHJldl9iZGV2ID09IGN1cl9iZGV2ICYmCj4gPiA+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBibGthZGRyID09IHByZXZfYmxvY2sgKyBsZW4pIHsK
PiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxlbisrOwo+ID4g
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH0gZWxzZSB7Cj4gPiA+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXQgPSBmMmZzX3NlY3VyZV9lcmFzZShw
cmV2X2JkZXYsCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcHJldl9ibG9jaywgbGVuLCBmbGFncyk7Cj4gPiA+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpZiAocmV0KQo+ID4gPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBnb3RvIG91dDsKPiA+ID4gPiArCj4g
PiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsZW4gPSAwOwo+ID4g
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH0KPiA+ID4gPiArICAgICAgICAgICAg
ICAgICAgICAgfQo+ID4gPiA+ICsKPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgaWYgKCFs
ZW4pIHsKPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwcmV2X2JkZXYgPSBj
dXJfYmRldjsKPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwcmV2X2Jsb2Nr
ID0gYmxrYWRkcjsKPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsZW4gPSAx
Owo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICB9Cj4gPiA+ID4gKyAgICAgICAgICAgICB9
Cj4gPiA+ID4gKwo+ID4gPiA+ICsgICAgICAgICAgICAgZjJmc19wdXRfZG5vZGUoJmRuKTsKPiA+
ID4gPiArICAgICB9Cj4gPiA+Cj4gPiA+IFRoaXMgbG9vcCBwcm9jZXNzZXMgdGhlIGVudGlyZSBm
aWxlLCB3aGljaCBtYXkgYmUgdmVyeSBsYXJnZS4gIFNvIGl0IGNvdWxkIHRha2UKPiA+ID4gYSB2
ZXJ5IGxvbmcgdGltZSB0byBleGVjdXRlLgo+ID4gPgo+ID4gPiBJdCBzaG91bGQgYXQgbGVhc3Qg
dXNlIHRoZSBmb2xsb3dpbmcgdG8gbWFrZSB0aGUgdGFzayBraWxsYWJsZSBhbmQgcHJlZW1wdGli
bGU6Cj4gPiA+Cj4gPiA+ICAgICAgICAgICAgICAgICBpZiAoZmF0YWxfc2lnbmFsX3BlbmRpbmco
Y3VycmVudCkpIHsKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgZXJyID0gLUVJTlRSOwo+
ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICBnb3RvIG91dDsKPiA+ID4gICAgICAgICAgICAg
ICAgIH0KPiA+ID4gICAgICAgICAgICAgICAgIGNvbmRfcmVzY2hlZCgpOwo+ID4gPgo+ID4KPiA+
IEdvb2QgcG9pbnQhCj4gPgo+ID4gPiBBbHNvLCBwZXJoYXBzIHRoaXMgaW9jdGwgc2hvdWxkIGJl
IG1hZGUgaW5jcmVtZW50YWwsIGkuZS4gdGFrZSBpbiBhbgo+ID4gPiAob2Zmc2V0LCBsZW5ndGgp
IGxpa2UgcHdyaXRlKCk/Cj4gPiA+Cj4gPiA+IC0gRXJpYwo+ID4KPiA+IERpc2NhcmQgYW5kIFpl
cm9pbmcgd2lsbCBiZSB0cmVhdGVkIGluIGEgdW5pdCBvZiBibG9jaywgd2hpY2ggaXMgNEtCCj4g
PiBpbiBGMkZTIGNhc2UuCj4gPiBEbyB5b3UgcmVhbGx5IG5lZWQgdGhlIChvZmZzZXQsIGxlbmd0
aCkgb3B0aW9uIGhlcmUgZXZlbiBpZiB0aGUgdW5pdAo+ID4gaXMgYSA0S0IgYmxvY2s/IEkgZ3Vl
c3MgdGhpcyBvcHRpb24gbWlnaHQgbWFrZSB0aGUgdXNlciBldmVuCj4gPiBpbmNvbnZlbmllbmNl
ZCB0byB1c2UgdGhpcyBpb2N0bCwgYmVjYXVzZSB0aGV5IGhhdmUgdG8gYmVhciA0S0IKPiA+IGFs
aWdubWVudCBpbiBtaW5kLgo+Cj4gVGhlIGlvY3RsIGFzIGN1cnJlbnRseSBwcm9wb3NlZCBhbHdh
eXMgZXJhc2VzIHRoZSBlbnRpcmUgZmlsZSwgd2hpY2ggY291bGQgYmUKPiBnaWdhYnl0ZXMuICBU
aGF0IGNvdWxkIHRha2UgYSB2ZXJ5IGxvbmcgdGltZS4KPgo+IEknbSBzdWdnZXN0aW5nIGNvbnNp
ZGVyaW5nIG1ha2luZyBpdCBwb3NzaWJsZSB0byBjYWxsIHRoZSBpb2N0bCBtdWx0aXBsZSB0aW1l
cwo+IHRvIHByb2Nlc3MgdGhlIGZpbGUgaW5jcmVtZW50YWxseSwgbGlrZSB5b3Ugd291bGQgZG8g
d2l0aCB3cml0ZSgpIG9yIHB3cml0ZSgpLgo+Cj4gVGhhdCBpbXBsaWVzIHRoYXQgZm9yIGVhY2gg
aW9jdGwgY2FsbCwgdGhlIGxlbmd0aCB3b3VsZCBuZWVkIHRvIGJlIHNwZWNpZmllZAo+IHVubGVz
cyBpdCdzIGhhcmRjb2RlZCB0byA0S2lCIHdoaWNoIHdvdWxkIGJlIHZlcnkgaW5lZmZpY2llbnQu
ICBVc2VycyB3b3VsZAo+IHByb2JhYmx5IHdhbnQgdG8gcHJvY2VzcyBhIGxhcmdlciBhbW91bnQg
YXQgYSB0aW1lLCBsaWtlIDEgTWlCLCByaWdodD8KPgo+IExpa2V3aXNlIHRoZSBvZmZzZXQgd291
bGQgbmVlZCB0byBiZSBzcGVjaWZpZWQgYXMgd2VsbCwgdW5sZXNzIGl0IHdlcmUgdG8gYmUKPiB0
YWtlbiBpbXBsaWNpdGx5IGZyb20gZl9wb3MuCj4KPiAtIEVyaWMKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcg
bGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3Rz
LnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
