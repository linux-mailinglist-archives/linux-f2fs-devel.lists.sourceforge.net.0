Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E005421AD6E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Jul 2020 05:20:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jtjak-0002tw-86; Fri, 10 Jul 2020 03:20:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jtjai-0002tp-Hg
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Jul 2020 03:20:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1F/M8sTQY28bE1T1W/Z3pMbWTVz2B3L2eqNajIbuqQc=; b=Lan30kOsP66yZ3Lq0NzxQSXu2y
 jmcY/MvF9v7CgiJvms6s9HyS8IQMRWDs0Fo9hGlxmzzcqjC8AqiEPDES8jBwFVgkmz6bM3TdYBkkm
 BVwI9YDTMJRB2vq1cg1rxEEl2BhAeiD2E2N4yPt9eCbVy3o7/aAoQubmQOgemVF5geJM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1F/M8sTQY28bE1T1W/Z3pMbWTVz2B3L2eqNajIbuqQc=; b=gBVJ5bBpB7NCuoKR61PTl48MQl
 JEN35PCU+FYVaTqHTOm7HJ3ZlRGGCP8D5tf/ARafg3I6y5gGzfU8Bnz93/qPyQUEUTf1dpi8wtJL4
 x9K6fZLqJ4ldvi8UgKYqxf4xsEoXai/d6iCvdH3RQ8bmCpyN7uNSTtKwGriTTMAxMDsQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jtjag-00CoOv-CA
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Jul 2020 03:20:48 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2130B20657;
 Fri, 10 Jul 2020 03:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594351236;
 bh=XReK43l5KBhtSYgtoFBk5br0uXqKW/BoDECZFioWyXY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RM+jp5A3CPHLVfl7472aQS9ZE6OGOxY0fX3HrOCfrYdtoUpJl/KfOIpDOMvbLjR6B
 USXz7zhntA/C59YAHYW9QpkZSgzGtrt65jttrJmXVpL7Lda75BR+N6CGEoyNQIL07Y
 Ui63RRoDhUxgfDfYnp5mqhbKHzb8ZHlfnZMT/vxc=
Date: Thu, 9 Jul 2020 20:20:35 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <20200710032035.GB545837@google.com>
References: <20200710021505.2405872-1-daeho43@gmail.com>
 <20200710030246.GA545837@google.com>
 <CACOAw_yJvQgDsLRd0-iJqXN06wDXmC3_OqKgKey7p=WeqxzMFA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACOAw_yJvQgDsLRd0-iJqXN06wDXmC3_OqKgKey7p=WeqxzMFA@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jtjag-00CoOv-CA
Subject: Re: [f2fs-dev] [PATCH] f2fs: change the way of handling range.len
 in F2FS_IOC_SEC_TRIM_FILE
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

T24gMDcvMTAsIERhZWhvIEplb25nIHdyb3RlOgo+IDEuIFRoZSB2YWxpZCBkYXRhIHdpbGwgYmUg
d2l0aGluIGlfc2l6ZS4KPiAyLiBBbGwgdGhlIHRyaW0gb3BlcmF0aW9ucyB3aWxsIGJlIGRvbmUg
aW4gYSB1bml0IG9mIGJsb2NrLCBldmVuIGlmCj4gaV9zaXplIGlzIG5vdCBhbGlnbmVkIHdpdGgg
QkxLU0laRSBsaWtlIHRoZSBiZWxvdy4KPiAKPiAgICAgICAgIGluZGV4ID0gRjJGU19CWVRFU19U
T19CTEsocmFuZ2Uuc3RhcnQpOwo+ICAgICAgICAgcGdfZW5kID0gRElWX1JPVU5EX1VQKGVuZF9h
ZGRyLCBGMkZTX0JMS1NJWkUpOyAgICAgPD0gQkxLU0laRSBhbGlnbmVkCj4gCj4gQXJlIHlvdSB3
b3JyaWVkIGFib3V0IHRoZSBjYXNlIHRoYXQgc3VkZGVuIHBvd2VyLW9mZiBvY2N1cnMgd2hpbGUg
YQo+IGZpbGUgaXMgYmVpbmcgdHJ1bmNhdGVkPwo+IGV4KSAxR0IgZmlsZSBpcyBiZWluZyB0cnVu
Y2F0ZWQgdG8gNEtCIC0+IHN1ZGRlbiBwb3dlci1vZmYgLT4KPiBpX3NpemUoNEtCKSwgaV9ibG9j
a3MobWF5YmUgc29tZXdoZXJlIGJldHdlZW4gNEtCIGFuZCAxR0IpCgpZZXMuIEJhc2ljYWxseSwg
SSBiZWxpZXZlIHdlIGNhbiBoYXZlIHNvbWUgZGF0YSBiZXlvbmQgaV9zaXplIGxpa2UgZnN2ZXJp
dHkuCgo+IAo+IDIwMjDrhYQgN+yblCAxMOydvCAo6riIKSDsmKTtm4QgMTI6MDIsIEphZWdldWsg
S2ltIDxqYWVnZXVrQGtlcm5lbC5vcmc+64uY7J20IOyekeyEsToKPiA+Cj4gPiBPbiAwNy8xMCwg
RGFlaG8gSmVvbmcgd3JvdGU6Cj4gPiA+IEZyb206IERhZWhvIEplb25nIDxkYWVob2plb25nQGdv
b2dsZS5jb20+Cj4gPiA+Cj4gPiA+IENoYW5nZWQgdGhlIHdheSBvZiBoYW5kbGluZyByYW5nZS5s
ZW4gb2YgRjJGU19JT0NfU0VDX1RSSU1fRklMRS4KPiA+ID4gIDEuIEFkZGVkIC0xIHZhbHVlIHN1
cHBvcnQgZm9yIHJhbmdlLmxlbiB0byBzaWduaWZ5IHRoZSBlbmQgb2YgZmlsZS4KPiA+ID4gIDIu
IElmIHRoZSBlbmQgb2YgdGhlIHJhbmdlIHBhc3NlcyBvdmVyIHRoZSBlbmQgb2YgZmlsZSwgaXQg
bWVhbnMgdW50aWwKPiA+ID4gICAgIHRoZSBlbmQgb2YgZmlsZS4KPiA+ID4gIDMuIGlnbm9yZWQg
dGhlIGNhc2Ugb2YgdGhhdCByYW5nZS5sZW4gaXMgemVybyB0byBwcmV2ZW50IHRoZSBmdW5jdGlv
bgo+ID4gPiAgICAgZnJvbSBtYWtpbmcgZW5kX2FkZHIgemVybyBhbmQgdHJpZ2dlcmluZyBkaWZm
ZXJlbnQgYmVoYXZpb3VyIG9mCj4gPiA+ICAgICB0aGUgZnVuY3Rpb24uCj4gPiA+Cj4gPiA+IFNp
Z25lZC1vZmYtYnk6IERhZWhvIEplb25nIDxkYWVob2plb25nQGdvb2dsZS5jb20+Cj4gPiA+IC0t
LQo+ID4gPiAgZnMvZjJmcy9maWxlLmMgfCAxNiArKysrKysrLS0tLS0tLS0tCj4gPiA+ICAxIGZp
bGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQo+ID4gPgo+ID4gPiBk
aWZmIC0tZ2l0IGEvZnMvZjJmcy9maWxlLmMgYi9mcy9mMmZzL2ZpbGUuYwo+ID4gPiBpbmRleCAz
NjhjODBmOGUyYTEuLjFjNDYwMWY5OTMyNiAxMDA2NDQKPiA+ID4gLS0tIGEvZnMvZjJmcy9maWxl
LmMKPiA+ID4gKysrIGIvZnMvZjJmcy9maWxlLmMKPiA+ID4gQEAgLTM4MTMsMjEgKzM4MTMsMTkg
QEAgc3RhdGljIGludCBmMmZzX3NlY190cmltX2ZpbGUoc3RydWN0IGZpbGUgKmZpbHAsIHVuc2ln
bmVkIGxvbmcgYXJnKQo+ID4gPiAgICAgICBmaWxlX3N0YXJ0X3dyaXRlKGZpbHApOwo+ID4gPiAg
ICAgICBpbm9kZV9sb2NrKGlub2RlKTsKPiA+ID4KPiA+ID4gLSAgICAgaWYgKGYyZnNfaXNfYXRv
bWljX2ZpbGUoaW5vZGUpIHx8IGYyZnNfY29tcHJlc3NlZF9maWxlKGlub2RlKSkgewo+ID4gPiAr
ICAgICBpZiAoZjJmc19pc19hdG9taWNfZmlsZShpbm9kZSkgfHwgZjJmc19jb21wcmVzc2VkX2Zp
bGUoaW5vZGUpIHx8Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICByYW5nZS5zdGFydCA+PSBp
bm9kZS0+aV9zaXplKSB7Cj4gPiA+ICAgICAgICAgICAgICAgcmV0ID0gLUVJTlZBTDsKPiA+ID4g
ICAgICAgICAgICAgICBnb3RvIGVycjsKPiA+ID4gICAgICAgfQo+ID4gPgo+ID4gPiAtICAgICBp
ZiAocmFuZ2Uuc3RhcnQgPj0gaW5vZGUtPmlfc2l6ZSkgewo+ID4gPiAtICAgICAgICAgICAgIHJl
dCA9IC1FSU5WQUw7Cj4gPiA+ICsgICAgIGlmIChyYW5nZS5sZW4gPT0gMCkKPiA+ID4gICAgICAg
ICAgICAgICBnb3RvIGVycjsKPiA+ID4gLSAgICAgfQo+ID4gPgo+ID4gPiAtICAgICBpZiAoaW5v
ZGUtPmlfc2l6ZSAtIHJhbmdlLnN0YXJ0IDwgcmFuZ2UubGVuKSB7Cj4gPiA+IC0gICAgICAgICAg
ICAgcmV0ID0gLUUyQklHOwo+ID4gPiAtICAgICAgICAgICAgIGdvdG8gZXJyOwo+ID4gPiAtICAg
ICB9Cj4gPiA+IC0gICAgIGVuZF9hZGRyID0gcmFuZ2Uuc3RhcnQgKyByYW5nZS5sZW47Cj4gPiA+
ICsgICAgIGlmIChyYW5nZS5sZW4gPT0gKHU2NCktMSB8fCBpbm9kZS0+aV9zaXplIC0gcmFuZ2Uu
c3RhcnQgPCByYW5nZS5sZW4pCj4gPiA+ICsgICAgICAgICAgICAgZW5kX2FkZHIgPSBpbm9kZS0+
aV9zaXplOwo+ID4KPiA+IEhtbSwgd2hhdCBpZiB0aGVyZSBhcmUgYmxvY2tzIGJleW9uZCBpX3Np
emU/IERvIHdlIG5lZWQgdG8gY2hlY2sgaV9ibG9ja3MgZm9yCj4gPiBlbmRpbmcgY3JpdGVyaWE/
Cj4gPgo+ID4gPiArICAgICBlbHNlCj4gPiA+ICsgICAgICAgICAgICAgZW5kX2FkZHIgPSByYW5n
ZS5zdGFydCArIHJhbmdlLmxlbjsKPiA+ID4KPiA+ID4gICAgICAgdG9fZW5kID0gKGVuZF9hZGRy
ID09IGlub2RlLT5pX3NpemUpOwo+ID4gPiAgICAgICBpZiAoIUlTX0FMSUdORUQocmFuZ2Uuc3Rh
cnQsIEYyRlNfQkxLU0laRSkgfHwKPiA+ID4gLS0KPiA+ID4gMi4yNy4wLjM4My5nMDUwMzE5YzJh
ZS1nb29nCj4gPiA+Cj4gPiA+Cj4gPiA+Cj4gPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4gPiA+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0
Cj4gPiA+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4gPiA+IGh0dHBz
Oi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1m
MmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdl
Lm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1m
MmZzLWRldmVsCg==
