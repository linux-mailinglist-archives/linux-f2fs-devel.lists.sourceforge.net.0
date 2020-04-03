Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E286519CED7
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  3 Apr 2020 05:20:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jKCst-00065R-7F; Fri, 03 Apr 2020 03:20:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <kilobyte@angband.pl>) id 1jKCsp-00064y-HU
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 03 Apr 2020 03:20:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fPtkKNQoPMMmWlExdCV/WY/MiIJ8irL7A1My86XI3lI=; b=bzJTINgimr0Is4plBbc/eXbJox
 QsEWIYkh4N3s68hizmXqwoH9y5BdcVSkAK1I6Jw+6mxz+rDRYlw47UXO1o8RBTAQMSx1faCj5Whvd
 8Cml4Q12IjXQaCILi4Nv8AN2SqPEh8XjObghGx41cd6BkyeNmIdD0BBCl62Xbqm/VbZ8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fPtkKNQoPMMmWlExdCV/WY/MiIJ8irL7A1My86XI3lI=; b=AhtYOhZkavQHE1h4FjJJeNsCFA
 yEwwHCDNu2DsU1rhN/ADgUmf7dkMQCkUNnFduK7hD5DKF7w5fhATGczoVdAcFLRWhsbbXzf+xBVkI
 P2H6KSL2Nl/Er57Q3q7V3+IEN3iJvs2xslpqexiwt5V08k4WsUkupuMKXhsvIgVCZoM0=;
Received: from tartarus.angband.pl ([54.37.238.230])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jKCsl-00HTQE-8X
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 03 Apr 2020 03:20:39 +0000
Received: from kilobyte by tartarus.angband.pl with local (Exim 4.92)
 (envelope-from <kilobyte@angband.pl>)
 id 1jKCKt-0003XY-9M; Fri, 03 Apr 2020 04:45:35 +0200
Date: Fri, 3 Apr 2020 04:45:35 +0200
From: Adam Borowski <kilobyte@angband.pl>
To: "Theodore Y. Ts'o" <tytso@mit.edu>
Message-ID: <20200403024535.GA23417@angband.pl>
References: <158582888648.9053.2167684001695943018.reportbug@umbar.angband.pl>
 <20200402191658.GR768293@mit.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200402191658.GR768293@mit.edu>
X-Junkbait: aaron@angband.pl, zzyx@angband.pl
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: kilobyte@angband.pl
X-SA-Exim-Scanned: No (on tartarus.angband.pl); SAEximRunCond expanded to false
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1jKCsl-00HTQE-8X
Subject: Re: [f2fs-dev] Bug#955549: f2fs-tools: fsck.f2fs segfaults
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
Cc: 955549@bugs.debian.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVGh1LCBBcHIgMDIsIDIwMjAgYXQgMDM6MTY6NThQTSAtMDQwMCwgVGhlb2RvcmUgWS4gVHMn
byB3cm90ZToKPiBPbiBUaHUsIEFwciAwMiwgMjAyMCBhdCAwMjowMToyNlBNICswMjAwLCBBZGFt
IEJvcm93c2tpIHdyb3RlOgo+ID4KPiA+IEFmdGVyIGEgbG90IG9mIG91dHB1dCBvbiBhIGRhbWFn
ZWQgZmlsZXN5c3RlbSAoU0QgY2FyZCBjb3BpZWQgdG8gYW4gaW1hZ2UpCj4gPiBmc2NrLmYyZnMg
ZGllcyB3aXRoOgo+ID4gCj4gPiAgLSBGaWxlIG5hbWUgICAgICAgICA6IG1rZnMuZXh0My5kcGtn
LW5ldwo+ID4gIC0gRmlsZSBzaXplICAgICAgICAgOiA2IChieXRlcykKPiA+IAo+ID4gUHJvZ3Jh
bSByZWNlaXZlZCBzaWduYWwgU0lHU0VHViwgU2VnbWVudGF0aW9uIGZhdWx0Lgo+ID4gMHgwMDAw
NTU1NTU1NTU5M2VjIGluIG1lbWNweSAoX19sZW49MTg0NDY3NDQwNzMzMjM4OTI3MzYsIF9fc3Jj
PTB4NTU1NTU1NjA3NjBjLCBfX2Rlc3Q9MHg3ZmZmZmZmZmUwMDApIGF0IC91c3IvaW5jbHVkZS94
ODZfNjQtbGludXgtZ251L2JpdHMvc3RyaW5nX2ZvcnRpZmllZC5oOjM0Cj4gPiAzNAkgIHJldHVy
biBfX2J1aWx0aW5fX19tZW1jcHlfY2hrIChfX2Rlc3QsIF9fc3JjLCBfX2xlbiwgX19ib3MwIChf
X2Rlc3QpKTsKCj4gPiAjMCAgMHgwMDAwNTU1NTU1NTU5M2VjIGluIG1lbWNweSAoX19sZW49MTg0
NDY3NDQwNzMzMjM4OTI3MzYsIF9fc3JjPTB4NTU1NTU1NjA3NjBjLCBfX2Rlc3Q9MHg3ZmZmZmZm
ZmUwMDApIGF0IC91c3IvaW5jbHVkZS94ODZfNjQtbGludXgtZ251L2JpdHMvc3RyaW5nX2ZvcnRp
ZmllZC5oOjM0Cj4gPiAjMSAgY29udmVydF9lbmNyeXB0ZWRfbmFtZSAobmFtZT1uYW1lQGVudHJ5
PTB4NTU1NTU1NjA3NjBjICIgIiwgbGVuPS0zODU2NTg4ODAsIG5ldz1uZXdAZW50cnk9MHg3ZmZm
ZmZmZmUwMDAgIiAiLCBlbmNfbmFtZT08b3B0aW1pemVkIG91dD4pIGF0IGZzY2suYzoxMTMyCj4g
PiAjMiAgMHgwMDAwNTU1NTU1NTYyMjg2IGluIHByaW50X2lub2RlX2luZm8gKHNiaT0weDU1NTU1
NTU3ZGIyMCA8Z2ZzY2s+LCBub2RlPTB4NTU1NTU1NjA3NWIwLCBuYW1lPTEpIGF0IG1vdW50LmM6
MTgzCj4gPiAjMyAgMHgwMDAwNTU1NTU1NTYyYTQ2IGluIHByaW50X25vZGVfaW5mbyAoc2JpPTxv
cHRpbWl6ZWQgb3V0Piwgbm9kZV9ibG9jaz08b3B0aW1pemVkIG91dD4sIHZlcmJvc2U9PG9wdGlt
aXplZCBvdXQ+KSBhdCBtb3VudC5jOjI3Nwo+ID4gIzQgIDB4MDAwMDU1NTU1NTU2MGQzZiBpbiBk
dW1wX25vZGUgKHNiaT1zYmlAZW50cnk9MHg1NTU1NTU1N2RiMjAgPGdmc2NrPiwgbmlkPW5pZEBl
bnRyeT0yNDI3NCwgZm9yY2U9Zm9yY2VAZW50cnk9MSkgYXQgZHVtcC5jOjUyMAo+ID4gIzUgIDB4
MDAwMDU1NTU1NTU1ZTk0YyBpbiBmc2NrX3ZlcmlmeSAoc2JpPTB4NTU1NTU1NTdkYjIwIDxnZnNj
az4pIGF0IGZzY2suYzoyNTY4Cj4gPiAjNiAgMHgwMDAwNTU1NTU1NTU2OTliIGluIGRvX2ZzY2sg
KHNiaT0weDU1NTU1NTU3ZGIyMCA8Z2ZzY2s+KSBhdCBtYWluLmM6NTY5Cgo+ID4gSSBoYXZlIGEg
Y29weSBvZiB0aGUgZmlsZXN5c3RlbSBpbiBxdWVzdGlvbiBmcm9tIGJlZm9yZSBhbnkgcmVwYWly
IGF0dGVtcHRzLiAKPiA+IEl0IGhhcyBubyBzZW5zaXRpdmUgZGF0YSBvbiBpdCwgdGh1cyBJIGNh
biBzaGFyZSBpZiBuZWVkZWQgLS0gMTRHQi4KPiAKPiBUaGFua3MgZm9yIHRoZSBidWcgcmVwb3J0
LiAgQ2FuIHlvdSBtYWtlIHRoZSBmaWxlIHN5c3RlbSBpbWFnZQo+IGF2YWlsYWJsZSBzb21laG93
PyAgTWF5YmUgZm9yIGRvd25sb2FkIGF0IHNvbWUgVVJMPyAgSG93IHdlbGwgZG9lcyBpdAo+IGNv
bXByZXNzPwoKOTE2TUIgLS0gaHR0cHM6Ly9hbmdiYW5kLnBsL3JpZ2VsLmYyZnMueHouZ3BnClRo
ZSBtYWNoaW5lIHNlcnZlcyBhcyBhIHNlcmlhbCBjb25zb2xlIGxvZ2dlci9tYW5hZ2VtZW50IGZv
ciBhIGJ1bmNoIG9mCmJveGVzOyBhIHJvb3Qgc2Vzc2lvbiBpcyB1bmxpa2VseSB0byBoYXZlIGFu
eXRoaW5nIEknZCBub3Qgc2hhcmUgd2l0aApkZXZlbG9wZXJzIGJ1dCBpcyBub3Qgc29tZXRoaW5n
IHRvIHJlbGVhc2UgdG8gdGhlIHdpZGUgd29ybGQuICBUaHVzLCBJCnN5bWV0cmljYWxseSBlbmNy
eXB0ZWQgdGhlIGltYWdlLCBJJ2xsIHNlbmQgeW91IHRoZSBwYXNzd29yZCBwcml2YXRlbHkgLS0K
ZmVlbCBmcmVlIHRvIHNoYXJlIGl0IHdpdGggYW55b25lIHNlbWktdHJ1c3RlZC4KClRoZSBmaWxl
c3lzdGVtIHdhcyBvbiBhIFNEIGNhcmQsIHdpdGggdmVyeSBsaWdodCB1c2UgKGFwcGVuZCksIG5v
IGlzc3VlcywKcmFuIGtlcm5lbCA0LjEzIHVudGlsIDkgZGF5cyBhZ28gLS0gdGhlbiBJJ3ZlIHVw
Z3JhZGVkIHRvIDUuNS4xMSB3aXRoIG5vCm90aGVyIGNoYW5nZXMuICBUaGUgY29ycnVwdGlvbiBp
cyBwcm9iYWJseSBjYXVzZWQgYnkgdGhhdCwgYnV0IHRoZXJlJ3MKYWx3YXlzIGEgY2hhbmNlIG9m
IFNEIGJlaW5nIFNELgoKCk1lb3chCi0tIAriooDio7TioL7ioLviorbio6bioIAK4qO+4qCB4qKg
4qCS4qCA4qO/4qGBIGluIHRoZSBiZWdpbm5pbmcgd2FzIHRoZSBib290IGFuZCByb290IGZsb3Bw
aWVzIGFuZCB0aGV5IHdlcmUgZ29vZC4K4qK/4qGE4qCY4qC34qCa4qCL4qCAICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gPHdpbGxtb3JlPiBvbiAjbGludXgtc3VueGkK
4qCI4qCz4qOE4qCA4qCA4qCA4qCACgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1k
ZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQv
bGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
