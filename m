Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 797B893AAD5
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Jul 2024 03:57:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sWRG4-0003Vx-3Z;
	Wed, 24 Jul 2024 01:57:36 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <youling.tang@linux.dev>) id 1sWRG2-0003Vh-9G
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Jul 2024 01:57:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VT5Ew9eZUkwsQ1KVPNkgUu/jPA+/4qD7R3UMmIpNcFg=; b=GD+2SGbY2pJtBX770nGdk4+5iR
 QlgHBEkrhHSWPO3+ZLVENqJaW/RjDg/oMSNAkFJZiQ1HiAeSxVrgDZckrIh7daqJy5Kaxo5KzJ1Zz
 bchYiJtbLxNjqQ4zeBJ9NK5BtEjbhWFbek5nB25OuHr8lCDHwv4xoOORavK95+ogg8JY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VT5Ew9eZUkwsQ1KVPNkgUu/jPA+/4qD7R3UMmIpNcFg=; b=kj1TMptQE8wk5uVQzahtV/cPzD
 2/3y/tQUHzmNQyYTwCOAho+f6hBlBlX/IuiLN5Vf0Pb7G0FsXjO2N//YiwRr/GuEvDsR+FWlE0LPB
 +N6xiTzviEl3r4j0TyVAlpF2hEVYsBkN2xGQ4T3IdXw9Ep7TOvhxukGVIpgWEk0KXaVk=;
Received: from out-181.mta0.migadu.com ([91.218.175.181])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sWRG0-0001MT-UI for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Jul 2024 01:57:34 +0000
Message-ID: <0a63dfd1-ead3-4db3-a38c-2bc1db65f354@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1721786241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VT5Ew9eZUkwsQ1KVPNkgUu/jPA+/4qD7R3UMmIpNcFg=;
 b=lUesQsIHexBh+jWlqoVfPoQhT8csj+XUHOANqoY2BmuGuj0w3JXl7qjEn8fKlhmWIu4MyB
 m6+1FVE7jgrSZPIA/6Vt66AejEXBEHYoH28b5QiZDgA0zvxNBykvKWvQ4zuqHjle45conT
 zkXWV1SOK+8igIhqo00D5A9WQNklJm4=
Date: Wed, 24 Jul 2024 09:57:05 +0800
MIME-Version: 1.0
To: Christoph Hellwig <hch@infradead.org>
References: <20240723083239.41533-1-youling.tang@linux.dev>
 <20240723083239.41533-2-youling.tang@linux.dev>
 <Zp-_RDk5n5431yyh@infradead.org>
Content-Language: en-US, en-AU
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Youling Tang <youling.tang@linux.dev>
In-Reply-To: <Zp-_RDk5n5431yyh@infradead.org>
X-Migadu-Flow: FLOW_OUT
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, Christoph On 23/07/2024 22:33, Christoph Hellwig wrote:
 > On Tue, Jul 23, 2024 at 04:32:36PM +0800, Youling Tang wrote: >> Providing
 module_subinit{_noexit} and module_subeixt helps macros ensure >> that module
 [...] Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linux.dev]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [91.218.175.181 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [91.218.175.181 listed in sa-accredit.habeas.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1sWRG0-0001MT-UI
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
Cc: linux-arch@vger.kernel.org, Youling Tang <tangyouling@kylinos.cn>,
 linux-f2fs-devel@lists.sourceforge.net, tytso@mit.edu,
 Arnd Bergmann <arnd@arndb.de>, Josef Bacik <josef@toxicpanda.com>,
 linux-kernel@vger.kernel.org, Chris Mason <clm@fb.com>,
 Luis Chamberlain <mcgrof@kernel.org>,
 Andreas Dilger <adilger.kernel@dilger.ca>, linux-btrfs@vger.kernel.org,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, linux-modules@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGksIENocmlzdG9waAoKT24gMjMvMDcvMjAyNCAyMjozMywgQ2hyaXN0b3BoIEhlbGx3aWcgd3Jv
dGU6Cj4gT24gVHVlLCBKdWwgMjMsIDIwMjQgYXQgMDQ6MzI6MzZQTSArMDgwMCwgWW91bGluZyBU
YW5nIHdyb3RlOgo+PiBQcm92aWRpbmcgbW9kdWxlX3N1YmluaXR7X25vZXhpdH0gYW5kIG1vZHVs
ZV9zdWJlaXh0IGhlbHBzIG1hY3JvcyBlbnN1cmUKPj4gdGhhdCBtb2R1bGVzIGluaXQvZXhpdCBt
YXRjaCB0aGVpciBvcmRlciwgd2hpbGUgYWxzbyBzaW1wbGlmeWluZyB0aGUgY29kZS4KPj4KPj4g
VGhlIHRocmVlIG1hY3JvcyBhcmUgZGVmaW5lZCBhcyBmb2xsb3dzOgo+PiAtIG1vZHVsZV9zdWJp
bml0KGluaXRmbiwgZXhpdGZuLHJvbGxiYWNrKQo+PiAtIG1vZHVsZV9zdWJpbml0X25vZXhpdChp
bml0Zm4sIHJvbGxiYWNrKQo+PiAtIG1vZHVsZV9zdWJleGl0KHJvbGxiYWNrKQo+Pgo+PiBgaW5p
dGZuYCBpcyB0aGUgaW5pdGlhbGl6YXRpb24gZnVuY3Rpb24gYW5kIGBleGl0Zm5gIGlzIHRoZSBj
b3JyZXNwb25kaW5nCj4+IGV4aXQgZnVuY3Rpb24uCj4gSSBmaW5kIHRoZSBpbnRlcmZhY2UgYSBs
aXR0bGUgY29uZnVzaW5nLiAgV2hhdCBJIHdvdWxkIGhhdmUgZXhwZWN0ZWQKPiBpcyB0bzoKPgo+
ICAgLSBoYXZlIHRoZSBtb2R1bGVfc3ViaW5pdCBjYWxsIGF0IGZpbGUgc2NvcGUgaW5zdGVhZCBv
ZiBpbiB0aGUKPiAgICAgbW9kdWxlX2luaXQgaGVscGVyLCBzaW1pbGFyIHRvIG1vZHVsZV9pbml0
L21vZHVsZV9leGl0Cj4gICAtIHRodXMga2VlcCB0aGUgcm9sbGJhY2sgc3RhdGUgZXhwbGljaXRs
eSBpbiB0aGUgbW9kdWxlIHN0cnVjdHVyZSBvcgo+ICAgICBzaW1pbGFyIHNvIHRoYXQgdGhlIGRy
aXZlciBpdHNlbGYgZG9lc24ndCBuZWVkIHRvIGNhcmUgYWJvdXQgYXQKPiAgICAgYWxsLCBhbmQg
dGh1cyByZW1vdmUgdGhlIG5lZWQgZm9yIHRoZSBtb2R1bGVfc3ViZXhpdCBjYWxsLgptb2R1bGVf
aW5pdChpbml0Zm4pL21vZHVsZV9leGl0KGV4aXRmbikgaGFzIHR3byBkZWZpbml0aW9ucyAodmlh
IE1PRFVMRSk6Ci0gYnVpbmRpbjogdXNlcyBkb19pbml0Y2FsbHMoKSB0byBpdGVyYXRlIG92ZXIg
dGhlIGNvbnRlbnRzIG9mIHRoZSBzcGVjaWZpZWQKIMKgIHNlY3Rpb24gYW5kIGV4ZWN1dGVzIGFs
bCBpbml0Zm4gZnVuY3Rpb25zIGluIHRoZSBzZWN0aW9uIGluIHRoZSBvcmRlciBpbgogwqAgd2hp
Y2ggdGhleSBhcmUgc3RvcmVkIChleGl0Zm4gaXMgbm90IHJlcXVpcmVkKS4KCi0ga286IHJ1biBk
b19pbml0X21vZHVsZShtb2QpLT5kb19vbmVfaW5pdGNhbGwobW9kLT5pbml0KSB0byBleGVjdXRl
IGluaXRmbgogwqAgb2YgdGhlIHNwZWNpZmllZCBtb2R1bGUuCgpJZiB3ZSBjaGFuZ2UgbW9kdWxl
X3N1YmluaXQgdG8gc29tZXRoaW5nIGxpa2UgdGhpcywgbm90IGNhbGxlZCBpbgptb2R1bGVfaW5p
dCwKYGBgCnN0YXRpYyBpbnQgaW5pdF9hKHZvaWQpCnsKIMKgwqAgwqAuLi4KIMKgwqAgwqByZXR1
cm4gMDsKfQpzdGF0aWMgdm9pZCBleGl0X2Eodm9pZCkKewogwqDCoCDCoC4uLgp9CnN1YmluaXRj
YWxsKGluaXRfYSwgZXhpdF9hKTsKCnN0YXRpYyBpbnQgaW5pdF9iKHZvaWQpCnsKIMKgwqAgwqAu
Li4KIMKgwqAgwqByZXR1cm4gMDsKfQpzdGF0aWMgdm9pZCBleGl0X2Iodm9pZCkKewogwqDCoCDC
oC4uLgp9CnN1YmluaXRjYWxsKGluaXRfYiwgZXhpdF9iKTsKYGBgCgpOb3Qgb25seSBkbyB3ZSB3
YW50IHRvIGVuc3VyZSB0aGF0IGV4aXQgaXMgZXhlY3V0ZWQgaW4gcmV2ZXJzZSBvcmRlciBvZgpp
bml0LCBidXQgd2UgYWxzbyB3YW50IHRvIGVuc3VyZSB0aGUgb3JkZXIgb2YgaW5pdC4KClRoaXMg
ZG9lcyBub3QgZ3VhcmFudGVlIHRoZSBvcmRlciBpbiB3aGljaCBpbml0IHdpbGwgYmUgZXhlY3V0
ZWQgKGFsdGhvdWdoCnRoZSBpbml0L2V4aXQgb3JkZXIgd2lsbCByZW1haW4gdGhlIHNhbWUpCgpU
YW5rcywKWW91bGluZy4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxp
c3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9s
aXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
