Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D19553ECC82
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 16 Aug 2021 03:54:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mFRpm-0001EQ-5S; Mon, 16 Aug 2021 01:54:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1mFRpl-0001EI-OH
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 16 Aug 2021 01:54:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8bT4u3RXzRTl3/5FEWy9djrHW19lsPmELxPtW8iQE0M=; b=Kb6EtSnPhJz+0P7r5Rq+FC3zFP
 tCiacpItzMMKLtpOcG+gvZZA/XBRTl+QhYE2eQHkw4WSHWpF1sB1n1QGu887SfoeYqlIqPuemtDNQ
 gzLrzufYpOguhEufTbYsUddZK+gMYEW0LCh3OM+VFqGPb5sSqigtuExAgG+LJjPAruNM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8bT4u3RXzRTl3/5FEWy9djrHW19lsPmELxPtW8iQE0M=; b=ix/HEuvQ/aVtYM8eHxDqj/tMmr
 kgtUxvrBD6YNFCOj/rTuDDaWRWd6UJbrvnxn+yiUHo2Gr7ttX9xV4vEKj1I9svQK70bZOYX4qg13v
 zgYgVjB/odAIxCxn5ADGx6h3VnvIjV1QpwRSnKzr7nuMlVb9TlnUNNwZNJKRi57wQnbg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mFRpk-0000tm-AM
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 16 Aug 2021 01:54:37 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0D78B6136A;
 Mon, 16 Aug 2021 01:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629078870;
 bh=0LbfQkM7HZueVzmxBHA9CYfz7kOuxLMPYbK6Xw0q8y8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=MAJB6c3us1VKhpzx3Qdh5KFrxV0ozR3opnGdhI8BVYhgcfYc9KGoM3xLzap9OHoZy
 yZoeCLG9AUOdQ36lZeA07li0HQ2x0p4V+OVUWeZToeROGQlfBhFCxiuhvI2opqvdE8
 +RaZd5NOQWAm3SVrrxRqDT7TwA1uBUw64LZ/NevrCaCziVzoFgvY9SaELrkpfNbugJ
 nlNoSGJZw/WWm/RCssCVwsYwIJfvcIBkUPA16pCajoa575Dqh+0owdrB6ABDC3ObzC
 bOY6YMYRLhHJmbMO0kTIFo3cmbLXwYrRhvwNeLZAFHCNgyDalUbdDYwPRy/m3w23qY
 8Nfg4brMigCdg==
To: =?UTF-8?B?5p2O5oms6Z+s?= <frank.li@vivo.com>
References: <AEMABgAWDwhd8*f2P*fotqoY.3.1628906905520.Hmail.frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <a6e1f93c-b45e-019b-273f-b5019052739e@kernel.org>
Date: Mon, 16 Aug 2021 09:54:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <AEMABgAWDwhd8*f2P*fotqoY.3.1628906905520.Hmail.frank.li@vivo.com>
Content-Language: en-US
X-Spam-Score: -1.9 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -2.1 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 1.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mFRpk-0000tm-AM
Subject: Re: [f2fs-dev] [PATCH v5 1/2] f2fs: introduce
 proc/fs/f2fs/<dev>/fsck_stack node
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMS84LzE0IDEwOjA4LCDmnY7miazpn6wgd3JvdGU6Cj4+PiBXZSBjYW4ndCByZW1vdmUg
c3RhY2sgZnJvbSBkZXBvdCwgYXMgd2Ugc3RvcmUgdGhlbSBjb250aWd1b3VzbHkgb25lIGFmdGVy
Cj4+PiBhbm90aGVyIGluIGEgY29udGlndW91cyBtZW1vcnkgYWxsb2NhdGlvbi4KPj4+Cj4+PiBP
ciB3ZSBjYW4gbGltaXQgdGhlIHJlY29yZGVkIHN0YWNrIG51bWJlci4KPj4+Cj4+PiAkIGdyZXAg
LW5yICJTQklfTkVFRF9GU0NLIiBmcy9mMmZzLyAtLWluY2x1ZGU9Ki5jIC0taW5jbHVkZT0qLmgg
fCB3YyAtbAo+Pj4gNTMKPj4+ICQgZ3JlcCAtbnIgImYyZnNfYnVnX29uIiBmcy9mMmZzLyAtLWlu
Y2x1ZGU9Ki5jIC0taW5jbHVkZT0qLmggfCB3YyAtbAo+Pj4gMTM1Cj4+Cj4+IEkgZGlkbid0IGxv
b2sgaW50byBkZXRhaWxzIG9mIHN0YWNrX2RlcG90X3NhdmUoKSwgdHdvIHN0YWNrIGhhbmRsZXMg
ZnJvbSBiZWxvdwo+PiBjYWxsIHBhdGhzIHdpbGwgYmUgdGhlIHNhbWU/Cj4+Cj4+IC0gbW92ZV9k
YXRhX2Jsb2NrCj4+ICAgLSBmMmZzX3dhaXRfb25fcGFnZV93cml0ZWJhY2sKPj4gICAgLSBmMmZz
X2J1Z19vbgo+Pgo+PiAtIHJhX2RhdGFfYmxvY2sKPj4gICAtIGYyZnNfd2FpdF9vbl9wYWdlX3dy
aXRlYmFjawo+PiAgICAtIGYyZnNfYnVnX29uCj4+Cj4+IElmIHRoZXkgaGF2ZSBkaWZmZXJlbnQg
c3RhY2sgaGFuZGxlcywgY29tYmluYXRpb24gbnVtYmVyIG9mCj4+IHNldF9zYmlfZmxhZyhORUVE
X0ZTQ0spL2YyZnNfYnVnX29uIGFuZCB0aGVpciBjYWxsZXJzIHdpbGwgYmUgZmFyIG1vcmUgdGhh
biB0d28KPj4gaHVuZHJlZC4KPj4KPiAKPiBZZXMsIHRoZXNlIHdpbGwgYmUgdHdvIGRpZmZlcmVu
dCBzdGFja3MuIEluIHRoZSBtb3N0IGV4dHJlbWUgY2FzZSwgdGhlcmUgd2lsbCBiZSAxMDAwIChJ
IGd1ZXNzKSBkaWZmZXJlbnQgcGxhY2VzIHRvIHNldCBmc2NrPwoKSXQgbWF5IGJlIGFjY29yZGlu
ZyB0byBjYWxsIHN0YWNrIGhlaWdodCBvZiBlYWNoIGhhbmRsZSByZWNvcmQuCgo+IE9yIHdlIGxp
bWl0IHRoZSBudW1iZXIgb2YgcmVjb3JkZWQgc3RhY2tzIHRvIDEwPwoKWWVzLCBwbGVhc2UgbGlt
aXQgdGhlIHJlY29yZCBudW1iZXIsIG1heWJlIDg/IGFuZCBzdGFjayBoZWlnaHQgY291bGQgYmUg
MTYgYXQKbWF4aW11bT8KClRoYW5rcywKCj4gd2hhdCBkbyB5b3UgdGhpbmsuIFRoZSBzdGFjayBk
ZXBvdCBkZXNpZ24gZG9lcyBub3QgY29uc2lkZXIgcmVtb3ZpbmcgdGhlIHN0YWNrIGZyb20gdGhl
IGRlcG90Lgo+IAo+IE1CUiwKPiBZYW5ndGFvCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGlu
dXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vm
b3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
