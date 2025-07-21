Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3943BB0C34F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 21 Jul 2025 13:40:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H2obbSL41Xe6hQre7Trl3SemQs97uN7lkLVgEymolpI=; b=DcqBLBa9T//p2Bj1Bhf58aE33m
	ilc0W/Hd1Bj7k3fZiJ5xmMZaoF3U2a/bP2RiVUil9FompNTQnIzDq8OHWJv/ztZGgu2XZpi/yasgq
	MoERq500l7nYTGeUOKp5q1eN04hDlSKemDhaL11N9qXkP7Ube5MzmAyqFIZgsAQN6sEo=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1udosi-0002G5-Qc;
	Mon, 21 Jul 2025 11:40:32 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hsiangkao@linux.alibaba.com>) id 1udosg-0002Fz-TV
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Jul 2025 11:40:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8/0MxmZXQFEgx1v9g0Zx0cK6D0Dzk/CVwttHZ2ijYQw=; b=AQPWvAMRJ3UgeDPX8QxqDTpRwa
 WEnKk69QCd7tKXgbDFDXntAQOw4p/PDEcUnw4XGB16OHC/0yU6bzz69xVZRZBt5/mm/bY0rVflCv9
 clQskJ763e8/Ao+YiyTyPpcTOaWLfpBVIKU99GIL7zxL12Uk4wGmxiKWv6uL4yTlGhqE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8/0MxmZXQFEgx1v9g0Zx0cK6D0Dzk/CVwttHZ2ijYQw=; b=fuPC9HT8SPuYCxrOWnMm/QFVK+
 oaAvIv5GmrIQ67+HCSvaDv9nqF5EiFdm5kG6Zknp0iGtTxxa/JHJxKeDmzuL3nb6k6cEACiBlK7uR
 KgSlYcQspIdarF1B1zYUxg0p1hzFMlrl9QrE8o5Hk0Tu3M1b6eMgVj4J1WdbWmQaFDzk=;
Received: from out30-118.freemail.mail.aliyun.com ([115.124.30.118])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1udosf-0002pZ-U8 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Jul 2025 11:40:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1753098017; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
 bh=8/0MxmZXQFEgx1v9g0Zx0cK6D0Dzk/CVwttHZ2ijYQw=;
 b=To+tN/afrpIjgEz4eaK5y1iopdYpau0MWOlLa9zuoKblmMht57WggD66TKmWhOTqfw+p35hzplwhxDkpOazJpQG6yigqILHc+cxsDgBISdCpozXzygAEcFxy4SnmzLJh8XWFLaEIF2Lq434wE3odzogB/CEUIevGEfwbrKwKK2s=
Received: from 30.170.233.0(mailfrom:hsiangkao@linux.alibaba.com
 fp:SMTPD_---0WjOEKZd_1753098012 cluster:ay36) by smtp.aliyun-inc.com;
 Mon, 21 Jul 2025 19:40:15 +0800
Message-ID: <de793a0d-b65e-4b36-ad7f-3202515ba9c9@linux.alibaba.com>
Date: Mon, 21 Jul 2025 19:40:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jan Kara <jack@suse.cz>
References: <aHa8ylTh0DGEQklt@casper.infradead.org>
 <e5165052-ead3-47f4-88f6-84eb23dc34df@linux.alibaba.com>
 <b61c4b7f-4bb1-4551-91ba-a0e0ffd19e75@linux.alibaba.com>
 <CAGsJ_4xJjwsvMpeBV-QZFoSznqhiNSFtJu9k6da_T-T-a6VwNw@mail.gmail.com>
 <7ea73f49-df4b-4f88-8b23-c917b4a9bd8a@linux.alibaba.com>
 <z2ule3ilnnpoevo5mvt3intvjtuyud7vg3pbfauon47fhr4owa@giaehpbie4a5>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <z2ule3ilnnpoevo5mvt3intvjtuyud7vg3pbfauon47fhr4owa@giaehpbie4a5>
X-Spam-Score: -7.7 (-------)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Jan, On 2025/7/21 18:25, Jan Kara wrote: > On Mon 21-07-25
 11:14:02, Gao Xiang wrote: >> Hi Barry, >> >> On 2025/7/21 09:02, Barry Song
 wrote: >>> On Wed, Jul 16, 2025 at 8:28 AM Gao Xiang <hsiangkao@linux [...]
 Content analysis details:   (-7.7 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -7.5 USER_IN_DEF_DKIM_WL From: address is in the default DKIM welcome-list
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
X-Headers-End: 1udosf-0002pZ-U8
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
 Qu Wenruo <quwenruo.btrfs@gmx.com>, linux-cifs@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, Barry Song <21cnbao@gmail.com>,
 Matthew Wilcox <willy@infradead.org>, Gao Xiang <xiang@kernel.org>,
 Josef Bacik <josef@toxicpanda.com>, Phillip Lougher <phillip@squashfs.org.uk>,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 David Howells <dhowells@redhat.com>, Nicolas Pitre <nico@fluxnic.net>,
 David Woodhouse <dwmw2@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
 Steve French <sfrench@samba.org>, Hailong Liu <hailong.liu@oppo.com>,
 linux-fsdevel@vger.kernel.org, netfs@lists.linux.dev, ntfs3@lists.linux.dev,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGkgSmFuLAoKT24gMjAyNS83LzIxIDE4OjI1LCBKYW4gS2FyYSB3cm90ZToKPiBPbiBNb24gMjEt
MDctMjUgMTE6MTQ6MDIsIEdhbyBYaWFuZyB3cm90ZToKPj4gSGkgQmFycnksCj4+Cj4+IE9uIDIw
MjUvNy8yMSAwOTowMiwgQmFycnkgU29uZyB3cm90ZToKPj4+IE9uIFdlZCwgSnVsIDE2LCAyMDI1
IGF0IDg6MjjigK9BTSBHYW8gWGlhbmcgPGhzaWFuZ2thb0BsaW51eC5hbGliYWJhLmNvbT4gd3Jv
dGU6Cj4+Pj4KPj4KPj4gLi4uCj4+Cj4+Pj4KPj4+PiAuLi4gaGlnaC1vcmRlciBmb2xpb3MgY2Fu
IGNhdXNlIHNpZGUgZWZmZWN0cyBvbiBlbWJlZGRlZCBkZXZpY2VzCj4+Pj4gbGlrZSByb3V0ZXJz
IGFuZCBJb1QgZGV2aWNlcywgd2hpY2ggc3RpbGwgaGF2ZSBNaUJzIG9mIG1lbW9yeSAoYW5kIEkK
Pj4+PiBiZWxpZXZlIHRoaXMgd29uJ3QgY2hhbmdlIGR1ZSB0byB0aGVpciB1c2UgY2FzZXMpIGJ1
dCB0aGV5IGFsc28gdXNlCj4+Pj4gTGludXgga2VybmVsIGZvciBxdWl0ZSBsb25nIHRpbWUuICBJ
biBzaG9ydCwgSSBkb24ndCB0aGluayBlbmFibGluZwo+Pj4+IGxhcmdlIGZvbGlvcyBmb3IgdGhv
c2UgZGV2aWNlcyBpcyB2ZXJ5IHVzZWZ1bCwgbGV0IGFsb25lIGxpbWl0aW5nCj4+Pj4gdGhlIG1p
bmltdW0gZm9saW8gb3JkZXIgZm9yIHRoZW0gKEl0IHdvdWxkIG1ha2UgdGhlIGZpbGVzeXN0ZW0g
bm90Cj4+Pj4gc3VpdGFibGUgYW55IG1vcmUgZm9yIHRob3NlIHVzZXJzLiAgQXQgbGVhc3QgdGhh
dCBpcyB3aGF0IEkgbmV2ZXIKPj4+PiB3YW50IHRvIGRvKS4gIEFuZCBJIGJlbGlldmUgdGhpcyBp
cyBkaWZmZXJlbnQgZnJvbSB0aGUgY3VycmVudCBMQlMKPj4+PiBzdXBwb3J0IHRvIG1hdGNoIGhh
cmR3YXJlIGNoYXJhY3RlcmlzdGljcyBvciBMQlMgYXRvbWljIHdyaXRlCj4+Pj4gcmVxdWlyZW1l
bnQuCj4+Pgo+Pj4gR2l2ZW4gdGhlIGRpZmZpY3VsdHkgb2YgYWxsb2NhdGluZyBsYXJnZSBmb2xp
b3MsIGl0J3MgYWx3YXlzIGEgZ29vZAo+Pj4gaWRlYSB0byBoYXZlIG9yZGVyLTAgYXMgYSBmYWxs
YmFjay4gV2hpbGUgSSBhZ3JlZSB3aXRoIHlvdXIgcG9pbnQsCj4+PiBJIGhhdmUgYSBzbGlnaHRs
eSBkaWZmZXJlbnQgcGVyc3BlY3RpdmUg4oCUIGVuYWJsaW5nIGxhcmdlIGZvbGlvcyBmb3IKPj4+
IHRob3NlIGRldmljZXMgbWlnaHQgYmUgYmVuZWZpY2lhbCwgYnV0IHRoZSBtYXhpbXVtIG9yZGVy
IHNob3VsZAo+Pj4gcmVtYWluIHNtYWxsLiBJJ20gcmVmZXJyaW5nIHRvICJzbWFsbCIgbGFyZ2Ug
Zm9saW9zLgo+Pgo+PiBZZWFoLCBhZ3JlZWQuIEhhdmluZyBhIHdheSB0byBsaW1pdCB0aGUgbWF4
aW11bSBvcmRlciBmb3IgdGhvc2Ugc21hbGwKPj4gZGV2aWNlcyAocmF0aGVyIHRoYW4gZGlzYWJs
aW5nIGl0IGNvbXBsZXRlbHkpIHdvdWxkIGJlIGhlbHBmdWwuICBBdAo+PiBsZWFzdCAic21hbGwi
IGxhcmdlIGZvbGlvcyBjb3VsZCBzdGlsbCBwcm92aWRlIGJlbmVmaXRzIHdoZW4gbWVtb3J5Cj4+
IHByZXNzdXJlIGlzIGxpZ2h0Lgo+IAo+IFdlbGwsIGluIHRoZSBwYWdlIGNhY2hlIHlvdSBjYW4g
dHVuZSBub3Qgb25seSB0aGUgbWluaW11bSBidXQgYWxzbyB0aGUKPiBtYXhpbXVtIG9yZGVyIG9m
IGEgZm9saW8gYmVpbmcgYWxsb2NhdGVkIGZvciBlYWNoIGlub2RlLiBCdHJmcyBhbmQgZXh0NAo+
IGFscmVhZHkgdXNlIHRoaXMgZnVuY3Rpb25hbGl0eS4gU28gaW4gcHJpbmNpcGxlIHRoZSBmdW5j
dGlvbmFsaXR5IGlzIHRoZXJlLAo+IGl0IGlzICJqdXN0IiBhIHF1ZXN0aW9uIG9mIHByb3BlciB1
c2VyIGludGVyZmFjZXMgb3IgYXV0b21hdGljIGxvZ2ljIHRvCj4gdHVuZSB0aGlzIGxpbWl0LgoK
WWVzLCBJIHRvb2sgYSBxdWljayBnbGFuY2Ugb2YgdGhlIGN1cnJlbnQgZXh0NCBhbmQgYnRyZnMg
Y2FzZXMKd2Vla3MgYWdvIHdoaWNoIHVzZSB0aGlzIHRvIGZ1bGZpbGwgdGhlIGpvdXJuYWwgcmVz
ZXJ2YXRpb24KZm9yIGV4YW1wbGUuCgpidXQgY29uc2lkZXJpbmcgdGhhdCBzcGVjaWZpYyBtZW1v
cnkgb3ZlcmhlYWQgdXNlIGNhc2VzICh0bwpsaW1pdCBtYXhpbXVtIGxhcmdlIGZvbGlvIG9yZGVy
IGZvciBzbWFsbCBkZXZpY2VzKSwgaXQgc291bmRzCm1vcmUgbGlrZSBhIGdlbmVyaWMgcGFnZSBj
YWNoZSB1c2VyIGludGVyZmFjZSBmb3IgYWxsCmZpbGVzeXN0ZW1zIGluc3RlYWQsIGFuZCBpbiB0
aGUgZWZmZWN0aXZlIG1heGltdW0gb3JkZXIgc2hvdWxkCmNvbWJpbmUgdGhlc2UgdHdvIG1heGlt
dW0gbnVtYmVycy4KClRoYW5rcywKR2FvIFhpYW5nCgo+IAo+IAkJCQkJCQkJSG9uemEKCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1k
ZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQK
aHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1k
ZXZlbAo=
