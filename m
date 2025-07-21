Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF11B0C3B1
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 21 Jul 2025 13:52:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S23Zg4brsiaeA8r+tOHHeFtur6dL14ehEMqgGoBn+pE=; b=XMzH1B2hmH0xWW40jfjwgqLwZ6
	oJ1baDRoZ36lf/nBsENA8QkEF8pxGAaKes9dlx+sHCecvG1Yyh7lym4fIis80rrBJQ1a7TT1ao6ZK
	mCluKohlJ5q7x/Y5vIhOyv6KnzjU9hfcjmehc8R+Ybfa8R3SQJp+qdg7ZeVDAGo9DwjI=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1udp4b-0006Xz-QL;
	Mon, 21 Jul 2025 11:52:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hsiangkao@linux.alibaba.com>) id 1udp4a-0006Xt-Kt
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Jul 2025 11:52:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xn+hlC0ADjp0KbawmAyVX05nJJetj+qoWgSmW+bOOXA=; b=e9rPLGFRBKgTAUUM2aGlEn2WV+
 kOtCiM6W0Q3caS/gA/BIwh3NCbzujX2EywvkgkreiYvagcv/N+fNTVou1BBWngC4ujGn+NCaC9REc
 EFlfPWvkV+QnxgkUT9iOTlY4++bc8s4AADODKn7Mknonhom5PMvdLyBXbVw6B8iSVSiw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xn+hlC0ADjp0KbawmAyVX05nJJetj+qoWgSmW+bOOXA=; b=Hw7FEYCSIA3EF/3yJVTLns24qC
 X64tHam7YZ2oUn7DdiiIuQBn9Om7X4bEVkdhaTdaX9hNB6gBuO8N8v7A/xpUJq8RgWoGZfRcn3evy
 rH7JwyKk3hNc11l0hWInDKJQ6vx5aG5OYmRQQ8kAkUnNt3nmIS7CwwM6Aj54rfyZ0DFs=;
Received: from out30-97.freemail.mail.aliyun.com ([115.124.30.97])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1udp4Z-0003dQ-TQ for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Jul 2025 11:52:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1753098761; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
 bh=xn+hlC0ADjp0KbawmAyVX05nJJetj+qoWgSmW+bOOXA=;
 b=k+/flLBcXGweWN2U8v3rPG2fTPCeEDCyHl42j1l0VB4rWRWGHnib7wocuOkqYa1xOj2MH5NAtiiYD2xsDdG9XQ9NS4/3tFS+3CaEoFGiWoa1A6B2/yYO66kDgTIV4TkjzniMpY31fwFgbOR5BzOiRooEyfZqzTvcnn9qFAZBsM8=
Received: from 30.170.233.0(mailfrom:hsiangkao@linux.alibaba.com
 fp:SMTPD_---0WjOEOJD_1753098756 cluster:ay36) by smtp.aliyun-inc.com;
 Mon, 21 Jul 2025 19:52:39 +0800
Message-ID: <5b01d35c-b73b-4c04-906d-6abc0c9e37ce@linux.alibaba.com>
Date: Mon, 21 Jul 2025 19:52:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Qu Wenruo <quwenruo.btrfs@gmx.com>, Jan Kara <jack@suse.cz>
References: <aHa8ylTh0DGEQklt@casper.infradead.org>
 <e5165052-ead3-47f4-88f6-84eb23dc34df@linux.alibaba.com>
 <b61c4b7f-4bb1-4551-91ba-a0e0ffd19e75@linux.alibaba.com>
 <CAGsJ_4xJjwsvMpeBV-QZFoSznqhiNSFtJu9k6da_T-T-a6VwNw@mail.gmail.com>
 <7ea73f49-df4b-4f88-8b23-c917b4a9bd8a@linux.alibaba.com>
 <z2ule3ilnnpoevo5mvt3intvjtuyud7vg3pbfauon47fhr4owa@giaehpbie4a5>
 <85946346-8bfd-4164-a49d-594b4a158588@gmx.com>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <85946346-8bfd-4164-a49d-594b4a158588@gmx.com>
X-Spam-Score: -7.7 (-------)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-2.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2025/7/21 19:36, Qu Wenruo wrote: > > > 在 2025/7/21
   19:55, Jan Kara 写道: >> On Mon 21-07-25 11:14:02, Gao Xiang wrote: >>>
   Hi Barry, >>> >>> On 2025/7/21 09:02, Barry Song wrote: >>>> On Wed, [...]
    
 
 Content analysis details:   (-7.7 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM welcome-list
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.0 UNPARSEABLE_RELAY      Informational: message has unparseable relay lines
X-Headers-End: 1udp4Z-0003dQ-TQ
Subject: Re: [f2fs-dev] Compressed files & the page cache
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
Cc: Paulo Alcantara <pc@manguebit.org>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Chris Mason <clm@fb.com>, linux-mtd@lists.infradead.org,
 linux-cifs@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 Barry Song <21cnbao@gmail.com>, Matthew Wilcox <willy@infradead.org>,
 Gao Xiang <xiang@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
 Phillip Lougher <phillip@squashfs.org.uk>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, David Howells <dhowells@redhat.com>,
 Nicolas Pitre <nico@fluxnic.net>, David Woodhouse <dwmw2@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, Steve French <sfrench@samba.org>,
 Hailong Liu <hailong.liu@oppo.com>, linux-fsdevel@vger.kernel.org,
 netfs@lists.linux.dev, ntfs3@lists.linux.dev, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

CgpPbiAyMDI1LzcvMjEgMTk6MzYsIFF1IFdlbnJ1byB3cm90ZToKPiAKPiAKPiDlnKggMjAyNS83
LzIxIDE5OjU1LCBKYW4gS2FyYSDlhpnpgZM6Cj4+IE9uIE1vbiAyMS0wNy0yNSAxMToxNDowMiwg
R2FvIFhpYW5nIHdyb3RlOgo+Pj4gSGkgQmFycnksCj4+Pgo+Pj4gT24gMjAyNS83LzIxIDA5OjAy
LCBCYXJyeSBTb25nIHdyb3RlOgo+Pj4+IE9uIFdlZCwgSnVsIDE2LCAyMDI1IGF0IDg6MjjigK9B
TSBHYW8gWGlhbmcgPGhzaWFuZ2thb0BsaW51eC5hbGliYWJhLmNvbT4gd3JvdGU6Cj4gWy4uLl0K
Pj4+PiBHaXZlbiB0aGUgZGlmZmljdWx0eSBvZiBhbGxvY2F0aW5nIGxhcmdlIGZvbGlvcywgaXQn
cyBhbHdheXMgYSBnb29kCj4+Pj4gaWRlYSB0byBoYXZlIG9yZGVyLTAgYXMgYSBmYWxsYmFjay4g
V2hpbGUgSSBhZ3JlZSB3aXRoIHlvdXIgcG9pbnQsCj4+Pj4gSSBoYXZlIGEgc2xpZ2h0bHkgZGlm
ZmVyZW50IHBlcnNwZWN0aXZlIOKAlCBlbmFibGluZyBsYXJnZSBmb2xpb3MgZm9yCj4+Pj4gdGhv
c2UgZGV2aWNlcyBtaWdodCBiZSBiZW5lZmljaWFsLCBidXQgdGhlIG1heGltdW0gb3JkZXIgc2hv
dWxkCj4+Pj4gcmVtYWluIHNtYWxsLiBJJ20gcmVmZXJyaW5nIHRvICJzbWFsbCIgbGFyZ2UgZm9s
aW9zLgo+Pj4KPj4+IFllYWgsIGFncmVlZC4gSGF2aW5nIGEgd2F5IHRvIGxpbWl0IHRoZSBtYXhp
bXVtIG9yZGVyIGZvciB0aG9zZSBzbWFsbAo+Pj4gZGV2aWNlcyAocmF0aGVyIHRoYW4gZGlzYWJs
aW5nIGl0IGNvbXBsZXRlbHkpIHdvdWxkIGJlIGhlbHBmdWwuwqAgQXQKPj4+IGxlYXN0ICJzbWFs
bCIgbGFyZ2UgZm9saW9zIGNvdWxkIHN0aWxsIHByb3ZpZGUgYmVuZWZpdHMgd2hlbiBtZW1vcnkK
Pj4+IHByZXNzdXJlIGlzIGxpZ2h0Lgo+Pgo+PiBXZWxsLCBpbiB0aGUgcGFnZSBjYWNoZSB5b3Ug
Y2FuIHR1bmUgbm90IG9ubHkgdGhlIG1pbmltdW0gYnV0IGFsc28gdGhlCj4+IG1heGltdW0gb3Jk
ZXIgb2YgYSBmb2xpbyBiZWluZyBhbGxvY2F0ZWQgZm9yIGVhY2ggaW5vZGUuIEJ0cmZzIGFuZCBl
eHQ0Cj4+IGFscmVhZHkgdXNlIHRoaXMgZnVuY3Rpb25hbGl0eS4gU28gaW4gcHJpbmNpcGxlIHRo
ZSBmdW5jdGlvbmFsaXR5IGlzIHRoZXJlLAo+PiBpdCBpcyAianVzdCIgYSBxdWVzdGlvbiBvZiBw
cm9wZXIgdXNlciBpbnRlcmZhY2VzIG9yIGF1dG9tYXRpYyBsb2dpYyB0bwo+PiB0dW5lIHRoaXMg
bGltaXQuCj4+Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIEhvbnphCj4gCj4gQW5kIGVuYWJsaW5nIGxhcmdlIGZvbGlvcyBk
b2Vzbid0IG1lYW4gYWxsIGZzIG9wZXJhdGlvbnMgd2lsbCBncmFiIGFuIHVubmVjZXNzYXJpbHkg
bGFyZ2UgZm9saW8uCj4gCj4gRm9yIGJ1ZmZlcmVkIHdyaXRlLCBhbGwgdGhvc2UgZmlsZXN5c3Rl
bSB3aWxsIG9ubHkgdHJ5IHRvIGdldCBmb2xpb3MgYXMgbGFyZ2UgYXMgbmVjZXNzYXJ5LCBub3Qg
b3Zlcmx5IGxhcmdlLgo+IAo+IFRoaXMgbWVhbnMgaWYgdGhlIHVzZXIgc3BhY2UgcHJvZ3JhbSBp
cyBhbHdheXMgZG9pbmcgYnVmZmVyZWQgSU8gaW4gYSBwb3dlci1vZi10d28gdW5pdCAoYW5kIGFs
aWduZWQgb2Zmc2V0IG9mIGNvdXJzZSksIHRoZSBmb2xpbyBzaXplIHdpbGwgbWF0Y2ggdGhlIGJ1
ZmZlciBzaXplIHBlcmZlY3RseSAoaWYgd2UgaGF2ZSBlbm91Z2ggbWVtb3J5KS4KPiAKPiBTbyBm
b3IgcHJvcGVybHkgYWxpZ25lZCBidWZmZXJlZCB3cml0ZXMsIGxhcmdlIGZvbGlvcyB3b24ndCBy
ZWFsbHkgY2F1c2UgwqB1bm5lY2Vzc2FyaWx5IGxhcmdlIGZvbGlvcywgbWVhbndoaWxlIGJyaW5n
cyBhbGwgdGhlIGJlbmVmaXRzLgoKVGhhdCByZWFsbHkgZGVwZW5kcyBvbiB0aGUgdXNlciBiZWhh
dmlvciAmIEkvTyBwYXR0ZXJuIGFuZApjb3VsZCBjYXVzZSB1bmV4cGVjdGVkIHNwaWtlLgoKQW55
d2F5LCBJTUhPLCBob3cgdG8gbGltaXQgdGhlIG1heGltdW0gb3JkZXIgbWF5IGJlIHVzZWZ1bApm
b3Igc21hbGwgZGV2aWNlcyBpZiBsYXJnZSBmb2xpb3MgaXMgZW5hYmxlZC4gIFdoZW4gZGlyZWN0
CnJlY2xhaW0gaXMgdGhlIGNvbW1vbiBjYXNlLCBpdCBtaWdodCBiZSB0b28gbGF0ZS4KClRoYW5r
cywKR2FvIFhpYW5nCgo+IAo+IAo+IEFsdGhvdWdoIEknbSBub3QgZmFtaWxpYXIgZW5vdWdoIHdp
dGggZmlsZW1hcCB0byBjb21tZW50IG9uIGZvbGlvIHJlYWQgYW5kIHJlYWRhaGVhZC4uLgo+IAo+
IFRoYW5rcywKPiBRdQoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxp
c3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9s
aXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
