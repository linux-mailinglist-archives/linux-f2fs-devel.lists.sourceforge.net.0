Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3C693EBBD
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Jul 2024 05:02:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sYGeL-00025P-PX;
	Mon, 29 Jul 2024 03:02:13 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <youling.tang@linux.dev>) id 1sYGeK-00025I-8Q
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jul 2024 03:02:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Z9wqau/zSknzCnsohqqshMiTMDATCIJu7G0AysZkCDg=; b=d4pSBMrBBG2ALF/6G3ncneIMce
 BDCwACxkZL+H37vhZ5vrk0prLsgD2S4KragISC5x0/yvdW1E9qnILAx9LBBWUUhsMBJqMBf51arwt
 EFPz6TX4RUTCOUG+zrF5zvyStppoudG+Yqw//CooXVBJ/0Ufk6T3T/n4iTTCp56U68DU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Z9wqau/zSknzCnsohqqshMiTMDATCIJu7G0AysZkCDg=; b=CciGZ81rkqjb0GGwYfE26bFJko
 wpc8blf7Itgr8tTjYO4AgadL2GmofzaAHAGvbctfCGDAgNgTGa7Ksnq8l41t8s1DiBDkcpbGZ7yI7
 KHy1Mhx4l8WQL5H5s+CVQZMF3rT7RSyUn5mR/U3KfRWKuHS4UvmF1WFZiBTFMSwDSJnQ=;
Received: from out-177.mta1.migadu.com ([95.215.58.177])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sYGeI-0005JJ-SH for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jul 2024 03:02:12 +0000
Message-ID: <ca823522-fe78-4eb7-ae1d-b017d16e39fe@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1722222119;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z9wqau/zSknzCnsohqqshMiTMDATCIJu7G0AysZkCDg=;
 b=xJ/0a1P0NwUNNMLY6DohbukOFlCjl5lRE89SJL1joXlE8aGAxS5D9t45QWPahYN2fzjZfv
 p8Q5R/c1tXLpuC7784AJnVdCdqfTi74D920vJy8uLEGQYmqMsB+FwSqUaG9paPfQKJO6Pl
 aJbeS7+79P91ANxNHHLtZgO+JAF2WtE=
Date: Mon, 29 Jul 2024 11:01:29 +0800
MIME-Version: 1.0
To: Theodore Ts'o <tytso@mit.edu>
References: <ZqJwa2-SsIf0aA_l@infradead.org>
 <68584887-3dec-4ce5-8892-86af50651c41@libero.it>
 <ZqKreStOD-eRkKZU@infradead.org>
 <91bfea9b-ad7e-4f35-a2c1-8cd41499b0c0@linux.dev>
 <ZqOs84hdYkSV_YWd@infradead.org> <20240726152237.GH17473@twin.jikos.cz>
 <20240726175800.GC131596@mit.edu> <ZqPmPufwqbGOTyGI@infradead.org>
 <20240727145232.GA377174@mit.edu>
 <23862652-a702-4a5d-b804-db9ee9f6f539@linux.dev>
 <20240729024412.GD377174@mit.edu>
Content-Language: en-US, en-AU
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Youling Tang <youling.tang@linux.dev>
In-Reply-To: <20240729024412.GD377174@mit.edu>
X-Migadu-Flow: FLOW_OUT
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 29/07/2024 10:44, Theodore Ts'o wrote: > On Mon, Jul 29,
    2024 at 09:46:17AM +0800, Youling Tang wrote: >> 1. Previous version implementation:
    array mode (see link 1) : >>    Advantages: >>    - [...] 
 
 Content analysis details:   (-5.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
                             blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [URIs: linux.dev]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [95.215.58.177 listed in bl.score.senderscore.com]
  0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                          [95.215.58.177 listed in sa-trusted.bondedsender.org]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [95.215.58.177 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
X-Headers-End: 1sYGeI-0005JJ-SH
Subject: Re: [f2fs-dev] [PATCH 1/4] module: Add module_subinit{_noexit} and
 module_subeixt helper macros
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
Cc: Linux-Arch <linux-arch@vger.kernel.org>,
 Youling Tang <tangyouling@kylinos.cn>, linux-f2fs-devel@lists.sourceforge.net,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 kreijack@inwind.it, David Sterba <dsterba@suse.cz>,
 Josef Bacik <josef@toxicpanda.com>, Christoph Hellwig <hch@infradead.org>,
 Chris Mason <clm@fb.com>, Luis Chamberlain <mcgrof@kernel.org>,
 Andreas Dilger <adilger.kernel@dilger.ca>, linux-btrfs@vger.kernel.org,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, linux-modules@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjkvMDcvMjAyNCAxMDo0NCwgVGhlb2RvcmUgVHMnbyB3cm90ZToKPiBPbiBNb24sIEp1bCAy
OSwgMjAyNCBhdCAwOTo0NjoxN0FNICswODAwLCBZb3VsaW5nIFRhbmcgd3JvdGU6Cj4+IDEuIFBy
ZXZpb3VzIHZlcnNpb24gaW1wbGVtZW50YXRpb246IGFycmF5IG1vZGUgKHNlZSBsaW5rIDEpIDoK
Pj4gIMKgwqAgQWR2YW50YWdlczoKPj4gIMKgwqAgLSBGZXcgY2hhbmdlcywgc2ltcGxlIHByaW5j
aXBsZSwgZWFzeSB0byB1bmRlcnN0YW5kIGNvZGUuCj4+ICDCoMKgIERpc2FkdmFudGFnZXM6Cj4+
ICDCoMKgIC0gRWFjaCBtb2RpZmllZCBtb2R1bGUgbmVlZHMgdG8gbWFpbnRhaW4gYW4gYXJyYXks
IG1vcmUgY29kZS4KPj4KPj4gMi4gQ3VycmVudCBpbXBsZW1lbnRhdGlvbjogZXhwbGljaXQgY2Fs
bCBzdWJpbml0IGluIGluaXRjYWxsIChzZWUgbGluayAyKSA6Cj4+ICDCoMKgIEFkdmFudGFnZXM6
Cj4+ICDCoMKgIC0gRGlyZWN0IHVzZSBvZiBoZWxwZXMgbWFjcm9zLCB0aGUgc3ViaW5pdCBjYWxs
IHNlcXVlbmNlIGlzCj4+ICDCoMKgwqDCoCBpbnR1aXRpdmUsIGFuZCB0aGUgaW1wbGVtZW50YXRp
b24gaXMgcmVsYXRpdmVseSBzaW1wbGUuCj4+ICDCoMKgIERpc2FkdmFudGFnZXM6Cj4+ICDCoMKg
IC0gaGVscGVyIG1hY3JvcyBuZWVkIHRvIGJlIGltcGxlbWVudGVkIGNvbXBhcmVkIHRvIGFycmF5
IG1vZGUuCj4+Cj4+IDMuIE9ubHkgb25lIG1vZHVsZV9zdWJpbml0IHBlciBmaWxlIChub3QgaW1w
bGVtZW50ZWQsIHNlZSBsaW5rIDMpIDoKPj4gIMKgwqAgQWR2YW50YWdlOgo+PiAgwqDCoCAtIE5v
IG5lZWQgdG8gZGlzcGxheSB0byBjYWxsIHN1YmluaXQuCj4+ICDCoMKgIERpc2FkdmFudGFnZXM6
Cj4+ICDCoMKgIC0gTWFnaWMgb3JkZXIgYmFzZWQgb24gTWFrZWZpbGUgbWFrZXMgY29kZSBtb3Jl
IGZyYWdpbGUsCj4+ICDCoMKgIC0gTWFrZSBzdXJlIHRoYXQgZWFjaCBmaWxlIGhhcyBvbmx5IG9u
ZSBtb2R1bGVfc3ViaW5pdCwKPj4gIMKgwqAgLSBJdCBpcyBub3QgaW50dWl0aXZlIHRvIGtub3cg
d2hpY2ggc3ViaW5pdHMgdGhlIG1vZHVsZSBuZWVkcwo+PiAgwqDCoMKgwqAgYW5kIGluIHdoYXQg
b3JkZXIgKGdyZXAgYW5kIE1ha2VmaWxlIGFyZSByZXF1aXJlZCksCj4+ICDCoMKgIC0gV2l0aCBt
dWx0aXBsZSBzdWJpbml0cyBwZXIgbW9kdWxlLCBpdCB3b3VsZCBiZSBkaWZmaWN1bHQgdG8KPj4g
IMKgwqDCoMKgIGRlZmluZSBtb2R1bGVfe3N1YmluaXQsIHN1YmV4aXR9IGJ5IE1PRFVMRSwgYW5k
IGRpZmZpY3VsdCB0bwo+PiAgwqDCoMKgwqAgcm9sbGJhY2sgd2hlbiBpbml0aWFsaXphdGlvbiBm
YWlscyAoSSBoYXZlbid0IGZvdW5kIGEgZ29vZCB3YXkKPj4gIMKgwqDCoMKgIHRvIGRvIHRoaXMg
eWV0KS4KPj4KPj4KPj4gUGVyc29uYWxseSwgSSBwcmVmZXIgdGhlIGltcGxlbWVudGF0aW9uIG9m
IG1ldGhvZCB0d28uCj4gQnV0IHRoZXJlJ3MgYWxzbyBtZXRob2QgemVybyAtLS0ga2VlcCB0aGlu
Z3MgdGhlIHdheSB0aGV5IGFyZSwgYW5kCj4gZG9uJ3QgdHJ5IHRvIGFkZCBhIG5ldyBhc3RyYWN0
aW9uLgo+Cj4gQWR2YW50YWdlOgo+Cj4gICAtLSBDb2RlIGhhcyB3b3JrZWQgZm9yIGRlY2FkZXMs
IHNvIGl0IGlzIHZlcnkgd2VsbCB0ZXN0ZWQKPiAgIC0tIFZlcnkgZWFzeSB0byB1bmRlcnN0YW5k
IGFuZCBtYWludGFpbgo+Cj4gRGlzYWR2YW50YWdlCj4KPiAgIC0tLSBBIGZldyBleHRyYSBsaW5l
cyBvZiBDIGNvZGUuClRoZSBudW1iZXIgb2YgbGluZXMgb2YgY29kZSBpcyBub3QgaW1wb3J0YW50
LCB0aGUgbWFpbiBwb2ludCBpcyB0bwpiZXR0ZXIgZW5zdXJlIHRoYXQgc3ViZXhpdCBydW5zIGlu
IHRoZSByZXZlcnNlIG9yZGVyIG9mIHN1YmluaXQgd2hlbgppbml0IGZhaWxzLgoKVGhhbmtzLApZ
b3VsaW5nLgoKPgo+IHdoaWNoIHdlIG5lZWQgdG8gd2VpZ2ggYWdhaW5zdCB0aGUgb3RoZXIgY2hv
aWNlcy4KPgo+ICAgICAgICAJICAgICAgCSAgICAgICAJICAgICAgIAkgICAtIFRlZAoKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRl
dmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApo
dHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRl
dmVsCg==
