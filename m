Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F3016C046
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Feb 2020 13:08:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j6Z0p-0004KC-7n; Tue, 25 Feb 2020 12:08:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <megi@xff.cz>) id 1j6Z0n-0004Jx-PI
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 25 Feb 2020 12:08:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T8lf6Gv7qkqwCJy3UOM1V+Epbi37aarByMhQ9VOQS70=; b=CqwETUFp9RGA0S8iEsl9C1aXME
 3SDX97UtVm5H1YWd0wFpED8Ku7H4HYxAiGmy+thvRNAJF1b9SjuOIJ6WCufE6cPTP7RuBExfaUsJ1
 Yv7f+oZ48L2Gy5B5tmHS7sylZRfOQH6a0SMcGQvxJjKSGD5qcbfB4bqsdudy8/L4Xm3Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=T8lf6Gv7qkqwCJy3UOM1V+Epbi37aarByMhQ9VOQS70=; b=lF6nrOurSbauj1cylYVVEqHFYb
 +xmyjmoIUYffGzKMBNkoyk0qyozWw2pVe6plzOmTuGnG2ofEP8yfuR1eAN5GjoGSFaTm8947cFbqv
 d/d51cqbQ0/CWfl+a9R3nx6tOdNg3o6lFpSAxr/it5j4PxPWpt0vnVuy/q2/HG23/9kI=;
Received: from vps.xff.cz ([195.181.215.36])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j6Z0i-00FzZ8-0z
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 25 Feb 2020 12:08:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
 t=1582632494; bh=aFCyi3mPQcM8lA4HBXgAPMKi4L5mrY+6Az98qx6fEfc=;
 h=Date:From:To:Cc:Subject:References:X-My-GPG-KeyId:From;
 b=ZJ4W3Xcorqp3xobCQUxe72FPFduLW1+KMHQDGLHfKpwtg9MxRuKebkGO6HXVGbw7c
 5BPa4nfebHcKCv/jSPRWkKX4zm9BzD0zSzbu4nG14vPcC+CHveE4NKEAzahoUZkuRo
 7o96RtDT1r3+XJNwBIgRbHZ3pvZ33hM43mXsm+Os=
Date: Tue, 25 Feb 2020 13:08:14 +0100
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200225120814.gjm4dby24cs22lux@core.my.home>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>,
 Chao Yu <yuchao0@huawei.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20191209222345.1078-1-jaegeuk@kernel.org>
 <20200222044617.pfrhnz2iavkrtdn6@core.my.home>
 <20200222181721.tzrrohep5l3yklpf@core.my.home>
 <bec3798b-f861-b132-9138-221027bb5195@huawei.com>
 <b1eb9b22-b570-41ab-5177-2c89105428a2@huawei.com>
 <20200224135837.k54ke4ppca26ibec@core.my.home>
 <20200224140349.74yagjdwewmclx4v@core.my.home>
 <20200224143149.au6hvmmfw4ajsq2g@core.my.home>
 <39712bf4-210b-d7b6-cbb1-eb57585d991a@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <39712bf4-210b-d7b6-cbb1-eb57585d991a@huawei.com>
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
X-Headers-End: 1j6Z0i-00FzZ8-0z
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

SGVsbG8sCgpPbiBUdWUsIEZlYiAyNSwgMjAyMCBhdCAwNzoyNDoxMlBNICswODAwLCBDaGFvIFl1
IHdyb3RlOgo+IE9uIDIwMjAvMi8yNCAyMjozMSwgT25kxZllaiBKaXJtYW4gd3JvdGU6Cj4gPj4g
SnVzdCBieSBhIGxvb2tzIG9mIGl0Ogo+ID4+Cj4gPj4gcm9vdEB0YnMyWy9wcm9jL3N5cy9rZXJu
ZWxdICMgZG1lc2cgfCBncmVwIHVwX3dyaXRlIHwgd2MgLWwKPiA+PiAzMjQKPiA+PiByb290QHRi
czJbL3Byb2Mvc3lzL2tlcm5lbF0gIyBkbWVzZyB8IGdyZXAgZG93bl93cml0ZSB8IHdjIC1sCj4g
Pj4gMzQ3Cj4gPj4KPiA+PiB0aGVyZSBzZWVtcyB0byBiZSBhIG1pc21hdGNoIG9mIGxvY2svdW5s
b2NrIGNvdW50cy4KPiA+ICAKPiA+IFNvcnJ5LCBhIHdyb25nIGdyZXAgZXhwcmVzc2lvbi4KPiA+
IAo+ID4gcm9vdEB0YnMyW35dICMgZG1lc2cgfCBncmVwIGlub2RlX2Rvd25fd3JpdGUgfCB3YyAt
bAo+ID4gMzU3Cj4gPiByb290QHRiczJbfl0gIyBkbWVzZyB8IGdyZXAgaW5vZGVfdXBfd3JpdGUg
fCB3YyAtbAo+ID4gMzU3Cj4gPiByb290QHRiczJbfl0gIyBkbWVzZyB8IGdyZXAgaW5vZGVfdXBf
cmVhZCB8IHdjIC1sCj4gPiAxNgo+ID4gcm9vdEB0YnMyW35dICMgZG1lc2cgfCBncmVwIGlub2Rl
X2Rvd25fcmVhZCB8IHdjIC1sCj4gPiAxNgo+IAo+IEkgZG9uJ3Qga25vdyB3aHkgd2UgaGF2ZSBj
b25zaXN0ZW50IGRvd24vdXAgcGFpciwgYnV0IHRocm91Z2ggZGlzYXNzZW1ibGVkCj4gY29kZSwg
SSBkb3VidCBpdCdzIHRoZSBmMmZzX2lub2RlLT5pX3NlbS4KCkJlY2F1c2Ugd2Ugd2VyZSBjb3Vu
dGluZyBhdHRlbXB0cywgYW5kIG5vdCBhIHN1Y2Nlc3NmdWwgbG9jay4gOykKCj4gYzA0MzVkN2M6
ICAgICAgIGViZjU0YWY4ICAgICAgICBibCAgICAgIGMwMTg4OTY0IDxwcmludGs+Cj4gYzA0MzVk
ODA6ICAgICAgIGUxYTAwMDA2ICAgICAgICBtb3YgICAgIHIwLCByNgo+IGMwNDM1ZDg0OiAgICAg
ICBlYjEzODEzNSAgICAgICAgYmwgICAgICBjMDkxNjI2MCA8ZG93bl93cml0ZT4KPiAKPiBpbm9k
ZV9kb3duX3dyaXRlKCkKPiAKPiBjMDQzNWQ4ODogICAgICAgZTI4NGNlMWQgICAgICAgIGFkZCAg
ICAgaXAsIHI0LCAjNDY0ICAgIDsgMHgxZDAKPiAKPiBXZSBhcmUgc3R1Y2sgaGVyZS4KPiAKPiBb
ICA0MzAuNjc1NzU0XSBbPGMwOTE2MjYwPl0gKGRvd25fd3JpdGUpIGZyb20gWzxjMDQzNWQ4OD5d
IChmMmZzX3dyaXRlX3NpbmdsZV9kYXRhX3BhZ2UrMHg2MDAvMHg3ZDgpCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXl5eXl5eXl5eCj4gWyAgNDMwLjY3
NTc2NF0gWzxjMDQzNTc4OD5dIChmMmZzX3dyaXRlX3NpbmdsZV9kYXRhX3BhZ2UpIGZyb20gWzxj
MDQzNjIxND5dIChmMmZzX3dyaXRlX2NhY2hlX3BhZ2VzKzB4MmI0LzB4N2M0KQo+IAo+IAo+IGMw
NDM1ZDhjOiAgICAgICBlMTRiMGFkNCAgICAgICAgbGRyZCAgICByMCwgW2ZwLCAjLTE2NF0gOyAw
eGZmZmZmZjVjCj4gYzA0MzVkOTA6ICAgICAgIGUxY2MyMGQwICAgICAgICBsZHJkICAgIHIyLCBb
aXBdCj4gYzA0MzVkOTQ6ICAgICAgIGUxNTIwMDAwICAgICAgICBjbXAgICAgIHIyLCByMAo+IGMw
NDM1ZDk4OiAgICAgICBlMGQzMzAwMSAgICAgICAgc2JjcyAgICByMywgcjMsIHIxCj4gYzA0MzVk
OWM6ICAgICAgIGIxY2MwMGYwICAgICAgICBzdHJkbHQgIHIwLCBbaXBdCj4gYzA0MzVkYTA6ICAg
ICAgIGUxYTAwMDA2ICAgICAgICBtb3YgICAgIHIwLCByNgo+IGMwNDM1ZGE0OiAgICAgICBlYmY1
MjIyNyAgICAgICAgYmwgICAgICBjMDE3ZTY0OCA8dXBfd3JpdGU+Cj4gYzA0MzVkYTg6ICAgICAg
IGU1MWIyMDk4ICAgICAgICBsZHIgICAgIHIyLCBbZnAsICMtMTUyXSA7IDB4ZmZmZmZmNjgKPiBj
MDQzNWRhYzogICAgICAgZTMwYzA3MzAgICAgICAgIG1vdncgICAgcjAsICM1MDk5MiAgICAgIDsg
MHhjNzMwCj4gYzA0MzVkYjA6ICAgICAgIGU1OWYxMWE0ICAgICAgICBsZHIgICAgIHIxLCBbcGMs
ICM0MjBdICA7IGMwNDM1ZjVjIDxmMmZzX3dyaXRlX3NpbmdsZV9kYXRhX3BhZ2UrMHg3ZDQ+Cj4g
YzA0MzVkYjQ6ICAgICAgIGUzNGMwMGI2ICAgICAgICBtb3Z0ICAgIHIwLCAjNDkzMzQgICAgICA7
IDB4YzBiNgo+IGMwNDM1ZGI4OiAgICAgICBlYmY1NGFlOSAgICAgICAgYmwgICAgICBjMDE4ODk2
NCA8cHJpbnRrPgo+IAo+IGlub2RlX3VwX3dyaXRlKCkKClRoZSBwYXRjaCB5b3Ugc2VudCBoZWxw
ZWQgc28gZmFyLiBJJ2xsIGtlZXAgdGhlIHRhYmxldCBydW5uaW5nIGZvciBhIHdoaWxlLApidXQg
c28gZmFyIHRoZSBpc3N1ZSBkaWQgbm90IHJlYXBwZWFyIHdpdGhpbiBhIGZldyBtaW51dGVzIGFm
dGVyIGJvb3QgYXMKdXN1YWwuCgp0aGFuayB5b3UgYW5kIHJlZ2FyZHMsCglvLgoKPiBUaGFua3Ms
Cj4gCj4gPiAKPiA+IFNvIGl0J3MgcHJvYmFibHkgbm90IGlub2RlIGxvY2tpbmcuCj4gPiAKPiA+
PiByb290QHRiczJbL3Byb2Mvc3lzL2tlcm5lbF0gIyBkbWVzZyB8IGdyZXAgZG93bl9yZWFkIHwg
d2MgLWwKPiA+PiAxNgo+ID4+IHJvb3RAdGJzMlsvcHJvYy9zeXMva2VybmVsXSAjIGRtZXNnIHwg
Z3JlcCB1cF9yZWFkIHwgd2MgLWwKPiA+PiAxNgo+ID4+Cj4gPj4gcmVnYXJkcywKPiA+PiAJby4K
PiA+Pgo+ID4+PiB0aGFuayB5b3UsCj4gPj4+IAlvLgo+ID4+Pgo+ID4+Pj4+IFRoYW5rcywKPiA+
Pj4+Pgo+ID4+Pj4+PiBbICAyNDYuNzU4MTkwXSAgcjU6ZWZmMjEzYjAgcjQ6ZGEyODNjNjAKPiA+
Pj4+Pj4gWyAgMjQ2Ljc1ODE5OF0gWzxjMDQzNTU3OD5dIChmMmZzX3dyaXRlX3NpbmdsZV9kYXRh
X3BhZ2UpIGZyb20gWzxjMDQzNWZkOD5dIChmMmZzX3dyaXRlX2NhY2hlX3BhZ2VzKzB4MmI0LzB4
N2M0KQo+ID4+Pj4+PiBbICAyNDYuNzU4MjA0XSAgcjEwOmRhNjQ1YzI4IHI5OmRhMjgzZDYwIHI4
OmRhMjgzYzYwIHI3OjAwMDAwMDBmIHI2OmRhNjQ1ZDgwIHI1OjAwMDAwMDAxCj4gPj4+Pj4+IFsg
IDI0Ni43NTgyMDZdICByNDplZmYyMTNiMAo+ID4+Pj4+PiBbICAyNDYuNzU4MjE0XSBbPGMwNDM1
ZDI0Pl0gKGYyZnNfd3JpdGVfY2FjaGVfcGFnZXMpIGZyb20gWzxjMDQzNjgyYz5dIChmMmZzX3dy
aXRlX2RhdGFfcGFnZXMrMHgzNDQvMHgzNWMpCj4gPj4+Pj4+IFsgIDI0Ni43NTgyMjBdICByMTA6
MDAwMDAwMDAgcjk6ZDllZDAwMmMgcjg6ZDllZDAwMDAgcjc6MDAwMDAwMDQgcjY6ZGEyODNkNjAg
cjU6ZGEyODNjNjAKPiA+Pj4+Pj4gWyAgMjQ2Ljc1ODIyM10gIHI0OmRhNjQ1ZDgwCj4gPj4+Pj4+
IFsgIDI0Ni43NTgyMzhdIFs8YzA0MzY0ZTg+XSAoZjJmc193cml0ZV9kYXRhX3BhZ2VzKSBmcm9t
IFs8YzAyNjdlZTg+XSAoZG9fd3JpdGVwYWdlcysweDNjLzB4ZDQpCj4gPj4+Pj4+IFsgIDI0Ni43
NTgyNDRdICByMTA6MDAwMDAwMGEgcjk6YzBlMDNkMDAgcjg6MDAwMDBjMDAgcjc6YzAyNjRkZGMg
cjY6ZGE2NDVkODAgcjU6ZGEyODNkNjAKPiA+Pj4+Pj4gWyAgMjQ2Ljc1ODI0Nl0gIHI0OmRhMjgz
YzYwCj4gPj4+Pj4+IFsgIDI0Ni43NTgyNTRdIFs8YzAyNjdlYWM+XSAoZG9fd3JpdGVwYWdlcykg
ZnJvbSBbPGMwMzEwY2JjPl0gKF9fd3JpdGViYWNrX3NpbmdsZV9pbm9kZSsweDQ0LzB4NDU0KQo+
ID4+Pj4+PiBbICAyNDYuNzU4MjU5XSAgcjc6ZGEyODNkNjAgcjY6ZGE2NDVlYWMgcjU6ZGE2NDVk
ODAgcjQ6ZGEyODNjNjAKPiA+Pj4+Pj4gWyAgMjQ2Ljc1ODI2Nl0gWzxjMDMxMGM3OD5dIChfX3dy
aXRlYmFja19zaW5nbGVfaW5vZGUpIGZyb20gWzxjMDMxMTJkMD5dICh3cml0ZWJhY2tfc2JfaW5v
ZGVzKzB4MjA0LzB4NGIwKQo+ID4+Pj4+PiBbICAyNDYuNzU4MjcyXSAgcjEwOjAwMDAwMDBhIHI5
OmMwZTAzZDAwIHI4OmRhMjgzY2M4IHI3OmRhMjgzYzYwIHI2OmRhNjQ1ZWFjIHI1OmRhMjgzZDA4
Cj4gPj4+Pj4+IFsgIDI0Ni43NTgyNzRdICByNDpkOWRjOTg0OAo+ID4+Pj4+PiBbICAyNDYuNzU4
MjgxXSBbPGMwMzExMGNjPl0gKHdyaXRlYmFja19zYl9pbm9kZXMpIGZyb20gWzxjMDMxMTVjYz5d
IChfX3dyaXRlYmFja19pbm9kZXNfd2IrMHg1MC8weGU0KQo+ID4+Pj4+PiBbICAyNDYuNzU4Mjg3
XSAgcjEwOmRhMzc5N2E4IHI5OmMwZTAzZDAwIHI4OmQ5ZGM5ODVjIHI3OmRhNjQ1ZWFjIHI2OjAw
MDAwMDAwIHI1OmQ5ZGM5ODQ4Cj4gPj4+Pj4+IFsgIDI0Ni43NTgyODldICByNDpkYTVhODgwMAo+
ID4+Pj4+PiBbICAyNDYuNzU4Mjk2XSBbPGMwMzExNTdjPl0gKF9fd3JpdGViYWNrX2lub2Rlc193
YikgZnJvbSBbPGMwMzExOGY0Pl0gKHdiX3dyaXRlYmFjaysweDI5NC8weDMzOCkKPiA+Pj4+Pj4g
WyAgMjQ2Ljc1ODMwMl0gIHIxMDpmZmZiZjIwMCByOTpkYTY0NDAwMCByODpjMGUwNGU2NCByNzpk
OWRjOTg0OCByNjpkOWRjOTg3NCByNTpkYTY0NWVhYwo+ID4+Pj4+PiBbICAyNDYuNzU4MzA1XSAg
cjQ6ZDlkYzk4NDgKPiA+Pj4+Pj4gWyAgMjQ2Ljc1ODMxMl0gWzxjMDMxMTY2MD5dICh3Yl93cml0
ZWJhY2spIGZyb20gWzxjMDMxMmRhYz5dICh3Yl93b3JrZm4rMHgzNWMvMHg1NGMpCj4gPj4+Pj4+
IFsgIDI0Ni43NTgzMThdICByMTA6ZGE1ZjIwMDUgcjk6ZDlkYzk4NGMgcjg6ZDlkYzk5NDggcjc6
ZDlkYzk4NDggcjY6MDAwMDAwMDAgcjU6ZDlkYzk5NTQKPiA+Pj4+Pj4gWyAgMjQ2Ljc1ODMyMV0g
IHI0OjAwMDAzMWU2Cj4gPj4+Pj4+IFsgIDI0Ni43NTgzMzRdIFs8YzAzMTJhNTA+XSAod2Jfd29y
a2ZuKSBmcm9tIFs8YzAxNGYyYjg+XSAocHJvY2Vzc19vbmVfd29yaysweDIxNC8weDU0NCkKPiA+
Pj4+Pj4gWyAgMjQ2Ljc1ODM0MF0gIHIxMDpkYTVmMjAwNSByOTowMDAwMDIwMCByODowMDAwMDAw
MCByNzpkYTVmMjAwMCByNjplZjA0NDQwMCByNTpkYTVlYjAwMAo+ID4+Pj4+PiBbICAyNDYuNzU4
MzQzXSAgcjQ6ZDlkYzk5NTQKPiA+Pj4+Pj4gWyAgMjQ2Ljc1ODM1MF0gWzxjMDE0ZjBhND5dIChw
cm9jZXNzX29uZV93b3JrKSBmcm9tIFs8YzAxNGY2MzQ+XSAod29ya2VyX3RocmVhZCsweDRjLzB4
NTc0KQo+ID4+Pj4+PiBbICAyNDYuNzU4MzU3XSAgcjEwOmVmMDQ0NDAwIHI5OmMwZTAzZDAwIHI4
OmVmMDQ0NDE4IHI3OjAwMDAwMDg4IHI2OmVmMDQ0NDAwIHI1OmRhNWViMDE0Cj4gPj4+Pj4+IFsg
IDI0Ni43NTgzNTldICByNDpkYTVlYjAwMAo+ID4+Pj4+PiBbICAyNDYuNzU4MzY4XSBbPGMwMTRm
NWU4Pl0gKHdvcmtlcl90aHJlYWQpIGZyb20gWzxjMDE1NjRmYz5dIChrdGhyZWFkKzB4MTQ0LzB4
MTcwKQo+ID4+Pj4+PiBbICAyNDYuNzU4Mzc0XSAgcjEwOmVjOWU1ZTkwIHI5OmRhYmYzMjVjIHI4
OmRhNWViMDAwIHI3OmRhNjQ0MDAwIHI2OjAwMDAwMDAwIHI1OmRhNWZlMDAwCj4gPj4+Pj4+IFsg
IDI0Ni43NTgzNzddICByNDpkYWJmMzI0MAo+ID4+Pj4+PiBbICAyNDYuNzU4Mzg2XSBbPGMwMTU2
M2I4Pl0gKGt0aHJlYWQpIGZyb20gWzxjMDEwMTBlOD5dIChyZXRfZnJvbV9mb3JrKzB4MTQvMHgy
YykKPiA+Pj4+Pj4gWyAgMjQ2Ljc1ODM5MV0gRXhjZXB0aW9uIHN0YWNrKDB4ZGE2NDVmYjAgdG8g
MHhkYTY0NWZmOCkKPiA+Pj4+Pj4gWyAgMjQ2Ljc1ODM5N10gNWZhMDogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAK
PiA+Pj4+Pj4gWyAgMjQ2Ljc1ODQwMl0gNWZjMDogMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAg
MDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAKPiA+Pj4+Pj4gWyAg
MjQ2Ljc1ODQwN10gNWZlMDogMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAw
MDAwMTMgMDAwMDAwMDAKPiA+Pj4+Pj4gWyAgMjQ2Ljc1ODQxM10gIHIxMDowMDAwMDAwMCByOTow
MDAwMDAwMCByODowMDAwMDAwMCByNzowMDAwMDAwMCByNjowMDAwMDAwMCByNTpjMDE1NjNiOAo+
ID4+Pj4+PiBbICAyNDYuNzU4NDE2XSAgcjQ6ZGE1ZmUwMDAKPiA+Pj4+Pj4gLgo+ID4+Pj4+Pgo+
ID4+Pj4+Cj4gPj4+Pj4KPiA+Pj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+ID4+Pj4+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4gPj4+
Pj4gTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPiA+Pj4+PiBodHRwczov
L2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCj4g
Pj4+Pj4KPiA+IC4KPiA+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxA
bGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3Rz
L2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
