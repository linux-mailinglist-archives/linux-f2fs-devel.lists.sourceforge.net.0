Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A441C1815E5
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Mar 2020 11:33:34 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jByg3-00054k-5U; Wed, 11 Mar 2020 10:33:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <megi@xff.cz>) id 1jByg1-00054a-HY
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Mar 2020 10:33:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Hjn5EASm7r1Z0v3eUcSV2Ti5eKFxKQwb9awrZoxAj78=; b=F/SQj/zwEq7KqhAjj1gFiV5Ppi
 kgHyNGcIKEc3Ge47w8uarQp2Y0q6GU8bx4pISpdY0mFbqXLbVCpJ0wf61CE4zjhhEH0cXmkZrIWsG
 oLN3Ork/hvmE99MuRZkxfxPbYTkwUuiXjEC5dccMaV7PsRX1xvV3+Bmncx7hsP31da6o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Hjn5EASm7r1Z0v3eUcSV2Ti5eKFxKQwb9awrZoxAj78=; b=jg5kBf8+qQbFKcu82P66Xxkiel
 Y7wFxDZb+H3f0CRDT4JY70BFhxwqfy7P/E8gFaGOdlk09MWV/9iV+8Nb1co+DeYiLnBqcTDxTuq/H
 Ou21s5qjyMoamaB15S/dID90TJYcKg+YIsQPOG5c2OsAxbmPZ/dt0DxVtFBFQyTLSxkU=;
Received: from vps.xff.cz ([195.181.215.36])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jByfx-008LHz-Qu
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Mar 2020 10:33:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
 t=1583922789; bh=dRISzFx2JBnu+jblONlXo7Qz3C235IdzslaBDbRSJHw=;
 h=Date:From:To:Cc:Subject:References:X-My-GPG-KeyId:From;
 b=lTVVuMBW551I+CuYrT2Oxr3TGIBNfsxiJ1SiQdI+OsJhMR+XiqK2ksEvOKHZ98q2H
 C2/OtC4nHLT7KTA4QTSDyYmzgcjKUxeUOpLsaYCgxlMh6Mwxw2c6AJlcL/K4faBiWd
 0usBx2r7fLnIWusnXeVqJdru43cWl2x3aWIF/yp0=
Date: Wed, 11 Mar 2020 11:33:09 +0100
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200311103309.m52hdut7mt7crt7g@core.my.home>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>,
 Chao Yu <yuchao0@huawei.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20200224143149.au6hvmmfw4ajsq2g@core.my.home>
 <39712bf4-210b-d7b6-cbb1-eb57585d991a@huawei.com>
 <20200225120814.gjm4dby24cs22lux@core.my.home>
 <20200225122706.d6pngz62iwyowhym@core.my.home>
 <72d28eba-53b9-b6f4-01a5-45b2352f4285@huawei.com>
 <20200226121143.uag224cqzqossvlv@core.my.home>
 <20200226180557.le2fr66fyuvrqker@core.my.home>
 <7b62f506-f737-9fb2-6e8e-4b1c454f03b2@huawei.com>
 <20200306120203.2p34ezryzxb2jeuk@core.my.home>
 <0ce08d13-ca00-2823-94eb-8274c332a8ef@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0ce08d13-ca00-2823-94eb-8274c332a8ef@huawei.com>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jByfx-008LHz-Qu
Subject: Re: [f2fs-dev] Writes stoped working on f2fs after the compression
 support was added
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGVsbG8sCgpPbiBXZWQsIE1hciAxMSwgMjAyMCBhdCAwNTowMjoxMFBNICswODAwLCBDaGFvIFl1
IHdyb3RlOgo+IEhpLAo+IAo+IFNvcnJ5IGZvciB0aGUgZGVsYXkuCj4gCj4gT24gMjAyMC8zLzYg
MjA6MDIsIE9uZMWZZWogSmlybWFuIHdyb3RlOgo+ID4gSGVsbG8sCj4gPiAKPiA+IE9uIFRodSwg
RmViIDI3LCAyMDIwIGF0IDEwOjAxOjUwQU0gKzA4MDAsIENoYW8gWXUgd3JvdGU6Cj4gPj4gT24g
MjAyMC8yLzI3IDI6MDUsIE9uZMWZZWogSmlybWFuIHdyb3RlOgo+ID4+Pgo+ID4+PiBObyBpc3N1
ZSBhZnRlciA3aCB1cHRpbWUgZWl0aGVyLiBTbyBJIGd1ZXNzIHRoaXMgcGF0Y2ggc29sdmVkIGl0
IGZvciBzb21lCj4gPj4+IHJlYXNvbi4KPiA+Pgo+ID4+IEkgaG9wZSBzbyBhcyB3ZWxsLCBJIHdp
bGwgc2VuZCBhIGZvcm1hbCBwYXRjaCBmb3IgdGhpcy4KPiA+IAo+ID4gU28gSSBoYWQgaXQgaGFw
cGVuIGFnYWluLCBldmVuIHdpdGggdGhlIHBhdGNoZXMuIFRoaXMgdGltZSBpbiBmMmZzX3JlbmFt
ZTI6Cj4gCj4gT29wcywgaXQgbG9va3MgcHJldmlvdXMgZml4IHBhdGNoIGp1c3QgY292ZXIgdGhl
IHJvb3QgY2F1c2UuLi4gOigKPiAKPiBEaWQgdGhpcyBpc3N1ZSBzdGlsbCBoYXBwZW4gZnJlcXVl
bnRseT8gSWYgaXQgaXMsIHdvdWxkIHlvdSBwbGVhc2UgYXBwbHkgcGF0Y2gKPiB0aGF0IHByaW50
cyBsb2cgZHVyaW5nIGRvd24vdXAgc2VtYXBob3JlLgoKTm90IGZyZXF1ZW50bHkuIEp1c3Qgb25j
ZS4gSSBjb3VsZG4ndCBhZmZvcmQgRlMgY29ycnVwdGlvbiBkdXJpbmcgdXBkYXRlLApzbyBJIHJl
dmVydGVkIHRoZSBjb21wcmVzc2lvbiBzdXBwb3J0IHNob3J0bHkgYWZ0ZXIuCgpCdXQgSSB3YXNu
J3Qgc3RyZXNzaW5nIHRoZSBzeXN0ZW0gbXVjaCB3aXRoIEZTIGFjdGl2aXR5IGFmdGVyIGFwcGx5
aW5nIHRoZQppbml0aWFsIGZpeC4KCj4gQW5kIG9uY2Ugd2UgcmV2ZXJ0IGNvbXByZXNzaW9uIHN1
cHBvcnQgcGF0Y2gsIHRoaXMgaXNzdWUgd2lsbCBkaXNhcHBlYXIsIHJpZ2h0PwoKWWVzLCBBRkFJ
Sy4gSSByZXZlcnRlZCBpdCBhbmQgcnVuIGEgZmV3IGN5Y2xlcyBvZiBpbnN0YWxsIDUwME1pQiB3
b3J0aCBvZgpwYWNrYWdlcywgdW5pbnN0YWxsIHRoZSBwYWNrYWdlcyB3aXRoIHBhY21hbi4gQW5k
IGl0IGRpZG4ndCByZS1vY2N1ci4gSSBuZXZlcgpzYXcgYW55IGlzc3VlcyB3aXRoIGNvbXByZXNz
aW9uIHN1cHBvcnQgcGF0Y2ggcmV2ZXJ0ZWQuCgo+IEJ0dywgZGlkIHlvdSB0cnkgb3RoZXIgaGFy
ZHdhcmUgd2hpY2ggaXMgbm90IEFybSB2Nz8KClllcywgYnV0IEkgZGlkbid0IGV2ZXIgc2VlIGl0
IG9uIGFueXRoaW5nIGVsc2UuIEp1c3Qgb24gdHdvIDggY29yZSBjb3J0ZXhlcyBBNy4KKDIgY2x1
c3RlcnMpCgpyZWdhcmRzLAoJby4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRl
dmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9s
aXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
