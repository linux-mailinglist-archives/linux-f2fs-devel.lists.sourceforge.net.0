Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F3A219723
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  9 Jul 2020 06:16:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jtNyW-0005Rb-55; Thu, 09 Jul 2020 04:15:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1jtNyU-0005RP-Sc
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 09 Jul 2020 04:15:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xDk1ZHF1bMnWFPlFovEjZecEcOKh7UBQd7WZyIXM1mQ=; b=b/sRUDKeVTmfP9d4AfzJAE9gWe
 K99Fvz8oILyxIXchGPFMNFHxBFurSVBYIniRRNaQUEItxbLlkFmQz6rBBYdbem68y0KdEkpMWLa31
 v2JMGOZ1Whw86F4vZeVGVJtTuLIITYsUKvWwpTsWy4C7et2r4nEcAqlLqPWTnRC+vdAI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xDk1ZHF1bMnWFPlFovEjZecEcOKh7UBQd7WZyIXM1mQ=; b=MZBE3V7vmSCqZwUrCDfwjR12dz
 7VxhYLy1ahvmkfxunfcQWtNqZA4Wj4DLEMje9WeJm494LrKTYftFJSKT34xIIP+J6x7MhD9DhNHzf
 Ama1nqE7qE0l7oVghrs46btSRBquy05ixR0uon2MRgGaLuTYCd25bZjmVEO4TpQrcxCE=;
Received: from mail-lf1-f66.google.com ([209.85.167.66])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jtNyT-000O8X-Fm
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 09 Jul 2020 04:15:54 +0000
Received: by mail-lf1-f66.google.com with SMTP id y13so350230lfe.9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 08 Jul 2020 21:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xDk1ZHF1bMnWFPlFovEjZecEcOKh7UBQd7WZyIXM1mQ=;
 b=Zz+n6Iv90qbX2LLt1L1X0f49gNMpYaHpesM+xr7jYmBUxaW+HFN0lPNlmasFBxdxuK
 +gncMdXlSnR4UiJdWhr4J85WOlmhCxqxbbCR0S1DgjAMEYMRdtqb1Mzb54xDUVSLAfS7
 yCluwZZ9h+ezgrajYs0fWwbQu/wxFBR6Wh99XmGnRa9q9zmPXKLs1ayNINnS4kZs6cj3
 LxPixzkYmsL9mxM4syOXkS7kOQ1dtvg8x/cXhFf1pIVlqSH6z3GGbGc6dCebtdIamEOC
 FtHJ+mFyjRuyYgoEGMCTajyci09Wa9uAC76mLWjO7/JooP8AhR9GfrFJzkubT3NWAeb7
 7rKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xDk1ZHF1bMnWFPlFovEjZecEcOKh7UBQd7WZyIXM1mQ=;
 b=DuTk3mqRHy2dFlEPxIESAt+1s4EKi/RX70haZ1G+mK1PcVR6HOsx0VrOhmK9UKspQi
 VpzhtgP2oIxbcwTpjfawM48/ht1kZ7VipdILLx7qfexttLetS1rPVAJIODFnUJNPB6mj
 Pfd+3Q4PHdIkqeMdd5Qp84IbLhMqJXIBwGYxMWy5Bu6GuDMVb7KnNrI98Qp5bslv/YQI
 VYxLgOKSUca4VaoYRQr2ubxXFogDMuSKqltKiB6fyrKevNIsUdNUBdr2OjOh2qJ3kYw8
 HrY+f194xnnfHSCYvpKo+BjUOJ+lXwtc7bJzthAQJPsHOHn00OlGgRLIxRtj+hBO1dwh
 0LpQ==
X-Gm-Message-State: AOAM530nGd7oTSi735Ga/HIC9f/LAPFIsggutZlj+rJin3gyUVuLjwva
 aOh2iTv6tjryoqg6mNXKeUVLh0GVGdnJDn06kcw=
X-Google-Smtp-Source: ABdhPJyAG61hK3KeNkBxu+KrPK1uEtZq51mJTOtlJ1WejkUa0oUSsYxdEmxuIChtmYimHLfFEPWpxQjFLRFDjrvokHw=
X-Received: by 2002:a19:e61a:: with SMTP id d26mr33048773lfh.96.1594268146758; 
 Wed, 08 Jul 2020 21:15:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200709015739.1653668-1-daeho43@gmail.com>
 <619af72b-2f8a-4a84-f73e-ac49989ba79f@huawei.com>
In-Reply-To: <619af72b-2f8a-4a84-f73e-ac49989ba79f@huawei.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Thu, 9 Jul 2020 13:15:35 +0900
Message-ID: <CACOAw_x7GkM0os2xo+2CX+pysCBb6QbWxxr0jC3C703iFQi+1A@mail.gmail.com>
To: Chao Yu <yuchao0@huawei.com>
X-Spam-Score: 0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.66 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.66 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jtNyT-000O8X-Fm
Subject: Re: [f2fs-dev] [PATCH] f2fs: ignore when len of range in
 f2fs_sec_trim_file is zero
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

SSB0aG91Z2h0IGl0J3MgYmV0dGVyIHRvIHRyZWF0IHRoaXMgYXMgdGhlIGVycm9yIGNhc2UsIHNp
bmNlIHRoZSByYW5nZQphbHJlYWR5IHBhc3NlZCBvdXQgb2YgdGhlIGlfc2l6ZSByYW5nZS4KSWYg
d2UgYWxsb3cgdGhhdCwgdGhlIHVzZXIgbmVlZHMgdG8gc2VuZCB0aGUgcmFuZ2UgcGFyYW1ldGVy
IGJlaW5nCmFsaWduZWQgbGlrZSBzdGFydDowIGFuZCBsZW46IHJvdW5kdXAoaV9zaXplLCBQQUdF
X1NJWkUpLCBldmVuIGlmIGhlCm9yIHNoZSB3YW50cyB0byBlcmFzZSB0aGUgd2hvbGUgZmlsZS4K
CjIwMjDrhYQgN+yblCA57J28ICjrqqkpIOyYpO2bhCAxMjowNSwgQ2hhbyBZdSA8eXVjaGFvMEBo
dWF3ZWkuY29tPuuLmOydtCDsnpHshLE6Cj4KPiBPbiAyMDIwLzcvOSA5OjU3LCBEYWVobyBKZW9u
ZyB3cm90ZToKPiA+IEZyb206IERhZWhvIEplb25nIDxkYWVob2plb25nQGdvb2dsZS5jb20+Cj4g
Pgo+ID4gV2hlbiBlbmRfYWRkciBjb21lcyB0byB6ZXJvLCBpdCdsbCB0cmlnZ2VyIGRpZmZlcmVu
dCBiZWhhdmlvdXIuCj4gPiBUbyBwcmV2ZW50IHRoaXMsIHdlIG5lZWQgdG8gaWdub3JlIHRoZSBj
YXNlIG9mIHRoYXQgcmFuZ2UubGVuIGlzCj4gPiB6ZXJvIGluIHRoZSBmdW5jdGlvbi4KPiA+Cj4g
PiBTaWduZWQtb2ZmLWJ5OiBEYWVobyBKZW9uZyA8ZGFlaG9qZW9uZ0Bnb29nbGUuY29tPgo+ID4g
LS0tCj4gPiAgZnMvZjJmcy9maWxlLmMgfCA3ICsrKy0tLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9mcy9m
MmZzL2ZpbGUuYyBiL2ZzL2YyZnMvZmlsZS5jCj4gPiBpbmRleCAzNjhjODBmOGUyYTEuLjk4YjBh
OGRiZjY2OSAxMDA2NDQKPiA+IC0tLSBhL2ZzL2YyZnMvZmlsZS5jCj4gPiArKysgYi9mcy9mMmZz
L2ZpbGUuYwo+ID4gQEAgLTM4MTMsMTUgKzM4MTMsMTQgQEAgc3RhdGljIGludCBmMmZzX3NlY190
cmltX2ZpbGUoc3RydWN0IGZpbGUgKmZpbHAsIHVuc2lnbmVkIGxvbmcgYXJnKQo+ID4gICAgICAg
ZmlsZV9zdGFydF93cml0ZShmaWxwKTsKPiA+ICAgICAgIGlub2RlX2xvY2soaW5vZGUpOwo+ID4K
PiA+IC0gICAgIGlmIChmMmZzX2lzX2F0b21pY19maWxlKGlub2RlKSB8fCBmMmZzX2NvbXByZXNz
ZWRfZmlsZShpbm9kZSkpIHsKPiA+ICsgICAgIGlmIChmMmZzX2lzX2F0b21pY19maWxlKGlub2Rl
KSB8fCBmMmZzX2NvbXByZXNzZWRfZmlsZShpbm9kZSkgfHwKPiA+ICsgICAgICAgICAgICAgICAg
ICAgICByYW5nZS5zdGFydCA+PSBpbm9kZS0+aV9zaXplKSB7Cj4gPiAgICAgICAgICAgICAgIHJl
dCA9IC1FSU5WQUw7Cj4gPiAgICAgICAgICAgICAgIGdvdG8gZXJyOwo+ID4gICAgICAgfQo+ID4K
PiA+IC0gICAgIGlmIChyYW5nZS5zdGFydCA+PSBpbm9kZS0+aV9zaXplKSB7Cj4gPiAtICAgICAg
ICAgICAgIHJldCA9IC1FSU5WQUw7Cj4gPiArICAgICBpZiAocmFuZ2UubGVuID09IDApCj4gPiAg
ICAgICAgICAgICAgIGdvdG8gZXJyOwo+ID4gLSAgICAgfQo+ID4KPiA+ICAgICAgIGlmIChpbm9k
ZS0+aV9zaXplIC0gcmFuZ2Uuc3RhcnQgPCByYW5nZS5sZW4pIHsKPiA+ICAgICAgICAgICAgICAg
cmV0ID0gLUUyQklHOwo+Cj4gSG93IGFib3V0IHRoZSBjYXNlIHRyaW1taW5nIGxhc3QgcGFydGlh
bCB3cml0dGVuIGJsb2NrPwo+Cj4gaV9zaXplID0gODAwMAo+IHJhbmdlLnN0YXJ0ID0gNDA5Ngo+
IHJhbmdlLmxlbiA9IDQwOTYKPgo+IERvIHdlIG5lZWQgdG8gcm91bmR1cChpc2l6ZSwgUEFHRV9T
SVpFKSBiZWZvcmUgY29tcGFyaXNvbj8KPgo+IFRoYW5rcywKPgo+ID4KCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxp
bmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xp
c3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
