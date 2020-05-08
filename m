Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA3A1CA4AA
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  8 May 2020 08:59:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jWwyR-0006bn-Ar; Fri, 08 May 2020 06:59:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1jWwyP-0006bX-Tl
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 May 2020 06:59:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pUqYbbEhhoBOpMJg82tH9U5Nj13y9+Ar796jHBZ0iuk=; b=H8DSwD4nbhZ10Jk64DKPNNR6Ho
 WkDd0MinYrzMY/RDR5XCavOT5MlW+D6388Scd9ScOcZvrqo4N+JgG5UOamVDZzvqVmuHZ+1mbmgNy
 DR96QkawCofQcPvGJ/1/HmT7Z9QwQ3wnhccl4/UQga8EmrnmUkSrVK9VJ606y2cUOkbI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pUqYbbEhhoBOpMJg82tH9U5Nj13y9+Ar796jHBZ0iuk=; b=E9afYvDmdSLdndaaOJdIFWLxst
 /O72giv+IPc32geMzaqX+Zzsw7i9x+1HAKBkYFFCPOdRL+OGhJbvmkFG5V6l+QyePcqbLGvdylx3z
 0pdK1i1KcMSq3Qy9lqSsLV1mrdKYHpa6WC+RNPGloayRMeTh3aE/57kpUDDgP6O9vaFc=;
Received: from mail-lj1-f196.google.com ([209.85.208.196])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jWwyL-001Nbh-U3
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 May 2020 06:59:05 +0000
Received: by mail-lj1-f196.google.com with SMTP id e25so541726ljg.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 07 May 2020 23:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pUqYbbEhhoBOpMJg82tH9U5Nj13y9+Ar796jHBZ0iuk=;
 b=G7/6rRT9CAiKUhr1x2HJR1bBbUhx1FptG/OWbT6gPV4TchFejkTo8f/6hlCk2kNdGE
 NmNuSEztMvkKfI3NVQtmFm9WJID7r8OpPqDf2/mV0/YFYY6H+RDGU55qfEU1L47jhIZp
 qHkHz5jggUJmn0Tddvy/C21A/otqQ9CLoZFG6NiphUkV4tfAwr3G4tnN6Ph0bvw0o0Kn
 6NBNrfLsGfVexLXDWyKyVG2L5RzaYMC4gH4g/cg8ruCX5rcJ1H0JuVb+5nAt8Q67WCSF
 miMHIMejlC7lFiV8E++ShTzwcy7qjRMba2rw5JhQliDfIal61viSDQBgiF52TusRnKmf
 b6vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pUqYbbEhhoBOpMJg82tH9U5Nj13y9+Ar796jHBZ0iuk=;
 b=eeBS5qMYzz7z08ZD86mETq/W84t13rWq2y3zSXBrAoLKhfROjIp4rstLRuQEI5XlzI
 6zFIXjHw1fKvIhE36ktQgegXlfEPUOjnl/X6UR/krtEq6dzjBX/8f7TmHXt17BgwFAEc
 ZIc1pX9E7ioCCdS8ymnVj0wm4ElGjFIHSyN7Z9zshMvkN05IDwkOkQiDRArDrSedCv8H
 wJhj6OfMXhsLPKMRrU9vT7ZYLcuJLxf5ig9Cnl6CTnzGya4m+LPoLFpogq7D5kOq1E6R
 oQfS0AFVQRGnvCahBmiP71+LKqGClMdQ5Q1Abv8Jjgp3jdQH86MctvgJ5xcTJpSrGcRN
 V5nw==
X-Gm-Message-State: AOAM531YnbMO0r3Oohla3SMsTu+53+s2UO6YEPwkV7wT6zqq+N5fcyMO
 6NqZqgIeOhwvsh7mB0wzPMwjpOHfop0D/jaJuo8=
X-Google-Smtp-Source: ABdhPJwYWccUNn8mMSZ9PrPSekN5RKemxE9AXxFxPy++X/nS71r2ozelfd1MrjkXAO62Yp0Cn2rbD/LEiYRGAGcUuUQ=
X-Received: by 2002:a2e:97d3:: with SMTP id m19mr681437ljj.136.1588921135090; 
 Thu, 07 May 2020 23:58:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200508042506.143395-1-daeho43@gmail.com>
 <4dfb73d9-03a0-bb2f-a112-1dd42db4d7bb@huawei.com>
In-Reply-To: <4dfb73d9-03a0-bb2f-a112-1dd42db4d7bb@huawei.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Fri, 8 May 2020 15:58:44 +0900
Message-ID: <CACOAw_z0BU3t7V+BN7TvaO96GckwNh2SRLreGxO60EDbMb_epw@mail.gmail.com>
To: Chao Yu <yuchao0@huawei.com>
X-Spam-Score: 0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.196 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.196 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jWwyL-001Nbh-U3
Subject: Re: [f2fs-dev] [PATCH] f2fs: remove race condition in releasing
 cblocks
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

SSBtb3ZlZCBjaGVja2luZyBpX2NvbXByX2Jsb2NrcyBwaHJhc2UgYWZ0ZXIgY2FsbGluZyBpbm9k
ZV9sb2NrKCkKYWxyZWFkeSwgYmVjYXVzZSB3ZSBzaG91bGQgY2hlY2sgdGhpcyBhZnRlciB3cml0
aW5nIHBhZ2VzLgoKU28sIGlmIGl0IGZhaWxzIHRvIGNoZWNrIGlfY29tcHJfYmxvY2tzLCB3ZSBu
ZWVkIHRvIGNhbGwgaW5vZGVfdW5sb2NrKCkuCgpBbSBJIG1pc3Npbmcgc29tZXRoaW5nPwoKMjAy
MOuFhCA17JuUIDjsnbwgKOq4iCkg7Jik7ZuEIDM6NTAsIENoYW8gWXUgPHl1Y2hhbzBAaHVhd2Vp
LmNvbT7ri5jsnbQg7J6R7ISxOgo+Cj4gT24gMjAyMC81LzggMTI6MjUsIERhZWhvIEplb25nIHdy
b3RlOgo+ID4gRnJvbTogRGFlaG8gSmVvbmcgPGRhZWhvamVvbmdAZ29vZ2xlLmNvbT4KPiA+Cj4g
PiBOb3csIGlmIHdyaXRpbmcgcGFnZXMgYW5kIHJlbGVhc2luZyBjb21wcmVzcyBibG9ja3Mgb2Nj
dXIKPiA+IHNpbXVsdGFuZW91c2x5LCBhbmQgcmVsZWFzaW5nIGNibG9ja3MgaXMgZXhlY3V0ZWQg
bW9yZSB0aGFuIG9uZSB0aW1lCj4gPiB0byBhIGZpbGUsIHRoZW4gdG90YWwgYmxvY2sgY291bnQg
b2YgZmlsZXN5c3RlbSBhbmQgYmxvY2sgY291bnQgb2YgdGhlCj4gPiBmaWxlIGNvdWxkIGJlIGlu
Y29ycmVjdCBhbmQgZGFtYWdlZC4KPiA+Cj4gPiBXZSBoYXZlIHRvIGV4ZWN1dGUgcmVsZWFzaW5n
IGNvbXByZXNzIGJsb2NrcyBvbmx5IG9uZSB0aW1lIGZvciBhIGZpbGUKPiA+IHdpdGhvdXQgYmVp
bmcgaW50ZXJmZXJlZCBieSB3cml0ZXBhZ2VzIHBhdGguCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTog
RGFlaG8gSmVvbmcgPGRhZWhvamVvbmdAZ29vZ2xlLmNvbT4KPiA+IC0tLQo+ID4gIGZzL2YyZnMv
ZmlsZS5jIHwgMzEgKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLQo+ID4gIDEgZmlsZSBj
aGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1n
aXQgYS9mcy9mMmZzL2ZpbGUuYyBiL2ZzL2YyZnMvZmlsZS5jCj4gPiBpbmRleCA0YWFiNGI0MmQ4
YmEuLmE5MmJjNTFiOWIyOCAxMDA2NDQKPiA+IC0tLSBhL2ZzL2YyZnMvZmlsZS5jCj4gPiArKysg
Yi9mcy9mMmZzL2ZpbGUuYwo+ID4gQEAgLTM0ODgsNiArMzQ4OCw3IEBAIHN0YXRpYyBpbnQgZjJm
c19yZWxlYXNlX2NvbXByZXNzX2Jsb2NrcyhzdHJ1Y3QgZmlsZSAqZmlscCwgdW5zaWduZWQgbG9u
ZyBhcmcpCj4gPiAgICAgICBwZ29mZl90IHBhZ2VfaWR4ID0gMCwgbGFzdF9pZHg7Cj4gPiAgICAg
ICB1bnNpZ25lZCBpbnQgcmVsZWFzZWRfYmxvY2tzID0gMDsKPiA+ICAgICAgIGludCByZXQ7Cj4g
PiArICAgICBpbnQgd3JpdGVjb3VudDsKPiA+Cj4gPiAgICAgICBpZiAoIWYyZnNfc2JfaGFzX2Nv
bXByZXNzaW9uKEYyRlNfSV9TQihpbm9kZSkpKQo+ID4gICAgICAgICAgICAgICByZXR1cm4gLUVP
UE5PVFNVUFA7Cj4KPiBCZWZvcmUgaW5vZGVfbG9jaygpLCB0aGVyZSBpcyBvbmUgY2FzZSB3ZSBt
YXkganVtcCB0byBvdXQgbGFiZWwsIGluCj4gdGhpcyBjYXNlLCB3ZSBtYXkgdW5sb2NrIGlub2Rl
IGluY29ycmVjdGx5Lgo+Cj4gICAgICAgICBpZiAoIUYyRlNfSShpbm9kZSktPmlfY29tcHJfYmxv
Y2tzKQo+ICAgICAgICAgICAgICAgICBnb3RvIG91dDsKPgo+ID4gLQo+ID4gLSAgICAgaW5vZGVf
dW5sb2NrKGlub2RlKTsKPiA+ICBvdXQ6Cj4gPiArICAgICBpbm9kZV91bmxvY2soaW5vZGUpOwo+
ID4gKwo+ID4gICAgICAgbW50X2Ryb3Bfd3JpdGVfZmlsZShmaWxwKTsKPgo+IFRoYW5rcywKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZz
LWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5l
dApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZz
LWRldmVsCg==
