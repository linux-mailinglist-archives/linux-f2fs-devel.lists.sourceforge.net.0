Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2BD939CE9
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 23 Jul 2024 10:44:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sWB8U-0008Pg-Bf;
	Tue, 23 Jul 2024 08:44:43 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <youling.tang@linux.dev>) id 1sWB8P-0008P6-4H
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Jul 2024 08:44:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NK2EcdiJh2UsKYq9ETH81uD0C/sipi+a4DjtdiFTXK4=; b=W3krWKjrKg9n6S32VlAIqTUolO
 YsquSgdHSwSeq5PE93+MsFjO8RuMD5ClsF+0U3v299YBPvF9EZ64itJwkJmOMPsNqkHYyy5uYDfU7
 O1hPH6uJKpUBGPrXriDmT5IWLFIUXBsfMcaf5Nwt7h023/5M2ep/8koCtNCb9Ggrl4YQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NK2EcdiJh2UsKYq9ETH81uD0C/sipi+a4DjtdiFTXK4=; b=BqdqvBnPGf74G9W9TzHyqWtSbk
 O75JdHT8YH5QfEImr6edsr2MXp0Rq54IJanLk2Cio/fE6dNYbzeNy8gQPb5WECEFZilEPQp69czQ6
 euXX6nIOJFoI0qp94Pm2FrGLQbihj0BmyS7e2VSA1pvXq1KDgQZF7Tn+Z28+oku4gRzY=;
Received: from out-170.mta0.migadu.com ([91.218.175.170])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sWB8O-0005D0-NC for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Jul 2024 08:44:37 +0000
X-Envelope-To: hch@infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1721724265;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NK2EcdiJh2UsKYq9ETH81uD0C/sipi+a4DjtdiFTXK4=;
 b=LlpWyiuY+PZBgxwLd/IpEVDwLE222BpKHgr1RpB7VbGs6XxatJY6uaj7S1+p1f3sA/rhGF
 LBIt7voECdMcUrmmkXTUog+VjPBiXMj9DKY1ALk9NO54Y7OmFs1PVT72nKDJToeJaRnU9n
 woVBW/ixI37h287XNnk+URuOhlDOLe8=
X-Envelope-To: viro@zeniv.linux.org.uk
X-Envelope-To: brauner@kernel.org
X-Envelope-To: jack@suse.cz
X-Envelope-To: clm@fb.com
X-Envelope-To: josef@toxicpanda.com
X-Envelope-To: dsterba@suse.com
X-Envelope-To: tytso@mit.edu
X-Envelope-To: adilger.kernel@dilger.ca
X-Envelope-To: jaegeuk@kernel.org
X-Envelope-To: chao@kernel.org
X-Envelope-To: linux-fsdevel@vger.kernel.org
X-Envelope-To: linux-btrfs@vger.kernel.org
X-Envelope-To: linux-ext4@vger.kernel.org
X-Envelope-To: linux-f2fs-devel@lists.sourceforge.net
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: mcgrof@kernel.org
X-Envelope-To: linux-modules@vger.kernel.org
Message-ID: <b58e6f36-9a13-488a-85d2-913dd758f89b@linux.dev>
Date: Tue, 23 Jul 2024 16:44:14 +0800
MIME-Version: 1.0
To: Christoph Hellwig <hch@infradead.org>
References: <20240711074859.366088-1-youling.tang@linux.dev>
 <Zo-XMrK6luarjfqZ@infradead.org>
Content-Language: en-US, en-AU
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Youling Tang <youling.tang@linux.dev>
In-Reply-To: <Zo-XMrK6luarjfqZ@infradead.org>
X-Migadu-Flow: FLOW_OUT
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, Christoph On 11/07/2024 16:26, Christoph Hellwig wrote:
 > Can we please stop this boilerplate code an instead our __init/__exit >
 sections to supper multiple entires per module. This should be mostly >
 trivial, [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linux.dev]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [91.218.175.170 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [91.218.175.170 listed in bl.score.senderscore.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [91.218.175.170 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1sWB8O-0005D0-NC
Subject: Re: [f2fs-dev] [PATCH 0/3] Add {init,
 exit}_sequence_fs() helper function
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
Cc: Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 Josef Bacik <josef@toxicpanda.com>, linux-f2fs-devel@lists.sourceforge.net,
 Chris Mason <clm@fb.com>, Luis Chamberlain <mcgrof@kernel.org>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>,
 David Sterba <dsterba@suse.com>, tytso@mit.edu, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org, linux-modules@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGksIENocmlzdG9waAoKT24gMTEvMDcvMjAyNCAxNjoyNiwgQ2hyaXN0b3BoIEhlbGx3aWcgd3Jv
dGU6Cj4gQ2FuIHdlIHBsZWFzZSBzdG9wIHRoaXMgYm9pbGVycGxhdGUgY29kZSBhbiBpbnN0ZWFk
IG91ciBfX2luaXQvX19leGl0Cj4gc2VjdGlvbnMgdG8gc3VwcGVyIG11bHRpcGxlIGVudGlyZXMg
cGVyIG1vZHVsZS4gIFRoaXMgc2hvdWxkIGJlIG1vc3RseQo+IHRyaXZpYWwsIGV4Y2VwdCB0aGF0
IHdlJ2QgcHJvYmFibHkgd2FudCBhIHNpbmdsZSBtYWNybyB0aGF0IGhhcyB0aGUKPiBpbml0IGFu
ZCBleGl0IGNhbGxzIHNvIHRoYXQgdGhlIG9yZGVyIGluIHRoZSBzZWN0aW9uIGlzIHRoZSBzYW1l
IGFuZAo+IHRoZSB1bnJvbGwgb24gZmFpbHVyZSBjYW4gd2FsayBiYWNrIGZvcm0gdGhlIGdpdmVu
IG9mZnNldC4gZS5nLgo+IHNvbWV0aGluZyBsaWtlOgo+Cj4gbW9kdWxlX3N1YmluaXQoZm9vX2Jh
cl9pbml0LCBmb29fYmFyX2V4aXQpOwo+IG1vZHVsZV9zdWJpbml0KGZvb19iYXIyX2luaXQsIGZv
b19iYXIyX2V4aXQpOwo+Cj4KVGhhbmtzIGZvciB5b3VyIHN1Z2dlc3Rpb24swqAgSSByZS1pbXBs
ZW1lbnRlZCBpdCB1c2luZyBzZWN0aW9uIG1vZGUsCmFuZCB0aGUgbmV3IHBhdGNoIHNldCBbMV0g
aGFzIGJlZW4gc2VudC4KClsxXTogCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI0MDcy
MzA4MzIzOS40MTUzMy0xLXlvdWxpbmcudGFuZ0BsaW51eC5kZXYvVC8jbWQ4MWFhZWZlMGMxZmVm
NzBhMDU5MmQxNTgwY2JiYjEwZWM5OTg5YjAKClRoYW5rcywKWW91bGluZy4KCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1h
aWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczov
L2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
