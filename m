Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DD37EAD1793
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  9 Jun 2025 06:01:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HnJ6p0TfCyzSbc0y7rvsMsmGTiCb4NfGex5zjuDhbE0=; b=iUUDobDS74rAfWTXCHikwguOD9
	69oMv1oA8dm3yDTAmRciez6yu6CpBVZRCddgKVJEjADcrVLk7+Kje0xJv/WRg726SrUS0jCSfUsZv
	k9jgYGBtymyLh1LT9S6JGtn7tdnBXx+dWv6Z8C/J1MfpJrNv/qwvDE1nAANR4It0Mdvk=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uOTh8-0003uX-08;
	Mon, 09 Jun 2025 04:01:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1uOTh6-0003uQ-Dk
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Jun 2025 04:01:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+OrUcEIJpkzIqPSaSMapcl8mkrvVwMc4GV6bBX9ZsrI=; b=hFV30pFUVHRvaYSKuehaJuZEO2
 S0FHwVH/gKf3rzx94kyccHqO4u1T48AlpCpmEUvGQvE3yqErZAxNmxwdnpWeBoi10KtmID+c2xIUP
 im8JhKlFKEM1LsPs9OMbxjLi31lO0vYiQSDwLYCFqegESzILDjHpiqjQ64hYtOnd3OS8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+OrUcEIJpkzIqPSaSMapcl8mkrvVwMc4GV6bBX9ZsrI=; b=GjPU/aZehsuaEPEAjrSCN06TH2
 D3AbbXyYZswj+iAI7CGiMK02SodPux6X+TPi1Ko67C23OyXCXHM8PbE17drvuv+asWQx9Aw5M21+r
 UwrA1IEBBfgcfjvxVDR6Nus2rbzl3MxO8zXhcy6pZURO8L68RGgsRGRJBsDMHjbaAQtE=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uOTh5-0007QY-R4 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Jun 2025 04:01:08 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 4222168AFE; Mon,  9 Jun 2025 06:00:57 +0200 (CEST)
Date: Mon, 9 Jun 2025 06:00:56 +0200
From: Christoph Hellwig <hch@lst.de>
To: Kundan Kumar <kundanthebest@gmail.com>
Message-ID: <20250609040056.GA26101@lst.de>
References: <CGME20250529113215epcas5p2edd67e7b129621f386be005fdba53378@epcas5p2.samsung.com>
 <20250529111504.89912-1-kundan.kumar@samsung.com>
 <20250602141904.GA21996@lst.de>
 <c029d791-20ca-4f2e-926d-91856ba9d515@samsung.com>
 <20250603132434.GA10865@lst.de>
 <CACzX3AuBVsdEUy09W+L+xRAGLsUD0S9+J2AO8nSguA2nX5d8GQ@mail.gmail.com>
 <20250603140445.GA14351@lst.de> <20250603140513.GB14351@lst.de>
 <CALYkqXoAGHqGkX9WqEE+yiOftcWkap-ZGH3CSAeFk-cPg4q25A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALYkqXoAGHqGkX9WqEE+yiOftcWkap-ZGH3CSAeFk-cPg4q25A@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-2.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Fri, Jun 06, 2025 at 10:34:42AM +0530, Kundan Kumar wrote:
    > Thanks for the suggestion — I agree the default should come from a >
   filesystem-level helper, not a mount option. > > I looked into th [...] 
 
 Content analysis details:   (0.0 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
                             was blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
                              for more information.
                             [213.95.11.211 listed in list.dnswl.org]
X-Headers-End: 1uOTh5-0007QY-R4
Subject: Re: [f2fs-dev] [PATCH 00/13] Parallelizing filesystem writeback
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
Cc: ritesh.list@gmail.com, Anuj gupta <anuj1072538@gmail.com>, jack@suse.cz,
 djwong@kernel.org, amir73il@gmail.com, david@fromorbit.com,
 gfs2@lists.linux.dev, linux-mm@kvack.org, clm@meta.com,
 Christoph Hellwig <hch@lst.de>, dave@stgolabs.net, agruenba@redhat.com,
 miklos@szeredi.hu, Kundan Kumar <kundan.kumar@samsung.com>,
 willy@infradead.org, p.raghav@samsung.com,
 Anuj Gupta/Anuj Gupta <anuj20.g@samsung.com>, linux-nfs@vger.kernel.org,
 da.gomez@samsung.com, viro@zeniv.linux.org.uk, jaegeuk@kernel.org,
 axboe@kernel.dk, brauner@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 mcgrof@kernel.org, anna@kernel.org, gost.dev@samsung.com,
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org, trondmy@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gRnJpLCBKdW4gMDYsIDIwMjUgYXQgMTA6MzQ6NDJBTSArMDUzMCwgS3VuZGFuIEt1bWFyIHdy
b3RlOgo+IFRoYW5rcyBmb3IgdGhlIHN1Z2dlc3Rpb24g4oCUIEkgYWdyZWUgdGhlIGRlZmF1bHQg
c2hvdWxkIGNvbWUgZnJvbSBhCj4gZmlsZXN5c3RlbS1sZXZlbCBoZWxwZXIsIG5vdCBhIG1vdW50
IG9wdGlvbi4KPiAKPiBJIGxvb2tlZCBpbnRvIHRoZSBzeXNmcyBvdmVycmlkZSBpZGVhLCBidXQg
b25lIGNoYWxsZW5nZSBpcyB0aGF0Cj4gbnJfd2JfY3R4IG11c3QgYmUgZmluYWxpemVkIGJlZm9y
ZSBhbnkgd3JpdGVzIG9jY3VyLiBUaGF0IGxlYXZlcyBvbmx5Cj4gYSBuYXJyb3cgd2luZG93IOKA
lCBhZnRlciB0aGUgYmRpIGlzIHJlZ2lzdGVyZWQgYnV0IGJlZm9yZSBhbnkgaW5vZGVzCj4gYXJl
IGRpcnRpZWQg4oCUIHdoZXJlIGNoYW5naW5nIGl0IGlzIHNhZmUuCj4gCj4gVGhpcyBtYWtlcyB0
aGUgc3lzZnMga25vYiBhIGJpdCBmcmFnaWxlIHVubGVzcyB3ZSB0aWdodGx5IGd1YXJkIGl0Cj4g
KGUuZy4sIG1hcmsgaXQgcmVhZC1vbmx5IGFmdGVyIGluaXQpLiBBIG1vdW50IG9wdGlvbiwgZXZl
biBqdXN0IGFzIGFuCj4gb3ZlcnJpZGUsIGZlZWxzIHNpbXBsZXIgYW5kIG1vcmUgcHJlZGljdGFi
bGUsIHNpbmNlIGl04oCZcyBzZXQgYmVmb3JlCj4gdGhlIEZTIGJlY29tZXMgYWN0aXZlLgoKVGhl
IG1vdW50IG9wdGlvbiBoYXMgYSBmZXcgaXNzdWVzOgoKIC0gdGhlIGNvbW1vbiBWRlMgY29kZSBv
bmx5IHN1cHBvcnQgZmxhZ3MsIG5vdCB2YWx1ZSBvcHRpb25zLCBzbyB5b3UnZAogICBoYXZlIHRv
IHdpcmUgdGhpcyB1cCBpbiBldmVyeSBmaWxlIHN5c3RlbQogLSBzb21lIGZpbGUgc3lzdGVtIG1p
Z2h0IG5vdCB3YW50IHRvIGFsbG93IGNoYW5naW5nIGl0CiAtIGNoYW5naW5nIGl0IGF0IHJ1bnRp
bWUgaXMgYWN0dWFsbHl0IHF1aXRlIHVzZWZ1bAoKU28geW91J2xsIG5lZWQgdG8gcXVpZXNjZSB3
cml0ZWJhY2sgb3IgbWF5YmUgZXZlbiBkbyBhIGZ1bGwgZnMgZnJlZXplCndoZW4gY2hhbmdpbmcg
aXQgYSBydW50aW1lLCBidXQgdGhhdCBzZWVtcyBvayBmb3IgYSBjaGFuZ2UgdGhpcyBpbnZhc2l2
ZS4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZv
cmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51
eC1mMmZzLWRldmVsCg==
