Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F72C44AEEF
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  9 Nov 2021 14:41:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mkRNS-0002wQ-CA; Tue, 09 Nov 2021 13:41:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1mkRNQ-0002wK-NQ
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 09 Nov 2021 13:41:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T4FInycvr58Me5QQNOxmm1NyzIrj9Kr1sPhkE3d1gUM=; b=RGdzc7OnIWCaBLRD7u2f6ATQCn
 sVJFKklOaA9WBeevXASzxssaguBGDbKgV25wuMCBT2mHbAVxH1t1AaWvQ3PAb8dR4aDkbXyLQic2A
 KhYUXKMzfUuJvcZqRUgzN8H3TDe+ovTPc+9b7aicGt6/GmcA6x0ckkmPcYZ1HU7SfW70=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=T4FInycvr58Me5QQNOxmm1NyzIrj9Kr1sPhkE3d1gUM=; b=b+4uopzPxyvYZZJZuux4xeGDYR
 jwpdlfaCZQbZsgvRdi8Pc700h61MkvvGOSai3CoRM7Uf8/W/FYuQkAgzJyEgmNzfNsIIxzoQ7knaI
 LiRP21Uq1ubCZ4aX5GCYR5k5UG8dyWXUs77xArHz57wXsSxakogLf26w7XwG21wxBWt0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mkRNQ-007KKU-KR
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 09 Nov 2021 13:41:29 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9CD2161184;
 Tue,  9 Nov 2021 13:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636465278;
 bh=yUrjMWLZXM5Z7L6aO+DVRdwZQ4GhOdMIDMIXEdQnVTo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=fNrSykkyP7wGRJLBygwFfB0ddmLC5GNBl/F2Pf0GJJiBlTJe2uX7GHf+aCM5JBJZ8
 tOUr/vaMrJmTfIXurUw8T06H4urjQEHDD0t1j/dyDi3rqCZ4Dy0rsFMTH7ZhOTe/0N
 Zkbd5NTQaIAkJqyCFDckbg7VwGYy55N78fWCiZPPErGTuSFLltBAixZy2b/xN07Ds0
 I5lFkeFh+1tduXAT2pLKHqedmcCDHD1Gh1mutAe0VWorCcv6pAFmZrnZ2OLjmruGyJ
 AVavmWAC6N2BZfsJCBdMxOR8XLYRq/tIFJOI6ZXg/b/tbkI6EM19i1q/LuaTW8CihG
 iSZdR6r5kjSBg==
Message-ID: <075bd332-6ab9-ebbe-9c71-c90bf394ee7c@kernel.org>
Date: Tue, 9 Nov 2021 21:41:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: =?UTF-8?B?5bi45Yek5qWg?= <changfengnan@vivo.com>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>
References: <20211108035459.40139-1-changfengnan@vivo.com>
 <AOQAuQAvE4gDy5nrp7t7Q4pj.9.1636381271838.Hmail.changfengnan@vivo.com>
 <KL1PR0601MB4003E2DBE5941C1BBAC84F8FBB929@KL1PR0601MB4003.apcprd06.prod.outlook.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <KL1PR0601MB4003E2DBE5941C1BBAC84F8FBB929@KL1PR0601MB4003.apcprd06.prod.outlook.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2021/11/9 9:59, 常凤楠 wrote: > > >> 
 
 Content analysis details:   (-7.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [198.145.29.99 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mkRNQ-007KKU-KR
Subject: Re: [f2fs-dev] Do we need serial io for compress file?
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
Cc: "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMS8xMS85IDk6NTksIOW4uOWHpOaloCB3cm90ZToKPiAKPiAKPj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogY2hhbmdmZW5nbmFuQHZpdm8uY29tIDxjaGFuZ2Zlbmdu
YW5Adml2by5jb20+IE9uIEJlaGFsZiBPZgo+PiBDaGFvIFl1Cj4+IFNlbnQ6IE1vbmRheSwgTm92
ZW1iZXIgOCwgMjAyMSAxMDoyMSBQTQo+PiBUbzog5bi45Yek5qWgIDxjaGFuZ2ZlbmduYW5Adml2
by5jb20+OyBqYWVnZXVrQGtlcm5lbC5vcmcKPj4gQ2M6IGxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMu
c291cmNlZm9yZ2UubmV0Cj4+IFN1YmplY3Q6IFJlOiBEbyB3ZSBuZWVkIHNlcmlhbCBpbyBmb3Ig
Y29tcHJlc3MgZmlsZT8KPj4KPj4gT24gMjAyMS8xMS84IDExOjU0LCBGZW5nbmFuIENoYW5nIHdy
b3RlOgo+Pj4gSW4gbXkgdGVzdCwgc2VyaWFsIGlvIGZvciBjb21wcmVzcyBmaWxlIHdpbGwgbWFr
ZSBtdWx0aXRocmVhZCBzbWFsbAo+Pj4gd3JpdGUgcGVyZm9ybWFuY2UgZHJvcCBhIGxvdC4KPj4+
Cj4+PiBJJ20gdHJ5IHRvIGZpbmd1cmUgb3V0IHdoeSB3ZSBuZWVkIF9fc2hvdWxkX3NlcmlhbGl6
ZV9pbywgSU1PLCB3ZSB1c2UKPj4+IF9fc2hvdWxkX3NlcmlhbGl6ZV9pbyB0byBhdm9pZCBkZWFk
bG9jayBvciB0cnkgdG8gaW1wcm92ZSBzZXF1ZW50aWFsCj4+PiBwZXJmb3JtYW5jZSwgYnV0IEkg
ZG9uJ3QgdW5kZXJzdGFuZCB3aHkgd2Ugc2hvdWxkIGRvIHRoaXMgZm9yCj4+Cj4+IEl0IHdhcyBp
bnRyb2R1Y2VkIHRvIGF2b2lkIGZyYWdtZW50YXRpb24gb2YgZmlsZSBibG9ja3MuCj4gCj4gU28s
IGZvciBzbWFsbCB3cml0ZSBvbiBjb21wcmVzcyBmaWxlLCBpcyB0aGlzIHN0aWxsIG5lY2Vzc2Fy
eT8gSSB0aGluayB3ZSBzaG91bGQgdHJlYXQgY29tcHJlc3MgZmlsZSBhcyByZWd1bGFyIGZpbGUu
CgpBbnkgcmVhbCBzY2VuYXJpbyB0aGVyZT8gbGV0IG1lIGtub3cgaWYgSSBtaXNzZWQgYW55IGNh
c2VzLCBhcyBJIHNhdywgbW9zdCBjb21wcmVzc2libGUKZmlsZXMgYXJlIG5vdCBzbWFsbC4uLgoK
Pj4KPj4+IGNvbXByZXNzZWQgZmlsZS4gSW4gbXkgdGVzdCwgaWYgd2UganVzdCByZW1vdmUgdGhp
cywgd3JpdGUgc2FtZSBmaWxlCj4+PiBpbiBtdWx0aXRocmVhZCB3aWxsIGhhdmUgcHJvYmxlbSwg
YnV0IHBhcmFsbGVsIHdyaXRlIGRpZmZlcmVudCBmaWxlcwo+Pj4gaW4gbXVsdGl0aHJlYWQKPj4K
Pj4gV2hhdCBkbyB5b3UgbWVhbiBieSAid3JpdGUgc2FtZSBmaWxlIGluIG11bHRpdGhyZWFkIHdp
bGwgaGF2ZSBwcm9ibGVtIj8KPiAKPiBJZiBqdXN0IHJlbW92ZSBjb21wcmVzcyBmaWxlIGluIF9f
c2hvdWxkX3NlcmlhbGl6ZV9pbygpCj4gCj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZGF0YS5jIGIv
ZnMvZjJmcy9kYXRhLmMKPiBpbmRleCBmNGZkNmMyNDZjOWEuLjdiZDQyOWI0NjQyOSAxMDA2NDQK
PiAtLS0gYS9mcy9mMmZzL2RhdGEuYwo+ICsrKyBiL2ZzL2YyZnMvZGF0YS5jCj4gQEAgLTMxNjUs
OCArMzE2NSw4IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBfX3Nob3VsZF9zZXJpYWxpemVfaW8oc3Ry
dWN0IGlub2RlICppbm9kZSwKPiAgICAgICAgICBpZiAoSVNfTk9RVU9UQShpbm9kZSkpCj4gICAg
ICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4gICAKPiAtICAgICAgIGlmIChmMmZzX25lZWRf
Y29tcHJlc3NfZGF0YShpbm9kZSkpCj4gLSAgICAgICAgICAgICAgIHJldHVybiB0cnVlOwo+ICsg
ICAgICAgLy9pZiAoZjJmc19uZWVkX2NvbXByZXNzX2RhdGEoaW5vZGUpKQo+ICsgICAgICAgLy8g
ICAgICByZXR1cm4gdHJ1ZTsKPiAgICAgICAgICBpZiAod2JjLT5zeW5jX21vZGUgIT0gV0JfU1lO
Q19BTEwpCj4gICAgICAgICAgICAgICAgICByZXR1cm4gdHJ1ZTsKPiAgICAgICAgICBpZiAoZ2V0
X2RpcnR5X3BhZ2VzKGlub2RlKSA+PSBTTV9JKEYyRlNfSV9TQihpbm9kZSkpLT5taW5fc2VxX2Js
b2NrcykKPiAKPiBhbmQgdXNlIGZpbyB0byBzdGFydCBtdWx0aSB0aHJlYWQgdG8gd3JpdGUgc2Ft
ZSBmaWxlLCBmaW8gd2lsbCBodW5nLgoKQW55IHBvdGVudGlhbCBoYW5ndGFzayBpc3N1ZSB0aGVy
ZT8gZGlkIHlvdSBnZXQgYW55IHN0YWNrIGJhY2t0cmFjZSBsb2c/CgpJZiB0aGVyZSBpcywgaXQg
bmVlZHMgdG8gZmlndXJlIG91dCB0aGUgcm9vdCBjYXVzZS4KClRoYW5rcywKCj4gZmlvLmNvbmY6
Cj4gW2dsb2JhbF0KPiBkaXJlY3Q9MQo+IG51bWpvYnM9OAo+IHRpbWVfYmFzZWQKPiBydW50aW1l
PTMwCj4gaW9lbmdpbmU9c3luYwo+IGlvZGVwdGg9MTYKPiBidWZmZXJfcGF0dGVybj0iWlpaWiIK
PiBmc3luYz0xCj4gCj4gW2ZpbGUwXQo+IG5hbWU9ZmlvLXJhbmQtUlcKPiBmaWxlbmFtZT1maW8t
cmFuZC1SVwo+IHJ3PXJ3Cj4gcndtaXhyZWFkPTYwCj4gcndtaXh3cml0ZT00MAo+IGJzPTFNCj4g
c2l6ZT02NE0KPiAKPiBbZmlsZTFdCj4gbmFtZT1maW8tcmFuZC1SVwo+IGZpbGVuYW1lPWZpby1y
YW5kLVJXCj4gcnc9cmFuZHJ3Cj4gcndtaXhyZWFkPTYwCj4gcndtaXh3cml0ZT00MAo+IGJzPTRL
Cj4gc2l6ZT02NE0KPiAKPj4KPj4gVGhhbmtzLAo+Pgo+Pj4gaXMgb2suIFNvIEkgdGhpbmsgbWF5
YmUgd2Ugc2hvdWxkIHVzZSBhbm90aGVyIGxvY2sgdG8gYWxsb3cgd3JpdGUKPj4gZGlmZmVyZW50
IGZpbGVzIGluIG11bHRpdGhyZWFkLgo+Pj4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1m
MmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdl
Lm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
