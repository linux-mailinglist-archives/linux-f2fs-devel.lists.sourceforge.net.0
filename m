Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8760021536E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  6 Jul 2020 09:46:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jsLpk-0004wp-Fw; Mon, 06 Jul 2020 07:46:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jsLpj-0004wc-3S
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 06 Jul 2020 07:46:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6fpvgIG/NrSRZGTpA491IOzDSkxMHv0st+VYW2DTd50=; b=MOtttxmLNeCCIYDk1iSjGG556f
 89h65Twa5xdE10bXlgIDoUKb+7BHshL0DCY03spd6IpuTgsvc3Gx9eke+qyeZtMhEyYjWy3+nutrc
 cgON5Z+yad5ExV3NYiQwq6D/crqYXT9GifgsYZELdCfWfk6ONHuSC7owc8Pcr6t7dLeE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6fpvgIG/NrSRZGTpA491IOzDSkxMHv0st+VYW2DTd50=; b=SlWtmhhE5yT+w2S1Ly0kH4DyjA
 6EDxE7KwzzTgxlkoQ9AEmH4OUX99MiJ+xG0JpBcB/1KmyDreoG4ApJRv5i4tgR7NJRaUCHZl4Ukq8
 delGH7HVBWLrveYzqP0IZONpVNlc8/HLsbY1bU3ohWqfcKIS9QJ7HQ7ql/ao+qQwX72Q=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jsLpg-00C19H-B5
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 06 Jul 2020 07:46:34 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 6E9D99AEE34061E1E4F6;
 Mon,  6 Jul 2020 15:46:24 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.214) with Microsoft SMTP Server (TLS) id 14.3.487.0; Mon, 6 Jul 2020
 15:46:20 +0800
To: lampahome <pahome.chen@mirlab.org>
References: <CAB3eZfvyo4OzN_odXsnvDO6E=YHTt4qe5CXqQUyG7Mrk+MhzaQ@mail.gmail.com>
 <0ea89e42-8ea7-5557-8717-26d2e6965104@huawei.com>
 <CAB3eZfsjaNxMK+0HqYNAQQgksgGZNOO7QAXoT_Lgqr1+mPss3w@mail.gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <a80be8b3-75d1-33c8-a4da-b4c336ae53be@huawei.com>
Date: Mon, 6 Jul 2020 15:46:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAB3eZfsjaNxMK+0HqYNAQQgksgGZNOO7QAXoT_Lgqr1+mPss3w@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.35 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jsLpg-00C19H-B5
Subject: Re: [f2fs-dev] Can I know if now is gc-ing or checkpointing?
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMC83LzYgMTU6MzQsIGxhbXBhaG9tZSB3cm90ZToKPiBDaGFvIFl1IDx5dWNoYW8wQGh1
YXdlaS5jb20+IOaWvCAyMDIw5bm0N+aciDbml6Ug6YCx5LiAIOS4i+WNiDM6Mjnlr6vpgZPvvJoK
Pj4KPj4gT24gMjAyMC83LzYgMTU6MTAsIGxhbXBhaG9tZSB3cm90ZToKPj4+IEkgdHJpZWQgdG8g
dGVzdCAgcGVyZm9ybWFuY2Ugd2l0aCBmMmZzIGFuZCBjcmVhdGUgbWFueSBmaW8gdG8gdGVzdCBp
dC4KPj4+Cj4+PiBJIGZvdW5kIHdoZW4gZmlvIHJlYWNoIGEgbnVtYmVyKGUuZy4gMjUgZmlvKSwg
dGhlIHBlcmZvcm1hbmNlIGRlZ3JhZGUKPj4+IG5vdCBpbiBwcm9wb3J0aW9uYWwgd2l0aCBzbWFs
bCBudW1iZXIKPj4+Cj4+PiBFWDoKPj4+IDUgZmlvOiBiYW5kd2lkdGggMzAwTUIvcwo+Pj4gMTAg
ZmlvOiBiYW5kd2lkdGggMTUwTUIvcwo+Pj4gMjUgZmlvOiBiYW5kd2lkdGggMzBNQi9zCj4+Cj4+
IFdoYXQncyB5b3VyIGJ1ZmZlciBzaXplIGZvciBlYWNoIGZsdXNoPwoKQ291bGQgeW91IHNoYXJl
IHRoZSB3aG9sZSBjb21tYW5kPwoKPj4KPiBFYWNoIGZpbyBzdWJtaXQgYmxvY2tzaXplPTRrLCBk
aXJlY3Q9MCwgMUdCIGZpbGUuIFNvIGJ1ZmZlciBzaXplIGlzIDRrPwoKSSBtZWFudCBob3cgbWFu
eSBkYXRhIGZpbyB3aWxsIHdyaXRlIGJlZm9yZSB0cmlnZ2VyaW5nIGZzeW5jPwoKSSBkb3VidCB0
aGF0IF9fc2hvdWxkX3NlcmlhbGl6ZV9pbygpIG1heSBzZXJpYWxpemUgYWxsIGZpbyB0aHJlYWRz
IGlmIHlvdXIKYnVmZmVyIHNpemUgaXMgbGFyZ2VyIHRoYW4gc2l6ZSBvZiBvbmUgc2VjdGlvbiAo
Mk1CIGJ5IGRlZmF1bHQpCgo+IAo+IFdoZW4gZ3JlcCBHQyBhbmQgQ1AgaW4gZjJmcyBzdGF0dXMs
IGl0IHNob3dzIGRpZCBHQyBhbmQgQ1Agc29tZSB0aW1lcy4KPiBCdXQgbXkgZGlzayBoYXMgMTI4
R0IgYW5kIGVhY2ggZmlvIG9ubHkgd3JpdGUgMUdCIGZpbGUuCj4gV2h5IGRvZXMgdGhlIGJlaGF2
aW9yIHRyaWdnZXIgR0MgYW5kIENQPwoKQ2FuIHlvdSBzaGFyZSByZXN1bHQgb2Ygc3RhdHVzIGJl
Zm9yZSBhbmQgYWZ0ZXIgdGVzdD8KClRoZXJlIGlzIEJHR0MgYW5kIEZHR0MsIEJHR0MgcnVucyBw
ZXJpb2RpY2FsbHksIEZHR0MgcnVucyB3aGVuIHRoZXJlIGlzCmFsbW9zdCBubyBmcmVlIHNlZ21l
bnRzOyBDUCB0cmlnZ2VyIGNvbmRpdGlvbiBpcyBjb21wbGljYXRlZCwgY29tbW9ubHksCnZpYSBz
eW5jZnMuCgo+IC4KPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxp
c3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9s
aXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
