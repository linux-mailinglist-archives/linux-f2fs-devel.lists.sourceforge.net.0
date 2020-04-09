Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E899F1A2E13
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  9 Apr 2020 05:45:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jMO7V-00067L-Q6; Thu, 09 Apr 2020 03:44:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ericonr@disroot.org>) id 1jMO7U-000676-BF
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 09 Apr 2020 03:44:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Subject:Message-ID:From:
 Content-Transfer-Encoding:Content-Type:Date:Mime-Version:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/vNmAZDQ40Fl1lTp26fV93lb0sVBJOF3ilX3gmeq0Eo=; b=LFAsOWYWAuRNIcShhBzg/yCv1
 JkGXDFHrHmug7qDcDwubXC3Dn0GA6JxtsQHaeWpJHmnjgjzDT+7y4zImHp2aEFkulhDmypzJD2R9p
 4irnfqEtCa9CyL+3agFJPklX2cFQG2Q3s8ytRzgjduL77FKFMCgK5MyzT1h1OS8RSinNE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Subject:Message-ID:From:Content-Transfer-Encoding:Content-Type:Date:
 Mime-Version:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=/vNmAZDQ40Fl1lTp26fV93lb0sVBJOF3ilX3gmeq0Eo=; b=D
 ecbY1hg2lmNARZBIby9+inJsOm41mAB8eNERfXy8CyE8CasoL1I4H91W5egilhVsImCrihUwd1ap/
 Blh62/yOD6LIapqyGY8Qqp4opuJgTyVGUlr6T+CoUs5tPNdnyUyiUGy17aiMwUq6DFjkSUNCn9wSK
 tke62O4kTfZmpyEw=;
Received: from knopi.disroot.org ([178.21.23.139])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jMO7Q-008uTz-SM
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 09 Apr 2020 03:44:48 +0000
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id A520238F50
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  9 Apr 2020 05:44:35 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at disroot.org
Received: from knopi.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MYfE8B6VWkfd
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  9 Apr 2020 05:44:34 +0200 (CEST)
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1586403874; bh=HSkjeQeT8S93tzTQuC5H94tgrZkl9EAXaaaYWUBsP/s=;
 h=Date:From:Subject:To;
 b=h49rVafV2uITLAuiG+8BvJMq8cPmsiJxPSKtw6lZshnBNeUSFhnUs7i/ooGa38+9W
 NoTvkmStxVn+nGXJxV77XPcYn9bADDgs31HzGzf9m7vIrhUnUO6Fiy7tDoKnbsyJrM
 PNfhhzAE3RhKBqL/xyhHw2c6zm4soRBYBHxTgALDZjrbV1884PixfsvF8AGPNVCw3K
 mbZILSztIq/2kRjZ2eqLdhBa924Yb5ct6lrMYSahi+BDgJM49g02EzrsYBWlBbi2Yj
 c8ZRbtDThcIpvJmHWZmD55BV4xRWv0HGswTzHFZBWJe+vt3bTsXHM6lAXojWODN6xY
 PBnqTuX70X3uQ==
Date: Thu, 09 Apr 2020 03:44:34 +0000
From: ericonr@disroot.org
Message-ID: <ecfeeb92efb299cce883d25a4669fbd5@disroot.org>
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [178.21.23.139 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jMO7Q-008uTz-SM
Subject: [f2fs-dev] f2fs-tools: Question about mkfs and fsck behavior for
 documentation purposes
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGkgdGhlcmUhCgpJJ20gd29ya2luZyBvbiB0aGUgbWFuIHBhZ2VzIGFuZCB1c2FnZSBtZXNzYWdl
cyBvZiB0aGUgdmFyaW91cyBmMmZzCnRvb2xzLCB0byBtYWtlIHRoZW0gbW9yZSBkZXNjcmlwdGl2
ZSBhbmQgY29ycmVzcG9uZCBiZXR0ZXIgdG8gd2hhdCB0aGUKY29kZSBpcyBkb2luZy4gIFNvIEkn
bSBodW50aW5nIGFyb3VuZCB0aGUgZjJmcy10b29scyB0cmVlIHRvIHRyeSB0bwp1bmRlcnN0YW5k
IHRoaW5ncywgYnV0IEknZCBsaWtlIHRvIGNvbmZpcm0gc29tZSBpZGVhcyBJIGhhdmUuCgotIElu
c2lkZSBta2ZzLCB0aGUgb3ZlcnByb3Zpc2lvbiBwZXJjZW50YWdlIGlzIGVpdGhlciBwcm92aWRl
ZCBieSB0aGUKdXNlciAoLW8gb3B0aW9uKSBvciBkZXRlcm1pbmVkIGJ5IHRoZSBwcm9ncmFtLiAg
VGhlIGN1cnJlbnQgdXNhZ2UgdGV4dApzYXlzIHRoZSBkZWZhdWx0IGlzIDUuIFNob3VsZCBJIHJl
bW92ZSB0aGlzIGRlZmF1bHQgdG8gbWFrZSBpdCBjbGVhcgp0aGF0IGlmIG5vIHBlcmNlbnRhZ2Ug
aXMgcHJvdmlkZWQsIGl0IGlzIGRldGVybWluZWQgYXQgcnVudGltZT8KCi0gRm9yIHRoZSAtYyBv
cHRpb24gaW4gbWtmcywgaXQgc2F5cyB0aGVyZSdzIGEgbWF4aW11bSBvZiA3IGFkZGl0aW9uYWwK
ZGV2aWNlcywgZXhjZXB0IGZvciAibWV0YSBkZXZpY2VzIi4gV2hhdCBpcyBhIG1ldGEgZGV2aWNl
PyBHaXZlbiB0aGF0CnRoZSBjb2RlIGZvciBwYXJzaW5nIGFyZ3VtZW50cyBwYXNzZWQgdG8gLWMg
ZG9lc24ndCBzZWVtIHRvCmRpc3Rpbmd1aXNoIGJldHdlZW4gbWV0YSBvciBub3JtYWwgZGV2aWNl
cywgY2FuIEkgcmVtb3ZlIHRoaXMgcGFydCBvZgp0aGUgdGV4dD8KCi0gVGhlIHZlcml0eSBmZWF0
dXJlIGhhcyBhICJSZXNlcnZlZCIgY29tbWVudCBuZXh0IHRvIGl0LCBidXQgaXQgaXMgdXNlZApi
eSB0aGUgQW5kcm9pZCBkZWZhdWx0IG9wdGlvbnMuIFNob3VsZCBJIHRoZXJlZm9yZSBub3QgZG9j
dW1lbnQgaXQgaW4KdGhlIG9wdGlvbnMgZm9yIC1PPwoKLSBJIGRvY3VtZW50ZWQgdGhlIC1nIG9w
dGlvbiBhcyAiQWRkIEFuZHJvaWQgZGVmYXVsdCBvcHRpb25zIi4gSXMgdGhlcmUKYSBiZXR0ZXIg
ZGVzY3JpcHRpb24gZm9yIGl0PwoKLSBta2ZzIHVzZXMgLWUgYW5kIC1FIHRvIHNwZWNpZnkgdGhl
IGZpbGUgZXh0ZW5zaW9ucyBmb3IgY29sZCBhbmQgaG90CmZpbGVzLiBJcyB0aGVyZSBhbnl3aGVy
ZSBJIGNhbiBmaW5kIGEgc21hbGwgZXhwbGFuYXRpb24gb2Ygd2hhdCB0aGVzZQpmZWF0dXJlcyBt
ZWFuIHRvIGluY2x1ZGUgaW4gdGhlIG1hbiBwYWdlcz8gSSBraW5kIG9mIHVuZGVyc3Rvb2QgdGhh
dAp0aGV5IGRpZmZlciBpbiB3aGF0IHRoZSBmaWxlc3lzdGVtIGV4cGVjdHMgd2lsbCBiZSB0aGVp
ciBsaWZldGltZSBhbmQKYWNjZXNzIHBhdHRlcm5zLCBidXQgSSBkb24ndCBrbm93IGhvdyB0byBj
b21tdW5pY2F0ZSB0aGlzIGFkZXF1YXRlbHkuCgotIGZzY2ssIGR1cmluZyB0aGUgZmVhdHVyZSBw
YXJzaW5nIHBoYXNlLCBkb2Vzbid0IHNlZW0gdG8gcGFzcyBhbnkKc3BlY2lmaWMgYXJndW1lbnQg
dG8gIHBhcnNlX2ZlYXR1cmUoKS4gRG9lcyB0aGF0IG1lYW4gYWxsIGV4dHJhCmZlYXR1cmVzIGNh
biBiZSBlbmFibGVkIGJ5IGZzY2ssIGV2ZW4gaWYgdGhleSB3ZXJlbid0IGVuYWJsZWQgd2hlbiB0
aGUKZmlsZXN5c3RlbSB3YXMgY3JlYXRlZD8KCk1vcmUgZ2VuZXJhbGx5LCBJJ3ZlIGZpeGVkIGEg
ZmV3IHR5cG9zIGFsb25nIHRoZSB3YXkgYXMgd2VsbC4gSXMgaXQgb2sKaWYgSSBwdXQgZXZlcnl0
aGluZyB0b2dldGhlciBpbnRvIGEgc2luZ2xlIGNvbW1pdCB3aGVuIEkgbWFrZSBhIHBhdGNoPwoK
QW5vdGhlciBxdWVzdGlvbiByZWdhcmRpbmcgcHJlZmVyZW5jZXM6IGJvdGggaGVyZSBhbmQgaW4g
dGhlCmRvY3VtZW50YXRpb24gb2Ygb3RoZXIgdG9vbHMgbGlrZSBta2ZzLmV4dDQsICJmaWxlc3lz
dGVtIiBpcyB3cml0dGVuIGFsbAp0b2dldGhlciBhbmQgYXMgImZpbGUgc3lzdGVtIi4gSXMgdGhl
cmUgYW55IHByZWZlcnJlZCBzcGVsbGluZyBmb3IgbmV3CmNvbnRlbnQ/CgpUaGFua3MsCgrDiXJp
Y28gTm9ndWVpcmEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3Rz
LnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0
aW5mby9saW51eC1mMmZzLWRldmVsCg==
