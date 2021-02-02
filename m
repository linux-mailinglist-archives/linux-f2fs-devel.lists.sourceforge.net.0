Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C15330BB49
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  2 Feb 2021 10:45:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l6sFG-0000La-Kk; Tue, 02 Feb 2021 09:45:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1l6sFE-0000LN-Gq
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Feb 2021 09:45:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H63nqhu+RhN0uSPLDKy0j8fY+pttJoRRoiZky9oT7bg=; b=cErCGPkEu2Oq062KYChk+04IZV
 77ZdvJRAEWBJqzoZb8OWBCU1j7ImGS/eXMF0pNTD/i6+TigQ3bvQdmfBagujM3TxZieA9OeT7jZ41
 eUX3YRyfF3ihFpPGQALwLtU2SzkwK1d00Ql4PfMR5Oc4Er+qNxm78C8QNT96wRqesIVk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=H63nqhu+RhN0uSPLDKy0j8fY+pttJoRRoiZky9oT7bg=; b=cznw5TScxf2aX08brsyFCMhMcq
 nS3UnWejMtP3q4J/45ZuM6nGvFWPNiynQcB5S4Te61fHj+TuY+T4DTb7hW4L+bfXQeJqDp/K4ptLd
 ON71bNUN0/KoWHXOgIXpkmar6J4Zu15lhX5qblyx9zcJIcBy1RiVT+HvtPe+Pqmjpcnw=;
Received: from mail-lj1-f181.google.com ([209.85.208.181])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1l6sF7-0001V6-Hn
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Feb 2021 09:45:12 +0000
Received: by mail-lj1-f181.google.com with SMTP id b20so15335397ljo.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 02 Feb 2021 01:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=H63nqhu+RhN0uSPLDKy0j8fY+pttJoRRoiZky9oT7bg=;
 b=eqvbHSYuz2g9HMf8exvniz/ZFDDtc4+uUsO5u2HgSGQjQZmuQu8WkrZPRAGVIqm+cZ
 iGpSN4+ZJPjFuOWhbL6zIg0Et8K19XdkZ1inOEcitx2GH/NaasPLM/UdoJKU9En+kvNN
 VWCSRSE+4GGJeHtXqRmQXod3jt8RleUTbv4Rqt+I8MC8pIvi+GHBQJF6pmiF7J2Kr79k
 OHauXtZDJcEvpIaW1Oar2FGZiViVoC4/quU6++kCgbxZU95z5VvYs9NJuo4n08gHrEeE
 E/Yim1vm41k/gdJe/ougoG/PKMN7pn+Ch764S3Ll/iQpefsEH6pdlVsZVRJzaj/QVYw2
 fVBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=H63nqhu+RhN0uSPLDKy0j8fY+pttJoRRoiZky9oT7bg=;
 b=ML3GLG+NggtXDty8RYnO+yOaLF81Bbsr/0lCWutu6q0rtq66fGaaaDexD07epWSRMM
 ouS6wYUYzVxcvLD/qbwHW7OcJ6vLkLrOkevhLml/t+lgwQTuuSTv97QWfeNlnyqyjUBf
 FECKjuPdPmAXPhTNFqGVf+SEbqN9kn8+7lfIG3/WBii/JooGwTgriUAND/HQRvshI2oh
 OzefYEjtk/Q4mvCtTEPAlqLLPVIa0rxEf6nNq54oi9s2G1hO32kehj0xCW+k4suUtkms
 KcgcBmjkkr3PouFg0moR2A8OvXiMr7QrvMAhZpy5JyneuQN++viS++U2tYmTULDnHq7l
 fNug==
X-Gm-Message-State: AOAM531wl6tYx92tYmJ9lDtTP0dTlejAnZLAkh9+GZbZhdHhQGw3edC3
 7T22YeeHawRJ2l3NnVEwlQ5dNVgMnKFSVfdoSd0=
X-Google-Smtp-Source: ABdhPJyRzhSfipXG8bDr4UZFi4qZIP9QUEg3fmowPo8TS6/UPq+AabjJ22y2C+42uiggWRQdUMXEo/wg/Fo11goRE6k=
X-Received: by 2002:a2e:a366:: with SMTP id i6mr12669282ljn.21.1612259099110; 
 Tue, 02 Feb 2021 01:44:59 -0800 (PST)
MIME-Version: 1.0
References: <20210202092332.2562006-1-daeho43@gmail.com>
 <a7adaf99-0df1-cf4a-a60a-d47a104f51aa@huawei.com>
In-Reply-To: <a7adaf99-0df1-cf4a-a60a-d47a104f51aa@huawei.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Tue, 2 Feb 2021 18:44:48 +0900
Message-ID: <CACOAw_wmodtCvDRa_1hh2=u9AP3Qg6VBGG4K1by9QJNGweApVA@mail.gmail.com>
To: Chao Yu <yuchao0@huawei.com>
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.181 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.181 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1l6sF7-0001V6-Hn
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: rename checkpoint=merge mount
 option to checkpoint_merge
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

V2hlbiB3ZSByZW1vdW50IGl0IHdpdGhvdXQgdGhlICJjaGVja3BvaW50X21lcmdlIiBvcHRpb24s
IHNob3VsZG4ndCB3ZQpuZWVkIHRvIGNsZWFyICJNRVJHRV9DSEVDS1BPSU5UIiBhZ2Fpbj8KVGhp
cyBpcyBhY3R1YWxseSB3aGF0IEkgaW50ZW5kZWQsIGJ1dCBJIHdhcyB3cm9uZy4gQWN0dWFsbHks
IEkgZm91bmQgdGhpcy4KCldoZW4gd2UgcmVtb3VudCB0aGUgZmlsZXN5c3RlbSwgdGhlIHByZXZp
b3VzIG1vdW50IG9wdGlvbiBpcyBwYXNzZWQKdGhyb3VnaCB0aGUgImRhdGEiIGFyZ3VtZW50IGlu
IHRoZSBiZWxvdy4KZjJmc19yZW1vdW50KHN0cnVjdCBzdXBlcl9ibG9jayAqc2IsIGludCAqZmxh
Z3MsIGNoYXIgKmRhdGEpCgpJZiB3ZSBkb24ndCBwcm92aWRlIHRoZSAibm9jaGVja3BvaW50X21l
cmdlIiBvcHRpb24sIGhvdyBjYW4gd2UgdHVybgpvZmYgdGhlICJjaGVja3BvaW50X21lcmdlIiBv
cHRpb24gd2hpY2ggaXMgdHVybmVkIG9uIGluIHRoZSBwcmV2aW91cwptb3VudD8KCjIwMjHrhYQg
MuyblCAy7J28ICjtmZQpIOyYpO2bhCA2OjI4LCBDaGFvIFl1IDx5dWNoYW8wQGh1YXdlaS5jb20+
64uY7J20IOyekeyEsToKPgo+IE9uIDIwMjEvMi8yIDE3OjIzLCBEYWVobyBKZW9uZyB3cm90ZToK
PiA+IEZyb206IERhZWhvIEplb25nIDxkYWVob2plb25nQGdvb2dsZS5jb20+Cj4gPgo+ID4gQXMg
Y2hlY2twb2ludD1tZXJnZSBjb21lcyBpbiwgbW91bnQgb3B0aW9uIHNldHRpbmcgcmVsYXRlZCB0
byBjaGVja3BvaW50Cj4gPiBoYWQgYmVlbiBtaXhlZCB1cCBhbmQgaXQgYmVjYW1lIGhhcmQgdG8g
dW5kZXJzdGFuZC4gU28sIEkgc2VwYXJhdGVkCj4gPiB0aGlzIG9wdGlvbiBmcm9tICJjaGVja3Bv
aW50PSIgYW5kIG1hZGUgYW5vdGhlciBtb3VudCBvcHRpb24KPiA+ICJjaGVja3BvaW50X21lcmdl
IiBmb3IgdGhpcy4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBEYWVobyBKZW9uZyA8ZGFlaG9qZW9u
Z0Bnb29nbGUuY29tPgo+ID4gLS0tCj4gPiB2MjogcmVuYW1lZCAiY2hlY2twb2ludD1tZXJnZSIg
dG8gImNoZWNrcG9pbnRfbWVyZ2UiCj4gPiB2MzogcmVtb3ZlZCAibm9jaGVja3BvaW50X21lcmdl
IiBvcHRpb24KPiA+IC0tLQo+ID4gICBEb2N1bWVudGF0aW9uL2ZpbGVzeXN0ZW1zL2YyZnMucnN0
IHwgIDYgKysrLS0tCj4gPiAgIGZzL2YyZnMvc3VwZXIuYyAgICAgICAgICAgICAgICAgICAgfCAy
MSArKysrKysrKystLS0tLS0tLS0tLS0KPiA+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRp
b25zKCspLCAxNSBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9maWxlc3lzdGVtcy9mMmZzLnJzdCBiL0RvY3VtZW50YXRpb24vZmlsZXN5c3RlbXMvZjJmcy5y
c3QKPiA+IGluZGV4IGQwZWFkNDVkYzcwNi4uNDc1OTk0ZWQ4YjE1IDEwMDY0NAo+ID4gLS0tIGEv
RG9jdW1lbnRhdGlvbi9maWxlc3lzdGVtcy9mMmZzLnJzdAo+ID4gKysrIGIvRG9jdW1lbnRhdGlv
bi9maWxlc3lzdGVtcy9mMmZzLnJzdAo+ID4gQEAgLTI0Nyw5ICsyNDcsOSBAQCBjaGVja3BvaW50
PSVzWzoldVslXV0gICAgICBTZXQgdG8gImRpc2FibGUiIHRvIHR1cm4gb2ZmIGNoZWNrcG9pbnRp
bmcuIFNldCB0byAiZW5hYmwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgaGlkZSB1cCB0byBh
bGwgcmVtYWluaW5nIGZyZWUgc3BhY2UuIFRoZSBhY3R1YWwgc3BhY2UgdGhhdAo+ID4gICAgICAg
ICAgICAgICAgICAgICAgICB3b3VsZCBiZSB1bnVzYWJsZSBjYW4gYmUgdmlld2VkIGF0IC9zeXMv
ZnMvZjJmcy88ZGlzaz4vdW51c2FibGUKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgVGhpcyBz
cGFjZSBpcyByZWNsYWltZWQgb25jZSBjaGVja3BvaW50PWVuYWJsZS4KPiA+IC0gICAgICAgICAg
ICAgICAgICAgICAgSGVyZSBpcyBhbm90aGVyIG9wdGlvbiAibWVyZ2UiLCB3aGljaCBjcmVhdGVz
IGEga2VybmVsIGRhZW1vbgo+ID4gLSAgICAgICAgICAgICAgICAgICAgICBhbmQgbWFrZXMgaXQg
dG8gbWVyZ2UgY29uY3VycmVudCBjaGVja3BvaW50IHJlcXVlc3RzIGFzIG11Y2gKPiA+IC0gICAg
ICAgICAgICAgICAgICAgICAgYXMgcG9zc2libGUgdG8gZWxpbWluYXRlIHJlZHVuZGFudCBjaGVj
a3BvaW50IGlzc3Vlcy4gUGx1cywKPiA+ICtjaGVja3BvaW50X21lcmdlICAgICAgV2hlbiBjaGVj
a3BvaW50IGlzIGVuYWJsZWQsIHRoaXMgY2FuIGJlIHVzZWQgdG8gY3JlYXRlIGEga2VybmVsCj4g
PiArICAgICAgICAgICAgICAgICAgICAgIGRhZW1vbiBhbmQgbWFrZSBpdCB0byBtZXJnZSBjb25j
dXJyZW50IGNoZWNrcG9pbnQgcmVxdWVzdHMgYXMKPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
bXVjaCBhcyBwb3NzaWJsZSB0byBlbGltaW5hdGUgcmVkdW5kYW50IGNoZWNrcG9pbnQgaXNzdWVz
LiBQbHVzLAo+ID4gICAgICAgICAgICAgICAgICAgICAgICB3ZSBjYW4gZWxpbWluYXRlIHRoZSBz
bHVnZ2lzaCBpc3N1ZSBjYXVzZWQgYnkgc2xvdyBjaGVja3BvaW50Cj4gPiAgICAgICAgICAgICAg
ICAgICAgICAgIG9wZXJhdGlvbiB3aGVuIHRoZSBjaGVja3BvaW50IGlzIGRvbmUgaW4gYSBwcm9j
ZXNzIGNvbnRleHQgaW4KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgYSBjZ3JvdXAgaGF2aW5n
IGxvdyBpL28gYnVkZ2V0IGFuZCBjcHUgc2hhcmVzLiBUbyBtYWtlIHRoaXMKPiA+IGRpZmYgLS1n
aXQgYS9mcy9mMmZzL3N1cGVyLmMgYi9mcy9mMmZzL3N1cGVyLmMKPiA+IGluZGV4IDU2Njk2ZjZj
ZmE4Ni4uYjYwZGNlZjdmOWQwIDEwMDY0NAo+ID4gLS0tIGEvZnMvZjJmcy9zdXBlci5jCj4gPiAr
KysgYi9mcy9mMmZzL3N1cGVyLmMKPiA+IEBAIC0yMTUsNyArMjE1LDcgQEAgc3RhdGljIG1hdGNo
X3RhYmxlX3QgZjJmc190b2tlbnMgPSB7Cj4gPiAgICAgICB7T3B0X2NoZWNrcG9pbnRfZGlzYWJs
ZV9jYXAsICJjaGVja3BvaW50PWRpc2FibGU6JXUifSwKPiA+ICAgICAgIHtPcHRfY2hlY2twb2lu
dF9kaXNhYmxlX2NhcF9wZXJjLCAiY2hlY2twb2ludD1kaXNhYmxlOiV1JSUifSwKPiA+ICAgICAg
IHtPcHRfY2hlY2twb2ludF9lbmFibGUsICJjaGVja3BvaW50PWVuYWJsZSJ9LAo+ID4gLSAgICAg
e09wdF9jaGVja3BvaW50X21lcmdlLCAiY2hlY2twb2ludD1tZXJnZSJ9LAo+ID4gKyAgICAge09w
dF9jaGVja3BvaW50X21lcmdlLCAiY2hlY2twb2ludF9tZXJnZSJ9LAo+ID4gICAgICAge09wdF9j
b21wcmVzc19hbGdvcml0aG0sICJjb21wcmVzc19hbGdvcml0aG09JXMifSwKPiA+ICAgICAgIHtP
cHRfY29tcHJlc3NfbG9nX3NpemUsICJjb21wcmVzc19sb2dfc2l6ZT0ldSJ9LAo+ID4gICAgICAg
e09wdF9jb21wcmVzc19leHRlbnNpb24sICJjb21wcmVzc19leHRlbnNpb249JXMifSwKPiA+IEBA
IC0xMTQyLDEyICsxMTQyLDYgQEAgc3RhdGljIGludCBwYXJzZV9vcHRpb25zKHN0cnVjdCBzdXBl
cl9ibG9jayAqc2IsIGNoYXIgKm9wdGlvbnMsIGJvb2wgaXNfcmVtb3VudCkKPiA+ICAgICAgICAg
ICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gPiAgICAgICB9Cj4gPgo+ID4gLSAgICAgaWYgKHRlc3Rf
b3B0KHNiaSwgRElTQUJMRV9DSEVDS1BPSU5UKSAmJgo+ID4gLSAgICAgICAgICAgICAgICAgICAg
IHRlc3Rfb3B0KHNiaSwgTUVSR0VfQ0hFQ0tQT0lOVCkpIHsKPiA+IC0gICAgICAgICAgICAgZjJm
c19lcnIoc2JpLCAiY2hlY2twb2ludD1tZXJnZSBjYW5ub3QgYmUgdXNlZCB3aXRoIGNoZWNrcG9p
bnQ9ZGlzYWJsZVxuIik7Cj4gPiAtICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ID4gLSAg
ICAgfQo+ID4gLQo+ID4gICAgICAgLyogTm90IHBhc3MgZG93biB3cml0ZSBoaW50cyBpZiB0aGUg
bnVtYmVyIG9mIGFjdGl2ZSBsb2dzIGlzIGxlc3Nlcgo+ID4gICAgICAgICogdGhhbiBOUl9DVVJT
RUdfUEVSU0lTVF9UWVBFLgo+ID4gICAgICAgICovCj4gPiBAQCAtMTc4Miw3ICsxNzc2LDcgQEAg
c3RhdGljIGludCBmMmZzX3Nob3dfb3B0aW9ucyhzdHJ1Y3Qgc2VxX2ZpbGUgKnNlcSwgc3RydWN0
IGRlbnRyeSAqcm9vdCkKPiA+ICAgICAgICAgICAgICAgc2VxX3ByaW50ZihzZXEsICIsY2hlY2tw
b2ludD1kaXNhYmxlOiV1IiwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEYyRlNf
T1BUSU9OKHNiaSkudW51c2FibGVfY2FwKTsKPiA+ICAgICAgIGlmICh0ZXN0X29wdChzYmksIE1F
UkdFX0NIRUNLUE9JTlQpKQo+ID4gLSAgICAgICAgICAgICBzZXFfcHV0cyhzZXEsICIsY2hlY2tw
b2ludD1tZXJnZSIpOwo+ID4gKyAgICAgICAgICAgICBzZXFfcHV0cyhzZXEsICIsY2hlY2twb2lu
dF9tZXJnZSIpOwo+ID4gICAgICAgaWYgKEYyRlNfT1BUSU9OKHNiaSkuZnN5bmNfbW9kZSA9PSBG
U1lOQ19NT0RFX1BPU0lYKQo+ID4gICAgICAgICAgICAgICBzZXFfcHJpbnRmKHNlcSwgIixmc3lu
Y19tb2RlPSVzIiwgInBvc2l4Iik7Cj4gPiAgICAgICBlbHNlIGlmIChGMkZTX09QVElPTihzYmkp
LmZzeW5jX21vZGUgPT0gRlNZTkNfTU9ERV9TVFJJQ1QpCj4gPiBAQCAtMTgyNyw2ICsxODIxLDcg
QEAgc3RhdGljIHZvaWQgZGVmYXVsdF9vcHRpb25zKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSkK
PiA+ICAgICAgIHNiaS0+c2ItPnNfZmxhZ3MgfD0gU0JfTEFaWVRJTUU7Cj4gPiAgICAgICBzZXRf
b3B0KHNiaSwgRkxVU0hfTUVSR0UpOwo+ID4gICAgICAgc2V0X29wdChzYmksIERJU0NBUkQpOwo+
ID4gKyAgICAgY2xlYXJfb3B0KHNiaSwgTUVSR0VfQ0hFQ0tQT0lOVCk7Cj4KPiBJdCdzIG5vdCBu
ZWVkZWQgaGVyZT8KPgo+IFRoYW5rcywKPgo+ID4gICAgICAgaWYgKGYyZnNfc2JfaGFzX2Jsa3pv
bmVkKHNiaSkpCj4gPiAgICAgICAgICAgICAgIEYyRlNfT1BUSU9OKHNiaSkuZnNfbW9kZSA9IEZT
X01PREVfTEZTOwo+ID4gICAgICAgZWxzZQo+ID4gQEAgLTIwNjYsOSArMjA2MSw4IEBAIHN0YXRp
YyBpbnQgZjJmc19yZW1vdW50KHN0cnVjdCBzdXBlcl9ibG9jayAqc2IsIGludCAqZmxhZ3MsIGNo
YXIgKmRhdGEpCj4gPiAgICAgICAgICAgICAgIH0KPiA+ICAgICAgIH0KPiA+Cj4gPiAtICAgICBp
ZiAoIXRlc3Rfb3B0KHNiaSwgTUVSR0VfQ0hFQ0tQT0lOVCkpIHsKPiA+IC0gICAgICAgICAgICAg
ZjJmc19zdG9wX2NrcHRfdGhyZWFkKHNiaSk7Cj4gPiAtICAgICB9IGVsc2Ugewo+ID4gKyAgICAg
aWYgKCF0ZXN0X29wdChzYmksIERJU0FCTEVfQ0hFQ0tQT0lOVCkgJiYKPiA+ICsgICAgICAgICAg
ICAgICAgICAgICB0ZXN0X29wdChzYmksIE1FUkdFX0NIRUNLUE9JTlQpKSB7Cj4gPiAgICAgICAg
ICAgICAgIGVyciA9IGYyZnNfc3RhcnRfY2twdF90aHJlYWQoc2JpKTsKPiA+ICAgICAgICAgICAg
ICAgaWYgKGVycikgewo+ID4gICAgICAgICAgICAgICAgICAgICAgIGYyZnNfZXJyKHNiaSwKPiA+
IEBAIC0yMDc2LDYgKzIwNzAsOCBAQCBzdGF0aWMgaW50IGYyZnNfcmVtb3VudChzdHJ1Y3Qgc3Vw
ZXJfYmxvY2sgKnNiLCBpbnQgKmZsYWdzLCBjaGFyICpkYXRhKQo+ID4gICAgICAgICAgICAgICAg
ICAgICAgICAgICBlcnIpOwo+ID4gICAgICAgICAgICAgICAgICAgICAgIGdvdG8gcmVzdG9yZV9n
YzsKPiA+ICAgICAgICAgICAgICAgfQo+ID4gKyAgICAgfSBlbHNlIHsKPiA+ICsgICAgICAgICAg
ICAgZjJmc19zdG9wX2NrcHRfdGhyZWFkKHNiaSk7Cj4gPiAgICAgICB9Cj4gPgo+ID4gICAgICAg
LyoKPiA+IEBAIC0zODMxLDcgKzM4MjcsOCBAQCBzdGF0aWMgaW50IGYyZnNfZmlsbF9zdXBlcihz
dHJ1Y3Qgc3VwZXJfYmxvY2sgKnNiLCB2b2lkICpkYXRhLCBpbnQgc2lsZW50KQo+ID4KPiA+ICAg
ICAgIC8qIHNldHVwIGNoZWNrcG9pbnQgcmVxdWVzdCBjb250cm9sIGFuZCBzdGFydCBjaGVja3Bv
aW50IGlzc3VlIHRocmVhZCAqLwo+ID4gICAgICAgZjJmc19pbml0X2NrcHRfcmVxX2NvbnRyb2wo
c2JpKTsKPiA+IC0gICAgIGlmICh0ZXN0X29wdChzYmksIE1FUkdFX0NIRUNLUE9JTlQpKSB7Cj4g
PiArICAgICBpZiAoIXRlc3Rfb3B0KHNiaSwgRElTQUJMRV9DSEVDS1BPSU5UKSAmJgo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgIHRlc3Rfb3B0KHNiaSwgTUVSR0VfQ0hFQ0tQT0lOVCkpIHsKPiA+
ICAgICAgICAgICAgICAgZXJyID0gZjJmc19zdGFydF9ja3B0X3RocmVhZChzYmkpOwo+ID4gICAg
ICAgICAgICAgICBpZiAoZXJyKSB7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgZjJmc19lcnIo
c2JpLAo+ID4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNv
dXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5m
by9saW51eC1mMmZzLWRldmVsCg==
