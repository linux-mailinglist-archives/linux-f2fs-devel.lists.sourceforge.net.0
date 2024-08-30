Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECAC9667E1
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 30 Aug 2024 19:22:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sk5K9-00045E-Ns;
	Fri, 30 Aug 2024 17:22:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sandeen@sandeen.net>) id 1sk5K3-000450-2b
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 30 Aug 2024 17:22:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Rdqy319/qy8mgecu7nilvPFyGIoY+bNoGS92/jVSf10=; b=NYb4t65tLo6C3vf0r37AaakGz9
 nwTpZkVAYoy+XuVD1s4g/G5t/AvmDFZwYidQDqiKHxPmvCBtIG2M4D57p2y4iWPMaZUb7nWx5JGEc
 w1+wDJBYBCG9xM5Y3sM08pa//qXy8/GfAqCFJetIRwfbF3FP+N4wafc/PnLK9wP458pU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Rdqy319/qy8mgecu7nilvPFyGIoY+bNoGS92/jVSf10=; b=JwoBcq6TyArf8Lwg6xW5wnN0tX
 9MnoLD41fGQTIrQ7e2c8Ja3HCgwt+GNitM28+rGfmmrKiYr3ftWdXUAbce9vIsZZy6lWkZgyTITYy
 bkzvR4y7YLEzP+s+CB7fr5Ah1MRZhoyC/ijKjfuRDiZqbxEDNzB6hDU+nFXqILRkLA4k=;
Received: from fout5-smtp.messagingengine.com ([103.168.172.148])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sk5K2-0000eT-Bb for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 30 Aug 2024 17:22:07 +0000
Received: from phl-compute-03.internal (phl-compute-03.nyi.internal
 [10.202.2.43])
 by mailfout.nyi.internal (Postfix) with ESMTP id 6AE421380195;
 Fri, 30 Aug 2024 13:07:28 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-03.internal (MEProxy); Fri, 30 Aug 2024 13:07:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sandeen.net; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm1; t=1725037648;
 x=1725124048; bh=Rdqy319/qy8mgecu7nilvPFyGIoY+bNoGS92/jVSf10=; b=
 UzaEcL7bA0CheZ7fxD03VTdlK+Mr4xWTZGM/KUyWznjBVtoaJZyp3MqqC8QY3dro
 QY1NomOb0YC9HOZUTU/qUgNwXAgbQILwT4x2CSDy+XjR9reEkTShhClknnsMlVDI
 5uyzXTYnHZS0rzvVxOc56ZhA5wpi15V3gmfilaJHeo+DEyL2I/TptEj4nz/byKtI
 YaxQMZi5Bzs9ZqbIG2HhBxdRyIF0ShqzK2TK1rN3zVwGyZCBh65ObdJtA8pSaFOg
 B6wiFT+pBD8X/6UdYMwXaPvklGhga5zBT66ImG20BqITZqAPrXNELYeQ6Z2UtSQo
 aRUT1I7eChwClyo52PXrHw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725037648; x=
 1725124048; bh=Rdqy319/qy8mgecu7nilvPFyGIoY+bNoGS92/jVSf10=; b=t
 BIrl6TNACaSQ9tVhxz/8a3Ff+PAAqSc+q93OzQXY1zsTOVmhfkB3rYHJr9tUrMYd
 7ithOBa162VxYSxCL5ji8QYqIbNRqY11SO5DECgdQCF33gfFWdEpYR2HP6cB9HKA
 t2+10Lw6EImIZksA8Vtzxw70AIQLg9I0ODSMOOjryBw4lWwiRp0xS/AQTUafqGy/
 HeGxY6N2mUvnLkr88CFeTuI+VygWJgLpScR1MUNmO7zSHK70aPsNdRookUnmWerx
 Vl0uex31DPqma9Xp+QfYAcoq13CGHh1r9hpih18YWKqSSEb3DkcLssFK71SyBfUy
 Sko2QYrPW3ee6JtIEEJsg==
X-ME-Sender: <xms:UPzRZlKB1lpMi9kxrU4cICIPZQlpUF-rHle2L-bwymqUd-Y0Ka534w>
 <xme:UPzRZhLYEgEvAMUrwewmcSg3egy5SAjtHFRKzbDxjy5O_qeAgDwdHKSmE3yBubYxz
 5iRUxaZs47VOTd3Suo>
X-ME-Received: <xmr:UPzRZtuDHidjY8ko3TIAvW9H8gNTiqjV6PJAKd4Zu53QeTgkoociO8uozp2wVYN7MW4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudefiedguddtkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
 uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
 hnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddv
 jeenucfhrhhomhepgfhrihgtucfurghnuggvvghnuceoshgrnhguvggvnhesshgrnhguvg
 gvnhdrnhgvtheqnecuggftrfgrthhtvghrnheptdduvdduteeugeekiedtfefgteevveeg
 kedttedvhedtieeuieevvddttdffleevnecuffhomhgrihhnpehkvghrnhgvlhdrohhrgh
 enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghn
 uggvvghnsehsrghnuggvvghnrdhnvghtpdhnsggprhgtphhtthhopeejpdhmohguvgepsh
 hmthhpohhuthdprhgtphhtthhopehlihhhohhnghgsohdvvdeshhhurgifvghirdgtohhm
 pdhrtghpthhtohepjhgrvghgvghukheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptg
 hhrghosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhfvdhfshdquggv
 vhgvlheslhhishhtshdrshhouhhrtggvfhhorhhgvgdrnhgvthdprhgtphhtthhopegsrh
 gruhhnvghrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehltgiivghrnhgvrhesrhgv
 ughhrghtrdgtohhmpdhrtghpthhtoheplhhinhhugidqfhhsuggvvhgvlhesvhhgvghrrd
 hkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:UPzRZmZSPM-6A9TQHMjX8xAN7tM-srWcrQN6NKowhaWqnL1iz0l8Qg>
 <xmx:UPzRZsZ9AhXdLvBSO7vVKl-lVz4EmINY-9Y_7h9Ii8Yyma6pjwWdxg>
 <xmx:UPzRZqANflY6g0K8W1Cbw8DAJc2-T8hTrtdEjdXicYsFp1KTlh-S-g>
 <xmx:UPzRZqYeB9Yvjz_JrGZkaXQGhFm2snAukQ_ljkIzteLnjsP-LB0gww>
 <xmx:UPzRZiMZskJa2rdkhaKQciDXSU5b5ztXaBjVtQQzG2ByvagPuOIwfA-V>
Feedback-ID: i2b59495a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 30 Aug 2024 13:07:27 -0400 (EDT)
Message-ID: <5c194e3e-6dc9-41a2-b967-13fc1177b2f4@sandeen.net>
Date: Fri, 30 Aug 2024 12:07:27 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Hongbo Li <lihongbo22@huawei.com>, jaegeuk@kernel.org, chao@kernel.org
References: <20240814023912.3959299-1-lihongbo22@huawei.com>
 <6c1baa6e-5f71-418f-a7fc-27c798e51498@huawei.com>
Content-Language: en-US
From: Eric Sandeen <sandeen@sandeen.net>
In-Reply-To: <6c1baa6e-5f71-418f-a7fc-27c798e51498@huawei.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Just FWIW - I had missed this thread when I got temporarily
 unsubscribed from fsdevel. I have a series that I was hacking on for this
 same work, at https://git.kernel.org/pub/scm/linux/kernel/git/sandeen/linux.gi
 [...] Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: messagingengine.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [103.168.172.148 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [103.168.172.148 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [103.168.172.148 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sk5K2-0000eT-Bb
Subject: Re: [f2fs-dev] [PATCH 0/9] f2fs: new mount API conversion
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
Cc: linux-fsdevel@vger.kernel.org, lczerner@redhat.com, brauner@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SnVzdCBGV0lXIC0gCgpJIGhhZCBtaXNzZWQgdGhpcyB0aHJlYWQgd2hlbiBJIGdvdCB0ZW1wb3Jh
cmlseSB1bnN1YnNjcmliZWQgZnJvbSBmc2RldmVsLgpJIGhhdmUgYSBzZXJpZXMgdGhhdCBJIHdh
cyBoYWNraW5nIG9uIGZvciB0aGlzIHNhbWUgd29yaywgYXQKaHR0cHM6Ly9naXQua2VybmVsLm9y
Zy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvc2FuZGVlbi9saW51eC5naXQvY29tbWl0Lz9oPWYy
ZnMtbW91bnQtYXBpCmJ1dCBpdCdzIHZlcnkgcm91Z2ggYW5kIGFsbW9zdCBjZXJ0YWlubHkgY29u
dGFpbnMgYnVncy4gSXQgbWF5IG9yIG1heSBub3QKYmUgb2YgYW55IGhlbHAgdG8geW91LCBidXQg
anVzdCBGWUkuCgpJJ2xsIHRyeSB0byBoZWxwIHJldmlldy90ZXN0IHlvdXIgc2VyaWVzIHNpbmNl
IEkgdHJpZWQgdG8gc29sdmUgdGhpcyBhcwp3ZWxsLCBidXQgSSBuZXZlciBjb21wbGV0ZWQgdGhl
IHdvcmsuIDopCgpUaGFua3MsCi1FcmljCgpPbiA4LzI3LzI0IDY6NDcgQU0sIEhvbmdibyBMaSB3
cm90ZToKPiBEb2VzIHRoZXJlIGV4aXN0IENJIHRlc3QgZm9yIGYyZnM/IEkgY2FuIG9ubHkgd3Jp
dGUgdGhlIG1vdW50IHRlc3QgZm9yIGYyZnMgcmVmZXIgdG8gdGVzdHMvZXh0NC8wNTMuIEFuZCBJ
IGhhdmUgdGVzdGVkIHRoaXMgaW4gbG9jYWwuCj4gCj4gVGhhbmtzLAo+IEhvbmdibwo+IAo+IE9u
IDIwMjQvOC8xNCAxMDozOSwgSG9uZ2JvIExpIHdyb3RlOgo+PiBTaW5jZSBtYW55IGZpbGVzeXN0
ZW1zIGhhdmUgZG9uZSB0aGUgbmV3IG1vdW50IEFQSSBjb252ZXJzaW9uLAo+PiB3ZSBpbnRyb2R1
Y2UgdGhlIG5ldyBtb3VudCBBUEkgY29udmVyc2lvbiBpbiBmMmZzLgo+Pgo+PiBUaGUgc2VyaWVz
IGNhbiBiZSBhcHBsaWVkIG9uIHRvcCBvZiB0aGUgY3VycmVudCBtYWlubGluZSB0cmVlCj4+IGFu
ZCB0aGUgd29yayBpcyBiYXNlZCBvbiB0aGUgcGF0Y2hlcyBmcm9tIEx1a2FzIEN6ZXJuZXIgKGhh
cwo+PiBkb25lIHRoaXMgaW4gZXh0NFsxXSkuIEhpcyBwYXRjaCBnaXZlIG1lIGEgbG90IG9mIGlk
ZWFzLgo+Pgo+PiBIZXJlIGlzIGEgaGlnaCBsZXZlbCBkZXNjcmlwdGlvbiBvZiB0aGUgcGF0Y2hz
ZXQ6Cj4+Cj4+IDEuIFByZXBhcmUgdGhlIGYyZnMgbW91bnQgcGFyYW1ldGVycyByZXF1aXJlZCBi
eSB0aGUgbmV3IG1vdW50Cj4+IEFQSSBhbmQgdXNlIGl0IGZvciBwYXJzaW5nLCB3aGlsZSBzdGls
bCB1c2luZyB0aGUgb2xkIEFQSSB0bwo+PiBnZXQgbW91bnQgb3B0aW9ucyBzdHJpbmcuIFNwbGl0
IHRoZSBwYXJhbWV0ZXIgcGFyc2luZyBhbmQKPj4gdmFsaWRhdGlvbiBvZiB0aGUgcGFyc2Vfb3B0
aW9ucyBoZWxwZXIgaW50byB0d28gc2VwYXJhdGUKPj4gaGVscGVycy4KPj4KPj4gwqDCoCBmMmZz
OiBBZGQgZnMgcGFyYW1ldGVyIHNwZWNpZmljYXRpb25zIGZvciBtb3VudCBvcHRpb25zCj4+IMKg
wqAgZjJmczogbW92ZSB0aGUgb3B0aW9uIHBhcnNlciBpbnRvIGhhbmRsZV9tb3VudF9vcHQKPj4g
wqDCoCBmMmZzOiBtb3ZlIG9wdGlvbiB2YWxpZGF0aW9uIGludG8gYSBzZXBhcmF0ZSBoZWxwZXIK
Pj4KPj4gMi4gUmVtb3ZlIHRoZSB1c2Ugb2Ygc2Ivc2JpIHN0cnVjdHVyZSBvZiBmMmZzIGZyb20g
YWxsIHRoZQo+PiBwYXJzaW5nIGNvZGUsIGJlY2F1c2Ugd2l0aCB0aGUgbmV3IG1vdW50IEFQSSB0
aGUgcGFyc2luZyBpcwo+PiBnb2luZyB0byBiZSBkb25lIGJlZm9yZSB3ZSBldmVuIGdldCB0aGUg
c3VwZXIgYmxvY2suIEluIHRoaXMKPj4gcGFydCwgd2UgaW50cm9kdWNlIGYyZnNfZnNfY29udGV4
dCB0byBob2xkIHRoZSB0ZW1wb3JhcnkKPj4gb3B0aW9ucyB3aGVuIHBhcnNpbmcuIEZvciB0aGUg
c2ltcGxlIG9wdGlvbnMgY2hlY2ssIGl0IGhhcwo+PiB0byBiZSBkb25lIGR1cmluZyBwYXJzaW5n
IGJ5IHVzaW5nIGYyZnNfZnNfY29udGV4dCBzdHJ1Y3R1cmUuCj4+IEZvciB0aGUgY2hlY2sgd2hp
Y2ggbmVlZHMgc2Ivc2JpLCB3ZSBkbyB0aGlzIGR1cmluZyBzdXBlcgo+PiBibG9jayBmaWxsaW5n
Lgo+Pgo+PiDCoMKgIGYyZnM6IEFsbG93IHNiaSB0byBiZSBOVUxMIGluIGYyZnNfcHJpbnRrCj4+
IMKgwqAgZjJmczogQWRkIGYyZnNfZnNfY29udGV4dCB0byByZWNvcmQgdGhlIG1vdW50IG9wdGlv
bnMKPj4gwqDCoCBmMmZzOiBzZXBhcmF0ZSB0aGUgb3B0aW9ucyBwYXJzaW5nIGFuZCBvcHRpb25z
IGNoZWNraW5nCj4+Cj4+IDMuIFN3aXRjaCB0aGUgZjJmcyB0byB1c2UgdGhlIG5ldyBtb3VudCBB
UEkgZm9yIG1vdW50IGFuZAo+PiByZW1vdW50Lgo+Pgo+PiDCoMKgIGYyZnM6IGludHJvZHVjZSBm
c19jb250ZXh0X29wZXJhdGlvbiBzdHJ1Y3R1cmUKPj4gwqDCoCBmMmZzOiBzd2l0Y2ggdG8gdGhl
IG5ldyBtb3VudCBhcGkKPj4KPj4gNC4gQ2xlYW51cCB0aGUgb2xkIHVudXNlZCBzdHJ1Y3R1cmVz
IGFuZCBoZWxwZXJzLgo+Pgo+PiDCoMKgIGYyZnM6IHJlbW92ZSB1bnVzZWQgc3RydWN0dXJlIGFu
ZCBmdW5jdGlvbnMKPj4KPj4gVGhlcmUgaXMgc3RpbGwgYSBwb3RlbnRpYWwgdG8gZG8gc29tZSBj
bGVhbnVwcyBhbmQgcGVyaGFwcwo+PiByZWZhY3RvcmluZy4gSG93ZXZlciB0aGF0IGNhbiBiZSBk
b25lIGxhdGVyIGFmdGVyIHRoZSBjb252ZXJzaW9uCj4+IHRvIHRoZSBuZXcgbW91bnQgQVBJIHdo
aWNoIGlzIHRoZSBtYWluIHB1cnBvc2Ugb2YgdGhlIHBhdGNoc2V0Lgo+Pgo+PiBbMV0gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjExMDIxMTE0NTA4LjIxNDA3LTEtbGN6ZXJuZXJAcmVk
aGF0LmNvbS8KPj4KPj4gSG9uZ2JvIExpICg5KToKPj4gwqDCoCBmMmZzOiBBZGQgZnMgcGFyYW1l
dGVyIHNwZWNpZmljYXRpb25zIGZvciBtb3VudCBvcHRpb25zCj4+IMKgwqAgZjJmczogbW92ZSB0
aGUgb3B0aW9uIHBhcnNlciBpbnRvIGhhbmRsZV9tb3VudF9vcHQKPj4gwqDCoCBmMmZzOiBtb3Zl
IG9wdGlvbiB2YWxpZGF0aW9uIGludG8gYSBzZXBhcmF0ZSBoZWxwZXIKPj4gwqDCoCBmMmZzOiBB
bGxvdyBzYmkgdG8gYmUgTlVMTCBpbiBmMmZzX3ByaW50awo+PiDCoMKgIGYyZnM6IEFkZCBmMmZz
X2ZzX2NvbnRleHQgdG8gcmVjb3JkIHRoZSBtb3VudCBvcHRpb25zCj4+IMKgwqAgZjJmczogc2Vw
YXJhdGUgdGhlIG9wdGlvbnMgcGFyc2luZyBhbmQgb3B0aW9ucyBjaGVja2luZwo+PiDCoMKgIGYy
ZnM6IGludHJvZHVjZSBmc19jb250ZXh0X29wZXJhdGlvbiBzdHJ1Y3R1cmUKPj4gwqDCoCBmMmZz
OiBzd2l0Y2ggdG8gdGhlIG5ldyBtb3VudCBhcGkKPj4gwqDCoCBmMmZzOiByZW1vdmUgdW51c2Vk
IHN0cnVjdHVyZSBhbmQgZnVuY3Rpb25zCj4+Cj4+IMKgIGZzL2YyZnMvc3VwZXIuYyB8IDIyMTEg
KysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0KPj4gwqAgMSBm
aWxlIGNoYW5nZWQsIDEzNDEgaW5zZXJ0aW9ucygrKSwgODcwIGRlbGV0aW9ucygtKQo+Pgo+IAoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1m
MmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdl
Lm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1m
MmZzLWRldmVsCg==
