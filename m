Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 30089163B8B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Feb 2020 04:45:36 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j4GIo-00058P-QC; Wed, 19 Feb 2020 03:45:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <david@fromorbit.com>) id 1j4GIo-00058I-8X
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Feb 2020 03:45:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OxaxHBgAXOEpus8vuIl5KAnkpejnYR2qiKl8nxPPdpM=; b=P5eM/CWjbsD8L/jb0cWpualBRp
 CRpFRyAEQ7kgT111Nxv54ldHljnJ2hwbGR7sZ1yejGIBF0p2XASktkKnFg1pCdGmgioXlrDzaNs/K
 l8194//hdALTIzUhuXX52SG8Dg9D4vk0Q7QHpWLAzAIiRSWyBGxnx1vPkYj/NHMMaivE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OxaxHBgAXOEpus8vuIl5KAnkpejnYR2qiKl8nxPPdpM=; b=UxqPNl3B7CE6t+cllG/VXAYNzn
 krT9uAYiSoMkiINeW6CeV7mUZbSapLNJa1lHPvt/kwhPIo7r3ec8R5t+vzNQlKTda5aDOqqjsy7dw
 t6EYyXd3n5FkOUT8TDqa1E8AgMezz/A8QpTkgN+PxGD9jIW4jv2AjOozHy+2dJe5uw/0=;
Received: from mail104.syd.optusnet.com.au ([211.29.132.246])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtp (Exim 4.92.2)
 id 1j4GIn-007X1r-1n
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Feb 2020 03:45:34 +0000
Received: from dread.disaster.area (pa49-179-138-28.pa.nsw.optusnet.com.au
 [49.179.138.28])
 by mail104.syd.optusnet.com.au (Postfix) with ESMTPS id 086907EB642;
 Wed, 19 Feb 2020 14:45:27 +1100 (AEDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1j4GIf-0005ZF-UR; Wed, 19 Feb 2020 14:45:25 +1100
Date: Wed, 19 Feb 2020 14:45:25 +1100
From: Dave Chinner <david@fromorbit.com>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200219034525.GH10776@dread.disaster.area>
References: <20200217184613.19668-1-willy@infradead.org>
 <20200218045633.GH10776@dread.disaster.area>
 <20200218134230.GN7778@bombadil.infradead.org>
 <20200218212652.GR10776@dread.disaster.area>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200218212652.GR10776@dread.disaster.area>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=X6os11be c=1 sm=1 tr=0
 a=zAxSp4fFY/GQY8/esVNjqw==:117 a=zAxSp4fFY/GQY8/esVNjqw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=l697ptgUJYAA:10
 a=7-415B0cAAAA:8 a=TZYe3LLFzD7hkv9TfyEA:9 a=QEXdDO2ut3YA:10
 a=biEYGPWJfzWAr4FL6Ov7:22
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: fromorbit.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j4GIn-007X1r-1n
Subject: Re: [f2fs-dev] [PATCH v6 00/19] Change readahead API
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
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 linux-mm@kvack.org, ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gV2VkLCBGZWIgMTksIDIwMjAgYXQgMDg6MjY6NTJBTSArMTEwMCwgRGF2ZSBDaGlubmVyIHdy
b3RlOgo+IE9uIFR1ZSwgRmViIDE4LCAyMDIwIGF0IDA1OjQyOjMwQU0gLTA4MDAsIE1hdHRoZXcg
V2lsY294IHdyb3RlOgo+ID4gT24gVHVlLCBGZWIgMTgsIDIwMjAgYXQgMDM6NTY6MzNQTSArMTEw
MCwgRGF2ZSBDaGlubmVyIHdyb3RlOgo+ID4gPiBMYXRlc3QgdmVyc2lvbiBpbiB5b3VyIGdpdCB0
cmVlOgo+ID4gPiAKPiA+ID4gJCDilrYgZ2xvIC1uIDUgd2lsbHkvcmVhZGFoZWFkCj4gPiA+IDRi
ZTQ5NzA5NmMwNCBtbTogVXNlIG1lbWFsbG9jX25vZnNfc2F2ZSBpbiByZWFkYWhlYWQgcGF0aAo+
ID4gPiBmZjYzNDk3ZmNiOTggaW9tYXA6IENvbnZlcnQgZnJvbSByZWFkcGFnZXMgdG8gcmVhZGFo
ZWFkCj4gPiA+IDI2YWVlNjBlODliNSBpb21hcDogUmVzdHJ1Y3R1cmUgaW9tYXBfcmVhZHBhZ2Vz
X2FjdG9yCj4gPiA+IDgxMTViY2NhNzMxMiBmdXNlOiBDb252ZXJ0IGZyb20gcmVhZHBhZ2VzIHRv
IHJlYWRhaGVhZAo+ID4gPiAzZGIzZDEwZDllYTEgZjJmczogQ29udmVydCBmcm9tIHJlYWRwYWdl
cyB0byByZWFkYWhlYWQKPiA+ID4gJAo+ID4gPiAKPiA+ID4gbWVyZ2VkIGludG8gYSA1LjYtcmMy
IHRyZWUgZmFpbHMgYXQgYm9vdCBvbiBteSB0ZXN0IHZtOgo+ID4gPiAKPiA+ID4gWyAgICAyLjQy
MzExNl0gLS0tLS0tLS0tLS0tWyBjdXQgaGVyZSBdLS0tLS0tLS0tLS0tCj4gPiA+IFsgICAgMi40
MjQ5NTddIGxpc3RfYWRkIGRvdWJsZSBhZGQ6IG5ldz1mZmZmZWEwMDBlZmZmNGM4LCBwcmV2PWZm
ZmY4ODgzYmZmZmVlNjAsIG5leHQ9ZmZmZmVhMDAwZWZmZjRjOC4KPiA+ID4gWyAgICAyLjQyODI1
OV0gV0FSTklORzogQ1BVOiA0IFBJRDogMSBhdCBsaWIvbGlzdF9kZWJ1Zy5jOjI5IF9fbGlzdF9h
ZGRfdmFsaWQrMHg2Ny8weDcwCj4gPiA+IFsgICAgMi40NTc0ODRdIENhbGwgVHJhY2U6Cj4gPiA+
IFsgICAgMi40NTgxNzFdICBfX3BhZ2V2ZWNfbHJ1X2FkZF9mbisweDE1Zi8weDJjMAo+ID4gPiBb
ICAgIDIuNDU5Mzc2XSAgcGFnZXZlY19scnVfbW92ZV9mbisweDg3LzB4ZDAKPiA+ID4gWyAgICAy
LjQ2MDUwMF0gID8gcGFnZXZlY19tb3ZlX3RhaWxfZm4rMHgyZDAvMHgyZDAKPiA+ID4gWyAgICAy
LjQ2MTcxMl0gIGxydV9hZGRfZHJhaW5fY3B1KzB4OGQvMHgxNjAKPiA+ID4gWyAgICAyLjQ2Mjc4
N10gIGxydV9hZGRfZHJhaW4rMHgxOC8weDIwCj4gPiAKPiA+IEFyZSB5b3Ugc3VyZSB0aGF0IHdh
cyA0YmU0OTcwOTZjMDQgPyAgSSBhc2sgYmVjYXVzZSB0aGVyZSB3YXMgYQo+IAo+IFllcywgYmVj
YXVzZSBpdCdzIHRoZSBvbmx5IHZlcnNpb24gSSd2ZSBhY3R1YWxseSBtZXJnZWQgaW50byBteQo+
IHdvcmtpbmcgdHJlZSwgY29tcGlsZWQgYW5kIHRyaWVkIHRvIHJ1bi4gOlAKPiAKPiA+IHZlcnNp
b24gcHVzaGVkIHRvIHRoYXQgZ2l0IHRyZWUgdGhhdCBkaWQgY29udGFpbiBhIGxpc3QgZG91Ymxl
LWFkZAo+ID4gKGR1ZSB0byBhIG1pc21lcmdlIHdoZW4gc2h1ZmZsaW5nIHBhdGNoZXMpLiAgSSBu
b3RpY2VkIGl0IGFuZCBmaXhlZAo+ID4gaXQsIGFuZCA0YmU0OTcwOTZjMDQgZG9lc24ndCBoYXZl
IHRoYXQgcHJvYmxlbS4gIEkgYWxzbyB0ZXN0IHdpdGgKPiA+IENPTkZJR19ERUJVR19MSVNUIHR1
cm5lZCBvbiwgYnV0IHRoaXMgcHJvYmxlbSB5b3UgaGl0IGlzIGdvaW5nIHRvIGJlCj4gPiBwcm9i
YWJpbGlzdGljIGJlY2F1c2UgaXQnbGwgZGVwZW5kIG9uIHRoZSB0aW1pbmcgYmV0d2VlbiB3aGF0
ZXZlciBvdGhlcgo+ID4gbGlzdCBpcyBiZWluZyB1c2VkIGFuZCB0aGUgcGFnZSBhY3R1YWxseSBi
ZWluZyBhZGRlZCB0byB0aGUgTFJVLgo+IAo+IEknbGwgc2VlIGlmIEkgY2FuIHJlcHJvZHVjZSBp
dC4KCkp1c3QgdXBkYXRlZCB0byBhIGN1cnJlbnQgVE9UIExpbnVzIGtlcm5lbCBhbmQgeW91ciBs
YXRlc3QgYnJhbmNoLAphbmQgc28gZmFyIHRoaXMgaXMgMTAwJSByZXByb2R1Y2FibGUuCgpOb3Qg
c3VyZSBob3cgSSdtIGdvaW5nIHRvIGRlYnVnIGl0IHlldCwgYmVjYXVzZSBpdCdzIGluaXQgdGhh
dCBpcwp0cmlnZ2VyaW5nIGl0Li4uLgoKQ2hlZXJzLAoKRGF2ZS4KLS0gCkRhdmUgQ2hpbm5lcgpk
YXZpZEBmcm9tb3JiaXQuY29tCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZl
bEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlz
dHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
