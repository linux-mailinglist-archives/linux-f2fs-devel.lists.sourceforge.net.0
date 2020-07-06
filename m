Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D3E215580
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  6 Jul 2020 12:27:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jsOLY-0002O8-Lc; Mon, 06 Jul 2020 10:27:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jsOLX-0002Ll-5h
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 06 Jul 2020 10:27:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=I2QPj3z5h5fBq7GENne+Ts78iaWb38XwPQyD0YN+/lw=; b=mjWHsRgl2WUx2eGUgnKct2lmL3
 Gmjd8MEQLCXV6mFakNoBwoEEzXBoxLrqtFlxm0imJ6LPMBBZG/INXOA4nnupwbgecIu7Et1njHjje
 hQ61HYDrHfht7LSPeMfc5PFrJbwBYm+K6H0S+31tnM4JnXbNgyLk18GBBmmtkca4dJ84=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=I2QPj3z5h5fBq7GENne+Ts78iaWb38XwPQyD0YN+/lw=; b=BJwEt+EmWiQ67w3TwmJKabFw3r
 ATnnooew20f3r7isVYptb8KVgreuXbVX+5otEYFSP9iAYu9fzOz2LM4+YDZx22zerwzv8icQHD2sw
 iMpK2zggE5BZI2D1xXTIe6wREHnIwUVKwHsRNQK3yFnBqTgpSGo8QdS99nYzV9TtfCNM=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jsOLS-00CBEI-Lq
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 06 Jul 2020 10:27:35 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 33B7A4505541926D5931;
 Mon,  6 Jul 2020 18:27:24 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.212) with Microsoft SMTP Server (TLS) id 14.3.487.0; Mon, 6 Jul 2020
 18:27:21 +0800
To: lampahome <pahome.chen@mirlab.org>
References: <CAB3eZfvyo4OzN_odXsnvDO6E=YHTt4qe5CXqQUyG7Mrk+MhzaQ@mail.gmail.com>
 <0ea89e42-8ea7-5557-8717-26d2e6965104@huawei.com>
 <CAB3eZfsjaNxMK+0HqYNAQQgksgGZNOO7QAXoT_Lgqr1+mPss3w@mail.gmail.com>
 <a80be8b3-75d1-33c8-a4da-b4c336ae53be@huawei.com>
 <CAB3eZfuVcAz56N5Cb8+BEsdRtfLWxxd0O+=aY8+qFhFaiAZWLw@mail.gmail.com>
 <2b4fc09f-126c-9f33-9f56-4e72d51eb012@huawei.com>
 <CAB3eZfumC+gx2ccnhOqG7ZLx+6bd0VLuBOS6G2WNqz843vC_+A@mail.gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <7dafaedf-1efa-6e78-f3c4-fea93f4045a9@huawei.com>
Date: Mon, 6 Jul 2020 18:27:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAB3eZfumC+gx2ccnhOqG7ZLx+6bd0VLuBOS6G2WNqz843vC_+A@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.35 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jsOLS-00CBEI-Lq
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

T24gMjAyMC83LzYgMTY6NTgsIGxhbXBhaG9tZSB3cm90ZToKPiBDaGFvIFl1IDx5dWNoYW8wQGh1
YXdlaS5jb20+IOaWvCAyMDIw5bm0N+aciDbml6Ug6YCx5LiAIOS4i+WNiDQ6NTHlr6vpgZPvvJoK
Pj4KPj4gT24gMjAyMC83LzYgMTY6MTEsIGxhbXBhaG9tZSB3cm90ZToKPj4+IEJyaWVmIHByb2Nl
ZHVyZXM6Cj4+PiBwYXJ0ZWQgL2Rldi9zZGQxIGFzIDE2MEdCIGRpc2sKPj4+IG1rZnMgLXQgZjJm
cyAvZGV2L3NkZDEKPj4+IG1vdW50IC9kZXYvc2RkMSAvbW50L2YyZnNkaXIKPj4+Cj4+PiBJIHVz
ZSBzaGVsbCBzY3JpcHQgdG8gY3JlYXRlIDIwIGZpbyBjb25jdXJyZW50bHkgYW5kIHdhaXQgZm9y
IGZpbmlzaC4KPj4+IGZpbyBjb21tYW5kOgo+Pj4gZmlvIC1icz00ayAtaW9kZXB0aD00IC1ydz13
cml0ZSAtaW9lbmdpbmU9bGliYWlvIC1uYW1lPW15IC1kaXJlY3Q9MAo+Pgo+PiBXaHkgbm90IHVz
aW5nIGRpcmVjdD0xIGNvbWJpbmluZyB3aXRoIGxpYmFpbz8gb3RoZXJ3aXNlIGRhdGEgd2FzIG9u
bHkKPj4gd3JpdHRlbiB0byBjYWNoZS4KPj4KPiBTbyBkaXJlY3RJTyBoZWxwIHBlcmZvcm1hbmNl
PwoKSSBndWVzcyBsaWJhaW8gKyBkaXJlY3RpbyBzaG93cyByZWFsIGRldmljZSBwZXJmb3JtYW5j
ZSwgcmF0aGVyIHRoYW4gbWVtb3J5CnBlcmZvcm1hbmNlIHdoZW4gdXNpbmcgbGliYWlvICsgYnVm
ZmVyZWRpbyBpZiB5b3VyIG1lbW9yeSBpcyBsYXJnZSBlbm91Z2guLi4KCj4gCj4+IEJlbG93IGlu
Zm8gc2hvd3MgR0Mgb3IgQ1AgZGlkbid0IGFmZmVjdCB0aGUgdGVzdCByZXN1bHQuCj4gV2h5PyBT
byB0aGUgR0MgYW5kIENQIHdvcmtzIG5vcm1hbGx5Pwo+IENvdWxkIHlvdSB0ZWxsIG1lIGluIGRl
dGFpbD8gdGhhbmtzCgpUaGUgR0MgYW5kIENQIHZhbHVlIGlzIHZlcnkgc21hbGwsIEkgZG9uJ3Qg
dGhpbmsgdGhhdCBjb3VsZCBhZmZlY3QgcGVyZm9ybWFuY2UuCgo+IC4KPiAKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1h
aWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczov
L2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
