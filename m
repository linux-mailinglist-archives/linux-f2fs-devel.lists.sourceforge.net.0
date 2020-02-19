Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D27163BB5
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Feb 2020 04:57:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j4GUN-0003UD-Sg; Wed, 19 Feb 2020 03:57:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <david@fromorbit.com>) id 1j4GUM-0003Ty-2r
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Feb 2020 03:57:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6UGsKUfklF+XxwPnTtZqjA1giwm2crvQxVLfc+LHshE=; b=j17fUn1DBlbfMoYdbTGWn18CdF
 HAi5Whx4h7FaNtNnCObs6Y+CBM3Irmv/+/RxW9DeJqZR0hATrw7iYhljlqstTgXVJUcY50nUTHwUu
 t3zV4H/bb1ZXkjDgXoIla8ecZgtWDWEg61Rrcn/9PW5ozG7vipcyRl1xV0OFQIiTrOJc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6UGsKUfklF+XxwPnTtZqjA1giwm2crvQxVLfc+LHshE=; b=JFXxTsuPYlyJkr3ZwMoVtlthBV
 lJTIfE3eCfX91o2BUbClUUIIvYNLTXzSWbMeOJhdTY8iUok8Md8xbnO4p18DHiIPpg+xJSl1//4Qf
 T8krwI79SWyd5C40F7xQjqvrc8kLN2YGqdGdNew6eeLJw1R29zJzP54pMPZUf0t+EcPI=;
Received: from mail104.syd.optusnet.com.au ([211.29.132.246])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtp (Exim 4.92.2)
 id 1j4GUK-007XGA-FV
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Feb 2020 03:57:30 +0000
Received: from dread.disaster.area (pa49-179-138-28.pa.nsw.optusnet.com.au
 [49.179.138.28])
 by mail104.syd.optusnet.com.au (Postfix) with ESMTPS id A8BC07EB672;
 Wed, 19 Feb 2020 14:57:21 +1100 (AEDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1j4GUC-0005gh-AV; Wed, 19 Feb 2020 14:57:20 +1100
Date: Wed, 19 Feb 2020 14:57:20 +1100
From: Dave Chinner <david@fromorbit.com>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200219035720.GI10776@dread.disaster.area>
References: <20200217184613.19668-1-willy@infradead.org>
 <20200218045633.GH10776@dread.disaster.area>
 <20200218134230.GN7778@bombadil.infradead.org>
 <20200218212652.GR10776@dread.disaster.area>
 <20200219034525.GH10776@dread.disaster.area>
 <20200219034832.GL24185@bombadil.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200219034832.GL24185@bombadil.infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=W5xGqiek c=1 sm=1 tr=0
 a=zAxSp4fFY/GQY8/esVNjqw==:117 a=zAxSp4fFY/GQY8/esVNjqw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=l697ptgUJYAA:10
 a=7-415B0cAAAA:8 a=4gE3ddVfANxGN4fhDGwA:9 a=QEXdDO2ut3YA:10
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
X-Headers-End: 1j4GUK-007XGA-FV
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

T24gVHVlLCBGZWIgMTgsIDIwMjAgYXQgMDc6NDg6MzJQTSAtMDgwMCwgTWF0dGhldyBXaWxjb3gg
d3JvdGU6Cj4gT24gV2VkLCBGZWIgMTksIDIwMjAgYXQgMDI6NDU6MjVQTSArMTEwMCwgRGF2ZSBD
aGlubmVyIHdyb3RlOgo+ID4gT24gV2VkLCBGZWIgMTksIDIwMjAgYXQgMDg6MjY6NTJBTSArMTEw
MCwgRGF2ZSBDaGlubmVyIHdyb3RlOgo+ID4gPiBPbiBUdWUsIEZlYiAxOCwgMjAyMCBhdCAwNTo0
MjozMEFNIC0wODAwLCBNYXR0aGV3IFdpbGNveCB3cm90ZToKPiA+ID4gPiBPbiBUdWUsIEZlYiAx
OCwgMjAyMCBhdCAwMzo1NjozM1BNICsxMTAwLCBEYXZlIENoaW5uZXIgd3JvdGU6Cj4gPiA+ID4g
PiBMYXRlc3QgdmVyc2lvbiBpbiB5b3VyIGdpdCB0cmVlOgo+ID4gPiA+ID4gCj4gPiA+ID4gPiAk
IOKWtiBnbG8gLW4gNSB3aWxseS9yZWFkYWhlYWQKPiA+ID4gPiA+IDRiZTQ5NzA5NmMwNCBtbTog
VXNlIG1lbWFsbG9jX25vZnNfc2F2ZSBpbiByZWFkYWhlYWQgcGF0aAo+ID4gPiA+ID4gZmY2MzQ5
N2ZjYjk4IGlvbWFwOiBDb252ZXJ0IGZyb20gcmVhZHBhZ2VzIHRvIHJlYWRhaGVhZAo+ID4gPiA+
ID4gMjZhZWU2MGU4OWI1IGlvbWFwOiBSZXN0cnVjdHVyZSBpb21hcF9yZWFkcGFnZXNfYWN0b3IK
PiA+ID4gPiA+IDgxMTViY2NhNzMxMiBmdXNlOiBDb252ZXJ0IGZyb20gcmVhZHBhZ2VzIHRvIHJl
YWRhaGVhZAo+ID4gPiA+ID4gM2RiM2QxMGQ5ZWExIGYyZnM6IENvbnZlcnQgZnJvbSByZWFkcGFn
ZXMgdG8gcmVhZGFoZWFkCj4gPiA+ID4gPiAkCj4gPiA+ID4gPiAKPiA+ID4gPiA+IG1lcmdlZCBp
bnRvIGEgNS42LXJjMiB0cmVlIGZhaWxzIGF0IGJvb3Qgb24gbXkgdGVzdCB2bToKPiA+ID4gPiA+
IAo+ID4gPiA+ID4gWyAgICAyLjQyMzExNl0gLS0tLS0tLS0tLS0tWyBjdXQgaGVyZSBdLS0tLS0t
LS0tLS0tCj4gPiA+ID4gPiBbICAgIDIuNDI0OTU3XSBsaXN0X2FkZCBkb3VibGUgYWRkOiBuZXc9
ZmZmZmVhMDAwZWZmZjRjOCwgcHJldj1mZmZmODg4M2JmZmZlZTYwLCBuZXh0PWZmZmZlYTAwMGVm
ZmY0YzguCj4gPiA+ID4gPiBbICAgIDIuNDI4MjU5XSBXQVJOSU5HOiBDUFU6IDQgUElEOiAxIGF0
IGxpYi9saXN0X2RlYnVnLmM6MjkgX19saXN0X2FkZF92YWxpZCsweDY3LzB4NzAKPiA+ID4gPiA+
IFsgICAgMi40NTc0ODRdIENhbGwgVHJhY2U6Cj4gPiA+ID4gPiBbICAgIDIuNDU4MTcxXSAgX19w
YWdldmVjX2xydV9hZGRfZm4rMHgxNWYvMHgyYzAKPiA+ID4gPiA+IFsgICAgMi40NTkzNzZdICBw
YWdldmVjX2xydV9tb3ZlX2ZuKzB4ODcvMHhkMAo+ID4gPiA+ID4gWyAgICAyLjQ2MDUwMF0gID8g
cGFnZXZlY19tb3ZlX3RhaWxfZm4rMHgyZDAvMHgyZDAKPiA+ID4gPiA+IFsgICAgMi40NjE3MTJd
ICBscnVfYWRkX2RyYWluX2NwdSsweDhkLzB4MTYwCj4gPiA+ID4gPiBbICAgIDIuNDYyNzg3XSAg
bHJ1X2FkZF9kcmFpbisweDE4LzB4MjAKPiA+ID4gPiAKPiA+ID4gPiBBcmUgeW91IHN1cmUgdGhh
dCB3YXMgNGJlNDk3MDk2YzA0ID8gIEkgYXNrIGJlY2F1c2UgdGhlcmUgd2FzIGEKPiA+ID4gCj4g
PiA+IFllcywgYmVjYXVzZSBpdCdzIHRoZSBvbmx5IHZlcnNpb24gSSd2ZSBhY3R1YWxseSBtZXJn
ZWQgaW50byBteQo+ID4gPiB3b3JraW5nIHRyZWUsIGNvbXBpbGVkIGFuZCB0cmllZCB0byBydW4u
IDpQCj4gPiA+IAo+ID4gPiA+IHZlcnNpb24gcHVzaGVkIHRvIHRoYXQgZ2l0IHRyZWUgdGhhdCBk
aWQgY29udGFpbiBhIGxpc3QgZG91YmxlLWFkZAo+ID4gPiA+IChkdWUgdG8gYSBtaXNtZXJnZSB3
aGVuIHNodWZmbGluZyBwYXRjaGVzKS4gIEkgbm90aWNlZCBpdCBhbmQgZml4ZWQKPiA+ID4gPiBp
dCwgYW5kIDRiZTQ5NzA5NmMwNCBkb2Vzbid0IGhhdmUgdGhhdCBwcm9ibGVtLiAgSSBhbHNvIHRl
c3Qgd2l0aAo+ID4gPiA+IENPTkZJR19ERUJVR19MSVNUIHR1cm5lZCBvbiwgYnV0IHRoaXMgcHJv
YmxlbSB5b3UgaGl0IGlzIGdvaW5nIHRvIGJlCj4gPiA+ID4gcHJvYmFiaWxpc3RpYyBiZWNhdXNl
IGl0J2xsIGRlcGVuZCBvbiB0aGUgdGltaW5nIGJldHdlZW4gd2hhdGV2ZXIgb3RoZXIKPiA+ID4g
PiBsaXN0IGlzIGJlaW5nIHVzZWQgYW5kIHRoZSBwYWdlIGFjdHVhbGx5IGJlaW5nIGFkZGVkIHRv
IHRoZSBMUlUuCj4gPiA+IAo+ID4gPiBJJ2xsIHNlZSBpZiBJIGNhbiByZXByb2R1Y2UgaXQuCj4g
PiAKPiA+IEp1c3QgdXBkYXRlZCB0byBhIGN1cnJlbnQgVE9UIExpbnVzIGtlcm5lbCBhbmQgeW91
ciBsYXRlc3QgYnJhbmNoLAo+ID4gYW5kIHNvIGZhciB0aGlzIGlzIDEwMCUgcmVwcm9kdWNhYmxl
Lgo+ID4gCj4gPiBOb3Qgc3VyZSBob3cgSSdtIGdvaW5nIHRvIGRlYnVnIGl0IHlldCwgYmVjYXVz
ZSBpdCdzIGluaXQgdGhhdCBpcwo+ID4gdHJpZ2dlcmluZyBpdC4uLi4KPiAKPiBFcmljIGZvdW5k
IGl0IC4uLgoKWWVhaCwganVzdCBzYXcgdGhhdCBhbmQgYW0gYXBwbHlpbmcgaGlzIHBhdGNoIHRv
IHRlc3QgaXQuLi4KCj4gc3RpbGwgbm90IHN1cmUgd2h5IEkgZG9uJ3Qgc2VlIGl0LgoKTm8gcmVh
ZGFoZWFkIGNvbmZpZ3VyZWQgb24geW91ciBkZXZpY2U/CgoKQ2hlZXJzLAoKRGF2ZS4KLS0gCkRh
dmUgQ2hpbm5lcgpkYXZpZEBmcm9tb3JiaXQuY29tCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGlu
dXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vm
b3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
