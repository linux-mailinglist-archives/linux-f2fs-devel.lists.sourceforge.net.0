Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B643C96EEC2
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  6 Sep 2024 11:03:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1smUrz-0006eL-TL;
	Fri, 06 Sep 2024 09:03:07 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qkrwngud825@gmail.com>) id 1smUry-0006eF-HE
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 06 Sep 2024 09:03:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jWDTdSp8MaQzxWMHggACQJpon5x26di5jgLCCGz319U=; b=Jl9QnT+rjiE788BFi2Uq8mSWxO
 FDfVAWVUm5Tr0+16IpUhr577d94gzSv+QkoNPixXtfaxHRmE6hv73U4X1O5O68BY9ELk/21vN9XSp
 FQ7acho5+piNE+2Xj+U2pFzHQo5IJbfDLYYQuiK459IUgrZQcsTCECMKU1N6Afz3gEno=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jWDTdSp8MaQzxWMHggACQJpon5x26di5jgLCCGz319U=; b=Hmyp2q/mO5pXsMEE4eLp7gFbDi
 NYfu5pjyMKYTCXmJwjOYSqmmTKxbJAcgesjPDFStw23kTT98XLjamjorhlgd1q3Z4KNyc1nhqjhLy
 BU63dtFhZDmU6x+NSRRFbSoQWrMJv9X0UpXksv5CkG8JcZR2x4EPKQP1/jaR2bcMJLm8=;
Received: from mail-ed1-f42.google.com ([209.85.208.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1smUrx-0004cK-OH for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 06 Sep 2024 09:03:06 +0000
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-5c24c92f699so1836824a12.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 06 Sep 2024 02:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725613374; x=1726218174; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jWDTdSp8MaQzxWMHggACQJpon5x26di5jgLCCGz319U=;
 b=kbsHJ3HkOETZLwZBI7S3EuuNp2Pv9zB1dPNdIBdKBX7BWwpw+rHAV8c587+K1G2RDb
 CbtC7hl5TUwx+nun+qZu8vKyG4Lk5FSL6kxRh7R8DWepgfwUdg5TYsZicMNnje9a7Rn+
 t2kYWmEWpFQw/tF3xkf8s9piPmYzr8E6vxbpYeiDCkeSA81QwJyokhxvWo9TpzPGdBdA
 I2RqlsV4xaVoa3YgNgZUVtgpfGcEF5aP/NX6QY49FIS9KQyWHxU25EiRsIWAH1nnm3mo
 7rAsvcTFiZb4yQiXHRF9Fz8+V2xpjKCjFyuln5HMAbNg4YVzzrVHcofU638tjmfbeUSn
 2ysQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725613374; x=1726218174;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jWDTdSp8MaQzxWMHggACQJpon5x26di5jgLCCGz319U=;
 b=VshIzJ4RNeC9oERKMjBrvzCOTgYzVevOgx+TKGuKfx5UO6VsZ6JjKkEs3X8HkMXYf0
 55hO76oMUNaJRWbmOGTVNCPseFV8G2RSVUYGoC+Gga+CvQSfiIHDNLc8lxgtGmqHSdDg
 hDfxEcVujNrRJxkl9fcKZ6yX9Qe7lKwvcXEU1HOgNFIDQ5FiI9zO97VyKh/yC7Yll4KK
 Vh5qMx9Yra29TQwEpf9UBlqfvbNCrGztlg0gIaXuFjDYbnExbIbMMDS+R/XYc7aOBVpt
 BfRwS2FzK9RTyyMC0J4qQ/T4jlNNsJinm2qxdBDSfq8KSEEk+ImycNTM2UXXHUukxA6s
 Zu4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkab5tRGSb+t7rSp2JsTUTqwxA4hVlLW9Jf5q9D4X07wjntppx4tvGG3sBBFirLzYj99a/rzOmzQJEGQzL8GaE@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzdEwHpXzdNRnuaHtcLPZWMXMa9Fpg7Dyao11BivYZNemDSfH0P
 nBgdsF2vmy5a4BCXzPe01XGRRKucIcgZ3QZiVDs5fjHYFFQlf7dblcSmFLnuNNDU+s/LDfw+8ID
 EsAvHsNxW96kIWsMptlfwoX6R7as=
X-Google-Smtp-Source: AGHT+IGhbjH44iESmJRDI5YEdttWpwN9LgkjOlo15dwFpBWi8wXypKs2uNe88KizYFdj9URI2+1ReXZ0ojziyLKapC8=
X-Received: by 2002:a17:906:fd8b:b0:a8a:809b:14e0 with SMTP id
 a640c23a62f3a-a8a88871d22mr141192366b.48.1725613373791; Fri, 06 Sep 2024
 02:02:53 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1725334811.git.bo.wu@vivo.com>
In-Reply-To: <cover.1725334811.git.bo.wu@vivo.com>
From: Juhyung Park <qkrwngud825@gmail.com>
Date: Fri, 6 Sep 2024 18:02:42 +0900
Message-ID: <CAD14+f2M+C_21h2bV6=GMhNwgWzLVaCL5jv1SQxsuKoveX6P_w@mail.gmail.com>
To: Wu Bo <bo.wu@vivo.com>
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Wu,
 Interesting patch-set. A quick test here on my daily-driver
 phone's data (785558 inodes) with both compression and encryption disabled,
 copied via rsync to 2 fresh f2fs partitions with and without inline tail:
 Before: 17006 [...] 
 Content analysis details:   (0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.208.42 listed in list.dnswl.org]
 0.1 HK_RANDOM_FROM         From username looks random
 0.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [qkrwngud825[at]gmail.com]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [qkrwngud825[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.42 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1smUrx-0004cK-OH
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

SGkgV3UsCgpJbnRlcmVzdGluZyBwYXRjaC1zZXQuCgpBIHF1aWNrIHRlc3QgaGVyZSBvbiBteSBk
YWlseS1kcml2ZXIgcGhvbmUncyBkYXRhICg3ODU1NTggaW5vZGVzKSB3aXRoCmJvdGggY29tcHJl
c3Npb24gYW5kIGVuY3J5cHRpb24gZGlzYWJsZWQsIGNvcGllZCB2aWEgcnN5bmMgdG8gMiBmcmVz
aApmMmZzIHBhcnRpdGlvbnMgd2l0aCBhbmQgd2l0aG91dCBpbmxpbmUgdGFpbDoKQmVmb3JlOiAx
NzAwNjQ5MjhLaUIKQWZ0ZXI6IDE2OTI0OTc4MEtpQgoKU28gYWJvdXQgMC40OCUgc2F2ZWQuCgpM
ZXQgbWUga25vdyBpZiB0aGlzIGlzIGFuIHVuZXhwZWN0ZWQgcmVzdWx0LgoKVGhhbmtzLAoKT24g
VHVlLCBTZXAgMywgMjAyNCBhdCA1OjQy4oCvUE0gV3UgQm8gdmlhIExpbnV4LWYyZnMtZGV2ZWwK
PGxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0PiB3cm90ZToKPgo+IFRoZSBp
bm9kZSBpbiBGMkZTIG9jY3VwaWVzIGFuIGVudGlyZSA0ayBibG9jay4gRm9yIG1hbnkgc21hbGwg
ZmlsZXMsIHRoaXMgbWVhbnMKPiB0aGV5IGNvbnN1bWUgbXVjaCBtb3JlIHNwYWNlIHRoYW4gdGhl
aXIgYWN0dWFsIHNpemUuIFRoZXJlZm9yZSwgdGhlcmUgaXMKPiBzaWduaWZpY2FudCBwb3RlbnRp
YWwgdG8gYmV0dGVyIHV0aWxpemUgdGhlIGlub2RlIGJsb2NrIHNwYWNlLgo+Cj4gQ3VycmVudGx5
LCBGMkZTIGhhcyB0d28gZmVhdHVyZXMgdG8gbWFrZSB1c2Ugb2YgdGhlIGlub2RlIGJsb2NrIHNw
YWNlOiBpbmxpbmUKPiBkYXRhIGFuZCBpbmxpbmUgeGF0dHIuCj4KPiBJbmxpbmUgZGF0YSBzdG9y
ZXMgZmlsZSB3aGljaCBzaXplIGlzIHNtYWxsZXIgdGhlbiAzLjVrIGluIGlub2RlIGJsb2NrLiBI
b3dldmVyLAo+IGZvciBzbGlnaHRseSBsYXJnZXIgc21hbGwgZmlsZXMsIHRoZXJlIHN0aWxsIGhh
dmUgbXVjaCB3YXN0ZS4KPiBGb3IgZXhhbXBsZSwgYSA1ayBmaWxlIHJlcXVpcmVzIDMgYmxvY2tz
LCB0b3RhbGluZyAxMmsgb2Ygc3BhY2UsIHdoaWNoIGlzCj4gbW9yZSB0aGFuIHR3aWNlIHRoZSBz
aXplIG9mIHRoZSBmaWxlIGl0c2VsZiEKPgo+IEFkZGl0aW9uYWxseSwgdGhlIGVuZCBvZiBhIGZp
bGUgb2Z0ZW4gZG9lcyBub3Qgb2NjdXB5IGFuIGVudGlyZSBibG9jay4gSWYgd2UgY2FuCj4gc3Rv
cmUgdGhlIGVuZCBvZiB0aGUgZmlsZSBkYXRhIHdpdGhpbiB0aGUgaW5vZGUgYmxvY2ssIHdlIGNh
biBzYXZlIGFuIGVudGlyZQo+IGJsb2NrIGZvciB0aGUgZmlsZS4gVGhpcyBpcyBwYXJ0aWN1bGFy
bHkgaW1wb3J0YW50IGZvciBzbWFsbCBmaWxlcy4KPgo+IEluIGZhY3QsIHRoZSBjdXJyZW50IGlu
bGluZSBkYXRhIGlzIGEgc3BlY2lhbCBjYXNlIG9mIGlubGluZSB0YWlsLCBhbmQKPiBpbmxpbmUg
dGFpbCBpcyBhbiBleHRlbnNpb24gb2YgaW5saW5lIGRhdGEuCj4KPiBUbyBtYWtlIGl0IHNpbXBs
ZSwgaW5saW5lIHRhaWwgb25seSBvbiBzbWFsbCBmaWxlcyg8NjRrKS4gQW5kIGZvciBsYXJnZXIg
ZmlsZXMsCj4gaW5saW5lIHRhaWxzIGRvbid0IHByb3ZpZGUgYW55IHNpZ25pZmljYW50IGJlbmVm
aXRzLgo+Cj4gVGhlIGxheW91dCBvZiBhbiBpbmxpbmUgdGFpbCBpbm9kZSBibG9jayBpcyBmb2xs
b3dpbmc6Cj4KPiB8IGlub2RlIGJsb2NrICAgICB8IDQwOTYgfCAgICAgaW5saW5lIHRhaWwgZW5h
YmxlICAgIHwKPiB8IC0tLS0tLS0tLS0tLS0tLSB8IC0tLS0gfCAtLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLXwKPiB8IGlub2RlIGluZm8gICAgICB8IDM2MCAgfCAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwKPiB8IC0tLS0tLS0tLS0tLS0tLSB8IC0tLS0gfCAtLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLXwKPiB8ICAgICAgICAgICAgICAgICB8ICAgICAgfCBleHRyYSBpbmZvICAgICAgICAg
fCAwfjM2IHwKPiB8ICAgICAgICAgICAgICAgICB8ICAgICAgfCAqKmNvbXBhY3RfYWRkclsxNl0g
fCA2NCAgIHwKPiB8IGFkZHIgdGFibGVbOTIzXSB8IDM2OTIgfCByZXNlcnZlZCAgICAgICAgICAg
fCA0ICAgIHwKPiB8ICAgICAgICAgICAgICAgICB8ICAgICAgfCAqKnRhaWwgZGF0YSAgICAgICAg
fCAgICAgIHwKPiB8ICAgICAgICAgICAgICAgICB8ICAgICAgfCBpbmxpbmVfeGF0dHIgICAgICAg
fCAyMDAgIHwKPiB8IC0tLS0tLS0tLS0tLS0tLSB8IC0tLS0gfCAtLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLXwKPiB8IG5pZCB0YWJsZVs1XSAgICB8IDIwICAgfAo+IHwgbm9kZSBmb290ZXIgICAg
IHwgMjQgICB8Cj4KPiBGMmZzLXRvb2xzIHRvIHN1cHBvcnQgaW5saW5lIHRhaWw6Cj4gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtZjJmcy1kZXZlbC8yMDI0MDkwMzA3NTkzMS4zMzM5NTg0
LTEtYm8ud3VAdml2by5jb20KPgo+IEkgdGVzdGVkIGlubGluZSB0YWlsIGJ5IGNvcHlpbmcgdGhl
IHNvdXJjZSBjb2RlIG9mIExpbnV4IDYuOS43LiBUaGUgc3RvcmFnZQo+IHNwYWNlIHdhcyByZWR1
Y2VkIGJ5IGFwcHJveGltYXRlbHkgOCUuIEFkZGl0aW9uYWxseSwgZHVlIHRvIHRoZSByZWR1Y2Vk
IElPLCB0aGUKPiBjb3B5IHRpbWUgYWxzbyByZWR1Y2VkIGJ5IGFyb3VuZCAxMCUuCj4KPiBUaGlz
IHBhdGNoIHNlcmllcyBoYXMgYmVlbiB0ZXN0ZWQgd2l0aCB4ZnN0ZXN0cyBieSBydW5uaW5nICdr
dm0teGZzdGVzdHMgLWMgZjJmcwo+IC1nIHF1aWNrJyBib3RoIHdpdGggYW5kIHdpdGhvdXQgdGhl
IHBhdGNoOyBubyByZWdyZXNzaW9ucyB3ZXJlIG9ic2VydmVkLgo+IFRoZSB0ZXN0IHJlc3VsdCBp
czoKPiBmMmZzL2RlZmF1bHQ6IDU4MyB0ZXN0cywgNiBmYWlsdXJlcywgMjEzIHNraXBwZWQsIDY1
MCBzZWNvbmRzCj4gICBGYWlsdXJlczogZ2VuZXJpYy8wNTAgZ2VuZXJpYy8wNjQgZ2VuZXJpYy8y
NTAgZ2VuZXJpYy8yNTIgZ2VuZXJpYy81NjMKPiAgICAgICBnZW5lcmljLzczNQo+ICAgICAgIFRv
dGFsczogNjA3IHRlc3RzLCAyMTMgc2tpcHBlZCwgMzAgZmFpbHVyZXMsIDAgZXJyb3JzLCA1Nzlz
Cj4KPiBXdSBCbyAoMTMpOgo+ICAgZjJmczogYWRkIGlubGluZSB0YWlsIG1vdW50IG9wdGlvbgo+
ICAgZjJmczogYWRkIGlubGluZSB0YWlsIGRpc2sgbGF5b3V0IGRlZmluaXRpb24KPiAgIGYyZnM6
IGltcGxlbWVudCBpbmxpbmUgdGFpbCB3cml0ZSAmIHRydW5jYXRlCj4gICBmMmZzOiBpbXBsZW1l
bnQgaW5saW5lIHRhaWwgcmVhZCAmIGZpZW1hcAo+ICAgZjJmczogc2V0IGlubGluZSB0YWlsIGZs
YWcgd2hlbiBjcmVhdGUgaW5vZGUKPiAgIGYyZnM6IGZpeCBhZGRyZXNzIGluZm8gaGFzIGJlZW4g
dHJ1bmNhdGVkCj4gICBmMmZzOiBzdXBwb3J0IHNlZWsgZm9yIGlubGluZSB0YWlsCj4gICBmMmZz
OiBjb252ZXJ0IGlubGluZSB0YWlsIHdoZW4gaW5vZGUgZXhwYW5kCj4gICBmMmZzOiBmaXggZGF0
YSBsb3NzIGR1cmluZyBpbmxpbmUgdGFpbCB3cml0aW5nCj4gICBmMmZzOiBhdm9pZCBpbmxpbmlu
ZyBxdW90YSBmaWxlcwo+ICAgZjJmczogZml4IGlubGluZSB0YWlsIGRhdGEgbG9zdAo+ICAgZjJm
czogY29udmVydCBpbmxpbmUgdGFpbHMgdG8gYXZvaWQgcG90ZW50aWFsIGlzc3Vlcwo+ICAgZjJm
czogaW1wbGVtZW50IGlubGluZSB0YWlsIGZvcndhcmQgcmVjb3ZlcnkKPgo+ICBmcy9mMmZzL2Rh
dGEuYyAgICAgfCAgOTMgKysrKysrKysrKysrKysrKysrKysrKysrKy0KPiAgZnMvZjJmcy9mMmZz
LmggICAgIHwgIDQ2ICsrKysrKysrKysrKy0KPiAgZnMvZjJmcy9maWxlLmMgICAgIHwgIDg1ICsr
KysrKysrKysrKysrKysrKysrKysrLQo+ICBmcy9mMmZzL2lubGluZS5jICAgfCAxNTkgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tCj4gIGZzL2YyZnMvaW5vZGUu
YyAgICB8ICAgNiArKwo+ICBmcy9mMmZzL25hbWVpLmMgICAgfCAgIDMgKwo+ICBmcy9mMmZzL25v
ZGUuYyAgICAgfCAgIDYgKy0KPiAgZnMvZjJmcy9yZWNvdmVyeS5jIHwgICA5ICsrLQo+ICBmcy9m
MmZzL3N1cGVyLmMgICAgfCAgMjUgKysrKysrKwo+ICBmcy9mMmZzL3Zlcml0eS5jICAgfCAgIDQg
KysKPiAgMTAgZmlsZXMgY2hhbmdlZCwgNDA5IGluc2VydGlvbnMoKyksIDI3IGRlbGV0aW9ucygt
KQo+Cj4gLS0KPiAyLjM1LjMKPgo+Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4gTGludXgt
ZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPiBodHRwczovL2xpc3RzLnNvdXJjZWZv
cmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5n
IGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0
cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
