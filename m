Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC73378FD9
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 May 2021 16:02:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lg6UQ-0002CU-4E; Mon, 10 May 2021 14:02:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <willy@infradead.org>)
 id 1lg6UO-0002CJ-S2; Mon, 10 May 2021 14:02:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=i6vAxLOytNOYwyM1NYfARO0i+7jkuFK7y9pYt7pXuwE=; b=dfnE7PdFmfA1D+1lSrKjqM5ogh
 HdFg0A1cRTrFxZJqsADAlg6erXzc0e6q/aX/7xbDv1Asujyz3163XHf5QTV3JsrlH8hbtb2byDFJt
 S1xzQ0/ayZQuEw5SS9F4DE4Q/+OLy59a+AL0QEmhYOgJHendeM9nH7PcRaySS2SNJZSM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=i6vAxLOytNOYwyM1NYfARO0i+7jkuFK7y9pYt7pXuwE=; b=Mi7VcpIQvqr3EOtkZwtEnhM6Zw
 mWTvvCbxCh6dVq7VtjR4YFUtBJ60bik/KNWvZekLnnMOGc4r2cCYtXMQc1q2lSlMBwE+A1Gif1/tY
 UBJ+XWygKoOfv1VFHpMB6p7zTK23yJMVyShkQvFdmlzfHL8jA6kKCVUtmjg5oF5L2WiA=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lg6U9-0020xY-M8; Mon, 10 May 2021 14:02:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=i6vAxLOytNOYwyM1NYfARO0i+7jkuFK7y9pYt7pXuwE=; b=djb3CWn/LU378IzapvABLkn8Gd
 Mp82QkScestEUeQW2L+zqtEN7XvYp31eFRebvjBEITr//+6YOo6+SYheq9BxF7YMTeqbS+RN1ORYU
 WcTwnub1JAhAEwo1EbdH4ZtDbzKRVhVt7KKBx8eH43WzT6ZsZkO7OQPiITlB671P2UStmst5kwHpO
 oLDGkct+Pf7s4vCchonkHPjgJ2dHAgGdY9eEvhnNfgt0nMzg4EJ/N8O7mpCEUjiq1yDlLopkoOUQy
 tCb7mahOMAZ84vugzBeIjfIYkNlViOtJdTlUAmJVQy5eePLrQct4R8yXLPW7Hy+DjovMg5jAZGdoa
 yuW/o03A==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lg6RA-006DIB-7H; Mon, 10 May 2021 13:59:19 +0000
Date: Mon, 10 May 2021 14:59:08 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Edward Cree <ecree.xilinx@gmail.com>
Message-ID: <YJk8LMFViV7Z3Uu7@casper.infradead.org>
References: <cover.1620641727.git.mchehab+huawei@kernel.org>
 <2ae366fdff4bd5910a2270823e8da70521c859af.camel@infradead.org>
 <20210510135518.305cc03d@coco.lan>
 <df6b4567-030c-a480-c5a6-fe579830e8c0@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <df6b4567-030c-a480-c5a6-fe579830e8c0@gmail.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lg6U9-0020xY-M8
Subject: Re: [f2fs-dev] [PATCH 00/53] Get rid of UTF-8 chars that can be
 mapped as ASCII
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
Cc: alsa-devel@alsa-project.org, kvm@vger.kernel.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>, linux-iio@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-fpga@vger.kernel.org,
 dri-devel@lists.freedesktop.org, keyrings@vger.kernel.org,
 linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, x86@kernel.org,
 linux-acpi@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
 linux-input@vger.kernel.org, linux-ext4@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-sgx@vger.kernel.org,
 coresight@lists.linaro.org, rcu@vger.kernel.org,
 mjpeg-users@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org,
 linux-edac@vger.kernel.org, linux-hwmon@vger.kernel.org,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-rdma@vger.kernel.org, linux-integrity@vger.kernel.org,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gTW9uLCBNYXkgMTAsIDIwMjEgYXQgMDI6MTY6MTZQTSArMDEwMCwgRWR3YXJkIENyZWUgd3Jv
dGU6Cj4gT24gMTAvMDUvMjAyMSAxMjo1NSwgTWF1cm8gQ2FydmFsaG8gQ2hlaGFiIHdyb3RlOgo+
ID4gVGhlIG1haW4gcG9pbnQgb24gdGhpcyBzZXJpZXMgaXMgdG8gcmVwbGFjZSBqdXN0IHRoZSBv
Y2N1cnJlbmNlcwo+ID4gd2hlcmUgQVNDSUkgcmVwcmVzZW50cyB0aGUgc3ltYm9sIGVxdWFsbHkg
d2VsbAo+IAo+ID4gCS0gVSsyMDE0ICgn4oCUJyk6IEVNIERBU0gKPiBFbSBkYXNoIGlzIG5vdCB0
aGUgc2FtZSB0aGluZyBhcyBoeXBoZW4tbWludXMsIGFuZCB0aGUgbGF0dGVyIGRvZXMgbm90Cj4g
IHNlcnZlICdlcXVhbGx5IHdlbGwnLiAgUGVvcGxlIHVzZSBlbSBkYXNoZXMgYmVjYXVzZSDigJQg
ZXZlbiBpbgo+ICBtb25vc3BhY2UgZm9udHMg4oCUIHRoZXkgbWFrZSB0ZXh0IGVhc2llciB0byBy
ZWFkIGFuZCBjb21wcmVoZW5kLCB3aGVuCj4gIHVzZWQgY29ycmVjdGx5Lgo+IEkgYWNjZXB0IHRo
YXQgc29tZSBvZiB0aGUgb3RoZXIgZGlzdGluY3Rpb25zIOKAlCBsaWtlIGVuIGRhc2hlcyDigJQg
YXJlCj4gIG5lZWRsZXNzbHkgcGVkYW50aWMgKHRob3VnaCBJIGRvbid0IGRvdWJ0IHRoZXJlIGlz
IHNvbWVvbmUgb3V0IHRoZXJlCj4gIHdobyB3aWxsIGdsYWRseSBkZWZlbmQgdGhlbSB3aXRoIHRo
ZSBzYW1lIGZlcnZvdXIgd2l0aCB3aGljaCBJIGFyZ3VlCj4gIGZvciB0aGUgZW0gZGFzaCkgYW5k
IEkgd291bGRuJ3QgdGFrZSB0aGUgdHJvdWJsZSB0byB1c2UgdGhlbSBteXNlbGY7Cj4gIGJ1dCBJ
IHRoaW5rIHRoZXJlIGlzIGEgcmVhc29uYWJsZSBhc3N1bXB0aW9uIHRoYXQgd2hlbiBzb21lb25l
IGdvZXMKPiAgdG8gdGhlIGVmZm9ydCBvZiB1c2luZyBhIFVuaWNvZGUgcHVuY3R1YXRpb24gbWFy
ayB0aGF0IGlzIHNlbWFudGljCj4gIChyYXRoZXIgdGhhbiBtZXJlbHkgdHlwb2dyYXBoaWNhbCks
IHRoZXkgcHJvYmFibHkgaGFkIGEgcmVhc29uIGZvcgo+ICBkb2luZyBzby4KCkkgdGhpbmsgeW91
J3JlIG92ZXJlc3RpbWF0aW5nIHRoZSBhbW91bnQgb2YgY2FyZSBhbmQgdHlwb2dyYXBoaWNhbApr
bm93bGVkZ2UgdGhhdCB5b3VyIGF2ZXJhZ2Uga2VybmVsIGRldmVsb3BlciBoYXMuICBNb3N0IG9m
IHRoZXNlClVURi04IGNoYXJhY3RlcnMgY29tZSBmcm9tIGxhdGV4IGNvbnZlcnNpb25zIGFuZCBy
ZWFsbHkgYXJlbid0Cm5lY2Vzc2FyeSAoYW5kIGFyZSBiZWluZyB1c2VkIGluY29ycmVjdGx5KS4K
CllvdSBzZWVtIHF1aXRlIGtub3dlZGdlYWJsZSBhYm91dCB0aGUgdmFyaW91cyBkaWZmZXJlbmNl
cy4gIFBlcmhhcHMKeW91J2QgYmUgd2lsbGluZyB0byB3cml0ZSBhIGRvY3VtZW50IGZvciBEb2N1
bWVudGF0aW9uL2RvYy1ndWlkZS8KdGhhdCBwcm92aWRlcyBndWlkYW5jZSBmb3Igd2hlbiB0byB1
c2Ugd2hpY2gga2luZHMgb2YgaG9yaXpvbnRhbApsaW5lPyAgaHR0cHM6Ly93d3cucHVuY3R1YXRp
b25tYXR0ZXJzLmNvbS9oeXBoZW4tZGFzaC1uLWRhc2gtYW5kLW0tZGFzaC8KdGFsa3MgYWJvdXQg
aXQgaW4gdGhlIGNvbnRleHQgb2YgcHVibGljYXRpb25zLCBidXQgSSB0aGluayB3ZSBuZWVkCnNv
bWV0aGluZyBtb3JlIHN1aXRlZCB0byBvdXIgbmVlZHMgZm9yIGtlcm5lbCBkb2N1bWVudGF0aW9u
LgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9y
Z2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4
LWYyZnMtZGV2ZWwK
