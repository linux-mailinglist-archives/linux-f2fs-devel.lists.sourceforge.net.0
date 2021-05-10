Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C833378C46
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 May 2021 14:30:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lg53e-0007Pk-22; Mon, 10 May 2021 12:30:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <me@beroal.in.ua>) id 1lg53b-0007Pc-OA
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 10 May 2021 12:30:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=K59kC7xSDPHnFsVXqX5o7UNfiH2PhCyMWQUMV/d8zI4=; b=iEnfE2SRD4LchSAo87YHRWBgiX
 WSQusVmTH4MqEkjQIEZMzKnIRHwk9Mg6+IqQrB6R+WmOfc33F3srz/hmsU36q6ANPs7UBeJxjo8QF
 SUSCesg/Hj1x3pKpx22Uj4MtPcu6+W6G2jVxnXn3Zwudw/4b2/vtxvWV+y20/+ceibPE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=K59kC7xSDPHnFsVXqX5o7UNfiH2PhCyMWQUMV/d8zI4=; b=GF0p1oybHKcxRtFT4xNlrLP0o0
 GFoL1NIE8pQ6Hlzh8Wj/ecllW+iHiSC1iSdxVPUAusKK2MsqIT+0L3JlxUPXDVde7PETGAQg+JroR
 GUZJe2NzZfsD594YWr8MBW0hkXLInJbODGvMYKGWaL151Al0J9sG0Cl0VafDeZgDDd/g=;
Received: from smtp-1.1gb.com.ua ([195.234.4.10] helo=u1.1gb.ua)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtp (Exim 4.92.2)
 id 1lg53Y-001i91-Ks
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 10 May 2021 12:30:45 +0000
Received: from Spooler by u1.1gb.ua (Mercury/32 v4.52) ID MO003548;
 10 May 2021 15:30:40 +0300
Received: from spooler by mail-u1-robots.in-solve.hidden (Mercury/32 v4.52);
 10 May 2021 15:30:28 +0300
Received: from ul1.1gb.ua (195.234.4.24) by smtp-1.1gb.com.ua (Mercury/32
 v4.52) with ESMTP ID MG003541; 10 May 2021 15:30:16 +0300
Received: from [192.162.141.53] ([192.162.141.53]) (authenticated bits=0)
 by ul1.1gb.ua (8.14.9/8.14.9) with ESMTP id 14ACUDra028295
 (version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NO)
 for <linux-f2fs-devel@lists.sourceforge.net>; Mon, 10 May 2021 15:30:13 +0300
To: linux-f2fs-devel@lists.sourceforge.net
References: <cover.1620641727.git.mchehab+huawei@kernel.org>
 <2ae366fdff4bd5910a2270823e8da70521c859af.camel@infradead.org>
 <20210510135518.305cc03d@coco.lan>
From: beroal <me@beroal.in.ua>
Message-ID: <40e1a75b-45ae-3110-e3c2-45b73281d2ac@beroal.in.ua>
Date: Mon, 10 May 2021 15:29:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210510135518.305cc03d@coco.lan>
Content-Language: en-US
X-Spam-Score: 0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 0.4 KHOP_HELO_FCRDNS       Relay HELO differs from its IP's reverse DNS
X-Headers-End: 1lg53Y-001i91-Ks
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMTAuMDUuMjEgMTQ6NTUsIE1hdXJvIENhcnZhbGhvIENoZWhhYiB3cm90ZToKPiBUaGUgbWFp
biBwb2ludCBvbiB0aGlzIHNlcmllcyBpcyB0byByZXBsYWNlIGp1c3QgdGhlIG9jY3VycmVuY2Vz
Cj4gd2hlcmUgQVNDSUkgcmVwcmVzZW50cyB0aGUgc3ltYm9sIGVxdWFsbHkgd2VsbCwgZS4gZy4g
aXQgaXMgbGltaXRlZAo+IGZvciB0aG9zZSBjaGFyczoKPgo+IAktIFUrMjAxMCAoJ+KAkCcpOiBI
WVBIRU4KPiAJLSBVKzAwYWQgKCfCrScpOiBTT0ZUIEhZUEhFTgo+IAktIFUrMjAxMyAoJ+KAkycp
OiBFTiBEQVNICj4gCS0gVSsyMDE0ICgn4oCUJyk6IEVNIERBU0gKPgo+IAktIFUrMjAxOCAoJ+KA
mCcpOiBMRUZUIFNJTkdMRSBRVU9UQVRJT04gTUFSSwo+IAktIFUrMjAxOSAoJ+KAmScpOiBSSUdI
VCBTSU5HTEUgUVVPVEFUSU9OIE1BUksKPiAJLSBVKzAwYjQgKCfCtCcpOiBBQ1VURSBBQ0NFTlQK
Pgo+IAktIFUrMjAxYyAoJ+KAnCcpOiBMRUZUIERPVUJMRSBRVU9UQVRJT04gTUFSSwo+IAktIFUr
MjAxZCAoJ+KAnScpOiBSSUdIVCBET1VCTEUgUVVPVEFUSU9OIE1BUksKPgo+IAktIFUrMDBkNyAo
J8OXJyk6IE1VTFRJUExJQ0FUSU9OIFNJR04KPiAJLSBVKzIyMTIgKCfiiJInKTogTUlOVVMgU0lH
Tgo+Cj4gCS0gVSsyMjE3ICgn4oiXJyk6IEFTVEVSSVNLIE9QRVJBVE9SCj4gCSAgKHRoaXMgb25l
IHVzZWQgYXMgYSBwb2ludGVyIHJlZmVyZW5jZSBsaWtlICIqZm9vIiBvbiBDIGNvZGUKPiAJICAg
ZXhhbXBsZSBpbnNpZGUgYSBkb2N1bWVudCBjb252ZXJ0ZWQgZnJvbSBMYVRlWCkKPgo+IAktIFUr
MDBiYiAoJ8K7Jyk6IFJJR0hULVBPSU5USU5HIERPVUJMRSBBTkdMRSBRVU9UQVRJT04gTUFSSwo+
IAkgICh0aGlzIG9uZSBhbHNvIHVzZWQgd3JvbmdseSBvbiBhbiBBQkkgZmlsZSwgbWVhbmluZyAn
PicpCj4KPiAJLSBVKzAwYTAgKCfCoCcpOiBOTy1CUkVBSyBTUEFDRQo+IAktIFUrZmVmZiAoJ++7
vycpOiBaRVJPIFdJRFRIIE5PLUJSRUFLIFNQQUNFCj4KPiBVc2luZyB0aGUgYWJvdmUgc3ltYm9s
cyB3aWxsIGp1c3QgdHJpY2sgdG9vbHMgbGlrZSBncmVwIGZvciBubyBnb29kCj4gcmVhc29uLgpT
aW5jZSB3aGVuIGlzIEFTQ0lJIGFibGUgdG8gcmVwcmVzZW50IGRhc2hlcyBhbmQgYWxsIHRob3Nl
IHF1b3RhdGlvbiAKbWFya3M/IEFzIGZhciBhcyBJIHJlbWVtYmVyLCB0aGVzZSBjaGFyYWN0ZXJz
IHdlcmUgdGhlIG1haW4gcmVhc29uIHRvIApkaXRjaCBBU0NJSSBpbiBmYXZvciBvZiBuYXRpb25h
bCB0ZXh0IGVuY29kaW5ncy4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVs
QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0
cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
