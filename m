Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AB15737B362
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 May 2021 03:20:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lgdYA-0008K1-IA; Wed, 12 May 2021 01:20:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <xiang@kernel.org>) id 1lgdY8-0008Jl-Lj
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 12 May 2021 01:20:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dniS0CmuiZ0o9KezPQEyVhvKI2+fhExuuPqIRxn9ILI=; b=FX5h0xnWkD9KRmHw2qpb6w7Pry
 QM6qCTrYcloB8bC+O5fd6SZSBRJK3rZ8kznBzZXwKG1yw8jQPNCy8mvAwzGwc6OgTk8ljCbtHoNXK
 SJnDybYLdU90CoE+8tiBpKRv5/ejudhnGknptTHYXNyMLGnKud/c8eRJEflaMDDhbVuU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dniS0CmuiZ0o9KezPQEyVhvKI2+fhExuuPqIRxn9ILI=; b=Ye8gbugArOgUUnh3KaJ/fIMggn
 drcHQ3WuoJ6g7CbriL5L8FRhmeR78ngorptojefRrLYGIIN8c13GRGb0oxeBq/HKY/AOLE3rVRYX9
 7h3Zc+fp5pQ59JVIHxVeVV9FUKol9Gd2Ak1eS9gdKDXuOHaY/df6IOyXgviE8BeHP2Yw=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lgdY4-004X1l-Gx
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 12 May 2021 01:20:33 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3EC3F6190A;
 Wed, 12 May 2021 01:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620782418;
 bh=jTMoSio52Iko/Abso6XknaXOctKOWvBik2eao51WJk8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZTp7v9U44O4Qe5EGVWTSW8l3uvHuC0Jtd8ePIgvcuc1ShcHsjFPuIIrUqUtHSFVzf
 01sGvgvvXWAaKrFUL3IZe4nY5PD1DwdpZ+kFgj9VdDWPa0aPJiFevJs2Tu9//LMDot
 obUszoevHnlBppyTos/GZGGkvY88q4vTWWHZRmhfnTnfcN2vWXGofbZqe/UX/oiUlM
 IpFuSsm/BHk/n6JsNxjEaAKi16oZ1rqqSkZc87Bmq3syhLB5QJIBicECa1k8QfYgCb
 RGjv+JrO6c8KIw8vNocsIEEeZl4SBMfQWq1SL1UkvnWRZynU6S8RzLYhMVF/TTe1SF
 ZIhY88eomemMQ==
Date: Wed, 12 May 2021 09:20:13 +0800
From: Gao Xiang <xiang@kernel.org>
To: changfengnan@vivo.com
Message-ID: <20210512012013.GA15995@hsiangkao-HP-ZHAN-66-Pro-G1>
References: <20210507094455.1695-1-changfengnan@vivo.com>
 <YJlUpHJLONlORWWl@google.com>
 <000b01d74656$518e96f0$f4abc4d0$@vivo.com>
 <YJr8PuZlOBqb+Qv1@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YJr8PuZlOBqb+Qv1@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lgdY4-004X1l-Gx
Subject: Re: [f2fs-dev] =?utf-8?b?562U5aSNOiBbUEFUQ0ggdjRdIGYyZnM6IGNvbXBy?=
 =?utf-8?q?ess=3A_avoid_unnecessary_check_in_f2fs=5Fprepare=5Fcompress=5Fo?=
 =?utf-8?q?verwrite?=
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVHVlLCBNYXkgMTEsIDIwMjEgYXQgMDI6NTA6NTRQTSAtMDcwMCwgSmFlZ2V1ayBLaW0gd3Jv
dGU6Cj4gT24gMDUvMTEsIGNoYW5nZmVuZ25hbkB2aXZvLmNvbSB3cm90ZToKPiA+IEhpIEphZWdl
dWs6Cj4gPiAKPiA+IElmIHRoZXJlJ3JlIGV4aXN0aW5nIGNsdXN0ZXJzIGJleW9uZCBpX3NpemUs
IG1heSBjYXVzZSBkYXRhIGNvcnJ1cHRpb24sIGJ1dAo+ID4gd2lsbCB0aGlzIGhhcHBlbiBpbiBu
b3JtYWw/IG1heWJlIHNvbWUgZXJyb3IgY2FuIGNhdXNlIHRoaXMsIGlmIGlfc2l6ZSBpcwo+ID4g
ZXJyb3IgdGhlIGRhdGEgYmV5b25kIHNpemUgc3RpbGwgY2FuJ3QgaGFuZGxlIHByb3Blcmx5LiAg
SXMgdGhlcmUgbm9ybWFsCj4gPiBjYXNlIGNhbiBjYXN1ZSBleGlzdGluZyBjbHVzdGVycyBiZXlv
bmQgaV9zaXplPwo+IAo+IFdlIGRvbid0IGhhdmUgYSBydWxlIHRvIHN5bmMgYmV0d2VlbiBpX3Np
emUgYW5kIGlfYmxvY2tzLgoKSG1tbS4uIEFnYWluLCBpdCdzIHN0aWxsIHVuY2xlYXIgd2hhdCdz
IHRoZSBvbi1kaXNrIGZvcm1hdCBsaWtlIHdoZW4KcG9zdC1FT0YuIEFsc28sIGNvcnJ1cHRlZC9j
cmFmdGVkL21hbGljaW91cyBvbi1kaXNrIGRhdGEgbmVlZHMgdG8gYmUKaGFuZGxlZCBhdCBsZWFz
dCB0byBtYWtlIHN1cmUgaXQgY2Fubm90IGNyYXNoIHRoZSBrZXJuZWwgYW5kIGNvcnJ1cHQKdGhl
IGZzIGl0c2VsZiBldmVuIGZ1cnRoZXIsIGVzcGVjaWFsbHkgc29tZSBvcHRpbWl6YXRpb24gcGF0
Y2ggbGlrZQp0aGlzIHRhcmdldGVkIG9uIHRoZSBzcGVjaWZpYyBsb2dpYyB0byBjaGFsbGVuZ2Ug
dGhlIHN0YWJsaWxpdHkuCgpTbyB3aXRob3V0IGRldGFpbHMsIGluIHRoZSBiZWdpbm5pbmcsIGl0
IHNtZWxsZWQgc29tZXdoYXQgZGFuZ2Vyb3VzCnRvIG1lIGFueXdheS4gQnV0IGNvbnNpZGVyaW5n
IHNvbWUgcGVyZm9ybWFuY2UgaW1wYWN0LCBJIGp1c3QgbGVhdmUKc29tZSBtZXNzYWdlIGhlcmUu
CgpUaGFua3MsCkdhbyBYaWFuZwoKPiAKPiA+IAo+ID4gVGhhbmtzLgo+ID4gCj4gPiAtLS0tLemC
ruS7tuWOn+S7ti0tLS0tCj4gPiDlj5Hku7bkuro6IEphZWdldWsgS2ltIDxqYWVnZXVrQGtlcm5l
bC5vcmc+IAo+ID4g5Y+R6YCB5pe26Ze0OiAyMDIx5bm0NeaciDEw5pelIDIzOjQ0Cj4gPiDmlLbk
u7bkuro6IEZlbmduYW4gQ2hhbmcgPGNoYW5nZmVuZ25hbkB2aXZvLmNvbT4KPiA+IOaKhOmAgTog
Y2hhb0BrZXJuZWwub3JnOyBsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+
ID4g5Li76aKYOiBSZTogW1BBVENIIHY0XSBmMmZzOiBjb21wcmVzczogYXZvaWQgdW5uZWNlc3Nh
cnkgY2hlY2sgaW4KPiA+IGYyZnNfcHJlcGFyZV9jb21wcmVzc19vdmVyd3JpdGUKPiA+IAo+ID4g
T24gMDUvMDcsIEZlbmduYW4gQ2hhbmcgd3JvdGU6Cj4gPiA+IHdoZW4gd3JpdGUgY29tcHJlc3Nl
ZCBmaWxlIHdpdGggT19UUlVOQywgdGhlcmUgd2lsbCBiZSBhIGxvdCBvZiAKPiA+ID4gdW5uZWNl
c3NhcnkgY2hlY2sgdmFsaWQgYmxvY2tzIGluIGYyZnNfcHJlcGFyZV9jb21wcmVzc19vdmVyd3Jp
dGUsIAo+ID4gPiBlc3BlY2lhbGx5IHdoZW4gd3JpdHRlbiBpbiBwYWdlIHNpemUsIHJlbW92ZSBp
dC4KPiA+ID4gCj4gPiA+IFRoaXMgcGF0Y2ggd2lsbCBub3QgYnJpbmcgc2lnbmlmaWNhbnQgcGVy
Zm9ybWFuY2UgaW1wcm92ZW1lbnRzLCBJIHRlc3QgCj4gPiA+IHRoaXMgb24gbW9iaWxlIHBob25l
LCB1c2UgYW5kcm9iZW5jaCwgdGhlIHNlcXVlbnRpYWwgd3JpdGUgdGVzdCBjYXNlIAo+ID4gPiB3
YXMgb3BlbiBmaWxlIHdpdGggT19UUlVOQywgc2V0IHdyaXRlIHNpemUgdG8gNEtCLCAgcGVyZm9y
bWFuY2UgCj4gPiA+IGltcHJvdmVkIGFib3V0IDIlLTMlLiBJZiB3cml0ZSBzaXplIHNldCB0byAz
Mk1CLCBwZXJmb3JtYW5jZSBpbXByb3ZlZAo+ID4gYWJvdXQgMC41JS4KPiA+ID4gCj4gPiA+IFNp
Z25lZC1vZmYtYnk6IEZlbmduYW4gQ2hhbmcgPGNoYW5nZmVuZ25hbkB2aXZvLmNvbT4KPiA+ID4g
LS0tCj4gPiA+ICBmcy9mMmZzL2RhdGEuYyB8IDggKysrKysrKysKPiA+ID4gIDEgZmlsZSBjaGFu
Z2VkLCA4IGluc2VydGlvbnMoKykKPiA+ID4gCj4gPiA+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2Rh
dGEuYyBiL2ZzL2YyZnMvZGF0YS5jIGluZGV4IAo+ID4gPiBjZjkzNTQ3NGZmYmEuLmI5ZWM3YjE4
MmY0NSAxMDA2NDQKPiA+ID4gLS0tIGEvZnMvZjJmcy9kYXRhLmMKPiA+ID4gKysrIGIvZnMvZjJm
cy9kYXRhLmMKPiA+ID4gQEAgLTMzMDMsOSArMzMwMywxNyBAQCBzdGF0aWMgaW50IGYyZnNfd3Jp
dGVfYmVnaW4oc3RydWN0IGZpbGUgKmZpbGUsIAo+ID4gPiBzdHJ1Y3QgYWRkcmVzc19zcGFjZSAq
bWFwcGluZywgICNpZmRlZiBDT05GSUdfRjJGU19GU19DT01QUkVTU0lPTgo+ID4gPiAgCWlmIChm
MmZzX2NvbXByZXNzZWRfZmlsZShpbm9kZSkpIHsKPiA+ID4gIAkJaW50IHJldDsKPiA+ID4gKwkJ
cGdvZmZfdCBlbmQgPSAoaV9zaXplX3JlYWQoaW5vZGUpICsgUEFHRV9TSVpFIC0gMSkgPj4KPiA+
IFBBR0VfU0hJRlQ7Cj4gPiA+IAo+ID4gPiAgCQkqZnNkYXRhID0gTlVMTDsKPiA+ID4gCj4gPiA+
ICsJCS8qCj4gPiA+ICsJCSAqIHdoZW4gd3JpdGUgcG9zIGlzIGJpZ2dlciB0aGFuIGlub2RlIHNp
emUKPiA+ICxmMmZzX3ByZXBhcmVfY29tcHJlc3Nfb3ZlcndyaXRlCj4gPiA+ICsJCSAqIGFsd2F5
cyByZXR1cm4gMCwgc28gY2hlY2sgcG9zIGZpcnN0IHRvIGF2b2lkIHRoaXMuCj4gPiA+ICsJCSAq
Lwo+ID4gPiArCQlpZiAoaW5kZXggPj0gZW5kKQo+ID4gPiArCQkJZ290byByZXBlYXQ7Cj4gPiAK
PiA+IFdoYXQgaWYgdGhlcmUncmUgZXhpc3RpbmcgY2x1c3RlcnMgYmV5b25kIGlfc2l6ZT8gR2l2
ZW4gcGVyZm9ybWFuY2UgaW1wYWN0cywKPiA+IGRvIHdlIHJlYWxseSBuZWVkIHRoaXM/Cj4gPiAK
PiA+ID4gKwo+ID4gPiAgCQlyZXQgPSBmMmZzX3ByZXBhcmVfY29tcHJlc3Nfb3ZlcndyaXRlKGlu
b2RlLCBwYWdlcCwKPiA+ID4gIAkJCQkJCQlpbmRleCwgZnNkYXRhKTsKPiA+ID4gIAkJaWYgKHJl
dCA8IDApIHsKPiA+ID4gLS0KPiA+ID4gMi4yOS4wCj4gPiAKPiAKPiAKPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4LWYyZnMtZGV2ZWwgbWFp
bGluZyBsaXN0Cj4gTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPiBodHRw
czovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVs
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
ZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgt
ZjJmcy1kZXZlbAo=
