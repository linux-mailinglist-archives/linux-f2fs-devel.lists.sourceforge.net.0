Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A01333462
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 10 Mar 2021 05:31:25 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lJqV9-0000oj-Qz; Wed, 10 Mar 2021 04:31:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1lJqV8-0000oa-7q
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 10 Mar 2021 04:31:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WIGax6CTq1Xbs0TuzVbRm3W+ixL+uW3gPzMQJNTmBTc=; b=ivBEGRtXB35UkSk9tdW7/1poIr
 VwZ9LZ/hdcld1xMta9k1fN+gJdHV+kb5LEZE/Ogd25YlLL0vWXrXaVAUfg78VRnmCOMvwbWfH1fPt
 gS/fRCNhZe7vcY4GSFE62Nl1DMly3sTNzqsjP2QuTAAllaaCz0ytQn5ceF53nafkLijI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WIGax6CTq1Xbs0TuzVbRm3W+ixL+uW3gPzMQJNTmBTc=; b=EF0Gto+8/q3btd43jkH+1XCnGC
 AiZU4t3gRdjPM+BxmjLvYxFglJuRjMOuBETUMIHX/TP2ZwmNGq04xJQDyIHUNbXIGR4Bzltgmen0q
 7pUFKhQN9TWqU1zFFMUv5BYThGlrJUl7yMpJh1GoeNOo4zWgbgDHN43Bt9KGW7gT3GGQ=;
Received: from mail-lf1-f50.google.com ([209.85.167.50])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lJqV3-0005Zw-VT
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 10 Mar 2021 04:31:14 +0000
Received: by mail-lf1-f50.google.com with SMTP id v9so31219299lfa.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 09 Mar 2021 20:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WIGax6CTq1Xbs0TuzVbRm3W+ixL+uW3gPzMQJNTmBTc=;
 b=TqD7y94HlFLHDScj49G0fQWaGp7CBYf4nP/E8C5Bi/oah1WoRbZ1I402rkr3EY5+i7
 GvTigviKn/UMDMXCkgfzFGndI32QTy8q4hNvV7ip61iMRmzY9dd0Rvuvq+FCD4s4MT80
 h3axSyzOJt2v5iWkfpk0fOeM5BM4SnmnSaWx4JrX9YJp5jJ8E6XaWqjHswYwDHYDezBU
 84oJ9nDOqvjPl79WVx3h9cDdwNmsWIxIH2Tl6bJXjelkofxrcTkFh+fXtW9ZFCNVckPO
 xOXiyJ5uCr7XdzbpU0de2z2WCvjkWmboH53ZpYQMqrQLiA6xigdDM0/seOpBkpIzQSnf
 U5Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WIGax6CTq1Xbs0TuzVbRm3W+ixL+uW3gPzMQJNTmBTc=;
 b=P/TQYB/QDRV2ejcgdZBcFuTe/UcQTyymGwkNAvyqspg3Y3OfREMEFdVBxYEPZMmcIi
 tD7pfJ3CSOYraF+I5Hm8JaUmX6sbVdxhjH9OeEtvX7b/DhMvLa70sncrQMmvg19mbmiN
 codwdplODZpzASscBJupL+QK8F38rQfL0G25uxWdCeVWaaMrpVtwBvXtQvkkTe7WlLaf
 +y+i0qFx0XH6uEQetMPe7VkaH+f6DiF37vaj+lXVO1D84SZ6LQF8Ql3OWPH2fGMJOsmk
 +O6qVWOcMabfQNH5rZvp77G8S4J1dK4Js8JxRtWvVJE14fz+28fjWGiW1er+upBaqltG
 HwYw==
X-Gm-Message-State: AOAM531lEIS1k8pwAewN9MlWCI42wUIY3spAYqQyOw+1m6ozLVxPJUX4
 NeKeFEb8+OU8mR5KC6sTxFStf/HrKbZYs4IVOjM=
X-Google-Smtp-Source: ABdhPJwAubEzBljM17QavlA+7h3y4MyaIYDDeO+GKAEDrM9KG6YQuOMNFB86LJze7BNEyQY7w/+ty0rtfPmW9knm5yg=
X-Received: by 2002:ac2:5dd2:: with SMTP id x18mr921368lfq.550.1615350663329; 
 Tue, 09 Mar 2021 20:31:03 -0800 (PST)
MIME-Version: 1.0
References: <20210305022402.2721974-1-daeho43@gmail.com>
 <2f2abc41-24d5-6795-44fe-b770ed8514df@huawei.com>
 <CACOAw_woQGgTy_hTfdcFufA7VG3cBVSN9vSD5bubvTeo+3wxsg@mail.gmail.com>
 <203c1945-9d48-098e-fa8f-1c86b1086ae3@huawei.com>
In-Reply-To: <203c1945-9d48-098e-fa8f-1c86b1086ae3@huawei.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Wed, 10 Mar 2021 13:30:52 +0900
Message-ID: <CACOAw_yvqCpq8i_XfmyWVWdtZhOQf4itw2D5Xxhk97RgWmVing@mail.gmail.com>
To: Chao Yu <yuchao0@huawei.com>
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.50 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.50 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lJqV3-0005Zw-VT
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: add sysfs nodes to get accumulated
 compression info
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

V2UndmUgcmVjb25zaWRlcmVkIHRoaXMgZmVhdHVyZSBhbmQgZGVjaWRlZCB0byBnZXQganVzdCBy
dW50aW1lIGluZm8Kb2YgdGhlbSwgbm90IHBlcnNpc3RlbnQgb24gZGlzay4KSSBhbSByZS13cml0
aW5nIGl0LgoKVGhhbmtzLAoKMjAyMeuFhCAz7JuUIDEw7J28ICjsiJgpIOyYpOyghCAxMDozMSwg
Q2hhbyBZdSA8eXVjaGFvMEBodWF3ZWkuY29tPuuLmOydtCDsnpHshLE6Cj4KPiBPbiAyMDIxLzMv
OSAyMTowMCwgRGFlaG8gSmVvbmcgd3JvdGU6Cj4gPiAyMDIx64WEIDPsm5QgOeydvCAo7ZmUKSDs
mKTtm4QgNjoyMiwgQ2hhbyBZdSA8eXVjaGFvMEBodWF3ZWkuY29tPuuLmOydtCDsnpHshLE6Cj4g
Pj4KPiA+PiBPbiAyMDIxLzMvNSAxMDoyNCwgRGFlaG8gSmVvbmcgd3JvdGU6Cj4gPj4+IEZyb206
IERhZWhvIEplb25nIDxkYWVob2plb25nQGdvb2dsZS5jb20+Cj4gPj4+Cj4gPj4+IEFkZGVkIGFj
Y19jb21wcl9pbm9kZXMgdG8gc2hvdyBhY2N1bXVsYXRlZCBjb21wcmVzc2VkIGlub2RlIGNvdW50
IGFuZAo+ID4+PiBhY2NfY29tcHJfYmxvY2tzIHRvIHNob3cgYWNjdW11bGF0ZWQgc2VjdXJlZCBi
bG9jayBjb3VudCB3aXRoCj4gPj4KPiA+PiBJIG5vdGljZWQgdGhhdCB0aGVzZSBzdGF0IG51bWJl
cnMgYXJlIHJlY29yZGVkIGluIGV4dHJhIHJlc2VydmVkIGFyZWEgaW4KPiA+PiBob3Qgbm9kZSBj
dXJzZWcgam91cm5hbCwgdGhlIGpvdXJuYWwgd2lsbCBiZSBwZXJzaXN0ZWQgb25seSBmb3IgdW1v
dW50Cj4gPj4gb3IgZmFzdGJvb3QgY2hlY2twb2ludCwgc28gdGhlIG51bWJlcnMgYXJlIG5vdCBz
byBhY2N1cmF0ZS4uLiBkb2VzIHRoaXMKPiA+PiBzYXRpc2Z5IHlvdXIgcmVxdWlyZW1lbnQ/Cj4g
Pj4KPiA+Cj4gPiBZZXMsIHdlIGFyZSBzYXRpc2ZpZWQgd2l0aCBqdXN0IGdldHRpbmcgcm91Z2gg
bnVtYmVyIG9mIHRoZW0uIEJ1dCwgaXQKPgo+IEFscmlnaHQsCj4KPiA+IHdvdWxkIGJlIGJldHRl
ciBpZiB5b3Ugc3VnZ2VzdCBtb3JlIGFjY3VyYXRlIHdheS4gOikKPgo+IEkgdGhpbmsgdGhpcyBp
cyB0aGUgY2hlYXBlc3Qgd2F5IHRvIHN0b3JlIHJvdWdoIG51bWJlciwgb3RoZXJ3aXNlIGl0IG5l
ZWRzIHRvIGNoYW5nZQo+IGYyZnNfY2hlY2twb2ludCBzdHJ1Y3R1cmUgbGF5b3V0IG9yIGFkZCBh
IG5ldyBpbm5lciBpbm9kZSB0byBwZXJzaXN0IHRoZXNlIHN0YXQKPiBudW1iZXJzIGlmIHdlIHdh
bnQgbW9yZSBhY2N1cmF0ZSBvbmUuCj4KPiA+Cj4gPj4+IGNvbXByZXNzaW9uIGluIHN5c2ZzLiBU
aGVzZSBjYW4gYmUgcmUtaW5pdGlhbGl6ZWQgdG8gIjAiIGJ5IHdyaXRpbmcgIjAiCj4gPj4+IHZh
bHVlIGluIG9uZSBvZiBib3RoLgo+ID4+Cj4gPj4gV2h5IGRvIHdlIGFsbG93IHJlc2V0IHRoZSBz
dGF0IG51bWJlcnM/Cj4gPj4KPiA+Cj4gPiBBY3R1YWxseSwgSSB3YW50IHRvIGhhdmUgYSB3YXkg
dG8gY2xlYXIgYW55IHN0YWxlIG51bWJlciBvZiB0aGVtLCBidXQKPiA+IEkgYWdyZWUgd2UgZG9u
J3QgbmVlZCB0aGlzLgo+ID4KPiA+PiBXaHkgbm90IGNvdmVyaW5nIGFsbCBjb2RlIHdpdGggbWFj
cm8gQ09ORklHX0YyRlNfRlNfQ09NUFJFU1NJT04sIHNpbmNlIHRoZXNlCj4gPj4gbnVtYmVycyBh
cmUgb25seSBiZSB1cGRhdGVkIHdoZW4gd2UgZW5hYmxlIGNvbXByZXNzaW9uLgo+ID4+Cj4gPgo+
ID4gSSB3YW50ZWQgdG8ga2VlcCB0aGUgaW5mbyBldmVuIGluIHRoZSBrZXJuZWwgd2l0aCBkb2Vz
bid0IHN1cHBvcnQKPiA+IHBlci1maWxlIGNvbXByZXNzaW9uIGlmIHRob3NlIGhhZCBiZWVuIHdy
aXR0ZW4gb25jZS4gV2hhdCBkbyB5b3UKPiA+IHRoaW5rPwo+Cj4gU3VyZSwgaWYgc28gaXQncyBm
aW5lIHRvIG1lLiA6KQo+Cj4gVGhhbmtzLAo+Cj4gPgo+ID4+IFRoYW5rcywKPiA+IC4KPiA+CgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJm
cy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5u
ZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJm
cy1kZXZlbAo=
